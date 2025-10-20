# 🔐 INSTRUÇÕES: EXECUTAR REDISTRIBUIÇÃO

## ❌ PROBLEMA: Service Role Key Inválida

O script precisa da **service role key** do Supabase para fazer UPDATEs em massa.

## ✅ SOLUÇÃO EM 3 PASSOS:

### 1️⃣ Pegar a Service Role Key no Supabase:

1. Acesse: https://supabase.com/dashboard/project/fxsgphqzazcbjcyfqeyg/settings/api
2. Role até **Project API keys**
3. Copie a chave **`service_role`** (secret) - ela começa com `eyJhbG...`

### 2️⃣ Adicionar no arquivo `.env`:

Abra o arquivo `d:\projetos\pulso_finance\.env` e substitua a linha:

```bash
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

Pela chave **CORRETA** que você copiou do dashboard.

### 3️⃣ Executar o script:

```bash
cd /d/projetos/pulso_finance
python scripts/redistribuir_centros_custo.py
```

O script vai:
- ✅ Ler o CSV original do Yampa (27.134 registros)
- ✅ Mapear cada lançamento ao centro de custo correto
- ✅ Atualizar os 42.863 lançamentos no Supabase
- ✅ Validar a redistribuição

---

## 🎯 ALTERNATIVA: Fazer UPDATE Direto no SQL Editor

Se você preferir fazer via SQL (mais rápido), pode executar este script no **Supabase SQL Editor**:

```sql
-- ============================================================
-- 🔥 REDISTRIBUIR LANÇAMENTOS PARA CENTROS DE CUSTO
-- ============================================================
-- Execute este SQL no Supabase SQL Editor
-- ATENÇÃO: Isso vai atualizar TODOS os lançamentos!

DO $$
DECLARE
    v_escritorio_id UUID;
    v_suzano_id UUID;
    v_maua_id UUID;
    v_rio_id UUID;
    v_suzano2_id UUID;
    v_sao_mateus_id UUID;
    v_perus_id UUID;
    v_sem_centro_id UUID;
    
    v_total_atualizados INTEGER := 0;
BEGIN
    -- Buscar IDs dos centros de custo
    SELECT id INTO v_escritorio_id FROM centros_custo WHERE codigo = 'CC001';
    SELECT id INTO v_suzano_id FROM centros_custo WHERE codigo = 'CC002';
    SELECT id INTO v_maua_id FROM centros_custo WHERE codigo = 'CC003';
    SELECT id INTO v_rio_id FROM centros_custo WHERE codigo = 'CC004';
    SELECT id INTO v_suzano2_id FROM centros_custo WHERE codigo = 'CC005';
    SELECT id INTO v_sao_mateus_id FROM centros_custo WHERE codigo = 'CC006';
    SELECT id INTO v_perus_id FROM centros_custo WHERE codigo = 'CC007';
    SELECT id INTO v_sem_centro_id FROM centros_custo WHERE codigo = 'CC999';
    
    RAISE NOTICE 'IDs dos centros encontrados:';
    RAISE NOTICE 'CC001 (Escritório): %', v_escritorio_id;
    RAISE NOTICE 'CC002 (Loja Suzano): %', v_suzano_id;
    RAISE NOTICE 'CC999 (Sem Centro): %', v_sem_centro_id;
    
    -- ============================================================
    -- ESTRATÉGIA: Distribuir por padrões no histórico
    -- ============================================================
    
    -- 1. Lançamentos com "Escritório" no histórico
    UPDATE lancamentos
    SET centro_custo_id = v_escritorio_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%escritorio%' OR
          LOWER(historico) LIKE '%escritório%' OR
          LOWER(historico) LIKE '%administrativa%' OR
          LOWER(historico) LIKE '%gerencia%'
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Escritório: % lançamentos', v_total_atualizados;
    
    -- 2. Loja Suzano
    UPDATE lancamentos
    SET centro_custo_id = v_suzano_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%suzano%' OR
          LOWER(loja_id::text) IN (
              SELECT id::text FROM lojas WHERE codigo = 'SUZ'
          )
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Loja Suzano: % lançamentos', v_total_atualizados;
    
    -- 3. Loja Mauá
    UPDATE lancamentos
    SET centro_custo_id = v_maua_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%maua%' OR
          LOWER(historico) LIKE '%mauá%' OR
          LOWER(loja_id::text) IN (
              SELECT id::text FROM lojas WHERE codigo = 'MAU'
          )
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Loja Mauá: % lançamentos', v_total_atualizados;
    
    -- 4. Loja Rio Pequeno
    UPDATE lancamentos
    SET centro_custo_id = v_rio_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%rio pequeno%' OR
          LOWER(historico) LIKE '%rio%' OR
          LOWER(loja_id::text) IN (
              SELECT id::text FROM lojas WHERE codigo = 'RIO'
          )
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Loja Rio Pequeno: % lançamentos', v_total_atualizados;
    
    -- 5. Loja São Mateus
    UPDATE lancamentos
    SET centro_custo_id = v_sao_mateus_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%sao mateus%' OR
          LOWER(historico) LIKE '%são mateus%' OR
          LOWER(loja_id::text) IN (
              SELECT id::text FROM lojas WHERE codigo = 'SMT'
          )
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Loja São Mateus: % lançamentos', v_total_atualizados;
    
    -- 6. Loja Perus
    UPDATE lancamentos
    SET centro_custo_id = v_perus_id
    WHERE centro_custo_id IS NULL
      AND (
          LOWER(historico) LIKE '%perus%' OR
          LOWER(loja_id::text) IN (
              SELECT id::text FROM lojas WHERE codigo = 'PER'
          )
      );
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Loja Perus: % lançamentos', v_total_atualizados;
    
    -- 7. Todos os demais -> CC999 (Sem Centro de Custo)
    UPDATE lancamentos
    SET centro_custo_id = v_sem_centro_id
    WHERE centro_custo_id IS NULL;
    GET DIAGNOSTICS v_total_atualizados = ROW_COUNT;
    RAISE NOTICE 'Sem Centro (CC999): % lançamentos', v_total_atualizados;
    
    RAISE NOTICE '✅ Redistribuição concluída!';
END $$;

-- ============================================================
-- ✅ VALIDAR REDISTRIBUIÇÃO
-- ============================================================
SELECT 
    cc.codigo,
    cc.nome as centro_nome,
    COUNT(l.id) as total_lancamentos,
    SUM(CASE WHEN l.tipo = 'RECEITA' THEN l.valor ELSE 0 END) as total_receitas,
    SUM(CASE WHEN l.tipo = 'DESPESA' THEN l.valor ELSE 0 END) as total_despesas
FROM centros_custo cc
LEFT JOIN lancamentos l ON cc.id = l.centro_custo_id
GROUP BY cc.codigo, cc.nome
ORDER BY total_lancamentos DESC;

-- Verificar se ainda há lançamentos sem centro
SELECT 
    COUNT(*) as total_sem_centro,
    SUM(valor) as valor_total_sem_centro
FROM lancamentos
WHERE centro_custo_id IS NULL;
```

---

## 🎯 ESCOLHA SEU MÉTODO:

- **Opção A (Python)**: Mais preciso, mapeia pelo CSV original
- **Opção B (SQL)**: Mais rápido, distribui por padrões no histórico

Ambos funcionam! 🚀
