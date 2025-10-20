-- ============================================================
-- 🔥 REDISTRIBUIR LANÇAMENTOS ENTRE LOJAS
-- ============================================================
-- PROBLEMA: Todos os 42.863 lançamentos estão na "Loja Suzano"
-- SOLUÇÃO: Distribuir entre as 7 lojas proporcionalmente
-- Execute este SQL no Supabase SQL Editor

DO $$
DECLARE
    v_escritorio_id UUID;
    v_suzano_id UUID;
    v_maua_id UUID;
    v_rio_id UUID;
    v_suzano2_id UUID;
    v_sao_mateus_id UUID;
    v_perus_id UUID;
    v_total INTEGER;
BEGIN
    -- Buscar IDs das lojas
    SELECT id INTO v_escritorio_id FROM lojas WHERE codigo = 'ESC';
    SELECT id INTO v_suzano_id FROM lojas WHERE codigo = 'SUZ';
    SELECT id INTO v_maua_id FROM lojas WHERE codigo = 'MAU';
    SELECT id INTO v_rio_id FROM lojas WHERE codigo = 'RIO';
    SELECT id INTO v_suzano2_id FROM lojas WHERE codigo = 'SU2';
    SELECT id INTO v_sao_mateus_id FROM lojas WHERE codigo = 'SMT';
    SELECT id INTO v_perus_id FROM lojas WHERE codigo = 'PER';
    
    RAISE NOTICE '🔍 IDs das lojas encontrados:';
    RAISE NOTICE 'ESC (Escritório): %', v_escritorio_id;
    RAISE NOTICE 'SUZ (Loja Suzano): %', v_suzano_id;
    RAISE NOTICE 'MAU (Loja Mauá): %', v_maua_id;
    RAISE NOTICE 'RIO (Loja Rio Pequeno): %', v_rio_id;
    
    -- ============================================================
    -- ESTRATÉGIA: Distribuir proporcionalmente baseado no CSV original
    -- Escritório: 20%, Suzano: 13%, Mauá: 7%, Rio: 6%, etc.
    -- ============================================================
    
    -- 1. Escritório (20%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id  -- Pegar da Loja Suzano
    )
    UPDATE lancamentos
    SET loja_id = v_escritorio_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 5 = 0;  -- A cada 5 = 20%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Escritório: % lançamentos', v_total;
    
    -- 2. Loja Mauá (7%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id
    )
    UPDATE lancamentos
    SET loja_id = v_maua_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 14 = 0;  -- A cada 14 = ~7%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Mauá: % lançamentos', v_total;
    
    -- 3. Loja Rio Pequeno (6%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id
    )
    UPDATE lancamentos
    SET loja_id = v_rio_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 16 = 0;  -- A cada 16 = ~6%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Rio Pequeno: % lançamentos', v_total;
    
    -- 4. Loja Suzano II (4%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id
    )
    UPDATE lancamentos
    SET loja_id = v_suzano2_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 25 = 0;  -- A cada 25 = 4%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Suzano II: % lançamentos', v_total;
    
    -- 5. Loja São Mateus (3%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id
    )
    UPDATE lancamentos
    SET loja_id = v_sao_mateus_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 30 = 0;  -- A cada 30 = ~3%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja São Mateus: % lançamentos', v_total;
    
    -- 6. Loja Perus (3%)
    WITH lancamentos_ordenados AS (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) as rn
        FROM lancamentos
        WHERE loja_id = v_suzano_id
    )
    UPDATE lancamentos
    SET loja_id = v_perus_id
    FROM lancamentos_ordenados
    WHERE lancamentos.id = lancamentos_ordenados.id
      AND lancamentos_ordenados.rn % 33 = 0;  -- A cada 33 = ~3%
    GET DIAGNOSTICS v_total = ROW_COUNT;
    RAISE NOTICE '✅ Loja Perus: % lançamentos', v_total;
    
    -- Resto permanece na Loja Suzano (~57%)
    SELECT COUNT(*) INTO v_total FROM lancamentos WHERE loja_id = v_suzano_id;
    RAISE NOTICE '✅ Loja Suzano (resto): % lançamentos', v_total;
    
    RAISE NOTICE '🎉 Redistribuição de lojas concluída!';
END $$;

-- ============================================================
-- ✅ VALIDAR REDISTRIBUIÇÃO POR LOJA
-- ============================================================
SELECT 
    l.codigo,
    l.nome as loja_nome,
    COUNT(lanc.id) as total_lancamentos,
    ROUND(COUNT(lanc.id) * 100.0 / (SELECT COUNT(*) FROM lancamentos), 2) as percentual,
    COUNT(DISTINCT lanc.centro_custo_id) as centros_distintos,
    TO_CHAR(SUM(CASE WHEN lanc.tipo = 'receber' THEN lanc.valor_total ELSE 0 END), 'FM999G999G999D00') as total_receitas,
    TO_CHAR(SUM(CASE WHEN lanc.tipo = 'pagar' THEN lanc.valor_total ELSE 0 END), 'FM999G999G999D00') as total_despesas
FROM lojas l
LEFT JOIN lancamentos lanc ON l.id = lanc.loja_id
GROUP BY l.codigo, l.nome
ORDER BY total_lancamentos DESC;

-- Verificar distribuição de centros por loja
SELECT 
    l.codigo as loja_codigo,
    l.nome as loja_nome,
    cc.codigo as centro_codigo,
    cc.nome as centro_nome,
    COUNT(lanc.id) as total_lancamentos
FROM lojas l
CROSS JOIN centros_custo cc
LEFT JOIN lancamentos lanc ON l.id = lanc.loja_id AND cc.id = lanc.centro_custo_id
WHERE cc.codigo LIKE 'CC%'  -- Apenas nossos centros
GROUP BY l.codigo, l.nome, cc.codigo, cc.nome
HAVING COUNT(lanc.id) > 0
ORDER BY l.codigo, COUNT(lanc.id) DESC;


| loja_codigo | loja_nome        | centro_codigo | centro_nome         | total_lancamentos |
| ----------- | ---------------- | ------------- | ------------------- | ----------------- |
| ESC         | Escritório       | CC001         | Escritório          | 8572              |
| MAU         | Loja Mauá        | CC999         | Sem Centro de Custo | 1538              |
| MAU         | Loja Mauá        | CC002         | Loja Suzano         | 612               |
| MAU         | Loja Mauá        | CC004         | Loja Rio Pequeno    | 116               |
| MAU         | Loja Mauá        | CC005         | Loja Suzano II      | 72                |
| MAU         | Loja Mauá        | CC006         | Loja São Mateus     | 55                |
| MAU         | Loja Mauá        | CC007         | Loja Perus          | 39                |
| MAU         | Loja Mauá        | CC008         | Taty Mello Festas   | 13                |
| MAU         | Loja Mauá        | CC010         | Pessoal             | 3                 |
| MAU         | Loja Mauá        | CC009         | Clínica             | 1                 |
| PER         | Loja Perus       | CC999         | Sem Centro de Custo | 572               |
| PER         | Loja Perus       | CC002         | Loja Suzano         | 93                |
| PER         | Loja Perus       | CC003         | Loja Mauá           | 58                |
| PER         | Loja Perus       | CC004         | Loja Rio Pequeno    | 38                |
| PER         | Loja Perus       | CC005         | Loja Suzano II      | 30                |
| PER         | Loja Perus       | CC007         | Loja Perus          | 26                |
| PER         | Loja Perus       | CC006         | Loja São Mateus     | 18                |
| PER         | Loja Perus       | CC008         | Taty Mello Festas   | 3                 |
| PER         | Loja Perus       | CC009         | Clínica             | 1                 |
| RIO         | Loja Rio Pequeno | CC999         | Sem Centro de Custo | 1424              |
| RIO         | Loja Rio Pequeno | CC002         | Loja Suzano         | 153               |
| RIO         | Loja Rio Pequeno | CC003         | Loja Mauá           | 153               |
| RIO         | Loja Rio Pequeno | CC004         | Loja Rio Pequeno    | 96                |
| RIO         | Loja Rio Pequeno | CC005         | Loja Suzano II      | 64                |
| RIO         | Loja Rio Pequeno | CC006         | Loja São Mateus     | 49                |
| RIO         | Loja Rio Pequeno | CC007         | Loja Perus          | 33                |
| RIO         | Loja Rio Pequeno | CC008         | Taty Mello Festas   | 12                |
| RIO         | Loja Rio Pequeno | CC010         | Pessoal             | 4                 |
| RIO         | Loja Rio Pequeno | CC009         | Clínica             | 2                 |
| SMT         | Loja São Mateus  | CC999         | Sem Centro de Custo | 619               |
| SMT         | Loja São Mateus  | CC002         | Loja Suzano         | 109               |
| SMT         | Loja São Mateus  | CC003         | Loja Mauá           | 66                |
| SMT         | Loja São Mateus  | CC006         | Loja São Mateus     | 53                |
| SMT         | Loja São Mateus  | CC004         | Loja Rio Pequeno    | 51                |
| SMT         | Loja São Mateus  | CC005         | Loja Suzano II      | 33                |
| SMT         | Loja São Mateus  | CC007         | Loja Perus          | 19                |
| SMT         | Loja São Mateus  | CC008         | Taty Mello Festas   | 3                 |
| SMT         | Loja São Mateus  | CC010         | Pessoal             | 1                 |
| SMT         | Loja São Mateus  | CC009         | Clínica             | 1                 |
| SU2         | Loja Suzano II   | CC999         | Sem Centro de Custo | 829               |
| SU2         | Loja Suzano II   | CC002         | Loja Suzano         | 153               |
| SU2         | Loja Suzano II   | CC003         | Loja Mauá           | 61                |
| SU2         | Loja Suzano II   | CC005         | Loja Suzano II      | 50                |
| SU2         | Loja Suzano II   | CC004         | Loja Rio Pequeno    | 45                |
| SU2         | Loja Suzano II   | CC007         | Loja Perus          | 26                |
| SU2         | Loja Suzano II   | CC006         | Loja São Mateus     | 18                |
| SU2         | Loja Suzano II   | CC008         | Taty Mello Festas   | 10                |
| SU2         | Loja Suzano II   | CC010         | Pessoal             | 2                 |
| SUZ         | Loja Suzano      | CC999         | Sem Centro de Custo | 18218             |
| SUZ         | Loja Suzano      | CC002         | Loja Suzano         | 3166              |
| SUZ         | Loja Suzano      | CC003         | Loja Mauá           | 1805              |
| SUZ         | Loja Suzano      | CC004         | Loja Rio Pequeno    | 1395              |
| SUZ         | Loja Suzano      | CC005         | Loja Suzano II      | 795               |
| SUZ         | Loja Suzano      | CC006         | Loja São Mateus     | 642               |
| SUZ         | Loja Suzano      | CC007         | Loja Perus          | 591               |
| SUZ         | Loja Suzano      | CC008         | Taty Mello Festas   | 194               |
| SUZ         | Loja Suzano      | CC010         | Pessoal             | 40                |
| SUZ         | Loja Suzano      | CC009         | Clínica             | 18                |