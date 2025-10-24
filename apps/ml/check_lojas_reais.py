#!/usr/bin/env python3
"""
Identifica lojas REAIS vs TESTE no banco de dados
"""
from supabase import create_client

supabase = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.tfb9GKEBsrNo1ll3acE9ZZgqwmi_LiPnZY2N9-AF8u0'
)

# Buscar lojas
lojas_query = supabase.table('lojas').select('id, nome, razao_social, cnpj').execute()

print('\nANALISE DE LOJAS REAIS vs TESTE:\n')
print(f'{"Nome":<25} {"CNPJ":<20} {"Status":<15} {"Parcelas Pagas"}')
print('='*90)

lojas_reais = []
lojas_teste = []

for loja in lojas_query.data:
    # Verificar se é loja de teste
    cnpj = loja.get('cnpj', '') or ''
    nome = loja['nome'] or 'SEM NOME'
    
    # Critérios para identificar loja de teste:
    is_teste = (
        not cnpj or 
        cnpj in ['00.000.000/0000-00', '11.111.111/0001-11', '99.999.999/0001-99'] or
        'teste' in nome.lower() or
        'demo' in nome.lower()
    )
    
    # Contar parcelas pagas
    parcelas = supabase.table('parcelas') \
        .select('id, lancamentos!inner(loja_id)', count='exact') \
        .eq('status', 'pago') \
        .eq('lancamentos.loja_id', loja['id']) \
        .execute()
    
    qtd_parcelas = parcelas.count if parcelas.count else 0
    
    status = 'TESTE' if is_teste else 'REAL'
    print(f'{nome:<25} {cnpj:<20} {status:<15} {qtd_parcelas}')
    
    if is_teste:
        lojas_teste.append(loja)
    else:
        if qtd_parcelas > 0:
            lojas_reais.append((loja, qtd_parcelas))

print(f'\n' + '='*90)
print(f'RESUMO:')
print(f'Lojas REAIS com dados: {len(lojas_reais)}')
print(f'Lojas TESTE: {len(lojas_teste)}')

if lojas_reais:
    print(f'\nLOJAS REAIS PRIORIZADAS PARA ML:')
    # Ordenar por quantidade de parcelas (mais dados = melhor)
    lojas_reais.sort(key=lambda x: x[1], reverse=True)
    for loja, qtd in lojas_reais[:5]:
        print(f'  - {loja["nome"]:<20} | {qtd:>5} parcelas | ID: {loja["id"][:8]}...')
        
print('\n')
