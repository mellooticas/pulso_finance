import pandas as pd
import uuid
import os
from datetime import datetime

print("🚀 Gerando CSV para importação direta no Supabase...")

# Carregar dados
df = pd.read_csv('data/base/yampa_consolidado_deduplicado.csv', sep=';')
print(f"📊 Total registros: {len(df)}")

# Lista para armazenar dados formatados
dados_formatados = []

# UUIDs dos planos de conta (mesmos do sistema)
PLANOS_CONTAS = {
    'VENDAS': '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',
    'SALARIO': '7f8a9b2c-3d4e-5f6a-7b8c-9d0e1f2a3b4c',
    'VALE': '8e9f0a1b-2c3d-4e5f-6a7b-8c9d0e1f2a3b',
    'FRANQUIA': '9f0a1b2c-3d4e-5f6a-7b8c-9d0e1f2a3b4c',
    'ALUGUEL': 'a0b1c2d3-4e5f-6a7b-8c9d-0e1f2a3b4c5d',
    'COMBUSTIVEL': 'b1c2d3e4-5f6a-7b8c-9d0e-1f2a3b4c5d6e',
    'MERCADO': 'c2d3e4f5-6a7b-8c9d-0e1f-2a3b4c5d6e7f',
    'PAPELARIA': 'd3e4f5a6-7b8c-9d0e-1f2a-3b4c5d6e7f8a',
    'DEFAULT': 'e4f5a6b7-8c9d-0e1f-2a3b-4c5d6e7f8a9b'
}

def mapear_plano_conta(historico):
    """Mapeia histórico para UUID do plano de conta"""
    if pd.isna(historico):
        return PLANOS_CONTAS['DEFAULT']
    
    hist_upper = str(historico).upper()
    
    if any(palavra in hist_upper for palavra in ['VENDA', 'RECEITA', 'RECEBIDO', 'PIX RECEBIDO']):
        return PLANOS_CONTAS['VENDAS']
    elif any(palavra in hist_upper for palavra in ['SALARIO', 'FUNCIONARIO']):
        return PLANOS_CONTAS['SALARIO']
    elif any(palavra in hist_upper for palavra in ['VALE', 'ADIANTAMENTO', 'TRANSPORTE']):
        return PLANOS_CONTAS['VALE']
    elif 'FRANQUIA' in hist_upper:
        return PLANOS_CONTAS['FRANQUIA']
    elif 'ALUGUEL' in hist_upper:
        return PLANOS_CONTAS['ALUGUEL']
    elif 'COMBUSTIVEL' in hist_upper:
        return PLANOS_CONTAS['COMBUSTIVEL']
    elif any(palavra in hist_upper for palavra in ['MERCADO', 'CAFE', 'ALMOCO']):
        return PLANOS_CONTAS['MERCADO']
    elif 'PAPELARIA' in hist_upper:
        return PLANOS_CONTAS['PAPELARIA']
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

registros_processados = 0

for idx, row in df.iterrows():
    try:
        data = row['data_realizada']
        historico = str(row.get('historico', ''))[:500]  # Limitar tamanho
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
            
            # Adicionar registro formatado
            dados_formatados.append({
                'id': str(uuid.uuid4()),
                'data_movimentacao': data,
                'tipo': tipo,
                'valor': round(valor, 2),
                'descricao': historico,
                'plano_conta_id': plano_conta_id,
                'created_at': datetime.now().isoformat(),
                'updated_at': datetime.now().isoformat()
            })
            registros_processados += 1
            
    except Exception as e:
        print(f"⚠️ Erro no registro {idx}: {e}")

# Criar DataFrame formatado
df_final = pd.DataFrame(dados_formatados)

# Salvar CSV para Supabase
caminho_csv = 'data/seeds/movimentacoes_financeiras_import.csv'
os.makedirs('data/seeds', exist_ok=True)
df_final.to_csv(caminho_csv, index=False, encoding='utf-8')

print(f"✅ CSV criado: {caminho_csv}")
print(f"📈 Registros processados: {registros_processados}")
print(f"💰 Resumo por tipo:")
print(f"   🟢 Receber: {len(df_final[df_final['tipo'] == 'receber'])} registros")
print(f"   🔴 Pagar: {len(df_final[df_final['tipo'] == 'pagar'])} registros")
print(f"   💵 Total receitas: R$ {df_final[df_final['tipo'] == 'receber']['valor'].sum():,.2f}")
print(f"   💸 Total despesas: R$ {df_final[df_final['tipo'] == 'pagar']['valor'].sum():,.2f}")

print(f"\n🎯 PRÓXIMOS PASSOS:")
print(f"1. Limpar tabela atual no Supabase:")
print(f"   DELETE FROM movimentacoes_financeiras;")
print(f"2. Importar CSV via interface do Supabase")
print(f"3. Verificar dashboard com dados reais")