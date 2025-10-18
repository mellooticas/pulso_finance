import pandas as pd
import uuid
import os
from datetime import datetime

print("🚀 Gerando SQL final...")

# Carregar dados
df = pd.read_csv('data/base/yampa_consolidado_deduplicado.csv', sep=';')
print(f"📊 Total registros: {len(df)}")

# Preparar pasta
pasta_sql = 'data/seeds'
os.makedirs(pasta_sql, exist_ok=True)

registros = 0
with open(f'{pasta_sql}/yampa_final.sql', 'w', encoding='utf-8') as f:
    f.write("-- MIGRAÇÃO YAMPA CONSOLIDADA\n")
    f.write(f"-- Total de registros: {len(df)}\n")
    f.write(f"-- Gerado em: {datetime.now()}\n\n")
    
    for idx, row in df.iterrows():
        data = row['data_realizada']
        desc = str(row.get('historico', ''))[:200].replace("'", "''")
        val_rec = str(row.get('valor_receber', 0))
        val_pag = str(row.get('valor_pagar', 0))
        
        # Limpar valores brasileiros
        def limpar_valor(val):
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
        
        v_rec = limpar_valor(val_rec)
        v_pag = limpar_valor(val_pag)
            
        if v_rec > 0:
            tipo, valor = 'receber', v_rec
        elif v_pag < 0:
            tipo, valor = 'pagar', abs(v_pag)
        else:
            continue
            
        if valor > 0:
            sql = f"INSERT INTO movimentacoes_financeiras (id, data_movimentacao, tipo, valor, descricao, created_at, updated_at) VALUES ('{str(uuid.uuid4())}', '{data}', '{tipo}', {valor:.2f}, '{desc}', NOW(), NOW());"
            f.write(sql + "\n")
            registros += 1

print(f"✅ SQL gerado com {registros} registros em data/seeds/yampa_final.sql")