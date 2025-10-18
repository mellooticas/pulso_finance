#!/usr/bin/env python3
"""
Análise de Duplicidades - Yampa Relatórios
==========================================

Este script analisa os arquivos yampa_relatorio.csv e yampa_relatorio_antigo.csv
para identificar duplicidades e preparar dados limpos para inserção no banco.

Critérios de análise:
1. Duplicatas exatas (todas as colunas iguais)
2. Duplicatas por chaves únicas (data + histórico + valor)
3. Sobreposição temporal entre arquivos
4. Inconsistências nos dados
"""

import pandas as pd
import numpy as np
from pathlib import Path
from datetime import datetime
import hashlib

# Configurações
DATA_DIR = Path("../../data/base")
ARQUIVO_ATUAL = DATA_DIR / "yampa_relatorio.csv"
ARQUIVO_ANTIGO = DATA_DIR / "yampa_relatorio_antigo.csv"

def load_csv_safe(filepath, encoding='utf-8'):
    """Carrega CSV com tratamento de erros de encoding"""
    try:
        return pd.read_csv(filepath, sep=';', encoding=encoding)
    except UnicodeDecodeError:
        print(f"Tentando encoding latin1 para {filepath}")
        return pd.read_csv(filepath, sep=';', encoding='latin1')
    except Exception as e:
        print(f"Erro ao carregar {filepath}: {e}")
        return None

def clean_dataframe(df):
    """Limpa e padroniza o DataFrame"""
    if df is None:
        return None
    
    # Remove espaços extras das colunas string
    for col in df.select_dtypes(include=['object']).columns:
        df[col] = df[col].astype(str).str.strip()
    
    # Converte datas
    date_columns = ['Data esperada', 'Data realizada', 'Data da última alteração']
    for col in date_columns:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], format='%d/%m/%Y', errors='coerce')
    
    # Converte valores monetários
    value_columns = ['Valor a receber', 'Valor recebido', 'Valor a pagar', 'Valor pago']
    for col in value_columns:
        if col in df.columns:
            # Remove vírgulas e converte para float
            df[col] = df[col].astype(str).str.replace(',', '.').replace('', '0')
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
    
    return df

def create_unique_key(row):
    """Cria uma chave única baseada nos campos principais"""
    key_fields = [
        str(row.get('Data realizada', '')),
        str(row.get('Histórico', '')),
        str(row.get('Valor a pagar', 0)),
        str(row.get('Valor pago', 0)),
        str(row.get('Valor a receber', 0)),
        str(row.get('Valor recebido', 0)),
        str(row.get('Plano de contas', ''))
    ]
    key_string = '|'.join(key_fields)
    return hashlib.md5(key_string.encode()).hexdigest()

def analyze_duplicates():
    """Função principal de análise"""
    print("🔍 ANÁLISE DE DUPLICIDADES - YAMPA RELATÓRIOS")
    print("=" * 60)
    
    # 1. Carregar arquivos
    print("\n📂 Carregando arquivos...")
    df_atual = load_csv_safe(ARQUIVO_ATUAL)
    df_antigo = load_csv_safe(ARQUIVO_ANTIGO)
    
    if df_atual is None or df_antigo is None:
        print("❌ Erro ao carregar arquivos!")
        return
    
    print(f"✅ Arquivo atual: {len(df_atual):,} registros")
    print(f"✅ Arquivo antigo: {len(df_antigo):,} registros")
    
    # 2. Limpar dados
    print("\n🧹 Limpando dados...")
    df_atual_clean = clean_dataframe(df_atual.copy())
    df_antigo_clean = clean_dataframe(df_antigo.copy())
    
    # 3. Adicionar chaves únicas
    print("\n🔑 Criando chaves únicas...")
    df_atual_clean['unique_key'] = df_atual_clean.apply(create_unique_key, axis=1)
    df_antigo_clean['unique_key'] = df_antigo_clean.apply(create_unique_key, axis=1)
    
    # 4. Análise de duplicatas
    print("\n📊 ANÁLISE DE DUPLICATAS")
    print("-" * 40)
    
    # Duplicatas dentro do arquivo atual
    duplicatas_atual = df_atual_clean[df_atual_clean.duplicated(subset=['unique_key'], keep=False)]
    print(f"📋 Duplicatas no arquivo atual: {len(duplicatas_atual):,}")
    
    # Duplicatas dentro do arquivo antigo
    duplicatas_antigo = df_antigo_clean[df_antigo_clean.duplicated(subset=['unique_key'], keep=False)]
    print(f"📋 Duplicatas no arquivo antigo: {len(duplicatas_antigo):,}")
    
    # Duplicatas entre arquivos
    keys_atual = set(df_atual_clean['unique_key'])
    keys_antigo = set(df_antigo_clean['unique_key'])
    keys_comum = keys_atual.intersection(keys_antigo)
    
    print(f"🔄 Registros em comum entre arquivos: {len(keys_comum):,}")
    print(f"📈 Registros únicos no atual: {len(keys_atual - keys_antigo):,}")
    print(f"📉 Registros únicos no antigo: {len(keys_antigo - keys_atual):,}")
    
    # 5. Análise temporal
    print("\n📅 ANÁLISE TEMPORAL")
    print("-" * 40)
    
    if not df_atual_clean['Data realizada'].isna().all():
        data_min_atual = df_atual_clean['Data realizada'].min()
        data_max_atual = df_atual_clean['Data realizada'].max()
        print(f"📊 Arquivo atual: {data_min_atual.date()} até {data_max_atual.date()}")
    
    if not df_antigo_clean['Data realizada'].isna().all():
        data_min_antigo = df_antigo_clean['Data realizada'].min()
        data_max_antigo = df_antigo_clean['Data realizada'].max()
        print(f"📊 Arquivo antigo: {data_min_antigo.date()} até {data_max_antigo.date()}")
    
    # 6. Criar dataset consolidado
    print("\n🔄 CRIANDO DATASET CONSOLIDADO")
    print("-" * 40)
    
    # Combinar DataFrames
    df_atual_clean['fonte'] = 'atual'
    df_antigo_clean['fonte'] = 'antigo'
    
    df_combined = pd.concat([df_atual_clean, df_antigo_clean], ignore_index=True)
    
    # Remover duplicatas (manter o mais recente - do arquivo atual)
    df_consolidated = df_combined.sort_values(['fonte', 'Data da última alteração'], ascending=[True, False])
    df_consolidated = df_consolidated.drop_duplicates(subset=['unique_key'], keep='first')
    
    print(f"📊 Total antes da consolidação: {len(df_combined):,}")
    print(f"✅ Total após remoção de duplicatas: {len(df_consolidated):,}")
    print(f"🗑️ Duplicatas removidas: {len(df_combined) - len(df_consolidated):,}")
    
    # 7. Análise de qualidade
    print("\n🎯 ANÁLISE DE QUALIDADE DOS DADOS")
    print("-" * 40)
    
    # Campos obrigatórios faltantes
    campos_obrigatorios = ['Data realizada', 'Histórico', 'Plano de contas']
    for campo in campos_obrigatorios:
        nulos = df_consolidated[campo].isna().sum()
        print(f"❌ {campo}: {nulos:,} registros nulos ({nulos/len(df_consolidated)*100:.1f}%)")
    
    # Valores zerados
    valores_zero = (
        (df_consolidated['Valor a receber'] == 0) & 
        (df_consolidated['Valor recebido'] == 0) & 
        (df_consolidated['Valor a pagar'] == 0) & 
        (df_consolidated['Valor pago'] == 0)
    ).sum()
    print(f"⚠️ Registros com todos os valores zerados: {valores_zero:,}")
    
    # 8. Salvar resultado
    output_file = DATA_DIR / "yampa_consolidated.csv"
    df_final = df_consolidated.drop(['unique_key', 'fonte'], axis=1)
    df_final.to_csv(output_file, sep=';', index=False, encoding='utf-8')
    
    print(f"\n💾 Arquivo consolidado salvo em: {output_file}")
    print(f"📊 Registros finais: {len(df_final):,}")
    
    # 9. Resumo para SQL
    print("\n📋 RESUMO PARA GERAÇÃO SQL")
    print("-" * 40)
    print(f"✅ Arquivo limpo: yampa_consolidated.csv")
    print(f"📊 Total de registros: {len(df_final):,}")
    print(f"📅 Período: {df_final['Data realizada'].min().date()} a {df_final['Data realizada'].max().date()}")
    
    # Estatísticas por tipo
    receitas = len(df_final[(df_final['Valor a receber'] > 0) | (df_final['Valor recebido'] > 0)])
    despesas = len(df_final[(df_final['Valor a pagar'] > 0) | (df_final['Valor pago'] > 0)])
    
    print(f"💰 Receitas: {receitas:,} registros")
    print(f"💸 Despesas: {despesas:,} registros")
    
    return df_final

if __name__ == "__main__":
    resultado = analyze_duplicates()