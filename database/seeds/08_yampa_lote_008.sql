-- =============================================
-- MIGRAÇÃO YAMPA - LOTE 8/143
-- =============================================
--
-- Registros: 150 
-- Range: 1051 - 1200
-- UUIDs: REAIS do banco
--
-- =============================================

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8deafdaa-bf8e-4ada-8e74-466d9369b21c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-07-01',
    3.78,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 33", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  3.78,
  3.78,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'eb740c1a-382a-4246-9110-b440877274ab',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-07-02',
    3.67,
    'migracao_yampa',
    '{"yampa_sequencia": "22 de 33", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  3.67,
  3.67,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e3d17e38-80fd-426f-940f-a9ed71500bf2',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-07-03',
    3.92,
    'migracao_yampa',
    '{"yampa_sequencia": "23 de 33", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-03',
  3.92,
  3.92,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6d4c3df2-9388-4bd3-a7ed-fc604ad2aff9',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-07-04',
    3.92,
    'migracao_yampa',
    '{"yampa_sequencia": "24 de 33", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-04',
  3.92,
  3.92,
  'pago',
  '2025-07-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fda44747-5061-4371-a533-f276d696eb70',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-07-04',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "25 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-04',
  150.0,
  150.0,
  'pago',
  '2025-07-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e9c13baa-e21c-4a05-8dc5-1f10a4d43f04',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-07-04',
    175.0,
    'migracao_yampa',
    '{"yampa_sequencia": "26 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-04',
  175.0,
  175.0,
  'pago',
  '2025-07-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ab0ac675-022b-4096-8ee9-1542a1a67d17',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11308',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11308',
    '2025-07-07',
    181.3,
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
  '2025-07-07',
  181.3,
  181.3,
  'pago',
  '2025-07-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f5573837-7301-43a2-abf8-b70de95159ad',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11304',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11304',
    '2025-07-07',
    282.14,
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
  '2025-07-07',
  282.14,
  282.14,
  'pago',
  '2025-07-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1ace6865-8199-4256-9ca3-d04cbe1f94d6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 19/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 19/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-07-07',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-07',
  350.0,
  350.0,
  'pago',
  '2025-07-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '443ca962-96e7-401b-85ff-737f4f8623bf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-07-05',
    906.78,
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
  '2025-07-05',
  906.78,
  906.78,
  'pago',
  '2025-07-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a097bfe8-ccea-46d4-9d3a-14ee571b3c48',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - JOAO JUSTINO FILHO',
    'Conciliação - PIX RECEBIDO - JOAO JUSTINO FILHO',
    '2025-06-13',
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
  '2025-06-13',
  50.0,
  50.0,
  'pago',
  '2025-06-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b7fe9ff2-50f3-4ac0-88d5-126225e216dd',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês',
    'SUPERMERCADO SANTA FÉ: Pão francês',
    '2025-06-14',
    3.36,
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
  '2025-06-14',
  3.36,
  3.36,
  'pago',
  '2025-06-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6358cc9b-07d5-4fa9-8ccf-991004fb832e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Café em pó',
    'SUPERMERCADO SANTA FÉ: Café em pó',
    '2025-06-14',
    32.98,
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
  '2025-06-14',
  32.98,
  32.98,
  'pago',
  '2025-06-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f448eec8-e384-4de5-a1cd-03c1f1ca13f8',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 109/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 109/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-07-03',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "109 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-03',
  100.0,
  100.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '518ae600-59ff-485b-ab52-4b2a2ad3cc08',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ACORDO > ALUGUEL MAUÁ - Loja (ref. 04/2025) > parcela 15/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    'ACORDO > ALUGUEL MAUÁ - Loja (ref. 04/2025) > parcela 15/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    '2025-07-03',
    173.21,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 18", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-03',
  173.21,
  173.21,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ec6f603b-6b3a-49fe-96cd-c0ab58edc4cf',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ACORDO > ALUGUEL MAUÁ - Clínica (ref. 03/2025 e 04/2025) > parcela 15/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    'ACORDO > ALUGUEL MAUÁ - Clínica (ref. 03/2025 e 04/2025) > parcela 15/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    '2025-07-03',
    346.42,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 18", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-03',
  346.42,
  346.42,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ddcaa17c-f323-4389-9699-32436541dec3',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    'RESCISÃO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    '2025-07-02',
    100.0,
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
  '2025-07-02',
  100.0,
  100.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a9e39fa6-25af-4368-8d0c-c5f5d04ee2e3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11249',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11249',
    '2025-07-03',
    430.0,
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
  '2025-07-03',
  430.0,
  430.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '307269f3-efc5-49eb-a0fc-0458379abc6f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11293',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11293',
    '2025-07-03',
    95.0,
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
  '2025-07-03',
  95.0,
  95.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2a40a536-ce39-4a4c-aac6-a21564f4f91e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11292',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11292',
    '2025-07-03',
    249.8,
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
  '2025-07-03',
  249.8,
  249.8,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7b883897-d12e-4377-86e6-3d4e05d9517c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - KETTELYN ARAUJO DE OLIVEIRA',
    'Conciliação - PIX RECEBIDO - KETTELYN ARAUJO DE OLIVEIRA',
    '2025-07-02',
    124.0,
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
  '2025-07-02',
  124.0,
  124.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '492927d2-374d-4cda-9e95-c29bf3c2b1fc',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-07-02',
    495.0,
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
  '2025-07-02',
  495.0,
  495.0,
  'pago',
  '2025-07-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a5e76d18-4a05-48a3-8fc3-3642bc937078',
    'a23b528f-6cbb-4753-b1e9-6d387c8c5666',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 7/81',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 7/81',
    '2025-07-03',
    208.86,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 81", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-03',
  208.86,
  208.86,
  'pago',
  '2025-07-03',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7f539b9a-832a-4e15-8253-ac7f3cabb9a5',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-07-03',
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
  '2025-07-03',
  10.0,
  10.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd397d47a-f4ef-42da-863b-5cd504ba88a0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11270 - 2°',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11270 - 2°',
    '2025-07-03',
    42.0,
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
  '2025-07-03',
  42.0,
  42.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '21733863-c3f0-4150-aba9-4826f4c91a9d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11289',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11289',
    '2025-07-03',
    11.0,
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
  '2025-07-03',
  11.0,
  11.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9c1c7d18-4bdd-4380-9d65-3de6cf2638db',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11288',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11288',
    '2025-07-03',
    48.0,
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
  '2025-07-03',
  48.0,
  48.0,
  'pago',
  '2025-07-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '40808ec8-86e1-4202-a5a7-2344642b3313',
    '03474a07-f330-48bc-8329-5ca698083a62',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ACORDO > ALUGUEL LOJA - PERUS (finalização do contrato) > parcela 4/8 > PIX: santos3imoveis@gmail.com (e-mail)',
    'ACORDO > ALUGUEL LOJA - PERUS (finalização do contrato) > parcela 4/8 > PIX: santos3imoveis@gmail.com (e-mail)',
    '2025-07-01',
    500.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 8", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  500.0,
  500.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd799098a-3ef3-438c-bdef-01a2440a7d7f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FÉRIAS: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'FÉRIAS: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-07-02',
    400.0,
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
  '2025-07-02',
  400.0,
  400.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'daf9af05-2a91-48b9-b583-2271a0184f90',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    '2025-07-02',
    360.0,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  360.0,
  360.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '366ced7b-94fa-47ba-b5f0-f4353c424d4b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTE 0089498160 - SUZANO MATRIZ',
    'EDP BANDEIRANTE 0089498160 - SUZANO MATRIZ',
    '2025-07-02',
    631.0,
    'migracao_yampa',
    '{"yampa_sequencia": "22 de 29", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  631.0,
  631.0,
  'pago',
  '2025-07-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1c1d6bc9-cd7a-4f2a-89f9-9911952cc98f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - PALOMA DOMINIQUE FERNANDES DOS SANTOS',
    'Conciliação - PIX RECEBIDO - PALOMA DOMINIQUE FERNANDES DOS SANTOS',
    '2025-06-10',
    119.99,
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
  '2025-06-10',
  119.99,
  119.99,
  'pago',
  '2025-06-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b81cb979-d644-45b1-b33f-c58d5f622b34',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    '2025-07-01',
    320.0,
    'migracao_yampa',
    '{"yampa_sequencia": "23 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  320.0,
  320.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2178f6b8-85e8-497a-b64c-e5bda48cea63',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11205',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11205',
    '2025-07-02',
    40.0,
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
  '2025-07-02',
  40.0,
  40.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '895d673f-4494-4f0c-820e-844db61d619c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11204',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11204',
    '2025-07-01',
    127.4,
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
  '2025-07-01',
  127.4,
  127.4,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '458b8636-3b67-4338-b925-1f47a4a47a37',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11203',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11203',
    '2025-07-01',
    174.44,
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
  '2025-07-01',
  174.44,
  174.44,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8c50b0b9-8cb9-4644-86ab-eddbe7c23450',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11233',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11233',
    '2025-07-02',
    228.24,
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
  '2025-07-02',
  228.24,
  228.24,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad041c23-1b33-4230-a1cc-1c2e3fd39349',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11225',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11225',
    '2025-07-02',
    127.4,
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
  '2025-07-02',
  127.4,
  127.4,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '46bbebc8-f2ba-4bbd-83c9-0225fe0993e7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11250',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11250',
    '2025-07-02',
    40.0,
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
  '2025-07-02',
  40.0,
  40.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e0e99803-79fb-4a98-bec2-c814cb2a4935',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11255',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11255',
    '2025-07-02',
    72.0,
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
  '2025-07-02',
  72.0,
  72.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9bac7c7b-3955-43a0-ba59-3a41ce357617',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    'a81eb1b4-b40b-4af8-8fe3-2f36aeff862b',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    '2025-07-02',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  350.0,
  350.0,
  'pago',
  '2025-07-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '964418c5-7d9b-4c23-9526-9f8260a661e6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11263',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11263',
    '2025-07-01',
    301.8,
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
  '2025-07-01',
  301.8,
  301.8,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '31c6508a-10a0-46d3-b24c-cf2cd577c3a2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11210',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11210',
    '2025-07-01',
    430.0,
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
  '2025-07-01',
  430.0,
  430.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b76a50ff-c0fa-4b64-a470-127864a2d792',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11275',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11275',
    '2025-07-01',
    282.14,
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
  '2025-07-01',
  282.14,
  282.14,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b571ac1d-2216-49ce-801b-4c9ae7ada216',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11251',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11251',
    '2025-07-02',
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
  '2025-07-02',
  78.0,
  78.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1c3eeddc-96f5-4dc6-843b-d5cf2b05d71c',
    'a23b528f-6cbb-4753-b1e9-6d387c8c5666',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/81',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/81',
    '2025-07-02',
    208.86,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 81", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  208.86,
  208.86,
  'pago',
  '2025-07-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '34a7cd5e-017e-4015-b5fe-163348940910',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11284',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11284',
    '2025-07-02',
    72.0,
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
  '2025-07-02',
  72.0,
  72.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '283ef1b4-a7b4-4b77-a60c-2ff53f8741bc',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11285',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11285',
    '2025-07-02',
    21.46,
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
  '2025-07-02',
  21.46,
  21.46,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f407f8ca-754f-4d2a-bc42-b047b2abdf8c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11286',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11286',
    '2025-07-02',
    228.24,
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
  '2025-07-02',
  228.24,
  228.24,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '91713845-55fb-415b-b3c7-36de1c4a3f54',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: 301.771.888-39 (CPF)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: 301.771.888-39 (CPF)',
    '2025-07-01',
    14.0,
    'migracao_yampa',
    '{"yampa_sequencia": "26 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  14.0,
  14.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9752072b-90ce-4584-8a2b-c2980fc37f32',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    '2025-07-01',
    253.0,
    'migracao_yampa',
    '{"yampa_sequencia": "78 de 157", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  253.0,
  253.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7942b508-0f5d-423f-b7a5-459a4cfd6348',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-07-01',
    322.63,
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
  '2025-07-01',
  322.63,
  322.63,
  'pago',
  '2025-07-01',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'eccbec2f-990c-41d7-a013-4acc807388ac',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-07-01',
    623.97,
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
  '2025-07-01',
  623.97,
  623.97,
  'pago',
  '2025-07-01',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ec58ff14-db2e-47ca-8a7c-baa5d1e27e6b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'HASTEN MARKETING E PRODUÇÕES',
    'HASTEN MARKETING E PRODUÇÕES',
    '2025-07-02',
    252.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "SAÚDE DOS OLHOS"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-02',
  252.0,
  252.0,
  'pago',
  '2025-07-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd72b0804-c1e6-419f-9310-baa221177872',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MANUTENÇÃO DAS PORTAS DE AÇO: Sergio Antônio da Silva > PIX: (11) 9 1684-3402 (celular)',
    'MANUTENÇÃO DAS PORTAS DE AÇO: Sergio Antônio da Silva > PIX: (11) 9 1684-3402 (celular)',
    '2025-07-02',
    800.0,
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
  '2025-07-02',
  800.0,
  800.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4056f235-a9d8-4ccd-882d-690c29131bdc',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MANUTENÇÃO DAS PORTAS DE AÇO: Sergio Antônio da Silva > PIX: (11) 9 1684-3402 (celular)',
    'MANUTENÇÃO DAS PORTAS DE AÇO: Sergio Antônio da Silva > PIX: (11) 9 1684-3402 (celular)',
    '2025-07-02',
    200.0,
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
  '2025-07-02',
  200.0,
  200.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd92fa13d-c236-451c-9be3-6839918b3555',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ELIANE PEDROSO ALVES DA SILVA',
    'Conciliação - PIX RECEBIDO - ELIANE PEDROSO ALVES DA SILVA',
    '2025-07-02',
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
  '2025-07-02',
  100.0,
  100.0,
  'pago',
  '2025-07-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4a0945e1-a7ad-4c2d-8808-0e0d492487af',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-07-02',
    365.0,
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
  '2025-07-02',
  365.0,
  365.0,
  'pago',
  '2025-07-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '763d8a07-b503-4ba5-97b5-9477b5d6bce7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-07-02',
    956.86,
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
  '2025-07-02',
  956.86,
  956.86,
  'pago',
  '2025-07-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a461f802-7f1e-4b4c-bac8-11becf79de78',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FÉRIAS: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'FÉRIAS: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-06-30',
    400.0,
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
  '2025-06-30',
  400.0,
  400.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bec77141-0257-40ef-8b1c-f6935df24277',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '19b7c33c-66e3-48e0-a9ae-c07ae01c6a50',
    'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > PIX: 15.495.166/0001-01 (CNPJ)',
    'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > PIX: 15.495.166/0001-01 (CNPJ)',
    '2025-07-01',
    281.44,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  281.44,
  281.44,
  'pago',
  '2025-07-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cf324232-eff5-42f8-8d52-75a0daedf6d5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '19b7c33c-66e3-48e0-a9ae-c07ae01c6a50',
    'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > IMPLANTAÇÃO DE SISTEMA > PIX: 15.495.166/0001-01 (CNPJ)',
    'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > IMPLANTAÇÃO DE SISTEMA > PIX: 15.495.166/0001-01 (CNPJ)',
    '2025-07-01',
    440.0,
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
  '2025-07-01',
  440.0,
  440.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b2552f1c-548c-4500-9a4a-105ebb579f44',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - DIEGO SILVA VIANA',
    'Conciliação - PIX RECEBIDO - DIEGO SILVA VIANA',
    '2025-06-05',
    127.14,
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
  '2025-06-05',
  127.14,
  127.14,
  'pago',
  '2025-06-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c5d2dd72-577b-4bd8-ab22-faa3d1ed9eae',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - TERESINHA MENDES LIRA',
    'Conciliação - PIX RECEBIDO - TERESINHA MENDES LIRA',
    '2025-06-11',
    106.0,
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
  '2025-06-11',
  106.0,
  106.0,
  'pago',
  '2025-06-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ec8dae18-229f-4835-8eea-0e11a1b78d64',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11162',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11162',
    '2025-07-01',
    72.0,
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
  '2025-07-01',
  72.0,
  72.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4b1c3e0b-ef50-476d-a0f9-0219d21c26bb',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'a81eb1b4-b40b-4af8-8fe3-2f36aeff862b',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    '2025-07-01',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  350.0,
  350.0,
  'pago',
  '2025-07-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '015d8e20-912f-430a-bc67-f33f30c4069e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11262',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11262',
    '2025-07-01',
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
  '2025-07-01',
  78.0,
  78.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '375d7fa4-da22-4ce7-b0a9-72040a35ba10',
    'a23b528f-6cbb-4753-b1e9-6d387c8c5666',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 5/81',
    '3° ACORDO: OPTOTAL HOYA LTDA - Parcela 5/81',
    '2025-07-01',
    208.86,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 81", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-07-01',
  208.86,
  208.86,
  'pago',
  '2025-07-01',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f64862cf-437c-4ce8-b94f-8e9c9e67361d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'ACORDO - RESCISÃO: Larissa Dias Fernandes Cardozo - Parcela 4/10 > PIX: larissadiss766@gmail.com (e-mail)',
    'ACORDO - RESCISÃO: Larissa Dias Fernandes Cardozo - Parcela 4/10 > PIX: larissadiss766@gmail.com (e-mail)',
    '2025-06-30',
    522.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 10", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  522.0,
  522.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3fb25b6c-5568-449c-a463-b043f0169847',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Jocicreide Macedo Barbosa Santos - Acordo 4/11 > PIX: (11) 9 8018-0836 (celular)',
    'RESCISÃO: Jocicreide Macedo Barbosa Santos - Acordo 4/11 > PIX: (11) 9 8018-0836 (celular)',
    '2025-06-30',
    979.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  979.0,
  979.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '61d5e2fe-bba3-4283-abcf-2094defaefca',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'ACORDO - RESCISÃO: Ana Paula Aparecida Moreira da Silva Yuki - Parcela 4/4 > PIX: 375.938.028-09 (CPF)',
    'ACORDO - RESCISÃO: Ana Paula Aparecida Moreira da Silva Yuki - Parcela 4/4 > PIX: 375.938.028-09 (CPF)',
    '2025-06-30',
    209.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  209.0,
  209.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '298dfe2d-0ac0-4f21-b342-53d3b812e3e6',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Rogério Aparecido de Morais - Acordo 5/12 > PIX: ro.gerio.morais@hotmail.com (e-mail)',
    'RESCISÃO: Rogério Aparecido de Morais - Acordo 5/12 > PIX: ro.gerio.morais@hotmail.com (e-mail)',
    '2025-06-30',
    825.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 12", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  825.0,
  825.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '43d436ac-2687-41f6-934c-7e50e451676d',
    '03474a07-f330-48bc-8329-5ca698083a62',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'ACORDO - RESCISÃO: Vanessa Mendes da Silva - Parcela 3/4 > PIX: vanessamendys151619@gmail.com (e-mail)',
    'ACORDO - RESCISÃO: Vanessa Mendes da Silva - Parcela 3/4 > PIX: vanessamendys151619@gmail.com (e-mail)',
    '2025-06-30',
    426.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  426.0,
  426.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3eedb122-e6a8-43c6-9ed6-ed33664cb946',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Kathleen dos Santos Campos - Acordo 4/7 > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    'RESCISÃO: Kathleen dos Santos Campos - Acordo 4/7 > PIX: kathleendossantoscamposkety@gmail.com (e-mail)',
    '2025-06-30',
    310.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 7", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  310.0,
  310.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f22eea01-9d74-4858-b21f-8e43ab14eac9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Nicolas Coutinho da Silva - Acordo 4/10 > PIX: analiviaxavier072@gmail.com (e-mail)',
    'RESCISÃO: Nicolas Coutinho da Silva - Acordo 4/10 > PIX: analiviaxavier072@gmail.com (e-mail)',
    '2025-06-30',
    639.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 10", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  639.0,
  639.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0d1bf153-8382-4efb-bd43-b7b29f9f4971',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - DIEGO SILVA VIANA',
    'Conciliação - PIX RECEBIDO - DIEGO SILVA VIANA',
    '2025-06-28',
    127.14,
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
  '2025-06-28',
  127.14,
  127.14,
  'pago',
  '2025-06-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bb49924b-a4aa-4313-a519-23a1f539f59f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    '2025-06-30',
    120.0,
    'migracao_yampa',
    '{"yampa_sequencia": "25 de 52", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  120.0,
  120.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a23e92bc-eca2-401e-bded-c160c0f45628',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-06-30',
    188.6,
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
  '2025-06-30',
  188.6,
  188.6,
  'pago',
  '2025-06-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad71c984-a943-4db0-b63b-69b9bd857a22',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    '2025-06-30',
    147.45,
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
  '2025-06-30',
  147.45,
  147.45,
  'pago',
  '2025-06-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd4026947-25c1-450d-8d4b-657b848f2c28',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GRAZIELE DOS SANTOS SOUZA',
    'Conciliação - PIX RECEBIDO - GRAZIELE DOS SANTOS SOUZA',
    '2025-06-30',
    290.0,
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
  '2025-06-30',
  290.0,
  290.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '85c23b00-b451-4e1b-8332-a548a28eb27f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-07-01',
    448.9,
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
  '2025-07-01',
  448.9,
  448.9,
  'pago',
  '2025-07-01',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c8eb26c0-8e7c-4481-8003-89b626cf5f74',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-07-01',
    763.12,
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
  '2025-07-01',
  763.12,
  763.12,
  'pago',
  '2025-07-01',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7deeca22-8274-4e77-913b-1dd3456444d4',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - DEBORA LIMA MAGALHAES',
    'Conciliação - PIX RECEBIDO - DEBORA LIMA MAGALHAES',
    '2025-07-01',
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
  '2025-07-01',
  50.0,
  50.0,
  'pago',
  '2025-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0adda7f9-3407-4f98-a80e-57b27557f063',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'AGUINALDO ANJOS - LOST INFORMÁTICA > PIX: 11) 9 7468-1969 (celular)',
    'AGUINALDO ANJOS - LOST INFORMÁTICA > PIX: 11) 9 7468-1969 (celular)',
    '2025-06-30',
    511.6,
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
  '2025-06-30',
  511.6,
  511.6,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '002ceb47-7fcb-4c37-a48e-277836c54607',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ALUGUEL ESCRITÓRIO - SUZANO > PIX: 02.131.820/0001-48 (CNPJ) > SANTANDER - Junior (diferença da multa)',
    'ALUGUEL ESCRITÓRIO - SUZANO > PIX: 02.131.820/0001-48 (CNPJ) > SANTANDER - Junior (diferença da multa)',
    '2025-06-30',
    34.36,
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
  '2025-06-30',
  34.36,
  34.36,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '17d53bd5-bba9-4179-a372-525690f4021e',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 108/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 108/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-06-30',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "108 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  100.0,
  100.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9a098b0e-1a11-4c41-a81f-50229cf2e643',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL ESCRITÓRIO - SUZANO (IPTU)',
    'ALUGUEL ESCRITÓRIO - SUZANO (IPTU)',
    '2025-06-30',
    637.84,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  637.84,
  637.84,
  'pago',
  '2025-06-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f9278202-50ca-4f36-8a68-66e97dbad859',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '445a81a4-179f-4046-80d6-4dd451cb6145',
    'RESCISÃO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    'RESCISÃO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    '2025-06-27',
    150.0,
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
  '2025-06-27',
  150.0,
  150.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7f57517b-9b4d-4818-8485-1b3200c0959b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11139',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11139',
    '2025-06-27',
    139.0,
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
  '2025-06-27',
  139.0,
  139.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b7998e53-2937-41ad-9ba3-e4094ae53618',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11234',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11234',
    '2025-06-30',
    63.0,
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
  '2025-06-30',
  63.0,
  63.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e9c98cd5-30ca-459a-ac26-5c2b35b61717',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11238',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11238',
    '2025-06-30',
    41.0,
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
  '2025-06-30',
  41.0,
  41.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '54360c04-636f-41d1-bf0b-fe47dd325c11',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11237',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11237',
    '2025-06-30',
    228.24,
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
  '2025-06-30',
  228.24,
  228.24,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e4b6030d-1aac-4c3a-abe0-e0c7ec41c713',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11236',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11236',
    '2025-06-30',
    40.0,
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
  '2025-06-30',
  40.0,
  40.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cf6ca02c-ee84-43a5-b01b-1a000aca69c0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11246',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11246',
    '2025-06-30',
    110.0,
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
  '2025-06-30',
  110.0,
  110.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da7c09fc-fe44-4f65-a0cd-6f334b8f8511',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11253',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11253',
    '2025-06-30',
    44.1,
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
  '2025-06-30',
  44.1,
  44.1,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad708ff9-2ff0-46b0-a552-8ebc5063da5b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11271',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11271',
    '2025-06-30',
    40.0,
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
  '2025-06-30',
  40.0,
  40.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9313ca38-bae4-4ea7-bbad-b55e5f3820d8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11235',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11235',
    '2025-06-30',
    430.0,
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
  '2025-06-30',
  430.0,
  430.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a05d7e29-5814-440a-83c7-84eae222ceed',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11242',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11242',
    '2025-06-30',
    280.0,
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
  '2025-06-30',
  280.0,
  280.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0dd008fa-5a9b-41f7-89e6-4f97bf9fbbc9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11261',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11261',
    '2025-06-30',
    172.38,
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
  '2025-06-30',
  172.38,
  172.38,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '51de51da-9d52-44ac-aaf5-33f313ef024c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11268',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11268',
    '2025-06-30',
    40.0,
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
  '2025-06-30',
  40.0,
  40.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '546d3c65-a3fa-4375-a56a-9ec335692c88',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - LEONARDO ALMADA NOGUEIRA',
    'Conciliação - PIX RECEBIDO - LEONARDO ALMADA NOGUEIRA',
    '2025-06-26',
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
  '2025-06-26',
  50.0,
  50.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0919b906-46db-48d3-a04b-aca92eaccc6e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 20/24',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 20/24',
    '2025-06-30',
    196.96,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  196.96,
  196.96,
  'pago',
  '2025-06-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c974805a-02c7-4a33-80eb-6e579dea0dc7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-06-27',
    843.25,
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
  '2025-06-27',
  843.25,
  843.25,
  'pago',
  '2025-06-27',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5b462b2c-a4e3-4a95-938c-d5f222f43305',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-06-27',
    888.82,
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
  '2025-06-27',
  888.82,
  888.82,
  'pago',
  '2025-06-27',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '02a75565-87f2-40fc-92a0-a3504afcc780',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-06-27',
    286.2,
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
  '2025-06-27',
  286.2,
  286.2,
  'pago',
  '2025-06-27',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '56243ce3-3126-4986-97bf-5c6f0d523a70',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GEOVANI TAVEIRA DE BARROS',
    'Conciliação - PIX RECEBIDO - GEOVANI TAVEIRA DE BARROS',
    '2025-06-27',
    450.0,
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
  '2025-06-27',
  450.0,
  450.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b8b9653b-1751-4aab-ac0d-66556dbff81e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - AMANDA DELFINO MARTINS',
    'Conciliação - PIX RECEBIDO - AMANDA DELFINO MARTINS',
    '2025-06-27',
    93.8,
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
  '2025-06-27',
  93.8,
  93.8,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '99abab6e-3da8-4f88-ab2e-691a63653966',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GILMAR LOPES MARINHO',
    'Conciliação - PIX RECEBIDO - GILMAR LOPES MARINHO',
    '2025-06-27',
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
  '2025-06-27',
  50.0,
  50.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c9afdfe3-f4ce-40fc-b55d-1553fa6d4657',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ROZILEIDE BRITO RIBEIRO DO NASCIMENTO',
    'Conciliação - PIX RECEBIDO - ROZILEIDE BRITO RIBEIRO DO NASCIMENTO',
    '2025-06-27',
    142.0,
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
  '2025-06-27',
  142.0,
  142.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0e7307bc-e53a-4b5d-bed6-ab9f4585bf23',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MARIA APARECIDA DA SILVA',
    'Conciliação - PIX RECEBIDO - MARIA APARECIDA DA SILVA',
    '2025-06-27',
    400.0,
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
  '2025-06-27',
  400.0,
  400.0,
  'pago',
  '2025-06-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b12f2f57-273a-443b-81bc-7dce7e3bbed7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 18/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 18/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-06-30',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-30',
  350.0,
  350.0,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '126ea606-78cb-4b31-84a8-b74122b8535b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-06-28',
    193.9,
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
  '2025-06-28',
  193.9,
  193.9,
  'pago',
  '2025-06-28',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a54b2170-1c22-477e-a1d2-3348070fb1a4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-06-28',
    19.8,
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
  '2025-06-28',
  19.8,
  19.8,
  'pago',
  '2025-06-28',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '67db0982-606a-4ba7-9313-d310825dfa5f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    '2025-06-28',
    49.65,
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
  '2025-06-28',
  49.65,
  49.65,
  'pago',
  '2025-06-28',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e694e832-5c24-46c9-a29b-4a5e0a311bbb',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ANA PRISCILA DE OLIVEIRA',
    'Conciliação - PIX RECEBIDO - ANA PRISCILA DE OLIVEIRA',
    '2025-06-28',
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
  '2025-06-28',
  390.0,
  390.0,
  'pago',
  '2025-06-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4fc23ce5-2efc-438e-b9cf-58459217281f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'NC Extinchamas (troca dos extintores)',
    'NC Extinchamas (troca dos extintores)',
    '2025-06-30',
    135.36,
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
  '2025-06-30',
  135.36,
  135.36,
  'pago',
  '2025-06-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9205b647-9c2e-4ada-8871-1fab269fd06c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-06-30',
    113.14,
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
  '2025-06-30',
  113.14,
  113.14,
  'pago',
  '2025-06-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6dfd61da-5bc8-4a9f-9eed-2c97cafda654',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GABRIEL H TAVARES ADAIR',
    'Conciliação - PIX RECEBIDO - GABRIEL H TAVARES ADAIR',
    '2025-06-30',
    95.8,
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
  '2025-06-30',
  95.8,
  95.8,
  'pago',
  '2025-06-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4561fe0a-fcab-41be-ba9b-f23fd50d984f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11232',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11232',
    '2025-06-26',
    40.0,
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
  '2025-06-26',
  40.0,
  40.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da4fe1e0-8367-4f54-88ea-cc1b2410b853',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11231 (créditos utilizados) > R$ 172,38',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11231 (créditos utilizados) > R$ 172,38',
    '2025-06-26',
    118.28,
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
  '2025-06-26',
  118.28,
  118.28,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '218902ec-f7ce-4a67-856c-bf850d40c9b3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11231 (créditos utilizados) > R$ 172,38',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11231 (créditos utilizados) > R$ 172,38',
    '2025-06-26',
    54.1,
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
  '2025-06-26',
  54.1,
  54.1,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '47dee9e7-8c73-4d68-8e0f-477db7cd1ecd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11245',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11245',
    '2025-06-26',
    59.0,
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
  '2025-06-26',
  59.0,
  59.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b2bd248b-6feb-48af-b2f0-39708da7f942',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 011197',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 011197',
    '2025-06-26',
    28.0,
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
  '2025-06-26',
  28.0,
  28.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8e7c573d-08b6-4cd8-b825-d6d561a35aa8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11278',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11278',
    '2025-06-26',
    28.0,
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
  '2025-06-26',
  28.0,
  28.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7cde0417-5b4c-480e-9ec7-268678d1038e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11259',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11259',
    '2025-06-26',
    28.0,
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
  '2025-06-26',
  28.0,
  28.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '884fe0c8-d2a6-497d-8a3a-ffc24ed2e28b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11270',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11270',
    '2025-06-26',
    28.0,
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
  '2025-06-26',
  28.0,
  28.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '84722c36-5102-4e9f-9008-d508b77a076c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11267',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 11267',
    '2025-06-26',
    59.0,
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
  '2025-06-26',
  59.0,
  59.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '64d3e341-848d-4e0d-8776-b0b86f3369f6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-06-26',
    86.05,
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
  '2025-06-26',
  86.05,
  86.05,
  'pago',
  '2025-06-26',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '10919d9b-5842-4041-bde3-aaa8f43385e5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11264',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11264',
    '2025-06-26',
    58.0,
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
  '2025-06-26',
  58.0,
  58.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2ec069fb-0f22-45c2-9128-c3fa1ed19916',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-06-26',
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
  '2025-06-26',
  10.0,
  10.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0fa3acc6-cbd0-4c1b-9cc2-680c898aa35a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11266',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11266',
    '2025-06-26',
    16.0,
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
  '2025-06-26',
  16.0,
  16.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad05d518-45d4-4354-aa90-a5e5e66540ee',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11269',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 11269',
    '2025-06-26',
    16.0,
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
  '2025-06-26',
  16.0,
  16.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '79d6a421-2a6c-465c-b251-da283ea8a46e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-06-26',
    229.52,
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
  '2025-06-26',
  229.52,
  229.52,
  'pago',
  '2025-06-26',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f94d0d51-b190-4207-83fd-7e0e32f4fb87',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 107/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 107/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-06-26',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "107 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-26',
  100.0,
  100.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e038353e-c153-4ba0-94d7-e6b2f8b77baa',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ACORDO > ALUGUEL MAUÁ - Clínica (ref. 03/2025 e 04/2025) > parcela 14/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    'ACORDO > ALUGUEL MAUÁ - Clínica (ref. 03/2025 e 04/2025) > parcela 14/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    '2025-06-26',
    346.42,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 18", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-26',
  346.42,
  346.42,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ff0874bf-7c98-41ac-b67e-2a685e41a019',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '0aade745-1ec4-4999-9413-6b4307c59512',
    'ACORDO > ALUGUEL MAUÁ - Loja (ref. 04/2025) > parcela 14/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    'ACORDO > ALUGUEL MAUÁ - Loja (ref. 04/2025) > parcela 14/18 > PIX: 096.395.938-77 (CPF - Juarez)',
    '2025-06-26',
    173.21,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 18", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-06-26',
  173.21,
  173.21,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '559331e0-6ff5-4d1e-8fd2-25df05eb277a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11206',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11206',
    '2025-06-26',
    172.38,
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
  '2025-06-26',
  172.38,
  172.38,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a1d92f7e-d15d-45e0-a874-76e296b590ca',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11208',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11208',
    '2025-06-26',
    282.14,
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
  '2025-06-26',
  282.14,
  282.14,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '11931691-cc26-45f6-b6e5-a0ce527cf211',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11219',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11219',
    '2025-06-26',
    282.14,
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
  '2025-06-26',
  282.14,
  282.14,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '19645508-9fd4-4ed8-86f1-8931cd0f37fe',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10975 (diferença - Aplicação de Blue Protection)',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10975 (diferença - Aplicação de Blue Protection)',
    '2025-06-26',
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
  '2025-06-26',
  100.0,
  100.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8252f331-bb25-4bf0-8d8d-7e87f1b55674',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11008 (diferença - Aplicação de AR)',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 11008 (diferença - Aplicação de AR)',
    '2025-06-26',
    55.0,
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
  '2025-06-26',
  55.0,
  55.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd1005d89-b5ba-4c72-b899-d8087b4ad41c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11185',
    'SYGMA LABORATORIO OPTICO LTDA > PIX: 30.576.013/0001-74 (CNPJ) - ref. OS 11185',
    '2025-06-26',
    70.0,
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
  '2025-06-26',
  70.0,
  70.0,
  'pago',
  '2025-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c65c557c-8af7-41a2-9d34-20ead295e105',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ESDRAS AURELIANO DA SILVA',
    'Conciliação - PIX RECEBIDO - ESDRAS AURELIANO DA SILVA',
    '2025-06-25',
    690.0,
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
  '2025-06-25',
  690.0,
  690.0,
  'pago',
  '2025-06-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '89aeaf3e-6f8d-4b77-85aa-044e60e10ea8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-06-25',
    351.54,
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
  '2025-06-25',
  351.54,
  351.54,
  'pago',
  '2025-06-25',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '616ca026-18c7-4bf3-bf99-70268740afa4',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ANA LUCIA DA PAZ OLIVEIRA COELHO',
    'Conciliação - PIX RECEBIDO - ANA LUCIA DA PAZ OLIVEIRA COELHO',
    '2025-06-25',
    290.0,
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
  '2025-06-25',
  290.0,
  290.0,
  'pago',
  '2025-06-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd43ce369-eda0-448f-95a7-7663db353319',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - 44 887 259 ANA LUCIA DA PAZ OLIVEIRA COELHO',
    'Conciliação - PIX RECEBIDO - 44 887 259 ANA LUCIA DA PAZ OLIVEIRA COELHO',
    '2025-06-25',
    495.0,
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
  '2025-06-25',
  495.0,
  495.0,
  'pago',
  '2025-06-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e61c6351-9347-4342-83e5-b13d05ac8bb5',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'e140db2e-9e5a-433a-90d5-3ffcabb3a006',
    'CSLL: Simples Nacional 05/2021 - Parcela 5/60',
    'CSLL: Simples Nacional 05/2021 - Parcela 5/60',
    '2024-07-29',
    12.78,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 44", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  12.78,
  12.78,
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
    '76289cd2-c082-4f97-905c-99c37cdf38e4',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'e140db2e-9e5a-433a-90d5-3ffcabb3a006',
    'COFINS: Simples Nacional 05/2021 - Parcela 5/60',
    'COFINS: Simples Nacional 05/2021 - Parcela 5/60',
    '2024-07-29',
    46.54,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  46.54,
  46.54,
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
    '68b4a8cb-4858-42c0-97cd-0a96c02a2fb3',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'e140db2e-9e5a-433a-90d5-3ffcabb3a006',
    'IRPJ: Simples Nacional 05/2021 - Parcela 5/60',
    'IRPJ: Simples Nacional 05/2021 - Parcela 5/60',
    '2024-07-29',
    20.09,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  20.09,
  20.09,
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
    '53c6fc74-2460-4272-9cd1-68d86eada675',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'e140db2e-9e5a-433a-90d5-3ffcabb3a006',
    'PIS: Simples Nacional 05/2021 - Parcela 5/60',
    'PIS: Simples Nacional 05/2021 - Parcela 5/60',
    '2024-07-29',
    10.1,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 44", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  10.1,
  10.1,
  'pago',
  '2024-07-29',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

