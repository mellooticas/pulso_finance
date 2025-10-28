import pandas as pd
import uuid
from datetime import datetime, date
import os

print("=" * 80)
print("GERANDO SQLs PARA IMPORTAR TODO O ARQUIVO uniao_64k.csv")
print("=" * 80)

# Ler arquivo
df = pd.read_csv('data/base/uniao_64k.csv', sep=';', encoding='utf-8')
print(f"\nTotal de linhas: {len(df)}")

# Configurações
LOJA_PRINCIPAL_ID = '3704fcce-6e02-411d-a0ad-d96de801345a'  # Loja Suzano
PLANO_DEFAULT = '96cebc3d-191f-4881-83af-66da5e56b1f8'  # Plano padrão

def limpar_valor(val):
    """Limpa valores brasileiros"""
    if pd.isna(val) or val in ['', '-', 'nan', 'NaN']:
        return 0.0
    val = str(val).replace('R$', '').replace(' ', '').strip()
    if val == '' or val == '-':
        return 0.0
    if ',' in val and '.' in val:
        val = val.replace('.', '')
    val = val.replace(',', '.')
    try:
        return float(val)
    except:
        return 0.0

def converter_data(data_str):
    """Converte data para formato SQL"""
    try:
        if pd.isna(data_str) or data_str == '':
            return '2024-01-01'
        data_str = str(data_str).strip()
        if '/' in data_str:
            partes = data_str.split('/')
            if len(partes) == 3:
                dia, mes, ano = partes
                return f'{ano}-{mes.zfill(2)}-{dia.zfill(2)}'
        elif '-' in data_str:
            return data_str[:10]
        return '2024-01-01'
    except:
        return '2024-01-01'

def escapar_sql(texto):
    """Escapa aspas simples para SQL"""
    if pd.isna(texto):
        return ''
    return str(texto).replace("'", "''")[:500]

# Processar lançamentos
lancamentos = []
count_receitas = 0
count_despesas = 0
count_ignorados = 0

print("\nProcessando registros...")

for idx, row in df.iterrows():
    try:
        # Determinar tipo e valor
        valor_receber = limpar_valor(row.get('Valor a receber', 0))
        valor_pagar = limpar_valor(row.get('Valor a pagar', 0))
        
        tipo = None
        valor_total = 0
        
        if valor_receber > 0:
            tipo = 'receber'
            valor_total = valor_receber
            count_receitas += 1
        elif valor_pagar < 0:  # Despesas vêm negativas
            tipo = 'pagar'
            valor_total = abs(valor_pagar)
            count_despesas += 1
        else:
            count_ignorados += 1
            continue  # Ignora registros sem valor
        
        # Data
        data_realizada = converter_data(row.get('Data realizada', ''))
        if data_realizada == '2024-01-01' and 'data_realizada' in row:
            data_realizada = converter_data(row.get('data_realizada', ''))
        
        # Descrição
        historico = escapar_sql(row.get('historico', ''))
        if not historico:
            historico = escapar_sql(row.get('sequencia', ''))
        if not historico:
            historico = f'{tipo.upper()} - {valor_total}'
        
        lancamentos.append({
            'id': str(uuid.uuid4()),
            'loja_id': LOJA_PRINCIPAL_ID,
            'tipo': tipo,
            'plano_id': PLANO_DEFAULT,
            'descricao': historico,
            'historico': historico,
            'competencia': data_realizada,
            'valor_total': valor_total,
            'num_parcelas': 1,
            'status_aprovacao': 'aprovado',
            'origem': 'import_uniao_64k'
        })
        
        if (idx + 1) % 5000 == 0:
            print(f"   Processados {idx + 1} registros...")
            
    except Exception as e:
        print(f"   Erro linha {idx}: {e}")
        continue

print(f"\n\nRESUMO:")
print(f"   Receitas: {count_receitas}")
print(f"   Despesas: {count_despesas}")
print(f"   Ignorados (sem valor): {count_ignorados}")
print(f"   TOTAL A INSERIR: {len(lancamentos)}")

# Gerar SQLs em lotes
print(f"\nGerando arquivos SQL...")

LOTE_SIZE = 500
os.makedirs('_importacao_completa', exist_ok=True)

for i in range(0, len(lancamentos), LOTE_SIZE):
    lote = lancamentos[i:i+LOTE_SIZE]
    lote_num = (i // LOTE_SIZE) + 1
    
    sql_content = f"""-- IMPORTACAO COMPLETA - Lote {lote_num}
-- Total de lançamentos neste lote: {len(lote)}

"""
    
    for lanc in lote:
        sql_content += f"""
INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, num_parcelas, status_aprovacao, origem
) VALUES (
    '{lanc['id']}',
    '{lanc['loja_id']}',
    '{lanc['tipo']}',
    '{lanc['plano_id']}',
    '{lanc['descricao']}',
    '{lanc['historico']}',
    '{lanc['competencia']}',
    {lanc['valor_total']},
    {lanc['num_parcelas']},
    '{lanc['status_aprovacao']}',
    '{lanc['origem']}'
);
"""
    
    filename = f'_importacao_completa/lote_{lote_num:03d}.sql'
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    if lote_num % 10 == 0:
        print(f"   Gerado até lote {lote_num}")

total_lotes = (len(lancamentos) + LOTE_SIZE - 1) // LOTE_SIZE
print(f"\nConcluído! Gerados {total_lotes} arquivos SQL")
print(f"\nPara executar:")
print(f"   1. Abra o SQL Editor no Supabase")
print(f"   2. OPCIONAL: DELETE FROM lancamentos WHERE origem = 'import_uniao_64k';")
print(f"   3. Execute cada arquivo em ordem: lote_001.sql, lote_002.sql, etc.")
print("=" * 80)
