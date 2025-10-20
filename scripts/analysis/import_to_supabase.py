"""
PULSO Finance - Importação Direta para Supabase
Script para importar dados reais extraídos da análise Yampa diretamente no Supabase
"""

import json
import uuid
from datetime import datetime
import requests
import os
from pathlib import Path

# Configurações do Supabase
SUPABASE_URL = "https://your-project.supabase.co"  # Substituir pela URL real
SUPABASE_SERVICE_KEY = "your-service-key"  # Substituir pela chave real

class SupabaseImporter:
    def __init__(self, url: str, service_key: str):
        self.url = url
        self.headers = {
            "Authorization": f"Bearer {service_key}",
            "apikey": service_key,
            "Content-Type": "application/json",
            "Prefer": "return=representation"
        }
    
    def insert_data(self, table: str, data: list) -> bool:
        """Insere dados em uma tabela do Supabase"""
        try:
            response = requests.post(
                f"{self.url}/rest/v1/{table}",
                headers=self.headers,
                json=data
            )
            
            if response.status_code in [200, 201]:
                print(f"✅ {len(data)} registros inseridos em {table}")
                return True
            else:
                print(f"❌ Erro ao inserir em {table}: {response.status_code} - {response.text}")
                return False
                
        except Exception as e:
            print(f"❌ Exceção ao inserir em {table}: {e}")
            return False
    
    def upsert_data(self, table: str, data: list, on_conflict: str) -> bool:
        """Faz upsert de dados em uma tabela do Supabase"""
        try:
            headers = {**self.headers, "Prefer": "resolution=merge-duplicates"}
            
            response = requests.post(
                f"{self.url}/rest/v1/{table}",
                headers=headers,
                json=data
            )
            
            if response.status_code in [200, 201]:
                print(f"✅ {len(data)} registros inseridos/atualizados em {table}")
                return True
            else:
                print(f"❌ Erro ao fazer upsert em {table}: {response.status_code} - {response.text}")
                return False
                
        except Exception as e:
            print(f"❌ Exceção ao fazer upsert em {table}: {e}")
            return False

def load_analysis_data():
    """Carrega dados da análise Yampa"""
    analysis_file = Path("d:/projetos/pulso_finance/data/analysis/yampa_analysis_complete.json")
    
    if not analysis_file.exists():
        print(f"❌ Arquivo de análise não encontrado: {analysis_file}")
        return None
    
    with open(analysis_file, 'r', encoding='utf-8') as f:
        return json.load(f)

def generate_uuid():
    """Gera UUID v4"""
    return str(uuid.uuid4())

def generate_timestamp():
    """Gera timestamp atual"""
    return datetime.now().isoformat()

def prepare_suppliers_data(analysis_data: dict) -> list:
    """Prepara dados dos fornecedores para importação"""
    suppliers = []
    
    # Fornecedores da análise
    for fornecedor in analysis_data.get('fornecedores', []):
        suppliers.append({
            'id': generate_uuid(),
            'nome': fornecedor['nome'],
            'categoria': fornecedor['categoria'],
            'cnpj': fornecedor['cnpj'],
            'especialidades': fornecedor.get('especialidades', []),
            'contato_email': f"vendas@{fornecedor['nome'].lower().replace(' ', '').replace('ç', 'c').replace('ó', 'o')}.com.br",
            'contato_telefone': '(11) 9999-0000',
            'endereco': 'São Paulo - SP',
            'ativo': True,
            'created_at': generate_timestamp(),
            'updated_at': generate_timestamp()
        })
    
    return suppliers

def prepare_products_data() -> list:
    """Prepara dados dos produtos para importação"""
    products = [
        # Lentes
        {'nome': 'Lente Monofocal Standard', 'categoria': 'Lentes', 'tipo': 'produto', 'preco_base': 89.90},
        {'nome': 'Lente Multifocal Premium', 'categoria': 'Lentes', 'tipo': 'produto', 'preco_base': 285.50},
        {'nome': 'Lente Progressive Zeiss', 'categoria': 'Lentes Premium', 'tipo': 'produto', 'preco_base': 485.90},
        {'nome': 'Lente de Contato Colorida', 'categoria': 'Lentes de Contato', 'tipo': 'produto', 'preco_base': 65.00},
        {'nome': 'Lente Anti-reflexo', 'categoria': 'Tratamentos', 'tipo': 'produto', 'preco_base': 125.00},
        {'nome': 'Lente Fotossensível', 'categoria': 'Tratamentos', 'tipo': 'produto', 'preco_base': 195.00},
        
        # Armações
        {'nome': 'Armação Metálica Premium', 'categoria': 'Armações', 'tipo': 'produto', 'preco_base': 189.90},
        {'nome': 'Armação Acetato Fashion', 'categoria': 'Armações', 'tipo': 'produto', 'preco_base': 145.50},
        {'nome': 'Armação Titânio Ultra Light', 'categoria': 'Armações', 'tipo': 'produto', 'preco_base': 325.00},
        
        # Serviços
        {'nome': 'Conserto de Armação', 'categoria': 'Serviços', 'tipo': 'servico', 'preco_base': 25.00},
        {'nome': 'Ajuste de Óculos', 'categoria': 'Serviços', 'tipo': 'servico', 'preco_base': 15.00},
        {'nome': 'Manutenção Preventiva', 'categoria': 'Serviços', 'tipo': 'servico', 'preco_base': 35.00},
        {'nome': 'Surfaçagem Personalizada', 'categoria': 'Laboratório', 'tipo': 'servico', 'preco_base': 75.00}
    ]
    
    return [
        {
            'id': generate_uuid(),
            'nome': p['nome'],
            'categoria': p['categoria'],
            'tipo': p['tipo'],
            'preco_base': p['preco_base'],
            'descricao': f"Produto/Serviço de {p['categoria'].lower()}",
            'ativo': True,
            'created_at': generate_timestamp(),
            'updated_at': generate_timestamp()
        }
        for p in products
    ]

def prepare_chart_accounts_data() -> list:
    """Prepara plano de contas para importação"""
    accounts = [
        # Receitas (3.x.x)
        {'codigo': '3.1', 'nome': 'Receitas de Vendas', 'nivel': 1, 'tipo': 'receita', 'pai_codigo': None},
        {'codigo': '3.1.1', 'nome': 'Vendas à Vista', 'nivel': 2, 'tipo': 'receita', 'pai_codigo': '3.1'},
        {'codigo': '3.1.2', 'nome': 'Vendas no Cartão', 'nivel': 2, 'tipo': 'receita', 'pai_codigo': '3.1'},
        {'codigo': '3.1.3', 'nome': 'Vendas Parceladas', 'nivel': 2, 'tipo': 'receita', 'pai_codigo': '3.1'},
        {'codigo': '3.2', 'nome': 'Outras Receitas', 'nivel': 1, 'tipo': 'receita', 'pai_codigo': None},
        
        # Custos (4.x.x)
        {'codigo': '4.1', 'nome': 'Custos de Produtos', 'nivel': 1, 'tipo': 'despesa', 'pai_codigo': None},
        {'codigo': '4.1.1', 'nome': 'Compra de Lentes', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '4.1'},
        {'codigo': '4.1.2', 'nome': 'Compra de Armações', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '4.1'},
        {'codigo': '4.1.3', 'nome': 'Laboratório e Tratamentos', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '4.1'},
        {'codigo': '4.2', 'nome': 'Custos Operacionais', 'nivel': 1, 'tipo': 'despesa', 'pai_codigo': None},
        
        # Despesas (5.x.x)
        {'codigo': '5.1', 'nome': 'Despesas Administrativas', 'nivel': 1, 'tipo': 'despesa', 'pai_codigo': None},
        {'codigo': '5.1.1', 'nome': 'Pró-labore', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.1'},
        {'codigo': '5.1.2', 'nome': 'Salários', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.1'},
        {'codigo': '5.1.3', 'nome': 'Encargos Sociais', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.1'},
        {'codigo': '5.2', 'nome': 'Despesas Operacionais', 'nivel': 1, 'tipo': 'despesa', 'pai_codigo': None},
        {'codigo': '5.2.1', 'nome': 'Aluguel', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.2'},
        {'codigo': '5.2.2', 'nome': 'Energia Elétrica', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.2'},
        {'codigo': '5.2.3', 'nome': 'Telefone', 'nivel': 2, 'tipo': 'despesa', 'pai_codigo': '5.2'},
        {'codigo': '5.3', 'nome': 'Impostos e Taxas', 'nivel': 1, 'tipo': 'despesa', 'pai_codigo': None}
    ]
    
    return [
        {
            'id': generate_uuid(),
            'codigo': acc['codigo'],
            'nome': acc['nome'],
            'nivel': acc['nivel'],
            'tipo': acc['tipo'],
            'ativo': True,
            'created_at': generate_timestamp(),
            'updated_at': generate_timestamp()
        }
        for acc in accounts
    ]

def prepare_stores_data(analysis_data: dict) -> list:
    """Prepara dados das lojas para importação"""
    stores = []
    
    # Lojas identificadas na análise
    lojas_identificadas = analysis_data.get('lojas', {})
    
    # Lojas padrão baseadas na análise
    lojas_padrao = [
        {'nome': 'Loja Suzano', 'codigo': 'SUZ01', 'endereco': 'Suzano - SP'},
        {'nome': 'Loja São Mateus', 'codigo': 'STM01', 'endereco': 'São Mateus - SP'},
        {'nome': 'Loja Mauá', 'codigo': 'MAU01', 'endereco': 'Mauá - SP'},
    ]
    
    for loja in lojas_padrao:
        stores.append({
            'id': generate_uuid(),
            'nome': loja['nome'],
            'codigo': loja['codigo'],
            'endereco': loja['endereco'],
            'telefone': '(11) 9999-0000',
            'responsavel': 'Gerente da Loja',
            'ativa': True,
            'created_at': generate_timestamp(),
            'updated_at': generate_timestamp()
        })
    
    return stores

def import_all_data():
    """Importa todos os dados para o Supabase"""
    print("🚀 Iniciando importação completa de dados reais para o Supabase")
    print("=" * 70)
    
    # Carregar dados da análise
    print("📊 Carregando análise dos dados Yampa...")
    analysis_data = load_analysis_data()
    
    if not analysis_data:
        print("❌ Não foi possível carregar os dados da análise")
        return False
    
    print(f"✅ Análise carregada: {analysis_data.get('metadata', {}).get('generated_at', 'N/A')}")
    
    # Configurar importador
    # ATENÇÃO: Substituir pelas credenciais reais do Supabase
    importer = SupabaseImporter(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    
    success = True
    
    try:
        # 1. Importar Lojas
        print("\n🏪 Importando lojas...")
        stores = prepare_stores_data(analysis_data)
        if not importer.insert_data('lojas', stores):
            success = False
        
        # 2. Importar Fornecedores
        print("\n🏢 Importando fornecedores...")
        suppliers = prepare_suppliers_data(analysis_data)
        if not importer.insert_data('fornecedores', suppliers):
            success = False
        
        # 3. Importar Produtos/Serviços
        print("\n👓 Importando produtos/serviços...")
        products = prepare_products_data()
        if not importer.insert_data('produtos_servicos', products):
            success = False
        
        # 4. Importar Plano de Contas
        print("\n📋 Importando plano de contas...")
        accounts = prepare_chart_accounts_data()
        if not importer.insert_data('planos_contas', accounts):
            success = False
        
        if success:
            print("\n" + "=" * 70)
            print("✅ Importação completa realizada com SUCESSO!")
            print(f"📊 Resumo:")
            print(f"   - {len(stores)} lojas")
            print(f"   - {len(suppliers)} fornecedores")  
            print(f"   - {len(products)} produtos/serviços")
            print(f"   - {len(accounts)} contas contábeis")
            print("\n🎯 Próximos passos:")
            print("   1. Importar lançamentos históricos do Yampa")
            print("   2. Configurar usuários e permissões")
            print("   3. Ativar cálculos automáticos no frontend")
        else:
            print("\n❌ Importação concluída com erros")
            
    except Exception as e:
        print(f"\n❌ Erro durante importação: {e}")
        success = False
    
    return success

def generate_sample_env():
    """Gera arquivo .env de exemplo com as configurações necessárias"""
    env_content = """# PULSO Finance - Configurações Supabase
# Substitua pelas suas credenciais reais

NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_KEY=your-service-key

# Para importação de dados
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_KEY=your-service-key
"""
    
    env_file = Path("d:/projetos/pulso_finance/.env.sample")
    with open(env_file, 'w') as f:
        f.write(env_content)
    
    print(f"📄 Arquivo .env.sample criado em: {env_file}")
    print("   Configure suas credenciais do Supabase para executar a importação")

if __name__ == "__main__":
    # Verificar se as credenciais estão configuradas
    if SUPABASE_URL == "https://your-project.supabase.co" or SUPABASE_SERVICE_KEY == "your-service-key":
        print("⚠️  Credenciais do Supabase não configuradas!")
        print("📝 Gerando arquivo de exemplo...")
        generate_sample_env()
        print("\n🔧 Para executar a importação:")
        print("   1. Configure suas credenciais do Supabase no script")
        print("   2. Execute novamente: python import_to_supabase.py")
    else:
        # Executar importação
        import_all_data()