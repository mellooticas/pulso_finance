-- 🔍 DIAGNÓSTICO COMPLETO: Plano de Contas e Lançamentos

-- 1. Estrutura da tabela plano_contas
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_name = 'plano_contas'
ORDER BY ordinal_position;


| column_name       | data_type                | is_nullable | column_default    |
| ----------------- | ------------------------ | ----------- | ----------------- |
| id                | uuid                     | NO          | gen_random_uuid() |
| codigo            | text                     | NO          | null              |
| nome              | text                     | NO          | null              |
| categoria         | USER-DEFINED             | NO          | null              |
| grupo_dre         | USER-DEFINED             | YES         | null              |
| nivel             | integer                  | NO          | 1                 |
| pai_id            | uuid                     | YES         | null              |
| descricao         | text                     | YES         | null              |
| aceita_lancamento | boolean                  | YES         | true              |
| ativo             | boolean                  | YES         | true              |
| ordem_exibicao    | integer                  | YES         | 0                 |
| created_at        | timestamp with time zone | YES         | now()             |
-- 2. Tipos distintos em plano_contas
SELECT tipo, COUNT(*) as quantidade
FROM plano_contas
GROUP BY tipo
ORDER BY quantidade DESC;

ERROR:  42703: column "tipo" does not exist
LINE 1: SELECT tipo, COUNT(*) as quantidade
               ^
HINT:  Perhaps you meant to reference the column "plano_contas.ativo".
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.

-- 3. Sample de contas por tipo
SELECT tipo, codigo, nome, categoria
FROM plano_contas
ORDER BY tipo, codigo
LIMIT 20;

ERROR:  42703: column "tipo" does not exist
LINE 1: SELECT tipo, codigo, nome, categoria
               ^
HINT:  Perhaps you meant to reference the column "plano_contas.ativo".

-- 4. Tipos distintos em lançamentos
SELECT tipo, COUNT(*) as quantidade
FROM lancamentos
GROUP BY tipo
ORDER BY quantidade DESC;

| tipo    | quantidade |
| ------- | ---------- |
| pagar   | 26596      |
| receber | 16267      |

-- 5. Verificar se lançamentos têm plano_id válido
SELECT 
    COUNT(*) as total_lancamentos,
    COUNT(plano_id) as com_plano_id,
    COUNT(*) - COUNT(plano_id) as sem_plano_id
FROM lancamentos;

| total_lancamentos | com_plano_id | sem_plano_id |
| ----------------- | ------------ | ------------ |
| 42863             | 42863        | 0            |

-- 6. Verificar match entre lançamentos.tipo e plano_contas.tipo
SELECT 
    l.tipo as tipo_lancamento,
    p.tipo as tipo_plano_conta,
    COUNT(*) as quantidade
FROM lancamentos l
LEFT JOIN plano_contas p ON l.plano_id = p.id
WHERE l.plano_id IS NOT NULL
GROUP BY l.tipo, p.tipo
ORDER BY quantidade DESC;

ERROR:  42703: column p.tipo does not exist
LINE 3:     p.tipo as tipo_plano_conta,
            ^
HINT:  Perhaps you meant to reference the column "l.tipo".
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.

-- 7. Sample de lançamentos com plano de contas
SELECT 
    l.tipo as tipo_lanc,
    l.descricao,
    l.valor,
    p.codigo as plano_codigo,
    p.nome as plano_nome,
    p.tipo as plano_tipo
FROM lancamentos l
LEFT JOIN plano_contas p ON l.plano_id = p.id
LIMIT 10;
ERROR:  42703: column l.valor does not exist
LINE 4:     l.valor,
            ^