-- =============================================
-- MIGRAÇÃO YAMPA - LOTE 20/143
-- =============================================
--
-- Registros: 150 
-- Range: 2851 - 3000
-- UUIDs: REAIS do banco
--
-- =============================================

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a9b84ff8-43e0-4789-8e28-d880223a6560',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-28',
    6.63,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-28',
  6.63,
  6.63,
  'pago',
  '2025-03-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cf3e1890-dd3e-4862-b4e5-b5c8a770b6ca',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 64/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 64/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-28',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "64 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-28',
  100.0,
  100.0,
  'pago',
  '2025-03-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '210cf74f-4c6c-427f-9777-624c707842eb',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - VALÉRIA MARTINS DE OLIVEIRA BRAGA',
    'Conciliação - PIX RECEBIDO - VALÉRIA MARTINS DE OLIVEIRA BRAGA',
    '2025-02-14',
    5.0,
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
  '2025-02-14',
  5.0,
  5.0,
  'pago',
  '2025-02-14',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '27ceec55-6dfd-4561-a370-3697bc83f14e',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'MIMA PERFUMARIA LTDA: Cola super bonder',
    'MIMA PERFUMARIA LTDA: Cola super bonder',
    '2025-02-17',
    5.49,
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
  '2025-02-17',
  5.49,
  5.49,
  'pago',
  '2025-02-17',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '65243511-01a0-4cdd-9b83-3356b190bec1',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-01-31',
    650.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-31',
  650.0,
  650.0,
  'pago',
  '2025-01-31',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9e0b5e6f-a68a-4336-a1ec-a4af6329e887',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-01',
    650.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-01',
  650.0,
  650.0,
  'pago',
  '2025-02-01',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6bc95ea8-0104-491d-9995-8a81b8975f20',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-01',
    50.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-01',
  50.0,
  50.0,
  'pago',
  '2025-03-01',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f0975f0-533f-496b-b811-b641690a144d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-03',
    50.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  50.0,
  50.0,
  'pago',
  '2025-03-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '47688174-e7c5-4817-8538-a8abe3e3b083',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-03',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  150.0,
  150.0,
  'pago',
  '2025-03-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c7ccb0c7-f5c3-4c63-9d49-0427461ebb58',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-03',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  150.0,
  150.0,
  'pago',
  '2025-03-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b8d377a9-92a9-434e-a6e3-cf521afce8b7',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - LEONARDO DE LIMA MARQUES',
    'Conciliação - PIX RECEBIDO - LEONARDO DE LIMA MARQUES',
    '2025-03-07',
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
  '2025-03-07',
  990.0,
  990.0,
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
    '424c06ba-bee1-4839-888f-cadfe4bd059e',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-10',
    185.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-10',
  185.0,
  185.0,
  'pago',
  '2025-03-10',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bff4e20a-dfbb-41a9-8875-3fa8747bb769',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'Retirada de moedas',
    'Retirada de moedas',
    '2025-03-10',
    1.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-10',
  1.0,
  1.0,
  'pago',
  '2025-03-10',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '74204e8b-9e8d-4d0a-a1cc-e6832a4bd82f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-10',
    185.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-10',
  185.0,
  182.0,
  'pago',
  '2025-03-10',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '914de6f4-612b-4120-acd6-d6bb0f81769f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-12',
    700.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  700.0,
  700.0,
  'pago',
  '2025-03-12',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c143b58a-4c19-45ad-9d4a-a10fdb616c24',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-12',
    700.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  700.0,
  700.0,
  'pago',
  '2025-03-12',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '24412b34-934f-4e2d-af59-07fb9786733f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-15',
    170.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  170.0,
  170.0,
  'pago',
  '2025-03-15',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4c88168c-38a4-40b0-86c0-e21bb91b032f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-15',
    170.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  170.0,
  170.0,
  'pago',
  '2025-03-15',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7bfa8ec1-0b6e-4d48-bb0f-befd50956a3f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 1/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 1/32',
    '2025-01-21',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-01-21',
  269.43,
  269.43,
  'pago',
  '2025-01-21',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '17363c57-668d-4e17-af98-ee5106b5dedd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 2/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 2/32',
    '2025-01-24',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-01-24',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '01d8c7a9-3a41-413b-918e-fb5d1e41b07c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 3/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 3/32',
    '2025-01-28',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-01-28',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6fd3738d-820e-4b95-b446-37cf635fc74a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS 10345 - Eduardo Adriano > Poli Foto Blue com AR',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS 10345 - Eduardo Adriano > Poli Foto Blue com AR',
    '2025-03-17',
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
    'f57fc1f0-b79b-4cc5-9ea3-b4e0db828535',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 4/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 4/32',
    '2025-01-30',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-01-30',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e020c631-4478-41cd-b968-eace9856d4a2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 5/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 5/32',
    '2025-02-03',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-02-03',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd5ad652f-c290-44b1-9ad0-e3639192126f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/32',
    '2025-02-06',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-06',
  269.43,
  269.43,
  'pago',
  '2025-02-06',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '178f255b-99dc-424c-b8c3-42635d3ef0ff',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 7/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 7/32',
    '2025-02-10',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-02-10',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '52329adc-518c-460d-9d16-339336c7d38d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 8/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 8/32',
    '2025-02-13',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-02-13',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '12c9fdf1-3ce1-49a8-a31a-e2a1cf87980e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 9/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 9/32',
    '2025-02-18',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-18',
  269.43,
  269.43,
  'pago',
  '2025-02-18',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a23b2b7a-d05f-4428-b843-678bbadc3ab3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 10/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 10/32',
    '2025-02-21',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-21',
  269.43,
  269.43,
  'pago',
  '2025-02-21',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'feea90b4-a817-4b5f-9ec7-bd29d080530b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 11/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 11/32',
    '2025-02-27',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-27',
  269.43,
  269.43,
  'pago',
  '2025-02-27',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '1a259a58-b182-43c1-ba44-95af7724088d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-26',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-26',
  150.0,
  150.0,
  'pago',
  '2025-02-26',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3c2bddd7-c139-41f6-be55-708410fb32f8',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-02-25',
    150.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-25',
  150.0,
  150.0,
  'pago',
  '2025-02-25',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aca82452-377c-490a-9ae9-24bf82e6da5a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
    '2025-03-25',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 53", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  200.0,
  200.0,
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
    '67dea807-5a0f-4e6d-9480-481ccaa608c2',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 12/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 12/32',
    '2025-02-28',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-28',
  269.43,
  269.43,
  'pago',
  '2025-02-28',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0388f6b3-10ea-4f7c-b60e-211b40950cdb',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 13/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 13/32',
    '2025-03-03',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
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
    '5a5bfe12-add4-4935-a5cf-aa43edf33f0c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 14/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 14/32',
    '2025-03-06',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-06',
  269.43,
  269.43,
  'pago',
  '2025-03-06',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ea312349-65c1-422e-ae7d-c3c4dbe714c3',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 15/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 15/32',
    '2025-03-10',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-10',
  269.43,
  269.43,
  'pago',
  '2025-03-10',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'bc94beaa-3a0c-4a3d-848b-924e4d89507b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 16/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 16/32',
    '2025-03-14',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
  'pago',
  '2025-03-14',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ed86312b-9622-487f-a1ed-40b1f50a8671',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 17/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 17/32',
    '2025-03-18',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
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
    'aba3d9aa-aa11-41cb-906b-7b1ce4a52dc5',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-03-19',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2c38f7ce-c16e-413d-bb91-c74454f76e67',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-03-19',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2f8ef9a0-a7cc-4bc0-8955-e027c166fc04',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4843',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 4843',
    '2025-03-25',
    79.0,
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
  '2025-03-25',
  79.0,
  79.0,
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
    '2ff1f010-d2a7-4796-b1a3-429d80c605c1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10688, 10692 e 10693',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 10688, 10692 e 10693',
    '2025-03-25',
    591.0,
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
  '2025-03-25',
  591.0,
  591.0,
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
    '0f238e6e-34ae-4a71-a293-3365e3885900',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1100',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1100',
    '2025-03-25',
    63.0,
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
  '2025-03-25',
  63.0,
  63.0,
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
    'ce943376-c202-4a2f-be37-f978f87b608f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 4759 e 4760',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 4759 e 4760',
    '2025-03-21',
    175.0,
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
  '2025-03-21',
  175.0,
  175.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '00c75133-5656-4b12-acdc-568bb1cecc60',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-03-21',
    175.0,
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
  '2025-03-21',
  175.0,
  175.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6dfc1895-4f48-487e-bae5-9da818785be0',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-03-25',
    41.12,
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
  '2025-03-25',
  41.12,
  41.12,
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
    'e9491cac-59a1-4a9c-bbaa-ab3960bb6296',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 4759 e 4760',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 4759 e 4760',
    '2025-03-25',
    250.0,
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
  '2025-03-25',
  250.0,
  250.0,
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
    '4a21f994-3a8a-49aa-9106-f69fb82c2938',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    'VISION PRIME > Jéssica Paschoalini > PIX: 230.032.638-89 (CPF) - ref. OS''s 10563, 10564, 10606, 10607, 10621 e 10622',
    '2025-03-25',
    250.0,
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
  '2025-03-25',
  250.0,
  250.0,
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
    'c90ec044-19f3-4941-9cb7-cffb581c34f4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 18/32',
    '1° ACORDO: OPTOTAL HOYA LTDA - Parcela 18/32',
    '2025-03-21',
    269.43,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 32", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  269.43,
  269.43,
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
    'c81fee1c-7b59-465b-94e1-77e8a4ac8c41',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-25',
    6.68,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  6.68,
  6.68,
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
    '4d4b5773-172a-4ff4-81f1-37f0b0419be9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10685, 10704, 10707, 10710, 10712, 10715 e 10728 (10679)',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10685, 10704, 10707, 10710, 10712, 10715 e 10728 (10679)',
    '2025-03-25',
    160.0,
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
  '2025-03-25',
  160.0,
  160.0,
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
    'c67382e8-6467-4ece-91fc-b6118cf482a9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 1102 e 1103',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 1102 e 1103',
    '2025-03-25',
    76.0,
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
  '2025-03-25',
  76.0,
  76.0,
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
    'c628103f-110a-4c0d-9af8-c2c98a049717',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-24',
    741.82,
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
  '2025-03-24',
  741.82,
  741.82,
  'pago',
  '2025-03-24',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '10c56e73-1537-487a-a839-25e0d24ba1cb',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. taxa de entrega',
    '2025-03-25',
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
  '2025-03-25',
  10.0,
  10.0,
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
    '9b517886-3801-4184-a027-4a5e4273be9a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 4830',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS 4830',
    '2025-03-25',
    9.0,
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
  '2025-03-25',
  9.0,
  9.0,
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
    '5148e34b-1ebf-4ac5-902d-fa6219bbdfdd',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-24',
    132.54,
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
  '2025-03-24',
  132.54,
  132.54,
  'pago',
  '2025-03-24',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '35a192ab-84b6-45a0-8632-f1c2f1b158bf',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 61/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 61/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-25',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "61 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  100.0,
  100.0,
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
    '022d2fe5-138e-4053-a7e1-34704814bcf1',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    'a81eb1b4-b40b-4af8-8fe3-2f36aeff862b',
    'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 4/112 > PIX: 08.450.703.0001/23 (CNPJ)',
    'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 4/112 > PIX: 08.450.703.0001/23 (CNPJ)',
    '2025-03-25',
    400.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 112", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  400.0,
  400.0,
  'pago',
  '2025-03-25',
  '6fcfbf8d-c183-45c8-8c61-6c665d1a6286'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8437628b-97df-46ea-a319-314dd27de733',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '496da68c-25cd-4934-8b43-fa1444f0591a',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'PADARIA SANTA HELENA: Pão francês > Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-25',
    6.42,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 20", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  6.42,
  6.42,
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
    '2a47227b-6ebb-4651-931f-bb4531d6c9ce',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10725 e 10726',
    'BRASLENTES - CHAMP BRASIL COMERCIO LTDA > PIX: nubank@champbrasil.com.br (e-mail) - ref. OS''s 10725 e 10726',
    '2025-03-25',
    53.0,
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
  '2025-03-25',
  53.0,
  53.0,
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
    '3cf0718f-8af3-408b-aec0-e31009ae6dcf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-25',
    567.72,
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
  '2025-03-25',
  567.72,
  567.72,
  'pago',
  '2025-03-25',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '54746a5f-cf8e-4661-9daa-4ae1322ad5ac',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
    '2025-03-25',
    294.75,
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
  '2025-03-25',
  294.75,
  294.75,
  'pago',
  '2025-03-25',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '3d0f1c8f-babd-4c5e-b462-47a8c136a168',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SILVIA FERREIRA ARMILIATO',
    'Conciliação - PIX RECEBIDO - SILVIA FERREIRA ARMILIATO',
    '2025-03-21',
    181.66,
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
  '2025-03-21',
  181.66,
  181.66,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '872cc729-6237-48d8-b1a5-2ff983af096b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-03-22',
    96.01,
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
  '2025-03-22',
  96.01,
  96.01,
  'pago',
  '2025-03-22',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4a96bf7f-ac27-4af4-bea8-bb09160bbcd9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-22',
    394.65,
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
  '2025-03-22',
  394.65,
  394.65,
  'pago',
  '2025-03-22',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '49826b00-2eb3-45dd-8edb-c399eb045627',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    'Conciliação - VENDAS - DISPONIVEL CREDITO ELO',
    '2025-03-22',
    362.58,
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
  '2025-03-22',
  362.58,
  362.58,
  'pago',
  '2025-03-22',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '63264807-a512-4203-ac36-066e2b34bc5f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-22',
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
  '2025-03-22',
  49.45,
  49.45,
  'pago',
  '2025-03-22',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'e0bd3ef7-5ae9-4a94-a410-81b0e10aa5de',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-22',
    532.86,
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
  '2025-03-22',
  532.86,
  532.86,
  'pago',
  '2025-03-22',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f239a3e6-8aa0-4242-9946-0e3a969e5b94',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - SAMUEL SILVA FELIX',
    'Conciliação - PIX RECEBIDO - SAMUEL SILVA FELIX',
    '2025-03-22',
    900.0,
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
  '2025-03-22',
  900.0,
  900.0,
  'pago',
  '2025-03-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a65a0207-a9a0-4817-b3fc-7b4ba01903c1',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 59/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 59/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-24',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "59 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-24',
  100.0,
  100.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '72098dcb-b0af-43ab-b444-3b706ba5ddc6',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'FREELANCER: Ariani Dias Fernandes Líbano (ref. 22/03/2025) > PIX: 487.287.868-07 (CPF)',
    'FREELANCER: Ariani Dias Fernandes Líbano (ref. 22/03/2025) > PIX: 487.287.868-07 (CPF)',
    '2025-03-23',
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
  '2025-03-23',
  150.0,
  150.0,
  'pago',
  '2025-03-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5f62a5a2-ef59-423f-abbe-48d3d0cdc96d',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - JOSIANE VICENTE DOS SANTOS',
    'Conciliação - PIX RECEBIDO - JOSIANE VICENTE DOS SANTOS',
    '2025-03-23',
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
  '2025-03-23',
  92.0,
  92.0,
  'pago',
  '2025-03-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '09d1e171-7656-4df5-b222-bd81fe8083c5',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 60/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 60/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-24',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "60 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-24',
  100.0,
  100.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'df762b12-428b-4a6d-b20c-6f8f061b6647',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'CHAVEIRO SOS SOARES > PIX: 27.177.706/0001-80 (CNPJ)',
    'CHAVEIRO SOS SOARES > PIX: 27.177.706/0001-80 (CNPJ)',
    '2025-03-24',
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
  '2025-03-24',
  100.0,
  100.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aba685d0-946d-4488-9fb4-90361921e74f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'CHAVEIRO > Larissa A. S. Albuquerque: Miolo do portão + 2 chaves > PIX: 474.400.388*51 (CPF)',
    'CHAVEIRO > Larissa A. S. Albuquerque: Miolo do portão + 2 chaves > PIX: 474.400.388*51 (CPF)',
    '2025-03-24',
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
  '2025-03-24',
  60.0,
  60.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9e20ceb5-cdc4-43b7-a9a6-e1f5097a736f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'CHAVEIRO > Larissa A. S. Albuquerque: Cópia de chaves > PIX: 474.400.388*51 (CPF)',
    'CHAVEIRO > Larissa A. S. Albuquerque: Cópia de chaves > PIX: 474.400.388*51 (CPF)',
    '2025-03-24',
    5.0,
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
  '2025-03-24',
  5.0,
  5.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fb0cf2b4-c43d-45dd-abd7-7882a8f3895a',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'SALÁRIO: Cleberson Ribeiro de Jesus (ref. 21/03 e 22/03 - dias trabalhados) > PIX: fa3ebe71-d347-4fe4-9e4d-5d051e7d274d (chave aleatória)',
    'SALÁRIO: Cleberson Ribeiro de Jesus (ref. 21/03 e 22/03 - dias trabalhados) > PIX: fa3ebe71-d347-4fe4-9e4d-5d051e7d274d (chave aleatória)',
    '2025-03-24',
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
  '2025-03-24',
  120.0,
  120.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5d213264-c311-4a6e-97ba-a9a4a2cfde41',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE TRANSPORTE: Cleberson Ribeiro de Jesus (ref. 21/03 e 22/03 - dias trabalhados) > PIX: fa3ebe71-d347-4fe4-9e4d-5d051e7d274d (chave aleatória)',
    'VALE TRANSPORTE: Cleberson Ribeiro de Jesus (ref. 21/03 e 22/03 - dias trabalhados) > PIX: fa3ebe71-d347-4fe4-9e4d-5d051e7d274d (chave aleatória)',
    '2025-03-24',
    25.0,
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
  '2025-03-24',
  25.0,
  25.0,
  'pago',
  '2025-03-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c2e20f4d-4527-4fb8-b815-ddb8da28d09c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-03',
    165.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  165.0,
  165.0,
  'pago',
  '2025-02-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '58c01a61-a4bf-4a91-a3d7-aed9857a7146',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-03',
    10.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  10.0,
  10.0,
  'pago',
  '2025-02-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '87d9e3d2-8ec1-462b-b619-51d96faf1048',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '7245ff34-af3e-44ce-8c29-f874dd392683',
    'Dinheiro em caixa',
    'Dinheiro em caixa',
    '2025-02-01',
    34.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-02-01',
  34.0,
  34.0,
  'pago',
  '2025-02-01',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ad419cd5-ce6a-4448-8b78-4a7eaa24b3f1',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-04',
    40.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  40.0,
  40.0,
  'pago',
  '2025-02-04',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6cf6051b-81a9-4d93-b4f6-39f2e2741e99',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-03',
    320.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  320.0,
  300.0,
  'pago',
  '2025-02-03',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ee7f0f3f-2683-4aeb-9c0b-b573e95a0159',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    'PRO-LABORE > Gilberto de Camargo Silva Junior',
    '2025-02-04',
    530.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 1", "yampa_conta_bancaria": "Caixa (Dinheiro)", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  530.0,
  530.0,
  'pago',
  '2025-02-04',
  '43e2dcf9-1e47-45a5-8357-746a2b3e4d53'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'fc7b50b3-ed64-4ca6-8a7f-6d92fb50b3e9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-21',
    188.29,
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
  '2025-03-21',
  188.29,
  188.29,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9fa16616-9d7e-48f8-adae-7aac3d398292',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - RODRIGO SILVA DE ARAÚJO',
    'Conciliação - PIX RECEBIDO - RODRIGO SILVA DE ARAÚJO',
    '2025-03-21',
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
  '2025-03-21',
  50.0,
  50.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '72b8c811-1300-460a-9659-d5d1663da75d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ROBERT LAHUERTA BARBOSA',
    'Conciliação - PIX RECEBIDO - ROBERT LAHUERTA BARBOSA',
    '2025-03-21',
    270.0,
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
  '2025-03-21',
  270.0,
  270.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2398b806-63d1-42a7-a822-1fd619e9eb03',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - PAULO SILVA',
    'Conciliação - PIX RECEBIDO - PAULO SILVA',
    '2025-03-21',
    136.12,
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
  '2025-03-21',
  136.12,
  136.12,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '8526bc85-7edb-4caf-8ee4-ce7772c630f4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/24',
    '2° ACORDO: OPTOTAL HOYA LTDA - Parcela 6/24',
    '2025-03-21',
    196.96,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 24", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja São Mateus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  196.96,
  196.96,
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
    'c628a4c0-e079-49f9-98f7-c03cc8ad255c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    'Conciliação - VENDAS - DISPONIVEL PIX',
    '2025-03-21',
    497.49,
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
  '2025-03-21',
  497.49,
  497.49,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'ab112a6a-71c6-4907-9715-0123f8854122',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-21',
    394.65,
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
  '2025-03-21',
  394.65,
  394.65,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2eb68991-4030-42e3-810a-a4947d6258df',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
    '2025-03-21',
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
  '2025-03-21',
  197.82,
  197.82,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5d044a4c-283b-4726-ae3c-fd6805b5dd72',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
    '2025-03-21',
    30.02,
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
  '2025-03-21',
  30.02,
  30.02,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '68a39849-9299-47f5-9ddd-45723fb03775',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-21',
    89.02,
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
  '2025-03-21',
  89.02,
  89.02,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '9d8ad821-f6a0-4fbb-bc49-2454e7559c98',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
    '2025-03-21',
    890.19,
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
  '2025-03-21',
  890.19,
  890.19,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd52218de-bdb4-4481-8663-ba1d40b70425',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
    '2025-03-21',
    425.78,
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
  '2025-03-21',
  425.78,
  425.78,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0a4a0a6c-1fda-4a67-b7c7-d39f4649ee9f',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - ELIANE ALVARENGA DA SILVA BARROS',
    'Conciliação - PIX RECEBIDO - ELIANE ALVARENGA DA SILVA BARROS',
    '2025-03-21',
    950.0,
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
  '2025-03-21',
  950.0,
  950.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '25ecb690-5b9a-4117-a942-ce994035abf6',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - NELY MARIA DA MATA',
    'Conciliação - PIX RECEBIDO - NELY MARIA DA MATA',
    '2025-03-21',
    600.0,
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
  '2025-03-21',
  600.0,
  600.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5317c52e-70d9-48ae-9d87-52f0ce87485b',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '3cdba05e-54f4-4e55-a3c0-f882c6a4dc47',
    'COMPRA DE ARMAÇÕES',
    'COMPRA DE ARMAÇÕES',
    '2025-03-21',
    350.0,
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
  '2025-03-21',
  350.0,
  350.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2982ead1-481e-40b4-a06c-04288b0da4cd',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 58/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 58/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-22',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "58 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-22',
  100.0,
  100.0,
  'pago',
  '2025-03-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '307f2915-a6ac-4124-83c4-a17429525d7d',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 4/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    'ACORDO: SYGMA LABORATORIO OPTICO LTDA > Parcela 4/60 > PIX: 30.576.013/0001-74 (CNPJ)',
    '2025-03-22',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 60", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2025-03-22',
  350.0,
  350.0,
  'pago',
  '2025-03-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'f342d052-d059-493b-ab45-0f3a86961b29',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - LUANA STHEFANI DE OLIVEIRA',
    'Conciliação - PIX RECEBIDO - LUANA STHEFANI DE OLIVEIRA',
    '2025-03-22',
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
  '2025-03-22',
  60.0,
  60.0,
  'pago',
  '2025-03-22',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2bab2b06-dc0d-432c-be0d-1719fe3bf48f',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '19b7c33c-66e3-48e0-a9ae-c07ae01c6a50',
    'VIVO FIXO E INTERNET 8999 2677 1194 - SUZANO',
    'VIVO FIXO E INTERNET 8999 2677 1194 - SUZANO',
    '2025-03-21',
    117.97,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 27", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  117.97,
  117.97,
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
    '815d1dea-f8e8-4ca3-8620-2b71410af8cc',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    'a81eb1b4-b40b-4af8-8fe3-2f36aeff862b',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    'KONSEP CONTABILIDADE E CONSULTORIA LTD: Mensalidade > PIX: 08.450.703.0001/23 (CNPJ)',
    '2025-03-21',
    350.0,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  350.0,
  350.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '95ab5eec-dfe5-487f-b4ca-6794c58af309',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: labthc@outlook.com (e-mail)',
    '2025-03-21',
    359.0,
    'migracao_yampa',
    '{"yampa_sequencia": "63 de 157", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  359.0,
  359.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a094a72d-de20-439f-ad90-609176587c21',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 4820, 4823, 4834 e 4835',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS''s 4820, 4823, 4834 e 4835',
    '2025-03-21',
    497.0,
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
  '2025-03-21',
  497.0,
  497.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cb35282f-1930-4a83-9e20-8ff5187771c9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1094',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 1094',
    '2025-03-21',
    349.0,
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
  '2025-03-21',
  349.0,
  349.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd080d6f3-54bb-43b7-80b6-c174ed91c3ea',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10675',
    'STYLE PLUS > PIX: 43.849.253/0001-47 (CNPJ) - ref. OS 10675',
    '2025-03-21',
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
  '2025-03-21',
  78.0,
  78.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '034a4b8d-1cdd-450e-be80-41e1be2a29d9',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    'VALE ADIANTAMENTO: Felipe Roger Miranda > PIX: (11) 9 5805-6343 (celular)',
    '2025-03-20',
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
  '2025-03-20',
  934.0,
  934.0,
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
    'b0250fac-d34e-44e4-823f-8a6568b34658',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
    '2025-03-20',
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
  '2025-03-20',
  934.0,
  934.0,
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
    'e7209344-4f32-458b-ad92-5bed9c4c131c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
    '2025-03-20',
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
  '2025-03-20',
  800.0,
  800.0,
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
    '559b9bd2-3fbc-453e-97f1-1b7f4f168b5d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'VALE ADIANTAMENTO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    'VALE ADIANTAMENTO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
    '2025-03-20',
    930.0,
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
  930.0,
  930.0,
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
    '80b68636-576f-473d-8fda-993148398dea',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - APARECIDA LIMA SILVESTRE',
    'Conciliação - PIX RECEBIDO - APARECIDA LIMA SILVESTRE',
    '2025-03-20',
    750.0,
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
  750.0,
  750.0,
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
    '9e94a829-b62a-4517-92d8-cbb73a6bd47d',
    'b46e1e6b-12ed-4e5a-a3f6-fc9c0704aabe',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - AVANILDO SILVA DE MENESES',
    'Conciliação - PIX RECEBIDO - AVANILDO SILVA DE MENESES',
    '2025-03-20',
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
  '2025-03-20',
  200.0,
  200.0,
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
    '459ea362-39af-41da-a3fa-b63d9574d05c',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - CASSIA MARIA DOS SANTOS',
    'Conciliação - PIX RECEBIDO - CASSIA MARIA DOS SANTOS',
    '2025-03-20',
    156.66,
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
  156.66,
  156.66,
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
    '9a0fbee9-fead-489a-a14d-3a2baa7181b2',
    '60a71af7-86ba-49e2-a4c7-7d1efc6cd8da',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 57/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    'ACORDO > ALUGUEL & FRANQUIA > Rio Pequeno - Loja (ref. dez/2024 e jan/2025) > parcela 57/134 > PIX: 52.597.549/0001-09 (CNPJ)',
    '2025-03-21',
    100.0,
    'migracao_yampa',
    '{"yampa_sequencia": "57 de 134", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  100.0,
  100.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'a02141c3-e29b-4e64-95e2-bc47b792c1f6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
    'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
    '2025-03-21',
    608.96,
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
  '2025-03-21',
  608.96,
  608.96,
  'pago',
  '2025-03-21',
  NULL
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '26515ee8-dee8-46c8-bed3-84df9f2371a6',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - FERNANDA MAGDA BATISTA DE PAULA',
    'Conciliação - PIX RECEBIDO - FERNANDA MAGDA BATISTA DE PAULA',
    '2025-03-21',
    125.0,
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
  '2025-03-21',
  125.0,
  125.0,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4afd4774-87e2-40de-9629-7a0fabb5faec',
    '3704fcce-6e02-411d-a0ad-d96de801345a',
    'receber',
    '2742c847-cf17-44de-aafe-5ad00dd7d4cd',
    'Conciliação - PIX RECEBIDO - PALOMA ARAUJO DOS SANTOS',
    'Conciliação - PIX RECEBIDO - PALOMA ARAUJO DOS SANTOS',
    '2025-03-21',
    113.25,
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
  '2025-03-21',
  113.25,
  113.25,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '7c6f3e5a-c3e7-4867-ac51-41c2b9dab056',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '96cebc3d-191f-4881-83af-66da5e56b1f8',
    'ALUGUEL ESCRITÓRIO - SUZANO (IPTU) - (NUBANK - Giovanna)',
    'ALUGUEL ESCRITÓRIO - SUZANO (IPTU) - (NUBANK - Giovanna)',
    '2025-03-21',
    637.84,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 11", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "nan"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  637.84,
  637.84,
  'pago',
  '2025-03-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '51ef89fb-b4f9-4082-a057-b4213f7666ef',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-05-28',
    297.5,
    'migracao_yampa',
    '{"yampa_sequencia": "1 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-05-28',
  297.5,
  297.5,
  'pago',
  '2024-05-28',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aa828122-3811-4792-8c6f-15160f92f21c',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-05-31',
    132.5,
    'migracao_yampa',
    '{"yampa_sequencia": "2 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  132.5,
  132.5,
  'pago',
  '2024-05-31',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'b11283e7-a7d6-4ec4-a8a4-1c59eedc4271',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-06-07',
    134.0,
    'migracao_yampa',
    '{"yampa_sequencia": "3 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-07',
  134.0,
  134.0,
  'pago',
  '2024-06-07',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'af58a1b4-871a-4c10-836a-37f33615fd68',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-06-12',
    36.0,
    'migracao_yampa',
    '{"yampa_sequencia": "4 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-12',
  36.0,
  36.0,
  'pago',
  '2024-06-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c8f3c014-225f-4067-8c29-116eac8b6bd6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-06-19',
    276.0,
    'migracao_yampa',
    '{"yampa_sequencia": "5 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-19',
  276.0,
  276.0,
  'pago',
  '2024-06-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c0e017b8-8643-4e26-9db9-9a5961e0e488',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-06-21',
    193.0,
    'migracao_yampa',
    '{"yampa_sequencia": "6 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  193.0,
  193.0,
  'pago',
  '2024-06-21',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'cabfd28a-b00f-416f-945c-78049517313f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-06-26',
    340.0,
    'migracao_yampa',
    '{"yampa_sequencia": "7 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-06-26',
  340.0,
  340.0,
  'pago',
  '2024-06-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '79cf99a2-45ff-4c6d-8aa3-9107ea1c59ea',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-01',
    119.0,
    'migracao_yampa',
    '{"yampa_sequencia": "8 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  119.0,
  119.0,
  'pago',
  '2024-07-01',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '41378ab1-2486-4b8c-a54f-f580eed46bac',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-08',
    124.0,
    'migracao_yampa',
    '{"yampa_sequencia": "9 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-08',
  124.0,
  124.0,
  'pago',
  '2024-08-08',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '043d924c-4ddb-4334-b6c8-65cc543df7d6',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-10',
    67.0,
    'migracao_yampa',
    '{"yampa_sequencia": "10 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  67.0,
  67.0,
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
    'a838a3f6-b407-4734-b602-e30d24833d68',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-12',
    183.0,
    'migracao_yampa',
    '{"yampa_sequencia": "11 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-12',
  183.0,
  183.0,
  'pago',
  '2024-07-12',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '681b9600-d21f-4ab0-becf-3bc595cebdf9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-16',
    176.0,
    'migracao_yampa',
    '{"yampa_sequencia": "12 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  176.0,
  176.0,
  'pago',
  '2024-07-16',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'aeb3678f-a942-4bde-b729-bca64d0adcaf',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-18',
    108.0,
    'migracao_yampa',
    '{"yampa_sequencia": "13 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-18',
  108.0,
  108.0,
  'pago',
  '2024-07-18',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6de27086-0e3b-4662-b897-b88b09b53e3e',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-24',
    180.0,
    'migracao_yampa',
    '{"yampa_sequencia": "14 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-24',
  180.0,
  180.0,
  'pago',
  '2024-07-24',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4926875d-31b3-47f2-ac1d-5c74418c762a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-26',
    70.0,
    'migracao_yampa',
    '{"yampa_sequencia": "15 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-07-26',
  70.0,
  70.0,
  'pago',
  '2024-07-26',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '742b24aa-28bd-4671-8965-1ab9cc3e35b7',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-29',
    89.0,
    'migracao_yampa',
    '{"yampa_sequencia": "16 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  89.0,
  89.0,
  'pago',
  '2024-07-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '35b77e6c-4e56-42d8-8459-52cb106a3a4a',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-07-30',
    47.0,
    'migracao_yampa',
    '{"yampa_sequencia": "17 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  47.0,
  47.0,
  'pago',
  '2024-07-30',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '91f5c302-5438-4664-88de-1d603e9dc29f',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-02',
    200.0,
    'migracao_yampa',
    '{"yampa_sequencia": "18 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-02',
  200.0,
  200.0,
  'pago',
  '2024-08-02',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0fe5de40-d998-4e0b-8944-034f56c01cb9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-06',
    77.0,
    'migracao_yampa',
    '{"yampa_sequencia": "19 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-06',
  77.0,
  77.0,
  'pago',
  '2024-08-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '0f127c90-0cfe-4a36-92a9-1169a9e41193',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-15',
    84.0,
    'migracao_yampa',
    '{"yampa_sequencia": "20 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-15',
  84.0,
  84.0,
  'pago',
  '2024-08-15',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '2b21f97b-fa1b-45dd-9c03-eff661c51d72',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-19',
    236.0,
    'migracao_yampa',
    '{"yampa_sequencia": "21 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-19',
  236.0,
  236.0,
  'pago',
  '2024-08-19',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'c72522bb-cb48-476c-ab70-f41cf93140c4',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-20',
    273.0,
    'migracao_yampa',
    '{"yampa_sequencia": "22 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
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
  273.0,
  273.0,
  'pago',
  '2024-08-20',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '204e2250-adff-46b8-b320-d5e6bf16e1e9',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-23',
    27.0,
    'migracao_yampa',
    '{"yampa_sequencia": "23 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-23',
  27.0,
  27.0,
  'pago',
  '2024-08-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '5223eb70-3beb-4dbd-a677-4087ba07ac37',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-23',
    158.0,
    'migracao_yampa',
    '{"yampa_sequencia": "24 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-23',
  158.0,
  158.0,
  'pago',
  '2024-08-23',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '4c183125-02f2-474f-b6f6-0d2d19718a19',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-27',
    82.0,
    'migracao_yampa',
    '{"yampa_sequencia": "25 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-27',
  82.0,
  82.0,
  'pago',
  '2024-08-27',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'd25f443e-efdf-417e-8f14-bb91cbdbbd54',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-08-29',
    177.0,
    'migracao_yampa',
    '{"yampa_sequencia": "26 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-08-29',
  177.0,
  177.0,
  'pago',
  '2024-08-29',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    'da48882f-dd92-4694-b526-c243348975fe',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-03',
    147.0,
    'migracao_yampa',
    '{"yampa_sequencia": "27 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-03',
  147.0,
  147.0,
  'pago',
  '2024-09-03',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '6d87e93d-cfdd-40c2-9c5e-58cf23b50d35',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-06',
    130.5,
    'migracao_yampa',
    '{"yampa_sequencia": "28 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-06',
  130.5,
  130.5,
  'pago',
  '2024-09-06',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

-- Lançamento + Parcela
WITH novo_lancamento AS (
  INSERT INTO lancamentos (
    id, loja_id, tipo, plano_id, descricao, historico,
    competencia, valor_total, origem, metadata, user_id
  ) VALUES (
    '196789ff-9d75-4b8f-a268-013fa47a42ce',
    '692e5aea-e785-4675-9d44-9f3e24b36b01',
    'pagar',
    '491d08a9-cef8-4cdb-b861-da5c3f936af7',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
    '2024-09-11',
    232.5,
    'migracao_yampa',
    '{"yampa_sequencia": "29 de 87", "yampa_conta_bancaria": "Banco Inter - GTN Holding", "yampa_status": "Realizado", "yampa_cliente_fornecedor": "nan", "yampa_projeto": "Loja Perus"}'::jsonb,
    '84ab5c15-1d27-4933-a3f1-bb9d57f77e7a'
  ) RETURNING id
)
INSERT INTO parcelas (
  id, lancamento_id, parcela, vencimento, valor,
  valor_pago, status, data_pagamento, forma_pagamento_id
) 
SELECT 
  gen_random_uuid(),
  nl.id,
  1,
  '2024-09-11',
  232.5,
  232.5,
  'pago',
  '2024-09-11',
  'cb8bf5a9-31d2-49de-bcb7-e2579feabdaf'
FROM novo_lancamento nl;

