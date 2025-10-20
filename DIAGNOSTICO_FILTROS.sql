-- ============================================================
-- 🔥 DIAGNOSTICAR PROBLEMA DOS FILTROS DRE
-- ============================================================

-- 1. Verificar centros de custo criados
SELECT 'CENTROS DE CUSTO' as diagnostico;
SELECT codigo, nome, ativo, loja_id, created_at 
FROM centros_custo 
ORDER BY codigo;

| codigo | nome                | ativo | loja_id                              | created_at                    |
| ------ | ------------------- | ----- | ------------------------------------ | ----------------------------- |
| CC001  | Escritório          | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-19 11:51:36.072217+00 |
| CC002  | Loja Suzano         | true  | 3704fcce-6e02-411d-a0ad-d96de801345a | 2025-10-19 11:51:36.072217+00 |
| CC003  | Loja Mauá           | true  | b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe | 2025-10-19 11:51:36.072217+00 |
| CC004  | Loja Rio Pequeno    | true  | 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da | 2025-10-19 11:51:36.072217+00 |
| CC005  | Loja Suzano II      | true  | 84f6b026-e712-4a5d-9062-9921287ac4b7 | 2025-10-19 11:51:36.072217+00 |
| CC006  | Loja São Mateus     | true  | a23b528f-6cbb-4753-b1e9-6d387c8c5666 | 2025-10-19 11:51:36.072217+00 |
| CC007  | Loja Perus          | true  | 03474a07-f330-48bc-8329-5ca698083a62 | 2025-10-19 11:51:36.072217+00 |
| CC008  | Taty Mello Festas   | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-19 11:51:36.072217+00 |
| CC009  | Clínica             | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-19 11:51:36.072217+00 |
| CC010  | Pessoal             | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-19 11:51:36.072217+00 |
| CC999  | Sem Centro de Custo | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-19 11:51:36.072217+00 |
| OPE    | Operacional         | true  | a23b528f-6cbb-4753-b1e9-6d387c8c5666 | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | 3704fcce-6e02-411d-a0ad-d96de801345a | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | 84f6b026-e712-4a5d-9062-9921287ac4b7 | 2025-10-14 20:14:39.239169+00 |
| OPE    | Operacional         | true  | 03474a07-f330-48bc-8329-5ca698083a62 | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | 692e5aea-e785-4675-9d44-9f3e24b36b01 | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | 03474a07-f330-48bc-8329-5ca698083a62 | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | a23b528f-6cbb-4753-b1e9-6d387c8c5666 | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | 84f6b026-e712-4a5d-9062-9921287ac4b7 | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | 60a71af7-86ba-49e2-a4c7-7d1efc6cd8da | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe | 2025-10-14 20:14:39.239169+00 |
| VND    | Vendas              | true  | 3704fcce-6e02-411d-a0ad-d96de801345a | 2025-10-14 20:14:39.239169+00 |

-- 2. Verificar distribuição de lançamentos por centro
SELECT 'LANÇAMENTOS POR CENTRO' as diagnostico;
SELECT 
    cc.codigo,
    cc.nome as centro_nome,
    COUNT(l.id) as total_lancamentos
FROM centros_custo cc
LEFT JOIN lancamentos l ON cc.id = l.centro_custo_id
GROUP BY cc.codigo, cc.nome
ORDER BY total_lancamentos DESC;

| codigo | centro_nome         | total_lancamentos |
| ------ | ------------------- | ----------------- |
| CC999  | Sem Centro de Custo | 23200             |
| CC001  | Escritório          | 8572              |
| CC002  | Loja Suzano         | 4286              |
| CC003  | Loja Mauá           | 2143              |
| CC004  | Loja Rio Pequeno    | 1741              |
| CC005  | Loja Suzano II      | 1044              |
| CC006  | Loja São Mateus     | 835               |
| CC007  | Loja Perus          | 734               |
| CC008  | Taty Mello Festas   | 235               |
| CC010  | Pessoal             | 50                |
| CC009  | Clínica             | 23                |
| OPE    | Operacional         | 0                 |
| VND    | Vendas              | 0                 |

-- 3. Verificar distribuição de lançamentos por loja
SELECT 'LANÇAMENTOS POR LOJA' as diagnostico;
SELECT 
    lj.codigo,
    lj.nome as loja_nome,
    COUNT(l.id) as total_lancamentos
FROM lojas lj
LEFT JOIN lancamentos l ON lj.id = l.loja_id
GROUP BY lj.codigo, lj.nome
ORDER BY total_lancamentos DESC;

| codigo | loja_nome        | total_lancamentos |
| ------ | ---------------- | ----------------- |
| SUZ    | Loja Suzano      | 42863             |
| PER    | Loja Perus       | 0                 |
| RIO    | Loja Rio Pequeno | 0                 |
| ESC    | Escritório       | 0                 |
| SU2    | Loja Suzano II   | 0                 |
| MAU    | Loja Mauá        | 0                 |
| SMT    | Loja São Mateus  | 0                 |

-- 4. Verificar RLS em centros_custo
SELECT 'POLÍTICAS RLS EM centros_custo' as diagnostico;
SELECT 
    polname as policy_name,
    polcmd as command,
    qual as using_expression,
    with_check as with_check_expression
FROM pg_policies 
WHERE tablename = 'centros_custo';

ERROR:  42703: column "polname" does not exist
LINE 3:     polname as policy_name,
            ^
HINT:  Perhaps you meant to reference the column "pg_policies.policyname".

-- 5. Verificar se lançamentos têm centro_custo_id NULL
SELECT 'LANÇAMENTOS SEM CENTRO' as diagnostico;
SELECT COUNT(*) as total_sem_centro
FROM lancamentos
WHERE centro_custo_id IS NULL;

| total_sem_centro |
| ---------------- |
| 0                |

-- 6. Sample de lançamentos com centros
SELECT 'AMOSTRA DE LANÇAMENTOS' as diagnostico;
SELECT 
    l.competencia,
    l.tipo,
    l.valor_total,
    lj.codigo as loja_codigo,
    cc.codigo as centro_codigo
FROM lancamentos l
LEFT JOIN lojas lj ON l.loja_id = lj.id
LEFT JOIN centros_custo cc ON l.centro_custo_id = cc.id
LIMIT 10;

| competencia | tipo    | valor_total | loja_codigo | centro_codigo |
| ----------- | ------- | ----------- | ----------- | ------------- |
| 2022-07-26  | pagar   | 0.20        | SUZ         | CC001         |
| 2022-09-13  | pagar   | 185.00      | SUZ         | CC001         |
| 2021-09-20  | receber | 100.00      | SUZ         | CC002         |
| 2021-09-24  | receber | 125.00      | SUZ         | CC004         |
| 2022-06-10  | pagar   | 2.98        | SUZ         | CC001         |
| 2022-06-24  | pagar   | 10.50       | SUZ         | CC001         |
| 2022-08-16  | pagar   | 20.00       | SUZ         | CC001         |
| 2022-08-26  | pagar   | 62.75       | SUZ         | CC001         |
| 2022-09-05  | receber | 170.00      | SUZ         | CC001         |
| 2022-09-27  | pagar   | 639.00      | SUZ         | CC001         |
