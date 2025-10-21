#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
União Simples: backup_total + export (TUDO)
- Une os 2 arquivos completos
- Deduplica apenas registros REALMENTE iguais
- Chave: data + valor + histórico completo + sequência
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

def gerar_chave_completa(row):
    """Chave mais rigorosa: data + valor + histórico COMPLETO + sequência"""
    chave_data = row.get('data_esperada', '') or 'sem_data'
    chave_valor = abs(row.get('valor_receber', 0)) + abs(row.get('valor_pagar', 0))
    chave_hist = row.get('historico_norm', '') or 'sem_hist'  # SEM truncar
    chave_seq = row.get('sequencia_norm', '') or 'sem_seq'
    chave = f"{chave_data}|{chave_valor:.2f}|{chave_hist}|{chave_seq}"
    return hashlib.md5(chave.encode()).hexdigest()

def processar_arquivo(caminho, nome):
    print(f'📂 Processando {nome}...')
    df = pd.read_csv(caminho, sep=';', encoding='utf-8')
    
    # Normalizar colunas
    df['data_esperada'] = df['Data esperada'].apply(converter_data_br)
    df['data_realizada'] = df['Data realizada'].apply(converter_data_br)
    df['valor_receber'] = df['Valor a receber'].apply(limpar_valor_brasileiro)
    df['valor_recebido'] = df['Valor recebido'].apply(limpar_valor_brasileiro)
    df['valor_pagar'] = df['Valor a pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    df['valor_pago'] = df['Valor pago'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
    
    # Copiar colunas originais
    df['plano_conta'] = df['Plano de contas']
    df['historico'] = df['Histórico']
    df['sequencia'] = df['Sequência']
    df['conta_bancaria'] = df['Conta bancária']
    df['status'] = df['Status']
    df['cliente_fornecedor'] = df['Cliente/Fornecedor']
    df['meio_pagamento'] = df['Meio de pagamento']
    df['centro_custo'] = df['Centro de custo']
    df['projeto'] = df['Projeto']
    df['data_alteracao'] = df['Data da última alteração']
    df['codigo_conciliacao'] = df['Código da conciliação bancária']
    
    # Normalizar para chave
    df['historico_norm'] = df['historico'].apply(normalizar_texto)
    df['sequencia_norm'] = df['sequencia'].apply(normalizar_texto)
    
    # Marcar origem
    df['fonte'] = nome
    
    print(f'   ✅ {len(df)} registros carregados')
    return df

def main():
    print('🚀 UNIÃO SIMPLES: backup_total + export (COMPLETO)')
    print('=' * 60)
    
    # Processar arquivos
    df_backup = processar_arquivo(ARQUIVO_BACKUP, 'backup_total')
    df_export = processar_arquivo(ARQUIVO_EXPORT, 'export')
    
    # União TOTAL (sem filtro de data)
    print(f'\n🔗 Unindo arquivos...')
    df_uniao = pd.concat([df_backup, df_export], ignore_index=True)
    print(f'   📊 Total bruto: {len(df_uniao)} registros')
    
    # Gerar chave de deduplicação (mais rigorosa)
    print(f'\n🔑 Gerando chaves de deduplicação...')
    df_uniao['chave'] = df_uniao.apply(gerar_chave_completa, axis=1)
    
    chaves_unicas = df_uniao['chave'].nunique()
    duplicatas = len(df_uniao) - chaves_unicas
    
    print(f'   📊 Chaves únicas: {chaves_unicas}')
    print(f'   🔄 Duplicatas encontradas: {duplicatas}')
    
    # Remover duplicatas (mantém primeira ocorrência)
    df_final = df_uniao.drop_duplicates(subset=['chave'], keep='first')
    
    # Ordenar por data
    df_final = df_final.sort_values(['data_esperada', 'data_realizada'], na_position='last')
    
    print(f'\n✅ Total final: {len(df_final)} registros únicos')
    
    # Estatísticas
    total_receber = df_final['valor_receber'].sum()
    total_pagar = df_final['valor_pagar'].sum()
    data_min = df_final['data_esperada'].min()
    data_max = df_final['data_esperada'].max()
    
    # Contar por fonte
    backup_count = len(df_final[df_final['fonte'] == 'backup_total'])
    export_count = len(df_final[df_final['fonte'] == 'export'])
    
    print(f'\n📊 RESUMO:')
    print(f'   📅 Período: {data_min} até {data_max}')
    print(f'   📂 Do backup_total: {backup_count} registros')
    print(f'   📂 Do export: {export_count} registros')
    print(f'   💚 Total a receber: R$ {total_receber:,.2f}')
    print(f'   💙 Total a pagar: R$ {total_pagar:,.2f}')
    print(f'   📈 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}')
    
    # Salvar
    df_final.to_csv(ARQUIVO_ARQUIVAO, index=False, sep=';', encoding='utf-8')
    df_final.to_csv(ARQUIVO_FINAL, index=False, sep=';', encoding='utf-8')
    
    print(f'\n✅ Arquivos gerados:')
    print(f'   📁 {ARQUIVO_ARQUIVAO}')
    print(f'   📁 {ARQUIVO_FINAL}')
    print(f'\n🎯 Matemática:')
    print(f'   Backup: {len(df_backup)} + Export: {len(df_export)} = {len(df_backup) + len(df_export)} linhas')
    print(f'   Duplicatas removidas: {duplicatas}')
    print(f'   Resultado: {len(df_final)} registros únicos ✅')

if __name__ == "__main__":
    main()
