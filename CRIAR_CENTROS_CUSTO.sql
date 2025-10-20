-- ============================================================
-- 🔥 SQL PARA RECRIAR CENTROS DE CUSTO PERDIDOS
-- ============================================================
-- Execute este SQL no Supabase SQL Editor (SQL > New query)
-- Isso vai criar os centros de custo baseados nos dados originais do Yampa

-- Primeiro, buscar IDs das lojas
DO $$
DECLARE
    loja_escritorio_id UUID;
    loja_suzano_id UUID;
    loja_maua_id UUID;
    loja_rio_id UUID;
    loja_suzano2_id UUID;
    loja_sao_mateus_id UUID;
    loja_perus_id UUID;
BEGIN
    -- Buscar IDs das lojas
    SELECT id INTO loja_escritorio_id FROM lojas WHERE codigo = 'ESC';
    SELECT id INTO loja_suzano_id FROM lojas WHERE codigo = 'SUZ';
    SELECT id INTO loja_maua_id FROM lojas WHERE codigo = 'MAU';
    SELECT id INTO loja_rio_id FROM lojas WHERE codigo = 'RIO';
    SELECT id INTO loja_suzano2_id FROM lojas WHERE codigo = 'SU2';
    SELECT id INTO loja_sao_mateus_id FROM lojas WHERE codigo = 'SMT';
    SELECT id INTO loja_perus_id FROM lojas WHERE codigo = 'PER';
    
    -- Inserir centros de custo (se não existirem)
    -- Usar INSERT apenas se não existir (evita duplicatas)
    
    -- CC001 - Escritório
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC001') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC001', 'Escritório', 'Centro de custo recuperado do Yampa - Escritório (8.724 lançamentos)', loja_escritorio_id, true);
    END IF;
    
    -- CC002 - Loja Suzano
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC002') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC002', 'Loja Suzano', 'Centro de custo recuperado do Yampa - Loja Suzano (5.645 lançamentos)', loja_suzano_id, true);
    END IF;
    
    -- CC003 - Loja Mauá
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC003') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC003', 'Loja Mauá', 'Centro de custo recuperado do Yampa - Loja Mauá (3.060 lançamentos)', loja_maua_id, true);
    END IF;
    
    -- CC004 - Loja Rio Pequeno
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC004') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC004', 'Loja Rio Pequeno', 'Centro de custo recuperado do Yampa - Loja Rio Pequeno (2.448 lançamentos)', loja_rio_id, true);
    END IF;
    
    -- CC005 - Loja Suzano II
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC005') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC005', 'Loja Suzano II', 'Centro de custo recuperado do Yampa - Loja Suzano II (1.639 lançamentos)', loja_suzano2_id, true);
    END IF;
    
    -- CC006 - Loja São Mateus
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC006') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC006', 'Loja São Mateus', 'Centro de custo recuperado do Yampa - Loja São Mateus (1.398 lançamentos)', loja_sao_mateus_id, true);
    END IF;
    
    -- CC007 - Loja Perus
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC007') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC007', 'Loja Perus', 'Centro de custo recuperado do Yampa - Loja Perus (1.308 lançamentos)', loja_perus_id, true);
    END IF;
    
    -- CC008 - Taty Mello Festas
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC008') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC008', 'Taty Mello Festas', 'Centro de custo recuperado do Yampa - Taty Mello Festas (508 lançamentos)', loja_escritorio_id, true);
    END IF;
    
    -- CC009 - Clínica
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC009') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC009', 'Clínica', 'Centro de custo recuperado do Yampa - Clínica (27 lançamentos)', loja_escritorio_id, true);
    END IF;
    
    -- CC010 - Pessoal
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC010') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC010', 'Pessoal', 'Centro de custo recuperado do Yampa - Pessoal (7 lançamentos)', loja_escritorio_id, true);
    END IF;
    
    -- CC999 - Sem Centro de Custo
    IF NOT EXISTS (SELECT 1 FROM centros_custo WHERE codigo = 'CC999') THEN
        INSERT INTO centros_custo (codigo, nome, descricao, loja_id, ativo)
        VALUES ('CC999', 'Sem Centro de Custo', 'Para lançamentos sem centro de custo definido (2.370 lançamentos)', loja_escritorio_id, true);
    END IF;
    
    RAISE NOTICE 'Centros de custo criados com sucesso!';
END $$;

-- ============================================================
-- ✅ VERIFICAR CENTROS CRIADOS
-- ============================================================
SELECT 
    cc.codigo,
    cc.nome,
    l.codigo as loja_codigo,
    l.nome as loja_nome,
    cc.ativo,
    cc.created_at
FROM centros_custo cc
LEFT JOIN lojas l ON cc.loja_id = l.id
ORDER BY cc.codigo;

| codigo | nome                | loja_codigo | loja_nome        | ativo | created_at                    |
| ------ | ------------------- | ----------- | ---------------- | ----- | ----------------------------- |
| CC001  | Escritório          | ESC         | Escritório       | true  | 2025-10-19 11:51:36.072217+00 |
| CC002  | Loja Suzano         | SUZ         | Loja Suzano      | true  | 2025-10-19 11:51:36.072217+00 |
| CC003  | Loja Mauá           | MAU         | Loja Mauá        | true  | 2025-10-19 11:51:36.072217+00 |
| CC004  | Loja Rio Pequeno    | RIO         | Loja Rio Pequeno | true  | 2025-10-19 11:51:36.072217+00 |
| CC005  | Loja Suzano II      | SU2         | Loja Suzano II   | true  | 2025-10-19 11:51:36.072217+00 |
| CC006  | Loja São Mateus     | SMT         | Loja São Mateus  | true  | 2025-10-19 11:51:36.072217+00 |
| CC007  | Loja Perus          | PER         | Loja Perus       | true  | 2025-10-19 11:51:36.072217+00 |
| CC008  | Taty Mello Festas   | ESC         | Escritório       | true  | 2025-10-19 11:51:36.072217+00 |
| CC009  | Clínica             | ESC         | Escritório       | true  | 2025-10-19 11:51:36.072217+00 |
| CC010  | Pessoal             | ESC         | Escritório       | true  | 2025-10-19 11:51:36.072217+00 |
| CC999  | Sem Centro de Custo | ESC         | Escritório       | true  | 2025-10-19 11:51:36.072217+00 |
| OPE    | Operacional         | SMT         | Loja São Mateus  | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | ESC         | Escritório       | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | SUZ         | Loja Suzano      | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | MAU         | Loja Mauá        | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | RIO         | Loja Rio Pequeno | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | SU2         | Loja Suzano II   | true  | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | PER         | Loja Perus       | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | ESC         | Escritório       | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | PER         | Loja Perus       | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | SMT         | Loja São Mateus  | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | SU2         | Loja Suzano II   | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | RIO         | Loja Rio Pequeno | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | MAU         | Loja Mauá        | true  | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | SUZ         | Loja Suzano      | true  | 2025-10-14 20:14:39.239169+00 |

-- ============================================================
-- 📊 ESTATÍSTICAS
-- ============================================================
-- Contar centros por loja
SELECT 
    l.codigo as loja_codigo,
    l.nome as loja_nome,
    COUNT(cc.id) as total_centros
FROM lojas l
LEFT JOIN centros_custo cc ON l.id = cc.loja_id
GROUP BY l.codigo, l.nome
ORDER BY l.codigo;


| loja_codigo | loja_nome        | total_centros |
| ----------- | ---------------- | ------------- |
| ESC         | Escritório       | 7             |
| MAU         | Loja Mauá        | 3             |
| PER         | Loja Perus       | 3             |
| RIO         | Loja Rio Pequeno | 3             |
| SMT         | Loja São Mateus  | 3             |
| SU2         | Loja Suzano II   | 3             |
| SUZ         | Loja Suzano      | 3             |
-- ============================================================
-- 🎯 PRÓXIMO PASSO
-- ============================================================
-- Agora execute o script de redistribuição de lançamentos:
-- Veja o arquivo: RECUPERAR_CENTROS_CUSTO.md (seção PASSO 2)