#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
DEDUPLICAÇÃO INTELIGENTE
- Chave: sequencia + data_esperada + plano_conta + historico + centro_custo + valor
- Remove apenas registros REALMENTE duplicados
"""
import pandas as pd
import re
import hashlib

PASTA_BASE = 'd:/projetos/pulso_finance/data/base'
ARQUIVO_UNIAO = f'{PASTA_BASE}/uniao_64k.csv'
ARQUIVO_FINAL = f'{PASTA_BASE}/arquivao_final.csv'

def normalizar_texto(texto):
    """Normaliza texto para comparação"""
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
    """
    Gera chave única baseada em:
    - Sequência (identifica parcela)
    - Data esperada (vencimento)
    - Plano de contas
    - Histórico
    - Centro de custo
    - Valor total (receber + pagar)
    """
    sequencia = normalizar_texto(row.get('sequencia', ''))
    data = row.get('data_esperada', '') or 'sem_data'
    plano = normalizar_texto(row.get('plano_conta', ''))
    historico = normalizar_texto(row.get('historico', ''))
    centro = normalizar_texto(row.get('centro_custo', ''))
    valor = abs(row.get('valor_receber', 0)) + abs(row.get('valor_pagar', 0))
    
    # Chave completa
    chave = f"{sequencia}|{data}|{plano}|{historico}|{centro}|{valor:.2f}"
    
    # Hash para facilitar comparação
    return hashlib.md5(chave.encode()).hexdigest()

def main():
    print('🔍 DEDUPLICAÇÃO INTELIGENTE')
    print('=' * 60)
    
    # Carregar união 64k
    print(f'\n📂 Carregando uniao_64k.csv...')
    df = pd.read_csv(ARQUIVO_UNIAO, sep=';', encoding='utf-8')
    print(f'   ✅ {len(df)} registros carregados')
    
    # Gerar chave de deduplicação
    print(f'\n🔑 Gerando chaves de deduplicação...')
    print(f'   📌 Campos usados: sequencia + data_esperada + plano_conta + historico + centro_custo + valor')
    
    df['chave_dedup'] = df.apply(gerar_chave_deduplicacao, axis=1)
    
    chaves_unicas = df['chave_dedup'].nunique()
    duplicatas = len(df) - chaves_unicas
    taxa_duplicacao = (duplicatas / len(df)) * 100
    
    print(f'\n📊 ANÁLISE DE DUPLICATAS:')
    print(f'   Total de registros: {len(df)}')
    print(f'   Chaves únicas: {chaves_unicas}')
    print(f'   Duplicatas encontradas: {duplicatas}')
    print(f'   Taxa de duplicação: {taxa_duplicacao:.1f}%')
    
    # Analisar duplicatas por fonte
    duplicatas_por_chave = df[df.duplicated(subset=['chave_dedup'], keep=False)]
    if len(duplicatas_por_chave) > 0:
        print(f'\n🔄 ORIGEM DAS DUPLICATAS:')
        origem_backup = len(duplicatas_por_chave[duplicatas_por_chave['fonte'] == 'backup_total'])
        origem_export = len(duplicatas_por_chave[duplicatas_por_chave['fonte'] == 'export'])
        print(f'   Do backup_total: {origem_backup} registros')
        print(f'   Do export: {origem_export} registros')
    
    # Remover duplicatas (mantém primeira ocorrência = prioriza backup_total)
    print(f'\n🧹 Removendo duplicatas...')
    df_final = df.drop_duplicates(subset=['chave_dedup'], keep='first')
    
    # Contar origem dos registros mantidos
    backup_mantidos = len(df_final[df_final['fonte'] == 'backup_total'])
    export_mantidos = len(df_final[df_final['fonte'] == 'export'])
    
    print(f'   ✅ Registros mantidos: {len(df_final)}')
    print(f'   📂 Do backup_total: {backup_mantidos}')
    print(f'   📂 Do export: {export_mantidos}')
    
    # Estatísticas finais
    total_receber = df_final['valor_receber'].sum()
    total_pagar = df_final['valor_pagar'].sum()
    data_min = df_final['data_esperada'].min()
    data_max = df_final['data_esperada'].max()
    
    print(f'\n📊 RESUMO FINAL:')
    print(f'   📅 Período: {data_min} até {data_max}')
    print(f'   💚 Total a receber: R$ {total_receber:,.2f}')
    print(f'   💙 Total a pagar: R$ {total_pagar:,.2f}')
    print(f'   📈 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}')
    
    # Remover coluna auxiliar
    df_final = df_final.drop(columns=['chave_dedup'])
    
    # Salvar
    df_final.to_csv(ARQUIVO_FINAL, index=False, sep=';', encoding='utf-8')
    
    print(f'\n✅ Arquivo final gerado: {ARQUIVO_FINAL}')
    print(f'📝 Total de linhas: {len(df_final)}')
    print(f'\n🎯 RESULTADO:')
    print(f'   Início: 64.278 registros')
    print(f'   Duplicatas removidas: {duplicatas}')
    print(f'   Final: {len(df_final)} registros únicos ✅')

if __name__ == "__main__":
    main()
