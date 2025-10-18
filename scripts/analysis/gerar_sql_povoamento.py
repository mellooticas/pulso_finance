#!/usr/bin/env python3
"""
Gerador de Queries SQL - PULSO Finance
=====================================

Gera queries SQL INSERT otimizadas para povoar o Supabase com os dados limpos do Yampa.
Este script processa o arquivo yampa_consolidated.csv e cria queries prontas para execução.

Funcionalidades:
1. Lê dados consolidados sem duplicatas
2. Mapeia para estrutura do banco Supabase
3. Gera INSERTs em lotes otimizados
4. Trata valores nulos e formatos
5. Cria queries para tabelas relacionadas
"""

import pandas as pd
import numpy as np
from pathlib import Path
from datetime import datetime
import uuid
import re

# Configurações
DATA_DIR = Path("../../data/base")
DATABASE_DIR = Path("../../database")
INPUT_FILE = DATA_DIR / "yampa_consolidated.csv"
OUTPUT_DIR = DATABASE_DIR / "seeds"

# Criar diretório de saída se não existir
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

def load_consolidated_data():
    """Carrega os dados consolidados"""
    try:
        df = pd.read_csv(INPUT_FILE, sep=';', encoding='utf-8')
        print(f"✅ Carregado: {len(df):,} registros de {INPUT_FILE}")
        return df
    except Exception as e:
        print(f"❌ Erro ao carregar {INPUT_FILE}: {e}")
        return None

def clean_sql_value(value, field_type='text'):
    """Limpa valores para inserção SQL segura"""
    if pd.isna(value) or value == '' or str(value).strip() == '':
        return 'NULL'
    
    if field_type == 'text':
        # Escape aspas simples e caracteres especiais
        clean_value = str(value).replace("'", "''").replace("\\", "\\\\")
        return f"'{clean_value}'"
    
    elif field_type == 'numeric':
        try:
            # Converte para float e trata vírgulas
            num_value = str(value).replace(',', '.')
            return str(float(num_value))
        except:
            return '0'
    
    elif field_type == 'date':
        try:
            if pd.isna(value):
                return 'NULL'
            # Assume formato brasileiro DD/MM/YYYY ou já está em datetime
            if isinstance(value, str):
                date_obj = pd.to_datetime(value, format='%d/%m/%Y', errors='coerce')
            else:
                date_obj = pd.to_datetime(value)
            
            if pd.isna(date_obj):
                return 'NULL'
            
            return f"'{date_obj.strftime('%Y-%m-%d')}'"
        except:
            return 'NULL'
    
    elif field_type == 'uuid':
        return f"'{str(uuid.uuid4())}'"
    
    return 'NULL'

def extract_plano_contas_unique(df):
    """Extrai planos de contas únicos para criar tabela de categorias"""
    planos = df['Plano de contas'].dropna().unique()
    planos_clean = []
    
    for plano in planos:
        if plano and str(plano).strip() and str(plano) != 'nan':
            # Extrai código e nome
            plano_str = str(plano).strip()
            
            # Padrão: "4.1.1 Nome da categoria"
            match = re.match(r'^(\d+\.[\d\.]*)\s+(.+)', plano_str)
            if match:
                codigo = match.group(1)
                nome = match.group(2)
            else:
                codigo = plano_str[:10]  # Primeiros 10 chars como código
                nome = plano_str
            
            planos_clean.append({
                'codigo': codigo,
                'nome': nome,
                'plano_original': plano_str
            })
    
    return pd.DataFrame(planos_clean).drop_duplicates(subset=['codigo'])

def generate_categorias_sql(df):
    """Gera SQL para inserir categorias (plano de contas)"""
    planos_df = extract_plano_contas_unique(df)
    
    if len(planos_df) == 0:
        return "-- Nenhuma categoria encontrada\n"
    
    sql_lines = [
        "-- ===================================",
        "-- INSERÇÃO DE CATEGORIAS (PLANO DE CONTAS)",
        "-- ===================================",
        "",
        "-- Limpar tabela se necessário",
        "-- DELETE FROM categorias WHERE origem = 'yampa';",
        "",
        "INSERT INTO categorias (id, nome, codigo, tipo, cor, origem, ativo, created_at) VALUES"
    ]
    
    values = []
    for _, plano in planos_df.iterrows():
        # Determina tipo baseado no código
        codigo = plano['codigo']
        tipo = 'despesa'  # Default
        if codigo.startswith('1.') or codigo.startswith('3.'):
            tipo = 'receita'
        elif codigo.startswith('4.') or codigo.startswith('5.'):
            tipo = 'despesa'
        
        # Cor baseada no tipo
        cor = '#ef4444' if tipo == 'despesa' else '#10b981'
        
        value_line = f"""  (
    {clean_sql_value('', 'uuid')},
    {clean_sql_value(plano['nome'], 'text')},
    {clean_sql_value(codigo, 'text')},
    {clean_sql_value(tipo, 'text')},
    {clean_sql_value(cor, 'text')},
    'yampa',
    true,
    NOW()
  )"""
        values.append(value_line)
    
    sql_lines.append(',\n'.join(values))
    sql_lines.append("ON CONFLICT (codigo) DO UPDATE SET")
    sql_lines.append("  nome = EXCLUDED.nome,")
    sql_lines.append("  updated_at = NOW();")
    sql_lines.append("")
    
    return '\n'.join(sql_lines)

def generate_transacoes_sql(df, batch_size=500):
    """Gera SQL para inserir transações em lotes"""
    # Filtrar apenas registros com dados mínimos necessários
    df_valid = df[
        (df['Data realizada'].notna()) &
        (df['Histórico'].notna()) &
        (df['Histórico'] != '') &
        (
            (df['Valor a receber'].notna() & (df['Valor a receber'] != 0)) |
            (df['Valor recebido'].notna() & (df['Valor recebido'] != 0)) |
            (df['Valor a pagar'].notna() & (df['Valor a pagar'] != 0)) |
            (df['Valor pago'].notna() & (df['Valor pago'] != 0))
        )
    ].copy()
    
    print(f"📊 Transações válidas para inserção: {len(df_valid):,}")
    
    if len(df_valid) == 0:
        return "-- Nenhuma transação válida encontrada\n"
    
    sql_parts = []
    
    # Header
    sql_parts.append("-- ===================================")
    sql_parts.append("-- INSERÇÃO DE TRANSAÇÕES")
    sql_parts.append("-- ===================================")
    sql_parts.append("")
    sql_parts.append("-- Limpar transações existentes do Yampa se necessário")
    sql_parts.append("-- DELETE FROM transacoes WHERE origem = 'yampa';")
    sql_parts.append("")
    
    # Processar em lotes
    total_batches = (len(df_valid) + batch_size - 1) // batch_size
    
    for batch_num in range(total_batches):
        start_idx = batch_num * batch_size
        end_idx = min((batch_num + 1) * batch_size, len(df_valid))
        batch_df = df_valid.iloc[start_idx:end_idx]
        
        sql_parts.append(f"-- Lote {batch_num + 1}/{total_batches} ({len(batch_df)} registros)")
        sql_parts.append("INSERT INTO transacoes (")
        sql_parts.append("  id, descricao, valor, data_transacao, tipo, categoria_id,")
        sql_parts.append("  conta_bancaria, status, observacoes, origem, created_at")
        sql_parts.append(") VALUES")
        
        values = []
        for _, row in batch_df.iterrows():
            # Determinar valor e tipo da transação
            valor_receber = float(row.get('Valor a receber', 0) or 0)
            valor_recebido = float(row.get('Valor recebido', 0) or 0)
            valor_pagar = float(row.get('Valor a pagar', 0) or 0)
            valor_pago = float(row.get('Valor pago', 0) or 0)
            
            # Priorizar valores realizados (recebido/pago)
            if valor_recebido > 0:
                valor_final = valor_recebido
                tipo = 'receita'
            elif valor_pago > 0:
                valor_final = abs(valor_pago)  # Garantir valor positivo
                tipo = 'despesa'
            elif valor_receber > 0:
                valor_final = valor_receber
                tipo = 'receita'
            elif valor_pagar > 0:
                valor_final = abs(valor_pagar)
                tipo = 'despesa'
            else:
                continue  # Pular registros sem valor
            
            # Status baseado nos valores realizados vs planejados
            if (valor_recebido > 0 and valor_receber > 0) or (valor_pago > 0 and valor_pagar > 0):
                status = 'realizada'
            elif valor_receber > 0 or valor_pagar > 0:
                status = 'pendente'
            else:
                status = 'realizada'
            
            # Buscar categoria (usar subquery)
            plano_contas = str(row.get('Plano de contas', '')).strip()
            categoria_query = 'NULL'
            if plano_contas and plano_contas != 'nan':
                # Extrai código do plano
                match = re.match(r'^(\d+\.[\d\.]*)', plano_contas)
                if match:
                    codigo = match.group(1)
                    categoria_query = f"(SELECT id FROM categorias WHERE codigo = '{codigo}' LIMIT 1)"
            
            # Observações extras
            observacoes_parts = []
            if row.get('Sequência'):
                observacoes_parts.append(f"Seq: {row['Sequência']}")
            if row.get('Meio de pagamento'):
                observacoes_parts.append(f"Meio: {row['Meio de pagamento']}")
            if row.get('Centro de custo'):
                observacoes_parts.append(f"Centro: {row['Centro de custo']}")
            if row.get('Cliente/Fornecedor'):
                observacoes_parts.append(f"Cliente/Fornecedor: {row['Cliente/Fornecedor']}")
            
            observacoes = '; '.join(observacoes_parts) if observacoes_parts else None
            
            value_line = f"""  (
    {clean_sql_value('', 'uuid')},
    {clean_sql_value(row.get('Histórico', ''), 'text')},
    {valor_final},
    {clean_sql_value(row.get('Data realizada'), 'date')},
    '{tipo}',
    {categoria_query},
    {clean_sql_value(row.get('Conta bancária', ''), 'text')},
    '{status}',
    {clean_sql_value(observacoes, 'text')},
    'yampa',
    NOW()
  )"""
            values.append(value_line)
        
        if values:
            sql_parts.append(',\n'.join(values))
            sql_parts.append("ON CONFLICT (id) DO NOTHING;")
            sql_parts.append("")
    
    return '\n'.join(sql_parts)

def generate_full_sql():
    """Função principal - gera SQL completo"""
    print("🚀 GERADOR DE SQL - PULSO FINANCE")
    print("=" * 50)
    
    # Carregar dados
    df = load_consolidated_data()
    if df is None:
        return
    
    # Converter colunas de data
    date_columns = ['Data esperada', 'Data realizada', 'Data da última alteração']
    for col in date_columns:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors='coerce')
    
    # Converter colunas de valor
    value_columns = ['Valor a receber', 'Valor recebido', 'Valor a pagar', 'Valor pago']
    for col in value_columns:
        if col in df.columns:
            df[col] = df[col].astype(str).str.replace(',', '.')
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
    
    print(f"📊 Processando {len(df):,} registros...")
    
    # Gerar SQLs
    print("📝 Gerando SQL para categorias...")
    sql_categorias = generate_categorias_sql(df)
    
    print("📝 Gerando SQL para transações...")
    sql_transacoes = generate_transacoes_sql(df)
    
    # Combinar e salvar
    full_sql = f"""-- =============================================
-- PULSO FINANCE - POVOAMENTO INICIAL DO BANCO
-- =============================================
-- 
-- Arquivo gerado automaticamente em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- Fonte: yampa_consolidated.csv ({len(df):,} registros)
-- 
-- INSTRUÇÕES:
-- 1. Execute este script no SQL Editor do Supabase
-- 2. As queries são otimizadas e tratam conflitos
-- 3. Dados de origem marcados como 'yampa'
-- 
-- =============================================

{sql_categorias}

{sql_transacoes}

-- =============================================
-- VERIFICAÇÕES FINAIS
-- =============================================

-- Contar categorias inseridas
SELECT 'Categorias inseridas:' as info, COUNT(*) as total 
FROM categorias WHERE origem = 'yampa';

-- Contar transações inseridas
SELECT 'Transações inseridas:' as info, COUNT(*) as total 
FROM transacoes WHERE origem = 'yampa';

-- Resumo por tipo
SELECT 
  tipo,
  COUNT(*) as quantidade,
  SUM(valor) as total_valor,
  AVG(valor) as valor_medio
FROM transacoes 
WHERE origem = 'yampa'
GROUP BY tipo;

-- Período dos dados
SELECT 
  'Período dos dados:' as info,
  MIN(data_transacao) as data_inicio,
  MAX(data_transacao) as data_fim,
  COUNT(DISTINCT DATE_TRUNC('month', data_transacao)) as meses_distintos
FROM transacoes 
WHERE origem = 'yampa';
"""
    
    # Salvar arquivo
    output_file = OUTPUT_DIR / "yampa_povoamento_completo.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(full_sql)
    
    print(f"\n✅ SQL gerado com sucesso!")
    print(f"📁 Arquivo: {output_file}")
    print(f"📊 Tamanho: {len(full_sql):,} caracteres")
    
    # Estatísticas
    categorias_count = len(extract_plano_contas_unique(df))
    valid_transactions = len(df[
        (df['Data realizada'].notna()) &
        (df['Histórico'].notna()) &
        (df['Histórico'] != '')
    ])
    
    print(f"\n📋 RESUMO DO SQL GERADO:")
    print(f"   🏷️  Categorias: {categorias_count}")
    print(f"   💰 Transações válidas: {valid_transactions:,}")
    print(f"   📅 Período: {df['Data realizada'].min().date()} a {df['Data realizada'].max().date()}")
    
    return output_file

if __name__ == "__main__":
    output_file = generate_full_sql()
    if output_file:
        print(f"\n🎯 PRÓXIMOS PASSOS:")
        print(f"   1. Abra o Supabase SQL Editor")
        print(f"   2. Cole o conteúdo de: {output_file}")
        print(f"   3. Execute o script")
        print(f"   4. Verifique os resultados das queries finais")