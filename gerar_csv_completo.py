import pandas as pd
import uuid
from datetime import datetime, date
import os

print("=" * 80)
print("GERANDO CSV PARA IMPORTAR TODO O ARQUIVO uniao_64k.csv")
print("=" * 80)

# Ler arquivo
df = pd.read_csv('data/base/uniao_64k.csv', sep=';', encoding='utf-8')
print(f"\nTotal de linhas: {len(df)}")

# Configurações
LOJA_PRINCIPAL_ID = '3704fcce-6e02-411d-a0ad-d96de801345a'  # Loja Suzano
PLANO_DEFAULT = '96cebc3d-191f-4881-83af-66da5e56b1f8'  # Plano padrão

def limpar_valor(val):
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

def escapar_csv(texto):
    if pd.isna(texto):
        return ''
    return str(texto).replace('"', '""').replace('\n', ' ').replace('\r', ' ')[:500]

# Processar lançamentos
lancamentos = []
count_receitas = 0
count_despesas = 0
count_ignorados = 0

print("\nProcessando registros...")

for idx, row in df.iterrows():
    try:
        valor_receber = limpar_valor(row.get('Valor a receber', 0))
        valor_pagar = limpar_valor(row.get('Valor a pagar', 0))
        tipo = None
        valor_total = 0
        if valor_receber > 0:
            tipo = 'receber'
            valor_total = valor_receber
            count_receitas += 1
        elif valor_pagar < 0:
            tipo = 'pagar'
            valor_total = abs(valor_pagar)
            count_despesas += 1
        else:
            count_ignorados += 1
            continue
        data_realizada = converter_data(row.get('Data realizada', ''))
        if data_realizada == '2024-01-01' and 'data_realizada' in row:
            data_realizada = converter_data(row.get('data_realizada', ''))
        historico = escapar_csv(row.get('historico', ''))
        if not historico:
            historico = escapar_csv(row.get('sequencia', ''))
        if not historico:
            historico = f'{tipo.upper()} - {valor_total}'
        lancamentos.append([
            str(uuid.uuid4()),
            LOJA_PRINCIPAL_ID,
            tipo,
            PLANO_DEFAULT,
            historico,
            historico,
            data_realizada,
            valor_total,
            1,
            'aprovado',
            'import_uniao_64k'
        ])
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

# Gerar CSV
import csv
csv_path = '_importacao_completa/lancamentos_uniao_64k.csv'
with open(csv_path, 'a', newline='', encoding='utf-8') as f:
    writer = csv.writer(f)
    writer.writerows(lancamentos)

print(f"\nCSV pronto para importação: {csv_path}")
print("=" * 80)
