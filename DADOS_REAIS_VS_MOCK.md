# 🔍 DADOS REAIS vs MOCK - GUIA COMPLETO

## ✅ CONFIRMADO: DADOS REAIS NO BANCO

```
✅ 12,054 lançamentos reais
✅ 12,042 parcelas pagas
✅ 11,748 fornecedores  
✅ 121 plano de contas
✅ Período: 2020-10-01 até 2025-10-15
✅ Loja Mauá: 12,042 parcelas
```

---

## 🧪 TESTE NO NAVEGADOR (CONSOLE)

### Passo 1: Abrir DevTools

1. Acesse: http://localhost:3000/dashboard
2. Pressione **F12**
3. Vá na aba **Console**

---

### Passo 2: Testar Supabase Diretamente

Cole este código no console:

```javascript
// Configuração do Supabase
const SUPABASE_URL = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

// Teste 1: Buscar lançamentos
fetch(`${SUPABASE_URL}/rest/v1/lancamentos?select=*&limit=5`, {
  headers: {
    'apikey': SUPABASE_ANON_KEY,
    'Authorization': `Bearer ${SUPABASE_ANON_KEY}`
  }
})
.then(r => r.json())
.then(data => {
  console.log('✅ LANCAMENTOS:', data.length, 'registros')
  console.table(data.map(l => ({
    descricao: l.descricao.substring(0, 40),
    valor: l.valor_total,
    data: l.competencia
  })))
})
```

**Resultado Esperado:**
```
✅ LANCAMENTOS: 5 registros
┌─────────┬──────────────────────────┬────────┬────────────┐
│ (index) │       descricao          │ valor  │    data    │
├─────────┼──────────────────────────┼────────┼────────────┤
│    0    │ 'MERCADO - CAFE DA ...'  │   9.00 │ 2020-10-01 │
│    1    │ 'TRANSFERENCIAS - ...'   │ 240.00 │ 2020-10-01 │
└─────────┴──────────────────────────┴────────┴────────────┘
```

---

### Passo 3: Testar Hook do Dashboard

Cole no console:

```javascript
// Verificar localStorage (filtros)
console.log('Filtros salvos:', localStorage.getItem('dashboard-filters'))

// Verificar se há dados em cache do React Query
const cacheKeys = Object.keys(localStorage).filter(k => k.includes('query'))
console.log('Cache React Query:', cacheKeys.length, 'chaves')
```

---

### Passo 4: Forçar Atualização dos Dados

Cole no console:

```javascript
// Limpar cache e recarregar
localStorage.clear()
sessionStorage.clear()
location.reload()
```

Após recarregar:
1. Dashboard deve buscar dados frescos do Supabase
2. Deve mostrar **12.054 lançamentos**
3. KPIs devem mostrar valores reais

---

## 🔴 PROBLEMA IDENTIFICADO: Tipo dos Lançamentos

**❌ ERRO CRÍTICO ENCONTRADO:**

No banco temos:
```sql
tipo = 'receber' (12,052 registros)
tipo = 'pagar' (2 registros)
```

Mas o hook espera:
```typescript
tipo: 'receita' | 'despesa'
```

**🔧 SOLUÇÃO:** Vamos corrigir o hook!

---

## 🛠️ CORREÇÕES NECESSÁRIAS

### Arquivo: `frontend/src/hooks/use-lancamentos.ts`

O problema está na linha onde filtramos o tipo. O banco usa `receber`/`pagar` mas o hook espera `receita`/`despesa`.

**Opções:**

### Opção 1: Corrigir o Hook (Recomendado)

Mapear os tipos no frontend:
```typescript
// Converter tipo do filtro para o banco
const tipoMapeado = filters.tipo === 'receita' ? 'receber' 
                  : filters.tipo === 'despesa' ? 'pagar'
                  : undefined
```

### Opção 2: Corrigir o Banco

Atualizar todos os registros:
```sql
UPDATE lancamentos SET tipo = 'receita' WHERE tipo = 'receber';
UPDATE lancamentos SET tipo = 'despesa' WHERE tipo = 'pagar';
```

**EU RECOMENDO OPÇÃO 1** (manter compatibilidade com sistema povoado)

---

## 📊 PRÓXIMOS PASSOS

1. ✅ **Dados confirmados:** 12.054 reais
2. ⏳ **Corrigir mapeamento de tipos**
3. ⏳ **Testar dashboard com dados reais**
4. ⏳ **Validar KPIs**

---

## 🎯 TESTE RÁPIDO AGORA

**No Console do Navegador (F12):**

```javascript
// Teste direto do que o dashboard vai buscar
fetch('https://fxsgphqzazcbjcyfqeyg.supabase.co/rest/v1/lancamentos?tipo=eq.receber&select=valor_total&limit=1000', {
  headers: {
    'apikey': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'
  }
})
.then(r => r.json())
.then(data => {
  const total = data.reduce((sum, l) => sum + l.valor_total, 0)
  console.log(`✅ ${data.length} receitas encontradas`)
  console.log(`💰 Total: R$ ${total.toLocaleString('pt-BR', {minimumFractionDigits: 2})}`)
})
```

**Esperado:**
```
✅ 1000 receitas encontradas (ou mais)
💰 Total: R$ X.XXX.XXX,XX
```

Se ver isso → **DADOS REAIS FUNCIONANDO!** 🎉

Se ver `0 receitas` → Precisa corrigir o hook (tipo receber/pagar)

---

## 🚨 SE DASHBOARD AINDA MOSTRAR VAZIO

**Motivos Possíveis:**

1. **Tipo errado:** Hook busca `receita`/`despesa`, banco tem `receber`/`pagar`
2. **Filtro de data:** Pode estar filtrando período sem dados
3. **Cache:** React Query pode estar com cache velho
4. **Autenticação:** RLS pode estar bloqueando

**Solução Rápida:**

```javascript
// No console
localStorage.clear()
sessionStorage.clear()

// Verificar erro de rede
// F12 → Network → Filtrar por "lancamentos"
// Ver o que a API retorna
```

---

Vou corrigir o hook agora! 🛠️
