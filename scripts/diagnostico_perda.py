#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Diagnóstico: onde estamos perdendo dados?
"""
import pandas as pd
import re
from datetime import datetime
import hashlib

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'

def limpar_valor_brasileiro(valor_str):
    if pd.isna(valor_str) or valor_str == '' or str(valor_str) == 'nan':
        return 0.0
    valor_clean = str(valor_str).strip().replace('R$', '').replace(' ', '')
    valor_clean = re.sub(r'[^\d\-\.,]', '', valor_clean)
    if valor_clean == '' or valor_clean == '-':
        return 0.0
    try:
        if ',' in valor_clean:
            partes = valor_clean.split(',')
            if len(partes) == 2:
                parte_inteira = partes[0].replace('.', '')
                parte_decimal = partes[1][:2]
                valor_final = f"{parte_inteira}.{parte_decimal}"
                return float(valor_final)
        else:
            return float(valor_clean.replace('.', ''))
    except:
        return 0.0

def converter_data_br(data_str):
    if pd.isna(data_str) or data_str == '' or data_str == 'nan':
        return None
    try:
        data_obj = datetime.strptime(str(data_str).strip(), '%d/%m/%Y')
        return data_obj.strftime('%Y-%m-%d')
    except:
        try:
            data_obj = datetime.strptime(str(data_str).strip(), '%Y-%m-%d')
            return data_obj.strftime('%Y-%m-%d')
        except:
            return None

def normalizar_texto(texto):
    if pd.isna(texto):
        return ""
    texto = str(texto).strip().upper()
    texto = re.sub(r'[ÀÁÂÃÄÅ]', 'A', texto)
    texto = re.sub(r'[ÈÉÊË]', 'E', texto)
    texto = re.sub(r'[ÌÍÎÏ]', 'I', texto)
    texto = re.sub(r'[ÒÓÔÕÖ]', 'O', texto)
    texto = re.sub(r'[ÙÚÛÜ]', 'U', texto)
    texto = re.sub(r'[Ç]', 'C', texto)
    texto = re.sub(r'[^\w\s]', ' ', texto)
    texto = re.sub(r'\s+', ' ', texto)
    return texto.strip()

def gerar_chave_duplicata(row):
    chave_data = row.get('data_esperada', '') or 'sem_data'
    chave_valor = abs(row.get('valor_receber', 0)) + abs(row.get('valor_pagar', 0))
    chave_hist = row.get('historico_norm', '')[:50] if row.get('historico_norm', '') else 'sem_hist'
    chave = f"{chave_data}|{chave_valor:.2f}|{chave_hist}"
    return hashlib.md5(chave.encode()).hexdigest()[:12]

print('🔍 DIAGNÓSTICO DE PERDA DE DADOS')
print('=' * 60)

# Carregar backup
print('\n📂 Carregando backup_total.csv...')
df_backup = pd.read_csv(f'{PASTA_BASE}/backup_total.csv', sep=';', encoding='utf-8')
print(f'   Total de linhas: {len(df_backup)} (incluindo header)')

df_backup['data_esperada'] = df_backup['Data esperada'].apply(converter_data_br)
df_backup['valor_receber'] = df_backup['Valor a receber'].apply(limpar_valor_brasileiro)
df_backup['valor_pagar'] = df_backup['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
df_backup['historico_norm'] = df_backup['Histórico'].apply(normalizar_texto)
df_backup['chave'] = df_backup.apply(gerar_chave_duplicata, axis=1)

print(f'   Registros válidos: {len(df_backup)}')
print(f'   Chaves únicas: {df_backup["chave"].nunique()}')
print(f'   Duplicatas internas: {len(df_backup) - df_backup["chave"].nunique()}')

# Carregar export
print('\n📂 Carregando export.csv...')
df_export = pd.read_csv(f'{PASTA_BASE}/export.csv', sep=';', encoding='utf-8')
print(f'   Total de linhas: {len(df_export)} (incluindo header)')

df_export['data_esperada'] = df_export['Data esperada'].apply(converter_data_br)
df_export['valor_receber'] = df_export['Valor a receber'].apply(limpar_valor_brasileiro)
df_export['valor_pagar'] = df_export['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
df_export['historico_norm'] = df_export['Histórico'].apply(normalizar_texto)
df_export['chave'] = df_export.apply(gerar_chave_duplicata, axis=1)

print(f'   Registros válidos: {len(df_export)}')
print(f'   Chaves únicas: {df_export["chave"].nunique()}')
print(f'   Duplicatas internas: {len(df_export) - df_export["chave"].nunique()}')

# Filtro de data no export
df_export_filtrado = df_export[df_export['data_esperada'] > '2025-07-23'].copy()
print(f'   Após filtro > 2025-07-23: {len(df_export_filtrado)} registros')

# Cruzamento
chaves_backup = set(df_backup['chave'])
chaves_export = set(df_export_filtrado['chave'])
chaves_comuns = chaves_backup & chaves_export

print(f'\n🔄 CRUZAMENTO:')
print(f'   Chaves no backup: {len(chaves_backup)}')
print(f'   Chaves no export filtrado: {len(chaves_export)}')
print(f'   Chaves em comum: {len(chaves_comuns)}')
print(f'   Chaves únicas do export: {len(chaves_export - chaves_backup)}')

# União simulada
df_uniao = pd.concat([df_backup, df_export_filtrado], ignore_index=True)
print(f'\n📊 UNIÃO BRUTA:')
print(f'   Total de registros: {len(df_uniao)}')
print(f'   Chaves únicas: {df_uniao["chave"].nunique()}')

df_final = df_uniao.drop_duplicates(subset=['chave'])
print(f'   Após remover duplicatas: {len(df_final)}')

print(f'\n❌ PERDA TOTAL: {len(df_backup) + len(df_export) - len(df_final)} registros')
print(f'   Backup perdido: {len(df_backup) - len(df_backup["chave"].unique())}')
print(f'   Export perdido: {len(df_export) - len(df_export["chave"].unique())}')
