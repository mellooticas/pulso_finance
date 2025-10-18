#!/usr/bin/env python3
"""
Gerador de SQL MODULAR com UUIDs REAIS - PULSO Finance
=====================================================

Gera múltiplos arquivos SQL pequenos respeitando os limites do Supabase.
Usa os UUIDs reais descobertos na investigação do banco.

LIMITE SUPABASE: ~1MB por query
ESTRATÉGIA: Arquivos pequenos de 100-200 registros cada
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
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

# LIMITE DE REGISTROS POR ARQUIVO (para não exceder limite do Supabase)
RECORDS_PER_FILE = 150

# ========================================
# UUIDs REAIS DO BANCO (da investigação)
# ========================================

# 🏢 UUIDs das lojas
LOJAS_UUIDS = {
    'ESC': '692e5aea-e785-4675-9d44-9f3e24b36b01',  # Escritório
    'MAU': 'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',  # Loja Mauá
    'PER': '03474a07-f330-48bc-8329-5ca698083a62',  # Loja Perus
    'RIO': '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',  # Loja Rio Pequeno
    'SMT': 'a23b528f-6cbb-4753-b1e9-6d387c8c5666',  # Loja São Mateus
    'SU2': '84f6b026-e712-4a5d-9062-9921287ac4b7',  # Loja Suzano II
    'SUZ': '3704fcce-6e02-411d-a0ad-d96de801345a'   # Loja Suzano
}

# 📊 UUIDs do plano de contas (principais)
PLANO_UUIDS = {
    '3.1.1': '7245ff34-af3e-44ce-8c29-f874dd392683',  # Vendas em Dinheiro
    '3.1.2': '29fa1653-1d27-4c2e-aef1-b87ad8c0faef',  # Vendas Cartões Débito
    '3.1.3': '515cb77e-d834-42e6-a1e8-cc2978e1cf9f',  # Vendas Cartões Crédito
    '3.1.8': '2742c847-cf17-44de-aafe-5ad00dd7d4cd',  # Vendas PIX
    '4.1.1': 'e140db2e-9e5a-433a-90d5-3ffcabb3a006',  # Simples Nacional
    '4.2.1': '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',  # Fornecedores Armações
    '4.2.2': 'abb96b4a-004b-430b-8f6a-371c2b85b67f',  # Fornecedores Lentes
    '4.2.3': '491d08a9-cef8-4cdb-b861-da5c3f936af7',  # Fornecedores LC
    '5.1.2': '19b7c33c-66e3-48e0-a9ae-c07ae01c6a50',  # Telefone Internet
    '5.1.5': 'a81eb1b4-b40b-4af8-8fe3-2f36aeff862b',  # Contabilidade
    '5.2.4': '0aade745-1ec4-4999-9413-6b4307c59512',  # Aluguel
    '5.2.5': 'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',  # Energia Elétrica
    '5.2.8': '496da68c-25cd-4934-8b43-fa1444f0591a',  # Almoço/Supermercado
    '5.3.1': '445a81a4-179f-4046-80d6-4dd451cb6145',  # Salários
    '13.99': '96cebc3d-191f-4881-83af-66da5e56b1f8'   # Saldo Inicial Padrão
}

# 💳 UUIDs das formas de pagamento
FORMA_PAGAMENTO_UUIDS = {
    'PIX': 'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf',
    'Dinheiro': '43e2dcf9-1e47-45a5-8357-746a2b3e4d53',
    'Boleto': '6fcfbf8d-c183-45c8-8c61-6c665d1a6286',
    'Cartao_Debito': '60c9dc7d-435e-4e49-97d2-539803fff4b9',
    'Cartao_Credito': '54b6ee98-0b09-48d1-a53d-91b47cf2b74e',
    'Transferencia': 'f78af8f2-9e7d-44db-9c75-77dfc5f6e998'
}

# 👥 UUID padrão do usuário (financeiro)
USER_DEFAULT_UUID = '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'

# ========================================
# MAPEAMENTOS YAMPA -> BANCO REAL
# ========================================

MAPEAMENTO_LOJAS = {
    'Escritório': 'ESC',
    'Loja Mauá': 'MAU', 
    'Loja Suzano': 'SUZ',
    'Loja Suzano II': 'SU2',
    'Loja Perus': 'PER',
    'Loja Rio Pequeno': 'RIO',
    'Loja São Mateus': 'SMT',
    'default': 'ESC'
}

# Mapeamento de códigos Yampa para códigos reais
MAPEAMENTO_PLANOS = {
    # Impostos/Simples
    '4.1.1': '4.1.1',  # Simples Nacional
    
    # Energia/Infraestrutura  
    '5.2.3': '5.2.5',  # Energia Elétrica
    '5.2.1': '5.1.2',  # Telefone/Internet
    '5.2.4': '5.2.4',  # Aluguel
    
    # Fornecedores
    '4.2.3': '4.2.3',  # Fornecedores LC
    '4.2.4': '4.2.1',  # Fornecedores Armações
    
    # Receitas
    '3.1.1': '3.1.1',  # Vendas Dinheiro
    '3.1.8': '3.1.8',  # Vendas PIX
    
    # Contabilidade/Serviços
    '5.2.11': '5.1.5', # Contabilidade
    '5.2.12': '5.1.2', # Software -> Telefone/Internet
    '5.2.8': '5.2.8',  # Almoço/Supermercado
    '5.3.4': '5.3.1',  # Rescisão -> Salários
    
    # Default
    'default_receita': '3.1.8',  # PIX
    'default_despesa': '13.99'   # Saldo Inicial
}

def load_data():
    """Carrega e limpa os dados"""
    try:
        df = pd.read_csv(INPUT_FILE, sep=';', encoding='utf-8')
        
        # Converter datas
        date_columns = ['Data esperada', 'Data realizada', 'Data da última alteração']
        for col in date_columns:
            if col in df.columns:
                df[col] = pd.to_datetime(df[col], errors='coerce')
        
        # Converter valores
        value_columns = ['Valor a receber', 'Valor recebido', 'Valor a pagar', 'Valor pago']
        for col in value_columns:
            if col in df.columns:
                df[col] = df[col].astype(str).str.replace(',', '.')
                df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)
        
        print(f"✅ Carregados: {len(df):,} registros")
        return df
        
    except Exception as e:
        print(f"❌ Erro ao carregar dados: {e}")
        return None

def clean_sql_value(value, field_type='text'):
    """Limpa valores para SQL"""
    if pd.isna(value) or value == '' or str(value).strip() == '':
        return 'NULL'
    
    if field_type == 'text':
        clean_value = str(value).replace("'", "''").replace("\\", "\\\\")
        return f"'{clean_value}'"
    elif field_type == 'numeric':
        try:
            return str(float(str(value).replace(',', '.')))
        except:
            return '0'
    elif field_type == 'date':
        try:
            if pd.isna(value):
                return 'NULL'
            date_obj = pd.to_datetime(value)
            if pd.isna(date_obj):
                return 'NULL'
            return f"'{date_obj.strftime('%Y-%m-%d')}'"
        except:
            return 'NULL'
    
    return 'NULL'

def mapear_loja_uuid(centro_custo):
    """Retorna UUID da loja baseado no centro de custo"""
    if not centro_custo or pd.isna(centro_custo):
        return LOJAS_UUIDS[MAPEAMENTO_LOJAS['default']]
    
    centro_str = str(centro_custo).strip()
    
    # Busca no mapeamento
    for yampa_nome, codigo in MAPEAMENTO_LOJAS.items():
        if yampa_nome.lower() in centro_str.lower():
            return LOJAS_UUIDS[codigo]
    
    return LOJAS_UUIDS[MAPEAMENTO_LOJAS['default']]

def mapear_plano_uuid(plano_yampa):
    """Retorna UUID do plano de contas"""
    if not plano_yampa or pd.isna(plano_yampa):
        return PLANO_UUIDS[MAPEAMENTO_PLANOS['default_despesa']]
    
    plano_str = str(plano_yampa).strip()
    
    # Extrai código
    match = re.match(r'^(\d+\.[\d\.]*)', plano_str)
    if match:
        codigo = match.group(1)
        
        # Mapeia código
        if codigo in MAPEAMENTO_PLANOS:
            codigo_real = MAPEAMENTO_PLANOS[codigo]
            if codigo_real in PLANO_UUIDS:
                return PLANO_UUIDS[codigo_real]
        
        # Se é receita (3.x)
        if codigo.startswith('3.'):
            return PLANO_UUIDS[MAPEAMENTO_PLANOS['default_receita']]
    
    return PLANO_UUIDS[MAPEAMENTO_PLANOS['default_despesa']]

def mapear_forma_pagamento(meio_pagamento):
    """Mapeia meio de pagamento para UUID"""
    if not meio_pagamento or pd.isna(meio_pagamento):
        return 'NULL'
    
    meio_str = str(meio_pagamento).lower()
    
    if 'pix' in meio_str:
        return f"'{FORMA_PAGAMENTO_UUIDS['PIX']}'"
    elif 'boleto' in meio_str:
        return f"'{FORMA_PAGAMENTO_UUIDS['Boleto']}'"
    elif 'dinheiro' in meio_str:
        return f"'{FORMA_PAGAMENTO_UUIDS['Dinheiro']}'"
    elif 'cartao' in meio_str or 'cartão' in meio_str:
        return f"'{FORMA_PAGAMENTO_UUIDS['Cartao_Credito']}'"
    elif 'transferencia' in meio_str:
        return f"'{FORMA_PAGAMENTO_UUIDS['Transferencia']}'"
    
    return f"'{FORMA_PAGAMENTO_UUIDS['PIX']}'"  # Default PIX

def determinar_tipo_e_valores(row):
    """Determina tipo e valores da transação"""
    valor_receber = float(row.get('Valor a receber', 0) or 0)
    valor_recebido = float(row.get('Valor recebido', 0) or 0)
    valor_pagar = float(row.get('Valor a pagar', 0) or 0)
    valor_pago = float(row.get('Valor pago', 0) or 0)
    
    if valor_receber > 0 or valor_recebido > 0:
        return 'receber', max(valor_receber, valor_recebido), valor_recebido if valor_recebido > 0 else None, 'pago' if valor_recebido > 0 else 'previsto'
    else:
        return 'pagar', max(abs(valor_pagar), abs(valor_pago)), abs(valor_pago) if valor_pago != 0 else None, 'pago' if valor_pago != 0 else 'previsto'

def generate_batch_files():
    """Gera arquivos SQL em lotes pequenos"""
    
    print("🚀 GERADOR MODULAR - UUIDs REAIS")
    print("=" * 50)
    
    # Carregar dados
    df = load_data()
    if df is None:
        return []
    
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
    
    print(f"📊 Registros válidos: {len(df_valid):,}")
    
    # Calcular número de arquivos
    num_files = (len(df_valid) + RECORDS_PER_FILE - 1) // RECORDS_PER_FILE
    print(f"📁 Arquivos a serem gerados: {num_files}")
    
    generated_files = []
    
    # Gerar arquivo de controle
    control_file = OUTPUT_DIR / "00_EXECUTAR_MIGRACAO.sql"
    control_content = f"""-- =============================================
-- CONTROLE DE EXECUÇÃO - MIGRAÇÃO YAMPA
-- =============================================
--
-- Total de arquivos: {num_files}
-- Total de registros: {len(df_valid):,}
-- Gerado em: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
--
-- INSTRUÇÕES:
-- 1. Execute os arquivos na ordem (01, 02, 03...)
-- 2. Aguarde cada arquivo terminar antes do próximo
-- 3. Se der timeout, pare e continue do próximo arquivo
--
-- VERIFICAÇÃO FINAL:
-- SELECT COUNT(*) FROM lancamentos WHERE origem = 'migracao_yampa';
-- (Resultado esperado: {len(df_valid):,})
--
-- =============================================

-- Lista de arquivos para executar:
"""
    
    for i in range(1, num_files + 1):
        control_content += f"-- {i:02d}_yampa_lote_{i:03d}.sql\n"
    
    control_content += f"""
-- =============================================
-- VERIFICAÇÃO RÁPIDA (execute após todos os lotes)
-- =============================================
SELECT 
  'Migração Yampa' as status,
  COUNT(l.id) as lancamentos,
  COUNT(p.id) as parcelas,
  SUM(l.valor_total)::numeric(12,2) as valor_total
FROM lancamentos l
LEFT JOIN parcelas p ON l.id = p.lancamento_id
WHERE l.origem = 'migracao_yampa';
"""
    
    with open(control_file, 'w', encoding='utf-8') as f:
        f.write(control_content)
    
    generated_files.append(control_file)
    
    # Gerar arquivos por lotes
    for batch_num in range(num_files):
        start_idx = batch_num * RECORDS_PER_FILE
        end_idx = min((batch_num + 1) * RECORDS_PER_FILE, len(df_valid))
        batch_df = df_valid.iloc[start_idx:end_idx]
        
        file_num = batch_num + 1
        filename = f"{file_num:02d}_yampa_lote_{file_num:03d}.sql"
        filepath = OUTPUT_DIR / filename
        
        print(f"📝 Gerando {filename} ({len(batch_df)} registros)...")
        
        # Conteúdo do arquivo
        sql_content = f"""-- =============================================
-- MIGRAÇÃO YAMPA - LOTE {file_num}/{num_files}
-- =============================================
--
-- Registros: {len(batch_df)} 
-- Range: {start_idx + 1} - {end_idx}
-- UUIDs: REAIS do banco
--
-- =============================================

"""
        
        # Gerar pares de lançamento + parcela
        for _, row in batch_df.iterrows():
            lancamento_id = str(uuid.uuid4())
            
            # Dados da transação
            tipo, valor_total, valor_pago_final, status = determinar_tipo_e_valores(row)
            loja_uuid = mapear_loja_uuid(row.get('Centro de custo'))
            plano_uuid = mapear_plano_uuid(row.get('Plano de contas'))
            forma_pgto_uuid = mapear_forma_pagamento(row.get('Meio de pagamento'))
            
            # Metadados
            metadata = {
                'yampa_sequencia': str(row.get('Sequência', '')),
                'yampa_conta_bancaria': str(row.get('Conta bancária', '')),
                'yampa_status': str(row.get('Status', '')),
                'yampa_cliente_fornecedor': str(row.get('Cliente/Fornecedor', '')),
                'yampa_projeto': str(row.get('Projeto', ''))
            }
            
            data_pagamento = 'NULL'
            if status == 'pago':
                data_pagamento = clean_sql_value(row.get('Data realizada'), 'date')
            
            # SQL do lançamento
            sql_content += f"""-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '{lancamento_id}',
    '{loja_uuid}',
    '{tipo}',
    '{plano_uuid}',
    {clean_sql_value(row.get('Histórico', ''), 'text')},
    {clean_sql_value(row.get('Histórico', ''), 'text')},
    {clean_sql_value(row.get('Data realizada'), 'date')},
    {valor_total},
    'migracao_yampa',
    '{str(metadata).replace("'", "\"")}'::jsonb,
    '{USER_DEFAULT_UUID}'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  {clean_sql_value(row.get('Data realizada'), 'date')},
  {valor_total},
  {valor_pago_final if valor_pago_final else 'NULL'},
  '{status}',
  {data_pagamento},
  {forma_pgto_uuid}
FROM novo_lancamento nl;

"""
        
        # Salvar arquivo
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(sql_content)
        
        generated_files.append(filepath)
    
    return generated_files

if __name__ == "__main__":
    files = generate_batch_files()
    
    print(f"\n✅ MIGRAÇÃO MODULAR GERADA!")
    print(f"📁 Arquivos criados: {len(files)}")
    print(f"🎯 Pasta: {OUTPUT_DIR}")
    print(f"\n🚀 PRÓXIMOS PASSOS:")
    print(f"   1. Execute primeiro: 00_EXECUTAR_MIGRACAO.sql (instruções)")
    print(f"   2. Execute na ordem: 01_, 02_, 03_... até o final")
    print(f"   3. Cada arquivo processa ~{RECORDS_PER_FILE} registros")
    print(f"   4. Total esperado: 21.351+ lançamentos migrados")
    print(f"\n💡 VANTAGENS:")
    print(f"   ✅ Arquivos pequenos (sem timeout)")
    print(f"   ✅ UUIDs reais (sem quebras de FK)")
    print(f"   ✅ Pode parar/continuar a qualquer momento")
    print(f"   ✅ Fácil de debugar problemas específicos")