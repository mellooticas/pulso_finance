#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
UNIÃO SIMPLES: backup_total.csv + export.csv
- Apenas une os 2 arquivos
- Normaliza valores (pagar/pago negativos)
- Normaliza datas para YYYY-MM-DD
- SEM deduplicação
"""
import pandas as pd
import re
from datetime import datetime

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'
ARQUIVO_BACKUP = f'{PASTA_BASE}/backup_total.csv'
ARQUIVO_EXPORT = f'{PASTA_BASE}/export.csv'
ARQUIVO_UNIAO = f'{PASTA_BASE}/uniao_64k.csv'

def limpar_valor_brasileiro(valor_str):
    """Converte string monetária brasileira para float"""
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
    """Converte data DD/MM/YYYY para YYYY-MM-DD"""
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

def processar_arquivo(caminho, nome):
    """Processa arquivo CSV normalizando valores e datas"""
    print(f'📂 Processando {nome}...')
    df = pd.read_csv(caminho, sep=';', encoding='utf-8')
    
    # Normalizar datas
    df['data_esperada'] = df['Data esperada'].apply(converter_data_br)
    df['data_realizada'] = df['Data realizada'].apply(converter_data_br)
    
    # Normalizar valores
    df['valor_receber'] = df['Valor a receber'].apply(limpar_valor_brasileiro)
    df['valor_recebido'] = df['Valor recebido'].apply(limpar_valor_brasileiro)
    
    # IMPORTANTE: pagar e pago sempre negativos
    df['valor_pagar'] = df['Valor a pagar'].apply(
        lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0
    )
    df['valor_pago'] = df['Valor pago'].apply(
        lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0
    )
    
    # Renomear colunas para padronizar
    df = df.rename(columns={
        'Plano de contas': 'plano_conta',
        'Histórico': 'historico',
        'Sequência': 'sequencia',
        'Conta bancária': 'conta_bancaria',
        'Status': 'status',
        'Cliente/Fornecedor': 'cliente_fornecedor',
        'Meio de pagamento': 'meio_pagamento',
        'Centro de custo': 'centro_custo',
        'Projeto': 'projeto',
        'Data da última alteração': 'data_alteracao',
        'Código da conciliação bancária': 'codigo_conciliacao'
    })
    
    # Marcar origem
    df['fonte'] = nome
    
    print(f'   ✅ {len(df)} registros carregados')
    return df

def main():
    print('🚀 UNIÃO SIMPLES: backup_total + export')
    print('=' * 60)
    
    # Processar arquivos
    df_backup = processar_arquivo(ARQUIVO_BACKUP, 'backup_total')
    df_export = processar_arquivo(ARQUIVO_EXPORT, 'export')
    
    # União simples (concatenação)
    print(f'\n🔗 Unindo arquivos...')
    df_uniao = pd.concat([df_backup, df_export], ignore_index=True)
    
    # Ordenar por data
    df_uniao = df_uniao.sort_values(['data_esperada', 'data_realizada'], na_position='last')
    
    print(f'   ✅ Total: {len(df_uniao)} registros')
    
    # Estatísticas
    total_receber = df_uniao['valor_receber'].sum()
    total_pagar = df_uniao['valor_pagar'].sum()
    data_min = df_uniao['data_esperada'].min()
    data_max = df_uniao['data_esperada'].max()
    
    print(f'\n📊 RESUMO:')
    print(f'   📅 Período: {data_min} até {data_max}')
    print(f'   💚 Total a receber: R$ {total_receber:,.2f}')
    print(f'   💙 Total a pagar: R$ {total_pagar:,.2f}')
    print(f'   📈 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}')
    
    # Contar por fonte
    backup_count = len(df_uniao[df_uniao['fonte'] == 'backup_total'])
    export_count = len(df_uniao[df_uniao['fonte'] == 'export'])
    print(f'\n📂 ORIGEM DOS DADOS:')
    print(f'   Backup: {backup_count} registros')
    print(f'   Export: {export_count} registros')
    
    # Salvar
    df_uniao.to_csv(ARQUIVO_UNIAO, index=False, sep=';', encoding='utf-8')
    
    print(f'\n✅ Arquivo gerado: {ARQUIVO_UNIAO}')
    print(f'📝 Total de linhas: {len(df_uniao)} (sem deduplicação)')

if __name__ == "__main__":
    main()
