-- =============================================
-- MIGRAÇÃO YAMPA - LOTE 21/143
-- =============================================
--
-- Registros: 150 
-- Range: 3001 - 3150
-- UUIDs: REAIS do banco
--
-- =============================================

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'dd453f1a-b73d-44d8-ad1a-48a467a4d4cb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-13',
    232.0,
    'migracao_yampa',
    '{"yampa_sequencia": "30 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-13',
  232.0,
  232.0,
  'pago',
  '2024-09-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd292638d-5250-4259-b3fb-6414408b020e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-17',
    292.5,
    'migracao_yampa',
    '{"yampa_sequencia": "31 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-17',
  292.5,
  292.5,
  'pago',
  '2024-09-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b8591dea-5c1d-4b80-b1bd-a88a5d4fceb1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-20',
    73.0,
    'migracao_yampa',
    '{"yampa_sequencia": "32 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-20',
  73.0,
  73.0,
  'pago',
  '2024-09-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '94f45a51-3f8d-49f2-a332-3f967d641ac0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-23',
    212.0,
    'migracao_yampa',
    '{"yampa_sequencia": "33 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-23',
  212.0,
  212.0,
  'pago',
  '2024-09-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c28d71f6-e450-4c78-87ec-44c9bbb612fe',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-24',
    43.0,
    'migracao_yampa',
    '{"yampa_sequencia": "34 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-24',
  43.0,
  43.0,
  'pago',
  '2024-09-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9c173a46-e15e-4f18-b809-b1a5dd6e83e8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-25',
    121.0,
    'migracao_yampa',
    '{"yampa_sequencia": "35 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-25',
  121.0,
  121.0,
  'pago',
  '2024-09-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5b83be69-ab5c-4b62-b743-3687c107c9b0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-27',
    84.0,
    'migracao_yampa',
    '{"yampa_sequencia": "36 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-27',
  84.0,
  84.0,
  'pago',
  '2024-09-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c1c360b3-7beb-48f8-a68d-38987f2b8c39',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-30',
    275.5,
    'migracao_yampa',
    '{"yampa_sequencia": "37 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-30',
  275.5,
  275.5,
  'pago',
  '2024-09-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '70a26c45-d9e0-4ebc-99f0-b2ed02e3cc3f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-03',
    195.0,
    'migracao_yampa',
    '{"yampa_sequencia": "38 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-03',
  195.0,
  195.0,
  'pago',
  '2024-10-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6f20415d-e181-46fa-9a0e-dd93fb1eca3d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-07',
    23.0,
    'migracao_yampa',
    '{"yampa_sequencia": "39 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-07',
  23.0,
  23.0,
  'pago',
  '2024-10-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9674d742-7aa1-4267-977a-08ac32ee0319',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-08',
    122.5,
    'migracao_yampa',
    '{"yampa_sequencia": "40 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-08',
  122.5,
  122.5,
  'pago',
  '2024-10-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd8a8d180-2ff9-470e-8194-6d70190fa5ab',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-09',
    238.0,
    'migracao_yampa',
    '{"yampa_sequencia": "41 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-09',
  238.0,
  238.0,
  'pago',
  '2024-10-09',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '776acfeb-dc36-4265-9c61-9feff89da5eb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-11',
    211.0,
    'migracao_yampa',
    '{"yampa_sequencia": "42 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-11',
  211.0,
  211.0,
  'pago',
  '2024-10-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ce6e1717-9262-42b5-a59e-fdbd214dda74',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-14',
    89.0,
    'migracao_yampa',
    '{"yampa_sequencia": "43 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-14',
  89.0,
  89.0,
  'pago',
  '2024-10-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '25b3c6c7-ab1e-49d5-b0cf-a59cb19b4432',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-15',
    145.0,
    'migracao_yampa',
    '{"yampa_sequencia": "44 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-15',
  145.0,
  145.0,
  'pago',
  '2024-10-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '160b29af-403d-482e-ad82-8e569ca62c37',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-17',
    124.0,
    'migracao_yampa',
    '{"yampa_sequencia": "45 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-17',
  124.0,
  124.0,
  'pago',
  '2024-10-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e401e309-7fa7-42a5-8af7-36cf335bdca5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-19',
    335.0,
    'migracao_yampa',
    '{"yampa_sequencia": "46 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-19',
  335.0,
  335.0,
  'pago',
  '2024-10-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '650cd20f-7ea4-4316-ae4a-4dc037703888',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    '2025-03-20',
    143.81,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  143.81,
  143.81,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b26586a9-21a7-4b46-9ea1-033515509936',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    '2025-03-20',
    191.23,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  191.23,
  191.23,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a223ca2e-2dfb-4838-ad22-a5959f2b9559',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-23',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "47 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-23',
  200.0,
  200.0,
  'pago',
  '2024-10-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9f94c91b-4799-4c4c-ba9e-3ff4cef989dd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-24',
    141.0,
    'migracao_yampa',
    '{"yampa_sequencia": "48 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-24',
  141.0,
  141.0,
  'pago',
  '2024-10-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5d95bf09-f3f7-4fc8-b22f-24b713457adb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-28',
    71.5,
    'migracao_yampa',
    '{"yampa_sequencia": "49 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-28',
  71.5,
  71.5,
  'pago',
  '2024-10-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ca869b90-0b82-4553-8702-d8e682d9d36e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-10-30',
    301.5,
    'migracao_yampa',
    '{"yampa_sequencia": "50 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-30',
  301.5,
  301.5,
  'pago',
  '2024-10-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '60f7ab4a-0202-4bfb-bbe0-34df1bb64cff',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-11-01',
    214.0,
    'migracao_yampa',
    '{"yampa_sequencia": "51 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-01',
  214.0,
  214.0,
  'pago',
  '2024-11-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd12290b4-a62d-45da-b999-a67bffb62f2f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-05',
    159.0,
    'migracao_yampa',
    '{"yampa_sequencia": "52 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-05',
  159.0,
  159.0,
  'pago',
  '2024-11-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9a78b2e4-d09e-48ff-9342-e507879c230c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-11',
    182.5,
    'migracao_yampa',
    '{"yampa_sequencia": "53 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-11',
  182.5,
  182.5,
  'pago',
  '2024-11-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b3506e7e-f42c-4b46-a1e0-4cc4af0eb626',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-12',
    303.0,
    'migracao_yampa',
    '{"yampa_sequencia": "54 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-12',
  303.0,
  303.0,
  'pago',
  '2024-11-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '776f1d89-c6c1-4789-8832-a8342faa7a20',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-19',
    203.0,
    'migracao_yampa',
    '{"yampa_sequencia": "55 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-19',
  203.0,
  203.0,
  'pago',
  '2024-11-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'dee9aa39-a4fc-4207-9faf-7ed78bff9be4',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    '2025-03-20',
    191.05,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  191.05,
  191.05,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f4c680cc-e14f-42d9-ad72-51014aeffc3e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-21',
    101.5,
    'migracao_yampa',
    '{"yampa_sequencia": "56 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-21',
  101.5,
  101.5,
  'pago',
  '2024-11-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2dd22df1-bdd0-4a7c-9ebc-c9cbbedbe62f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO RGI 0046736387',
    'SABESP - LOJA SUZANO RGI 0046736387',
    '2025-03-20',
    183.56,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  183.56,
  183.56,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd178e9e9-fde0-42be-9ff5-3c47a306d6a7',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    '2025-03-20',
    153.96,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  153.96,
  153.96,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '119bd784-9d35-4a1f-9833-5403297f0b59',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-25',
    288.0,
    'migracao_yampa',
    '{"yampa_sequencia": "57 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-25',
  288.0,
  288.0,
  'pago',
  '2024-11-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '67f2df03-263b-4158-9a14-cfa1fe5f1b72',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-27',
    118.0,
    'migracao_yampa',
    '{"yampa_sequencia": "58 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-27',
  118.0,
  118.0,
  'pago',
  '2024-11-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '078d6cb7-853f-4360-9b0d-8eede95ea438',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-28',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "59 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-28',
  150.0,
  150.0,
  'pago',
  '2024-11-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'db07f6fc-a890-4cdf-abb3-1f5a6422e4ca',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-11-29',
    60.0,
    'migracao_yampa',
    '{"yampa_sequencia": "60 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-11-29',
  60.0,
  60.0,
  'pago',
  '2024-11-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '89f8c427-cdf8-4e88-be33-7d161c6beb63',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-02',
    244.0,
    'migracao_yampa',
    '{"yampa_sequencia": "61 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-02',
  244.0,
  244.0,
  'pago',
  '2024-12-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '92218ca2-789e-4426-8647-a34587041502',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-04',
    251.0,
    'migracao_yampa',
    '{"yampa_sequencia": "62 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-04',
  251.0,
  251.0,
  'pago',
  '2024-12-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ce9463cb-a209-40fe-a09e-ceb6e289fa40',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-06',
    39.0,
    'migracao_yampa',
    '{"yampa_sequencia": "63 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-06',
  39.0,
  39.0,
  'pago',
  '2024-12-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '216e68d5-bcdd-4638-be76-bf4b07285e17',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-10',
    411.5,
    'migracao_yampa',
    '{"yampa_sequencia": "64 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-10',
  411.5,
  411.5,
  'pago',
  '2024-12-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '546eeb08-31e5-4854-8e98-425cf384d2b3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-12',
    33.0,
    'migracao_yampa',
    '{"yampa_sequencia": "65 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-12',
  33.0,
  33.0,
  'pago',
  '2024-12-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cd1e9f0e-8c92-4558-bb1a-b3ac4210ac54',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-14',
    114.0,
    'migracao_yampa',
    '{"yampa_sequencia": "66 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-14',
  114.0,
  114.0,
  'pago',
  '2024-12-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a36222d2-2c5e-42d8-b8e7-dacf04c105e1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-16',
    223.0,
    'migracao_yampa',
    '{"yampa_sequencia": "67 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-16',
  223.0,
  223.0,
  'pago',
  '2024-12-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2a9db5cb-a301-41d9-b067-fad28e627f29',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2024-12-17',
    126.0,
    'migracao_yampa',
    '{"yampa_sequencia": "68 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-12-17',
  126.0,
  126.0,
  'pago',
  '2024-12-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f1ef6031-5c4d-45ca-a55d-46ef57c98909',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '13° SALÁRIO - Parcela 2/2: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
    '13° SALÁRIO - Parcela 2/2: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
    '2025-03-19',
    66.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  66.0,
  66.0,
  'pago',
  '2025-03-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '113326ee-f0a3-4f44-9acb-1c81273a65cb',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO RGI 0046736387',
    'SABESP - LOJA SUZANO RGI 0046736387',
    '2025-03-20',
    153.96,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  153.96,
  153.96,
  'pago',
  '2025-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8833f1b1-2dcb-429a-8a50-ed5da8c5e43b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-07',
    13.0,
    'migracao_yampa',
    '{"yampa_sequencia": "69 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-07',
  13.0,
  13.0,
  'pago',
  '2025-01-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2d7d36e1-aa9d-437c-b335-2c7526040738',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-14',
    412.5,
    'migracao_yampa',
    '{"yampa_sequencia": "70 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-14',
  412.5,
  412.5,
  'pago',
  '2025-01-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '31ba3709-8c75-4ffa-abc7-062fcdbdd491',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-15',
    171.0,
    'migracao_yampa',
    '{"yampa_sequencia": "71 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-15',
  171.0,
  171.0,
  'pago',
  '2025-01-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '34264627-eb5a-41ba-8242-13397d47db75',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-16',
    89.0,
    'migracao_yampa',
    '{"yampa_sequencia": "72 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-16',
  89.0,
  89.0,
  'pago',
  '2025-01-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f4a1d78-c365-48ed-8327-9735835bf08a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-17',
    124.5,
    'migracao_yampa',
    '{"yampa_sequencia": "73 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-17',
  124.5,
  124.5,
  'pago',
  '2025-01-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'de4f5153-7b26-4cf9-a34a-dab50e4d1359',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-20',
    211.5,
    'migracao_yampa',
    '{"yampa_sequencia": "74 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-20',
  211.5,
  211.5,
  'pago',
  '2025-01-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '226bfcc0-4e1b-4f06-bc88-d01cc0759b24',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-23',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "75 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-23',
  150.0,
  150.0,
  'pago',
  '2025-01-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e9917bab-7755-4fd8-aef1-77df6eaff272',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-24',
    39.0,
    'migracao_yampa',
    '{"yampa_sequencia": "76 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-24',
  39.0,
  39.0,
  'pago',
  '2025-01-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9c6ec07c-cc37-47fc-a56b-a45e2b0e85a2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ) - ref. OS 4729',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ) - ref. OS 4729',
    '2025-01-27',
    280.0,
    'migracao_yampa',
    '{"yampa_sequencia": "77 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Mauá"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-27',
  280.0,
  280.0,
  'pago',
  '2025-01-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4786b615-a00f-4bff-9f30-911ad36d0bf9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-28',
    197.0,
    'migracao_yampa',
    '{"yampa_sequencia": "78 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-28',
  197.0,
  197.0,
  'pago',
  '2025-01-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0f404485-08c0-4ffa-879f-e9ad36bc1f70',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-01-30',
    23.0,
    'migracao_yampa',
    '{"yampa_sequencia": "79 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-30',
  23.0,
  23.0,
  'pago',
  '2025-01-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6736e24b-a688-4a3c-bfb8-08dc6a3adfaa',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-03',
    207.5,
    'migracao_yampa',
    '{"yampa_sequencia": "80 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-03',
  207.5,
  207.5,
  'pago',
  '2025-02-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f0e0407-1e58-49fa-91fb-8a9954b0dd0c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-04',
    157.0,
    'migracao_yampa',
    '{"yampa_sequencia": "81 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-04',
  157.0,
  157.0,
  'pago',
  '2025-02-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0aeacd22-b4d4-4cc5-b473-848f2180cdc4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-05',
    139.0,
    'migracao_yampa',
    '{"yampa_sequencia": "82 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-05',
  139.0,
  139.0,
  'pago',
  '2025-02-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2677e078-11c2-4a76-9cc1-1b5cbe408240',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-10',
    249.5,
    'migracao_yampa',
    '{"yampa_sequencia": "83 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-10',
  249.5,
  249.5,
  'pago',
  '2025-02-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f254f86-b65c-4c28-89d2-a9a35a13b626',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-11',
    164.0,
    'migracao_yampa',
    '{"yampa_sequencia": "84 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-11',
  164.0,
  164.0,
  'pago',
  '2025-02-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9592fffd-0a4c-4a20-ac0d-3b48ee435e31',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-12',
    41.0,
    'migracao_yampa',
    '{"yampa_sequencia": "85 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-12',
  41.0,
  41.0,
  'pago',
  '2025-02-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c2407cd6-f994-48be-8559-1d379fa9cd2f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    'EXPRESS > PIX: 33.814.649/0001-03 (CNPJ)',
    '2025-02-13',
    148.0,
    'migracao_yampa',
    '{"yampa_sequencia": "86 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-13',
  148.0,
  148.0,
  'pago',
  '2025-02-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '81c0c82d-bf1f-4e0d-8cf7-2965ae52a0fc',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
    'VALE ADIANTAMENTO: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
    '2025-03-19',
    934.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  934.0,
  934.0,
  'pago',
  '2025-03-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '17fcc1a8-7cbe-4afc-ae8d-d4e508c5bdaf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    '2025-03-19',
    204.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 52", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  204.0,
  204.0,
  'pago',
  '2025-03-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad934e1c-02e9-4b89-a800-04f56f03cf71',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-19',
    94.52,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  94.52,
  94.52,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '20eb0b22-0810-4e97-bb49-c8b42d9b8f76',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-19',
    48.42,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  48.42,
  48.42,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '481024b4-5cbd-473e-b591-c8a3d0093faa',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-19',
    38.64,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  38.64,
  38.64,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd403d960-684e-4d8d-bedd-e22ea0f540b7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-19',
    286.84,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  286.84,
  286.84,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cd4e6562-5cd6-453b-bd85-30785b4c7beb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-19',
    830.25,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  830.25,
  830.25,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ea4f4725-d6df-43a0-8ce3-a7ff22d2acf0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    '2025-03-19',
    39.2,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  39.2,
  39.2,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da193a2f-0650-4a94-a356-11e4c1686d59',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    '2025-03-19',
    29.85,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  29.85,
  29.85,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd4c7f3ed-ceef-41bf-a045-de4a65a79ccd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-19',
    445.09,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  445.09,
  445.09,
  'pago',
  '2025-03-19',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5d208768-e9fa-44b4-b8d2-7cc5b174a7f9',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 56/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 56/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-20',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "56 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  100.0,
  100.0,
  'pago',
  '2025-03-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bb22e9ac-d222-48e9-8ecf-2138b4c01307',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SHIBATA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'SUPERMERCADO SHIBATA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-20',
    4.53,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  4.53,
  4.53,
  'pago',
  '2025-03-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '30c416c0-cc64-488b-8999-4ee99620e27f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-20',
    222.55,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  222.55,
  222.55,
  'pago',
  '2025-03-20',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '91d1add9-a582-400a-8187-0ef48baf00d8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-20',
    888.1,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  888.1,
  888.1,
  'pago',
  '2025-03-20',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0f39eef7-10ac-469f-9596-aabfc15d1931',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - BRUNA MOREIRA DOS SANTOS',
    'Conciliação - PIX RECEBIDO - BRUNA MOREIRA DOS SANTOS',
    '2025-03-20',
    72.46,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-20',
  72.46,
  72.46,
  'pago',
  '2025-03-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '89fde484-8b1b-43cf-b58e-86adc5e86318',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO: ACERTO FRANQUIA > Parcela 14/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    'ACORDO: ACERTO FRANQUIA > Parcela 14/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    '2025-03-15',
    500.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 54", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  500.0,
  500.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b4c92f84-583a-4737-ae33-abfa91cebb57',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '1/3 DAS FÉRIAS: Jocicreide Macedo Barbosa Santos - Parcela 2/2 > PIX: (11) 9 8018-0836 (celular)',
    '1/3 DAS FÉRIAS: Jocicreide Macedo Barbosa Santos - Parcela 2/2 > PIX: (11) 9 8018-0836 (celular)',
    '2025-03-18',
    125.3,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1 (dif)", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  125.3,
  125.3,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4118f521-77ea-47bf-8368-ac74059c5361',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FÉRIAS: Jocicreide Macedo Barbosa Santos - Parcela 2/2 > PIX: (11) 9 8018-0836 (celular)',
    'FÉRIAS: Jocicreide Macedo Barbosa Santos - Parcela 2/2 > PIX: (11) 9 8018-0836 (celular)',
    '2025-03-18',
    506.4,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1 (dif)", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  506.4,
  506.4,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '94c0796c-df86-4191-acd5-b303331c5d93',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO: ACERTO FRANQUIA > Parcela 15/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    'ACORDO: ACERTO FRANQUIA > Parcela 15/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    '2025-03-15',
    500.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 54", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  500.0,
  500.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ed728fba-74b1-4829-9fcc-8fc0f850b449',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LASONIC SOLUÇÕES INTELIGENTES LTDA: Conserto da cafeteira - MAUÁ > PIX: 16.550.193/0001-94 (CNPJ)',
    'LASONIC SOLUÇÕES INTELIGENTES LTDA: Conserto da cafeteira - MAUÁ > PIX: 16.550.193/0001-94 (CNPJ)',
    '2025-01-11',
    80.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Mauá"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-11',
  80.0,
  80.0,
  'pago',
  '2025-01-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd2be3878-5509-4e7a-9d0e-4e9f6752a0ed',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO: ACERTO FRANQUIA > Parcela 16/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    'ACORDO: ACERTO FRANQUIA > Parcela 16/54 > PIX: 39.406.028/0001-69 (CNPJ)',
    '2025-03-15',
    500.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 54", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  500.0,
  500.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '84ed8b67-ae7d-4d9e-953b-2e82f7e702c9',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-03-18',
    50.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  50.0,
  50.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a7b39a8b-efa2-46a5-a771-6a0c8bf07871',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-03-18',
    25.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  25.0,
  25.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cbeaf456-2704-4443-94d9-7960ee214d0b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'CONSULTAS - ACIB BARUERI',
    'CONSULTAS - ACIB BARUERI',
    '2025-03-18',
    136.81,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 28", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  136.81,
  136.81,
  'pago',
  '2025-03-18',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '923e9e83-5d41-415f-a04c-8164fb758fc9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10672 e 10674',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10672 e 10674',
    '2025-03-17',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  36.0,
  36.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b0a2286f-5633-47d3-a6eb-74a75892e4fe',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 1097',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 1097',
    '2025-03-17',
    28.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano II"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  28.0,
  28.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5041b2cd-0d0b-4cbd-8e03-5220cbf53813',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-03-17',
    10.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  10.0,
  10.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a5dd3cd4-85c5-4a99-9cba-03c2c2bd7e94',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-17',
    887.21,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  887.21,
  887.21,
  'pago',
  '2025-03-17',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c4ecf976-4418-4df4-9161-98c17ce12a8f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-17',
    159.77,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  159.77,
  159.77,
  'pago',
  '2025-03-17',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ed645881-ec6a-4c58-8d08-4ba0b9ec1ce2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-17',
    341.33,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  341.33,
  341.33,
  'pago',
  '2025-03-17',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ce80f11e-ed14-4ac2-92bd-2eed65834703',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-17',
    187.64,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  187.64,
  187.64,
  'pago',
  '2025-03-17',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9f6211da-3e8b-40bb-b640-0af92dabefd7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-17',
    115.86,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  115.86,
  115.86,
  'pago',
  '2025-03-17',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ff492979-d0f7-453d-b32b-c2808f495b36',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'COMPRA DE ÁGUA - Felipe > PIX: (11) 9 5805-6343 (celular)',
    'COMPRA DE ÁGUA - Felipe > PIX: (11) 9 5805-6343 (celular)',
    '2025-03-17',
    15.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  15.0,
  15.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '41e5c11e-d82c-442f-b257-aa6a35c52289',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ANA PAULA VERGINIA DA SILVA',
    'Conciliação - PIX RECEBIDO - ANA PAULA VERGINIA DA SILVA',
    '2025-03-17',
    30.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  30.0,
  30.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd86f4638-ee8d-41fe-8e29-0cf49ac0a716',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10678 e 10679',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10678 e 10679',
    '2025-03-18',
    32.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  32.0,
  32.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bb039f82-b7fe-4a0e-81d6-22825e47ea6e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 4759, 4837 e 4838',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 4759, 4837 e 4838',
    '2025-03-18',
    72.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Mauá"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  72.0,
  72.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '66d81a47-960b-4738-8bdd-557991b0749f',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 54/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 54/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-18',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "54 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  100.0,
  100.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '684ce569-7bd8-4507-8f21-b246fbe36d4f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-18',
    5.86,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  5.86,
  5.86,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '29727e19-da90-448a-a95e-531cfe77d87e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-03-18',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  100.0,
  100.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '03e046ce-05dd-455d-8ce5-1712689576ef',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10683',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10683',
    '2025-03-18',
    78.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  78.0,
  78.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '48865815-df24-4cbc-936f-5451dd1a679e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4835',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4835',
    '2025-03-18',
    40.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Mauá"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  40.0,
  40.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '66a21f9b-965c-42c7-a7d5-4052834b2d2a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-03-18',
    10.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  10.0,
  10.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3d55dc55-989e-4e9e-9208-e70aa6aebf2a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1099',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1099',
    '2025-03-18',
    40.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano II"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  40.0,
  40.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e1190e85-8f27-4b58-a40f-cc620a438bf5',
    'a23b528f-6cbb-4753-b1e9-6d387c8c5666',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Wevilly de Souza Fernandes Líbano - Acordo 8/9 > PIX: 453.302.308-88 (CPF)',
    'RESCISÃO: Wevilly de Souza Fernandes Líbano - Acordo 8/9 > PIX: 453.302.308-88 (CPF)',
    '2025-03-18',
    846.15,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 9", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  846.15,
  846.15,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1c895e0b-afe7-4d87-914f-996190d1b8c4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-18',
    29.67,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  29.67,
  29.67,
  'pago',
  '2025-03-18',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b8564c92-9b81-4402-8f10-d24785396425',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - RONIELIA DA SILVA FERREIRA',
    'Conciliação - PIX RECEBIDO - RONIELIA DA SILVA FERREIRA',
    '2025-03-18',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  100.0,
  100.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e4b5ec35-c562-42bd-bef0-93e40d31d569',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-18',
    325.6,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  325.6,
  325.6,
  'pago',
  '2025-03-18',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fef19bee-e0b3-4151-a322-2d9bb38004ff',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LASONIC SOLUÇÕES INTELIGENTES LTDA: Conserto da cafeteira - PERUS > PIX: 16.550.193/0001-94 (CNPJ)',
    'LASONIC SOLUÇÕES INTELIGENTES LTDA: Conserto da cafeteira - PERUS > PIX: 16.550.193/0001-94 (CNPJ)',
    '2025-03-18',
    70.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  70.0,
  70.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '06797c3c-2b75-42e8-bee5-a6428a7e332e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - JULIANA SANTOS SOARES',
    'Conciliação - PIX RECEBIDO - JULIANA SANTOS SOARES',
    '2025-03-18',
    265.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-18',
  265.0,
  265.0,
  'pago',
  '2025-03-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '43b7fe4e-f6e9-4f8b-b90f-4db841b69e0c',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 55/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 55/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-19',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "55 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-19',
  100.0,
  100.0,
  'pago',
  '2025-03-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7c10e805-d0d7-4361-954f-304dc35c75d2',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Rogério Aparecido de Morais > PIX: ro.gerio.morais@hotmail.com (e-mail)',
    'VALE TRANSPORTE: Rogério Aparecido de Morais > PIX: ro.gerio.morais@hotmail.com (e-mail)',
    '2025-03-07',
    222.5,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-07',
  222.5,
  222.5,
  'pago',
  '2025-03-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e44ab4a1-0a35-45db-8624-26c97e0637b8',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Kathleen dos Santos Campos (ref. 01/10 - 07/10/2024) > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    'VALE TRANSPORTE: Kathleen dos Santos Campos (ref. 01/10 - 07/10/2024) > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    '2024-10-01',
    63.6,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-01',
  63.6,
  63.6,
  'pago',
  '2024-10-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '75b51936-fbd0-4420-8a5f-bd9bc0fd9510',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'OPTOTAL HOYA LTDA',
    'OPTOTAL HOYA LTDA',
    '2024-10-25',
    533.17,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 9", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-10-25',
  533.17,
  533.17,
  'pago',
  '2024-10-25',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ca024227-67d9-4ae2-adc1-a0d3f49aa36e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10361, 10388 e 10413',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10361, 10388 e 10413',
    '2025-03-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1 (dif)", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  100.0,
  100.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd65358f0-b30e-4993-9039-58f59d58626b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    '2025-03-15',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  200.0,
  200.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4c0ed6e1-662e-4759-9cf0-a2d5ce441eda',
    '03474a07-f330-48bc-8329-5ca698083a62',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Vanessa Mendes da Silva - Acordo 1/6 > PIX: vanessamendys151619@gmail.com (e-mail)',
    'RESCISÃO: Vanessa Mendes da Silva - Acordo 1/6 > PIX: vanessamendys151619@gmail.com (e-mail)',
    '2025-03-13',
    370.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 6", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-13',
  370.0,
  370.0,
  'pago',
  '2025-03-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8e07bee4-dafd-41d8-bfc9-5526cb8e8692',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    'VALE TRANSPORTE: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    '2025-03-15',
    218.75,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  218.75,
  218.75,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e2e1b32d-4d80-44aa-9a4b-a3af71ba611a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    'VALE TRANSPORTE: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    '2025-03-15',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  150.0,
  150.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3901abad-13ed-4350-aa74-9a53c6191ce1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    '2025-03-15',
    144.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  144.0,
  144.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fa4a6718-4997-4b71-a4e5-44f542707a74',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'VALE TRANSPORTE: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-15',
    234.6,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 2", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  234.6,
  234.6,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0b3b1cc7-4985-4661-a895-912239374502',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GEOVANA APARECIDA GASTÃO SILVA',
    'Conciliação - PIX RECEBIDO - GEOVANA APARECIDA GASTÃO SILVA',
    '2025-03-14',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-14',
  200.0,
  200.0,
  'pago',
  '2025-03-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '97d104cc-1ab8-42c0-bf62-e576012426bd',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MESSIAS JACOB ALVES DA SILVA',
    'Conciliação - PIX RECEBIDO - MESSIAS JACOB ALVES DA SILVA',
    '2025-03-14',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-14',
  150.0,
  150.0,
  'pago',
  '2025-03-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '586488ec-2df0-473c-b885-ccda71dcaa5d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-14',
    331.16,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-14',
  331.16,
  331.16,
  'pago',
  '2025-03-14',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '90775a8a-cde5-41a0-84e5-31eeeef54f43',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - BARBARA MARINI',
    'Conciliação - PIX RECEBIDO - BARBARA MARINI',
    '2025-03-14',
    10.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-14',
  10.0,
  10.0,
  'pago',
  '2025-03-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '60d3914f-d6f2-4225-b732-930df4791b25',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    '2025-03-14',
    98.4,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-14',
  98.4,
  98.4,
  'pago',
  '2025-03-14',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cb619b80-bc76-400c-91f1-1bc8d69f1120',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 3/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 3/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-03-17',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  350.0,
  350.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '930916e9-3791-4cb8-b2e8-bc8c1e488e65',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CELMA LUIZA DE OLIVEIRA',
    'Conciliação - PIX RECEBIDO - CELMA LUIZA DE OLIVEIRA',
    '2025-03-15',
    500.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  500.0,
  500.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6f4fe3cd-1a2d-4cce-9b7f-be3f9674833a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-15',
    488.05,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  488.05,
  488.05,
  'pago',
  '2025-03-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7a2998c2-0da0-4fd8-9c57-58948c278921',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-03-15',
    206.84,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  206.84,
  206.84,
  'pago',
  '2025-03-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2a814df1-1e5f-4585-b77c-62b5e377a483',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 51/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 51/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "51 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  100.0,
  100.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '119cdc58-a123-4bbd-b2f9-6e9cda22ed85',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-15',
    48.42,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  48.42,
  48.42,
  'pago',
  '2025-03-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5fececc6-cad4-405b-a6be-b524f1f80738',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - QR CODE PIX RECEBIDO - CARLINHOS FERREIRA DE SOUZA',
    'Conciliação - QR CODE PIX RECEBIDO - CARLINHOS FERREIRA DE SOUZA',
    '2025-03-15',
    180.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  180.0,
  180.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e7987569-ceea-41ed-ab66-c5f55dc64e2b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-15',
    283.86,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  283.86,
  283.86,
  'pago',
  '2025-03-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ee08ad4d-cedb-4f85-929b-94fa40e017fc',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SARA PATROCINIO GONCALVES',
    'Conciliação - PIX RECEBIDO - SARA PATROCINIO GONCALVES',
    '2025-03-15',
    225.2,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  225.2,
  225.2,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '63321e65-9391-4f69-90b1-65b61bb55c6f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - VALDEIREDO CORDEIRO DE MELO 07506488809',
    'Conciliação - PIX RECEBIDO - VALDEIREDO CORDEIRO DE MELO 07506488809',
    '2025-03-15',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-15',
  200.0,
  200.0,
  'pago',
  '2025-03-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1cdd231e-0c8b-48b0-8473-690be26db362',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 52/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 52/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "52 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  100.0,
  100.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '10228f45-ad3b-4a1e-91f7-40fdd856b6fa',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FREELANCER: Ariani Dias Fernandes Líbano (ref. 15/03/2025) > PIX: 487.287.868-07 (CPF)',
    'FREELANCER: Ariani Dias Fernandes Líbano (ref. 15/03/2025) > PIX: 487.287.868-07 (CPF)',
    '2025-03-16',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-16',
  150.0,
  150.0,
  'pago',
  '2025-03-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '62b88402-1bf0-427f-a4ee-b90f8f8e7769',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 53/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 53/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "53 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-17',
  100.0,
  100.0,
  'pago',
  '2025-03-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4931262d-1bd4-432d-b481-3bb31bd93b3f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'INSTITUTO VISÃO:  2° Quinz. Novembro > PIX: 35.128.190/0001-01 (CNPJ)',
    'INSTITUTO VISÃO:  2° Quinz. Novembro > PIX: 35.128.190/0001-01 (CNPJ)',
    '2025-03-12',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-12',
  200.0,
  200.0,
  'pago',
  '2025-03-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f2d61da-500c-42a4-b860-34f573f0c117',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10361, 10388 e 10413',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10361, 10388 e 10413',
    '2025-03-13',
    109.87,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1 (dif)", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-13',
  109.87,
  109.87,
  'pago',
  '2025-03-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '912083a3-8bdd-4801-be23-34ead7763318',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Jocicreide Macedo Barbosa Santos > PIX: (11) 9 8018-0836 (celular)',
    'VALE TRANSPORTE: Jocicreide Macedo Barbosa Santos > PIX: (11) 9 8018-0836 (celular)',
    '2025-03-07',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-07',
  150.0,
  150.0,
  'pago',
  '2025-03-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1e546e28-c206-4b17-b5f4-490b06e86d04',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Kathleen dos Santos Campos > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    'VALE TRANSPORTE: Kathleen dos Santos Campos > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    '2025-03-07',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-07',
  150.0,
  150.0,
  'pago',
  '2025-03-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '288f84f8-69b5-4fb7-8a02-1d7212a878c5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Nicolas Coutinho da Silva > PIX: analiviaxavier072@gmail.com (e-mail)',
    'VALE TRANSPORTE: Nicolas Coutinho da Silva > PIX: analiviaxavier072@gmail.com (e-mail)',
    '2025-03-07',
    104.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-07',
  104.0,
  104.0,
  'pago',
  '2025-03-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c796480b-eac7-4de0-97b1-72434228e5f1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    '2025-03-12',
    136.0,
    'migracao_yampa',
    '{"yampa_sequencia": "62 de 157", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-12',
  136.0,
  136.0,
  'pago',
  '2025-03-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '01b7d154-08c1-4d00-9f71-d59c08ac098f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-12',
    69.2,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-12',
  69.2,
  69.2,
  'pago',
  '2025-03-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a2192447-a3ec-40f3-bc30-6056b0026c6b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-12',
    967.23,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-12',
  967.23,
  967.23,
  'pago',
  '2025-03-12',
  NULL
FROM novo_lancamento nl;

