#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Gera arquivao_completo.csv e arquivao_final.csv a partir do backup_total.csv
- Normaliza valores (pagar/pago negativos)
- Normaliza datas e textos
- Remove duplicatas exatas
"""
import pandas as pd
import re
from datetime import datetime
import hashlib

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'
ARQUIVO_BACKUP = f'{PASTA_BASE}/backup_total.csv'
ARQUIVO_ARQUIVAO = f'{PASTA_BASE}/arquivao_completo.csv'
ARQUIVO_FINAL = f'{PASTA_BASE}/arquivao_final.csv'

# Funções auxiliares
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
    hash_chave = hashlib.md5(chave.encode()).hexdigest()[:12]
    return hash_chave

def main():
    print('🔄 Lendo backup_total.csv...')
    df = pd.read_csv(ARQUIVO_BACKUP, sep=';', encoding='utf-8')
    # Normalizar datas
    df['data_esperada'] = df['Data esperada'].apply(converter_data_br)
    df['data_realizada'] = df['Data realizada'].apply(converter_data_br)
    # Normalizar valores
    df['valor_receber'] = df['Valor a receber'].apply(limpar_valor_brasileiro)
    df['valor_recebido'] = df['Valor recebido'].apply(limpar_valor_brasileiro)
    df['valor_pagar'] = df['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['valor_pago'] = df['Valor pago'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    # Normalizar textos
    df['historico_norm'] = df['Histórico'].apply(normalizar_texto)
    # Gerar chave de duplicata
    df['chave'] = df.apply(gerar_chave_duplicata, axis=1)
    # Remover duplicatas exatas pela chave
    df_final = df.drop_duplicates(subset=['chave'])
    print(f"✅ Registros finais: {len(df_final)} (removidas duplicatas exatas)")
    # Salvar arquivão e final
    df_final.to_csv(ARQUIVO_ARQUIVAO, index=False, sep=';', encoding='utf-8')
    df_final.to_csv(ARQUIVO_FINAL, index=False, sep=';', encoding='utf-8')
    print(f"✅ Arquivos gerados: {ARQUIVO_ARQUIVAO} e {ARQUIVO_FINAL}")

if __name__ == "__main__":
    main()
