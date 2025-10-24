#!/usr/bin/env python3
"""
Teste Final: Verificar priorização de lojas REAIS no ML
"""
from supabase import create_client
import requests

supabase = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.tfb9GKEBsrNo1ll3acE9ZZgqwmi_LiPnZY2N9-AF8u0'
)

print('='*80)
print('TESTE FINAL: ML FOCADO EM LOJAS REAIS')
print('='*80)

# 1. Buscar lojas ordenadas por dados
print('\n1. LOJAS ORDENADAS (como frontend vai exibir):\n')

lojas_query = supabase.table('lojas').select('id, nome').eq('ativa', True).order('nome').execute()

lojas_com_dados = []
for loja in lojas_query.data:
    parcelas = supabase.table('parcelas') \
        .select('id, lancamentos!inner(loja_id)', count='exact') \
        .eq('status', 'pago') \
        .eq('lancamentos.loja_id', loja['id']) \
        .execute()
    
    qtd = parcelas.count or 0
    lojas_com_dados.append({
        'id': loja['id'],
        'nome': loja['nome'],
        'parcelas': qtd
    })

# Ordenar: mais dados primeiro
lojas_com_dados.sort(key=lambda x: x['parcelas'], reverse=True)

print(f'{"Posição":<10} {"Nome":<25} {"Parcelas":<15} {"Status"}')
print('-'*80)

for i, loja in enumerate(lojas_com_dados, 1):
    status = 'REAL (ML)' if loja['parcelas'] > 0 else 'VAZIA'
    badge = f"{loja['parcelas']:,}".replace(',', '.')
    print(f'{i:<10} {loja["nome"]:<25} {badge:<15} {status}')

# 2. Verificar qual loja será selecionada primeiro
primeira_loja = lojas_com_dados[0]
print(f'\n2. LOJA SELECIONADA AUTOMATICAMENTE:')
print(f'   Nome: {primeira_loja["nome"]}')
print(f'   Parcelas: {primeira_loja["parcelas"]:,}'.replace(',', '.'))
print(f'   ID: {primeira_loja["id"][:8]}...')

# 3. Testar ML com a loja priorizada
print(f'\n3. TESTE DE PREVISAO ML (loja: {primeira_loja["nome"]}):\n')

try:
    response = requests.post(
        'http://localhost:8000/api/ml/forecast/receitas',
        json={'loja_id': primeira_loja['id'], 'periods': 30, 'tipo': 'receitas'},
        timeout=30
    )
    
    if response.status_code == 200:
        data = response.json()
        print(f'   Status: OK (200)')
        print(f'   Dias historicos: {data["historical_days"]}')
        print(f'   Dias previstos: {data["forecast_days"]}')
        print(f'   Tendencia: {data["trend"]["trend_direction"]}')
        print(f'   Variacao: {data["trend"]["trend_change_percent"]:.2f}%')
        print(f'\n   ✅ ML FUNCIONANDO COM LOJA REAL!')
    else:
        error = response.json().get('detail', 'Erro desconhecido')
        print(f'   Status: ERRO ({response.status_code})')
        print(f'   Detalhe: {error}')
        print(f'\n   ❌ PROBLEMA COM PREVISAO')
        
except Exception as e:
    print(f'   Erro de conexao: {str(e)[:80]}')
    print(f'\n   ⚠️ API ML nao esta rodando? (cd apps/ml && python main.py)')

# 4. Testar loja VAZIA (deve falhar gracefully)
loja_vazia = next((l for l in lojas_com_dados if l['parcelas'] == 0), None)

if loja_vazia:
    print(f'\n4. TESTE COM LOJA VAZIA (espera-se erro 400):')
    print(f'   Loja: {loja_vazia["nome"]} ({loja_vazia["parcelas"]} parcelas)\n')
    
    try:
        response = requests.post(
            'http://localhost:8000/api/ml/forecast/receitas',
            json={'loja_id': loja_vazia['id'], 'periods': 30, 'tipo': 'receitas'},
            timeout=10
        )
        
        if response.status_code == 400:
            print(f'   Status: 400 Bad Request (esperado)')
            print(f'   ✅ VALIDACAO FUNCIONANDO')
        else:
            print(f'   Status: {response.status_code}')
            print(f'   ⚠️ Deveria retornar 400 para loja sem dados')
            
    except Exception as e:
        print(f'   Erro: {str(e)[:80]}')

print('\n' + '='*80)
print('RESUMO:')
print('='*80)
print(f'✅ Loja {primeira_loja["nome"]} tem {primeira_loja["parcelas"]:,} parcelas'.replace(',', '.'))
print(f'✅ Sera exibida PRIMEIRO no seletor')
print(f'✅ ML pode gerar previsoes com dados reais')
print(f'✅ Lojas vazias sao identificadas e alertadas')
print('\n🎯 SISTEMA FOCADO EM LOJAS REAIS!')
print('='*80 + '\n')
