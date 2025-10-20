"""
PULSO Finance - Analisador Completo de Dados Yampa
Ferramenta para extrair insights e estruturar dados reais para o sistema

Este script analisa os dados históricos do Yampa e extrai:
- Fornecedores e suas especialidades
- Produtos (lentes, armações) e categorias
- Colaboradores e funções
- Padrões de transações e sazonalidade
- Estrutura de impostos e taxas
"""

import pandas as pd
import json
import re
from collections import defaultdict, Counter
from datetime import datetime, timedelta
import numpy as np
from pathlib import Path

class YampaDataAnalyzer:
    def __init__(self, csv_path: str):
        """
        Inicializa o analisador com o arquivo CSV consolidado
        """
        self.csv_path = csv_path
        self.df = None
        self.analysis_results = {}
        
    def load_data(self):
        """Carrega e prepara os dados"""
        print("📊 Carregando dados do Yampa...")
        
        # Carregar CSV com separador correto
        self.df = pd.read_csv(self.csv_path, sep=';', encoding='utf-8')
        
        # Converter datas
        self.df['data_esperada'] = pd.to_datetime(self.df['data_esperada'])
        self.df['data_realizada'] = pd.to_datetime(self.df['data_realizada'])
        
        # Limpar valores
        self.df['valor_receber'] = pd.to_numeric(self.df['valor_receber'], errors='coerce').fillna(0)
        self.df['valor_pagar'] = pd.to_numeric(self.df['valor_pagar'], errors='coerce').fillna(0)
        
        print(f"✅ Dados carregados: {len(self.df)} registros")
        print(f"📅 Período: {self.df['data_realizada'].min()} até {self.df['data_realizada'].max()}")
        
    def analyze_suppliers(self):
        """Analisa fornecedores e suas especialidades"""
        print("\n🏢 Analisando Fornecedores...")
        
        suppliers = []
        
        # Extrair fornecedores dos históricos
        fornecedor_patterns = [
            r'ZEISS|HOYA|ESSILOR|OPTOTAL|BRASLAB|SOLÓTICA|SOLOTICA',
            r'FAST COMPANY|SÓ BLOCOS|DEJURIS',
            r'LABORATÓRIO|LABORATORIO'
        ]
        
        for idx, row in self.df.iterrows():
            historico = str(row['historico']).upper()
            
            # Zeiss
            if 'ZEISS' in historico:
                suppliers.append({
                    'nome': 'Carl Zeiss Vision',
                    'categoria': 'Lentes Premium',
                    'especialidade': 'Lentes oftálmicas de alta qualidade',
                    'cnpj': 'EXTRAIR_DO_HISTORICO',
                    'historico_sample': historico
                })
            
            # Hoya/Optotal
            elif 'HOYA' in historico or 'OPTOTAL' in historico:
                suppliers.append({
                    'nome': 'Optotal Hoya',
                    'categoria': 'Lentes',
                    'especialidade': 'Lentes oftálmicas multifocais e progressivas',
                    'cnpj': 'EXTRAIR_DO_HISTORICO',
                    'historico_sample': historico
                })
            
            # Solótica
            elif 'SOLÓTICA' in historico or 'SOLOTICA' in historico:
                suppliers.append({
                    'nome': 'Solótica',
                    'categoria': 'Lentes de Contato',
                    'especialidade': 'Lentes de contato coloridas e corretivas',
                    'cnpj': '65.532.707/0001-94',
                    'historico_sample': historico
                })
            
            # Braslab
            elif 'BRASLAB' in historico:
                suppliers.append({
                    'nome': 'Braslab Produtos Óticos',
                    'categoria': 'Laboratório',
                    'especialidade': 'Laboratório de lentes e tratamentos',
                    'cnpj': 'EXTRAIR_DO_HISTORICO',
                    'historico_sample': historico
                })
            
            # Fast Company
            elif 'FAST COMPANY' in historico:
                suppliers.append({
                    'nome': 'Fast Company Armações e Lentes',
                    'categoria': 'Armações',
                    'especialidade': 'Armações e acessórios',
                    'cnpj': 'EXTRAIR_DO_HISTORICO',
                    'historico_sample': historico
                })
        
        # Remover duplicatas e criar resumo
        unique_suppliers = {}
        for supplier in suppliers:
            key = supplier['nome']
            if key not in unique_suppliers:
                unique_suppliers[key] = supplier
        
        self.analysis_results['suppliers'] = list(unique_suppliers.values())
        print(f"📋 Encontrados {len(unique_suppliers)} fornecedores únicos")
        
    def analyze_products(self):
        """Analisa produtos e categorias"""
        print("\n👓 Analisando Produtos...")
        
        products = {
            'lentes': [],
            'armacoes': [],
            'tratamentos': [],
            'acessorios': []
        }
        
        # Padrões para identificar produtos
        for idx, row in self.df.iterrows():
            historico = str(row['historico']).upper()
            valor = abs(row['valor_pagar']) if row['valor_pagar'] != 0 else row['valor_receber']
            
            # Lentes
            if any(term in historico for term in ['LENTE', 'MULTIFOCAL', 'PROGRESSIVE', 'ANTI-REFLEXO']):
                product_type = 'STANDARD'
                if 'ZEISS' in historico:
                    product_type = 'PREMIUM'
                elif 'HOYA' in historico:
                    product_type = 'PROGRESSIVE'
                elif 'CONTATO' in historico:
                    product_type = 'CONTATO'
                
                products['lentes'].append({
                    'tipo': product_type,
                    'fornecedor': self._extract_supplier_from_text(historico),
                    'valor_medio': valor,
                    'data': row['data_realizada'],
                    'historico': historico
                })
            
            # Armações
            elif any(term in historico for term in ['ARMAÇÃO', 'ARMACAO', 'ÓCULOS', 'OCULOS']):
                products['armacoes'].append({
                    'tipo': 'ARMACAO_COMPLETA',
                    'fornecedor': self._extract_supplier_from_text(historico),
                    'valor_medio': valor,
                    'data': row['data_realizada'],
                    'historico': historico
                })
            
            # Consertos e tratamentos
            elif any(term in historico for term in ['CONSERTO', 'TRATAMENTO', 'ANTI-REFLEXO']):
                products['tratamentos'].append({
                    'tipo': 'SERVICO_TECNICO',
                    'descricao': historico,
                    'valor': valor,
                    'data': row['data_realizada']
                })
        
        self.analysis_results['products'] = products
        print(f"🔍 Produtos encontrados:")
        print(f"   - Lentes: {len(products['lentes'])}")
        print(f"   - Armações: {len(products['armacoes'])}")
        print(f"   - Tratamentos: {len(products['tratamentos'])}")
        
    def analyze_employees(self):
        """Analisa colaboradores e suas funções"""
        print("\n👥 Analisando Colaboradores...")
        
        employees = {}
        
        # Extrair nomes dos históricos
        for idx, row in self.df.iterrows():
            historico = str(row['historico']).upper()
            
            # Pró-labore e salários
            if any(term in historico for term in ['PRO-LABORE', 'SALÁRIO', 'SALARIO']):
                # Extrair nomes
                if 'TATY' in historico:
                    employees['TATY'] = {
                        'nome': 'Taty',
                        'funcao': 'Sócia/Gestora',
                        'tipo_pagamento': 'Pro-labore',
                        'valores_historicos': []
                    }
                elif 'JUNIOR' in historico:
                    employees['JUNIOR'] = {
                        'nome': 'Junior',
                        'funcao': 'Sócio/Operacional',
                        'tipo_pagamento': 'Pro-labore',
                        'valores_historicos': []
                    }
                elif 'TIELLY' in historico:
                    employees['TIELLY'] = {
                        'nome': 'Tielly',
                        'funcao': 'Funcionária',
                        'tipo_pagamento': 'Salário',
                        'valores_historicos': []
                    }
                
                # Adicionar valor
                valor = abs(row['valor_pago']) if row['valor_pago'] != 0 else 0
                nome_key = None
                for key in employees.keys():
                    if key in historico:
                        nome_key = key
                        break
                
                if nome_key and valor > 0:
                    employees[nome_key]['valores_historicos'].append({
                        'data': row['data_realizada'],
                        'valor': valor,
                        'historico': historico
                    })
            
            # Vale transporte e benefícios
            elif 'VALE TRANSPORTE' in historico:
                # Extrair nome do funcionário do histórico
                names = re.findall(r'([A-Z\s]+)(?:\s|$)', historico)
                if names:
                    clean_name = names[-1].strip()
                    if len(clean_name) > 3:  # Nome válido
                        if clean_name not in employees:
                            employees[clean_name] = {
                                'nome': clean_name.title(),
                                'funcao': 'Funcionária',
                                'tipo_pagamento': 'Salário + Benefícios',
                                'valores_historicos': []
                            }
        
        self.analysis_results['employees'] = employees
        print(f"👤 Encontrados {len(employees)} colaboradores")
        
    def analyze_transactions_patterns(self):
        """Analisa padrões de transações"""
        print("\n📈 Analisando Padrões de Transações...")
        
        # Análise por tipo de receita
        receitas = self.df[self.df['valor_receber'] > 0]
        despesas = self.df[self.df['valor_pagar'] > 0]
        
        # Padrões de vendas
        vendas_patterns = {
            'vendas_dinheiro': len(receitas[receitas['historico'].str.contains('VENDAS DINHEIRO', na=False)]),
            'vendas_cartao': len(receitas[receitas['historico'].str.contains('VENDAS NO CART', na=False)]),
            'vendas_restante_sinal': len(receitas[receitas['historico'].str.contains('RESTANTE DO SINAL', na=False)])
        }
        
        # Padrões de despesas
        despesas_patterns = {
            'lentes_compras': len(despesas[despesas['historico'].str.contains('LENTES - COMPRA', na=False)]),
            'pro_labore': len(despesas[despesas['historico'].str.contains('PRO-LABORE', na=False)]),
            'impostos_taxas': len(despesas[despesas['historico'].str.contains('TAXA', na=False)])
        }
        
        # Análise temporal
        monthly_revenue = receitas.groupby(receitas['data_realizada'].dt.to_period('M'))['valor_receber'].sum()
        monthly_expenses = despesas.groupby(despesas['data_realizada'].dt.to_period('M'))['valor_pagar'].sum()
        
        self.analysis_results['transaction_patterns'] = {
            'vendas_patterns': vendas_patterns,
            'despesas_patterns': despesas_patterns,
            'monthly_revenue': monthly_revenue.to_dict(),
            'monthly_expenses': monthly_expenses.to_dict(),
            'total_transactions': len(self.df),
            'period': {
                'start': self.df['data_realizada'].min().isoformat(),
                'end': self.df['data_realizada'].max().isoformat()
            }
        }
        
        print(f"💰 Padrões de vendas:")
        for pattern, count in vendas_patterns.items():
            print(f"   - {pattern}: {count} transações")
            
    def analyze_stores(self):
        """Analisa informações das lojas"""
        print("\n🏪 Analisando Lojas...")
        
        stores = {}
        
        for idx, row in self.df.iterrows():
            centro_custo = str(row['centro_custo'])
            
            if 'Loja' in centro_custo:
                store_name = centro_custo.strip()
                
                if store_name not in stores:
                    stores[store_name] = {
                        'nome': store_name,
                        'receitas': 0,
                        'despesas': 0,
                        'transacoes': 0,
                        'primeiro_lancamento': row['data_realizada'],
                        'ultimo_lancamento': row['data_realizada']
                    }
                
                # Atualizar dados da loja
                stores[store_name]['receitas'] += row['valor_receber']
                stores[store_name]['despesas'] += abs(row['valor_pagar'])
                stores[store_name]['transacoes'] += 1
                
                # Atualizar datas
                if row['data_realizada'] < stores[store_name]['primeiro_lancamento']:
                    stores[store_name]['primeiro_lancamento'] = row['data_realizada']
                if row['data_realizada'] > stores[store_name]['ultimo_lancamento']:
                    stores[store_name]['ultimo_lancamento'] = row['data_realizada']
        
        self.analysis_results['stores'] = stores
        print(f"🏪 Encontradas {len(stores)} lojas ativas")
        
    def _extract_supplier_from_text(self, text):
        """Extrai nome do fornecedor do texto"""
        suppliers_map = {
            'ZEISS': 'Carl Zeiss Vision',
            'HOYA': 'Optotal Hoya',
            'OPTOTAL': 'Optotal Hoya',
            'SOLÓTICA': 'Solótica',
            'SOLOTICA': 'Solótica',
            'BRASLAB': 'Braslab Produtos Óticos',
            'FAST COMPANY': 'Fast Company'
        }
        
        for key, value in suppliers_map.items():
            if key in text:
                return value
        return 'Não identificado'
    
    def generate_insights(self):
        """Gera insights estratégicos dos dados"""
        print("\n🧠 Gerando Insights Estratégicos...")
        
        insights = []
        
        # Insight 1: Volume de fornecedores por categoria
        if 'suppliers' in self.analysis_results:
            supplier_categories = Counter([s['categoria'] for s in self.analysis_results['suppliers']])
            insights.append({
                'type': 'suppliers',
                'title': 'Diversificação de Fornecedores',
                'data': dict(supplier_categories),
                'recommendation': 'Sistema deve ter cadastro completo de fornecedores por categoria'
            })
        
        # Insight 2: Padrões de produtos mais vendidos
        if 'products' in self.analysis_results:
            lentes_count = len(self.analysis_results['products']['lentes'])
            armacoes_count = len(self.analysis_results['products']['armacoes'])
            insights.append({
                'type': 'products',
                'title': 'Mix de Produtos',
                'data': {'lentes': lentes_count, 'armacoes': armacoes_count},
                'recommendation': 'Implementar controle de estoque por categoria de produto'
            })
        
        # Insight 3: Gestão de colaboradores
        if 'employees' in self.analysis_results:
            total_employees = len(self.analysis_results['employees'])
            insights.append({
                'type': 'employees',
                'title': 'Estrutura de RH',
                'data': {'total_colaboradores': total_employees},
                'recommendation': 'Sistema deve controlar pró-labore, salários e comissões automaticamente'
            })
        
        self.analysis_results['insights'] = insights
        print(f"💡 Gerados {len(insights)} insights estratégicos")
    
    def export_analysis(self, output_path: str):
        """Exporta análise completa em JSON"""
        print(f"\n💾 Exportando análise para {output_path}...")
        
        # Adicionar metadados
        self.analysis_results['metadata'] = {
            'generated_at': datetime.now().isoformat(),
            'total_records_analyzed': len(self.df) if self.df is not None else 0,
            'analysis_version': '1.0',
            'data_source': self.csv_path
        }
        
        # Converter timestamps para strings
        def convert_timestamps(obj):
            if isinstance(obj, dict):
                return {k: convert_timestamps(v) for k, v in obj.items()}
            elif isinstance(obj, list):
                return [convert_timestamps(v) for v in obj]
            elif isinstance(obj, pd.Timestamp):
                return obj.isoformat()
            elif pd.isna(obj):
                return None
            elif hasattr(obj, 'isoformat'):  # datetime objects
                return obj.isoformat()
            return obj
        
        clean_results = convert_timestamps(self.analysis_results)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(clean_results, f, indent=2, ensure_ascii=False)
        
        print(f"✅ Análise exportada com sucesso!")
        
    def run_complete_analysis(self):
        """Executa análise completa dos dados"""
        print("🚀 Iniciando Análise Completa dos Dados Yampa")
        print("=" * 60)
        
        try:
            self.load_data()
            self.analyze_suppliers()
            self.analyze_products()
            self.analyze_employees()
            self.analyze_transactions_patterns()
            self.analyze_stores()
            self.generate_insights()
            
            print("\n" + "=" * 60)
            print("✅ Análise completa finalizada com sucesso!")
            
            return self.analysis_results
            
        except Exception as e:
            print(f"❌ Erro durante análise: {e}")
            return None

if __name__ == "__main__":
    # Configurar caminhos
    csv_file = "d:/projetos/pulso_finance/data/base/yampa_consolidated_completo.csv"
    output_file = "d:/projetos/pulso_finance/data/analysis/yampa_complete_analysis.json"
    
    # Criar diretório de saída se não existir
    Path(output_file).parent.mkdir(parents=True, exist_ok=True)
    
    # Executar análise
    analyzer = YampaDataAnalyzer(csv_file)
    results = analyzer.run_complete_analysis()
    
    if results:
        analyzer.export_analysis(output_file)
        print(f"\n📊 Arquivo de análise salvo em: {output_file}")
        print("\n🎯 Próximos passos:")
        print("1. Implementar hooks no frontend para consumir estes dados")
        print("2. Criar sistema de importação automática")
        print("3. Implementar cálculos automáticos baseados nos padrões identificados")
    else:
        print("❌ Falha na análise dos dados")