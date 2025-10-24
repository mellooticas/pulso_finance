# 🔍 DIAGNÓSTICO: Dados Insuficientes para Previsões ML

## Situação Atual

✅ **API ML funcionando perfeitamente**
- Servidor FastAPI rodando em http://localhost:8000
- Health check: OK
- Conexão Supabase: OK

⚠️ **Problema: Banco de dados vazio**
- Total de lançamentos: 12
- Total de parcelas: 12
- Parcelas pagas: 2
- **Período: 2020-10-01 (5 anos atrás!)**

## Por que não funciona?

O sistema de previsão ML precisa de **pelo menos 30 dias de dados históricos recentes** para treinar o modelo Prophet e gerar previsões precisas.

Atualmente você tem:
- ❌ Apenas 2 parcelas pagas (mínimo: 30)
- ❌ Dados de 2020 (precisam ser recentes)
- ❌ Sem variação temporal (todas na mesma data)

## 🚀 Soluções

### Opção 1: Usar Scripts de Povoamento (RECOMENDADO)

O projeto já tem scripts prontos para povoar o banco com dados realistas:

```bash
# Windows
cd D:\projetos\pulso_finance
.\POVOAR_TURBO.bat

# Ou manualmente
cd supabase
psql -h db.fxsgphqzazcbjcyfqeyg.supabase.co -U postgres -d postgres -f migrations/seeds/gerar_dados_teste.sql
```

Esses scripts vão criar:
- ✅ Lançamentos dos últimos 12 meses
- ✅ Receitas e despesas variadas
- ✅ Parcelas pagas/pendentes
- ✅ Dados distribuídos no tempo
- ✅ Múltiplas lojas e centros de custo

### Opção 2: Criar Dados Manualmente via Frontend

1. Acesse: http://localhost:3000/dashboard/lancamentos
2. Crie lançamentos manualmente:
   - **Tipo**: ENTRADA (receitas) e SAIDA (despesas)
   - **Datas**: Distribuídas nos últimos 3 meses
   - **Valores**: Variados e realistas
   - **Status das parcelas**: Marcar como "pago"
   - **Quantidade mínima**: 30-50 lançamentos

### Opção 3: Gerar Dados de Teste com Python

Execute este script para gerar dados de teste rapidamente:

```python
# D:/projetos/pulso_finance/scripts/gerar_dados_teste.py
from supabase import create_client
from datetime import datetime, timedelta
import random
import os
from dotenv import load_dotenv

load_dotenv()

supabase = create_client(
    os.getenv('NEXT_PUBLIC_SUPABASE_URL'),
    os.getenv('SUPABASE_SERVICE_ROLE_KEY')
)

# Pegar primeira loja
lojas = supabase.table('lojas').select('id').limit(1).execute()
if not lojas.data:
    print("Nenhuma loja encontrada!")
    exit()

loja_id = lojas.data[0]['id']

# Pegar plano de contas
planos = supabase.table('plano_contas').select('id, tipo').execute()
plano_receita = [p for p in planos.data if p['tipo'] == 'RECEITA'][0]['id']
plano_despesa = [p for p in planos.data if p['tipo'] == 'DESPESA'][0]['id']

# Gerar 60 lançamentos (últimos 60 dias)
print("Gerando lançamentos...")
for i in range(60):
    data = (datetime.now() - timedelta(days=i)).strftime('%Y-%m-%d')
    
    # Receita
    supabase.table('lancamentos').insert({
        'loja_id': loja_id,
        'tipo': 'ENTRADA',
        'plano_id': plano_receita,
        'descricao': f'Receita dia {data}',
        'competencia': data,
        'valor_total': random.randint(1000, 5000),
        'num_parcelas': 1
    }).execute()
    
    # Despesa
    supabase.table('lancamentos').insert({
        'loja_id': loja_id,
        'tipo': 'SAIDA',
        'plano_id': plano_despesa,
        'descricao': f'Despesa dia {data}',
        'competencia': data,
        'valor_total': random.randint(500, 2000),
        'num_parcelas': 1
    }).execute()

print("✅ Dados gerados com sucesso!")
```

Execute:
```bash
cd D:\projetos\pulso_finance
python scripts/gerar_dados_teste.py
```

## 🧪 Após Povoar os Dados

1. **Verifique novamente**:
   ```bash
   cd apps/ml
   python check_data.py
   ```

2. **Deve aparecer**:
   ```
   ✓ DADOS SUFICIENTES para previsoes!
   Dias de historico: 60+
   ```

3. **Teste as previsões**:
   - Acesse: http://localhost:3000/dashboard/previsoes
   - Selecione período (30 dias)
   - Visualize gráficos e análises

## 📊 O que você verá funcionando

Com dados suficientes, o sistema mostrará:

- **📈 Receitas Previstas**: Projeção de faturamento futuro
- **📉 Despesas Previstas**: Estimativa de gastos
- **💰 Fluxo de Caixa**: Saldo projetado (receitas - despesas)
- **⚠️ Anomalias**: Padrões incomuns detectados automaticamente
- **📊 Tendências**: Crescimento, queda ou estabilidade
- **🎯 Confiança**: Intervalos superior e inferior

## ❓ Próximos Passos

Qual opção você prefere para povoar o banco?

1. **POVOAR_TURBO.bat** (automatizado, recomendado)
2. **Frontend manual** (mais controle, mais demorado)
3. **Script Python** (rápido, dados aleatórios)

Avise qual você escolher e eu te ajudo com os próximos passos!
