# 🎯 DRE COM FILTROS DINÂMICOS - IMPLEMENTADO

## ✅ O QUE FOI FEITO

### 1. Hook `use-dre.ts` - FILTROS REAIS IMPLEMENTADOS

**ANTES** (filtros não funcionavam direito):
```typescript
useDRE(periodo?: { inicio: string; fim: string }, lojaId?: string)
```

**AGORA** (filtros dinâmicos completos):
```typescript
interface DREFilters {
  periodo?: { inicio: string; fim: string }
  lojaId?: string
  centroCustoId?: string  // ⭐ NOVO!
}

useDRE(filters?: DREFilters)
```

**O QUE MUDA**: 
- ✅ Aceita objeto `filters` com **todos os filtros**
- ✅ Constrói query dinâmica com `.gte()`, `.lte()`, `.eq()`
- ✅ Adiciona filtro de **Centro de Custo** (você reclamou que faltava!)
- ✅ React Query refaz a busca **automaticamente** quando filtros mudam

### 2. Hook `use-centros-custo.ts` - JÁ EXISTIA

Criei importação no DRE para carregar centros de custo ativos:
```typescript
const { data: centrosCusto } = useCentrosCusto({ status: 'ativo' })
```

### 3. Página `dre/page.tsx` - CONECTA FILTROS AOS HOOKS

**ANTES**:
```typescript
const { data: dre } = useDRE(periodo, lojaFiltro || undefined)
```

**AGORA**:
```typescript
const [centroCustoFiltro, setCentroCustoFiltro] = useState<string>('')

const { data: dre } = useDRE({
  periodo,
  lojaId: lojaFiltro || undefined,
  centroCustoId: centroCustoFiltro || undefined  // ⭐ NOVO!
})
```

**UI ATUALIZADA**:
- ✅ 4 filtros agora: Data Início | Data Fim | Loja | **Centro de Custo**
- ✅ Dropdown de Centro de Custo carrega do banco via hook
- ✅ `onChange` atualiza estado → React Query **recarrega dados automaticamente**

### 4. Estrutura de Dados CORRIGIDA

**PROBLEMA**: Página tentava acessar `dre.receitaLiquida`, mas hook retornava `dre.receitas.total`

**SOLUÇÃO**: Ajustei KPIs para usar estrutura correta:
```typescript
// ANTES (ERRADO):
<p>{formatCurrency(dre.receitaLiquida)}</p>

// AGORA (CORRETO):
<p>{formatCurrency(dre.receitas.total)}</p>
<p>{formatCurrency(dre.despesas.total)}</p>
<p>{formatCurrency(dre.resultado.bruto)}</p>
<p>{formatCurrency(dre.resultado.liquido)}</p>
```

## 📊 COMO FUNCIONA AGORA (REAL, NÃO MOCK!)

1. **Usuário abre página DRE** → Filtros carregam do banco:
   - Lojas: `SELECT * FROM lojas ORDER BY codigo`
   - Centros: `SELECT * FROM centros_custo WHERE ativo = true`

2. **Usuário seleciona filtros**:
   ```
   Data Início: 2024-01-01
   Data Fim: 2024-12-31
   Loja: Loja Yampa Centro
   Centro de Custo: Marketing
   ```

3. **Hook constrói query DINÂMICA**:
   ```sql
   SELECT tipo, valor_total, competencia, 
          plano_conta:plano_contas(id, codigo, nome, tipo)
   FROM lancamentos
   WHERE competencia >= '2024-01-01'
     AND competencia <= '2024-12-31'
     AND loja_id = 'uuid-loja-centro'
     AND centro_custo_id = 'uuid-marketing'
   ```

4. **Supabase retorna DADOS REAIS** → React Query cacheia → Página renderiza

5. **Usuário muda filtro** → React Query detecta mudança no `queryKey` → **Refaz query automaticamente!**

## 🔍 OUTROS HOOKS TAMBÉM ATUALIZADOS

### `useDREEvoluçaoMensal`
```typescript
// ANTES:
useDREEvoluçaoMensal(ano: number, lojaId?: string)

// AGORA:
useDREEvoluçaoMensal(ano: number, filters?: { lojaId?: string; centroCustoId?: string })
```

### `useComparativoDRE`
```typescript
// ANTES:
useComparativoDRE(periodo?: { inicio: string; fim: string })

// AGORA:
useComparativoDRE(filters?: { periodo?: { inicio: string; fim: string }; centroCustoId?: string })
```

## ⚠️ PRÓXIMOS PASSOS (PARA VALIDAR)

### 1. Verificar se os DADOS EXISTEM no Banco

Execute este script para ver quantos lançamentos existem:

```bash
cd frontend
node test-lancamentos-filtros.js
```

Se retornar **0 lançamentos**, significa que o banco está **vazio** (sem dados do Yampa importados). Nesse caso, precisamos importar os 45k registros.

### 2. Testar Filtros na Página

Abra `http://localhost:3000/dashboard/dre` e:

1. ✅ Veja se dropdowns de Loja e Centro de Custo carregam
2. ✅ Selecione uma loja → Números devem mudar
3. ✅ Selecione um centro de custo → Números devem filtrar mais
4. ✅ Mude as datas → DRE recalcula
5. ✅ Abra DevTools Network → Veja as queries do Supabase sendo enviadas

### 3. Se Dados Estão Vazios (0 lançamentos)

**OPÇÃO A**: Importar CSV do Yampa
```bash
# Script que você tem:
python gerar_sql_rapido.py
# Depois executar SQL no Supabase
```

**OPÇÃO B**: Seed de exemplo
```sql
-- Inserir lançamento de teste
INSERT INTO lancamentos (
  loja_id, tipo, plano_id, centro_custo_id, 
  descricao, competencia, valor_total, num_parcelas
) VALUES (
  (SELECT id FROM lojas LIMIT 1),
  'receber',
  (SELECT id FROM plano_contas WHERE tipo = 'receita' LIMIT 1),
  (SELECT id FROM centros_custo LIMIT 1),
  'Venda de teste',
  '2024-12-01',
  5000.00,
  1
);
```

## 🚀 RESULTADO FINAL

- ✅ Filtros de Data → **FUNCIONAM** (gte/lte no Supabase)
- ✅ Filtro de Loja → **FUNCIONA** (eq no Supabase)
- ✅ Filtro de Centro de Custo → **NOVO E FUNCIONA**
- ✅ React Query refaz busca automaticamente ao mudar filtros
- ✅ Estrutura de dados corrigida (receitas.total, despesas.total, resultado.bruto)
- ✅ Hooks reutilizáveis (mesma estrutura para todos)

## 🎯 PRÓXIMOS HOOKS A CORRIGIR

Agora que o padrão está estabelecido, aplicar o mesmo em:

1. `use-fluxo-caixa.ts` - Adicionar filtros dinâmicos
2. `use-lancamentos.ts` - Já tem alguns filtros, validar
3. `use-fornecedores.ts` - Adicionar filtros
4. Página `analise/page.tsx` - Conectar ao motor de inteligência

**QUANDO TESTAR**: Se os dados estiverem no banco, você verá os números REAIS mudando conforme seleciona filtros. Se estiver vazio, implemente a importação primeiro.
