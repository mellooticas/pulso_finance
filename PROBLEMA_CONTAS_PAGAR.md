# 🔍 PROBLEMA: Contas a Pagar não aparecem em Outubro/2025

## 📋 SITUAÇÃO REPORTADA

**Data:** 20/10/2025  
**Filtro:** Até final do mês (31/10/2025)  
**Problema:** Nenhuma conta a pagar aparece

---

## 🎯 CAUSA RAIZ IDENTIFICADA

### **Diferença entre COMPETÊNCIA vs VENCIMENTO:**

| Campo | Significado | Exemplo |
|-------|-------------|---------|
| **`competencia`** | Quando o lançamento foi contabilizado/cadastrado | 15/08/2024 |
| **`data_vencimento`** | Quando a conta vence (pagamento devido) | 25/10/2025 |

### **Problema no Código:**

```typescript
// ❌ CÓDIGO ATUAL (ERRADO):
const { data: contasPagar } = useLancamentos({
  data_inicio: '2025-10-01',  // Filtra por COMPETÊNCIA
  data_fim: '2025-10-31',
  tipo: 'despesa'
})
```

**O que acontece:**
1. Busca lançamentos com **competência** em outubro/2025
2. Mas lançamentos foram cadastrados meses atrás (ex: agosto/2024)
3. O **vencimento** está em outubro/2025, mas não é usado no filtro!
4. **Resultado:** Nenhuma conta aparece ❌

---

## 🔧 SOLUÇÃO IMPLEMENTADA

### **1. Novo Hook Especializado: `use-contas-pagar-receber.ts`**

```typescript
// ✅ NOVO CÓDIGO (CORRETO):
export function useContasPagar(filters) {
  let query = supabase
    .from('lancamentos')
    .eq('tipo', 'despesa')
    // 🔑 FILTRA POR VENCIMENTO (não competência!)
    .gte('data_vencimento', filters.data_vencimento_inicio)
    .lte('data_vencimento', filters.data_vencimento_fim)
}
```

**Benefícios:**
- ✅ Filtra por data de vencimento (quando deve ser pago)
- ✅ Mostra contas futuras corretamente
- ✅ Separa conceitos: lançamentos históricos vs contas a pagar

---

## 📊 CENÁRIOS E EXEMPLOS

### **CENÁRIO 1: Conta cadastrada em agosto, vence em outubro**

```sql
-- Lançamento no banco:
{
  id: 'abc-123',
  descricao: 'Aluguel Loja Suzano',
  competencia: '2024-08-15',      -- Quando foi cadastrado
  data_vencimento: '2025-10-25',  -- Quando vence
  valor: 5000,
  tipo: 'despesa'
}
```

**Comportamento:**

| Query | Filtro | Resultado |
|-------|--------|-----------|
| ❌ `useLancamentos()` | `competencia >= '2025-10-01'` | **NÃO APARECE** |
| ✅ `useContasPagar()` | `data_vencimento >= '2025-10-01'` | **APARECE!** |

---

### **CENÁRIO 2: Parcelas mensais**

```sql
-- Várias parcelas do mesmo lançamento:
Parcela 1: competencia='2024-01-01', vencimento='2025-09-25' ✅ Paga
Parcela 2: competencia='2024-01-01', vencimento='2025-10-25' ⏳ Pendente
Parcela 3: competencia='2024-01-01', vencimento='2025-11-25' ⏳ Futuro
```

**Com novo hook:**
- Filtro out/2025: Mostra Parcela 2 ✅
- Filtro nov/2025: Mostra Parcela 3 ✅

---

## 🔄 MIGRAÇÃO NECESSÁRIA

### **Atualizar Página `contas-pagar/page.tsx`:**

```typescript
// ❌ ANTES:
import { useLancamentos } from '@/hooks/use-lancamentos'

const { data: contasPagar } = useLancamentos({
  data_inicio: periodo.inicio,  // competencia
  data_fim: periodo.fim,
  tipo: 'despesa'
})

// ✅ DEPOIS:
import { useContasPagar, useContasPagarStats } from '@/hooks/use-contas-pagar-receber'

const { data: contasPagar } = useContasPagar({
  data_vencimento_inicio: periodo.inicio,  // vencimento!
  data_vencimento_fim: periodo.fim,
  loja_id: lojaFiltro,
  centro_custo_id: centroCustoFiltro
})

const { data: stats } = useContasPagarStats({
  data_vencimento_inicio: periodo.inicio,
  data_vencimento_fim: periodo.fim
})
```

---

## 📝 ARQUIVOS CRIADOS/MODIFICADOS

### **Novos Arquivos:**
1. ✅ `use-contas-pagar-receber.ts` - Hook especializado
2. ✅ `INVESTIGAR_CONTAS_PAGAR.sql` - Queries de diagnóstico
3. ✅ `PROBLEMA_CONTAS_PAGAR.md` - Esta documentação

### **Arquivos a Atualizar:**
1. ⏳ `contas-pagar/page.tsx` - Usar novo hook
2. ⏳ `contas-receber/page.tsx` - Usar novo hook (se existir)
3. ⏳ Dashboard widgets que mostram contas futuras

---

## 🧪 COMO TESTAR

### **1. Execute SQL de Diagnóstico:**

```bash
# Execute no Supabase: INVESTIGAR_CONTAS_PAGAR.sql
```

**Verificar:**
- Existem lançamentos com `data_vencimento` em out/2025?
- Qual o range de datas de vencimento no banco?
- Quantas contas pendentes com vencimento futuro?

### **2. Teste no Frontend:**

```bash
cd /d/projetos/pulso_finance/frontend
npm run dev
```

**Navegue para:** `/dashboard/contas-pagar`

**Verificar:**
- Filtro de data deve buscar por vencimento
- Contas futuras devem aparecer
- Estatísticas (vencidas, a vencer) devem calcular correto

---

## 💡 BOAS PRÁTICAS

### **Quando usar cada filtro:**

| Tela/Relatório | Usar Filtro | Motivo |
|----------------|-------------|--------|
| **DRE** | `competencia` | Regime de competência contábil |
| **Fluxo de Caixa** | `competencia` | Movimentações reais do período |
| **Lançamentos** | `competencia` | Histórico de lançamentos |
| **Contas a Pagar** | `data_vencimento` | Controle de pagamentos futuros |
| **Contas a Receber** | `data_vencimento` | Controle de recebimentos futuros |
| **Previsão Caixa** | `data_vencimento` | Projeções futuras |

---

## 🚀 PRÓXIMOS PASSOS

1. **Executar SQL** `INVESTIGAR_CONTAS_PAGAR.sql` para confirmar dados
2. **Atualizar** `contas-pagar/page.tsx` para usar novo hook
3. **Testar** filtros de vencimento no frontend
4. **Validar** estatísticas (vencidas, a vencer, pagas)
5. **Replicar** para `contas-receber` se necessário

---

## ✅ CHECKLIST DE VALIDAÇÃO

Após implementar:

- [ ] SQL executado - dados analisados
- [ ] `contas-pagar/page.tsx` atualizada
- [ ] Filtro por vencimento funcionando
- [ ] Contas futuras aparecem
- [ ] Estatísticas corretas (vencidas/a vencer)
- [ ] Performance OK (<2s)
- [ ] Filtros de loja/centro custo funcionando

---

**Status:** ✅ SOLUÇÃO IDENTIFICADA E IMPLEMENTADA  
**Próximo:** Atualizar página para usar novo hook
