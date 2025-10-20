"""
🔥 SCRIPT DE RECUPERAÇÃO - Recriar Centros de Custo Perdidos

PROBLEMA: Na normalização, os centros de custo foram APAGADOS do banco!
SOLUÇÃO: Ler yampa_relatorio.csv original e recriar tudo.

ETAPAS:
1. Criar centros de custo no Supabase
2. Criar mapa: Histórico do lançamento → Centro de custo original
3. UPDATE nos 42.863 lançamentos com centro_custo_id correto
4. Redistribuir loja_id baseado no centro de custo
"""

import pandas as pd
import json
from pathlib import Path
from supabase import create_client, Client
import os
from dotenv import load_dotenv

# Carregar variáveis de ambiente
load_dotenv(Path(__file__).parent.parent / 'frontend' / '.env.local')

SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
SUPABASE_KEY = os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')

print(f"🔗 Conectando ao Supabase: {SUPABASE_URL}")
supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# Caminho do arquivo original
YAMPA_ORIGINAL = Path(__file__).parent.parent / 'data' / 'base' / 'yampa_relatorio.csv'

print("=" * 70)
print("🔥 RECUPERAÇÃO DE CENTROS DE CUSTO PERDIDOS")
print("=" * 70)

# ============================================================
# 1. LER ARQUIVO ORIGINAL
# ============================================================
print("\n📖 1. Lendo arquivo original do Yampa...")
try:
    df = pd.read_csv(YAMPA_ORIGINAL, sep=';', encoding='iso-8859-1')
    print(f"   ✅ {len(df)} registros lidos")
    print(f"   📋 Colunas: {', '.join(df.columns)}")
except Exception as e:
    print(f"   ❌ Erro ao ler arquivo: {e}")
    exit(1)

# ============================================================
# 2. EXTRAIR CENTROS DE CUSTO ÚNICOS
# ============================================================
print("\n🏢 2. Identificando centros de custo...")
centros_unicos = df['Centro de custo'].dropna().unique()
print(f"   ✅ {len(centros_unicos)} centros únicos encontrados:")

for i, centro in enumerate(sorted(centros_unicos), 1):
    count = len(df[df['Centro de custo'] == centro])
    print(f"      {i}. {centro} ({count} lançamentos)")

# ============================================================
# 3. BUSCAR LOJAS CADASTRADAS
# ============================================================
print("\n🏪 3. Buscando lojas cadastradas...")
try:
    response = supabase.table('lojas').select('*').execute()
    lojas = {loja['nome']: loja['id'] for loja in response.data}
    print(f"   ✅ {len(lojas)} lojas encontradas:")
    for nome, id in lojas.items():
        print(f"      - {nome}: {id[:8]}...")
except Exception as e:
    print(f"   ❌ Erro ao buscar lojas: {e}")
    exit(1)

# ============================================================
# 4. MAPEAMENTO: Centro de Custo → Loja
# ============================================================
print("\n🗺️  4. Criando mapeamento Centro → Loja...")
mapa_centro_loja = {
    'Escritório': 'Escritório',
    'Loja Suzano': 'Loja Suzano',
    'Loja Mauá': 'Loja Mauá',
    'Loja Rio Pequeno': 'Loja Rio Pequeno',
    'Loja Suzano II': 'Loja Suzano II',
    'Loja São Mateus': 'Loja São Mateus',
    'Loja Perus': 'Loja Perus',
    'Taty Mello Festas': 'Escritório',  # Eventos vão pro escritório
    'Clínica': 'Escritório',
    'Pessoal': 'Escritório'
}

print("   Mapeamento:")
for centro, loja in mapa_centro_loja.items():
    print(f"      {centro} → {loja}")

# ============================================================
# 5. CRIAR CENTROS DE CUSTO NO BANCO
# ============================================================
print("\n💾 5. Criando centros de custo no Supabase...")

centros_criados = {}

for i, centro_nome in enumerate(sorted(centros_unicos), 1):
    loja_nome = mapa_centro_loja.get(centro_nome, 'Escritório')
    loja_id = lojas.get(loja_nome)
    
    if not loja_id:
        print(f"   ⚠️  Loja '{loja_nome}' não encontrada, pulando centro '{centro_nome}'")
        continue
    
    # Gerar código
    codigo = f"CC{i:03d}"
    
    # Dados do centro
    centro_data = {
        'codigo': codigo,
        'nome': centro_nome,
        'descricao': f'Centro de custo recuperado do Yampa original',
        'loja_id': loja_id,
        'ativo': True
    }
    
    try:
        # Verificar se já existe
        existing = supabase.table('centros_custo').select('*').eq('nome', centro_nome).execute()
        
        if existing.data:
            centro_id = existing.data[0]['id']
            print(f"   ⚠️  Centro '{centro_nome}' já existe: {centro_id[:8]}...")
        else:
            # Criar novo
            response = supabase.table('centros_custo').insert(centro_data).execute()
            centro_id = response.data[0]['id']
            print(f"   ✅ Centro '{centro_nome}' criado: {centro_id[:8]}...")
        
        centros_criados[centro_nome] = centro_id
        
    except Exception as e:
        print(f"   ❌ Erro ao criar centro '{centro_nome}': {e}")

print(f"\n   📊 Total criados/encontrados: {len(centros_criados)} centros")

# ============================================================
# 6. CRIAR MAPA: Histórico → Centro de Custo
# ============================================================
print("\n🗺️  6. Criando mapeamento Histórico → Centro...")

mapa_historico_centro = {}
for _, row in df.iterrows():
    historico = str(row['Histórico']).strip()
    centro = row['Centro de custo']
    
    if pd.notna(centro) and historico:
        mapa_historico_centro[historico] = centro

print(f"   ✅ {len(mapa_historico_centro)} históricos únicos mapeados")

# Salvar mapa para uso posterior
mapa_file = Path(__file__).parent / 'mapa_historico_centro.json'
with open(mapa_file, 'w', encoding='utf-8') as f:
    json.dump(mapa_historico_centro, f, ensure_ascii=False, indent=2)

print(f"   💾 Mapa salvo em: {mapa_file}")

# ============================================================
# 7. ESTATÍSTICAS FINAIS
# ============================================================
print("\n" + "=" * 70)
print("📊 RESUMO:")
print("=" * 70)
print(f"   Registros no CSV original: {len(df)}")
print(f"   Centros de custo únicos: {len(centros_unicos)}")
print(f"   Centros criados no banco: {len(centros_criados)}")
print(f"   Históricos mapeados: {len(mapa_historico_centro)}")
print("\n✅ Centros de custo recriados com sucesso!")
print("\n💡 PRÓXIMO PASSO: Execute o script de atualização dos lançamentos")
print("   → python scripts/atualizar_lancamentos_centros.py")
print("=" * 70)
