-- ============================================================
-- 📊 RELATÓRIO FINAL DA REDISTRIBUIÇÃO
-- ============================================================
-- Execute no Supabase SQL Editor para ver o resultado

-- 1. Distribuição por Centro de Custo
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

| codigo | centro_nome         | total_lancamentos | percentual | total_receitas | total_despesas |
| ------ | ------------------- | ----------------- | ---------- | -------------- | -------------- |
| CC999  | Sem Centro de Custo | 23200             | 54.13      | 4,234,464.56   | 4,599,684.12   |
| CC001  | Escritório          | 8572              | 20.00      | 1,522,478.82   | 1,656,606.55   |
| CC002  | Loja Suzano         | 4286              | 10.00      | 739,541.75     | 853,249.06     |
| CC003  | Loja Mauá           | 2143              | 5.00       | 389,270.97     | 403,174.42     |
| CC004  | Loja Rio Pequeno    | 1741              | 4.06       | 399,659.87     | 357,263.86     |
| CC005  | Loja Suzano II      | 1044              | 2.44       | 223,217.77     | 187,984.94     |
| CC006  | Loja São Mateus     | 835               | 1.95       | 114,246.82     | 114,371.03     |
| CC007  | Loja Perus          | 734               | 1.71       | 129,154.98     | 134,773.69     |
| CC008  | Taty Mello Festas   | 235               | 0.55       | 40,200.00      | 74,633.38      |
| CC010  | Pessoal             | 50                | 0.12       | 14,629.89      | 18,118.42      |
| CC009  | Clínica             | 23                | 0.05       | 260.00         | 4,309.32       |
| OPE    | Operacional         | 0                 | 0.00       | .00            | .00            |
| VND    | Vendas              | 0                 | 0.00       | .00            | .00            |

-- 2. Distribuição por Loja
SELECT 
    l.codigo,
    l.nome as loja_nome,
    COUNT(lanc.id) as total_lancamentos,
    COUNT(DISTINCT lanc.centro_custo_id) as centros_distintos,
    TO_CHAR(SUM(CASE WHEN lanc.tipo = 'receber' THEN lanc.valor_total ELSE 0 END), 'FM999G999G999D00') as total_receitas,
    TO_CHAR(SUM(CASE WHEN lanc.tipo = 'pagar' THEN lanc.valor_total ELSE 0 END), 'FM999G999G999D00') as total_despesas
FROM lojas l
LEFT JOIN lancamentos lanc ON l.id = lanc.loja_id
GROUP BY l.codigo, l.nome
ORDER BY total_lancamentos DESC;

| codigo | loja_nome        | total_lancamentos | centros_distintos | total_receitas | total_despesas |
| ------ | ---------------- | ----------------- | ----------------- | -------------- | -------------- |
| SUZ    | Loja Suzano      | 42863             | 11                | 7,807,125.43   | 8,404,168.79   |
| MAU    | Loja Mauá        | 0                 | 0                 | .00            | .00            |
| PER    | Loja Perus       | 0                 | 0                 | .00            | .00            |
| ESC    | Escritório       | 0                 | 0                 | .00            | .00            |
| SMT    | Loja São Mateus  | 0                 | 0                 | .00            | .00            |
| SU2    | Loja Suzano II   | 0                 | 0                 | .00            | .00            |
| RIO    | Loja Rio Pequeno | 0                 | 0                 | .00            | .00            |

-- 3. Resumo Geral
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
WHERE centro_custo_id IS NULL
UNION ALL
SELECT 
    'Centros de Custo Ativos',
    COUNT(*)
FROM centros_custo
WHERE ativo = true
UNION ALL
SELECT 
    'Lojas Ativas',
    COUNT(*)
FROM lojas
WHERE ativo = true;

ERROR:  42703: column "ativo" does not exist
LINE 28: WHERE ativo = true limit 100;
               ^
HINT:  Perhaps you meant to reference the column "lojas.ativa".
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.
