#!/usr/bin/env python3
"""
VERIFICACAO COMPLETA: Dados Reais vs Mock
"""
from supabase import create_client

print('\n' + '='*80)
print('VERIFICACAO: DADOS REAIS NO SUPABASE')
print('='*80 + '\n')

supabase = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.tfb9GKEBsrNo1ll3acE9ZZgqwmi_LiPnZY2N9-AF8u0'
)

# 1. LANCAMENTOS
lancamentos = supabase.table('lancamentos').select('*', count='exact').limit(3).execute()
print(f'1. LANCAMENTOS: {lancamentos.count:,} registros')
if lancamentos.data:
    print(f'\n   Amostra dos ultimos 3 lancamentos:')
    for i, lanc in enumerate(lancamentos.data, 1):
        print(f'   {i}. {lanc.get("descricao", "N/A")[:60]}')
        print(f'      Valor: R$ {lanc.get("valor_total", 0):,.2f} | Data: {lanc.get("competencia")}')

# 2. PARCELAS
parcelas_total = supabase.table('parcelas').select('id', count='exact', head=True).execute()
parcelas_pagas = supabase.table('parcelas').select('id', count='exact', head=True).eq('status', 'pago').execute()
print(f'\n2. PARCELAS: {parcelas_total.count:,} registros')
print(f'   Pagas: {parcelas_pagas.count:,} ({parcelas_pagas.count/max(parcelas_total.count,1)*100:.1f}%)')

# 3. LOJAS
lojas = supabase.table('lojas').select('id, nome, codigo').execute()
print(f'\n3. LOJAS: {len(lojas.data)} registros')
for loja in lojas.data[:5]:
    # Contar parcelas por loja
    parc_loja = supabase.table('parcelas') \
        .select('id, lancamentos!inner(loja_id)', count='exact', head=True) \
        .eq('status', 'pago') \
        .eq('lancamentos.loja_id', loja['id']) \
        .execute()
    qtd = parc_loja.count or 0
    status = 'REAL' if qtd > 0 else 'VAZIA'
    print(f'   - {loja["nome"]:<25} {loja["codigo"]:<10} {qtd:>6,} parcelas [{status}]')

# 4. FORNECEDORES
fornecedores = supabase.table('fornecedores').select('id', count='exact', head=True).execute()
print(f'\n4. FORNECEDORES: {fornecedores.count:,} registros')

# 5. PLANO DE CONTAS
plano = supabase.table('plano_contas').select('id', count='exact', head=True).execute()
print(f'\n5. PLANO DE CONTAS: {plano.count:,} registros')

# 6. CENTROS DE CUSTO
centros = supabase.table('centros_custo').select('id', count='exact', head=True).execute()
print(f'\n6. CENTROS DE CUSTO: {centros.count:,} registros')

# 7. VERIFICAR TIPOS
print(f'\n7. DISTRIBUICAO POR TIPO:')
receber = supabase.table('lancamentos').select('id', count='exact', head=True).eq('tipo', 'receber').execute()
pagar = supabase.table('lancamentos').select('id', count='exact', head=True).eq('tipo', 'pagar').execute()
print(f'   Receber: {receber.count:,}')
print(f'   Pagar: {pagar.count:,}')

# 8. PERIODO DOS DADOS
query_periodo = supabase.table('lancamentos') \
    .select('competencia') \
    .order('competencia', desc=False) \
    .limit(1) \
    .execute()
primeira_data = query_periodo.data[0]['competencia'] if query_periodo.data else 'N/A'

query_periodo2 = supabase.table('lancamentos') \
    .select('competencia') \
    .order('competencia', desc=True) \
    .limit(1) \
    .execute()
ultima_data = query_periodo2.data[0]['competencia'] if query_periodo2.data else 'N/A'

print(f'\n8. PERIODO DOS DADOS:')
print(f'   Primeira: {primeira_data}')
print(f'   Ultima: {ultima_data}')

print('\n' + '='*80)
print('CONCLUSAO:')
print('='*80)

if lancamentos.count >= 12000:
    print(f'✅ DADOS REAIS POVOADOS!')
    print(f'   {lancamentos.count:,} lancamentos')
    print(f'   {parcelas_pagas.count:,} parcelas pagas')
    print(f'   Periodo: {primeira_data} a {ultima_data}')
    print(f'\n🎯 O DASHBOARD DEVE MOSTRAR ESSES DADOS REAIS!')
else:
    print(f'⚠️ POUCOS DADOS!')
    print(f'   Apenas {lancamentos.count} lancamentos')
    print(f'   Recomendado: > 12.000 para dados reais')

print('='*80 + '\n')
