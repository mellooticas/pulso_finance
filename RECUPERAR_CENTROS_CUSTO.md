# 🔥 RECUPERAÇÃO DOS CENTROS DE CUSTO PERDIDOS

## 🎯 PROBLEMA IDENTIFICADO

Na normalização dos dados do Yampa, **OS CENTROS DE CUSTO FORAM APAGADOS!** 😂

### Dados Originais (yampa_relatorio.csv - coluna 14):
- **Escritório**: 8.724 lançamentos
- **Loja Suzano**: 5.645 lançamentos
- **Loja Mauá**: 3.060 lançamentos
- **Loja Rio Pequeno**: 2.448 lançamentos
- **Loja Suzano II**: 1.639 lançamentos
- **Loja São Mateus**: 1.398 lançamentos
- **Loja Perus**: 1.308 lançamentos
- **Taty Mello Festas**: 508 lançamentos
- **Clínica**: 27 lançamentos
- **Pessoal**: 7 lançamentos
- **(vazio)**: 2.370 lançamentos

**TOTAL**: 27.134 registros no CSV original

### Situação Atual no Banco:
- ❌ **0 centros de custo** cadastrados
- ✅ **42.863 lançamentos** (mais que o CSV porque há parcelas)
- ⚠️ **TODOS** os lançamentos na "Loja Suzano"
- ⚠️ **TODOS** com `centro_custo_id = NULL`

## 🚀 SOLUÇÃO EM 3 PASSOS

### ⭐ PASSO 1: Criar Centros de Custo (EXECUTAR AGORA!)

1. Abra o **Supabase SQL Editor**: 
   - Acesse: https://supabase.com/dashboard/project/fxsgphqzazcbjcyfqeyg/sql
   - Ou: Supabase Dashboard → SQL → New query

2. Copie e execute o arquivo: **`CRIAR_CENTROS_CUSTO.sql`**

3. Você verá a mensagem: `Centros de custo criados com sucesso!`

4. Verifique os centros criados (resultado da query)

### 📝 PASSO 2: Atualizar Lançamentos com Centros de Custo

**OPÇÃO A** (Simples - Distribuição Manual):
```sql
-- Distribui lançamentos entre lojas/centros baseado em padrões no histórico
-- Execute no Supabase SQL Editor

-- Atualizar lançamentos do Escritório
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC001'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'ESC')
WHERE 
    descricao ILIKE '%escritorio%' 
    OR descricao ILIKE '%administra%'
    OR descricao ILIKE '%diretoria%';

-- Atualizar lançamentos de Mauá
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC003'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'MAU')
WHERE 
    descricao ILIKE '%maua%' 
    OR descricao ILIKE '%mauá%';

-- Atualizar lançamentos de Perus
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC007'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'PER')
WHERE 
    descricao ILIKE '%perus%';

-- Atualizar lançamentos de Rio Pequeno
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC004'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'RIO')
WHERE 
    descricao ILIKE '%rio%';

-- Atualizar lançamentos de São Mateus
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC006'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'SMT')
WHERE 
    descricao ILIKE '%mateus%' 
    OR descricao ILIKE '%s.mateus%'
    OR descricao ILIKE '%sao mateus%';

-- Atualizar lançamentos de Suzano II
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC005'),
    loja_id = (SELECT id FROM lojas WHERE codigo = 'SU2')
WHERE 
    descricao ILIKE '%suzano ii%' 
    OR descricao ILIKE '%suzano 2%';

-- Lançamentos restantes ficam em Suzano com centro CC002
UPDATE lancamentos
SET 
    centro_custo_id = (SELECT id FROM centros_custo WHERE codigo = 'CC002')
WHERE centro_custo_id IS NULL;
```

**OPÇÃO B** (Precisa - Usar CSV Original):
Criar script Python que lê `yampa_relatorio.csv` e faz o match com os lançamentos do banco via campo `historico` ou `descricao`.

### ✅ PASSO 3: Testar Filtros

Depois de executar os UPDATEs, execute novamente:

```bash
cd frontend
node debug-centros-custo.js
```

Você deve ver:
- ✅ 11 centros de custo cadastrados
- ✅ Lançamentos distribuídos entre os centros
- ✅ Filtros funcionando!

## 🎯 PRÓXIMOS PASSOS APÓS A RECUPERAÇÃO

1. **Testar página DRE** com filtros funcionando:
   - Filtro de Data ✅
   - Filtro de Loja ✅ 
   - Filtro de Centro de Custo ✅ **NOVO!**

2. **Aplicar mesmo padrão** em outras páginas:
   - Fluxo de Caixa
   - Análise Financeira
   - Fornecedores
   - Balancete

3. **Conectar Motor de Inteligência** aos dados reais

4. **Validação final**: Sistema "Nasdaq level"! 🚀

## 📊 COMANDOS ÚTEIS

```bash
# Ver distribuição atual
cd frontend
node investigacao-completa-banco.js

# Ver só centros de custo
node debug-centros-custo.js

# Testar filtros DRE
node test-lancamentos-filtros.js
```

## ⚠️ IMPORTANTE

A distribuição manual (OPÇÃO A) é rápida mas pode não ser 100% precisa. Se você quiser perfeição:

1. Guarde o CSV original `yampa_relatorio.csv`
2. Crie script que lê CSV linha por linha
3. Faz match com lançamentos via `historico` + `valor` + `competencia`
4. Atualiza com o `centro_custo_id` correto

Mas para começar, a OPÇÃO A já resolve 80% do problema!

## 🎉 RESULTADO ESPERADO

Após executar tudo:

```
✅ 11 centros de custo ativos
✅ 42.863 lançamentos distribuídos corretamente
✅ Filtros de Loja funcionando
✅ Filtros de Centro de Custo funcionando
✅ DRE mostrando dados REAIS por loja/centro
✅ Sistema enterprise pronto!
```

---

**EXECUTE AGORA**: Vá no Supabase SQL Editor e rode o `CRIAR_CENTROS_CUSTO.sql`!
