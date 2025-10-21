#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Análise temporal: distribuição de dados por período
"""
import pandas as pd

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'

print('🔍 ANÁLISE TEMPORAL DOS ARQUIVOS')
print('=' * 60)

# Analisar backup_total
print('\n📂 BACKUP_TOTAL.CSV')
df_backup = pd.read_csv(f'{PASTA_BASE}/backup_total.csv', sep=';', encoding='utf-8')

# Converter datas
df_backup['data_analise'] = pd.to_datetime(df_backup['Data esperada'], format='%d/%m/%Y', errors='coerce')

# Contar por período
ate_2022 = len(df_backup[df_backup['data_analise'] <= '2022-12-31'])
de_2023 = len(df_backup[df_backup['data_analise'] >= '2023-01-01'])
sem_data = len(df_backup[df_backup['data_analise'].isna()])

print(f'   Total: {len(df_backup)} registros')
print(f'   Até 31/12/2022: {ate_2022} registros ({ate_2022/len(df_backup)*100:.1f}%)')
print(f'   A partir 01/01/2023: {de_2023} registros ({de_2023/len(df_backup)*100:.1f}%)')
print(f'   Sem data: {sem_data} registros')

if len(df_backup) > 0:
    print(f'   Data mínima: {df_backup["data_analise"].min()}')
    print(f'   Data máxima: {df_backup["data_analise"].max()}')

# Analisar export
print('\n📂 EXPORT.CSV')
df_export = pd.read_csv(f'{PASTA_BASE}/export.csv', sep=';', encoding='utf-8')

# Converter datas
df_export['data_analise'] = pd.to_datetime(df_export['Data esperada'], format='%d/%m/%Y', errors='coerce')

# Contar por período
ate_2022_exp = len(df_export[df_export['data_analise'] <= '2022-12-31'])
de_2023_exp = len(df_export[df_export['data_analise'] >= '2023-01-01'])
sem_data_exp = len(df_export[df_export['data_analise'].isna()])

print(f'   Total: {len(df_export)} registros')
print(f'   Até 31/12/2022: {ate_2022_exp} registros ({ate_2022_exp/len(df_export)*100:.1f}%)')
print(f'   A partir 01/01/2023: {de_2023_exp} registros ({de_2023_exp/len(df_export)*100:.1f}%)')
print(f'   Sem data: {sem_data_exp} registros')

if len(df_export) > 0:
    print(f'   Data mínima: {df_export["data_analise"].min()}')
    print(f'   Data máxima: {df_export["data_analise"].max()}')

# Análise de sobreposição
print('\n📊 ANÁLISE DE SOBREPOSIÇÃO')
print(f'   Backup até 2022: {ate_2022} registros')
print(f'   Export até 2022: {ate_2022_exp} registros')
print(f'   → Possível overlap até 2022: {min(ate_2022, ate_2022_exp)} registros')
print(f'')
print(f'   Backup de 2023+: {de_2023} registros')
print(f'   Export de 2023+: {de_2023_exp} registros')
print(f'   → Possível overlap de 2023+: {min(de_2023, de_2023_exp)} registros')

# Soma
total_ate_2022 = ate_2022 + ate_2022_exp
total_de_2023 = de_2023 + de_2023_exp
print(f'\n🎯 TOTAIS BRUTOS (SEM DEDUPLICAÇÃO):')
print(f'   Até 31/12/2022: {total_ate_2022} registros')
print(f'   A partir 01/01/2023: {total_de_2023} registros')
print(f'   Total: {len(df_backup) + len(df_export)} registros')

# Analisar arquivo final
print('\n📂 ARQUIVAO_FINAL.CSV (APÓS DEDUPLICAÇÃO)')
df_final = pd.read_csv(f'{PASTA_BASE}/arquivao_final.csv', sep=';', encoding='utf-8')
df_final['data_analise'] = pd.to_datetime(df_final['data_esperada'], errors='coerce')

ate_2022_final = len(df_final[df_final['data_analise'] <= '2022-12-31'])
de_2023_final = len(df_final[df_final['data_analise'] >= '2023-01-01'])
sem_data_final = len(df_final[df_final['data_analise'].isna()])

print(f'   Total: {len(df_final)} registros')
print(f'   Até 31/12/2022: {ate_2022_final} registros ({ate_2022_final/len(df_final)*100:.1f}%)')
print(f'   A partir 01/01/2023: {de_2023_final} registros ({de_2023_final/len(df_final)*100:.1f}%)')
print(f'   Sem data: {sem_data_final} registros')

print(f'\n❌ REGISTROS REMOVIDOS NA DEDUPLICAÇÃO:')
print(f'   Até 2022: {total_ate_2022 - ate_2022_final} registros removidos')
print(f'   De 2023+: {total_de_2023 - de_2023_final} registros removidos')
print(f'   Total removido: {(len(df_backup) + len(df_export)) - len(df_final)} registros')
