-- 🔍 QUERIES DE VERIFICAÇÃO PARA DIAGNOSTICAR O PROBLEMA
-- Execute estas queries no Supabase SQL Editor e me envie os resultados

-- 1. Verificar se os dados foram realmente importados
SELECT 'LANCAMENTOS' as tabela, COUNT(*) as total_registros FROM lancamentos
UNION ALL
SELECT 'PARCELAS' as tabela, COUNT(*) as total_registros FROM parcelas
UNION ALL  
SELECT 'LOJAS' as tabela, COUNT(*) as total_registros FROM lojas
UNION ALL
SELECT 'PLANO_CONTAS' as tabela, COUNT(*) as total_registros FROM plano_contas;

| tabela       | total_registros |
| ------------ | --------------- |
| LANCAMENTOS  | 42863           |
| PARCELAS     | 42863           |
| LOJAS        | 7               |
| PLANO_CONTAS | 72              |

-- 2. Verificar estrutura da tabela lancamentos
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'lancamentos' 
  AND table_schema = 'public'
ORDER BY ordinal_position;

| column_name          | data_type                | is_nullable |
| -------------------- | ------------------------ | ----------- |
| id                   | uuid                     | NO          |
| loja_id              | uuid                     | NO          |
| tipo                 | USER-DEFINED             | NO          |
| plano_id             | uuid                     | NO          |
| centro_custo_id      | uuid                     | YES         |
| fornecedor_id        | uuid                     | YES         |
| descricao            | text                     | NO          |
| historico            | text                     | YES         |
| observacoes          | text                     | YES         |
| competencia          | date                     | NO          |
| valor_total          | numeric                  | NO          |
| num_parcelas         | integer                  | NO          |
| origem               | USER-DEFINED             | YES         |
| status_aprovacao     | USER-DEFINED             | YES         |
| documento_referencia | text                     | YES         |
| anexos               | ARRAY                    | YES         |
| user_id              | uuid                     | YES         |
| aprovado_por         | uuid                     | YES         |
| aprovado_em          | timestamp with time zone | YES         |
| metadata             | jsonb                    | YES         |
| created_at           | timestamp with time zone | YES         |
| updated_at           | timestamp with time zone | YES         |

-- 3. Verificar estrutura da tabela parcelas  
SELECT column_name, data_type, is_nullable
FROM information_schema.columns 
WHERE table_name = 'parcelas'
  AND table_schema = 'public'
ORDER BY ordinal_position;

| column_name        | data_type                | is_nullable |
| ------------------ | ------------------------ | ----------- |
| id                 | uuid                     | NO          |
| lancamento_id      | uuid                     | NO          |
| parcela            | integer                  | NO          |
| vencimento         | date                     | NO          |
| valor              | numeric                  | NO          |
| juros              | numeric                  | YES         |
| desconto           | numeric                  | YES         |
| valor_pago         | numeric                  | YES         |
| status             | USER-DEFINED             | NO          |
| data_pagamento     | date                     | YES         |
| forma_pagamento_id | uuid                     | YES         |
| conta_id           | uuid                     | YES         |
| comprovante        | text                     | YES         |
| observacao         | text                     | YES         |
| conciliado         | boolean                  | YES         |
| created_at         | timestamp with time zone | YES         |
| updated_at         | timestamp with time zone | YES         |


-- 4. Verificar amostra de dados em lancamentos (se existir)
SELECT id, loja_id, tipo, plano_id, descricao, valor_total, competencia
FROM lancamentos 
LIMIT 5;

| id                                   | loja_id                              | tipo    | plano_id                             | descricao                                 | valor_total | competencia |
| ------------------------------------ | ------------------------------------ | ------- | ------------------------------------ | ----------------------------------------- | ----------- | ----------- |
| c6c180e3-a094-4c50-8320-f3f5ac9eca45 | 3704fcce-6e02-411d-a0ad-d96de801345a | receber | 7245ff34-af3e-44ce-8c29-f874dd392683 | VENDAS DINHEIRO - 2175                    | 100.00      | 2020-10-01  |
| 28c7803a-919a-4659-8a4e-ff27d03db98c | 3704fcce-6e02-411d-a0ad-d96de801345a | receber | 7245ff34-af3e-44ce-8c29-f874dd392683 | VENDAS DINHEIRO - 2178                    | 90.00       | 2020-10-01  |
| 73f2bfd5-00cb-4eb5-a27d-c778a3e89678 | 3704fcce-6e02-411d-a0ad-d96de801345a | receber | 29fa1653-1d27-4c2e-aef1-b87ad8c0faef | VENDAS NO CARTaO - 2176                   | 588.00      | 2020-10-01  |
| df6bd7ca-e20e-44a2-bedb-46985d142e34 | 3704fcce-6e02-411d-a0ad-d96de801345a | pagar   | 96cebc3d-191f-4881-83af-66da5e56b1f8 | MERCADO - CAFe DA MANHa                   | 9.00        | 2020-10-01  |
| cbd11451-cd59-4d14-9075-824715ad26c0 | 3704fcce-6e02-411d-a0ad-d96de801345a | pagar   | 96cebc3d-191f-4881-83af-66da5e56b1f8 | TRANSFEReNCIAS - TRANSF FDOS DOC-E H BANK | 240.00      | 2020-10-01  |


-- 5. Verificar amostra de dados em parcelas (se existir)
SELECT id, lancamento_id, parcela, valor, status, vencimento
FROM parcelas
LIMIT 5;

| id                                   | lancamento_id                        | parcela | valor  | status   | vencimento |
| ------------------------------------ | ------------------------------------ | ------- | ------ | -------- | ---------- |
| e0669748-1c78-4f45-84e7-8da1554114ec | c6c180e3-a094-4c50-8320-f3f5ac9eca45 | 1       | 100.00 | previsto | 2020-10-01 |
| 8cf718e8-7161-4806-a089-4f381f23d097 | 28c7803a-919a-4659-8a4e-ff27d03db98c | 1       | 90.00  | previsto | 2020-10-01 |
| c1682874-ddae-4ce3-bab1-c682d63c80ea | 73f2bfd5-00cb-4eb5-a27d-c778a3e89678 | 1       | 588.00 | previsto | 2020-10-01 |
| 01491579-f57b-48ba-9c2b-a8aff1c0eb61 | df6bd7ca-e20e-44a2-bedb-46985d142e34 | 1       | 9.00   | pago     | 2020-10-01 |
| 767dbdc3-671b-4cb7-a82d-417d1b633cde | cbd11451-cd59-4d14-9075-824715ad26c0 | 1       | 240.00 | pago     | 2020-10-01 |


-- 6. Verificar políticas RLS ativas
SELECT schemaname, tablename, policyname, permissive, roles, cmd, qual
FROM pg_policies 
WHERE schemaname = 'public' 
  AND tablename IN ('lancamentos', 'parcelas', 'lojas', 'plano_contas');

  | schemaname | tablename   | policyname                                       | permissive | roles           | cmd | qual                                                                                                                                                                                                                                                      |
| ---------- | ----------- | ------------------------------------------------ | ---------- | --------------- | --- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| public     | lancamentos | usuarios_podem_ver_lancamentos_das_suas_lojas    | PERMISSIVE | {authenticated} | ALL | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (lancamentos.loja_id = ANY (u.loja_ids))))))                                                      |
| public     | lojas       | usuarios_podem_ver_suas_lojas                    | PERMISSIVE | {authenticated} | ALL | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (u.id = ANY (u.loja_ids))))))                                                                     |
| public     | parcelas    | usuarios_podem_ver_parcelas_dos_seus_lancamentos | PERMISSIVE | {authenticated} | ALL | (EXISTS ( SELECT 1
   FROM (lancamentos l
     JOIN usuarios u ON ((u.id = auth.uid())))
  WHERE ((l.id = parcelas.lancamento_id) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (l.loja_id = ANY (u.loja_ids)))))) |


-- 7. Verificar se RLS está habilitado
SELECT schemaname, tablename, rowsecurity, forcerowsecurity
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename IN ('lancamentos', 'parcelas', 'lojas', 'plano_contas');


ERROR:  42703: column "forcerowsecurity" does not exist
LINE 1: SELECT schemaname, tablename, rowsecurity, forcerowsecurity
                                                   ^
Note: A limit of 100 was applied to your query. If this was the cause of a syntax error, try selecting "No limit" instead and re-run the query.


-- 8. Verificar foreign keys e sua integridade
SELECT 
    tc.table_name, 
    tc.constraint_name, 
    tc.constraint_type,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name 
FROM information_schema.table_constraints AS tc 
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
    AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
    AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY' 
  AND tc.table_name IN ('lancamentos', 'parcelas')
ORDER BY tc.table_name, tc.constraint_name;


| table_name  | constraint_name                  | constraint_type | column_name        | foreign_table_name | foreign_column_name |
| ----------- | -------------------------------- | --------------- | ------------------ | ------------------ | ------------------- |
| lancamentos | lancamentos_aprovado_por_fkey    | FOREIGN KEY     | aprovado_por       | usuarios           | id                  |
| lancamentos | lancamentos_centro_custo_id_fkey | FOREIGN KEY     | centro_custo_id    | centros_custo      | id                  |
| lancamentos | lancamentos_fornecedor_id_fkey   | FOREIGN KEY     | fornecedor_id      | fornecedores       | id                  |
| lancamentos | lancamentos_loja_id_fkey         | FOREIGN KEY     | loja_id            | lojas              | id                  |
| lancamentos | lancamentos_plano_id_fkey        | FOREIGN KEY     | plano_id           | plano_contas       | id                  |
| lancamentos | lancamentos_user_id_fkey         | FOREIGN KEY     | user_id            | usuarios           | id                  |
| parcelas    | parcelas_conta_id_fkey           | FOREIGN KEY     | conta_id           | contas_financeiras | id                  |
| parcelas    | parcelas_forma_pagamento_id_fkey | FOREIGN KEY     | forma_pagamento_id | formas_pagamento   | id                  |
| parcelas    | parcelas_lancamento_id_fkey      | FOREIGN KEY     | lancamento_id      | lancamentos        | id                  |

-- 9. Verificar se a loja existe
SELECT id, nome, codigo FROM lojas WHERE id = '3704fcce-6e02-411d-a0ad-d96de801345a';

-- 10. Verificar alguns planos de conta usados na importação
SELECT id, codigo, nome, categoria 
FROM plano_contas 
WHERE id IN (
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    '29fa1653-1d27-4c2e-aef1-b87ad8c0faef', 
    '515cb77e-d834-42e6-a1e8-cc2978e1cf9f',
    '96cebc3d-191f-4881-83af-66da5e56b1f8'
);

| id                                   | codigo | nome                       | categoria |
| ------------------------------------ | ------ | -------------------------- | --------- |
| 7245ff34-af3e-44ce-8c29-f874dd392683 | 3.1.1  | Vendas em Dinheiro         | receita   |
| 29fa1653-1d27-4c2e-aef1-b87ad8c0faef | 3.1.2  | Vendas Cartões de Débito   | receita   |
| 515cb77e-d834-42e6-a1e8-cc2978e1cf9f | 3.1.3  | Vendas Cartões de Crédito  | receita   |
| 96cebc3d-191f-4881-83af-66da5e56b1f8 | 13.99  | Saldo Inicial Padrão Yampa | outros    |

-- 11. Verificar estatísticas por tipo (se houver dados)
SELECT 
    tipo,
    COUNT(*) as quantidade,
    SUM(valor_total) as valor_total,
    MIN(competencia) as data_mais_antiga,
    MAX(competencia) as data_mais_recente
FROM lancamentos 
GROUP BY tipo;

| tipo    | quantidade | valor_total | data_mais_antiga | data_mais_recente |
| ------- | ---------- | ----------- | ---------------- | ----------------- |
| pagar   | 26596      | 8404168.79  | 2020-10-01       | 2025-10-18        |
| receber | 16267      | 7807125.43  | 2020-10-01       | 2025-10-18        |

-- 12. Verificar se há problemas com a importação por datas
SELECT 
    DATE_PART('year', competencia) as ano,
    DATE_PART('month', competencia) as mes,
    COUNT(*) as quantidade,
    SUM(valor_total) as valor_total
FROM lancamentos
GROUP BY DATE_PART('year', competencia), DATE_PART('month', competencia)
ORDER BY ano, mes
LIMIT 10;

| ano  | mes | quantidade | valor_total |
| ---- | --- | ---------- | ----------- |
| 2020 | 10  | 344        | 90600.38    |
| 2020 | 11  | 480        | 135682.85   |
| 2020 | 12  | 1159       | 219773.50   |
| 2021 | 1   | 504        | 121630.05   |
| 2021 | 2   | 590        | 217051.36   |
| 2021 | 3   | 471        | 102686.17   |
| 2021 | 4   | 691        | 186189.49   |
| 2021 | 5   | 676        | 161043.34   |
| 2021 | 6   | 833        | 261923.64   |
| 2021 | 7   | 1050       | 274000.62   |