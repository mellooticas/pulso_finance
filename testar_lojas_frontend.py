#!/usr/bin/env python3
"""
TESTE COMPLETO: Verificar se lojas reais estão acessíveis
"""
from supabase import create_client

supabase = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'
)

print('\n' + '='*80)
print('TESTE: Lojas Acessíveis pelo Frontend (ANON KEY)')
print('='*80 + '\n')

# Simular exatamente o que o frontend faz
print('1. Query que o hook useLojas() executa:')
print('   SELECT * FROM lojas ORDER BY codigo\n')

try:
    lojas = supabase.from_('lojas').select('*').order('codigo').execute()
    lojas_data = lojas.data
    has_error = False
except Exception as e:
    print(f'   ❌ ERRO: {e}')
    lojas_data = []
    has_error = True

if has_error:
    print('\n   PROBLEMA: RLS (Row Level Security) pode estar bloqueando!')
    print('   Solução: Desabilitar RLS ou criar policy pública para SELECT')
if has_error:
    print('\n   PROBLEMA: RLS (Row Level Security) pode estar bloqueando!')
    print('   Solução: Desabilitar RLS ou criar policy pública para SELECT')
else:
    print(f'   ✅ {len(lojas_data)} lojas encontradas!\n')
    
    print('   Lojas disponíveis no dropdown:')
    print('   ' + '-'*76)
    print(f'   {"Código":<10} {"Nome":<30} {"Ativa":<10} {"ID"[:8]}')
    print('   ' + '-'*76)
    
    for loja in lojas_data:
        status = '✓ Sim' if loja.get('ativa', True) else '✗ Não'
        print(f'   {loja["codigo"]:<10} {loja["nome"]:<30} {status:<10} {loja["id"][:8]}...')
    
    print('   ' + '-'*76)

# Verificar RLS
print('\n2. Verificar políticas de RLS na tabela lojas:')
print('   (checando se há policies públicas...)\n')

# Tentar query com service key para comparar
supabase_service = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.tfb9GKEBsrNo1ll3acE9ZZgqwmi_LiPnZY2N9-AF8u0'
)

lojas_service = supabase_service.from_('lojas').select('*', count='exact', head=True).execute()

print(f'   Com ANON KEY: {len(lojas_data) if not has_error else 0} lojas')
print(f'   Com SERVICE KEY: {lojas_service.count} lojas')

if lojas_service.count > len(lojas_data if not has_error else []):
    print('\n   ⚠️ RLS ESTÁ BLOQUEANDO ALGUMAS LOJAS!')
    print('   Frontend só vê lojas permitidas pela policy')
elif has_error:
    print('\n   ❌ RLS BLOQUEOU TOTALMENTE!')
    print('   Frontend não consegue acessar nenhuma loja')
else:
    print('\n   ✅ RLS OK! Frontend tem acesso a todas as lojas')

print('\n' + '='*80)
print('CONCLUSÃO:')
print('='*80)

if has_error:
    print('❌ PROBLEMA: Frontend NÃO consegue acessar lojas!')
    print('   Causa: RLS (Row Level Security) bloqueando')
    print('   Solução:')
    print('   1. Ir no Supabase Dashboard')
    print('   2. Table Editor → lojas → RLS')
    print('   3. Criar policy: SELECT para anon role')
    print('   OU desabilitar RLS temporariamente')
else:
    print(f'✅ SUCESSO: Frontend tem acesso a {len(lojas_data)} lojas reais!')
    print('   As lojas aparecerão no dropdown dos filtros')
    print('   Nenhuma loja está mockada!')

print('='*80 + '\n')
