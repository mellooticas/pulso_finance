"""
PULSO Finance - Analisador de Contas Futuras e Valores Pendentes
Identifica lançamentos futuros, parcelas em aberto, e corrige cálculos
"""

import pandas as pd
import json
from datetime import datetime, timedelta
from collections import defaultdict

class AnalisadorContasFuturas:
    def __init__(self, csv_path: str):
        self.csv_path = csv_path
        self.df = None
        self.hoje = datetime.now().date()
        self.resultado = {}
        
    def carregar_dados(self):
        """Carrega e prepara dados com foco em datas"""
        print("🔍 Carregando dados para análise temporal...")
        
        self.df = pd.read_csv(self.csv_path, sep=';', encoding='utf-8')
        
        # Converter datas
        self.df['data_esperada'] = pd.to_datetime(self.df['data_esperada'], errors='coerce')
        self.df['data_realizada'] = pd.to_datetime(self.df['data_realizada'], errors='coerce')
        
        # Limpar valores
        self.df['valor_receber'] = pd.to_numeric(self.df['valor_receber'], errors='coerce').fillna(0)
        self.df['valor_recebido'] = pd.to_numeric(self.df['valor_recebido'], errors='coerce').fillna(0)
        self.df['valor_pagar'] = pd.to_numeric(self.df['valor_pagar'], errors='coerce').fillna(0)
        self.df['valor_pago'] = pd.to_numeric(self.df['valor_pago'], errors='coerce').fillna(0)
        
        print(f"✅ {len(self.df)} registros carregados")
        print(f"📅 Período: {self.df['data_esperada'].min()} até {self.df['data_esperada'].max()}")
        
    def analisar_status_pagamentos(self):
        """Analisa status dos pagamentos (Realizado vs Pendente)"""
        print("\n💰 Analisando Status dos Pagamentos...")
        
        # Criar coluna de status baseada nos valores
        self.df['status_real'] = 'Indefinido'
        
        # Contas a receber
        mask_receber = self.df['valor_receber'] > 0
        self.df.loc[mask_receber & (self.df['valor_recebido'] > 0), 'status_real'] = 'Recebido'
        self.df.loc[mask_receber & (self.df['valor_recebido'] == 0), 'status_real'] = 'A Receber'
        
        # Contas a pagar  
        mask_pagar = self.df['valor_pagar'] > 0
        self.df.loc[mask_pagar & (self.df['valor_pago'] > 0), 'status_real'] = 'Pago'
        self.df.loc[mask_pagar & (self.df['valor_pago'] == 0), 'status_real'] = 'A Pagar'
        
        # Estatísticas de status
        status_counts = self.df['status_real'].value_counts()
        
        print("📊 Status dos lançamentos:")
        for status, count in status_counts.items():
            print(f"   - {status}: {count:,} registros")
        
        self.resultado['status_geral'] = status_counts.to_dict()
        
    def identificar_contas_futuras(self):
        """Identifica contas com vencimento futuro"""
        print("\n🔮 Identificando Contas Futuras...")
        
        # Contas futuras = data esperada > hoje
        futuras = self.df[self.df['data_esperada'].dt.date > self.hoje]
        
        # Separar por tipo
        futuras_receber = futuras[futuras['valor_receber'] > 0]
        futuras_pagar = futuras[futuras['valor_pagar'] > 0]
        
        # Calcular totais
        total_receber_futuro = futuras_receber['valor_receber'].sum()
        total_pagar_futuro = futuras_pagar['valor_pagar'].sum()
        
        print(f"💵 Contas a RECEBER futuras:")
        print(f"   - Quantidade: {len(futuras_receber):,} lançamentos")
        print(f"   - Valor total: R$ {total_receber_futuro:,.2f}")
        
        print(f"💸 Contas a PAGAR futuras:")
        print(f"   - Quantidade: {len(futuras_pagar):,} lançamentos")
        print(f"   - Valor total: R$ {total_pagar_futuro:,.2f}")
        
        print(f"⚖️ SALDO futuro: R$ {(total_receber_futuro - total_pagar_futuro):,.2f}")
        
        # Agrupar por mês futuro
        futuras_por_mes = {}
        
        for _, row in futuras.iterrows():
            mes_ano = row['data_esperada'].strftime('%Y-%m')
            if mes_ano not in futuras_por_mes:
                futuras_por_mes[mes_ano] = {'receber': 0, 'pagar': 0, 'count': 0}
            
            futuras_por_mes[mes_ano]['receber'] += row['valor_receber']
            futuras_por_mes[mes_ano]['pagar'] += row['valor_pagar']
            futuras_por_mes[mes_ano]['count'] += 1
        
        print("\n📅 Previsão por mês:")
        for mes, dados in sorted(futuras_por_mes.items()):
            saldo_mes = dados['receber'] - dados['pagar']
            print(f"   {mes}: R$ {saldo_mes:,.2f} ({dados['count']} lançamentos)")
        
        self.resultado['contas_futuras'] = {
            'total_receber': float(total_receber_futuro),
            'total_pagar': float(total_pagar_futuro),
            'saldo_futuro': float(total_receber_futuro - total_pagar_futuro),
            'por_mes': {k: {
                'receber': float(v['receber']),
                'pagar': float(v['pagar']),
                'saldo': float(v['receber'] - v['pagar']),
                'count': v['count']
            } for k, v in futuras_por_mes.items()}
        }
        
    def analisar_parcelas_pendentes(self):
        """Analisa parcelas que ainda não foram pagas"""
        print("\n📋 Analisando Parcelas Pendentes...")
        
        # Identificar lançamentos parcelados
        parcelados = self.df[self.df['sequencia'].str.contains(' de ', na=False)]
        
        # Separar realizados vs pendentes
        pendentes_receber = parcelados[
            (parcelados['valor_receber'] > 0) & 
            (parcelados['valor_recebido'] == 0)
        ]
        
        pendentes_pagar = parcelados[
            (parcelados['valor_pagar'] > 0) & 
            (parcelados['valor_pago'] == 0)
        ]
        
        print(f"📄 Parcelas PENDENTES a receber: {len(pendentes_receber):,} ({pendentes_receber['valor_receber'].sum():,.2f})")
        print(f"📄 Parcelas PENDENTES a pagar: {len(pendentes_pagar):,} ({pendentes_pagar['valor_pagar'].sum():,.2f})")
        
        # Análise por tipo de pagamento
        if len(pendentes_receber) > 0:
            print("\n💳 Pendências por meio de pagamento:")
            pendentes_por_meio = pendentes_receber.groupby('meio_pagamento')['valor_receber'].sum().sort_values(ascending=False)
            for meio, valor in pendentes_por_meio.head(5).items():
                print(f"   - {meio}: R$ {valor:,.2f}")
        
        self.resultado['parcelas_pendentes'] = {
            'receber': {
                'quantidade': len(pendentes_receber),
                'valor_total': float(pendentes_receber['valor_receber'].sum())
            },
            'pagar': {
                'quantidade': len(pendentes_pagar),
                'valor_total': float(pendentes_pagar['valor_pagar'].sum())
            }
        }
        
    def calcular_fluxo_real_vs_projetado(self):
        """Calcula diferença entre fluxo realizado e projetado"""
        print("\n📈 Analisando Fluxo Real vs Projetado...")
        
        # Dados históricos (até hoje)
        historico = self.df[self.df['data_esperada'].dt.date <= self.hoje]
        
        # Receitas
        receitas_esperadas = historico['valor_receber'].sum()
        receitas_realizadas = historico['valor_recebido'].sum()
        
        # Despesas  
        despesas_esperadas = historico['valor_pagar'].sum()
        despesas_realizadas = historico['valor_pago'].sum()
        
        # Diferenças
        diferenca_receitas = receitas_realizadas - receitas_esperadas
        diferenca_despesas = despesas_realizadas - despesas_esperadas
        
        print(f"💰 RECEITAS:")
        print(f"   - Esperadas: R$ {receitas_esperadas:,.2f}")
        print(f"   - Realizadas: R$ {receitas_realizadas:,.2f}")
        print(f"   - Diferença: R$ {diferenca_receitas:,.2f}")
        
        print(f"💸 DESPESAS:")
        print(f"   - Esperadas: R$ {despesas_esperadas:,.2f}")
        print(f"   - Realizadas: R$ {despesas_realizadas:,.2f}")
        print(f"   - Diferença: R$ {diferenca_despesas:,.2f}")
        
        # Taxa de realização
        taxa_receitas = (receitas_realizadas / receitas_esperadas * 100) if receitas_esperadas > 0 else 0
        taxa_despesas = (despesas_realizadas / despesas_esperadas * 100) if despesas_esperadas > 0 else 0
        
        print(f"📊 TAXA DE REALIZAÇÃO:")
        print(f"   - Receitas: {taxa_receitas:.1f}%")
        print(f"   - Despesas: {taxa_despesas:.1f}%")
        
        self.resultado['fluxo_realizacao'] = {
            'receitas': {
                'esperadas': float(receitas_esperadas),
                'realizadas': float(receitas_realizadas),
                'diferenca': float(diferenca_receitas),
                'taxa_realizacao': float(taxa_receitas)
            },
            'despesas': {
                'esperadas': float(despesas_esperadas),
                'realizadas': float(despesas_realizadas),
                'diferenca': float(diferenca_despesas),
                'taxa_realizacao': float(taxa_despesas)
            }
        }
        
    def identificar_problemas_criticos(self):
        """Identifica problemas críticos nos dados"""
        print("\n🚨 Identificando Problemas Críticos...")
        
        problemas = []
        
        # 1. Lançamentos com data esperada != data realizada
        divergentes = self.df[
            (self.df['data_esperada'] != self.df['data_realizada']) &
            (self.df['data_realizada'].notna())
        ]
        if len(divergentes) > 0:
            problemas.append(f"📅 {len(divergentes):,} lançamentos com data divergente")
        
        # 2. Valores receber != valores recebidos 
        valores_divergentes = self.df[
            (self.df['valor_receber'] != self.df['valor_recebido']) &
            (self.df['valor_recebido'] > 0)
        ]
        if len(valores_divergentes) > 0:
            problemas.append(f"💰 {len(valores_divergentes):,} lançamentos com valores divergentes")
        
        # 3. Lançamentos muito antigos não realizados
        antigos_pendentes = self.df[
            (self.df['data_esperada'].dt.date < self.hoje - timedelta(days=90)) &
            (self.df['status_real'].isin(['A Receber', 'A Pagar']))
        ]
        if len(antigos_pendentes) > 0:
            problemas.append(f"⏰ {len(antigos_pendentes):,} lançamentos antigos ainda pendentes")
        
        # 4. Valores zerados suspeitos
        zeros_suspeitos = self.df[
            ((self.df['valor_receber'] > 0) & (self.df['valor_recebido'] == 0)) |
            ((self.df['valor_pagar'] > 0) & (self.df['valor_pago'] == 0))
        ]
        if len(zeros_suspeitos) > 0:
            problemas.append(f"❓ {len(zeros_suspeitos):,} lançamentos com valores zerados suspeitos")
        
        print("🔍 Problemas identificados:")
        for problema in problemas:
            print(f"   - {problema}")
        
        if not problemas:
            print("   ✅ Nenhum problema crítico identificado!")
        
        self.resultado['problemas_criticos'] = problemas
        
    def gerar_recomendacoes(self):
        """Gera recomendações para correção"""
        print("\n💡 Gerando Recomendações...")
        
        recomendacoes = []
        
        # Baseado nas análises
        if self.resultado['contas_futuras']['saldo_futuro'] < 0:
            recomendacoes.append("🚨 CRÍTICO: Saldo futuro negativo - revisar estratégia de cobrança")
        
        if self.resultado['parcelas_pendentes']['receber']['valor_total'] > 0:
            recomendacoes.append("📞 Implementar sistema de cobrança para parcelas pendentes")
        
        if self.resultado['fluxo_realizacao']['receitas']['taxa_realizacao'] < 90:
            recomendacoes.append("📊 Taxa de realização de receitas baixa - melhorar controles")
        
        # Recomendações técnicas
        recomendacoes.extend([
            "🔄 Implementar separação clara entre 'Competência' e 'Caixa'",
            "📋 Criar view de 'Contas a Pagar/Receber' separada",
            "📈 Dashboard com projeção de fluxo futuro",
            "⚠️ Alertas para vencimentos próximos",
            "🎯 KPIs de realização vs projetado"
        ])
        
        print("📋 Recomendações:")
        for rec in recomendacoes:
            print(f"   {rec}")
        
        self.resultado['recomendacoes'] = recomendacoes
        
    def exportar_analise(self, output_path: str):
        """Exporta análise completa"""
        print(f"\n💾 Exportando análise para {output_path}...")
        
        self.resultado['metadata'] = {
            'data_analise': datetime.now().isoformat(),
            'total_registros': len(self.df),
            'data_base_analise': self.hoje.isoformat()
        }
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(self.resultado, f, indent=2, ensure_ascii=False)
        
        print("✅ Análise exportada!")
        
    def executar_analise_completa(self):
        """Executa análise completa de contas futuras"""
        print("🚀 Análise Completa de Contas Futuras e Valores Pendentes")
        print("=" * 70)
        
        self.carregar_dados()
        self.analisar_status_pagamentos()
        self.identificar_contas_futuras()
        self.analisar_parcelas_pendentes()
        self.calcular_fluxo_real_vs_projetado()
        self.identificar_problemas_criticos()
        self.gerar_recomendacoes()
        
        print("\n" + "=" * 70)
        print("✅ Análise completa finalizada!")
        
        return self.resultado

if __name__ == "__main__":
    csv_file = "d:/projetos/pulso_finance/data/base/yampa_consolidated_completo.csv"
    output_file = "d:/projetos/pulso_finance/data/analysis/contas_futuras_analysis.json"
    
    analisador = AnalisadorContasFuturas(csv_file)
    resultados = analisador.executar_analise_completa()
    analisador.exportar_analise(output_file)
    
    print(f"\n📊 Resultados salvos em: {output_file}")
    print("\n🎯 Ação necessária: Corrigir hooks e cálculos para incluir contas futuras!")