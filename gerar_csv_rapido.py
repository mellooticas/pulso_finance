#!/usr/bin/env python3
"""
Gerador de CSV para Importação no Supabase
Converte dados do Yampa para formato compatível com importação CSV do Supabase
"""

import pandas as pd
import uuid
from datetime import datetime
import os

print("=" * 60)
print("🚀 GERADOR DE CSV PARA SUPABASE - MÉTODO RÁPIDO")
print("=" * 60)
print()

# ==========================================
# CONFIGURAÇÕES
# ==========================================
OUTPUT_DIR = "data/seeds/csv_supabase"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# IDs fixos do banco
LOJA_ID_DEFAULT = "bde8c647-89f8-4a02-8c19-77bc47ee7aaf"  # Loja Mauá
PLANO_DEFAULT = "4175afe1-b83a-4df6-8572-59daa24dd345"     # Plano: Receitas

print("⚙️  CONFIGURAÇÃO:")
print(f"   📁 Output: {OUTPUT_DIR}")
print(f"   🏢 Loja padrão: {LOJA_ID_DEFAULT}")
print(f"   📊 Plano padrão: {PLANO_DEFAULT}")
print()

# ==========================================
# CARREGAR DADOS
# ==========================================
print("📂 Carregando dados brutos...")

# Tentar carregar o arquivo de lançamentos
try:
    df = pd.read_csv('data/base/lancamentos_bruto.csv')
    origem_arquivo = 'lancamentos_bruto.csv'
    print(f"✅ Usando: {origem_arquivo}")
except Exception as e:
    print(f"❌ Erro ao carregar lancamentos_bruto.csv: {e}")
    try:
        df = pd.read_csv('data/base/arquivao_final.csv')
        origem_arquivo = 'arquivao_final.csv'
        print(f"✅ Usando arquivo alternativo: {origem_arquivo}")
    except Exception as e2:
        print(f"❌ Erro ao carregar arquivao_final.csv: {e2}")
        print("❌ Nenhum arquivo de dados encontrado!")
        exit(1)

print(f"✅ Carregado: {origem_arquivo}")
print(f"   Total de registros: {len(df):,}")
print(f"   Colunas: {len(df.columns)}")
print()

# ==========================================
# GERAR LANÇAMENTOS
# ==========================================
print("🔄 Gerando CSV de lançamentos...")

lancamentos = []
parcelas = []

for idx, row in df.iterrows():
    # Criar ID do lançamento
    lanc_id = str(uuid.uuid4())
    
    # Determinar tipo (receber ou pagar)
    valor_receber = float(row.get('valor_receber', 0) or 0)
    valor_pagar = float(row.get('valor_pagar', 0) or 0)
    
    if valor_receber > 0:
        tipo = 'receber'
        valor_total = valor_receber
    elif valor_pagar > 0:
        tipo = 'pagar'
        valor_total = valor_pagar
    else:
        continue  # Pular registros sem valor
    
    # Pegar datas
    data_esperada = row.get('data_esperada', row.get('Data esperada'))
    if pd.isna(data_esperada):
        data_esperada = datetime.now().strftime('%Y-%m-%d')
    else:
        # Converter para formato ISO
        try:
            data_esperada = pd.to_datetime(data_esperada).strftime('%Y-%m-%d')
        except:
            data_esperada = datetime.now().strftime('%Y-%m-%d')
    
    # Descrição e histórico
    historico = str(row.get('historico', row.get('plano_conta', 'Sem descrição')))
    descricao = historico[:500]  # Limite de 500 caracteres
    
    # Montar lançamento
    lancamento = {
        'id': lanc_id,
        'loja_id': LOJA_ID_DEFAULT,
        'tipo': tipo,
        'plano_id': PLANO_DEFAULT,
        'centro_custo_id': '',
        'fornecedor_id': '',
        'descricao': descricao,
        'historico': historico[:1000] if len(historico) > 0 else '',
        'observacoes': '',
        'competencia': data_esperada,
        'valor_total': valor_total,
        'num_parcelas': 1,
        'origem': 'migracao_yampa',
        'status_aprovacao': 'aprovado',
        'documento_referencia': '',
        'anexos': '',
        'user_id': '',
        'aprovado_por': '',
        'aprovado_em': '',
        'metadata': '',
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }
    lancamentos.append(lancamento)
    
    # Criar parcela correspondente
    data_realizada = row.get('data_realizada', row.get('Data realizada'))
    status_pagamento = str(row.get('status', 'Previsto')).lower()
    
    # Determinar status da parcela
    if 'realizado' in status_pagamento or 'pago' in status_pagamento:
        status_parcela = 'pago'
        valor_pago = valor_total
        if pd.notna(data_realizada):
            try:
                data_pagamento = pd.to_datetime(data_realizada).strftime('%Y-%m-%d')
            except:
                data_pagamento = data_esperada
        else:
            data_pagamento = data_esperada
    else:
        status_parcela = 'previsto'
        valor_pago = ''
        data_pagamento = ''
    
    parcela = {
        'id': str(uuid.uuid4()),
        'lancamento_id': lanc_id,
        'parcela': 1,
        'vencimento': data_esperada,
        'valor': valor_total,
        'juros': 0,
        'desconto': 0,
        'valor_pago': valor_pago,
        'status': status_parcela,
        'data_pagamento': data_pagamento,
        'forma_pagamento_id': '',
        'conta_id': '',
        'comprovante': '',
        'observacao': '',
        'conciliado': 'false',
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }
    parcelas.append(parcela)
    
    # Progresso
    if (idx + 1) % 5000 == 0:
        print(f"   Processados: {idx + 1:,}/{len(df):,}")

print(f"✅ Lançamentos gerados: {len(lancamentos):,}")
print(f"✅ Parcelas geradas: {len(parcelas):,}")
print()

# ==========================================
# SALVAR CSVs
# ==========================================
print("💾 Salvando arquivos CSV...")

# Salvar lançamentos
df_lanc = pd.DataFrame(lancamentos)
arquivo_lanc = os.path.join(OUTPUT_DIR, 'lancamentos.csv')
df_lanc.to_csv(arquivo_lanc, index=False)
tamanho_lanc = os.path.getsize(arquivo_lanc) / 1024 / 1024

print(f"✅ {arquivo_lanc}")
print(f"   Tamanho: {tamanho_lanc:.2f} MB")
print(f"   Linhas: {len(df_lanc):,}")

# Salvar parcelas
df_parc = pd.DataFrame(parcelas)
arquivo_parc = os.path.join(OUTPUT_DIR, 'parcelas.csv')
df_parc.to_csv(arquivo_parc, index=False)
tamanho_parc = os.path.getsize(arquivo_parc) / 1024 / 1024

print(f"✅ {arquivo_parc}")
print(f"   Tamanho: {tamanho_parc:.2f} MB")
print(f"   Linhas: {len(df_parc):,}")
print()

# ==========================================
# INSTRUÇÕES FINAIS
# ==========================================
print("=" * 60)
print("🎯 PRÓXIMOS PASSOS")
print("=" * 60)
print()
print("1️⃣  AJUSTAR IDs NO SCRIPT:")
print("    Edite as linhas 19-20 com IDs reais do seu banco:")
print()
print("    # Pegar do Supabase SQL Editor:")
print("    SELECT id FROM lojas LIMIT 1;")
print("    SELECT id FROM plano_contas WHERE ativo = true LIMIT 1;")
print()
print("2️⃣  REEXECUTAR O SCRIPT:")
print("    python gerar_csv_rapido.py")
print()
print("3️⃣  IMPORTAR NO SUPABASE:")
print("    a) Abra: supabase.com/dashboard → Table Editor")
print("    b) Tabela 'lancamentos' → Insert → Import data from CSV")
print("    c) Selecione: data/seeds/csv_supabase/lancamentos.csv")
print("    d) Repita para 'parcelas'")
print()
print("4️⃣  PÓS-PROCESSAMENTO:")
print("    Execute os scripts SQL:")
print("    - 11b_atribuir_plano_transacionais.sql")
print("    - 10b_normalizar_fornecedores.sql")
print()
print("=" * 60)
