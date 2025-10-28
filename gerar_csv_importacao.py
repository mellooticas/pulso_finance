#!/usr/bin/env python3
"""
Script para gerar CSVs otimizados para importação direta no Supabase
Gera arquivos CSV compatíveis com as tabelas lancamentos e parcelas
"""

import pandas as pd
import uuid
from datetime import datetime
import os

print("=" * 60)
print("🚀 GERADOR DE CSV PARA IMPORTAÇÃO NO SUPABASE")
print("=" * 60)
print()

# Configurações
OUTPUT_DIR = "data/seeds/csv_supabase"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Carregar dados do arquivo consolidado
print("📂 Carregando dados do backup_total.csv...")
try:
    df = pd.read_csv('data/base/backup_total.csv')
    print(f"✅ Total de registros: {len(df):,}")
except FileNotFoundError:
    print("❌ Arquivo backup_total.csv não encontrado!")
    print("   Tentando arquivao_final.csv...")
    df = pd.read_csv('data/base/arquivao_final.csv')
    print(f"✅ Total de registros: {len(df):,}")

# Mostrar colunas disponíveis
print(f"\n📋 Colunas: {list(df.columns)}")
print()

# Buscar IDs existentes do banco (você pode ajustar manualmente)
# Para agora, vamos usar o primeiro ID disponível
LOJA_ID = "00000000-0000-0000-0000-000000000001"  # Ajustar com ID real
PLANO_CONTA_DEFAULT = "00000000-0000-0000-0000-000000000002"  # Ajustar com ID real

# ==========================================
# PROCESSAR LANÇAMENTOS
# ==========================================
print("🔄 Processando lançamentos...")

lancamentos_csv = []

for idx, row in df_lancamentos.iterrows():
    lanc_id = str(uuid.uuid4())
    
    # Determinar tipo
    tipo = 'pagar' if row.get('tipo', '').lower() == 'pagar' else 'receber'
    
    # Processar competência
    competencia = row.get('competencia', datetime.now().strftime('%Y-%m-%d'))
    if pd.isna(competencia):
        competencia = datetime.now().strftime('%Y-%m-%d')
    
    # Processar valor
    valor_total = float(row.get('valor_total', 0))
    if valor_total <= 0:
        continue  # Pular registros inválidos
    
    lancamento = {
        'id': lanc_id,
        'loja_id': LOJA_ID,
        'tipo': tipo,
        'plano_id': PLANO_CONTA_DEFAULT,  # Será ajustado depois pelo script 11b
        'centro_custo_id': None,
        'fornecedor_id': None,  # Será vinculado depois se existir
        'descricao': str(row.get('descricao', ''))[:500],
        'historico': str(row.get('historico', ''))[:1000] if pd.notna(row.get('historico')) else None,
        'observacoes': None,
        'competencia': competencia,
        'valor_total': valor_total,
        'num_parcelas': int(row.get('num_parcelas', 1)),
        'origem': 'migracao_yampa',
        'status_aprovacao': 'aprovado',
        'documento_referencia': None,
        'anexos': '{}',
        'user_id': None,
        'aprovado_por': None,
        'aprovado_em': None,
        'metadata': '{}',
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }
    
    lancamentos_csv.append(lancamento)
    
    # Mostrar progresso
    if (idx + 1) % 5000 == 0:
        print(f"  Processados: {idx + 1:,}/{len(df_lancamentos):,}")

print(f"✅ Total de lançamentos processados: {len(lancamentos_csv):,}")
print()

# Salvar CSV de lançamentos
print("💾 Salvando CSV de lançamentos...")
df_lanc_output = pd.DataFrame(lancamentos_csv)
output_file_lanc = os.path.join(OUTPUT_DIR, 'lancamentos_importar.csv')
df_lanc_output.to_csv(output_file_lanc, index=False)
print(f"✅ Arquivo salvo: {output_file_lanc}")
print(f"   Tamanho: {os.path.getsize(output_file_lanc) / 1024 / 1024:.2f} MB")
print()

# ==========================================
# PROCESSAR PARCELAS
# ==========================================
print("🔄 Processando parcelas...")

parcelas_csv = []

# Criar mapeamento de lançamentos originais para novos IDs
# (assumindo que os IDs originais estão na coluna 'lancamento_id')
lanc_map = {row.get('id_original'): row['id'] for row in lancamentos_csv if 'id_original' in row}

for idx, row in df_parcelas.iterrows():
    parc_id = str(uuid.uuid4())
    
    # Processar vencimento
    vencimento = row.get('vencimento', datetime.now().strftime('%Y-%m-%d'))
    if pd.isna(vencimento):
        vencimento = datetime.now().strftime('%Y-%m-%d')
    
    # Processar valor
    valor = float(row.get('valor', 0))
    if valor <= 0:
        continue
    
    # Status da parcela
    status_map = {
        'previsto': 'previsto',
        'pago': 'pago',
        'vencido': 'vencido',
        'parcial': 'parcial',
        'cancelado': 'cancelado'
    }
    status = status_map.get(str(row.get('status', 'previsto')).lower(), 'previsto')
    
    # Data de pagamento (apenas se pago)
    data_pagamento = None
    valor_pago = None
    if status == 'pago':
        data_pagamento = row.get('data_pagamento')
        valor_pago = valor
    
    parcela = {
        'id': parc_id,
        'lancamento_id': None,  # Precisa ser vinculado manualmente ou por script
        'parcela': int(row.get('parcela', 1)),
        'vencimento': vencimento,
        'valor': valor,
        'juros': float(row.get('juros', 0)),
        'desconto': float(row.get('desconto', 0)),
        'valor_pago': valor_pago,
        'status': status,
        'data_pagamento': data_pagamento,
        'forma_pagamento_id': None,
        'conta_id': None,
        'comprovante': None,
        'observacao': None,
        'conciliado': False,
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }
    
    parcelas_csv.append(parcela)
    
    # Mostrar progresso
    if (idx + 1) % 5000 == 0:
        print(f"  Processados: {idx + 1:,}/{len(df_parcelas):,}")

print(f"✅ Total de parcelas processadas: {len(parcelas_csv):,}")
print()

# Salvar CSV de parcelas
print("💾 Salvando CSV de parcelas...")
df_parc_output = pd.DataFrame(parcelas_csv)
output_file_parc = os.path.join(OUTPUT_DIR, 'parcelas_importar.csv')
df_parc_output.to_csv(output_file_parc, index=False)
print(f"✅ Arquivo salvo: {output_file_parc}")
print(f"   Tamanho: {os.path.getsize(output_file_parc) / 1024 / 1024:.2f} MB")
print()

# ==========================================
# RESUMO FINAL
# ==========================================
print("=" * 60)
print("📊 RESUMO DA GERAÇÃO")
print("=" * 60)
print(f"✅ Lançamentos: {len(lancamentos_csv):,} registros")
print(f"✅ Parcelas: {len(parcelas_csv):,} registros")
print()
print("📁 Arquivos gerados:")
print(f"   1. {output_file_lanc}")
print(f"   2. {output_file_parc}")
print()
print("🎯 PRÓXIMOS PASSOS:")
print("   1. Abra o Supabase Table Editor")
print("   2. Vá em 'lancamentos' → Import data from CSV")
print("   3. Selecione o arquivo lancamentos_importar.csv")
print("   4. Repita para 'parcelas' com parcelas_importar.csv")
print("   5. Execute o script 11b para mapear planos de contas")
print()
print("=" * 60)
