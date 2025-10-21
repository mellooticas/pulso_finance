#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Análise de Duplicatas - Mostrar exemplos
"""
import pandas as pd
import re
import hashlib

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'

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

def gerar_chave_deduplicacao(row):
    sequencia = normalizar_texto(row.get('sequencia', ''))
    data = row.get('data_esperada', '') or 'sem_data'
    plano = normalizar_texto(row.get('plano_conta', ''))
    historico = normalizar_texto(row.get('historico', ''))
    centro = normalizar_texto(row.get('centro_custo', ''))
    valor = abs(row.get('valor_receber', 0)) + abs(row.get('valor_pagar', 0))
    chave = f"{sequencia}|{data}|{plano}|{historico}|{centro}|{valor:.2f}"
    return hashlib.md5(chave.encode()).hexdigest()

print('🔍 ANÁLISE DE DUPLICATAS - EXEMPLOS')
print('=' * 80)

# Carregar arquivo uniao_64k
df = pd.read_csv(f'{PASTA_BASE}/uniao_64k.csv', sep=';', encoding='utf-8')
print(f'\n📂 Carregado: {len(df)} registros')

# Gerar chave
df['chave_dedup'] = df.apply(gerar_chave_deduplicacao, axis=1)

# Encontrar duplicatas
duplicatas = df[df.duplicated(subset=['chave_dedup'], keep=False)]
print(f'📊 Total de registros duplicados: {len(duplicatas)}')

# Contar quantas chaves têm duplicatas
chaves_duplicadas = duplicatas['chave_dedup'].value_counts()
print(f'🔑 Chaves com duplicatas: {len(chaves_duplicadas)}')

# Mostrar exemplos
print('\n' + '=' * 80)
print('📋 EXEMPLOS DE DUPLICATAS (10 primeiros grupos)')
print('=' * 80)

contador = 0
for chave, qtd in chaves_duplicadas.head(10).items():
    contador += 1
    registros = df[df['chave_dedup'] == chave]
    
    print(f'\n🔄 GRUPO {contador} - {qtd} registros duplicados')
    print('-' * 80)
    
    for idx, row in registros.iterrows():
        print(f'  Fonte: {row["fonte"]:15} | Data: {row["data_esperada"]} | Valor: R$ {row["valor_receber"] + row["valor_pagar"]:>10.2f}')
        print(f'    Sequência: {row["sequencia"]}')
        print(f'    Plano: {row["plano_conta"][:60]}')
        print(f'    Histórico: {row["historico"][:60]}')
        print(f'    Centro: {row["centro_custo"]}')
        print()

# Análise por período
print('\n' + '=' * 80)
print('📊 ANÁLISE DE DUPLICATAS POR PERÍODO')
print('=' * 80)

duplicatas['data_analise'] = pd.to_datetime(duplicatas['data_esperada'], errors='coerce')

dup_ate_2022 = duplicatas[duplicatas['data_analise'] <= '2022-12-31']
dup_de_2023 = duplicatas[duplicatas['data_analise'] >= '2023-01-01']

print(f'\nDuplicatas até 31/12/2022: {len(dup_ate_2022)} registros')
print(f'  Do backup_total: {len(dup_ate_2022[dup_ate_2022["fonte"] == "backup_total"])}')
print(f'  Do export: {len(dup_ate_2022[dup_ate_2022["fonte"] == "export"])}')

print(f'\nDuplicatas de 01/01/2023+: {len(dup_de_2023)} registros')
print(f'  Do backup_total: {len(dup_de_2023[dup_de_2023["fonte"] == "backup_total"])}')
print(f'  Do export: {len(dup_de_2023[dup_de_2023["fonte"] == "export"])}')

# Duplicatas internas (mesmo arquivo)
print('\n' + '=' * 80)
print('🔄 DUPLICATAS INTERNAS (MESMO ARQUIVO)')
print('=' * 80)

# Backup_total duplicatas internas
backup_dups = df[df['fonte'] == 'backup_total']
backup_dups['chave_temp'] = backup_dups.apply(gerar_chave_deduplicacao, axis=1)
backup_dups_internas = backup_dups[backup_dups.duplicated(subset=['chave_temp'], keep=False)]

print(f'\nBackup_total - duplicatas internas: {len(backup_dups_internas)} registros')
print(f'  Chaves duplicadas: {backup_dups_internas["chave_temp"].nunique()}')

# Export duplicatas internas
export_dups = df[df['fonte'] == 'export']
export_dups['chave_temp'] = export_dups.apply(gerar_chave_deduplicacao, axis=1)
export_dups_internas = export_dups[export_dups.duplicated(subset=['chave_temp'], keep=False)]

print(f'\nExport - duplicatas internas: {len(export_dups_internas)} registros')
print(f'  Chaves duplicadas: {export_dups_internas["chave_temp"].nunique()}')

# Mostrar exemplo de duplicata interna do backup_total
if len(backup_dups_internas) > 0:
    print('\n' + '=' * 80)
    print('📋 EXEMPLO DE DUPLICATA INTERNA DO BACKUP_TOTAL')
    print('=' * 80)
    
    primeira_chave = backup_dups_internas['chave_temp'].value_counts().index[0]
    exemplos_backup = backup_dups[backup_dups['chave_temp'] == primeira_chave]
    
    print(f'\nChave: {primeira_chave}')
    print(f'Registros encontrados: {len(exemplos_backup)}')
    print()
    
    for idx, row in exemplos_backup.iterrows():
        print(f'  Data: {row["data_esperada"]} | Valor: R$ {row["valor_receber"] + row["valor_pagar"]:>10.2f}')
        print(f'    Sequência: {row["sequencia"]}')
        print(f'    Plano: {row["plano_conta"]}')
        print(f'    Histórico: {row["historico"][:80]}')
        print(f'    Centro: {row["centro_custo"]}')
        print()
