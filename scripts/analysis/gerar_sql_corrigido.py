#!/usr/bin/env python3
"""
Gerador de SQL Corrigido - PULSO Finance
========================================

Gera queries SQL baseadas no SCHEMA REAL do Supabase.
Este script mapeia os dados Yampa para as tabelas corretas:
- plano_contas (com IDs reais)
- lancamentos 
- parcelas

Schema usado:
- lojas (UUIDs das lojas existentes)
- plano_contas (códigos e IDs do seed)
- lancamentos (estrutura correta)
- parcelas (com referências corretas)
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

# Mapeamento dos códigos Yampa para o plano de contas real
MAPEAMENTO_PLANO_CONTAS = {
    # Impostos e Tributos
    '4.1.1': '5.1.7.1',  # Simples nacional -> Impostos e Taxas
    
    # Energia Elétrica
    '5.2.3': '5.1.2.1',  # Energia elétrica -> Energia Elétrica
    
    # Software e Sistemas
    '5.2.12': '5.1.4.1', # Mensalidade de softwares -> Material de Escritório
    
    # Contador/Contabilidade
    '5.2.11': '5.1.5.2', # Contador -> Assessoria Contábil
    
    # Fornecedores
    '4.2.3': '4.1.1.3',  # Fornecedores de Lentes -> Custo Lentes de Contato
    '4.2.4': '4.1.1.1',  # Fornecedores de Armações -> Custo Óculos de Grau
    
    # Telefone/Internet
    '5.2.1': '5.1.2.2',  # Telefone e internet -> Telefone/Internet
    
    # Aluguel
    '5.2.4': '5.1.3.1',  # Aluguel e condomínio -> Aluguel
    
    # Vendas (Receitas)
    '3.1.1': '3.1.1.1',  # Vendas -> Óculos de Grau
    '3.1.2': '3.1.1.2',  # Vendas óculos sol -> Óculos de Sol
    '3.1.8': '3.1.1.3',  # Vendas pix -> Lentes de Contato (aproximação)
    
    # Fretes
    '5.5.5': '5.2.2.1',  # Frete -> Frete sobre Vendas
    
    # Taxa de cartão
    '4.7.1': '5.2.3.1',  # Pagto Franquia -> Cartão de Crédito - Taxa
    
    # Outras despesas administrativas
    '5.2.8': '5.1.4.1',  # Almoço/Supermercado -> Material de Escritório
    '5.3.4': '5.1.1.1',  # Rescisão -> Salários e Ordenados
}

# IDs fixos das lojas (do seed)
LOJAS_MAP = {
    'Loja Mauá': 'LJ001',          # Centro
    'Loja Suzano': 'LJ002',        # Norte  
    'Loja Suzano II': 'LJ003',     # Sul
    'Loja ABC': 'LJ004',           # ABC (Santo André)
    'Loja Guarulhos': 'LJ005',     # Guarulhos
    'Loja Osasco': 'LJ006',        # Osasco
    'Escritório': 'ADM',           # Administrativa
    'default': 'LJ001'             # Fallback
}

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
        clean_value = str(value).replace("'", "''").replace("\\", "\\\\")
        return f"'{clean_value}'"
    
    elif field_type == 'numeric':
        try:
            num_value = str(value).replace(',', '.')
            return str(float(num_value))
        except:
            return '0'
    
    elif field_type == 'date':
        try:
            if pd.isna(value):
                return 'NULL'
            if isinstance(value, str):
                date_obj = pd.to_datetime(value, format='%d/%m/%Y', errors='coerce')
            else:
                date_obj = pd.to_datetime(value)
            
            if pd.isna(date_obj):
                return 'NULL'
            
            return f"'{date_obj.strftime('%Y-%m-%d')}'"
        except:
            return 'NULL'
    
    return 'NULL'

def mapear_plano_contas(codigo_yampa):
    """Mapeia código Yampa para código do plano de contas real"""
    if not codigo_yampa or pd.isna(codigo_yampa):
        return '5.1.4.1'  # Material de Escritório (default)
    
    codigo_str = str(codigo_yampa).strip()
    
    # Extrai o código base (exemplo: "4.1.1 Simples nacional" -> "4.1.1")
    match = re.match(r'^(\d+\.[\d\.]*)', codigo_str)
    if match:
        codigo_base = match.group(1)
        
        # Busca mapeamento exato
        if codigo_base in MAPEAMENTO_PLANO_CONTAS:
            return MAPEAMENTO_PLANO_CONTAS[codigo_base]
        
        # Busca por aproximação (primeiro nível)
        codigo_nivel1 = codigo_base.split('.')[0]
        for yampa_code, real_code in MAPEAMENTO_PLANO_CONTAS.items():
            if yampa_code.startswith(codigo_nivel1):
                return real_code
    
    # Default para despesas administrativas
    return '5.1.4.1'

def mapear_loja(centro_custo):
    """Mapeia centro de custo para código da loja"""
    if not centro_custo or pd.isna(centro_custo):
        return LOJAS_MAP['default']
    
    centro_str = str(centro_custo).strip().lower()
    
    # Mapeamentos específicos
    mapeamentos = {
        'mauá': 'LJ001',
        'suzano': 'LJ002', 
        'suzano ii': 'LJ003',
        'abc': 'LJ004',
        'santo andré': 'LJ004',
        'guarulhos': 'LJ005',
        'osasco': 'LJ006',
        'escritório': 'ADM',
        'administrativa': 'ADM',
        'matriz': 'ADM'
    }
    
    # Busca por palavras-chave
    for palavra_chave, codigo in mapeamentos.items():
        if palavra_chave in centro_str:
            return codigo
    
    return LOJAS_MAP['default']

def determinar_tipo_lancamento(row):
    """Determina se é 'receber' ou 'pagar' baseado nos valores"""
    valor_receber = float(row.get('Valor a receber', 0) or 0)
    valor_recebido = float(row.get('Valor recebido', 0) or 0)
    valor_pagar = float(row.get('Valor a pagar', 0) or 0)
    valor_pago = float(row.get('Valor pago', 0) or 0)
    
    if valor_receber > 0 or valor_recebido > 0:
        return 'receber'
    elif valor_pagar > 0 or valor_pago > 0:
        return 'pagar'
    
    return 'pagar'  # Default

def calcular_valor_e_status(row):
    """Calcula valor final e status da parcela"""
    valor_receber = float(row.get('Valor a receber', 0) or 0)
    valor_recebido = float(row.get('Valor recebido', 0) or 0)
    valor_pagar = float(row.get('Valor a pagar', 0) or 0)
    valor_pago = float(row.get('Valor pago', 0) or 0)
    
    tipo = determinar_tipo_lancamento(row)
    
    if tipo == 'receber':
        valor_total = valor_receber if valor_receber > 0 else valor_recebido
        valor_pago_final = valor_recebido if valor_recebido > 0 else None
        status = 'pago' if valor_recebido > 0 else 'previsto'
    else:
        valor_total = abs(valor_pagar) if valor_pagar != 0 else abs(valor_pago)
        valor_pago_final = abs(valor_pago) if valor_pago != 0 else None
        status = 'pago' if valor_pago != 0 else 'previsto'
    
    return valor_total, valor_pago_final, status

def generate_lancamentos_parcelas_sql(df, batch_size=250):
    """Gera SQL para lançamentos e parcelas integrado"""
    # Filtrar registros válidos
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
    
    print(f"📊 Registros válidos para inserção: {len(df_valid):,}")
    
    if len(df_valid) == 0:
        return "-- Nenhuma transação válida encontrada\n"
    
    sql_parts = []
    
    # Header
    sql_parts.append("-- ===================================")
    sql_parts.append("-- INSERÇÃO DE LANÇAMENTOS E PARCELAS")
    sql_parts.append("-- ===================================")
    sql_parts.append("")
    sql_parts.append("-- Limpar dados existentes do Yampa se necessário")
    sql_parts.append("-- DELETE FROM parcelas WHERE lancamento_id IN (SELECT id FROM lancamentos WHERE origem = 'migracao_yampa');")
    sql_parts.append("-- DELETE FROM lancamentos WHERE origem = 'migracao_yampa';")
    sql_parts.append("")
    
    # Processar em lotes
    total_batches = (len(df_valid) + batch_size - 1) // batch_size
    
    for batch_num in range(total_batches):
        start_idx = batch_num * batch_size
        end_idx = min((batch_num + 1) * batch_size, len(df_valid))
        batch_df = df_valid.iloc[start_idx:end_idx]
        
        sql_parts.append(f"-- ===== LOTE {batch_num + 1}/{total_batches} ({len(batch_df)} registros) =====")
        sql_parts.append("")
        
        # Primeiro: INSERT dos lançamentos
        sql_parts.append("-- Inserir lançamentos")
        sql_parts.append("WITH novos_lancamentos AS (")
        sql_parts.append("  INSERT INTO lancamentos (")
        sql_parts.append("    id, loja_id, tipo, plano_id, descricao, historico,")
        sql_parts.append("    competencia, valor_total, origem, metadata, created_at")
        sql_parts.append("  ) VALUES")
        
        lancamento_values = []
        lancamento_ids = []
        
        for _, row in batch_df.iterrows():
            lancamento_id = str(uuid.uuid4())
            lancamento_ids.append(lancamento_id)
            
            tipo = determinar_tipo_lancamento(row)
            valor_total, _, _ = calcular_valor_e_status(row)
            codigo_plano = mapear_plano_contas(row.get('Plano de contas'))
            codigo_loja = mapear_loja(row.get('Centro de custo'))
            
            # Metadados originais
            metadata = {
                'yampa_sequencia': str(row.get('Sequência', '')),
                'yampa_conta_bancaria': str(row.get('Conta bancária', '')),
                'yampa_status_original': str(row.get('Status', '')),
                'yampa_cliente_fornecedor': str(row.get('Cliente/Fornecedor', '')),
                'yampa_meio_pagamento': str(row.get('Meio de pagamento', '')),
                'yampa_codigo_conciliacao': str(row.get('Código da conciliação bancária', ''))
            }
            
            value_line = f"""    (
      '{lancamento_id}',
      (SELECT id FROM lojas WHERE codigo = '{codigo_loja}'),
      '{tipo}',
      (SELECT id FROM plano_contas WHERE codigo = '{codigo_plano}'),
      {clean_sql_value(row.get('Histórico', ''), 'text')},
      {clean_sql_value(row.get('Histórico', ''), 'text')},
      {clean_sql_value(row.get('Data realizada'), 'date')},
      {valor_total},
      'migracao_yampa',
      '{str(metadata).replace("'", "\"")}'::jsonb,
      NOW()
    )"""
            lancamento_values.append(value_line)
        
        sql_parts.append(',\n'.join(lancamento_values))
        sql_parts.append("  RETURNING id")
        sql_parts.append("),")
        sql_parts.append("")
        
        # Segundo: INSERT das parcelas
        sql_parts.append("-- Inserir parcelas")
        sql_parts.append("parcelas_inseridas AS (")
        sql_parts.append("  INSERT INTO parcelas (")
        sql_parts.append("    id, lancamento_id, parcela, vencimento, valor,")
        sql_parts.append("    valor_pago, status, data_pagamento, created_at")
        sql_parts.append("  ) VALUES")
        
        parcela_values = []
        
        for i, (_, row) in enumerate(batch_df.iterrows()):
            lancamento_id = lancamento_ids[i]
            valor_total, valor_pago_final, status = calcular_valor_e_status(row)
            
            data_pagamento = 'NULL'
            if status == 'pago':
                data_pagamento = clean_sql_value(row.get('Data realizada'), 'date')
            
            value_line = f"""    (
      gen_random_uuid(),
      '{lancamento_id}',
      1,
      {clean_sql_value(row.get('Data realizada'), 'date')},
      {valor_total},
      {valor_pago_final if valor_pago_final else 'NULL'},
      '{status}',
      {data_pagamento},
      NOW()
    )"""
            parcela_values.append(value_line)
        
        sql_parts.append(',\n'.join(parcela_values))
        sql_parts.append("  RETURNING id")
        sql_parts.append(")")
        sql_parts.append("")
        sql_parts.append("SELECT 'Lote processado' as resultado;")
        sql_parts.append("")
    
    return '\n'.join(sql_parts)

def generate_verification_queries():
    """Gera queries de verificação"""
    return """
-- =============================================
-- VERIFICAÇÕES FINAIS
-- =============================================

-- 1. Contagem geral
SELECT 
  'Lançamentos inseridos' as item,
  COUNT(*) as quantidade
FROM lancamentos 
WHERE origem = 'migracao_yampa'

UNION ALL

SELECT 
  'Parcelas inseridas',
  COUNT(*)
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.origem = 'migracao_yampa';

-- 2. Resumo por tipo
SELECT 
  l.tipo,
  COUNT(*) as qtd_lancamentos,
  SUM(l.valor_total) as valor_total,
  COUNT(p.id) as qtd_parcelas,
  SUM(CASE WHEN p.status = 'pago' THEN p.valor_pago ELSE 0 END) as valor_realizado
FROM lancamentos l
LEFT JOIN parcelas p ON l.id = p.lancamento_id
WHERE l.origem = 'migracao_yampa'
GROUP BY l.tipo;

-- 3. Resumo por loja
SELECT 
  lo.nome as loja,
  COUNT(l.id) as qtd_lancamentos,
  SUM(l.valor_total) as valor_total
FROM lancamentos l
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.origem = 'migracao_yampa'
GROUP BY lo.nome
ORDER BY valor_total DESC;

-- 4. Período dos dados
SELECT 
  'Período dos dados' as info,
  MIN(l.competencia) as data_inicio,
  MAX(l.competencia) as data_fim,
  COUNT(DISTINCT DATE_TRUNC('month', l.competencia)) as meses_distintos
FROM lancamentos l
WHERE l.origem = 'migracao_yampa';

-- 5. Top 10 planos de conta mais usados
SELECT 
  pc.codigo,
  pc.nome,
  COUNT(l.id) as qtd_lancamentos,
  SUM(l.valor_total) as valor_total
FROM lancamentos l
JOIN plano_contas pc ON l.plano_id = pc.id
WHERE l.origem = 'migracao_yampa'
GROUP BY pc.codigo, pc.nome
ORDER BY qtd_lancamentos DESC
LIMIT 10;
"""

def generate_full_sql():
    """Função principal - gera SQL completo"""
    print("🚀 GERADOR DE SQL CORRIGIDO - PULSO FINANCE")
    print("=" * 55)
    
    # Carregar dados
    df = load_consolidated_data()
    if df is None:
        return
    
    # Converter colunas
    date_columns = ['Data esperada', 'Data realizada', 'Data da última alteração']
    for col in date_columns:
        if col in df.columns:
            df[col] = pd.to_datetime(df[col], errors='coerce')
    
    value_columns = ['Valor a receber', 'Valor recebido', 'Valor a pagar', 'Valor pago']
    for col in value_columns:
        if col in df.columns:
            df[col] = df[col].astype(str).str.replace(',', '.')
            df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
    
    print(f"📊 Processando {len(df):,} registros...")
    
    # Gerar SQL
    print("📝 Gerando SQL para lançamentos e parcelas...")
    sql_lancamentos = generate_lancamentos_parcelas_sql(df)
    
    print("📝 Gerando queries de verificação...")
    sql_verificacoes = generate_verification_queries()
    
    # Combinar
    full_sql = f"""-- =============================================
-- PULSO FINANCE - MIGRAÇÃO YAMPA (CORRIGIDA)
-- =============================================
-- 
-- Arquivo gerado automaticamente em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
-- Fonte: yampa_consolidated.csv ({len(df):,} registros)
-- 
-- IMPORTANTE:
-- 1. Este SQL usa o SCHEMA REAL do Supabase
-- 2. Referencia IDs corretos de lojas e plano_contas
-- 3. Usa tipos ENUM corretos (tipo_lancamento, status_parcela, etc)
-- 4. Preserva metadados originais do Yampa
-- 
-- EXECUÇÃO:
-- 1. Execute no SQL Editor do Supabase
-- 2. Aguarde conclusão (~3-5 minutos)
-- 3. Execute as verificações finais
-- 
-- =============================================

{sql_lancamentos}

{sql_verificacoes}

-- =============================================
-- FIM DA MIGRAÇÃO
-- =============================================
"""
    
    # Salvar arquivo
    output_file = OUTPUT_DIR / "yampa_migracao_corrigida.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(full_sql)
    
    print(f"\n✅ SQL CORRIGIDO gerado com sucesso!")
    print(f"📁 Arquivo: {output_file}")
    print(f"📊 Tamanho: {len(full_sql):,} caracteres")
    
    # Estatísticas
    valid_transactions = len(df[
        (df['Data realizada'].notna()) &
        (df['Histórico'].notna()) &
        (df['Histórico'] != '')
    ])
    
    print(f"\n📋 RESUMO DA MIGRAÇÃO:")
    print(f"   💰 Lançamentos válidos: {valid_transactions:,}")
    print(f"   📅 Período: {df['Data realizada'].min().date()} a {df['Data realizada'].max().date()}")
    print(f"   🏢 Lojas mapeadas: {len(LOJAS_MAP)} lojas")
    print(f"   📊 Planos mapeados: {len(MAPEAMENTO_PLANO_CONTAS)} códigos")
    
    return output_file

if __name__ == "__main__":
    output_file = generate_full_sql()
    if output_file:
        print(f"\n🎯 PRÓXIMOS PASSOS:")
        print(f"   1. Abra o Supabase SQL Editor")
        print(f"   2. Cole o conteúdo de: {output_file}")
        print(f"   3. Execute o script completo")
        print(f"   4. Verifique os resultados das queries finais")
        print(f"   5. Os dados estarão prontos para uso no frontend!")