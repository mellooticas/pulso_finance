import os
from supabase import create_client
from dotenv import load_dotenv

load_dotenv()

supabase = create_client(
    os.getenv('NEXT_PUBLIC_SUPABASE_URL'),
    os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')
)

print("=" * 80)
print("VERIFICANDO TABELAS DE CONTAS A PAGAR/RECEBER")
print("=" * 80)

# Verificar tabela contas_pagar
try:
    print("\n🔍 Tabela CONTAS_PAGAR:")
    contas_pagar = supabase.table('contas_pagar').select('*').limit(5).execute()
    print(f"   Total de registros: {len(contas_pagar.data)}")
    if contas_pagar.data:
        print(f"   Campos: {list(contas_pagar.data[0].keys())}")
        
        # Contar total
        all_pagar = supabase.table('contas_pagar').select('valor').execute()
        total_pagar = sum(item['valor'] for item in all_pagar.data if item.get('valor'))
        print(f"   Valor total: R$ {total_pagar:,.2f}")
        
        # Exemplos
        print("\n   Primeiros 5:")
        for item in contas_pagar.data:
            print(f"      ID {item.get('id')}: R$ {item.get('valor', 0):,.2f} - Status: {item.get('status')}")
except Exception as e:
    print(f"   ❌ Erro: {e}")

# Verificar tabela contas_receber
try:
    print("\n🔍 Tabela CONTAS_RECEBER:")
    contas_receber = supabase.table('contas_receber').select('*').limit(5).execute()
    print(f"   Total de registros: {len(contas_receber.data)}")
    if contas_receber.data:
        print(f"   Campos: {list(contas_receber.data[0].keys())}")
        
        # Contar total
        all_receber = supabase.table('contas_receber').select('valor').execute()
        total_receber = sum(item['valor'] for item in all_receber.data if item.get('valor'))
        print(f"   Valor total: R$ {total_receber:,.2f}")
        
        # Exemplos
        print("\n   Primeiros 5:")
        for item in contas_receber.data:
            print(f"      ID {item.get('id')}: R$ {item.get('valor', 0):,.2f} - Status: {item.get('status')}")
except Exception as e:
    print(f"   ❌ Erro: {e}")

print("\n" + "=" * 80)
print("RESUMO:")
print("=" * 80)
print(f"Se os valores 72k e 32k estiverem nas tabelas contas_pagar/contas_receber,")
print(f"então precisamos GERAR os lançamentos a partir dessas parcelas!")
print("=" * 80)
