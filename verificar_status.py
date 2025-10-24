import os
from supabase import create_client
from dotenv import load_dotenv
from collections import Counter

load_dotenv()

supabase = create_client(
    os.getenv('NEXT_PUBLIC_SUPABASE_URL'),
    os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')
)

print("=" * 80)
print("ANÁLISE DE LANÇAMENTOS - STATUS E TIPOS")
print("=" * 80)

# 1. Primeiro ver a estrutura da tabela
print("\n🔍 Verificando estrutura da tabela lancamentos...")
response = supabase.table('lancamentos').select('*').limit(1).execute()
if response.data:
    print(f"Campos disponíveis: {list(response.data[0].keys())}")

# 2. Buscar TODOS os lançamentos sem filtros
response = supabase.table('lancamentos').select('id, tipo, valor_total, status_aprovacao, competencia').execute()

print(f"\n📊 TOTAL DE LANÇAMENTOS NO BANCO: {len(response.data)}")

# 2. Analisar por tipo
tipos = Counter(item['tipo'] for item in response.data)
print(f"\n📋 POR TIPO:")
for tipo, count in tipos.items():
    total = sum(item['valor_total'] for item in response.data if item['tipo'] == tipo)
    print(f"   {tipo}: {count} lançamentos = R$ {total:,.2f}")

# 3. Analisar por status_aprovacao
status_aprov = Counter(item.get('status_aprovacao', 'NULL') for item in response.data)
print(f"\n✅ POR STATUS DE APROVAÇÃO:")
for status, count in status_aprov.items():
    total = sum(item['valor_total'] for item in response.data if item.get('status_aprovacao') == status)
    print(f"   {status}: {count} lançamentos = R$ {total:,.2f}")

# 4. Resumo do que você mencionou
print(f"\n🔍 VALIDANDO VALORES MENCIONADOS:")
pagar_total = sum(item['valor_total'] for item in response.data if item['tipo'] == 'pagar')
receber_total = sum(item['valor_total'] for item in response.data if item['tipo'] == 'receber')

print(f"   Total PAGAR (despesas): R$ {pagar_total:,.2f}")
print(f"   Total RECEBER (receitas): R$ {receber_total:,.2f}")

# 6. Verificar mês atual
print(f"\n📅 OUTUBRO 2025 (mês atual):")
outubro = [item for item in response.data if item.get('competencia', '').startswith('2025-10')]
print(f"   Total: {len(outubro)} lançamentos")
pagar_out = sum(item['valor_total'] for item in outubro if item['tipo'] == 'pagar')
receber_out = sum(item['valor_total'] for item in outubro if item['tipo'] == 'receber')
print(f"   Pagar: R$ {pagar_out:,.2f}")
print(f"   Receber: R$ {receber_out:,.2f}")

# 7. Mostrar alguns exemplos
print(f"\n📝 EXEMPLOS DE LANÇAMENTOS (primeiros 10):")
for item in response.data[:10]:
    print(f"   ID {item['id']}: {item['tipo']} - R$ {item['valor_total']:,.2f} - Status: {item.get('status_aprovacao')} - Competência: {item.get('competencia')}")

print("\n" + "=" * 80)
