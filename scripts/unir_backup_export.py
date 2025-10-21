#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
União Completa: backup_total.csv + export.csv
- backup_total: 01/10/2020 até 23/07/2025
- export: 22/08/2022 até 25/09/2029
- Estratégia: União + filtro export após 23/07/2025 + deduplicação
"""
import pandas as pd
import re
from datetime import datetime
import hashlib

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'
ARQUIVO_BACKUP = f'{PASTA_BASE}/backup_total.csv'
ARQUIVO_EXPORT = f'{PASTA_BASE}/export.csv'
ARQUIVO_ARQUIVAO = f'{PASTA_BASE}/arquivao_completo.csv'
ARQUIVO_FINAL = f'{PASTA_BASE}/arquivao_final.csv'

DATA_CORTE = '2025-07-23'  # Última data do backup_total

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
    return hashlib.md5(chave.encode()).hexdigest()[:12]

def processar_backup():
    print('📂 Processando backup_total.csv...')
    df = pd.read_csv(ARQUIVO_BACKUP, sep=';', encoding='utf-8')
    df['data_esperada'] = df['Data esperada'].apply(converter_data_br)
    df['data_realizada'] = df['Data realizada'].apply(converter_data_br)
    df['valor_receber'] = df['Valor a receber'].apply(limpar_valor_brasileiro)
    df['valor_recebido'] = df['Valor recebido'].apply(limpar_valor_brasileiro)
    df['valor_pagar'] = df['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['valor_pago'] = df['Valor pago'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['plano_conta'] = df['Plano de contas']
    df['historico'] = df['Histórico']
    df['historico_norm'] = df['historico'].apply(normalizar_texto)
    df['sequencia'] = df['Sequência']
    df['conta_bancaria'] = df['Conta bancária']
    df['status'] = df['Status']
    df['cliente_fornecedor'] = df['Cliente/Fornecedor']
    df['meio_pagamento'] = df['Meio de pagamento']
    df['centro_custo'] = df['Centro de custo']
    df['projeto'] = df['Projeto']
    df['data_alteracao'] = df['Data da última alteração']
    df['codigo_conciliacao'] = df['Código da conciliação bancária']
    df['fonte'] = 'backup_total'
    print(f'   ✅ {len(df)} registros carregados')
    return df

def processar_export():
    print('📂 Processando export.csv...')
    df = pd.read_csv(ARQUIVO_EXPORT, sep=';', encoding='utf-8')
    df['data_esperada'] = df['Data esperada'].apply(converter_data_br)
    df['data_realizada'] = df['Data realizada'].apply(converter_data_br)
    df['valor_receber'] = df['Valor a receber'].apply(limpar_valor_brasileiro)
    df['valor_recebido'] = df['Valor recebido'].apply(limpar_valor_brasileiro)
    df['valor_pagar'] = df['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['valor_pago'] = df['Valor pago'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['plano_conta'] = df['Plano de contas']
    df['historico'] = df['Histórico']
    df['historico_norm'] = df['historico'].apply(normalizar_texto)
    df['sequencia'] = df['Sequência']
    df['conta_bancaria'] = df['Conta bancária']
    df['status'] = df['Status']
    df['cliente_fornecedor'] = df['Cliente/Fornecedor']
    df['meio_pagamento'] = df['Meio de pagamento']
    df['centro_custo'] = df['Centro de custo']
    df['projeto'] = df['Projeto']
    df['data_alteracao'] = df['Data da última alteração']
    df['codigo_conciliacao'] = df['Código da conciliação bancária']
    df['fonte'] = 'export'
    # Filtrar apenas após data de corte
    df_filtrado = df[df['data_esperada'] > DATA_CORTE].copy()
    print(f'   ✅ {len(df)} registros carregados, {len(df_filtrado)} após {DATA_CORTE}')
    return df_filtrado

def main():
    print('🚀 UNIÃO COMPLETA: backup_total + export')
    print('=' * 60)
    
    # Processar arquivos
    df_backup = processar_backup()
    df_export = processar_export()
    
    # Gerar chaves para deduplicação
    print('\n🔑 Gerando chaves de deduplicação...')
    df_backup['chave'] = df_backup.apply(gerar_chave_duplicata, axis=1)
    df_export['chave'] = df_export.apply(gerar_chave_duplicata, axis=1)
    
    # Identificar duplicatas entre backup e export
    chaves_backup = set(df_backup['chave'])
    df_export_novos = df_export[~df_export['chave'].isin(chaves_backup)].copy()
    
    print(f'   📊 Backup: {len(df_backup)} registros')
    print(f'   📊 Export após corte: {len(df_export)} registros')
    print(f'   📊 Export novos (únicos): {len(df_export_novos)} registros')
    print(f'   📊 Duplicatas removidas: {len(df_export) - len(df_export_novos)}')
    
    # Unir tudo
    df_final = pd.concat([df_backup, df_export_novos], ignore_index=True)
    
    # Remover duplicatas exatas pela chave
    df_final = df_final.drop_duplicates(subset=['chave'])
    
    # Ordenar por data
    df_final = df_final.sort_values(['data_esperada', 'data_realizada'])
    
    print(f'\n✅ Total final: {len(df_final)} registros únicos')
    
    # Estatísticas
    total_receber = df_final['valor_receber'].sum()
    total_pagar = df_final['valor_pagar'].sum()
    data_min = df_final['data_esperada'].min()
    data_max = df_final['data_esperada'].max()
    
    print(f'\n📊 RESUMO:')
    print(f'   📅 Período: {data_min} até {data_max}')
    print(f'   💚 Total a receber: R$ {total_receber:,.2f}')
    print(f'   💙 Total a pagar: R$ {total_pagar:,.2f}')
    print(f'   📈 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}')
    
    # Salvar
    df_final.to_csv(ARQUIVO_ARQUIVAO, index=False, sep=';', encoding='utf-8')
    df_final.to_csv(ARQUIVO_FINAL, index=False, sep=';', encoding='utf-8')
    
    print(f'\n✅ Arquivos gerados:')
    print(f'   📁 {ARQUIVO_ARQUIVAO}')
    print(f'   📁 {ARQUIVO_FINAL}')

if __name__ == "__main__":
    main()
