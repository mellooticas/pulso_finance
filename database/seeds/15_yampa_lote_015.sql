-- =============================================
-- MIGRAÇÃO YAMPA - LOTE 15/143
-- =============================================
--
-- Registros: 150 
-- Range: 2101 - 2250
-- UUIDs: REAIS do banco
--
-- =============================================

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '87280cee-558c-4ff4-9aea-6453e79d889b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-24',
    2.64,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-24',
  2.64,
  2.64,
  'pago',
  '2025-04-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fdf6eb07-6e0e-41b7-9dfc-69131fb0fa08',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-25',
    2.84,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-25',
  2.84,
  2.84,
  'pago',
  '2025-04-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2c5e51b4-aa8a-4128-be1f-6b6c8b2be54b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-04-28',
    2.89,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-28',
  2.89,
  2.89,
  'pago',
  '2025-04-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '68d1679a-b644-4e36-a4aa-0d1a0b341693',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10748 (diferença da montagem )',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10748 (diferença da montagem )',
    '2025-04-29',
    9.9,
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
  '2025-04-29',
  9.9,
  9.9,
  'pago',
  '2025-04-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f3cc1b8b-453d-4c50-85c7-ba7074fbb29a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FREELANCER: Mike Rodrigues Gomes  (ref. 31/03/2025) > PIX: 413.050.558-02 (CPF)',
    'FREELANCER: Mike Rodrigues Gomes  (ref. 31/03/2025) > PIX: 413.050.558-02 (CPF)',
    '2025-05-01',
    60.0,
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
  '2025-05-01',
  60.0,
  60.0,
  'pago',
  '2025-05-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1733f83e-1894-4f38-b23c-2e28bb7016bf',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-05-02',
    2.84,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-02',
  2.84,
  2.84,
  'pago',
  '2025-05-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8288e4dd-84c7-451e-a564-8bbac2f351cf',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ROBERTO MARCOS BARBOSA DE BARROS',
    'Conciliação - PIX RECEBIDO - ROBERTO MARCOS BARBOSA DE BARROS',
    '2025-05-03',
    899.5,
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
  '2025-05-03',
  899.5,
  899.5,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4a42b80d-820e-4c16-8386-f716b8cd3441',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    '2025-05-07',
    132.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 52", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-07',
  132.0,
  132.0,
  'pago',
  '2025-05-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e6a74ab2-88c9-42f5-9f2a-1ef80103cfd8',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-05-05',
    1.97,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-05',
  1.97,
  1.97,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6dc3a8b4-68c3-4cbd-9a9c-fc587e049ff7',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MARÍA SANDRA DA SILVA DIAS',
    'Conciliação - PIX RECEBIDO - MARÍA SANDRA DA SILVA DIAS',
    '2025-05-05',
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
  '2025-05-05',
  150.0,
  150.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0a534c18-3265-4e4d-95e2-888f078ff5c2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    '2025-05-07',
    227.0,
    'migracao_yampa',
    '{"yampa_sequencia": "70 de 157", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-07',
  227.0,
  227.0,
  'pago',
  '2025-05-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '28a5bbce-2751-493f-8ac2-09447cd12e02',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ANGELA DA SILVA OLIVEIRA',
    'Conciliação - PIX RECEBIDO - ANGELA DA SILVA OLIVEIRA',
    '2025-05-06',
    242.0,
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
  '2025-05-06',
  242.0,
  242.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '33ac15a6-08c2-4a77-a7d2-226e66706880',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - TERESINHA MENDES LIRA',
    'Conciliação - PIX RECEBIDO - TERESINHA MENDES LIRA',
    '2025-05-06',
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
  '2025-05-06',
  106.0,
  106.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cd120dae-5820-44f4-ad6a-0d582e6cd644',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - KETTELYN ARAUJO DE OLIVEIRA DA',
    'Conciliação - PIX RECEBIDO - KETTELYN ARAUJO DE OLIVEIRA DA',
    '2025-05-06',
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
  '2025-05-06',
  124.0,
  124.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6110b7ad-8c47-482c-9903-1c65514001ed',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'EDP BANDEIRANTE 0089498160 - SUZANO MATRIZ',
    'EDP BANDEIRANTE 0089498160 - SUZANO MATRIZ',
    '2025-05-07',
    636.3,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 29", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-07',
  636.3,
  636.3,
  'pago',
  '2025-05-07',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0a162d67-3e65-48bb-92bd-bdbb63263f26',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',
    'COMPRA DE ARMAÇÕES',
    'COMPRA DE ARMAÇÕES',
    '2025-05-06',
    691.0,
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
  '2025-05-06',
  691.0,
  691.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da8269bc-a47e-4acc-9896-754a563533d3',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - RODRIGO SILVA DE ARAÚJO',
    'Conciliação - PIX RECEBIDO - RODRIGO SILVA DE ARAÚJO',
    '2025-05-06',
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
  '2025-05-06',
  50.0,
  50.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5aa0f88a-ced1-4281-afc9-08b8e8874588',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'SUPERMERCADO SANTA FÉ: Margarina e pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    'SUPERMERCADO SANTA FÉ: Margarina e pão francês > Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
    '2025-05-07',
    9.79,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 16", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-07',
  9.79,
  9.79,
  'pago',
  '2025-05-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3445c8aa-1615-43e0-8788-07cb51c4410f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-05-07',
    96.84,
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
  '2025-05-07',
  96.84,
  96.84,
  'pago',
  '2025-05-07',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aafa9b33-eae0-4587-9fb4-1014c4e445cf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-05-07',
    39.56,
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
  '2025-05-07',
  39.56,
  39.56,
  'pago',
  '2025-05-07',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7c8bcd33-b337-48b2-a82f-be5efac18096',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 07/05/2025) > PIX: (11) 9 5805-6343 (celular)',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 07/05/2025) > PIX: (11) 9 5805-6343 (celular)',
    '2025-05-07',
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
  '2025-05-07',
  50.0,
  50.0,
  'pago',
  '2025-05-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd39b9f39-048f-4d8b-8767-d7089c0e4e5f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-05-05',
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
  '2025-05-05',
  200.0,
  200.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b6b74514-bada-4155-98f6-291e588c5409',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - REGINA CUSTODIA DA SILVA',
    'Conciliação - PIX RECEBIDO - REGINA CUSTODIA DA SILVA',
    '2025-04-08',
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
  '2025-04-08',
  580.0,
  580.0,
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
    'd3a64879-bcb1-4122-82a6-066b03c321c5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha (férias vendida) > PIX: 537.903.908-10 (CPF)',
    'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha (férias vendida) > PIX: 537.903.908-10 (CPF)',
    '2025-04-22',
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
  '2025-04-22',
  934.0,
  934.0,
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
    '54c9cb3b-7a5b-43c3-b501-f91a6d857bb1',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Camila Faccin Vieira (ref. 07/04 - 18/04/2025) > PIX: (11) 9 5485-1322 (celular)',
    'VALE ADIANTAMENTO: Camila Faccin Vieira (ref. 07/04 - 18/04/2025) > PIX: (11) 9 5485-1322 (celular)',
    '2025-04-22',
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
  '2025-04-22',
  800.0,
  800.0,
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
    'ba99c9e0-0a14-4ee9-b3dd-d820d8ebcc2a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SALÁRIO - HORA EXTRA: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) - ref. 03/2025',
    'SALÁRIO - HORA EXTRA: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) - ref. 03/2025',
    '2025-05-05',
    319.88,
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
  '2025-05-05',
  319.88,
  319.88,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '17ff1746-6e58-48e3-8658-30562a2c286b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10897, 10898, 10912 e 10915',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10897, 10898, 10912 e 10915',
    '2025-05-05',
    479.0,
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
  '2025-05-05',
  479.0,
  479.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '004b5187-916c-4725-9d49-9a82327d0399',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10882, 10883, 10885, 10891 e 10922',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS''s 10882, 10883, 10885, 10891 e 10922',
    '2025-05-05',
    670.0,
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
  '2025-05-05',
  670.0,
  670.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8cb1c5fc-82e3-41cd-83a1-7f5ac9d6b7af',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10904, 10907, 10914, 10921, 10924, 10925, 10936, 10940, 10942 e 10947',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10904, 10907, 10914, 10921, 10924, 10925, 10936, 10940, 10942 e 10947',
    '2025-05-05',
    302.0,
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
  '2025-05-05',
  302.0,
  302.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '330e79c8-bad1-479c-9d86-6fde0d50f85d',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-05-05',
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
  '2025-05-05',
  10.0,
  10.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0d46d579-ad09-4414-bdf9-83cafb39c740',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Ariani Dias Fernandes Líbano (ref. 05/05/2025) > PIX: 487.287.868-07 (CPF)',
    'ADIANTAMENTO SALARIAL: Ariani Dias Fernandes Líbano (ref. 05/05/2025) > PIX: 487.287.868-07 (CPF)',
    '2025-05-05',
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
  '2025-05-05',
  200.0,
  200.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bcf8f83e-a201-4248-b7e2-8342d5fc608b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo (ref. 19/04 > ida/volta e 24/04/2025 > ida no laboratório) > PIX: 426.663.838-81 (CPF)',
    'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo (ref. 19/04 > ida/volta e 24/04/2025 > ida no laboratório) > PIX: 426.663.838-81 (CPF)',
    '2025-05-05',
    15.6,
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
  '2025-05-05',
  15.6,
  15.6,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e9f88f10-12a8-431d-a50a-0b71d94125a4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4833',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 4833',
    '2025-05-05',
    131.0,
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
  '2025-05-05',
  131.0,
  131.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f49e51e5-486b-4a79-ba03-6b81e450e923',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-05-05',
    28.68,
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
  '2025-05-05',
  28.68,
  28.68,
  'pago',
  '2025-05-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f3c2a346-44d4-4e6e-b86a-02763fc7b136',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - JLELETRICA',
    'Conciliação - PIX RECEBIDO - JLELETRICA',
    '2025-05-05',
    156.25,
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
  '2025-05-05',
  156.25,
  156.25,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e87f669a-70d1-4b8a-9b52-8fbe79857cb9',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - LARISSA DOS SANTOS GONCALVES',
    'Conciliação - PIX RECEBIDO - LARISSA DOS SANTOS GONCALVES',
    '2025-05-05',
    130.0,
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
  '2025-05-05',
  130.0,
  130.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3919a65b-0080-47e5-8c67-ef30b2cd4d56',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CRISTINA SOARES DA SILVA',
    'Conciliação - PIX RECEBIDO - CRISTINA SOARES DA SILVA',
    '2025-05-05',
    45.99,
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
  '2025-05-05',
  45.99,
  45.99,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '84710544-41e3-449e-a63b-ba372507146e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-05-05',
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
  '2025-05-05',
  48.42,
  48.42,
  'pago',
  '2025-05-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '03e76cf1-2f07-4224-91e1-43b7a0eccc8e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-05-05',
    38.73,
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
  '2025-05-05',
  38.73,
  38.73,
  'pago',
  '2025-05-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a6f78c19-0dff-4ab8-8421-14d4ec4a8b4e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-05-05',
    641.91,
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
  '2025-05-05',
  641.91,
  641.91,
  'pago',
  '2025-05-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '48fa2c9d-3d4d-4ba4-9a0b-e8e4e6db2bdc',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    '2025-05-05',
    94.32,
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
  '2025-05-05',
  94.32,
  94.32,
  'pago',
  '2025-05-05',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fdc34f09-4caa-407a-b70a-10f30a33d246',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO: INSTITUTO VISÃO - OTICA STUDIO MAUA LTDA > Parcela 1/4 > PIX: sac@studio7otica.com (e-mail)',
    'ACORDO: INSTITUTO VISÃO - OTICA STUDIO MAUA LTDA > Parcela 1/4 > PIX: sac@studio7otica.com (e-mail)',
    '2025-05-06',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-06',
  200.0,
  200.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '266abbd6-39a6-44e4-b3b2-dd11ade3a21e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SANDRA MARIA MALTA',
    'Conciliação - PIX RECEBIDO - SANDRA MARIA MALTA',
    '2025-05-06',
    124.12,
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
  '2025-05-06',
  124.12,
  124.12,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6d79352a-1240-4369-aeb8-7d57beea842c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DESCONTO COMPRA EM LOJA: Felipe Roger Miranda > parcela 2/4 (ref. OS 1091 - Cecília (esposa) > R$ 500,00)',
    'DESCONTO COMPRA EM LOJA: Felipe Roger Miranda > parcela 2/4 (ref. OS 1091 - Cecília (esposa) > R$ 500,00)',
    '2025-05-06',
    125.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-06',
  125.0,
  125.0,
  'pago',
  '2025-05-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5fd005e6-6ac2-49a7-b071-23e2d274a89f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 10/24',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 10/24',
    '2025-05-02',
    196.96,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-02',
  196.96,
  196.96,
  'pago',
  '2025-05-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '944f4117-19cb-474f-b790-5fb4591bab87',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 26/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 26/32',
    '2025-05-02',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "26 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-02',
  269.43,
  269.43,
  'pago',
  '2025-05-02',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ca293061-df0c-4bf9-8de0-f434c8084052',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único - ida/volta para laboratório e Mauá))',
    'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único - ida/volta para laboratório e Mauá))',
    '2025-04-30',
    19.75,
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
  '2025-04-30',
  19.75,
  19.75,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5c940a79-cd2f-40b6-8a07-a97377328b63',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - RITA DE CASSIA CARDOSO LANDIM',
    'Conciliação - PIX RECEBIDO - RITA DE CASSIA CARDOSO LANDIM',
    '2025-04-30',
    72.38,
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
  '2025-04-30',
  72.38,
  72.38,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ce48a5d0-b9cf-43d0-bfb1-fffa9e3f967a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 30/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 30/04/2025) > PIX: (11) 9 5805-6343 (celular)',
    '2025-04-30',
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
  '2025-04-30',
  100.0,
  100.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'feb3ace3-1055-43e2-9dc8-e949d6a88d2d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 4851',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 4851',
    '2025-04-30',
    48.0,
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
  '2025-04-30',
  48.0,
  48.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fab4965e-ad65-4648-b19f-fef49b06f9a7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10880, 10894 e 10902',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10880, 10894 e 10902',
    '2025-04-30',
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
  '2025-04-30',
  48.0,
  48.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '81be071e-e2ec-4372-aeca-f615c5565447',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10892',
    'BRASCOR > PIX: 19.344.768/0001-00 (CNPJ) - ref. OS 10892',
    '2025-05-02',
    65.0,
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
  '2025-05-02',
  65.0,
  65.0,
  'pago',
  '2025-05-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7cf5ab5f-36c0-4a6c-aa41-9be00b964434',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10928 (10767 - Maria Lucilene)',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10928 (10767 - Maria Lucilene)',
    '2025-05-02',
    289.0,
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
  '2025-05-02',
  289.0,
  289.0,
  'pago',
  '2025-05-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '39f7e085-f649-4df7-b622-461be18a5897',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-05-02',
    455.85,
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
  '2025-05-02',
  455.85,
  455.85,
  'pago',
  '2025-05-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '73038d08-3e4a-4bcd-8fa3-f6f0a82929ac',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-05-02',
    247.27,
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
  '2025-05-02',
  247.27,
  247.27,
  'pago',
  '2025-05-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '059d1193-c1c7-468a-9875-675907134d71',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-05-02',
    346.36,
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
  '2025-05-02',
  346.36,
  346.36,
  'pago',
  '2025-05-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '67230dda-a1ee-43e6-a1da-1e6ade98d315',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-05-02',
    118.1,
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
  '2025-05-02',
  118.1,
  118.1,
  'pago',
  '2025-05-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ae20bfb6-f73b-441d-93c8-e48245c1ba04',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-05-02',
    106.53,
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
  '2025-05-02',
  106.53,
  106.53,
  'pago',
  '2025-05-02',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '783e7b97-a331-462a-b855-7bd10b6df6b4',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - MARIA APARECIDA FRANCISCO',
    'Conciliação - PIX RECEBIDO - MARIA APARECIDA FRANCISCO',
    '2025-05-02',
    85.0,
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
  '2025-05-02',
  85.0,
  85.0,
  'pago',
  '2025-05-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '301dd7d4-6a1a-4315-89e4-b7abbf768c6b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-05-03',
    113.54,
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
  '2025-05-03',
  113.54,
  113.54,
  'pago',
  '2025-05-03',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b093211a-9373-460e-aaaf-9d2d4cfa3398',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-05-03',
    112.58,
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
  '2025-05-03',
  112.58,
  112.58,
  'pago',
  '2025-05-03',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8fb07cb9-dc90-4116-b78a-3ebd4e358771',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-05-03',
    144.01,
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
  '2025-05-03',
  144.01,
  144.01,
  'pago',
  '2025-05-03',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0ce322ea-e080-4b0b-954f-ef42c01a4e81',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-05-03',
    49.21,
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
  '2025-05-03',
  49.21,
  49.21,
  'pago',
  '2025-05-03',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd6d35876-b527-4122-b0f2-674f7c7e756e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-05-03',
    48.0,
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
  '2025-05-03',
  48.0,
  48.0,
  'pago',
  '2025-05-03',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cb423250-1aed-491d-ad84-a92e42a40f34',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - RITA DE CASSIA DE SOUZA FREITAS',
    'Conciliação - PIX RECEBIDO - RITA DE CASSIA DE SOUZA FREITAS',
    '2025-05-03',
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
  '2025-05-03',
  50.0,
  50.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9875a542-fdef-4a3f-b891-80ffb23e5396',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - KAIQUE GOMES MIRANDA ELIAS',
    'Conciliação - PIX RECEBIDO - KAIQUE GOMES MIRANDA ELIAS',
    '2025-05-03',
    239.0,
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
  '2025-05-03',
  239.0,
  239.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b7a8f401-869b-4deb-8f60-c5a641593290',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - BULL COMÉRCIO E SERVIÇOS',
    'Conciliação - PIX RECEBIDO - BULL COMÉRCIO E SERVIÇOS',
    '2025-05-03',
    459.0,
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
  '2025-05-03',
  459.0,
  459.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9de9ab2f-d0e1-4dcb-ac41-37adf6858544',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - PEDRO ALVES DE LIMA',
    'Conciliação - PIX RECEBIDO - PEDRO ALVES DE LIMA',
    '2025-05-03',
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
  '2025-05-03',
  290.0,
  290.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '27c9c450-8e08-4ad6-8f51-2cee460dba52',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CECIIA BOAVENTURA SUZARTE',
    'Conciliação - PIX RECEBIDO - CECIIA BOAVENTURA SUZARTE',
    '2025-05-03',
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
  '2025-05-03',
  100.0,
  100.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '53edfd85-28da-460c-9e54-3d9d36e22f4a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 03/05/2025) > PIX: (11) 9 5805-6343 (celular)',
    'ADIANTAMENTO SALARIAL: Felipe Roger Miranda (ref. 03/05/2025) > PIX: (11) 9 5805-6343 (celular)',
    '2025-05-03',
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
  '2025-05-03',
  50.0,
  50.0,
  'pago',
  '2025-05-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '00055d6f-5241-4c67-956a-a3e2351a9a33',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 10/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 10/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-05-05',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-05-05',
  350.0,
  350.0,
  'pago',
  '2025-05-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd200d4bd-a6a6-4eb8-baf4-69a5e5f9da63',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-04-30',
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
  '2025-04-30',
  200.0,
  200.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '44608e12-be4f-42ab-be3c-06a505eabc52',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SALÁRIO: Cleberson Ribeiro de Jesus (ref. 2 dias trabalhados > 09/04 e 10/04/2025) > PIX: 517.291.608-32 (CPF) - Giovanna Mello de Camargo > NUBANK',
    'SALÁRIO: Cleberson Ribeiro de Jesus (ref. 2 dias trabalhados > 09/04 e 10/04/2025) > PIX: 517.291.608-32 (CPF) - Giovanna Mello de Camargo > NUBANK',
    '2025-04-30',
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
  '2025-04-30',
  160.0,
  160.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '24d9b5ca-11ff-4298-8011-ef3f634a330c',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    'bff6edcc-f4e5-4f15-bc7d-ef31ac3a23e7',
    'ENEL 25642171 - LOJA MAUÁ',
    'ENEL 25642171 - LOJA MAUÁ',
    '2025-04-30',
    280.74,
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
  '2025-04-30',
  280.74,
  280.74,
  'pago',
  '2025-04-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '59894353-a673-4182-8248-0675060729ca',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    '2025-04-30',
    209.0,
    'migracao_yampa',
    '{"yampa_sequencia": "69 de 157", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-30',
  209.0,
  209.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f8120224-423f-423a-9fe2-88d15c8a0a2e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
    '2025-04-30',
    192.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 52", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-30',
  192.0,
  192.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '80070a21-b63c-422d-9315-0e3f92d199b8',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - PASTELARIA DO CEARA LTDA',
    'Conciliação - PIX RECEBIDO - PASTELARIA DO CEARA LTDA',
    '2025-04-29',
    990.0,
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
  '2025-04-29',
  990.0,
  990.0,
  'pago',
  '2025-04-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b1783c16-c040-460a-8896-7110c4c6d6f4',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'INSTITUTO VISÃO: 1° Quinz. Fevereiro > PIX: sac@studio7otica.com (e-mail) - 17/02/2025',
    'INSTITUTO VISÃO: 1° Quinz. Fevereiro > PIX: sac@studio7otica.com (e-mail) - 17/02/2025',
    '2025-04-29',
    280.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 3", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-29',
  280.0,
  280.0,
  'pago',
  '2025-04-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4f076b38-a34b-41a9-9a8f-2a3a83a0a5be',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    'DIVINO DOUTOR: Clínica São Vito LTDA > PIX: 19.320.052/0001-73 (CNPJ)',
    '2025-04-30',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-30',
  150.0,
  150.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'abd26ff4-d72f-4435-8da2-748ad9837f59',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-04-30',
    374.69,
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
  '2025-04-30',
  374.69,
  374.69,
  'pago',
  '2025-04-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '62e369d7-6458-4d8d-8b81-203019854fc8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-30',
    39.47,
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
  '2025-04-30',
  39.47,
  39.47,
  'pago',
  '2025-04-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1160160e-03b9-40b3-8610-2f5f189a72d4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-04-30',
    197.82,
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
  '2025-04-30',
  197.82,
  197.82,
  'pago',
  '2025-04-30',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '690463df-8cfa-4507-88c3-10243a68676b',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ADRIANA APARECIDA BRAZ DA SILVA',
    'Conciliação - PIX RECEBIDO - ADRIANA APARECIDA BRAZ DA SILVA',
    '2025-04-30',
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
  '2025-04-30',
  100.0,
  100.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd974d9c3-3af9-4be4-8576-460c1414ceb0',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SILVIA SANTANA DE LEMOS',
    'Conciliação - PIX RECEBIDO - SILVIA SANTANA DE LEMOS',
    '2025-04-30',
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
  '2025-04-30',
  30.0,
  30.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cd3032ae-4e7d-4913-8b5b-08231142d69c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - TATIANA PEREIRA DA SILVA',
    'Conciliação - PIX RECEBIDO - TATIANA PEREIRA DA SILVA',
    '2025-04-30',
    120.0,
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
  '2025-04-30',
  120.0,
  120.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '91795851-7cce-40f0-8b1a-fe23c768f2a1',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 97/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 97/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-04-30',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "97 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-04-30',
  100.0,
  100.0,
  'pago',
  '2025-04-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '42ffecec-e82d-440e-ab43-dbe61576c3a6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF) > R$ 885,00 - desconto de R$ 38,50 - ref. OS 3145',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF) > R$ 885,00 - desconto de R$ 38,50 - ref. OS 3145',
    '2023-02-14',
    846.5,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-02-14',
  846.5,
  846.5,
  'pago',
  '2023-02-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c95a10ee-896d-4de2-b2ff-cbdea97f8c01',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-02-23',
    568.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-02-23',
  568.0,
  568.0,
  'pago',
  '2023-02-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2ba49cc6-21e2-4113-b9a9-0abf43c4fcc2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-02-28',
    347.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 4", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-02-28',
  347.0,
  347.0,
  'pago',
  '2023-02-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6a5b2121-3be5-4184-bed6-9163015dd7ff',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-07-26',
    60.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-07-26',
  60.0,
  60.0,
  'pago',
  '2023-07-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5a0c5611-6724-4912-b41c-f422253b9417',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-07-27',
    46.0,
    'migracao_yampa',
    '{"yampa_sequencia": "24 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  46.0,
  46.0,
  'pago',
  '2023-07-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '439ee8fd-1ae5-4818-bcb5-4ee5e7603ee7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-08-02',
    810.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-02',
  810.0,
  810.0,
  'pago',
  '2023-08-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9eada456-a086-442d-bbbb-9e8c0790e7df',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-08-02',
    72.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-02',
  72.0,
  72.0,
  'pago',
  '2023-08-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c930fc5e-3592-42ec-a5ed-30489d4c327d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-08-15',
    48.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-15',
  48.0,
  48.0,
  'pago',
  '2023-08-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'eed9daf8-e521-4e0f-b090-2e156bb07e46',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-08-21',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-21',
  36.0,
  36.0,
  'pago',
  '2023-08-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cf5998f8-473f-4a21-8677-3da92ffd8683',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-08-21',
    690.08,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-21',
  690.08,
  690.08,
  'pago',
  '2023-08-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b94651e5-98b0-4fb2-9a5d-63a82fb2459e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO - R$ 48,00 > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO - R$ 48,00 > PIX: (11) 9 1357-6019 (celular)',
    '2023-08-25',
    60.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-25',
  60.0,
  60.0,
  'pago',
  '2023-08-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '34ada3aa-0379-40e9-b9d2-61f65796292a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-08-25',
    496.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-25',
  496.0,
  496.0,
  'pago',
  '2023-08-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4b0699ae-847e-4773-b5c0-4f75641749e5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-08-31',
    242.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-08-31',
  242.0,
  242.0,
  'pago',
  '2023-08-31',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b506385b-8d75-4a22-ae37-7f5b21eb05e1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-09-14',
    60.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-14',
  60.0,
  60.0,
  'pago',
  '2023-09-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '819b6b77-b47c-43f6-9dfd-3859784a77f5',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-09-05',
    520.0,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-05',
  520.0,
  520.0,
  'pago',
  '2023-09-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '89ed2131-c393-4c7d-a328-da8e1afc49ba',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-09-14',
    12.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-14',
  12.0,
  12.0,
  'pago',
  '2023-09-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '00e7802b-4b53-4a24-81bc-2b947e2882b2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-09-14',
    454.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-14',
  454.0,
  454.0,
  'pago',
  '2023-09-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '562dae27-a9d2-44de-a42a-9c7b9e557bb0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-09-21',
    12.0,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-21',
  12.0,
  12.0,
  'pago',
  '2023-09-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ae8899eb-3c80-4805-bcb1-8c219580af25',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-09-22',
    528.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-09-22',
  528.0,
  528.0,
  'pago',
  '2023-09-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1f160d4b-5976-4ede-b82f-3f51efa77968',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-10-19',
    58.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-19',
  58.0,
  58.0,
  'pago',
  '2023-10-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3663c83e-753c-4374-beac-d0b56b8c9b34',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-02',
    414.0,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-02',
  414.0,
  414.0,
  'pago',
  '2023-10-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '10f1ae24-5332-43c1-86e1-b1ec1e76dee6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-10-10',
    53.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-10',
  53.0,
  53.0,
  'pago',
  '2023-10-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9aad2185-c598-4208-ae6b-b33f4e394260',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-09',
    780.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-09',
  780.0,
  780.0,
  'pago',
  '2023-10-09',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '358fb364-d191-4129-82d6-06e9ebc87337',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-10-10',
    47.0,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-10',
  47.0,
  47.0,
  'pago',
  '2023-10-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '21dfbf42-eb6d-4701-b62a-77733a362782',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-16',
    345.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-16',
  345.0,
  345.0,
  'pago',
  '2023-10-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '134f9bcd-00e6-4296-bd80-0e54cddde902',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-20',
    392.0,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-20',
  392.0,
  392.0,
  'pago',
  '2023-10-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'be59d75d-9b26-49b0-bb46-90115c85d159',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-10-30',
    121.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-30',
  121.0,
  121.0,
  'pago',
  '2023-10-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a73ddffd-9360-40ca-9ead-abdfa12e04ac',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-30',
    502.0,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-30',
  502.0,
  502.0,
  'pago',
  '2023-10-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '20d138ce-e75c-47c7-87e7-ae9157ff3781',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-10-31',
    24.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-31',
  24.0,
  24.0,
  'pago',
  '2023-10-31',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '722f886e-125f-4fb1-919a-43f5557e29c8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-10-31',
    632.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-10-31',
  632.0,
  632.0,
  'pago',
  '2023-10-31',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'dc1e51c6-9678-426d-a672-ea332e8d1337',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-11-13',
    426.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-11-13',
  426.0,
  426.0,
  'pago',
  '2023-11-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '46ba4031-e793-4a8f-85fb-e583ec029b4f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-11-16',
    51.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-11-16',
  51.0,
  51.0,
  'pago',
  '2023-11-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cf482bfc-bdb6-4ca5-8e8a-14fca13cf5e2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-11-16',
    252.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-11-16',
  252.0,
  252.0,
  'pago',
  '2023-11-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '16ca8e8a-4a62-44a9-99ec-bd92ff2285d6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF) > R$ 396,00 - desconto de R$ 30,00 , ref. OS 495 (quebra de lente na montagem)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF) > R$ 396,00 - desconto de R$ 30,00 , ref. OS 495 (quebra de lente na montagem)',
    '2023-11-24',
    366.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-11-24',
  366.0,
  366.0,
  'pago',
  '2023-11-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '255f1524-6cdd-4056-ad37-03b6c13f2e0b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-11-28',
    48.0,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-11-28',
  48.0,
  48.0,
  'pago',
  '2023-11-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '63c21c4f-069e-4768-ab99-df49aabd1a63',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-12-05',
    389.0,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-05',
  389.0,
  389.0,
  'pago',
  '2023-12-05',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd4668809-2f78-4c17-b21b-084dcb4d5588',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-12-13',
    109.0,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-13',
  109.0,
  109.0,
  'pago',
  '2023-12-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd61b3976-71ae-40e1-9f84-10093642bedd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-12-12',
    387.4,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-12',
  387.4,
  387.4,
  'pago',
  '2023-12-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c531dfa1-25a1-48de-953e-86e28e0a9270',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-12-18',
    296.0,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-18',
  296.0,
  296.0,
  'pago',
  '2023-12-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4838e981-d64b-45e3-ba8b-f95aa1cbb07c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2023-12-29',
    108.0,
    'migracao_yampa',
    '{"yampa_sequencia": "22 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-29',
  108.0,
  108.0,
  'pago',
  '2023-12-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4aade069-f0c4-4147-b8a0-b2985e22892e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2023-12-22',
    476.0,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2023-12-22',
  476.0,
  476.0,
  'pago',
  '2023-12-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2d05c0ac-27a9-4791-a0a5-d9ee886537d2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2024-01-03',
    474.5,
    'migracao_yampa',
    '{"yampa_sequencia": "22 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-01-03',
  474.5,
  474.5,
  'pago',
  '2024-01-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ba787e45-3813-4d07-b59b-71197562d69b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
    '2024-01-13',
    20.0,
    'migracao_yampa',
    '{"yampa_sequencia": "23 de 23", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Suzano"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-01-13',
  20.0,
  20.0,
  'pago',
  '2024-01-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fdb8342e-fd28-477e-92af-0c11ad156311',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-01-13',
    133.0,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 5", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-01-13',
  133.0,
  133.0,
  'pago',
  '2024-01-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '19f4f6c6-1b0e-426c-b809-10a7c4aac5d8',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-01-26',
    132.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 5", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-01-26',
  132.0,
  132.0,
  'pago',
  '2024-01-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ed3f7897-e5fc-400d-a538-f2947429ab7e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-02-08',
    72.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 5", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-02-08',
  72.0,
  72.0,
  'pago',
  '2024-02-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7e474d04-bd6d-4bfa-88a6-f1d6421b8f62',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-03-04',
    84.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-03-04',
  84.0,
  84.0,
  'pago',
  '2024-03-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aa2455bd-3c92-40b9-928f-95d05e0381dc',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-03-11',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-03-11',
  36.0,
  36.0,
  'pago',
  '2024-03-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e560a4b3-3ff4-4ca1-974f-64c2bf986e4d',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-03-13',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  36.0,
  36.0,
  'pago',
  '2024-03-13',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c3589bf0-506e-49e4-b0d0-259a9f83a0d1',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-03-26',
    48.0,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-03-26',
  48.0,
  48.0,
  'pago',
  '2024-03-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '329538e6-739d-4888-aa52-bfa236206ebe',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-04-06',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-04-06',
  36.0,
  36.0,
  'pago',
  '2024-04-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c37de280-3b08-430e-8b06-cb7d7b98a0f5',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-04-16',
    135.0,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-04-16',
  135.0,
  135.0,
  'pago',
  '2024-04-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f6121735-e5c0-4614-96e9-d01b60be831f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-04-25',
    36.0,
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
  '2024-04-25',
  36.0,
  36.0,
  'pago',
  '2024-04-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '503be315-9e05-4081-829f-e26e48682943',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-05-08',
    84.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-05-08',
  84.0,
  84.0,
  'pago',
  '2024-05-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'eb9824f9-f839-4572-aad5-61d0e6ed84fe',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-05-15',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-05-15',
  36.0,
  36.0,
  'pago',
  '2024-05-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '85e038fd-3e34-4963-b844-b6b9f8b92a6f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-05-21',
    48.0,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-05-21',
  48.0,
  48.0,
  'pago',
  '2024-05-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9fe5ec61-4899-4ae4-9a3e-2a827cf21ec2',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-05-29',
    49.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  49.0,
  49.0,
  'pago',
  '2024-05-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ef58f732-33df-4657-90eb-d9b402c6adca',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-06-04',
    72.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-04',
  72.0,
  72.0,
  'pago',
  '2024-06-04',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd118c17f-04b7-459d-84be-22f532a2742a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-06-11',
    72.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-11',
  72.0,
  72.0,
  'pago',
  '2024-06-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a884c9d4-92b8-4353-8bfe-7eb07e1bc576',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-06-18',
    27.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-18',
  27.0,
  27.0,
  'pago',
  '2024-06-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f3086df3-92ae-4de9-b7ab-04a0dfc7b11c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-06-25',
    119.0,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-25',
  119.0,
  119.0,
  'pago',
  '2024-06-25',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '25babbff-2bb1-4dcf-a97d-0d8777a08ed2',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-07-10',
    155.0,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-10',
  155.0,
  155.0,
  'pago',
  '2024-07-10',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8bf6c74f-1daf-4085-91f9-797885260cee',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-07-11',
    84.0,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-11',
  84.0,
  84.0,
  'pago',
  '2024-07-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9fcd463f-390b-471b-be68-8ca4b8d1c836',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
    '2024-07-16',
    48.0,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 45", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-16',
  48.0,
  48.0,
  'pago',
  '2024-07-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

