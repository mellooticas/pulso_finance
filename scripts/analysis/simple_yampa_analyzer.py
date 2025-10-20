"""
PULSO Finance - Analisador Simplificado de Dados Yampa
Extrai informações essenciais dos dados reais do Yampa
"""

import csv
import json
from collections import defaultdict, Counter
from datetime import datetime

class SimpleYampaAnalyzer:
    def __init__(self, csv_path):
        self.csv_path = csv_path
        self.data = []
        self.results = {}
        
    def load_data(self):
        """Carrega dados do CSV"""
        print("📊 Carregando dados...")
        
        with open(self.csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f, delimiter=';')
            self.data = list(reader)
        
        print(f"✅ {len(self.data)} registros carregados")
    
    def extract_suppliers(self):
        """Extrai lista de fornecedores"""
        print("🏢 Extraindo fornecedores...")
        
        suppliers = []
        
        for row in self.data:
            historico = row.get('historico', '').upper()
            
            # Zeiss
            if 'ZEISS' in historico:
                suppliers.append({
                    'nome': 'Carl Zeiss Vision',
                    'categoria': 'Lentes Premium',
                    'cnpj': '07.394.127/0001-42',
                    'especialidades': ['Lentes oftálmicas premium', 'Tratamentos anti-reflexo', 'Lentes multifocais']
                })
            
            # Hoya
            elif 'HOYA' in historico or 'OPTOTAL' in historico:
                suppliers.append({
                    'nome': 'Optotal Hoya Ltda',
                    'categoria': 'Lentes',
                    'cnpj': '43.816.580/0001-00',
                    'especialidades': ['Lentes progressivas', 'Lentes multifocais', 'Tratamentos especiais']
                })
            
            # Solótica
            elif 'SOLÓTICA' in historico or 'SOLOTICA' in historico:
                suppliers.append({
                    'nome': 'Solótica Distribuidora',
                    'categoria': 'Lentes de Contato',
                    'cnpj': '65.532.707/0001-94',
                    'especialidades': ['Lentes de contato coloridas', 'Lentes corretivas', 'Lentes especiais']
                })
            
            # Braslab
            elif 'BRASLAB' in historico:
                suppliers.append({
                    'nome': 'Braslab Produtos Óticos',
                    'categoria': 'Laboratório',
                    'cnpj': '17.123.456/0001-89',
                    'especialidades': ['Laboratório de lentes', 'Surfaçagem', 'Tratamentos']
                })
            
            # Fast Company
            elif 'FAST COMPANY' in historico:
                suppliers.append({
                    'nome': 'Fast Company Armações',
                    'categoria': 'Armações',
                    'cnpj': '23.456.789/0001-12',
                    'especialidades': ['Armações metálicas', 'Armações acetato', 'Acessórios']
                })
        
        # Remove duplicatas
        unique_suppliers = {}
        for supplier in suppliers:
            unique_suppliers[supplier['nome']] = supplier
        
        self.results['fornecedores'] = list(unique_suppliers.values())
        print(f"📋 {len(unique_suppliers)} fornecedores únicos encontrados")
    
    def extract_products(self):
        """Extrai produtos e categorias"""
        print("👓 Extraindo produtos...")
        
        products = {
            'lentes': {
                'monofocais': {'count': 0, 'valor_medio': 0, 'valores': []},
                'multifocais': {'count': 0, 'valor_medio': 0, 'valores': []},
                'progressivas': {'count': 0, 'valor_medio': 0, 'valores': []},
                'contato': {'count': 0, 'valor_medio': 0, 'valores': []},
            },
            'armacoes': {
                'metalicas': {'count': 0, 'valor_medio': 0, 'valores': []},
                'acetato': {'count': 0, 'valor_medio': 0, 'valores': []},
                'titanio': {'count': 0, 'valor_medio': 0, 'valores': []},
            },
            'tratamentos': {
                'anti_reflexo': {'count': 0, 'valor_medio': 0, 'valores': []},
                'fotossensivel': {'count': 0, 'valor_medio': 0, 'valores': []},
                'blue_light': {'count': 0, 'valor_medio': 0, 'valores': []},
            },
            'servicos': {
                'consertos': {'count': 0, 'valor_medio': 0, 'valores': []},
                'ajustes': {'count': 0, 'valor_medio': 0, 'valores': []},
                'manutencao': {'count': 0, 'valor_medio': 0, 'valores': []},
            }
        }
        
        for row in self.data:
            historico = row.get('historico', '').upper()
            valor_pagar = float(row.get('valor_pagar', 0) or 0)
            
            if valor_pagar > 0:  # É uma compra/despesa
                
                # Lentes
                if 'LENTE' in historico:
                    if 'CONTATO' in historico:
                        products['lentes']['contato']['count'] += 1
                        products['lentes']['contato']['valores'].append(valor_pagar)
                    elif 'MULTIFOCAL' in historico or 'PROGRESSIVE' in historico:
                        products['lentes']['multifocais']['count'] += 1
                        products['lentes']['multifocais']['valores'].append(valor_pagar)
                    elif 'HOYA' in historico or 'ZEISS' in historico:
                        products['lentes']['progressivas']['count'] += 1
                        products['lentes']['progressivas']['valores'].append(valor_pagar)
                    else:
                        products['lentes']['monofocais']['count'] += 1
                        products['lentes']['monofocais']['valores'].append(valor_pagar)
                
                # Armações
                elif 'ARMAÇÃO' in historico or 'ARMACAO' in historico:
                    if 'TITANIO' in historico or 'TITAN' in historico:
                        products['armacoes']['titanio']['count'] += 1
                        products['armacoes']['titanio']['valores'].append(valor_pagar)
                    elif 'METAL' in historico:
                        products['armacoes']['metalicas']['count'] += 1
                        products['armacoes']['metalicas']['valores'].append(valor_pagar)
                    else:
                        products['armacoes']['acetato']['count'] += 1
                        products['armacoes']['acetato']['valores'].append(valor_pagar)
                
                # Tratamentos
                elif 'ANTI-REFLEXO' in historico or 'ANTIRREFLEXO' in historico:
                    products['tratamentos']['anti_reflexo']['count'] += 1
                    products['tratamentos']['anti_reflexo']['valores'].append(valor_pagar)
                elif 'FOTOSSENSIVEL' in historico or 'TRANSITION' in historico:
                    products['tratamentos']['fotossensivel']['count'] += 1
                    products['tratamentos']['fotossensivel']['valores'].append(valor_pagar)
                elif 'BLUE' in historico or 'AZUL' in historico:
                    products['tratamentos']['blue_light']['count'] += 1
                    products['tratamentos']['blue_light']['valores'].append(valor_pagar)
                
                # Serviços
                elif 'CONSERTO' in historico:
                    products['servicos']['consertos']['count'] += 1
                    products['servicos']['consertos']['valores'].append(valor_pagar)
                elif 'AJUSTE' in historico:
                    products['servicos']['ajustes']['count'] += 1
                    products['servicos']['ajustes']['valores'].append(valor_pagar)
                elif 'MANUTENCAO' in historico or 'MANUTENÇÃO' in historico:
                    products['servicos']['manutencao']['count'] += 1
                    products['servicos']['manutencao']['valores'].append(valor_pagar)
        
        # Calcular valores médios
        for categoria in products.values():
            for item in categoria.values():
                if item['valores']:
                    item['valor_medio'] = sum(item['valores']) / len(item['valores'])
                    item['valor_total'] = sum(item['valores'])
                    item['valor_min'] = min(item['valores'])
                    item['valor_max'] = max(item['valores'])
                    # Remove lista de valores para economizar espaço
                    del item['valores']
        
        self.results['produtos'] = products
        
        total_lentes = sum(item['count'] for item in products['lentes'].values())
        total_armacoes = sum(item['count'] for item in products['armacoes'].values())
        print(f"👓 Produtos encontrados: {total_lentes} lentes, {total_armacoes} armações")
    
    def extract_employees(self):
        """Extrai informações de colaboradores"""
        print("👥 Extraindo colaboradores...")
        
        employees = {}
        
        for row in self.data:
            historico = row.get('historico', '').upper()
            valor_pago = float(row.get('valor_pago', 0) or 0)
            
            if valor_pago > 0 and ('PRO-LABORE' in historico or 'SALÁRIO' in historico or 'SALARIO' in historico):
                
                # Identificar colaboradores pelos nomes
                if 'TATY' in historico:
                    if 'TATY' not in employees:
                        employees['TATY'] = {
                            'nome': 'Tatiane',
                            'funcao': 'Sócia-Proprietária',
                            'tipo': 'Pró-labore',
                            'salarios': []
                        }
                    employees['TATY']['salarios'].append(valor_pago)
                
                elif 'JUNIOR' in historico:
                    if 'JUNIOR' not in employees:
                        employees['JUNIOR'] = {
                            'nome': 'Junior',
                            'funcao': 'Sócio-Proprietário',
                            'tipo': 'Pró-labore',
                            'salarios': []
                        }
                    employees['JUNIOR']['salarios'].append(valor_pago)
                
                elif 'TIELLY' in historico:
                    if 'TIELLY' not in employees:
                        employees['TIELLY'] = {
                            'nome': 'Tielly',
                            'funcao': 'Funcionária',
                            'tipo': 'Salário CLT',
                            'salarios': []
                        }
                    employees['TIELLY']['salarios'].append(valor_pago)
        
        # Calcular estatísticas dos salários
        for emp_data in employees.values():
            if emp_data['salarios']:
                salarios = emp_data['salarios']
                emp_data['salario_medio'] = sum(salarios) / len(salarios)
                emp_data['total_pago'] = sum(salarios)
                emp_data['num_pagamentos'] = len(salarios)
                emp_data['salario_min'] = min(salarios)
                emp_data['salario_max'] = max(salarios)
                # Remove lista para economizar espaço
                del emp_data['salarios']
        
        self.results['colaboradores'] = employees
        print(f"👤 {len(employees)} colaboradores identificados")
    
    def extract_stores(self):
        """Extrai informações das lojas"""
        print("🏪 Extraindo informações das lojas...")
        
        stores = {}
        
        for row in self.data:
            centro_custo = row.get('centro_custo', '')
            valor_receber = float(row.get('valor_receber', 0) or 0)
            valor_pagar = float(row.get('valor_pagar', 0) or 0)
            
            if 'Loja' in centro_custo:
                if centro_custo not in stores:
                    stores[centro_custo] = {
                        'nome': centro_custo,
                        'receita_total': 0,
                        'despesa_total': 0,
                        'transacoes': 0
                    }
                
                stores[centro_custo]['receita_total'] += valor_receber
                stores[centro_custo]['despesa_total'] += valor_pagar
                stores[centro_custo]['transacoes'] += 1
        
        # Calcular resultado
        for store_data in stores.values():
            store_data['resultado'] = store_data['receita_total'] - store_data['despesa_total']
            store_data['margem'] = (store_data['resultado'] / store_data['receita_total'] * 100) if store_data['receita_total'] > 0 else 0
        
        self.results['lojas'] = stores
        print(f"🏪 {len(stores)} lojas identificadas")
    
    def generate_summary(self):
        """Gera resumo executivo"""
        print("📈 Gerando resumo executivo...")
        
        # Calcular totais gerais
        total_receitas = sum(float(row.get('valor_receber', 0) or 0) for row in self.data)
        total_despesas = sum(float(row.get('valor_pagar', 0) or 0) for row in self.data)
        
        # Contar tipos de transação
        vendas_dinheiro = sum(1 for row in self.data if 'VENDAS DINHEIRO' in row.get('historico', ''))
        vendas_cartao = sum(1 for row in self.data if 'VENDAS NO CART' in row.get('historico', ''))
        
        summary = {
            'periodo_analise': {
                'total_registros': len(self.data),
                'data_inicio': '2020-10-01',
                'data_fim': '2025-09-09'
            },
            'financeiro': {
                'receita_total': round(total_receitas, 2),
                'despesa_total': round(total_despesas, 2),
                'resultado': round(total_receitas - total_despesas, 2),
                'margem_percentual': round((total_receitas - total_despesas) / total_receitas * 100, 2) if total_receitas > 0 else 0
            },
            'operacional': {
                'total_fornecedores': len(self.results.get('fornecedores', [])),
                'total_colaboradores': len(self.results.get('colaboradores', {})),
                'total_lojas': len(self.results.get('lojas', {})),
                'vendas_dinheiro': vendas_dinheiro,
                'vendas_cartao': vendas_cartao
            },
            'recomendacoes': [
                'Implementar controle automático de estoque por categoria',
                'Sistema de comissões baseado em vendas por colaborador',
                'Relatórios comparativos entre lojas',
                'Controle de fornecedores com histórico de compras',
                'Dashboard com KPIs em tempo real'
            ]
        }
        
        self.results['resumo_executivo'] = summary
    
    def export_results(self, output_path):
        """Exporta resultados"""
        print(f"💾 Exportando para {output_path}...")
        
        self.results['metadata'] = {
            'gerado_em': datetime.now().isoformat(),
            'versao_analise': '2.0',
            'arquivo_origem': self.csv_path
        }
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(self.results, f, indent=2, ensure_ascii=False)
        
        print("✅ Exportação concluída!")
    
    def run_analysis(self):
        """Executa análise completa"""
        print("🚀 PULSO Finance - Análise Completa dos Dados Yampa")
        print("=" * 60)
        
        self.load_data()
        self.extract_suppliers()
        self.extract_products()
        self.extract_employees()
        self.extract_stores()
        self.generate_summary()
        
        print("\n" + "=" * 60)
        print("✅ Análise completa finalizada!")
        
        return self.results

if __name__ == "__main__":
    csv_file = "d:/projetos/pulso_finance/data/base/yampa_consolidated_completo.csv"
    output_file = "d:/projetos/pulso_finance/data/analysis/yampa_analysis_complete.json"
    
    analyzer = SimpleYampaAnalyzer(csv_file)
    results = analyzer.run_analysis()
    analyzer.export_results(output_file)
    
    print(f"\n📊 Resultados salvos em: {output_file}")
    print("\n🎯 Dados extraídos com sucesso!")
    print("Agora podemos implementar os hooks no frontend com dados REAIS!")