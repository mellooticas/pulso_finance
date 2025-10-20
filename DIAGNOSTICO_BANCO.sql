-- ====================================================================
-- 🔍 DIAGNÓSTICO COMPLETO DO BANCO SUPABASE
-- ====================================================================
-- Execute estas queries e me mande os resultados!
-- ====================================================================

-- ====================================================================
-- 1️⃣ VERIFICAR QUAIS TABELAS EXISTEM
-- ====================================================================
-- Esta query lista TODAS as tabelas do seu schema public
SELECT 
    table_name,
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name) as num_colunas
FROM information_schema.tables t
WHERE table_schema = 'public'
ORDER BY table_name;

| table_name         | num_colunas |
| ------------------ | ----------- |
| auditoria          | 10          |
| centros_custo      | 7           |
| conciliacoes       | 12          |
| contas_financeiras | 14          |
| extratos_bancarios | 15          |
| formas_pagamento   | 8           |
| fornecedores       | 12          |
| lancamentos        | 22          |
| lojas              | 13          |
| parcelas           | 17          |
| plano_contas       | 12          |
| usuarios           | 10          |

-- ====================================================================
-- 2️⃣ CONTAR REGISTROS EM CADA TABELA (se existir)
-- ====================================================================
-- Descomente e execute para cada tabela que REALMENTE existir:

-- LANÇAMENTOS (CRÍTICO - deveria ter 45.133 registros do Yampa)
-- SELECT 'lancamentos' as tabela, COUNT(*) as total_registros FROM lancamentos;

-- PARCELAS (geradas dos lançamentos)
-- SELECT 'parcelas' as tabela, COUNT(*) as total_registros FROM parcelas;

-- FORNECEDORES (deveria ter 5: Zeiss, Hoya, Solótica, Braslab, Fast)
-- SELECT 'fornecedores' as tabela, COUNT(*) as total_registros FROM fornecedores;

-- LOJAS (deveria ter 8)
-- SELECT 'lojas' as tabela, COUNT(*) as total_registros FROM lojas;

-- PRODUTOS/SERVIÇOS (deveria ter ~2.000)
-- SELECT 'produtos_servicos' as tabela, COUNT(*) as total_registros FROM produtos_servicos;

-- PLANO DE CONTAS
-- SELECT 'planos_contas' as tabela, COUNT(*) as total_registros FROM planos_contas;

-- CENTROS DE CUSTO
-- SELECT 'centros_custo' as tabela, COUNT(*) as total_registros FROM centros_custo;

-- USUÁRIOS
-- SELECT 'usuarios' as tabela, COUNT(*) as total_registros FROM usuarios;

-- ====================================================================
-- 3️⃣ ESTRUTURA DAS TABELAS PRINCIPAIS (se existirem)
-- ====================================================================

-- Ver colunas da tabela LANÇAMENTOS
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'lancamentos'
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

-- Ver colunas da tabela PARCELAS
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'parcelas'
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

-- ====================================================================
-- 4️⃣ AMOSTRA DE DADOS (se tiver registros)
-- ====================================================================
-- Descomente e execute se tiver dados:

-- Primeiros 5 lançamentos
-- SELECT * FROM lancamentos ORDER BY created_at DESC LIMIT 5;

-- Primeiros 5 fornecedores
-- SELECT * FROM fornecedores LIMIT 5;

-- Primeiras 5 lojas
-- SELECT * FROM lojas LIMIT 5;

-- ====================================================================
-- 5️⃣ TESTES DE FILTROS (o que você está reclamando!)
-- ====================================================================
-- Estas queries vão testar se dá pra filtrar por data e centro de custo

-- TESTE 1: Filtrar lançamentos por data (último mês)
-- SELECT 
--     COUNT(*) as total,
--     SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE 0 END) as receitas,
--     SUM(CASE WHEN tipo = 'pagar' THEN valor_total ELSE 0 END) as despesas
-- FROM lancamentos
-- WHERE competencia >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
--   AND competencia < DATE_TRUNC('month', CURRENT_DATE);

-- TESTE 2: Filtrar lançamentos por loja (centro de custo)
-- SELECT 
--     l.nome as loja,
--     COUNT(lanc.id) as num_lancamentos,
--     SUM(CASE WHEN lanc.tipo = 'receber' THEN lanc.valor_total ELSE 0 END) as receitas,
--     SUM(CASE WHEN lanc.tipo = 'pagar' THEN lanc.valor_total ELSE 0 END) as despesas
-- FROM lojas l
-- LEFT JOIN lancamentos lanc ON lanc.loja_id = l.id
-- GROUP BY l.id, l.nome
-- ORDER BY receitas DESC;

-- TESTE 3: DRE básico (o que deveria estar funcionando!)
-- SELECT 
--     DATE_TRUNC('month', competencia) as mes,
--     SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE 0 END) as receitas,
--     SUM(CASE WHEN tipo = 'pagar' THEN valor_total ELSE 0 END) as despesas,
--     SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE -valor_total END) as resultado
-- FROM lancamentos
-- WHERE competencia >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '6 month')
-- GROUP BY DATE_TRUNC('month', competencia)
-- ORDER BY mes DESC;

-- ====================================================================
-- 6️⃣ VERIFICAR RLS (Row Level Security)
-- ====================================================================
-- Ver se o RLS está bloqueando as queries

SELECT 
    schemaname,
    tablename,
    rowsecurity as rls_habilitado,
    (SELECT COUNT(*) FROM pg_policies WHERE tablename = t.tablename) as num_politicas
FROM pg_tables t
WHERE schemaname = 'public'
ORDER BY tablename;

| schemaname | tablename          | rls_habilitado | num_politicas |
| ---------- | ------------------ | -------------- | ------------- |
| public     | auditoria          | false          | 0             |
| public     | centros_custo      | true           | 1             |
| public     | conciliacoes       | false          | 0             |
| public     | contas_financeiras | true           | 1             |
| public     | extratos_bancarios | true           | 0             |
| public     | formas_pagamento   | false          | 0             |
| public     | fornecedores       | false          | 0             |
| public     | lancamentos        | false          | 1             |
| public     | lojas              | false          | 1             |
| public     | parcelas           | false          | 1             |
| public     | plano_contas       | false          | 0             |
| public     | usuarios           | true           | 4             |

-- Ver políticas RLS específicas
SELECT 
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;


| tablename          | policyname                                       | permissive | roles           | cmd    | qual                                                                                                                                                                                                                                                      |
| ------------------ | ------------------------------------------------ | ---------- | --------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| centros_custo      | usuarios_podem_ver_centros_das_suas_lojas        | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (centros_custo.loja_id = ANY (u.loja_ids))))))                                                    |
| contas_financeiras | usuarios_podem_ver_contas_das_suas_lojas         | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (contas_financeiras.loja_id = ANY (u.loja_ids))))))                                               |
| lancamentos        | usuarios_podem_ver_lancamentos_das_suas_lojas    | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (lancamentos.loja_id = ANY (u.loja_ids))))))                                                      |
| lojas              | usuarios_podem_ver_suas_lojas                    | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM usuarios u
  WHERE ((u.id = auth.uid()) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (u.id = ANY (u.loja_ids))))))                                                                     |
| parcelas           | usuarios_podem_ver_parcelas_dos_seus_lancamentos | PERMISSIVE | {authenticated} | ALL    | (EXISTS ( SELECT 1
   FROM (lancamentos l
     JOIN usuarios u ON ((u.id = auth.uid())))
  WHERE ((l.id = parcelas.lancamento_id) AND ((u.papel = ANY (ARRAY['admin'::papel_usuario, 'financeiro'::papel_usuario])) OR (l.loja_id = ANY (u.loja_ids)))))) |
| usuarios           | usuarios_auth_lookup                             | PERMISSIVE | {anon}          | SELECT | (ativo = true)                                                                                                                                                                                                                                            |
| usuarios           | usuarios_read_authenticated                      | PERMISSIVE | {authenticated} | SELECT | true                                                                                                                                                                                                                                                      |
| usuarios           | usuarios_select_own                              | PERMISSIVE | {public}        | SELECT | (email = (auth.jwt() ->> 'email'::text))                                                                                                                                                                                                                  |
| usuarios           | usuarios_update_own                              | PERMISSIVE | {public}        | UPDATE | (email = (auth.jwt() ->> 'email'::text))                                                                                                                                                                                                                  |


-- ====================================================================
-- 7️⃣ RELACIONAMENTOS (Foreign Keys)
-- ====================================================================
-- Ver se as FKs estão configuradas corretamente

SELECT
    tc.table_name as tabela_origem,
    kcu.column_name as coluna_origem,
    ccu.table_name as tabela_destino,
    ccu.column_name as coluna_destino
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
  ON tc.constraint_name = kcu.constraint_name
  AND tc.table_schema = kcu.table_schema
JOIN information_schema.constraint_column_usage AS ccu
  ON ccu.constraint_name = tc.constraint_name
  AND ccu.table_schema = tc.table_schema
WHERE tc.constraint_type = 'FOREIGN KEY'
  AND tc.table_schema = 'public'
ORDER BY tc.table_name, kcu.column_name;


| tabela_origem      | coluna_origem      | tabela_destino     | coluna_destino |
| ------------------ | ------------------ | ------------------ | -------------- |
| auditoria          | user_id            | usuarios           | id             |
| centros_custo      | loja_id            | lojas              | id             |
| conciliacoes       | aprovado_por       | usuarios           | id             |
| conciliacoes       | extrato_id         | extratos_bancarios | id             |
| conciliacoes       | parcela_id         | parcelas           | id             |
| contas_financeiras | loja_id            | lojas              | id             |
| extratos_bancarios | conta_id           | contas_financeiras | id             |
| lancamentos        | aprovado_por       | usuarios           | id             |
| lancamentos        | centro_custo_id    | centros_custo      | id             |
| lancamentos        | fornecedor_id      | fornecedores       | id             |
| lancamentos        | loja_id            | lojas              | id             |
| lancamentos        | plano_id           | plano_contas       | id             |
| lancamentos        | user_id            | usuarios           | id             |
| parcelas           | conta_id           | contas_financeiras | id             |
| parcelas           | forma_pagamento_id | formas_pagamento   | id             |
| parcelas           | lancamento_id      | lancamentos        | id             |
| plano_contas       | pai_id             | plano_contas       | id             |

-- ====================================================================
-- 8️⃣ ÍNDICES (Performance)
-- ====================================================================
-- Ver se tem índices nas colunas que usamos pra filtrar

SELECT
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;

| tablename          | indexname                              | indexdef                                                                                                                     |
| ------------------ | -------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| auditoria          | auditoria_pkey                         | CREATE UNIQUE INDEX auditoria_pkey ON public.auditoria USING btree (id)                                                      |
| centros_custo      | centros_custo_loja_id_codigo_key       | CREATE UNIQUE INDEX centros_custo_loja_id_codigo_key ON public.centros_custo USING btree (loja_id, codigo)                   |
| centros_custo      | centros_custo_pkey                     | CREATE UNIQUE INDEX centros_custo_pkey ON public.centros_custo USING btree (id)                                              |
| conciliacoes       | conciliacoes_pkey                      | CREATE UNIQUE INDEX conciliacoes_pkey ON public.conciliacoes USING btree (id)                                                |
| contas_financeiras | contas_financeiras_loja_id_apelido_key | CREATE UNIQUE INDEX contas_financeiras_loja_id_apelido_key ON public.contas_financeiras USING btree (loja_id, apelido)       |
| contas_financeiras | contas_financeiras_pkey                | CREATE UNIQUE INDEX contas_financeiras_pkey ON public.contas_financeiras USING btree (id)                                    |
| contas_financeiras | idx_contas_financeiras_loja            | CREATE INDEX idx_contas_financeiras_loja ON public.contas_financeiras USING btree (loja_id, ativa) WHERE ativa               |
| extratos_bancarios | extratos_bancarios_hash_linha_key      | CREATE UNIQUE INDEX extratos_bancarios_hash_linha_key ON public.extratos_bancarios USING btree (hash_linha)                  |
| extratos_bancarios | extratos_bancarios_pkey                | CREATE UNIQUE INDEX extratos_bancarios_pkey ON public.extratos_bancarios USING btree (id)                                    |
| extratos_bancarios | idx_extratos_conciliado                | CREATE INDEX idx_extratos_conciliado ON public.extratos_bancarios USING btree (conciliado) WHERE (NOT conciliado)            |
| extratos_bancarios | idx_extratos_conta_data                | CREATE INDEX idx_extratos_conta_data ON public.extratos_bancarios USING btree (conta_id, data_movimento)                     |
| formas_pagamento   | formas_pagamento_pkey                  | CREATE UNIQUE INDEX formas_pagamento_pkey ON public.formas_pagamento USING btree (id)                                        |
| fornecedores       | fornecedores_pkey                      | CREATE UNIQUE INDEX fornecedores_pkey ON public.fornecedores USING btree (id)                                                |
| fornecedores       | idx_fornecedores_nome_gin              | CREATE INDEX idx_fornecedores_nome_gin ON public.fornecedores USING gin (to_tsvector('portuguese'::regconfig, nome))         |
| lancamentos        | idx_lancamentos_descricao_gin          | CREATE INDEX idx_lancamentos_descricao_gin ON public.lancamentos USING gin (to_tsvector('portuguese'::regconfig, descricao)) |
| lancamentos        | idx_lancamentos_loja_competencia       | CREATE INDEX idx_lancamentos_loja_competencia ON public.lancamentos USING btree (loja_id, competencia)                       |
| lancamentos        | idx_lancamentos_metadata_gin           | CREATE INDEX idx_lancamentos_metadata_gin ON public.lancamentos USING gin (metadata)                                         |
| lancamentos        | idx_lancamentos_origem                 | CREATE INDEX idx_lancamentos_origem ON public.lancamentos USING btree (origem)                                               |
| lancamentos        | idx_lancamentos_plano_tipo             | CREATE INDEX idx_lancamentos_plano_tipo ON public.lancamentos USING btree (plano_id, tipo)                                   |
| lancamentos        | lancamentos_pkey                       | CREATE UNIQUE INDEX lancamentos_pkey ON public.lancamentos USING btree (id)                                                  |
| lojas              | lojas_codigo_key                       | CREATE UNIQUE INDEX lojas_codigo_key ON public.lojas USING btree (codigo)                                                    |
| lojas              | lojas_pkey                             | CREATE UNIQUE INDEX lojas_pkey ON public.lojas USING btree (id)                                                              |
| mv_dre_mensal      | idx_mv_dre_mensal_loja_mes             | CREATE INDEX idx_mv_dre_mensal_loja_mes ON public.mv_dre_mensal USING btree (loja_id, mes_ref)                               |
| mv_fluxo_caixa     | idx_mv_fluxo_caixa_loja_data           | CREATE INDEX idx_mv_fluxo_caixa_loja_data ON public.mv_fluxo_caixa USING btree (loja_id, data_ref)                           |
| parcelas           | idx_parcelas_lancamento                | CREATE INDEX idx_parcelas_lancamento ON public.parcelas USING btree (lancamento_id)                                          |
| parcelas           | idx_parcelas_vencimento_status         | CREATE INDEX idx_parcelas_vencimento_status ON public.parcelas USING btree (vencimento, status)                              |
| parcelas           | parcelas_lancamento_id_parcela_key     | CREATE UNIQUE INDEX parcelas_lancamento_id_parcela_key ON public.parcelas USING btree (lancamento_id, parcela)               |
| parcelas           | parcelas_pkey                          | CREATE UNIQUE INDEX parcelas_pkey ON public.parcelas USING btree (id)                                                        |
| plano_contas       | idx_plano_contas_categoria             | CREATE INDEX idx_plano_contas_categoria ON public.plano_contas USING btree (categoria, ativo) WHERE ativo                    |
| plano_contas       | plano_contas_codigo_key                | CREATE UNIQUE INDEX plano_contas_codigo_key ON public.plano_contas USING btree (codigo)                                      |
| plano_contas       | plano_contas_pkey                      | CREATE UNIQUE INDEX plano_contas_pkey ON public.plano_contas USING btree (id)                                                |
| usuarios           | idx_usuarios_configuracoes_gin         | CREATE INDEX idx_usuarios_configuracoes_gin ON public.usuarios USING gin (configuracoes)                                     |
| usuarios           | idx_usuarios_papel_ativo               | CREATE INDEX idx_usuarios_papel_ativo ON public.usuarios USING btree (papel, ativo) WHERE ativo                              |
| usuarios           | usuarios_email_key                     | CREATE UNIQUE INDEX usuarios_email_key ON public.usuarios USING btree (email)                                                |
| usuarios           | usuarios_pkey                          | CREATE UNIQUE INDEX usuarios_pkey ON public.usuarios USING btree (id)                                                        |


-- ====================================================================
-- 📋 INSTRUÇÕES:
-- ====================================================================
-- 1. Conecte no Supabase SQL Editor
-- 2. Execute as queries UMA POR UMA
-- 3. COPIE os resultados de CADA query
-- 4. Cole tudo num arquivo de texto
-- 5. Me mande o arquivo
--
-- OU: Execute o script Python que vai fazer tudo automaticamente:
-- python scripts/analysis/inventariar_banco_dados.py
--
-- ====================================================================
-- 🎯 O QUE EU VOU DESCOBRIR COM ISSO:
-- ====================================================================
-- ✓ Quais tabelas existem
-- ✓ Quantos dados há em cada tabela
-- ✓ Se os 45k lançamentos do Yampa estão lá
-- ✓ Se os filtros PODEM funcionar (tem os campos necessários?)
-- ✓ Se o RLS está bloqueando as queries
-- ✓ Por que o DRE e Análise estão "burros"
-- ====================================================================
