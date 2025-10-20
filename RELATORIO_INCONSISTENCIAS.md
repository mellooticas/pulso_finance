# 🚨 RELATÓRIO CRÍTICO: Inconsistências no Schema

## 📊 DIAGNÓSTICO COMPLETO

### 1️⃣ **PROBLEMA PRINCIPAL: plano_contas**

**Schema Real (PostgreSQL):**
```sql
CREATE TABLE plano_contas (
  id UUID PRIMARY KEY,
  codigo TEXT UNIQUE NOT NULL,
  nome TEXT NOT NULL,
  categoria categoria_conta NOT NULL,  -- ✅ EXISTE
  grupo_dre grupo_dre,
  nivel INT NOT NULL DEFAULT 1,
  pai_id UUID REFERENCES plano_contas(id),
  -- ❌ NÃO TEM COLUNA "tipo"
);

CREATE TYPE categoria_conta AS ENUM (
  'receita', 
  'custo', 
  'despesa', 
  'investimento', 
  'outros'
);
```

**Interface TypeScript (❌ ERRADA):**
```typescript
export interface PlanoContas {
  id: string
  codigo: string
  nome: string
  tipo: 'receita' | 'despesa' | 'ativo' | 'passivo'  // ❌ COLUNA NÃO EXISTE!
  categoria: string  // ✅ Esta existe, mas tipo está errado
}
```

**Impacto:** Queries com `.select('tipo')` FALHAM. DRE, Balancete, Análise não funcionam corretamente.

---

### 2️⃣ **PROBLEMA SECUNDÁRIO: lancamentos.tipo**

**Schema Real:**
```sql
-- Lançamentos têm tipo='receita' ou tipo='despesa'
SELECT DISTINCT tipo FROM lancamentos;
-- Resultado: 'receita', 'despesa'
```

**Interface TypeScript (❌ ERRADA):**
```typescript
export interface Lancamento {
  tipo: 'receber' | 'pagar'  // ❌ VALORES ERRADOS!
  // Deveria ser: tipo: 'receita' | 'despesa'
}
```

**Status:** ✅ JÁ CORRIGIDO em `use-lancamentos.ts` e `lancamentos/page.tsx`

---

### 3️⃣ **CENTRO DE CUSTO - Status**

**Pergunta:** Filtros de centro de custo foram aplicados em TODOS os lugares?

**Resposta:** ✅ **SIM!** Implementado em:
- ✅ `use-dre.ts` - DREFilters com centroCustoId
- ✅ `dre/page.tsx` - 4 filtros UI
- ✅ `use-fluxo-caixa.ts` - FluxoCaixaFilters com centroCustoId
- ✅ `fluxo-caixa/page.tsx` - 4 filtros UI
- ✅ `use-lancamentos.ts` - LancamentoFilters com centro_custo_id
- ✅ `lancamentos/page.tsx` - 5 filtros UI (incluindo centro custo)
- ✅ `analise/page.tsx` - 4 filtros UI
- ✅ `balancete/page.tsx` - Filtros com centro custo

---

## 🔧 SOLUÇÕES NECESSÁRIAS

### **SOLUÇÃO 1: Corrigir Banco de Dados (RECOMENDADO ⭐)**

Execute o arquivo: `CORRIGIR_PLANO_CONTAS_TIPO.sql`

```sql
-- Adiciona coluna "tipo" ao plano_contas
ALTER TABLE plano_contas ADD COLUMN tipo tipo_conta;

-- Popula baseado na categoria
UPDATE plano_contas
SET tipo = CASE 
    WHEN categoria = 'receita' THEN 'receita'::tipo_conta
    WHEN categoria IN ('custo', 'despesa') THEN 'despesa'::tipo_conta
    ELSE 'despesa'::tipo_conta
END;
```

**Prós:**
- ✅ Mantém interfaces TypeScript atuais
- ✅ Resolve problema definitivamente
- ✅ Não quebra código existente

**Contras:**
- ⚠️ Requer migração no banco

---

### **SOLUÇÃO 2: Corrigir Interfaces TypeScript (ALTERNATIVA)**

Atualizar todas as interfaces para usar `categoria` em vez de `tipo`:

**Arquivos a alterar:**
1. `frontend/src/types/database.ts` - Interface PlanoContas
2. `frontend/src/hooks/use-dre.ts` - Queries e lógica DRE
3. `frontend/src/hooks/use-dashboard-data.ts` - Interface PlanoContaItem
4. `frontend/src/hooks/use-lancamentos.ts` - Interface plano_conta
5. `frontend/src/app/dashboard/plano-contas/page.tsx` - Interface local
6. `frontend/src/app/dashboard/balancete/page.tsx` - Interface BalanceteItem

**Prós:**
- ✅ Não precisa alterar banco

**Contras:**
- ❌ Muito trabalho (6+ arquivos)
- ❌ Pode quebrar outras funcionalidades
- ❌ "categoria" tem 5 valores, não 2 (receita/despesa)

---

## 📌 RECOMENDAÇÃO FINAL

### **✅ EXECUTAR SOLUÇÃO 1: Adicionar coluna `tipo` ao banco**

**Passos:**

1. **Execute no Supabase SQL Editor:**
   ```bash
   Copie e execute: CORRIGIR_PLANO_CONTAS_TIPO.sql
   ```

2. **Verifique resultado:**
   ```sql
   SELECT tipo, COUNT(*) FROM plano_contas GROUP BY tipo;
   -- Deve retornar:
   --   receita | XX
   --   despesa | YY
   ```

3. **Teste no frontend:**
   - Abra DRE - deve carregar sem erros
   - Abra Balancete - deve funcionar
   - Teste filtros em todas páginas

---

## 🎯 CHECKLIST DE VALIDAÇÃO

Após executar a correção:

- [ ] SQL executado com sucesso
- [ ] Coluna `tipo` existe em `plano_contas`
- [ ] Valores preenchidos (`SELECT COUNT(*) FROM plano_contas WHERE tipo IS NULL` = 0)
- [ ] DRE carrega sem erros
- [ ] Balancete funciona
- [ ] Análise financeira exibe dados
- [ ] Filtros funcionam em todas as páginas

---

## 📝 ARQUIVOS CRIADOS

1. `CORRIGIR_PLANO_CONTAS_TIPO.sql` - Script de correção
2. `DIAGNOSTICO_PLANO_CONTAS.sql` - Queries de diagnóstico
3. `RELATORIO_INCONSISTENCIAS.md` - Este arquivo

---

**Status:** ⏳ AGUARDANDO EXECUÇÃO DO SQL
**Prioridade:** 🔥 CRÍTICA
**Tempo estimado:** 2 minutos
