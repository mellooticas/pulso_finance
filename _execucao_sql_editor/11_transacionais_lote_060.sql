
    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - ELO',
        'TAXA DE VENDAS CARTaO - ELO',
        '2022-03-07'::date,
        4.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        4.11,
        'pago'::status_parcela,
        4.11,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 1437: LuBIA MARCELINO ROMERO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 1437: LuBIA MARCELINO ROMERO',
        'CARNe - 1437: LuBIA MARCELINO ROMERO',
        '2022-03-07'::date,
        3.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        3.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 4949: JOSe DE OLIVEIRA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 4949: JOSe DE OLIVEIRA ',
        'RESTANTE DO SINAL - 4949: JOSe DE OLIVEIRA ',
        '2022-03-07'::date,
        200.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4485: MARIA DAS DORES DE JESUS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4485: MARIA DAS DORES DE JESUS',
        'CARNe - 4485: MARIA DAS DORES DE JESUS',
        '2022-03-07'::date,
        80.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        80.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1772: JOSE FeLIX DESTELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 1772: JOSE FeLIX DESTELO',
        'RESTANTE DO SINAL - 1772: JOSE FeLIX DESTELO',
        '2022-03-07'::date,
        140.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4768: DEJANIRA SALES DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4768: DEJANIRA SALES DA SILVA',
        'CARNe - 4768: DEJANIRA SALES DA SILVA',
        '2022-03-07'::date,
        140.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-07'::date,
        25.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        25.33,
        'pago'::status_parcela,
        25.33,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOB...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOBINA TeRMICA',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOBINA TeRMICA',
        '2022-03-07'::date,
        10.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        10.3,
        'pago'::status_parcela,
        10.3,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4345: RUBENS APARECIDO DE SOUZA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4345: RUBENS APARECIDO DE SOUZA',
        'CARNe - 4345: RUBENS APARECIDO DE SOUZA',
        '2022-03-07'::date,
        68.55,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        68.55,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-07'::date,
        1864.68,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        1864.68,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-07'::date,
        1.86,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        1.86,
        'pago'::status_parcela,
        1.86,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - 05/03 21:31 ASSAI ATACADISTA    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE TATY - 05/03 21:31 ASSAI ATACADISTA          ',
        'PRO-LABORE TATY - 05/03 21:31 ASSAI ATACADISTA          ',
        '2022-03-07'::date,
        473.41,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        473.41,
        'pago'::status_parcela,
        473.41,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4975: NEOCINO SILVESTRE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4975: NEOCINO SILVESTRE',
        'CARNe - 4975: NEOCINO SILVESTRE',
        '2022-03-07'::date,
        83.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        83.33,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2061339: IVAN FRANCISCO DE PAULA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 2061339: IVAN FRANCISCO DE PAULA ',
        'CARNe - 2061339: IVAN FRANCISCO DE PAULA ',
        '2022-03-07'::date,
        54.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        54.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-07'::date,
        237.38,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        237.38,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4800: MARIA APARECIDA MEDEIROS DE FREITAS ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4800: MARIA APARECIDA MEDEIROS DE FREITAS ',
        'CARNe - 4800: MARIA APARECIDA MEDEIROS DE FREITAS ',
        '2022-03-07'::date,
        80.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        80.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - SOLoTICA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - SOLoTICA: COMPRA DE LENTES',
        'LENTES - SOLoTICA: COMPRA DE LENTES',
        '2022-03-07'::date,
        92.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        92.0,
        'pago'::status_parcela,
        92.0,
        '2022-03-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS DeBITO      ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        '2022-03-07'::date,
        813.15,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-07'::date,
        813.15,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: PAULO CeSAR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: PAULO CeSAR',
        'SALaRIO - SALaRIO: PAULO CeSAR',
        '2022-03-08'::date,
        400.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        1.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1.82,
        'pago'::status_parcela,
        1.82,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: EAG...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: EAGLE GRAMPO GALVANIZ',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: EAGLE GRAMPO GALVANIZ',
        '2022-03-08'::date,
        7.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        7.0,
        'pago'::status_parcela,
        7.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        420.01,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        420.01,
        'pago'::status_parcela,
        420.01,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        67.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        67.3,
        'pago'::status_parcela,
        67.3,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5136: FABRiCIO VITOR SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5136: FABRiCIO VITOR SANTOS',
        'VENDAS DINHEIRO - 5136: FABRiCIO VITOR SANTOS',
        '2022-03-08'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4222: ROSELAINE FIRMINO DE OLIVEIRA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4222: ROSELAINE FIRMINO DE OLIVEIRA ',
        'CARNe - 4222: ROSELAINE FIRMINO DE OLIVEIRA ',
        '2022-03-08'::date,
        109.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        109.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        818.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        818.11,
        'pago'::status_parcela,
        818.11,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.32,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.32,
        'pago'::status_parcela,
        0.32,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: ALDENIR PAULA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: ALDENIR PAULA ',
        'SALaRIO - SALaRIO: ALDENIR PAULA ',
        '2022-03-08'::date,
        720.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        720.0,
        'pago'::status_parcela,
        720.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: ARIANI DIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: ARIANI DIAS',
        'SALaRIO - SALaRIO: ARIANI DIAS',
        '2022-03-08'::date,
        778.55,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        778.55,
        'pago'::status_parcela,
        778.55,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        34.65,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        34.65,
        'pago'::status_parcela,
        34.65,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ALDENIR PAULA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: ALDENIR PAULA',
        'VALE TRANSPORTE - VALE TRANSPORTE: ALDENIR PAULA',
        '2022-03-08'::date,
        278.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        278.2,
        'pago'::status_parcela,
        278.2,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-08'::date,
        3.78,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        3.78,
        'pago'::status_parcela,
        3.78,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- MONTAGENS - oTICA INARa ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MONTAGENS - oTICA INARa ',
        'MONTAGENS - oTICA INARa ',
        '2022-03-08'::date,
        85.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        85.0,
        'pago'::status_parcela,
        85.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.04,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.04,
        'pago'::status_parcela,
        0.04,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 1236: CARLOS ROBERTO DE ARAuJO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 1236: CARLOS ROBERTO DE ARAuJO ',
        'CARNe - 1236: CARLOS ROBERTO DE ARAuJO ',
        '2022-03-08'::date,
        113.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        113.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1913: PATRiCIA FRANCISCA DE SOUS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 1913: PATRiCIA FRANCISCA DE SOUSA',
        'VENDAS DINHEIRO - 1913: PATRiCIA FRANCISCA DE SOUSA',
        '2022-03-08'::date,
        220.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        220.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        323.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        323.82,
        'pago'::status_parcela,
        323.82,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 5091: SANDRA DOS SANTOS DAMIaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 5091: SANDRA DOS SANTOS DAMIaO',
        'CARNe - 5091: SANDRA DOS SANTOS DAMIaO',
        '2022-03-08'::date,
        30.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        30.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - 08/03 12:10 CASA ROLLU                ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - 08/03 12:10 CASA ROLLU                ',
        'PAPELARIA - 08/03 12:10 CASA ROLLU                ',
        '2022-03-08'::date,
        15.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 1553: RAIMUNDA BATISTA LEITE DE BRITO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 1553: RAIMUNDA BATISTA LEITE DE BRITO',
        'CARNe - 1553: RAIMUNDA BATISTA LEITE DE BRITO',
        '2022-03-08'::date,
        130.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        130.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SALARIO - SALaRIO: YASMIN SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALARIO - SALaRIO: YASMIN SANTOS',
        'SALARIO - SALaRIO: YASMIN SANTOS',
        '2022-03-08'::date,
        720.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        720.0,
        'pago'::status_parcela,
        720.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-08'::date,
        6.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        6.3,
        'pago'::status_parcela,
        6.3,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        0.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.97,
        'pago'::status_parcela,
        0.97,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        81.98,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        81.98,
        'pago'::status_parcela,
        81.98,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMISSaO - COMISSaO: NATHALIA CAROLINA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMISSaO - COMISSaO: NATHALIA CAROLINA ',
        'COMISSaO - COMISSaO: NATHALIA CAROLINA ',
        '2022-03-08'::date,
        962.26,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        962.26,
        'pago'::status_parcela,
        962.26,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: ENV...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: ENVELOPE SACO BCO ',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: ENVELOPE SACO BCO ',
        '2022-03-08'::date,
        15.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS oTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS oTICOS EIRELI: COMPRA DE LENTES',
        'LENTES - BRASLAB PRODUTOS oTICOS EIRELI: COMPRA DE LENTES',
        '2022-03-08'::date,
        489.62,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        489.62,
        'pago'::status_parcela,
        489.62,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4772: DAIANA LAURINDA RIBEIRO DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4772: DAIANA LAURINDA RIBEIRO DA SILVA',
        'CARNe - 4772: DAIANA LAURINDA RIBEIRO DA SILVA',
        '2022-03-08'::date,
        36.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        36.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        15.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        15.6,
        'pago'::status_parcela,
        15.6,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: MARGARINA E PaO FRAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - SUPERMERCADO VERAN: MARGARINA E PaO FRANCeS',
        'MERCADO - SUPERMERCADO VERAN: MARGARINA E PaO FRANCeS',
        '2022-03-08'::date,
        10.98,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        10.98,
        'pago'::status_parcela,
        10.98,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1810: MARIA APARECIDA LOPES TA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 1810: MARIA APARECIDA LOPES TAVARES',
        'RESTANTE DO SINAL - 1810: MARIA APARECIDA LOPES TAVARES',
        '2022-03-08'::date,
        130.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        130.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        446.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        446.03,
        'pago'::status_parcela,
        446.03,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 3823: MARIA APARECIDA DA CONCEIcaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 3823: MARIA APARECIDA DA CONCEIcaO',
        'CARNe - 3823: MARIA APARECIDA DA CONCEIcaO',
        '2022-03-08'::date,
        118.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        118.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: LARISSA DIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: LARISSA DIAS',
        'SALaRIO - SALaRIO: LARISSA DIAS',
        '2022-03-08'::date,
        440.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        440.0,
        'pago'::status_parcela,
        440.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-08'::date,
        204.7,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        204.7,
        'pago'::status_parcela,
        204.7,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE MACE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE MACEDO',
        'VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE MACEDO',
        '2022-03-08'::date,
        260.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        260.0,
        'pago'::status_parcela,
        260.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5139: ATILAS DE CAMARGO MARTINS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5139: ATILAS DE CAMARGO MARTINS',
        'VENDAS DINHEIRO - 5139: ATILAS DE CAMARGO MARTINS',
        '2022-03-08'::date,
        650.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        650.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-08'::date,
        5423.52,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        5423.52,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS DeBITO      ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        '2022-03-08'::date,
        839.17,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        839.17,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1910: VANESSA ANTUNES DA ROCHA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 1910: VANESSA ANTUNES DA ROCHA ',
        'VENDAS DINHEIRO - 1910: VANESSA ANTUNES DA ROCHA ',
        '2022-03-08'::date,
        50.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.36,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.36,
        'pago'::status_parcela,
        0.36,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CONSERTO - RESTAURO oTICA: CONSERTO oCULOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        '2022-03-08'::date,
        30.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        34.17,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        34.17,
        'pago'::status_parcela,
        34.17,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5137: MARIA APARECIDA DE ALENCAR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5137: MARIA APARECIDA DE ALENCAR',
        'VENDAS DINHEIRO - 5137: MARIA APARECIDA DE ALENCAR',
        '2022-03-08'::date,
        200.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: PAULO CeSAR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: PAULO CeSAR',
        'VALE TRANSPORTE - VALE TRANSPORTE: PAULO CeSAR',
        '2022-03-08'::date,
        260.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        260.0,
        'pago'::status_parcela,
        260.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMISSaO - COMISSaO: ARIANI DIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMISSaO - COMISSaO: ARIANI DIAS',
        'COMISSaO - COMISSaO: ARIANI DIAS',
        '2022-03-08'::date,
        1561.65,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1561.65,
        'pago'::status_parcela,
        1561.65,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        779.52,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        779.52,
        'pago'::status_parcela,
        779.52,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        46.88,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        46.88,
        'pago'::status_parcela,
        46.88,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO DIVULGAcaO: ZAINE SIQUEIRA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO DIVULGAcaO: ZAINE SIQUEIRA ',
        'SALaRIO - SALaRIO DIVULGAcaO: ZAINE SIQUEIRA ',
        '2022-03-08'::date,
        625.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        625.0,
        'pago'::status_parcela,
        625.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.08,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.08,
        'pago'::status_parcela,
        0.08,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMISSaO - COMISSaO: ALDENIR PAULA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMISSaO - COMISSaO: ALDENIR PAULA ',
        'COMISSaO - COMISSaO: ALDENIR PAULA ',
        '2022-03-08'::date,
        25.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        25.0,
        'pago'::status_parcela,
        25.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        592.31,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        592.31,
        'pago'::status_parcela,
        592.31,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: PAULO CeS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: PAULO CeSAR - MAUa',
        'VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: PAULO CeSAR - MAUa',
        '2022-03-08'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: EDUARDO 2° QUINZ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'GASTO COM MeDICOS - OPTOMETRISTA: EDUARDO 2° QUINZ. FEVEREIRO',
        'GASTO COM MeDICOS - OPTOMETRISTA: EDUARDO 2° QUINZ. FEVEREIRO',
        '2022-03-08'::date,
        1840.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1840.0,
        'pago'::status_parcela,
        1840.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALARIO - SALaRIO 2/2: ALINE CRISTINA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALARIO - SALaRIO 2/2: ALINE CRISTINA ',
        'SALARIO - SALaRIO 2/2: ALINE CRISTINA ',
        '2022-03-08'::date,
        626.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        626.5,
        'pago'::status_parcela,
        626.5,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - ELO',
        'TAXA DE VENDAS CARTaO - ELO',
        '2022-03-08'::date,
        2.53,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        2.53,
        'pago'::status_parcela,
        2.53,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 4900: MARIA JOSe SANTOS SANTAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 4900: MARIA JOSe SANTOS SANTANA LIECHTI',
        'RESTANTE DO SINAL - 4900: MARIA JOSe SANTOS SANTANA LIECHTI',
        '2022-03-08'::date,
        520.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        520.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SALARIO - SALaRIO DIVULGAcaO: TAMIRES SOARES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALARIO - SALaRIO DIVULGAcaO: TAMIRES SOARES',
        'SALARIO - SALaRIO DIVULGAcaO: TAMIRES SOARES',
        '2022-03-08'::date,
        550.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        550.0,
        'pago'::status_parcela,
        550.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: YASMIN SANTOS ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: YASMIN SANTOS ',
        'VALE TRANSPORTE - VALE TRANSPORTE: YASMIN SANTOS ',
        '2022-03-08'::date,
        403.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        403.0,
        'pago'::status_parcela,
        403.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES       ',
        '2022-03-08'::date,
        657.48,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        657.48,
        'pago'::status_parcela,
        657.48,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        73.57,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        73.57,
        'pago'::status_parcela,
        73.57,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.03,
        'pago'::status_parcela,
        0.03,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        1.52,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1.52,
        'pago'::status_parcela,
        1.52,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-08'::date,
        3.21,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        3.21,
        'pago'::status_parcela,
        3.21,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-08'::date,
        241.51,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        241.51,
        'pago'::status_parcela,
        241.51,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMISSaO - COMISSaO: ALESSA BISPO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMISSaO - COMISSaO: ALESSA BISPO',
        'COMISSaO - COMISSaO: ALESSA BISPO',
        '2022-03-08'::date,
        6.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        6.0,
        'pago'::status_parcela,
        6.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        94.44,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        94.44,
        'pago'::status_parcela,
        94.44,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: JOCICREIDE MACEDO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: JOCICREIDE MACEDO',
        'SALaRIO - SALaRIO: JOCICREIDE MACEDO',
        '2022-03-08'::date,
        2998.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        2998.0,
        'pago'::status_parcela,
        2998.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4089: SANDRA DOS SANTOS DAMIaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4089: SANDRA DOS SANTOS DAMIaO',
        'CARNe - 4089: SANDRA DOS SANTOS DAMIaO',
        '2022-03-08'::date,
        95.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        95.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-08'::date,
        14.87,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        14.87,
        'pago'::status_parcela,
        14.87,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ALESSA BISPO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: ALESSA BISPO',
        'VALE TRANSPORTE - VALE TRANSPORTE: ALESSA BISPO',
        '2022-03-08'::date,
        20.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO 1/2: ALINE CRISTINA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO 1/2: ALINE CRISTINA ',
        'SALaRIO - SALaRIO 1/2: ALINE CRISTINA ',
        '2022-03-08'::date,
        626.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        626.5,
        'pago'::status_parcela,
        626.5,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ARIANI DIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - VALE TRANSPORTE: ARIANI DIAS',
        'VALE TRANSPORTE - VALE TRANSPORTE: ARIANI DIAS',
        '2022-03-08'::date,
        488.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        488.8,
        'pago'::status_parcela,
        488.8,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-08'::date,
        0.07,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        0.07,
        'pago'::status_parcela,
        0.07,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: ALESSA BISPO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: ALESSA BISPO',
        'SALaRIO - SALaRIO: ALESSA BISPO',
        '2022-03-08'::date,
        250.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        250.0,
        'pago'::status_parcela,
        250.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - 08/03 12:05 CASA ROLLU                ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - 08/03 12:05 CASA ROLLU                ',
        'PAPELARIA - 08/03 12:05 CASA ROLLU                ',
        '2022-03-08'::date,
        7.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        7.0,
        'pago'::status_parcela,
        7.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5145: JuLIO CeSAR LOURENcO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5145: JuLIO CeSAR LOURENcO',
        'VENDAS DINHEIRO - 5145: JuLIO CeSAR LOURENcO',
        '2022-03-08'::date,
        60.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        60.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS oTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS oTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS oTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        4.56,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        4.56,
        'pago'::status_parcela,
        4.56,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: NATHALIA CAROLINA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SALaRIO - SALaRIO: NATHALIA CAROLINA',
        'SALaRIO - SALaRIO: NATHALIA CAROLINA',
        '2022-03-08'::date,
        1065.74,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1065.74,
        'pago'::status_parcela,
        1065.74,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        4.16,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        4.16,
        'pago'::status_parcela,
        4.16,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMISSaO - COMISSaO: TAMIRES SOARES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMISSaO - COMISSaO: TAMIRES SOARES',
        'COMISSaO - COMISSaO: TAMIRES SOARES',
        '2022-03-08'::date,
        78.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        78.0,
        'pago'::status_parcela,
        78.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: GLEICE APARECIDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'GASTO COM MeDICOS - OPTOMETRISTA: GLEICE APARECIDA',
        'GASTO COM MeDICOS - OPTOMETRISTA: GLEICE APARECIDA',
        '2022-03-08'::date,
        900.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        900.0,
        'pago'::status_parcela,
        900.0,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: JUROS/MULTAS',
        '2022-03-08'::date,
        1.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-08'::date,
        1.9,
        'pago'::status_parcela,
        1.9,
        '2022-03-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - 09/03 19:50 PAG*AUTOPOSTODIVISAU    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMBUSTIVEL - 09/03 19:50 PAG*AUTOPOSTODIVISAU      ',
        'COMBUSTIVEL - 09/03 19:50 PAG*AUTOPOSTODIVISAU      ',
        '2022-03-09'::date,
        100.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4645: SELMA DE ALBUQUERQUE DOMINGOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4645: SELMA DE ALBUQUERQUE DOMINGOS',
        'CARNe - 4645: SELMA DE ALBUQUERQUE DOMINGOS',
        '2022-03-09'::date,
        112.75,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        112.75,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-09'::date,
        1374.74,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        1374.74,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4884: EDUARDO DA SILVA SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4884: EDUARDO DA SILVA SANTOS',
        'CARNe - 4884: EDUARDO DA SILVA SANTOS',
        '2022-03-09'::date,
        100.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MANUTENcaO - 09/03 11:44 FINAMIX                  ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MANUTENcaO - 09/03 11:44 FINAMIX                   ',
        'MANUTENcaO - 09/03 11:44 FINAMIX                   ',
        '2022-03-09'::date,
        239.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        239.0,
        'pago'::status_parcela,
        239.0,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-09'::date,
        5.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        5.3,
        'pago'::status_parcela,
        5.3,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4189: ROSANA DOS SANTOS ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4189: ROSANA DOS SANTOS ',
        'CARNe - 4189: ROSANA DOS SANTOS ',
        '2022-03-09'::date,
        65.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        65.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MANUTENcaO - 09/03 11:33 SODIMAC                  ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MANUTENcaO - 09/03 11:33 SODIMAC                   ',
        'MANUTENcaO - 09/03 11:33 SODIMAC                   ',
        '2022-03-09'::date,
        300.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        300.8,
        'pago'::status_parcela,
        300.8,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS DeBITO      ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        '2022-03-09'::date,
        944.42,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        944.42,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-09'::date,
        3.28,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        3.28,
        'pago'::status_parcela,
        3.28,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 3881: BERINeIA FERREIRA DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 3881: BERINeIA FERREIRA DA SILVA',
        'CARNe - 3881: BERINeIA FERREIRA DA SILVA',
        '2022-03-09'::date,
        153.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        153.3,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-09'::date,
        51.94,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        51.94,
        'pago'::status_parcela,
        51.94,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-09'::date,
        2.15,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        2.15,
        'pago'::status_parcela,
        2.15,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 1599: EDNA APARECIDA DE SOUZA CASTRO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 1599: EDNA APARECIDA DE SOUZA CASTRO',
        'CARNe - 1599: EDNA APARECIDA DE SOUZA CASTRO',
        '2022-03-09'::date,
        42.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        42.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: LARISSA E...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: LARISSA E ZAINE - DIVULGAcaO NOS BAIRROS',
        'VALE TRANSPORTE - PAGAMENTO DE CONDUcaO: LARISSA E ZAINE - DIVULGAcaO NOS BAIRROS',
        '2022-03-09'::date,
        20.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PADARIA RENASCE: PaO FRANCeS (ZAINE SIQU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - PADARIA RENASCE: PaO FRANCeS (ZAINE SIQUEIRA)',
        'MERCADO - PADARIA RENASCE: PaO FRANCeS (ZAINE SIQUEIRA)',
        '2022-03-09'::date,
        5.23,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        5.23,
        'pago'::status_parcela,
        5.23,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1881: LEILA MARISA SERRANO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 1881: LEILA MARISA SERRANO',
        'RESTANTE DO SINAL - 1881: LEILA MARISA SERRANO',
        '2022-03-09'::date,
        400.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        400.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2058241: VILMA BALBINO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 2058241: VILMA BALBINO',
        'CARNe - 2058241: VILMA BALBINO',
        '2022-03-09'::date,
        119.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        119.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - ELO',
        'TAXA DE VENDAS CARTaO - ELO',
        '2022-03-09'::date,
        66.36,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        66.36,
        'pago'::status_parcela,
        66.36,
        '2022-03-09'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4570: LENIVALDA RAMOS MONTEIRO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4570: LENIVALDA RAMOS MONTEIRO',
        'CARNe - 4570: LENIVALDA RAMOS MONTEIRO',
        '2022-03-09'::date,
        78.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-09'::date,
        78.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4446: NEUZA RODRIGUES DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4446: NEUZA RODRIGUES DA SILVA',
        'CARNe - 4446: NEUZA RODRIGUES DA SILVA',
        '2022-03-10'::date,
        65.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        65.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- FRANQUIA - ACERTO FRANQUIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FRANQUIA - ACERTO FRANQUIA',
        'FRANQUIA - ACERTO FRANQUIA',
        '2022-03-10'::date,
        380.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        380.0,
        'pago'::status_parcela,
        380.0,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-10'::date,
        9.18,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        9.18,
        'pago'::status_parcela,
        9.18,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4928: AZENILDE FERREIRA DE ABREU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4928: AZENILDE FERREIRA DE ABREU',
        'CARNe - 4928: AZENILDE FERREIRA DE ABREU',
        '2022-03-10'::date,
        87.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        87.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4470: MARIA CECiLIA PEREIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4470: MARIA CECiLIA PEREIRA',
        'CARNe - 4470: MARIA CECiLIA PEREIRA',
        '2022-03-10'::date,
        53.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        53.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 3925: LUCI MARLENE MENEZES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 3925: LUCI MARLENE MENEZES',
        'CARNe - 3925: LUCI MARLENE MENEZES',
        '2022-03-10'::date,
        111.7,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        111.7,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-10'::date,
        101.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        101.5,
        'pago'::status_parcela,
        101.5,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-10'::date,
        30.52,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        30.52,
        'pago'::status_parcela,
        30.52,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5153: APARECIDA MARIA DA SILVA D...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5153: APARECIDA MARIA DA SILVA DIAS',
        'VENDAS DINHEIRO - 5153: APARECIDA MARIA DA SILVA DIAS',
        '2022-03-10'::date,
        50.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5156: ARISETE DE SOUZA LIMA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5156: ARISETE DE SOUZA LIMA',
        'VENDAS DINHEIRO - 5156: ARISETE DE SOUZA LIMA',
        '2022-03-10'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS DeBITO      ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        '2022-03-10'::date,
        2179.49,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        2179.49,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - ELO',
        'TAXA DE VENDAS CARTaO - ELO',
        '2022-03-10'::date,
        20.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        20.33,
        'pago'::status_parcela,
        20.33,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- FRANQUIA - ACERTO FRANQUIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FRANQUIA - ACERTO FRANQUIA',
        'FRANQUIA - ACERTO FRANQUIA',
        '2022-03-10'::date,
        1130.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        1130.0,
        'pago'::status_parcela,
        1130.0,
        '2022-03-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 5108: BIANCA MURATORE RODRIGUE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 5108: BIANCA MURATORE RODRIGUES',
        'RESTANTE DO SINAL - 5108: BIANCA MURATORE RODRIGUES',
        '2022-03-10'::date,
        70.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        70.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5154: NIUZeLIA SILVA DE ALMEIDA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5154: NIUZeLIA SILVA DE ALMEIDA ',
        'VENDAS DINHEIRO - 5154: NIUZeLIA SILVA DE ALMEIDA ',
        '2022-03-10'::date,
        500.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-10'::date,
        1518.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        1518.82,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4446: NEUZA RODRIGUES DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4446: NEUZA RODRIGUES DA SILVA',
        'CARNe - 4446: NEUZA RODRIGUES DA SILVA',
        '2022-03-10'::date,
        59.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        59.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 1573: ROSA MARIA MARTINS DE SOUSA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 1573: ROSA MARIA MARTINS DE SOUSA',
        'CARNe - 1573: ROSA MARIA MARTINS DE SOUSA',
        '2022-03-10'::date,
        56.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        56.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4847: SUZANA ANDRADE DOS SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4847: SUZANA ANDRADE DOS SANTOS',
        'CARNe - 4847: SUZANA ANDRADE DOS SANTOS',
        '2022-03-10'::date,
        128.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        128.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5158: ULISSES ROBERTO DOS SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5158: ULISSES ROBERTO DOS SANTOS',
        'VENDAS DINHEIRO - 5158: ULISSES ROBERTO DOS SANTOS',
        '2022-03-10'::date,
        350.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        350.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5155: ADELAIDE MARIA DOS SANTOS ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5155: ADELAIDE MARIA DOS SANTOS ',
        'VENDAS DINHEIRO - 5155: ADELAIDE MARIA DOS SANTOS ',
        '2022-03-10'::date,
        100.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-10'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS DeBITO      ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        'VENDAS NO CARTaO - CIELO VENDAS DeBITO      ',
        '2022-03-11'::date,
        398.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        398.97,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - PAG* JOSUE BATISTA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE JUNIOR - PAG* JOSUE BATISTA ',
        'PRO-LABORE JUNIOR - PAG* JOSUE BATISTA ',
        '2022-03-11'::date,
        24.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-11'::date,
        0.48,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.48,
        'pago'::status_parcela,
        0.48,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-11'::date,
        0.01,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.01,
        'pago'::status_parcela,
        0.01,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - 11/03 20:09 LITORAL PARK ADMI ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE JUNIOR - 11/03 20:09 LITORAL PARK ADMI         ',
        'PRO-LABORE JUNIOR - 11/03 20:09 LITORAL PARK ADMI         ',
        '2022-03-11'::date,
        9.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        9.0,
        'pago'::status_parcela,
        9.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA:...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA: JUROS/MULTAS',
        'SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA: JUROS/MULTAS',
        '2022-03-11'::date,
        5.67,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        5.67,
        'pago'::status_parcela,
        5.67,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - 11/03 16:02 PAG*CENTRALDASCORE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE JUNIOR - 11/03 16:02 PAG*CENTRALDASCORES       ',
        'PRO-LABORE JUNIOR - 11/03 16:02 PAG*CENTRALDASCORES       ',
        '2022-03-11'::date,
        45.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        45.0,
        'pago'::status_parcela,
        45.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - 11/03 12:59 PAG*AUTOPOSTODIVISAU    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMBUSTIVEL - 11/03 12:59 PAG*AUTOPOSTODIVISAU      ',
        'COMBUSTIVEL - 11/03 12:59 PAG*AUTOPOSTODIVISAU      ',
        '2022-03-11'::date,
        40.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        40.0,
        'pago'::status_parcela,
        40.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - 11/03 18:37 CENTRO AUTOMOTIVO SA    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMBUSTIVEL - 11/03 18:37 CENTRO AUTOMOTIVO SA      ',
        'COMBUSTIVEL - 11/03 18:37 CENTRO AUTOMOTIVO SA      ',
        '2022-03-11'::date,
        40.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        40.0,
        'pago'::status_parcela,
        40.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: PaO FRANCeS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS',
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS',
        '2022-03-11'::date,
        0.59,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.59,
        'pago'::status_parcela,
        0.59,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-11'::date,
        22.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        22.2,
        'pago'::status_parcela,
        22.2,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-11'::date,
        1.29,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        1.29,
        'pago'::status_parcela,
        1.29,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - MAUAMI BAZAR E PAPELARIA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - MAUAMI BAZAR E PAPELARIA LTDA',
        'PAPELARIA - MAUAMI BAZAR E PAPELARIA LTDA',
        '2022-03-11'::date,
        6.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        6.6,
        'pago'::status_parcela,
        6.6,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - VISA',
        'TAXA DE VENDAS CARTaO - VISA',
        '2022-03-11'::date,
        0.57,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.57,
        'pago'::status_parcela,
        0.57,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        '2022-03-11'::date,
        380.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        380.0,
        'pago'::status_parcela,
        380.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: PaO FRANCeS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS',
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS',
        '2022-03-11'::date,
        4.55,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        4.55,
        'pago'::status_parcela,
        4.55,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-11'::date,
        2.34,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        2.34,
        'pago'::status_parcela,
        2.34,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1926: MARA TEODORO DE SOUZA ROME...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 1926: MARA TEODORO DE SOUZA ROMEIRO',
        'VENDAS DINHEIRO - 1926: MARA TEODORO DE SOUZA ROMEIRO',
        '2022-03-11'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-11'::date,
        14.87,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        14.87,
        'pago'::status_parcela,
        14.87,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-11'::date,
        0.16,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.16,
        'pago'::status_parcela,
        0.16,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        '2022-03-11'::date,
        300.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        300.0,
        'pago'::status_parcela,
        300.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - MASTERCARD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        'TAXA DE VENDAS CARTaO - MASTERCARD',
        '2022-03-11'::date,
        1.65,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        1.65,
        'pago'::status_parcela,
        1.65,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - ROSE 2/2: COMPRA DE ARMAcoES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ARMAcoES - ROSE 2/2: COMPRA DE ARMAcoES',
        'ARMAcoES - ROSE 2/2: COMPRA DE ARMAcoES',
        '2022-03-11'::date,
        328.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        328.0,
        'pago'::status_parcela,
        328.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOB...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOBINA TeRMICA',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BOBINA TeRMICA',
        '2022-03-11'::date,
        15.45,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        15.45,
        'pago'::status_parcela,
        15.45,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1927: ERON SOUZA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 1927: ERON SOUZA',
        'VENDAS DINHEIRO - 1927: ERON SOUZA',
        '2022-03-11'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CONTABILIDADE - KONSEP CONTABILIDADE & CONSULTORIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONTABILIDADE - KONSEP CONTABILIDADE & CONSULTORIA LTDA',
        'CONTABILIDADE - KONSEP CONTABILIDADE & CONSULTORIA LTDA',
        '2022-03-11'::date,
        537.13,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        537.13,
        'pago'::status_parcela,
        537.13,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS',
        '2022-03-11'::date,
        6.19,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        6.19,
        'pago'::status_parcela,
        6.19,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- CONSERTO - RESTAURO oTICA: CONSERTO oCULOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        '2022-03-11'::date,
        15.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        'LENTES - OPTOTAL HOYA LTDA: JUROS/MULTAS',
        '2022-03-11'::date,
        0.02,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        0.02,
        'pago'::status_parcela,
        0.02,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- SISTEMA - REGISTRO PONTO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SISTEMA - REGISTRO PONTO',
        'SISTEMA - REGISTRO PONTO',
        '2022-03-11'::date,
        78.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        78.0,
        'pago'::status_parcela,
        78.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- MONTAGENS - LABORAToRIO THC MONTAGEM E CONSERTO: T...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MONTAGENS - LABORAToRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO ',
        'MONTAGENS - LABORAToRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO ',
        '2022-03-11'::date,
        318.27,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        318.27,
        'pago'::status_parcela,
        318.27,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-11'::date,
        78.71,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        78.71,
        'pago'::status_parcela,
        78.71,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE VENDAS CARTaO - ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE VENDAS CARTaO - ELO',
        'TAXA DE VENDAS CARTaO - ELO',
        '2022-03-11'::date,
        24.96,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        24.96,
        'pago'::status_parcela,
        24.96,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA',
        'SISTEMA - PASSWORD INTERATIVA BI E SOFTWARES LTDA',
        '2022-03-11'::date,
        185.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        185.0,
        'pago'::status_parcela,
        185.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-11'::date,
        243.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        243.2,
        'pago'::status_parcela,
        243.2,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- CONTABILIDADE - KONSEP CONTABILIDADE E CONSULTORIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONTABILIDADE - KONSEP CONTABILIDADE E CONSULTORIA LTDA',
        'CONTABILIDADE - KONSEP CONTABILIDADE E CONSULTORIA LTDA',
        '2022-03-11'::date,
        537.13,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        537.13,
        'pago'::status_parcela,
        537.13,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - CENTRO MeDICO CLUBE DS - SICOO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'GASTO COM MeDICOS - CENTRO MeDICO CLUBE DS - SICOOB ',
        'GASTO COM MeDICOS - CENTRO MeDICO CLUBE DS - SICOOB ',
        '2022-03-11'::date,
        300.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        300.0,
        'pago'::status_parcela,
        300.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - 11/03 10:14 ASSAI ATACADISTA    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE TATY - 11/03 10:14 ASSAI ATACADISTA          ',
        'PRO-LABORE TATY - 11/03 10:14 ASSAI ATACADISTA          ',
        '2022-03-11'::date,
        282.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        282.6,
        'pago'::status_parcela,
        282.6,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - 11/03 12:54 PAG*AUTOPOSTODIVISAU    ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMBUSTIVEL - 11/03 12:54 PAG*AUTOPOSTODIVISAU      ',
        'COMBUSTIVEL - 11/03 12:54 PAG*AUTOPOSTODIVISAU      ',
        '2022-03-11'::date,
        20.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        20.97,
        'pago'::status_parcela,
        20.97,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS NO CARTaO - CIELO VENDAS CReDITO     ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        'VENDAS NO CARTaO - CIELO VENDAS CReDITO     ',
        '2022-03-11'::date,
        415.04,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        415.04,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5162: MARcAL FERREIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5162: MARcAL FERREIRA',
        'VENDAS DINHEIRO - 5162: MARcAL FERREIRA',
        '2022-03-11'::date,
        53.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        53.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS: JUROS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS: JUROS/MULTAS',
        'MiDIAS SOCIAIS - CAMPANHA - SAuDE DOS OLHOS: JUROS/MULTAS',
        '2022-03-11'::date,
        7.85,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        7.85,
        'pago'::status_parcela,
        7.85,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: MARKO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'GASTO COM MeDICOS - OPTOMETRISTA: MARKO',
        'GASTO COM MeDICOS - OPTOMETRISTA: MARKO',
        '2022-03-11'::date,
        60.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        60.0,
        'pago'::status_parcela,
        60.0,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1930: MARIA ROSA DE LIMA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 1930: MARIA ROSA DE LIMA',
        'VENDAS DINHEIRO - 1930: MARIA ROSA DE LIMA',
        '2022-03-11'::date,
        30.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        30.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - 11/03 15:53 LIDIA PALMA       ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE JUNIOR - 11/03 15:53 LIDIA PALMA               ',
        'PRO-LABORE JUNIOR - 11/03 15:53 LIDIA PALMA               ',
        '2022-03-11'::date,
        26.42,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-11'::date,
        26.42,
        'pago'::status_parcela,
        26.42,
        '2022-03-11'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - TOP LAR: MARSHMALLOW 250G...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRAS PARA LOJA - TOP LAR: MARSHMALLOW 250G',
        'COMPRAS PARA LOJA - TOP LAR: MARSHMALLOW 250G',
        '2022-03-12'::date,
        8.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        8.5,
        'pago'::status_parcela,
        8.5,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5166: MITUCO OTUYAMA TAKAHASHI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5166: MITUCO OTUYAMA TAKAHASHI',
        'VENDAS DINHEIRO - 5166: MITUCO OTUYAMA TAKAHASHI',
        '2022-03-12'::date,
        850.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        850.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CONSERTO - RESTAURO oTICA: CONSERTO oCULOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        'CONSERTO - RESTAURO oTICA: CONSERTO oCULOS',
        '2022-03-12'::date,
        15.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 5085: DIMAS VIANA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 5085: DIMAS VIANA ',
        'RESTANTE DO SINAL - 5085: DIMAS VIANA ',
        '2022-03-12'::date,
        392.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        392.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: BOLO DE CHOCOLATE, L...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - SUPERMERCADO VERAN: BOLO DE CHOCOLATE, LEITE INTEGRAL 1L, BOLO PULLMAN, PaO DE QUEIJO E PaO FRANCeS',
        'MERCADO - SUPERMERCADO VERAN: BOLO DE CHOCOLATE, LEITE INTEGRAL 1L, BOLO PULLMAN, PaO DE QUEIJO E PaO FRANCeS',
        '2022-03-12'::date,
        32.09,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        32.09,
        'pago'::status_parcela,
        32.09,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4745: ERICK SILVA DUARTE ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4745: ERICK SILVA DUARTE ',
        'CARNe - 4745: ERICK SILVA DUARTE ',
        '2022-03-12'::date,
        84.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        84.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - EMPoRIO DO REAL: BOLO PANCO, FOLHATA, TO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - EMPoRIO DO REAL: BOLO PANCO, FOLHATA, TORTINHA, TANG E PaO GALEGO',
        'MERCADO - EMPoRIO DO REAL: BOLO PANCO, FOLHATA, TORTINHA, TANG E PaO GALEGO',
        '2022-03-12'::date,
        26.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        26.5,
        'pago'::status_parcela,
        26.5,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - BMP UTILIDADES DOMeSTICAS S. A...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRAS PARA LOJA - BMP UTILIDADES DOMeSTICAS S. A.: REFRIGERANTE KUAT ',
        'COMPRAS PARA LOJA - BMP UTILIDADES DOMeSTICAS S. A.: REFRIGERANTE KUAT ',
        '2022-03-12'::date,
        7.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        7.99,
        'pago'::status_parcela,
        7.99,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2067377: EDSON SANTANA QUINTO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 2067377: EDSON SANTANA QUINTO',
        'CARNe - 2067377: EDSON SANTANA QUINTO',
        '2022-03-12'::date,
        116.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        116.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4034: ZENAIDE APARECIDA DE GOVEIA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 4034: ZENAIDE APARECIDA DE GOVEIA ',
        'CARNe - 4034: ZENAIDE APARECIDA DE GOVEIA ',
        '2022-03-12'::date,
        35.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        35.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 5123: JeSSICA APARECIDA DE OLI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 5123: JeSSICA APARECIDA DE OLIVEIRA',
        'RESTANTE DO SINAL - 5123: JeSSICA APARECIDA DE OLIVEIRA',
        '2022-03-12'::date,
        50.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5164: RAQUEL DE AZEVEDO ANDRADE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5164: RAQUEL DE AZEVEDO ANDRADE',
        'VENDAS DINHEIRO - 5164: RAQUEL DE AZEVEDO ANDRADE',
        '2022-03-12'::date,
        200.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 3877: JUCINEIDE SENA SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 3877: JUCINEIDE SENA SANTOS',
        'CARNe - 3877: JUCINEIDE SENA SANTOS',
        '2022-03-12'::date,
        95.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        95.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - BURGER KING: WHOPPER Q...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALMOcO - BURGER KING: WHOPPER Q',
        'ALMOcO - BURGER KING: WHOPPER Q',
        '2022-03-12'::date,
        38.7,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        38.7,
        'pago'::status_parcela,
        38.7,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: REFRIGERANTE FANTA G...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MERCADO - SUPERMERCADO VERAN: REFRIGERANTE FANTA GUARANa 2L',
        'MERCADO - SUPERMERCADO VERAN: REFRIGERANTE FANTA GUARANa 2L',
        '2022-03-12'::date,
        7.49,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        7.49,
        'pago'::status_parcela,
        7.49,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - ALMOcO EQUIPE ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALMOcO - ALMOcO EQUIPE ',
        'ALMOcO - ALMOcO EQUIPE ',
        '2022-03-12'::date,
        56.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        56.0,
        'pago'::status_parcela,
        56.0,
        '2022-03-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2064282: LUCIENE DO NASCIMENTO LUIZ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 2064282: LUCIENE DO NASCIMENTO LUIZ',
        'CARNe - 2064282: LUCIENE DO NASCIMENTO LUIZ',
        '2022-03-12'::date,
        85.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-12'::date,
        85.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 5025: FLaVIO AUGUSTO DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESTANTE DO SINAL - 5025: FLaVIO AUGUSTO DA SILVA',
        'RESTANTE DO SINAL - 5025: FLaVIO AUGUSTO DA SILVA',
        '2022-03-13'::date,
        150.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-13'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - 12/03 23:17 CENTRO AUTOMOTIVO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE JUNIOR - 12/03 23:17 CENTRO AUTOMOTIVO         ',
        'PRO-LABORE JUNIOR - 12/03 23:17 CENTRO AUTOMOTIVO         ',
        '2022-03-14'::date,
        12.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        12.99,
        'pago'::status_parcela,
        12.99,
        '2022-03-14'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 25055466: ANTÔNIO MARIM...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CARNe - 25055466: ANTÔNIO MARIM',
        'CARNe - 25055466: ANTÔNIO MARIM',
        '2022-03-14'::date,
        150.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 5179: ARLENE APARECIDA DE OLIVEI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'receber'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VENDAS DINHEIRO - 5179: ARLENE APARECIDA DE OLIVEIRA ',
        'VENDAS DINHEIRO - 5179: ARLENE APARECIDA DE OLIVEIRA ',
        '2022-03-14'::date,
        150.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - 12/03 11:25 REDE DE POSTOS          ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMBUSTIVEL - 12/03 11:25 REDE DE POSTOS            ',
        'COMBUSTIVEL - 12/03 11:25 REDE DE POSTOS            ',
        '2022-03-14'::date,
        30.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-03-14'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-14'::date,
        12.1,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        12.1,
        'pago'::status_parcela,
        12.1,
        '2022-03-14'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - 12/03 13:07 SANTA HELENA        ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE TATY - 12/03 13:07 SANTA HELENA              ',
        'PRO-LABORE TATY - 12/03 13:07 SANTA HELENA              ',
        '2022-03-14'::date,
        110.65,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        110.65,
        'pago'::status_parcela,
        110.65,
        '2022-03-14'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        'LENTES - OPTOTAL HOYA LTDA: COMPRA DE LENTES',
        '2022-03-14'::date,
        146.86,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-03-14'::date,
        146.86,
        'pago'::status_parcela,
        146.86,
        '2022-03-14'::date,
        NOW(),
        NOW()
    );
END $$;
