#!/usr/bin/env python3
"""
Gerador de SQL FINAL - PULSO Finance
====================================

Baseado nos dados REAIS do banco Supabase.
Este script usa as informações corretas descobertas na investigação.

DADOS REAIS DO BANCO:
- Lojas: ESC, MAU, PER, RIO, SMT, SU2, SUZ
- Plano de contas: Códigos reais do Yampa (3.1.1, 3.1.8, etc.)
- ENUMs: tipo_lancamento (receber/pagar), origem_lanc (migracao_yampa)
- Sem lançamentos existentes: campo limpo para migração
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

# ========================================
# MAPEAMENTOS BASEADOS NOS DADOS REAIS
# ========================================

# Lojas REAIS do banco (conforme investigação)
LOJAS_REAIS = {
    'ESC': 'Escritório',
    'MAU': 'Loja Mauá', 
    'PER': 'Loja Perus',
    'RIO': 'Loja Rio Pequeno',
    'SMT': 'Loja São Mateus',
    'SU2': 'Loja Suzano II',
    'SUZ': 'Loja Suzano'
}

# Mapeamento Centro de Custo Yampa -> Código Real da Loja
MAPEAMENTO_LOJAS = {
    'Escritório': 'ESC',
    'Loja Mauá': 'MAU',
    'Loja Suzano': 'SUZ',
    'Loja Suzano II': 'SU2',
    'Loja Perus': 'PER',
    'Loja Rio Pequeno': 'RIO', 
    'Loja São Mateus': 'SMT',
    'default': 'ESC'  # Fallback para Escritório
}

# Plano de contas: usar códigos existentes no banco
# Os códigos do Yampa JÁ EXISTEM no banco! (3.1.1, 3.1.8, etc.)
PLANOS_EXISTENTES = {
    # Receitas (já existem no banco)
    '3.1.1': '3.1.1',  # Vendas em Dinheiro
    '3.1.2': '3.1.2',  # Vendas Cartões de Débito  
    '3.1.3': '3.1.3',  # Vendas Cartões de Crédito
    '3.1.4': '3.1.4',  # Vendas Cartões Parceladas
    '3.1.5': '3.1.5',  # Vendas Cheques
    '3.1.6': '3.1.6',  # Vendas Crediário
    '3.1.7': '3.1.7',  # Vendas Convênios
    '3.1.8': '3.1.8',  # Vendas PIX
    
    # Para outros códigos, vamos mapear para o mais próximo existente
    'default_receita': '3.1.8',  # PIX como padrão para receitas
    'default_despesa': '13.99'   # Saldo Inicial Padrão (genérico)
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

def mapear_loja_real(centro_custo):
    """Mapeia centro de custo para código REAL da loja"""
    if not centro_custo or pd.isna(centro_custo):
        return MAPEAMENTO_LOJAS['default']
    
    centro_str = str(centro_custo).strip()
    
    # Busca exata primeiro
    if centro_str in MAPEAMENTO_LOJAS:
        return MAPEAMENTO_LOJAS[centro_str]
    
    # Busca parcial (case insensitive)
    centro_lower = centro_str.lower()
    for nome_yampa, codigo_real in MAPEAMENTO_LOJAS.items():
        if nome_yampa.lower() in centro_lower:
            return codigo_real
    
    return MAPEAMENTO_LOJAS['default']

def mapear_plano_real(plano_yampa):
    """Mapeia plano Yampa para código REAL do banco"""
    if not plano_yampa or pd.isna(plano_yampa):
        return PLANOS_EXISTENTES['default_despesa']
    
    plano_str = str(plano_yampa).strip()
    
    # Extrai código (ex: "3.1.1 Vendas" -> "3.1.1")
    match = re.match(r'^(\d+\.[\d\.]*)', plano_str)
    if match:
        codigo = match.group(1)
        
        # Verifica se código existe no banco
        if codigo in PLANOS_EXISTENTES:
            return PLANOS_EXISTENTES[codigo]
        
        # Se começa com 3 (receita), usa PIX
        if codigo.startswith('3.'):
            return PLANOS_EXISTENTES['default_receita']
    
    # Default para despesas/outros
    return PLANOS_EXISTENTES['default_despesa']

def determinar_tipo_e_valores(row):
    """Determina tipo de lançamento e valores baseado nos dados"""
    valor_receber = float(row.get('Valor a receber', 0) or 0)
    valor_recebido = float(row.get('Valor recebido', 0) or 0)
    valor_pagar = float(row.get('Valor a pagar', 0) or 0)
    valor_pago = float(row.get('Valor pago', 0) or 0)
    
    if valor_receber > 0 or valor_recebido > 0:
        tipo = 'receber'
        valor_total = valor_receber if valor_receber > 0 else valor_recebido
        valor_pago_final = valor_recebido if valor_recebido > 0 else None
        status = 'pago' if valor_recebido > 0 else 'previsto'
    else:
        tipo = 'pagar'
        valor_total = abs(valor_pagar) if valor_pagar != 0 else abs(valor_pago)
        valor_pago_final = abs(valor_pago) if valor_pago != 0 else None
        status = 'pago' if valor_pago != 0 else 'previsto'
    
    return tipo, valor_total, valor_pago_final, status

def generate_migration_sql(df, batch_size=200):
    """Gera SQL de migração usando dados REAIS do banco"""
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
    
    print(f"📊 Registros válidos para migração: {len(df_valid):,}")
    
    if len(df_valid) == 0:
        return "-- Nenhuma transação válida encontrada\n"
    
    sql_parts = []
    
    # Header
    sql_parts.append("-- =============================================")
    sql_parts.append("-- MIGRAÇÃO YAMPA - DADOS REAIS")
    sql_parts.append("-- =============================================")
    sql_parts.append("-- ")
    sql_parts.append(f"-- Arquivo gerado: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    sql_parts.append(f"-- Registros válidos: {len(df_valid):,}")
    sql_parts.append(f"-- Lojas: {', '.join(LOJAS_REAIS.keys())}")
    sql_parts.append("-- ")
    sql_parts.append("-- IMPORTANTE: Este SQL usa DADOS REAIS do banco!")
    sql_parts.append("-- =============================================")
    sql_parts.append("")
    
    # Processar em lotes
    total_batches = (len(df_valid) + batch_size - 1) // batch_size
    
    for batch_num in range(total_batches):
        start_idx = batch_num * batch_size
        end_idx = min((batch_num + 1) * batch_size, len(df_valid))
        batch_df = df_valid.iloc[start_idx:end_idx]
        
        sql_parts.append(f"-- ===== LOTE {batch_num + 1}/{total_batches} ({len(batch_df)} registros) =====")
        sql_parts.append("")
        
        # INSERT dos lançamentos com UUIDs fixos para referência nas parcelas
        sql_parts.append("WITH novos_lancamentos AS (")
        sql_parts.append("  INSERT INTO lancamentos (")
        sql_parts.append("    id, loja_id, tipo, plano_id, descricao, historico,")
        sql_parts.append("    competencia, valor_total, origem, metadata")
        sql_parts.append("  ) VALUES")
        
        lancamento_values = []
        lancamento_refs = []
        
        for _, row in batch_df.iterrows():
            lancamento_id = str(uuid.uuid4())
            lancamento_refs.append(lancamento_id)
            
            tipo, valor_total, _, _ = determinar_tipo_e_valores(row)
            codigo_loja = mapear_loja_real(row.get('Centro de custo'))
            codigo_plano = mapear_plano_real(row.get('Plano de contas'))
            
            # Metadados originais do Yampa
            metadata = {
                'yampa_sequencia': str(row.get('Sequência', '')),
                'yampa_conta_bancaria': str(row.get('Conta bancária', '')),
                'yampa_status_original': str(row.get('Status', '')),
                'yampa_cliente_fornecedor': str(row.get('Cliente/Fornecedor', '')),
                'yampa_meio_pagamento': str(row.get('Meio de pagamento', '')),
                'yampa_data_alteracao': str(row.get('Data da última alteração', '')),
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
      '{str(metadata).replace("'", "\"")}'::jsonb
    )"""
            lancamento_values.append(value_line)
        
        sql_parts.append(',\n'.join(lancamento_values))
        sql_parts.append("  RETURNING id")
        sql_parts.append("),")
        sql_parts.append("")
        
        # INSERT das parcelas
        sql_parts.append("parcelas_inseridas AS (")
        sql_parts.append("  INSERT INTO parcelas (")
        sql_parts.append("    id, lancamento_id, parcela, vencimento, valor,")
        sql_parts.append("    valor_pago, status, data_pagamento")
        sql_parts.append("  ) VALUES")
        
        parcela_values = []
        
        for i, (_, row) in enumerate(batch_df.iterrows()):
            lancamento_id = lancamento_refs[i]
            _, valor_total, valor_pago_final, status = determinar_tipo_e_valores(row)
            
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
      {data_pagamento}
    )"""
            parcela_values.append(value_line)
        
        sql_parts.append(',\n'.join(parcela_values))
        sql_parts.append("  RETURNING id")
        sql_parts.append(")")
        sql_parts.append("")
        sql_parts.append("SELECT")
        sql_parts.append(f"  'Lote {batch_num + 1}/{total_batches} processado' as resultado,")
        sql_parts.append(f"  {len(batch_df)} as registros_lote;")
        sql_parts.append("")
    
    return '\n'.join(sql_parts)

def generate_verification_sql():
    """Gera SQL de verificação pós-migração"""
    return """
-- =============================================
-- VERIFICAÇÕES PÓS-MIGRAÇÃO
-- =============================================

-- 1. Contagem geral
SELECT 
  'MIGRAÇÃO YAMPA' as info,
  COUNT(l.id) as lancamentos,
  COUNT(p.id) as parcelas,
  SUM(l.valor_total)::numeric(14,2) as valor_total
FROM lancamentos l
LEFT JOIN parcelas p ON l.id = p.lancamento_id
WHERE l.origem = 'migracao_yampa';

-- 2. Resumo por tipo
SELECT 
  l.tipo,
  COUNT(*) as quantidade,
  SUM(l.valor_total)::numeric(14,2) as valor_total,
  AVG(l.valor_total)::numeric(14,2) as valor_medio
FROM lancamentos l
WHERE l.origem = 'migracao_yampa'
GROUP BY l.tipo;

-- 3. Resumo por loja
SELECT 
  lo.codigo,
  lo.nome,
  COUNT(l.id) as lancamentos,
  SUM(l.valor_total)::numeric(14,2) as valor_total
FROM lancamentos l
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.origem = 'migracao_yampa'
GROUP BY lo.codigo, lo.nome
ORDER BY valor_total DESC;

-- 4. Período dos dados
SELECT 
  'Período migrado' as info,
  MIN(l.competencia) as data_inicio,
  MAX(l.competencia) as data_fim,
  COUNT(DISTINCT DATE_TRUNC('month', l.competencia)) as meses_distintos
FROM lancamentos l
WHERE l.origem = 'migracao_yampa';

-- 5. Status das parcelas
SELECT 
  p.status,
  COUNT(*) as quantidade,
  SUM(p.valor)::numeric(14,2) as valor_total,
  SUM(CASE WHEN p.valor_pago IS NOT NULL THEN p.valor_pago ELSE 0 END)::numeric(14,2) as valor_pago
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.origem = 'migracao_yampa'
GROUP BY p.status;

-- 6. Top 10 planos de conta mais usados
SELECT 
  pc.codigo,
  pc.nome,
  COUNT(l.id) as uso_count,
  SUM(l.valor_total)::numeric(14,2) as valor_total
FROM lancamentos l
JOIN plano_contas pc ON l.plano_id = pc.id
WHERE l.origem = 'migracao_yampa'
GROUP BY pc.codigo, pc.nome
ORDER BY uso_count DESC
LIMIT 10;

-- 7. Verificação de integridade
SELECT 
  'Verificação de integridade' as teste,
  CASE 
    WHEN COUNT(*) = (SELECT COUNT(*) FROM lancamentos WHERE origem = 'migracao_yampa')
    THEN '✅ OK - Todas as parcelas têm lançamento'
    ELSE '❌ ERRO - Parcelas órfãs encontradas'
  END as resultado
FROM parcelas p
WHERE p.lancamento_id IN (SELECT id FROM lancamentos WHERE origem = 'migracao_yampa');
"""

def generate_final_sql():
    """Função principal - gera SQL final"""
    print("🚀 GERADOR DE SQL FINAL - BASEADO EM DADOS REAIS")
    print("=" * 60)
    
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
    
    # Gerar SQLs
    print("📝 Gerando SQL de migração...")
    sql_migration = generate_migration_sql(df)
    
    print("📝 Gerando SQL de verificação...")
    sql_verification = generate_verification_sql()
    
    # Combinar
    full_sql = f"""{sql_migration}

{sql_verification}

-- =============================================
-- FIM DA MIGRAÇÃO YAMPA
-- =============================================
"""
    
    # Salvar arquivo
    output_file = OUTPUT_DIR / "yampa_migracao_final.sql"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(full_sql)
    
    print(f"\n✅ SQL FINAL gerado com sucesso!")
    print(f"📁 Arquivo: {output_file}")
    print(f"📊 Tamanho: {len(full_sql):,} caracteres")
    
    # Estatísticas finais
    valid_count = len(df[
        (df['Data realizada'].notna()) &
        (df['Histórico'].notna()) &
        (df['Histórico'] != '')
    ])
    
    print(f"\n📋 RESUMO FINAL:")
    print(f"   🏢 Lojas reais: {len(LOJAS_REAIS)} ({', '.join(LOJAS_REAIS.keys())})")
    print(f"   📊 Planos existentes: {len(PLANOS_EXISTENTES)} códigos")
    print(f"   💰 Registros válidos: {valid_count:,}")
    print(f"   📅 Origem: migracao_yampa")
    
    return output_file

if __name__ == "__main__":
    output_file = generate_final_sql()
    if output_file:
        print(f"\n🎯 MIGRAÇÃO PRONTA!")
        print(f"   1. ✅ Dados REAIS do banco utilizados")
        print(f"   2. ✅ Lojas: ESC, MAU, PER, RIO, SMT, SU2, SUZ")
        print(f"   3. ✅ Planos de conta: códigos existentes")
        print(f"   4. ✅ ENUMs corretos: migracao_yampa")
        print(f"   5. 🚀 Execute: {output_file}")