from supabase import create_client
import os
from dotenv import load_dotenv
from datetime import datetime, timedelta
from collections import Counter

load_dotenv()

# Conecta ao Supabase
supabase = create_client(
    os.getenv('NEXT_PUBLIC_SUPABASE_URL'),
    os.getenv('SUPABASE_SERVICE_ROLE_KEY')
)

# Verifica parcelas pagas/recebidas dos últimos 90 dias
data_inicio = (datetime.now() - timedelta(days=90)).strftime('%Y-%m-%d')
response = supabase.table('parcelas').select('''
    vencimento,
    valor_pago,
    status,
    lancamento_id,
    lancamentos!inner(tipo, competencia, valor_total)
''').gte('vencimento', data_inicio).eq('status', 'pago').execute()

total = len(response.data)
print(f'\n=== ANALISE DE DADOS (ultimos 90 dias) ===')
print(f'Total de parcelas pagas/recebidas: {total}')

if total > 0:
    # Agrupa por tipo de lançamento
    por_tipo = Counter([p['lancamentos']['tipo'] for p in response.data])
    print(f'\nPor tipo:')
    for tipo, count in por_tipo.items():
        print(f'  {tipo}: {count}')
    
    # Verifica período
    datas = [p['vencimento'] for p in response.data]
    print(f'\nPeriodo: {min(datas)} ate {max(datas)}')
    dias = (datetime.fromisoformat(max(datas)) - datetime.fromisoformat(min(datas))).days
    print(f'Dias de historico: {dias}')
    
    if dias >= 30:
        print('\n✓ DADOS SUFICIENTES para previsoes!')
    else:
        print(f'\n✗ DADOS INSUFICIENTES - Necessario minimo 30 dias')
        print(f'  Faltam {30 - dias} dias de historico')
else:
    print('\n✗ NENHUMA parcela paga/recebida encontrada nos ultimos 90 dias')

print('\n===========================================\n')
