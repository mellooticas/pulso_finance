"""
PULSO Finance - Motor de Inteligência Financeira Enterprise
Sistema que MASTIGA os dados reais e entrega DECISÕES, não números bonitos
"""

from datetime import datetime, timedelta
from decimal import Decimal
from typing import Dict, List, Tuple
import json

class FinancialIntelligenceEngine:
    """
    Cérebro financeiro que processa TODOS os dados e retorna AÇÕES
    """
    
    def __init__(self, supabase_client):
        self.supabase = supabase_client
        self.hoje = datetime.now().date()
        
    def calcular_juros_atraso(self, valor: Decimal, dias_atraso: int, 
                              taxa_juros_mes: Decimal = Decimal('0.01')) -> Dict:
        """
        Calcula juros e multa de atraso (padrão mercado: 1% ao mês + 2% multa)
        """
        if dias_atraso <= 0:
            return {'valor_original': valor, 'juros': 0, 'multa': 0, 'total': valor}
        
        # Multa de 2% sobre o valor
        multa = valor * Decimal('0.02')
        
        # Juros de 1% ao mês proporcional aos dias
        juros = valor * taxa_juros_mes * (Decimal(dias_atraso) / Decimal('30'))
        
        total = valor + multa + juros
        
        return {
            'valor_original': float(valor),
            'dias_atraso': dias_atraso,
            'multa': float(multa),
            'juros': float(juros),
            'total': float(total),
            'percentual_acrescimo': float((total - valor) / valor * 100)
        }
    
    def processar_contas_a_pagar(self) -> Dict:
        """
        PROCESSA TODAS as contas a pagar e retorna O QUE FAZER HOJE
        """
        print("💰 Processando contas a pagar...")
        
        # Buscar TODAS as parcelas a pagar pendentes
        response = self.supabase.table('parcelas')\
            .select('''
                *,
                lancamento:lancamentos!inner(
                    descricao,
                    fornecedor:fornecedores(nome),
                    loja:lojas(nome),
                    plano_conta:planos_contas(nome)
                )
            ''')\
            .eq('tipo', 'pagar')\
            .in_('status', ['pendente', 'vencido'])\
            .execute()
        
        parcelas = response.data
        
        # Classificar por urgência
        vencidas = []
        vence_hoje = []
        vence_7_dias = []
        vence_30_dias = []
        vence_90_dias = []
        futuras = []
        
        total_vencido = Decimal('0')
        total_juros_acumulado = Decimal('0')
        
        for parcela in parcelas:
            vencimento = datetime.strptime(parcela['data_vencimento'], '%Y-%m-%d').date()
            dias_para_vencer = (vencimento - self.hoje).days
            valor = Decimal(str(parcela['valor_parcela']))
            
            info = {
                'id': parcela['id'],
                'descricao': parcela['lancamento']['descricao'],
                'fornecedor': parcela['lancamento']['fornecedor']['nome'] if parcela['lancamento']['fornecedor'] else 'N/A',
                'loja': parcela['lancamento']['loja']['nome'],
                'valor_original': float(valor),
                'vencimento': parcela['data_vencimento'],
                'dias_para_vencer': dias_para_vencer,
                'categoria': parcela['lancamento']['plano_conta']['nome'] if parcela['lancamento']['plano_conta'] else 'N/A'
            }
            
            # VENCIDAS - CALCULAR JUROS REAL
            if dias_para_vencer < 0:
                dias_atraso = abs(dias_para_vencer)
                calculo_juros = self.calcular_juros_atraso(valor, dias_atraso)
                info.update(calculo_juros)
                info['prioridade'] = 'CRÍTICA'
                info['acao'] = f'PAGAR URGENTE! Evitar mais {calculo_juros["juros"]:.2f} de juros'
                vencidas.append(info)
                total_vencido += Decimal(str(calculo_juros['total']))
                total_juros_acumulado += Decimal(str(calculo_juros['juros']))
                
            # VENCE HOJE
            elif dias_para_vencer == 0:
                info['prioridade'] = 'ALTA'
                info['acao'] = 'Pagar HOJE para evitar juros'
                vence_hoje.append(info)
                
            # PRÓXIMOS 7 DIAS
            elif 0 < dias_para_vencer <= 7:
                info['prioridade'] = 'MÉDIA'
                info['acao'] = f'Programar pagamento ({dias_para_vencer} dias)'
                vence_7_dias.append(info)
                
            # PRÓXIMOS 30 DIAS
            elif 7 < dias_para_vencer <= 30:
                info['prioridade'] = 'BAIXA'
                info['acao'] = 'Monitorar'
                vence_30_dias.append(info)
                
            # PRÓXIMOS 90 DIAS
            elif 30 < dias_para_vencer <= 90:
                info['prioridade'] = 'PLANEJAMENTO'
                info['acao'] = 'Reservar recursos'
                vence_90_dias.append(info)
                
            else:
                futuras.append(info)
        
        # ORDENAR por valor (maior primeiro = mais crítico)
        vencidas.sort(key=lambda x: x.get('total', 0), reverse=True)
        vence_hoje.sort(key=lambda x: x['valor_original'], reverse=True)
        
        return {
            'resumo': {
                'total_vencido': float(total_vencido),
                'total_juros_acumulado': float(total_juros_acumulado),
                'total_vence_hoje': sum(p['valor_original'] for p in vence_hoje),
                'total_vence_7_dias': sum(p['valor_original'] for p in vence_7_dias),
                'total_vence_30_dias': sum(p['valor_original'] for p in vence_30_dias),
                'num_vencidas': len(vencidas),
                'num_vence_hoje': len(vence_hoje),
                'num_vence_7_dias': len(vence_7_dias)
            },
            'acoes_urgentes': {
                'vencidas': vencidas[:10],  # Top 10 mais críticas
                'vence_hoje': vence_hoje[:10]
            },
            'planejamento': {
                'proximos_7_dias': vence_7_dias,
                'proximos_30_dias': vence_30_dias,
                'proximos_90_dias': vence_90_dias
            },
            'detalhes_completos': {
                'vencidas': vencidas,
                'vence_hoje': vence_hoje,
                'vence_7_dias': vence_7_dias,
                'vence_30_dias': vence_30_dias,
                'vence_90_dias': vence_90_dias,
                'futuras': futuras
            }
        }
    
    def processar_contas_a_receber(self) -> Dict:
        """
        Mesma lógica para contas a RECEBER - quem está me devendo?
        """
        print("💵 Processando contas a receber...")
        
        response = self.supabase.table('parcelas')\
            .select('''
                *,
                lancamento:lancamentos!inner(
                    descricao,
                    loja:lojas(nome)
                )
            ''')\
            .eq('tipo', 'receber')\
            .in_('status', ['pendente', 'vencido'])\
            .execute()
        
        parcelas = response.data
        
        vencidas = []
        vence_hoje = []
        proximos_dias = []
        
        for parcela in parcelas:
            vencimento = datetime.strptime(parcela['data_vencimento'], '%Y-%m-%d').date()
            dias_atraso = (self.hoje - vencimento).days
            
            info = {
                'id': parcela['id'],
                'descricao': parcela['lancamento']['descricao'],
                'loja': parcela['lancamento']['loja']['nome'],
                'valor': parcela['valor_parcela'],
                'vencimento': parcela['data_vencimento'],
                'dias_atraso': dias_atraso if dias_atraso > 0 else 0
            }
            
            if dias_atraso > 0:
                info['acao'] = f'COBRAR! {dias_atraso} dias atrasado'
                vencidas.append(info)
            elif dias_atraso == 0:
                info['acao'] = 'Confirmar recebimento hoje'
                vence_hoje.append(info)
            else:
                proximos_dias.append(info)
        
        return {
            'resumo': {
                'total_vencido': sum(p['valor'] for p in vencidas),
                'total_vence_hoje': sum(p['valor'] for p in vence_hoje),
                'num_vencidas': len(vencidas)
            },
            'acoes': {
                'cobrar_urgente': vencidas[:10],
                'receber_hoje': vence_hoje,
                'proximos': proximos_dias[:20]
            }
        }
    
    def analise_por_centro_custo(self) -> Dict:
        """
        Lucro/Prejuízo por LOJA, FORNECEDOR, CATEGORIA
        """
        print("📊 Analisando por centro de custo...")
        
        # Buscar todos lançamentos do mês atual
        mes_atual = self.hoje.strftime('%Y-%m')
        
        response = self.supabase.table('lancamentos')\
            .select('''
                tipo,
                valor_total,
                loja:lojas(id, nome),
                fornecedor:fornecedores(id, nome, categoria),
                plano_conta:planos_contas(codigo, nome)
            ''')\
            .gte('competencia', f'{mes_atual}-01')\
            .lte('competencia', f'{mes_atual}-31')\
            .execute()
        
        dados = response.data
        
        # Análise por LOJA
        por_loja = {}
        for lanc in dados:
            loja = lanc['loja']['nome']
            if loja not in por_loja:
                por_loja[loja] = {'receitas': 0, 'despesas': 0, 'resultado': 0}
            
            if lanc['tipo'] == 'receber':
                por_loja[loja]['receitas'] += lanc['valor_total']
            else:
                por_loja[loja]['despesas'] += lanc['valor_total']
            
            por_loja[loja]['resultado'] = por_loja[loja]['receitas'] - por_loja[loja]['despesas']
        
        # Análise por FORNECEDOR
        por_fornecedor = {}
        for lanc in dados:
            if lanc['fornecedor']:
                forn = lanc['fornecedor']['nome']
                if forn not in por_fornecedor:
                    por_fornecedor[forn] = {'total_gasto': 0, 'categoria': lanc['fornecedor']['categoria']}
                
                if lanc['tipo'] == 'pagar':
                    por_fornecedor[forn]['total_gasto'] += lanc['valor_total']
        
        # Ordenar por resultado
        lojas_ranking = sorted(por_loja.items(), key=lambda x: x[1]['resultado'], reverse=True)
        fornecedores_ranking = sorted(por_fornecedor.items(), key=lambda x: x[1]['total_gasto'], reverse=True)
        
        return {
            'por_loja': {
                'detalhes': por_loja,
                'ranking': [{'loja': k, **v} for k, v in lojas_ranking],
                'melhor': lojas_ranking[0] if lojas_ranking else None,
                'pior': lojas_ranking[-1] if lojas_ranking else None
            },
            'por_fornecedor': {
                'detalhes': por_fornecedor,
                'top_10_gastos': [{'fornecedor': k, **v} for k, v in fornecedores_ranking[:10]]
            }
        }
    
    def indicadores_enterprise(self) -> Dict:
        """
        KPIs que REALMENTE importam: DSO, DPO, Ciclo de Caixa, EBITDA
        """
        print("⚡ Calculando indicadores enterprise...")
        
        # DSO - Days Sales Outstanding (prazo médio de recebimento)
        # DPO - Days Payable Outstanding (prazo médio de pagamento)
        # Ciclo de Caixa = DSO - DPO
        
        # Buscar parcelas dos últimos 90 dias
        data_90_dias = (self.hoje - timedelta(days=90)).isoformat()
        
        # Recebimentos
        recebidas = self.supabase.table('parcelas')\
            .select('data_vencimento, data_pagamento, valor_parcela')\
            .eq('tipo', 'receber')\
            .not_.is_('data_pagamento', 'null')\
            .gte('data_pagamento', data_90_dias)\
            .execute()
        
        # Pagamentos
        pagas = self.supabase.table('parcelas')\
            .select('data_vencimento, data_pagamento, valor_parcela')\
            .eq('tipo', 'pagar')\
            .not_.is_('data_pagamento', 'null')\
            .gte('data_pagamento', data_90_dias)\
            .execute()
        
        # Calcular DSO
        dias_recebimento = []
        for r in recebidas.data:
            venc = datetime.strptime(r['data_vencimento'], '%Y-%m-%d').date()
            pag = datetime.strptime(r['data_pagamento'], '%Y-%m-%d').date()
            dias_recebimento.append((pag - venc).days)
        
        dso = sum(dias_recebimento) / len(dias_recebimento) if dias_recebimento else 0
        
        # Calcular DPO
        dias_pagamento = []
        for p in pagas.data:
            venc = datetime.strptime(p['data_vencimento'], '%Y-%m-%d').date()
            pag = datetime.strptime(p['data_pagamento'], '%Y-%m-%d').date()
            dias_pagamento.append((pag - venc).days)
        
        dpo = sum(dias_pagamento) / len(dias_pagamento) if dias_pagamento else 0
        
        ciclo_caixa = dso - dpo
        
        return {
            'dso': round(dso, 1),
            'dpo': round(dpo, 1),
            'ciclo_caixa': round(ciclo_caixa, 1),
            'interpretacao': {
                'dso': f'Recebemos em média {dso:.0f} dias após o vencimento',
                'dpo': f'Pagamos em média {dpo:.0f} dias após o vencimento',
                'ciclo_caixa': f'Ciclo de caixa de {ciclo_caixa:.0f} dias' + 
                              (' (BOM - pagamos antes de receber)' if ciclo_caixa < 0 else ' (RUIM - recebemos antes de pagar)')
            }
        }
    
    def gerar_decisoes_hoje(self) -> Dict:
        """
        A FUNÇÃO PRINCIPAL: O que fazer HOJE?
        """
        print("\n🎯 Gerando decisões para HOJE...")
        print("=" * 70)
        
        contas_pagar = self.processar_contas_a_pagar()
        contas_receber = self.processar_contas_a_receber()
        centros_custo = self.analise_por_centro_custo()
        indicadores = self.indicadores_enterprise()
        
        # Montar DASHBOARD DE DECISÃO
        decisoes = {
            'data_analise': self.hoje.isoformat(),
            'alertas_criticos': [],
            'acoes_hoje': [],
            'planejamento_semana': [],
            'insights': []
        }
        
        # ALERTAS CRÍTICOS
        if contas_pagar['resumo']['num_vencidas'] > 0:
            decisoes['alertas_criticos'].append({
                'tipo': 'CONTAS_VENCIDAS',
                'severidade': 'CRÍTICA',
                'mensagem': f"🚨 {contas_pagar['resumo']['num_vencidas']} contas VENCIDAS com R$ {contas_pagar['resumo']['total_juros_acumulado']:.2f} de JUROS acumulados!",
                'valor': contas_pagar['resumo']['total_vencido'],
                'acao': 'Pagar URGENTEMENTE as top 10 maiores'
            })
        
        # AÇÕES DE HOJE
        if contas_pagar['resumo']['num_vence_hoje'] > 0:
            decisoes['acoes_hoje'].append({
                'tipo': 'PAGAMENTOS_HOJE',
                'mensagem': f"💰 {contas_pagar['resumo']['num_vence_hoje']} contas vencem HOJE - Total: R$ {contas_pagar['resumo']['total_vence_hoje']:.2f}",
                'detalhes': contas_pagar['acoes_urgentes']['vence_hoje']
            })
        
        if contas_receber['resumo']['num_vencidas'] > 0:
            decisoes['acoes_hoje'].append({
                'tipo': 'COBRANCAS_VENCIDAS',
                'mensagem': f"💵 Cobrar R$ {contas_receber['resumo']['total_vencido']:.2f} de clientes inadimplentes",
                'detalhes': contas_receber['acoes']['cobrar_urgente']
            })
        
        # INSIGHTS
        if centros_custo['por_loja']['melhor']:
            loja, dados = centros_custo['por_loja']['melhor']
            decisoes['insights'].append({
                'tipo': 'PERFORMANCE_LOJA',
                'mensagem': f"⭐ {loja} é a loja MAIS RENTÁVEL com R$ {dados['resultado']:.2f} de lucro no mês"
            })
        
        if indicadores['ciclo_caixa'] > 0:
            decisoes['insights'].append({
                'tipo': 'CICLO_CAIXA',
                'mensagem': f"⚠️ Ciclo de caixa de {indicadores['ciclo_caixa']} dias está NEGATIVO para a empresa!",
                'acao': 'Negociar prazos maiores com fornecedores ou reduzir prazos de clientes'
            })
        
        # Estrutura completa
        decisoes['dados_completos'] = {
            'contas_a_pagar': contas_pagar,
            'contas_a_receber': contas_receber,
            'analise_centros_custo': centros_custo,
            'indicadores_enterprise': indicadores
        }
        
        return decisoes

# Função de conveniência para executar
def executar_analise_enterprise(supabase_url: str, supabase_key: str):
    """
    Executa análise completa e salva resultados
    """
    from supabase import create_client
    
    supabase = create_client(supabase_url, supabase_key)
    engine = FinancialIntelligenceEngine(supabase)
    
    decisoes = engine.gerar_decisoes_hoje()
    
    # Salvar resultado
    output_file = 'data/analysis/decisoes_hoje.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(decisoes, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Análise completa salva em: {output_file}")
    
    # Imprimir resumo
    print("\n" + "=" * 70)
    print("📋 RESUMO EXECUTIVO")
    print("=" * 70)
    
    if decisoes['alertas_criticos']:
        print("\n🚨 ALERTAS CRÍTICOS:")
        for alerta in decisoes['alertas_criticos']:
            print(f"   {alerta['mensagem']}")
    
    if decisoes['acoes_hoje']:
        print("\n💼 AÇÕES PARA HOJE:")
        for acao in decisoes['acoes_hoje']:
            print(f"   {acao['mensagem']}")
    
    if decisoes['insights']:
        print("\n💡 INSIGHTS:")
        for insight in decisoes['insights']:
            print(f"   {insight['mensagem']}")
    
    return decisoes

if __name__ == "__main__":
    # Configurar com suas credenciais
    SUPABASE_URL = "https://your-project.supabase.co"
    SUPABASE_KEY = "your-service-key"
    
    if SUPABASE_URL == "https://your-project.supabase.co":
        print("⚠️  Configure as credenciais do Supabase primeiro!")
    else:
        executar_analise_enterprise(SUPABASE_URL, SUPABASE_KEY)