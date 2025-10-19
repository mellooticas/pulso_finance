import pandas as pd
import uuid
import os
from datetime import datetime, date

print("🚀 Gerando CSV para LANCAMENTOS e PARCELAS no Supabase...")

# Carregar dados
df = pd.read_csv('data/base/yampa_consolidado_deduplicado.csv', sep=';')
print(f"📊 Total registros: {len(df)}")

# UUID da loja principal (Loja Suzano - a principal do sistema YAMPA)
LOJA_PRINCIPAL_ID = '3704fcce-6e02-411d-a0ad-d96de801345a'  # Loja Suzano

# UUIDs dos planos de conta (reais do Supabase)
PLANOS_CONTAS = {
    'VENDAS_DINHEIRO': '7245ff34-af3e-44ce-8c29-f874dd392683',  # 3.1.1 - Vendas em Dinheiro
    'VENDAS_DEBITO': '29fa1653-1d27-4c2e-aef1-b87ad8c0faef',    # 3.1.2 - Vendas Cartões de Débito  
    'VENDAS_CREDITO': '515cb77e-d834-42e6-a1e8-cc2978e1cf9f',   # 3.1.3 - Vendas Cartões de Crédito
    'VENDAS_PIX': '2742c847-cf17-44de-aafe-5ad00dd7d4cd',       # 3.1.8 - Vendas PIX
    'RECEITAS_SERVICOS': '8c355f2e-a7ad-4a5e-965c-59b3c6b3420e', # 3.2.1 - Receitas de Serviços
    'SIMPLES_NACIONAL': 'e140db2e-9e5a-433a-90d5-3ffcabb3a006',  # 4.1.1 - Simples Nacional
    'DEFAULT': '96cebc3d-191f-4881-83af-66da5e56b1f8'          # 13.99 - Saldo Inicial Padrão Yampa
}

def mapear_plano_conta(historico):
    """Mapeia histórico para UUID do plano de conta real"""
    if pd.isna(historico):
        return PLANOS_CONTAS['DEFAULT']
    
    hist_upper = str(historico).upper()
    
    # Mapear por tipo de transação
    if 'PIX' in hist_upper and any(palavra in hist_upper for palavra in ['RECEBIDO', 'VENDA']):
        return PLANOS_CONTAS['VENDAS_PIX']
    elif any(palavra in hist_upper for palavra in ['CARTAO', 'DEBITO']):
        return PLANOS_CONTAS['VENDAS_DEBITO'] 
    elif any(palavra in hist_upper for palavra in ['CARTAO', 'CREDITO']):
        return PLANOS_CONTAS['VENDAS_CREDITO']
    elif 'DINHEIRO' in hist_upper:
        return PLANOS_CONTAS['VENDAS_DINHEIRO']
    elif any(palavra in hist_upper for palavra in ['VENDA', 'RECEITA', 'RECEBIDO']):
        return PLANOS_CONTAS['VENDAS_DINHEIRO']  # Default para vendas
    elif any(palavra in hist_upper for palavra in ['SERVICO', 'CONSULTA']):
        return PLANOS_CONTAS['RECEITAS_SERVICOS']
    elif any(palavra in hist_upper for palavra in ['SIMPLES', 'NACIONAL', 'IMPOSTO']):
        return PLANOS_CONTAS['SIMPLES_NACIONAL']
    else:
        return PLANOS_CONTAS['DEFAULT']

def limpar_valor(val):
    """Limpa valores brasileiros"""
    if val in ['', '-', 'nan', 'NaN'] or pd.isna(val):
        return 0.0
    val = str(val).replace('R$', '').replace(' ', '')
    if ',' in val and '.' in val:
        val = val.replace('.', '', val.count('.') - 1)
    val = val.replace(',', '.')
    try:
        return float(val)
    except:
        return 0.0

def converter_data(data_str):
    """Converte string de data para formato DATE"""
    try:
        if pd.isna(data_str):
            return date.today()
        # Assumir formato brasileiro DD/MM/YYYY ou YYYY-MM-DD
        if '/' in str(data_str):
            d, m, y = str(data_str).split('/')
            return date(int(y), int(m), int(d))
        elif '-' in str(data_str):
            return datetime.strptime(str(data_str), '%Y-%m-%d').date()
        else:
            return date.today()
    except:
        return date.today()

# Listas para armazenar dados
lancamentos_data = []
parcelas_data = []

registros_processados = 0

for idx, row in df.iterrows():
    try:
        data = converter_data(row['data_realizada'])
        historico = str(row.get('historico', ''))[:500]
        val_rec = limpar_valor(row.get('valor_receber', 0))
        val_pag = limpar_valor(row.get('valor_pagar', 0))
        
        # Determinar tipo e valor
        if val_rec > 0:
            tipo, valor = 'receber', val_rec
        elif val_pag < 0:
            tipo, valor = 'pagar', abs(val_pag)
        else:
            continue
            
        if valor > 0:
            plano_conta_id = mapear_plano_conta(historico)
            lancamento_id = str(uuid.uuid4())
            parcela_id = str(uuid.uuid4())
            
            # Dados do lançamento
            lancamentos_data.append({
                'id': lancamento_id,
                'loja_id': LOJA_PRINCIPAL_ID,
                'tipo': tipo,
                'plano_id': plano_conta_id,
                'centro_custo_id': None,
                'fornecedor_id': None,
                'descricao': historico[:200],
                'historico': historico,
                'observacoes': None,
                'competencia': data,
                'valor_total': round(valor, 2),
                'num_parcelas': 1,
                'origem': 'migracao_yampa',
                'status_aprovacao': 'aprovado',
                'documento_referencia': None,
                'anexos': '{}',
                'user_id': None,
                'aprovado_por': None,
                'aprovado_em': None,
                'metadata': '{}',
                'created_at': datetime.now().isoformat(),
                'updated_at': datetime.now().isoformat()
            })
            
            # Dados da parcela
            parcelas_data.append({
                'id': parcela_id,
                'lancamento_id': lancamento_id,
                'parcela': 1,
                'vencimento': data,
                'valor': round(valor, 2),
                'juros': 0,
                'desconto': 0,
                'valor_pago': round(valor, 2) if tipo == 'pagar' else None,
                'status': 'pago' if tipo == 'pagar' else 'previsto',
                'data_pagamento': data if tipo == 'pagar' else None,
                'forma_pagamento_id': None,
                'conta_id': None,
                'comprovante': None,
                'observacao': None,
                'conciliado': False,
                'created_at': datetime.now().isoformat(),
                'updated_at': datetime.now().isoformat()
            })
            
            registros_processados += 1
            
    except Exception as e:
        print(f"⚠️ Erro no registro {idx}: {e}")

# Criar DataFrames
df_lancamentos = pd.DataFrame(lancamentos_data)
df_parcelas = pd.DataFrame(parcelas_data)

# Salvar CSVs
os.makedirs('data/seeds', exist_ok=True)
df_lancamentos.to_csv('data/seeds/lancamentos_import.csv', index=False, encoding='utf-8')
df_parcelas.to_csv('data/seeds/parcelas_import.csv', index=False, encoding='utf-8')

print(f"✅ CSVs criados:")
print(f"   📊 lancamentos_import.csv: {len(df_lancamentos)} registros")
print(f"   📋 parcelas_import.csv: {len(df_parcelas)} registros")
print(f"📈 Total processado: {registros_processados}")

print(f"\n💰 Resumo por tipo:")
receitas = df_lancamentos[df_lancamentos['tipo'] == 'receber']
despesas = df_lancamentos[df_lancamentos['tipo'] == 'pagar']
print(f"   🟢 Receitas: {len(receitas)} = R$ {receitas['valor_total'].sum():,.2f}")
print(f"   🔴 Despesas: {len(despesas)} = R$ {despesas['valor_total'].sum():,.2f}")

print(f"\n🎯 PRÓXIMOS PASSOS:")
print(f"1. Verificar se existem lojas e planos de conta no Supabase")
print(f"2. Executar: DELETE FROM parcelas; DELETE FROM lancamentos;")
print(f"3. Importar lancamentos_import.csv na tabela 'lancamentos'")
print(f"4. Importar parcelas_import.csv na tabela 'parcelas'")

print(f"\n⚠️ IMPORTANTE:")
print(f"Substitua LOJA_PRINCIPAL_ID pelo UUID real da sua loja no Supabase!")