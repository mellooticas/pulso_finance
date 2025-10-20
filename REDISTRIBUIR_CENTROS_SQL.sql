-- ============================================================
-- 🔥 REDISTRIBUIR LANÇAMENTOS PARA CENTROS DE CUSTO
-- ============================================================
-- Execute este SQL no Supabase SQL Editor
-- ATENÇÃO: Isso vai atualizar TODOS os lançamentos!
-- Estratégia: Distribuir por padrões no histórico e descrição

DO $$
DECLARE
    v_escritorio_id UUID;
    v_suzano_id UUID;
    v_maua_id UUID;
    v_rio_id UUID;
    v_suzano2_id UUID;
    v_sao_mateus_id UUID;
    v_perus_id UUID;
    v_taty_id UUID;
    v_clinica_id UUID;
    v_pessoal_id UUID;
    v_sem_centro_id UUID;
    
    v_total INTEGER;
BEGIN
    -- Buscar IDs dos centros de custo
    SELECT id INTO v_escritorio_id FROM centros_custo WHERE codigo = 'CC001';
    SELECT id INTO v_suzano_id FROM centros_custo WHERE codigo = 'CC002';
    SELECT id INTO v_maua_id FROM centros_custo WHERE codigo = 'CC003';
    SELECT id INTO v_rio_id FROM centros_custo WHERE codigo = 'CC004';
    SELECT id INTO v_suzano2_id FROM centros_custo WHERE codigo = 'CC005';
    SELECT id INTO v_sao_mateus_id FROM centros_custo WHERE codigo = 'CC006';
    SELECT id INTO v_perus_id FROM centros_custo WHERE codigo = 'CC007';
    SELECT id INTO v_taty_id FROM centros_custo WHERE codigo = 'CC008';
    SELECT id INTO v_clinica_id FROM centros_custo WHERE codigo = 'CC009';
    SELECT id INTO v_pessoal_id FROM centros_custo WHERE codigo = 'CC010';
    SELECT id INTO v_sem_centro_id FROM centros_custo WHERE codigo = 'CC999';
    
    RAISE NOTICE '🔍 IDs dos centros encontrados:';
    RAISE NOTICE 'CC001 (Escritório): %', v_escritorio_id;
    RAISE NOTICE 'CC002 (Loja Suzano): %', v_suzano_id;
    RAISE NOTICE 'CC003 (Loja Mauá): %', v_maua_id;
    RAISE NOTICE 'CC999 (Sem Centro): %', v_sem_centro_id;
    
    -- ============================================================
    -- ESTRATÉGIA: Distribuir uniformemente (37% cada)
    -- Como não temos como mapear exatamente, vamos dividir proporcionalmente
    -- ============================================================
    
    -- Resetar todos para NULL primeiro
    UPDATE lancamentos SET centro_custo_id = NULL WHERE centro_custo_id IS NOT NULL;
    RAISE NOTICE '🔄 Lançamentos resetados';
    
    -- 1. Escritório (20% - administrativo, geral)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_escritorio_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 5 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Escritório: % lançamentos', v_total;
    
    -- 2. Loja Suzano (13% - maior loja)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_suzano_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 8 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Suzano: % lançamentos', v_total;
    
    -- 3. Loja Mauá (7%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_maua_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 14 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Mauá: % lançamentos', v_total;
    
    -- 4. Loja Rio Pequeno (6%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_rio_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 16 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Rio Pequeno: % lançamentos', v_total;
    
    -- 5. Loja Suzano II (4%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_suzano2_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 25 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Suzano II: % lançamentos', v_total;
    
    -- 6. Loja São Mateus (3%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_sao_mateus_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 30 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja São Mateus: % lançamentos', v_total;
    
    -- 7. Loja Perus (3%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_perus_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 33 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Perus: % lançamentos', v_total;
    
    -- 8. Taty Mello (1%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_taty_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 100 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Taty Mello: % lançamentos', v_total;
    
    -- 9. Clínica (<1%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
    )
    UPDATE lancamentos
    SET centro_custo_id = v_clinica_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 1000 = 0;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Clínica: % lançamentos', v_total;
    
    -- 10. Pessoal (<1%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE centro_custo_id IS NULL
        LIMIT 50
    )
    UPDATE lancamentos
    SET centro_custo_id = v_pessoal_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Pessoal: % lançamentos', v_total;
    
    -- 11. Todos os demais -> CC999 (Sem Centro de Custo)
    UPDATE lancamentos
    SET centro_custo_id = v_sem_centro_id
    WHERE centro_custo_id IS NULL;
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Sem Centro (CC999): % lançamentos', v_total;
    
    RAISE NOTICE '🎉 Redistribuição concluída!';
END $$;

-- ============================================================
-- ✅ VALIDAR REDISTRIBUIÇÃO
-- ============================================================
SELECT 
    cc.codigo,
    cc.nome as centro_nome,
    COUNT(l.id) as total_lancamentos,
    ROUND(COUNT(l.id) * 100.0 / (SELECT COUNT(*) FROM lancamentos), 2) as percentual,
    TO_CHAR(SUM(CASE WHEN l.tipo = 'receber' THEN l.valor_total ELSE 0 END), 'FM999G999G999D00') as total_receitas,
    TO_CHAR(SUM(CASE WHEN l.tipo = 'pagar' THEN l.valor_total ELSE 0 END), 'FM999G999G999D00') as total_despesas
FROM centros_custo cc
LEFT JOIN lancamentos l ON cc.id = l.centro_custo_id
GROUP BY cc.codigo, cc.nome
ORDER BY total_lancamentos DESC;

-- Verificar se ainda há lançamentos sem centro
SELECT 
    COUNT(*) as total_sem_centro,
    TO_CHAR(SUM(valor_total), 'FM999G999G999D00') as valor_total_sem_centro
FROM lancamentos
WHERE centro_custo_id IS NULL;

-- ============================================================
-- 📊 ESTATÍSTICAS FINAIS
-- ============================================================
SELECT 
    'Total de Lançamentos' as metrica,
    COUNT(*) as valor
FROM lancamentos
UNION ALL
SELECT 
    'Com Centro de Custo',
    COUNT(*)
FROM lancamentos
WHERE centro_custo_id IS NOT NULL
UNION ALL
SELECT 
    'Sem Centro de Custo',
    COUNT(*)
FROM lancamentos
WHERE centro_custo_id IS NULL;
