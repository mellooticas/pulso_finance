-- =============================================
-- MIGRAÇÃO YAMPA - LOTE 17/143
-- =============================================
--
-- Registros: 150 
-- Range: 2401 - 2550
-- UUIDs: REAIS do banco
--
-- =============================================

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bde8d72d-5c5c-4702-b42f-4699f273d32b',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - BERNARDETE SANTOS AMARO',
    'Conciliação - PIX RECEBIDO - BERNARDETE SANTOS AMARO',
    '2025-04-22',
    134.75,
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
  '2025-04-22',
  134.75,
  134.75,
  'pago',
  '2025-04-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '340d34fa-ee1a-400d-b40d-c390371cf92b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-04-23',
    7.74,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 9", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-23',
  7.74,
  7.74,
  'pago',
  '2025-04-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ceac8428-11e3-4453-934a-46c0828c7ee5',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 90/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 90/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-23',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "90 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-23',
  100.0,
  100.0,
  'pago',
  '2025-04-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3c6f7b0c-71ef-4826-8065-5799518e8b41',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-04-22',
    163.4,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-22',
  163.4,
  163.4,
  'pago',
  '2025-04-22',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0ef24593-ec86-44ac-b09d-5c86b21358da',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2023-11-23',
    230.64,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-11-23',
  230.64,
  230.64,
  'pago',
  '2023-11-23',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '974ea938-c246-42ee-a805-ad4fe88a4a2a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2023-11-23',
    190.24,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-11-23',
  190.24,
  190.24,
  'pago',
  '2023-11-23',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c34ecc95-7c50-48c9-86a6-19321756355c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-02-01',
    116.07,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-02-01',
  116.07,
  116.07,
  'pago',
  '2024-02-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '085a6594-1091-43ee-93f1-66d21be1a534',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-02-29',
    114.21,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-02-29',
  114.21,
  114.21,
  'pago',
  '2024-02-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b55b7db3-75e3-4cc9-afad-c0970bcaa2ec',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-02-29',
    138.26,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-02-29',
  138.26,
  138.26,
  'pago',
  '2024-02-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7d7a78d1-3064-4bf7-b57a-dc32db5d8c42',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-03-13',
    104.21,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-03-13',
  104.21,
  104.21,
  'pago',
  '2024-03-13',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '120d2f0f-64bf-42a4-a9eb-6268268bf368',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-04-01',
    111.58,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-04-01',
  111.58,
  111.58,
  'pago',
  '2024-04-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '84638c9c-69bd-448f-9071-0314088f4765',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-05-10',
    152.28,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-05-10',
  152.28,
  152.28,
  'pago',
  '2024-05-10',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '552ccf0e-a294-4eaf-98da-266cf3e9f87c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-05-31',
    138.02,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-05-31',
  138.02,
  138.02,
  'pago',
  '2024-05-31',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4d9e9373-c5f9-43d4-aecb-66eaf8a81f18',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - QR CODE PIX RECEBIDO - MARILU CANDIDA JACOB PEREIRA',
    'Conciliação - QR CODE PIX RECEBIDO - MARILU CANDIDA JACOB PEREIRA',
    '2024-04-20',
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
  '2024-04-20',
  200.0,
  200.0,
  'pago',
  '2024-04-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4574f3e6-4f11-4fb9-9fe0-991446142e8c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-07-01',
    136.63,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-07-01',
  136.63,
  136.63,
  'pago',
  '2024-07-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fb1e54af-e68a-441e-93d0-c0ef1076864e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-07-30',
    156.34,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-07-30',
  156.34,
  156.34,
  'pago',
  '2024-07-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '240d678b-19e8-4c6e-bd89-bed470b2de95',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-08-28',
    148.9,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-08-28',
  148.9,
  148.9,
  'pago',
  '2024-08-28',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ffaadfa3-d392-4acc-b19c-b78801e806ac',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-10-04',
    167.93,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-10-04',
  167.93,
  167.93,
  'pago',
  '2024-10-04',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4d1d349b-2d85-4262-9b61-0ba8879b2bcc',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-12-04',
    172.92,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  172.92,
  172.92,
  'pago',
  '2024-12-04',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ae3054bd-653b-40d0-bee2-f73d10e72342',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2024-12-04',
    200.86,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  200.86,
  200.86,
  'pago',
  '2024-12-04',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '520c0402-2a4b-4aef-90fe-0a8dcb49f85c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-01-06',
    170.42,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-01-06',
  170.42,
  170.42,
  'pago',
  '2025-01-06',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '16963b7d-ab58-4508-ac3a-839d15947568',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-03-03',
    162.6,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-03-03',
  162.6,
  162.6,
  'pago',
  '2025-03-03',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e64ba965-457b-4098-8be3-0814fd1d6755',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-03-03',
    164.58,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-03-03',
  164.58,
  164.58,
  'pago',
  '2025-03-03',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0feaf083-ea5d-4e32-b569-9a7a97957833',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'INSTITUTO VISÃO: 1° Quinz. Janeiro > PIX: 35.128.190/0001-01 (CNPJ)',
    'INSTITUTO VISÃO: 1° Quinz. Janeiro > PIX: 35.128.190/0001-01 (CNPJ)',
    '2025-03-25',
    120.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 3", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-03-25',
  120.0,
  120.0,
  'pago',
  '2025-03-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7ee4aec4-6301-431f-af24-43371a92fb9a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    '2025-04-16',
    153.96,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-16',
  153.96,
  153.96,
  'pago',
  '2025-04-16',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ebd17324-2b12-439e-8dd7-9a083d0970f3',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'INSTITUTO VISÃO: 2° Quinz. Janeiro > PIX: 35.128.190/0001-01 (CNPJ)',
    'INSTITUTO VISÃO: 2° Quinz. Janeiro > PIX: 35.128.190/0001-01 (CNPJ)',
    '2025-03-25',
    240.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 3", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-03-25',
  240.0,
  240.0,
  'pago',
  '2025-03-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '10c2f796-3aaa-42fe-8beb-051832b002e8',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    '2025-03-20',
    148.78,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 3", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  148.78,
  148.78,
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
    '322d2b96-9aa2-45ff-9abe-16c97d257fa2',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-04-16',
    212.55,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-16',
  212.55,
  212.55,
  'pago',
  '2025-04-16',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f0461dbe-537e-4cf9-96fd-f54e56e826e0',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    'SABESP - LOJA MAUA RGI 06001601037027800',
    '2025-04-03',
    141.67,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 3", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-03',
  141.67,
  141.67,
  'pago',
  '2025-04-03',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '60d4be44-fdea-4a39-a68e-7036bab23c63',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    'EDP BANDEIRANTES 0033609799 - LOJA SUZANO 2',
    '2025-04-16',
    188.15,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 21", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-16',
  188.15,
  188.15,
  'pago',
  '2025-04-16',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3525a341-190c-445f-a016-783dbd929ea1',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SIMONE QUIRINO DOS SANTOS',
    'Conciliação - PIX RECEBIDO - SIMONE QUIRINO DOS SANTOS',
    '2025-04-11',
    580.0,
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
  '2025-04-11',
  580.0,
  580.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'dbe933f2-9fb5-4bb4-89bc-169a258d1790',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MARILU CANDIDA JACOB PEREIRA',
    'Conciliação - PIX RECEBIDO - MARILU CANDIDA JACOB PEREIRA',
    '2025-04-12',
    50.0,
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
  '2025-04-12',
  50.0,
  50.0,
  'pago',
  '2025-04-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '776cb711-0ad6-42a7-9204-47e7c301f07f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10812 (Vanda) e 10821 (10812 - Luciano)',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10812 (Vanda) e 10821 (10812 - Luciano)',
    '2025-04-16',
    361.0,
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
  '2025-04-16',
  361.0,
  361.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5b00efd1-3c34-42f5-adf6-8ed9d68ac4a7',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SILVIA MARIA N DAMASCENO',
    'Conciliação - PIX RECEBIDO - SILVIA MARIA N DAMASCENO',
    '2025-04-15',
    69.9,
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
  '2025-04-15',
  69.9,
  69.9,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b5be0190-8ffa-438d-b993-a0a98349b0ed',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CLARA DE SOUZA NOGUEIRA',
    'Conciliação - PIX RECEBIDO - CLARA DE SOUZA NOGUEIRA',
    '2025-04-15',
    160.0,
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
  '2025-04-15',
  160.0,
  160.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '470f7366-aab5-49fa-9016-14cc6245fbb4',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - VALDEIREDO CORDEIRO DE MELO 07506488809',
    'Conciliação - PIX RECEBIDO - VALDEIREDO CORDEIRO DE MELO 07506488809',
    '2025-04-15',
    145.4,
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
  '2025-04-15',
  145.4,
  145.4,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '776ad725-4663-49d6-aed1-4e3247129bf9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10746 e 10754',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10746 e 10754',
    '2025-04-16',
    120.0,
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
  '2025-04-16',
  120.0,
  120.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '60434897-045e-4028-821b-c62cd8c8156e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10811',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10811',
    '2025-04-16',
    145.0,
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
  '2025-04-16',
  145.0,
  145.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a9cd6108-309f-463c-9f3f-143d697e4241',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-15',
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
  '2025-04-15',
  445.09,
  445.09,
  'pago',
  '2025-04-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c958e047-6fc4-424a-b5ec-165374dc1728',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-04-15',
    6.95,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-15',
  6.95,
  6.95,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '61e39b2a-d37e-42b7-9a42-438024402ad1',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SELMA BORGES DOS SANTOS',
    'Conciliação - PIX RECEBIDO - SELMA BORGES DOS SANTOS',
    '2025-04-16',
    75.0,
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
  '2025-04-16',
  75.0,
  75.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bcd2c422-6ec3-4583-89f6-97dabf994ff8',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - KAYO EDUARDO ROCHA',
    'Conciliação - PIX RECEBIDO - KAYO EDUARDO ROCHA',
    '2025-04-16',
    149.0,
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
  '2025-04-16',
  149.0,
  149.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b7aa333b-b1dc-4c93-be44-340e07dc9638',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-04-16',
    124.63,
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
  '2025-04-16',
  124.63,
  124.63,
  'pago',
  '2025-04-16',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b45a4911-b3d6-4ceb-89bb-beba475731cf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4799 (diferença - aumento do diâmetro da lente)',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4799 (diferença - aumento do diâmetro da lente)',
    '2025-04-16',
    11.77,
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
  '2025-04-16',
  11.77,
  11.77,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3c6346a1-5e3a-4f12-9078-b48b48847e29',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-04-16',
    698.48,
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
  '2025-04-16',
  698.48,
  698.48,
  'pago',
  '2025-04-16',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '26adf701-570a-4c35-94eb-72ec5bc9a9cd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-16',
    117.28,
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
  '2025-04-16',
  117.28,
  117.28,
  'pago',
  '2025-04-16',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5405f62e-684a-4669-9409-7e940be602a1',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 83/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 83/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "83 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-17',
  100.0,
  100.0,
  'pago',
  '2025-04-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c8aea27d-491b-4499-8b46-9cfcbc1c5303',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-04-17',
    7.54,
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
  '2025-04-17',
  7.54,
  7.54,
  'pago',
  '2025-04-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f33c20dc-d84c-4117-9fcc-f5aaff3f900e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-17',
    2.75,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-17',
  2.75,
  2.75,
  'pago',
  '2025-04-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f7b76355-10b0-475a-8388-3c7669d98d38',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 84/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 84/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-17',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "84 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-17',
  100.0,
  100.0,
  'pago',
  '2025-04-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3da654c2-db71-477a-acfa-1f4ce77c4889',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    'SABESP - LOJA SUZANO 2 RGI 0046782494',
    '2025-04-16',
    161.69,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-16',
  161.69,
  161.69,
  'pago',
  '2025-04-16',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e5f71f7b-fdf9-4f02-8d0d-bbc33e441f9c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10798',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10798',
    '2025-04-11',
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
  '2025-04-11',
  78.0,
  78.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '592b566d-7a29-4f9d-ad08-02085910932c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-04-14',
    28.8,
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
  '2025-04-14',
  28.8,
  28.8,
  'pago',
  '2025-04-14',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '35786b08-1584-4675-ac7d-6fbe48ef8179',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'VALE TRANSPORTE: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-04-16',
    231.0,
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
  '2025-04-16',
  231.0,
  231.0,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3689646b-bc76-4a2e-a446-fa469b90a9c7',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    '2025-04-15',
    138.0,
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
  '2025-04-15',
  138.0,
  138.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1eb3586c-6560-420f-9291-798078d0a827',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 15/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 15/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    '2025-04-15',
    50.0,
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
  '2025-04-15',
  50.0,
  50.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ef43bbb4-0175-4494-bff3-eb1f9397b76c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Camila Faccin Vieira (ref. 15/04 - 22/04/2025) > PIX: (11) 9 5485-1322 (celular)',
    'VALE TRANSPORTE: Camila Faccin Vieira (ref. 15/04 - 22/04/2025) > PIX: (11) 9 5485-1322 (celular)',
    '2025-04-15',
    89.0,
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
  '2025-04-15',
  89.0,
  89.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9f4fab1d-1712-4a18-bec2-c08e9ce78dce',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'VALE TRANSPORTE: Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-15',
    119.6,
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
  '2025-04-15',
  119.6,
  119.6,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1c3ca792-6195-4a1c-80a5-9f42adcb563a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    'VALE TRANSPORTE: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    '2025-04-15',
    138.0,
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
  '2025-04-15',
  138.0,
  138.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b3c01bb0-58c7-44eb-8eef-5e198e158666',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-16',
    1.92,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-16',
  1.92,
  1.92,
  'pago',
  '2025-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5d0c295b-705d-4030-bc18-c47e87192051',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-02-22',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-02-22',
  89.5,
  89.5,
  'pago',
  '2023-02-22',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a80b3ba7-94ec-403c-be8d-faf787666811',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-03-22',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-03-22',
  89.5,
  89.5,
  'pago',
  '2023-03-22',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a690d4b4-3f0a-4545-8025-ed34474cab95',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-05-12',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-05-12',
  89.5,
  89.5,
  'pago',
  '2023-05-12',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '640ba7a3-5fd6-4843-a1cb-717f937f6443',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-06-28',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-06-28',
  89.5,
  89.5,
  'pago',
  '2023-06-28',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '02e09e22-e6ec-4d87-b407-58af263bcf43',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-07-27',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-07-27',
  89.5,
  89.5,
  'pago',
  '2023-07-27',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0a841fca-35dc-47ca-8f1d-4bfbbb8605eb',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2023-08-29',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2023-08-29',
  89.5,
  89.5,
  'pago',
  '2023-08-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6b59f1df-99b0-4e88-aacb-1be8ac1ba401',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-01-24',
    98.91,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-01-24',
  98.91,
  98.91,
  'pago',
  '2024-01-24',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b125deed-9994-4200-8793-8f0268fe0e84',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-03-20',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-03-20',
  93.0,
  93.0,
  'pago',
  '2024-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5941ec9a-4675-46ac-a0b4-cb2e29574927',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-03-20',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-03-20',
  93.0,
  93.0,
  'pago',
  '2024-03-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a47112fd-0c7a-4607-9605-0ed0b4f7fecd',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-04-29',
    89.5,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-04-29',
  89.5,
  89.5,
  'pago',
  '2024-04-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '657833a4-30ec-4b8d-abc8-c989477f205b',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-04-29',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-04-29',
  93.0,
  93.0,
  'pago',
  '2024-04-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bb42ff90-ec42-4b85-b553-79391a3d63b5',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-05-29',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-05-29',
  93.0,
  93.0,
  'pago',
  '2024-05-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '027a26cb-a9dd-4fcd-9cc0-40d207ceafc1',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-05-29',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-05-29',
  93.0,
  93.0,
  'pago',
  '2024-05-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd30ab6d5-6915-4282-afab-1cfcf2c497a1',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-06-21',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-06-21',
  93.0,
  93.0,
  'pago',
  '2024-06-21',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f540d4d2-0f52-4702-8c31-548b9ac75e9d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-06-21',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-06-21',
  93.0,
  93.0,
  'pago',
  '2024-06-21',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '80ee8340-22cc-4540-af06-8a8584643362',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-07-29',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-07-29',
  93.0,
  93.0,
  'pago',
  '2024-07-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f42cb9a5-27fd-400d-afc0-01ffd1999d28',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-07-29',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-07-29',
  93.0,
  93.0,
  'pago',
  '2024-07-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '36778225-f347-4349-9d64-ba861d1231c5',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-08-20',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-08-20',
  93.0,
  93.0,
  'pago',
  '2024-08-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '31ecdc29-d795-43ae-a772-225ca2ed0e2b',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-08-20',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-08-20',
  93.0,
  93.0,
  'pago',
  '2024-08-20',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd4c7c2fc-9830-408b-8464-de831b29e5c2',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-09-26',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-09-26',
  93.0,
  93.0,
  'pago',
  '2024-09-26',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd12eb2ac-e5bc-452a-bebb-f945e1e59711',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-09-27',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  93.0,
  93.0,
  'pago',
  '2024-09-27',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '13f57bea-88b4-406c-b0ee-80cc9b344708',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2024-10-28',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  93.0,
  93.0,
  'pago',
  '2024-10-28',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c4d8ab8c-dc6f-44cf-b600-c3391a0a1fb0',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
    '2024-10-31',
    93.0,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 13", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2024-10-31',
  93.0,
  93.0,
  'pago',
  '2024-10-31',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ee982b36-d30b-412f-a3e6-3475a28a2d5a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10629',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10629',
    '2025-03-12',
    203.5,
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
  '2025-03-12',
  203.5,
  203.5,
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
    'a45ee2e5-be00-42f0-ba86-c1d61775bc2d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10670',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10670',
    '2025-03-18',
    34.0,
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
  34.0,
  34.0,
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
    '3d1f1708-6ddd-42b7-80ba-29edab16e60d',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - LUCIANA BARBARA DA ROCHA DE JE',
    'Conciliação - PIX RECEBIDO - LUCIANA BARBARA DA ROCHA DE JE',
    '2025-03-20',
    96.66,
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
  96.66,
  96.66,
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
    '8f3b5e9c-c9bb-4449-877f-dcf9729f6b07',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    'ALUGUEL LOJA - MAUÁ (IPTU)',
    '2025-03-21',
    106.0,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 19", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-03-21',
  106.0,
  106.0,
  'pago',
  '2025-03-21',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ed463ca5-6185-473d-920a-9a7f82648a1b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10694 e 10695',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10694 e 10695',
    '2025-03-29',
    307.8,
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
  '2025-03-29',
  307.8,
  307.8,
  'pago',
  '2025-03-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b90fdc2f-2b81-4753-9e45-2c397d4b5c96',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '(ESTORNO, ref. a depósito errado) - BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10705 e 10706',
    '(ESTORNO, ref. a depósito errado) - BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10705 e 10706',
    '2025-04-03',
    207.8,
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
  '2025-04-03',
  207.8,
  207.8,
  'pago',
  '2025-04-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7b98dfaa-bc5b-4f66-898c-b4ab8edabf80',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10629 (diferença p/ rebaixameto de borda)',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10629 (diferença p/ rebaixameto de borda)',
    '2025-04-03',
    100.0,
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
  '2025-04-03',
  100.0,
  100.0,
  'pago',
  '2025-04-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f4880790-4760-4e13-9456-a90bcfcacc1b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10761',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10761',
    '2025-04-04',
    130.0,
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
  '2025-04-04',
  130.0,
  130.0,
  'pago',
  '2025-04-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a1ca2a6b-6cef-4f47-9155-1ea0ca9ff9f3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10694 (duplicado), 10695 (duplicado), 10705 e 10706',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10694 (duplicado), 10695 (duplicado), 10705 e 10706',
    '2025-04-04',
    585.8,
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
  '2025-04-04',
  585.8,
  585.8,
  'pago',
  '2025-04-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3ab7138b-b6fb-48f2-85ab-ea70ff6d362d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10784 e 10792',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10784 e 10792',
    '2025-04-07',
    370.0,
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
  '2025-04-07',
  370.0,
  370.0,
  'pago',
  '2025-04-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3f09a131-723b-4a8d-908d-8064d51ded44',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-04-14',
    50.0,
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
  '2025-04-14',
  50.0,
  50.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '263d537d-cab0-477f-9d9a-835ea0297365',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10673, 10719 e 10748',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10673, 10719 e 10748',
    '2025-04-08',
    730.5,
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
  '2025-04-08',
  730.5,
  730.5,
  'pago',
  '2025-04-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'eb750d39-1c98-4f84-ba07-8447d367fc85',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-04-14',
    225.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-14',
  225.0,
  225.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '984fbf48-dec0-4b88-bf37-071af315491f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 1107 e 1108',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 1107 e 1108',
    '2025-04-11',
    104.0,
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
  '2025-04-11',
  104.0,
  104.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5cdbed5d-f20f-4b3a-907b-a778ff6489c0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4799',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4799',
    '2025-04-11',
    286.0,
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
  '2025-04-11',
  286.0,
  286.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4817c25c-1f7f-4428-9b3c-c4ce68f427ae',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'COMISSÃO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    'COMISSÃO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    '2025-04-10',
    979.0,
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
  '2025-04-10',
  979.0,
  979.0,
  'pago',
  '2025-04-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '86b37ca2-5f67-4264-a592-b11877b33c57',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10798, 10814 e 10817',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10798, 10814 e 10817',
    '2025-04-14',
    617.0,
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
  '2025-04-14',
  617.0,
  617.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '53b692c8-f34b-44e5-888d-5a0f5809e141',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-04-11',
    92.0,
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
  '2025-04-11',
  92.0,
  92.0,
  'pago',
  '2025-04-11',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c4221244-3f3c-48be-9f9b-deb081a91bf4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-04-11',
    96.74,
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
  '2025-04-11',
  96.74,
  96.74,
  'pago',
  '2025-04-11',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bb74de36-88c5-4c04-a5a6-1b10dd517ac0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10816, 10818 e 10822',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10816, 10818 e 10822',
    '2025-04-11',
    124.0,
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
  '2025-04-11',
  124.0,
  124.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fd59e258-deb5-43db-8217-823c5c9acdd7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 4856 e 4860',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 4856 e 4860',
    '2025-04-11',
    96.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1 (dif)", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Mauá"}'::jsonb,
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
  '2025-04-11',
  96.0,
  96.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '80e51f35-5a24-4bb4-9321-0fd3f46e82ab',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-04-11',
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
  '2025-04-11',
  10.0,
  10.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cbb261c7-810e-48ca-8e34-9370bff9e50b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4857',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4857',
    '2025-04-11',
    63.0,
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
  '2025-04-11',
  63.0,
  63.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a2c4ff6b-223c-4604-9823-158bc8ab30e0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10788 e 10797',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10788 e 10797',
    '2025-04-11',
    478.0,
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
  '2025-04-11',
  478.0,
  478.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f9183cb5-d50c-40fa-baa7-ce84836d1ede',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 9/24',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 9/24',
    '2025-04-14',
    196.96,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
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
  '2025-04-14',
  196.96,
  196.96,
  'pago',
  '2025-04-14',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '77817f64-3e5e-4e6f-95f5-564c0290b8c1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 24/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 24/32',
    '2025-04-14',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "24 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
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
  '2025-04-14',
  269.43,
  269.43,
  'pago',
  '2025-04-14',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '99ee5c1e-823d-4bf0-84a3-474680922f79',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-04-12',
    148.36,
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
  '2025-04-12',
  148.36,
  148.36,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3e8e4f1f-ae48-4206-b551-91847b0b9f24',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-12',
    189.24,
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
  '2025-04-12',
  189.24,
  189.24,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5f0cbe4d-4d24-4782-8c6d-10cb28519c69',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-04-12',
    49.45,
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
  '2025-04-12',
  49.45,
  49.45,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da82f222-5aee-4c2c-9b45-39c16cc0b3d4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-12',
    267.21,
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
  '2025-04-12',
  267.21,
  267.21,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8ab3af66-1b00-4144-aa69-37ade3850867',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-12',
    609.82,
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
  '2025-04-12',
  609.82,
  609.82,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8301bc0b-3b64-404d-8569-b79d0026c899',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-12',
    19.78,
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
  '2025-04-12',
  19.78,
  19.78,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7e5b355a-0b47-40ea-bcf1-7d491ea61ad0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-12',
    67.26,
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
  '2025-04-12',
  67.26,
  67.26,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '49c50d6e-c8ed-43fb-b6b0-782b88360427',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-04-12',
    798.4,
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
  '2025-04-12',
  798.4,
  798.4,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ca2465e8-f770-4ea2-af54-bef1d604a38d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-12',
    279.09,
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
  '2025-04-12',
  279.09,
  279.09,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fa606103-ed29-4d8e-b30b-349c3068b928',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-04-12',
    38.74,
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
  '2025-04-12',
  38.74,
  38.74,
  'pago',
  '2025-04-12',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ba40f2cb-b6eb-406c-a9af-2ee7b3d1503a',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - NAYANE DE ARAUJO SILVA MENDES MAGNESI',
    'Conciliação - PIX RECEBIDO - NAYANE DE ARAUJO SILVA MENDES MAGNESI',
    '2025-04-12',
    50.0,
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
  '2025-04-12',
  50.0,
  50.0,
  'pago',
  '2025-04-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '071bd15f-1434-4f74-9c16-479b1835ff85',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Margarina e pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Margarina e pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-12',
    9.66,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-12',
  9.66,
  9.66,
  'pago',
  '2025-04-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ea85039d-b047-4287-993d-f33d6904f088',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 79/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 79/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-12',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "79 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-12',
  100.0,
  100.0,
  'pago',
  '2025-04-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '892f23cf-2acc-4a5b-9751-f4244b85ef7c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 7/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 7/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-04-14',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-14',
  350.0,
  350.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2a1ab26a-5ee2-4202-a697-3e61cf28babb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-04-13',
    131.74,
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
  '2025-04-13',
  131.74,
  131.74,
  'pago',
  '2025-04-13',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '034227a5-c615-4f00-90b4-5fac06500f73',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-04-13',
    38.72,
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
  '2025-04-13',
  38.72,
  38.72,
  'pago',
  '2025-04-13',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '95869b6c-8b24-440c-b76f-9ec0f9edb6d8',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 80/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 80/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-14',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "80 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-14',
  100.0,
  100.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7f270e64-1110-4251-b9fc-84905c2bae34',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'TAXA DE EXPEDIENTE 2025 - Prefeitura Municipal de Suzano',
    'TAXA DE EXPEDIENTE 2025 - Prefeitura Municipal de Suzano',
    '2025-04-14',
    41.88,
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
  '2025-04-14',
  41.88,
  41.88,
  'pago',
  '2025-04-14',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e77b639b-a1cc-4a2d-92f9-e6dfe3703b7b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 14/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 14/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    '2025-04-14',
    50.0,
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
  '2025-04-14',
  50.0,
  50.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6af18156-05bc-410e-bcb1-6ccc7fd4106b',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MONTAGEM: Óticas Vênice (ref. OS 4848) > PIX: 42.041.916/0001-30 (CNPJ)',
    'MONTAGEM: Óticas Vênice (ref. OS 4848) > PIX: 42.041.916/0001-30 (CNPJ)',
    '2025-04-14',
    30.0,
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
  '2025-04-14',
  30.0,
  30.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '52c56bd7-4ced-4694-8049-421cfd63e320',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10700 e 10701 (diferença - coloração + 2 montagens)',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10700 e 10701 (diferença - coloração + 2 montagens)',
    '2025-04-14',
    71.0,
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
  '2025-04-14',
  71.0,
  71.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'be1da351-6a80-44f0-9a2e-bf415618550e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-14',
    2.95,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-14',
  2.95,
  2.95,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6fccec86-3af9-409c-b556-abcf29b76b67',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-04-14',
    593.46,
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
  '2025-04-14',
  593.46,
  593.46,
  'pago',
  '2025-04-14',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7aab906d-ec03-4b4a-9b00-12df1b9f15e5',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - DANIEL TAVARES DASAN',
    'Conciliação - PIX RECEBIDO - DANIEL TAVARES DASAN',
    '2025-04-14',
    390.0,
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
  '2025-04-14',
  390.0,
  390.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '164592b0-cb6b-4ce4-a9bc-711f50ee7891',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 81/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 81/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-14',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "81 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-14',
  100.0,
  100.0,
  'pago',
  '2025-04-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd61ac513-5777-425a-b7ea-78beac57c61d',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-04-15',
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
  '2025-04-15',
  10.0,
  10.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5973f168-5336-4514-a5f4-92e26f6d1dae',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4859',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4859',
    '2025-04-15',
    289.0,
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
  '2025-04-15',
  289.0,
  289.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '09639580-785b-4b04-bdd1-364f03e4e417',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10835 e 10839',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10835 e 10839',
    '2025-04-15',
    103.0,
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
  '2025-04-15',
  103.0,
  103.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '68f3319f-e1b2-461d-86ca-a3c508af65e0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10749',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10749',
    '2025-04-15',
    106.0,
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
  '2025-04-15',
  106.0,
  106.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a8e526bd-501d-43fe-a529-89452e2cb76b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-15',
    283.13,
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
  '2025-04-15',
  283.13,
  283.13,
  'pago',
  '2025-04-15',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a2278d97-b5bd-4d85-bd17-9241366071ed',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10757, 10765-1, 10766, 10829, 10830, 10831, 10833, 10834 e 10841',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10757, 10765-1, 10766, 10829, 10830, 10831, 10833, 10834 e 10841',
    '2025-04-15',
    229.0,
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
  '2025-04-15',
  229.0,
  229.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1b24359e-bc44-45f2-b969-85a747183ea5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 1110',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 1110',
    '2025-04-15',
    11.0,
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
  '2025-04-15',
  11.0,
  11.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '959332f8-356e-4ca9-b1a9-b3ea2a31024a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-15',
    2.56,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-15',
  2.56,
  2.56,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f62185db-fdca-4f01-9071-dc7a2ea61b3c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - KAYO EDUARDO ROCHA',
    'Conciliação - PIX RECEBIDO - KAYO EDUARDO ROCHA',
    '2025-04-15',
    135.0,
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
  '2025-04-15',
  135.0,
  135.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '805f908e-6a47-45bc-8785-47b27b8c2ffe',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 82/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 82/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-15',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "82 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-15',
  100.0,
  100.0,
  'pago',
  '2025-04-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2aa26099-3798-4554-be0e-91ce9dddb8cf',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CLAUDEMIR SILVA',
    'Conciliação - PIX RECEBIDO - CLAUDEMIR SILVA',
    '2024-04-19',
    250.0,
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
  '2024-04-19',
  250.0,
  250.0,
  'pago',
  '2024-04-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b0a2c021-3cfe-406f-abd3-31288b47f47f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    '2025-04-11',
    80.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
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
  '2025-04-11',
  80.0,
  80.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '15ad85b6-3805-48ac-9b68-86ceb301e01a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-04-11',
    200.0,
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
  '2025-04-11',
  200.0,
  200.0,
  'pago',
  '2025-04-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8e6ea2b6-f21b-42b3-a349-da5e67879eae',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MARÍA SANDRA DA SILVA DIAS',
    'Conciliação - PIX RECEBIDO - MARÍA SANDRA DA SILVA DIAS',
    '2025-04-04',
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
  '2025-04-04',
  150.0,
  150.0,
  'pago',
  '2025-04-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '405feea7-f01e-4e32-a01b-bdfcf4614e91',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - VITORIA NHOQUE JACINTO',
    'Conciliação - PIX RECEBIDO - VITORIA NHOQUE JACINTO',
    '2025-04-04',
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
  '2025-04-04',
  100.0,
  100.0,
  'pago',
  '2025-04-04',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'db386409-f1fa-4b23-b278-b5fa11e7aae3',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GRACIELA ANTONIA GREGORIO',
    'Conciliação - PIX RECEBIDO - GRACIELA ANTONIA GREGORIO',
    '2025-04-08',
    325.0,
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
  '2025-04-08',
  325.0,
  325.0,
  'pago',
  '2025-04-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

