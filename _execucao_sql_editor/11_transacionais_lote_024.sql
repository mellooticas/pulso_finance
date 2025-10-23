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
        'CARNe - 2046833',
        'CARNe - 2046833',
        '2021-06-01'::date,
        81.66,
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
        '2021-06-01'::date,
        81.66,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL -  AUTO POSTO KIMURA         ...
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
        'COMBUSTIVEL -  AUTO POSTO KIMURA         ',
        'COMBUSTIVEL -  AUTO POSTO KIMURA         ',
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  ESKALA 318                ...
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
        'PRO-LABORE TATY -  ESKALA 318                ',
        'PRO-LABORE TATY -  ESKALA 318                ',
        '2021-06-01'::date,
        259.94,
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
        '2021-06-01'::date,
        259.94,
        'pago'::status_parcela,
        259.94,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  SBX MAUA COMERCIO         ...
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
        'PRO-LABORE TATY -  SBX MAUA COMERCIO         ',
        'PRO-LABORE TATY -  SBX MAUA COMERCIO         ',
        '2021-06-01'::date,
        189.92,
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
        '2021-06-01'::date,
        189.92,
        'pago'::status_parcela,
        189.92,
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        8.55,
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
        '2021-06-01'::date,
        8.55,
        'pago'::status_parcela,
        8.55,
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        1356.0,
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
        '2021-06-01'::date,
        1356.0,
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
        '2021-06-01'::date,
        3.47,
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
        '2021-06-01'::date,
        3.47,
        'pago'::status_parcela,
        3.47,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2882...
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
        'RESTANTE DO SINAL - 2882',
        'RESTANTE DO SINAL - 2882',
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  PAG*GOLDENPARK            ...
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
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        '2021-06-01'::date,
        14.0,
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
        '2021-06-01'::date,
        14.0,
        'pago'::status_parcela,
        14.0,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- JUROS - COBRANcA DE I.O.F.       ...
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
        'JUROS - COBRANcA DE I.O.F.       ',
        'JUROS - COBRANcA DE I.O.F.       ',
        '2021-06-01'::date,
        5.47,
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
        '2021-06-01'::date,
        5.47,
        'pago'::status_parcela,
        5.47,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO -  SUPERMERCADO VERAN LJ2 S...
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
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        '2021-06-01'::date,
        6.69,
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
        '2021-06-01'::date,
        6.69,
        'pago'::status_parcela,
        6.69,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - PAGAMENTO PABLO DESIGN...
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
        'MiDIAS SOCIAIS - PAGAMENTO PABLO DESIGN',
        'MiDIAS SOCIAIS - PAGAMENTO PABLO DESIGN',
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        350.0,
        'pago'::status_parcela,
        350.0,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2444...
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
        'RESTANTE DO SINAL - 2444',
        'RESTANTE DO SINAL - 2444',
        '2021-06-01'::date,
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
        '2021-06-01'::date,
        185.0,
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
        '2021-06-01'::date,
        15.87,
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
        '2021-06-01'::date,
        15.87,
        'pago'::status_parcela,
        15.87,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PRODUTOS DE LIMPEZA...
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
        'MERCADO - PRODUTOS DE LIMPEZA',
        'MERCADO - PRODUTOS DE LIMPEZA',
        '2021-06-01'::date,
        17.41,
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
        '2021-06-01'::date,
        17.41,
        'pago'::status_parcela,
        17.41,
        '2021-06-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3244...
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
        'RESTANTE DO SINAL - 3244',
        'RESTANTE DO SINAL - 3244',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        220.0,
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
        '2021-06-02'::date,
        10.11,
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
        '2021-06-02'::date,
        10.11,
        'pago'::status_parcela,
        10.11,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - JUROS/MULTA...
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
        'LENTES - JUROS/MULTA',
        'LENTES - JUROS/MULTA',
        '2021-06-02'::date,
        0.06,
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
        '2021-06-02'::date,
        0.06,
        'pago'::status_parcela,
        0.06,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        13.69,
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
        '2021-06-02'::date,
        13.69,
        'pago'::status_parcela,
        13.69,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        0.7,
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
        '2021-06-02'::date,
        0.7,
        'pago'::status_parcela,
        0.7,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSS - JUROS/MULTA...
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
        'INSS - JUROS/MULTA',
        'INSS - JUROS/MULTA',
        '2021-06-02'::date,
        37.23,
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
        '2021-06-02'::date,
        37.23,
        'pago'::status_parcela,
        37.23,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - COMPRA DE LENTES ...
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
        'LENTES - COMPRA DE LENTES ',
        'LENTES - COMPRA DE LENTES ',
        '2021-06-02'::date,
        1563.65,
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
        '2021-06-02'::date,
        1563.65,
        'pago'::status_parcela,
        1563.65,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        281.12,
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
        '2021-06-02'::date,
        281.12,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  PAG*GOLDENPARK            ...
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
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - JUROS/MULTA...
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
        'LENTES - JUROS/MULTA',
        'LENTES - JUROS/MULTA',
        '2021-06-02'::date,
        57.32,
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
        '2021-06-02'::date,
        57.32,
        'pago'::status_parcela,
        57.32,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3029...
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
        'RESTANTE DO SINAL - 3029',
        'RESTANTE DO SINAL - 3029',
        '2021-06-02'::date,
        88.33,
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
        '2021-06-02'::date,
        88.33,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2691...
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
        'RESTANTE DO SINAL - 2691',
        'RESTANTE DO SINAL - 2691',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1104: FERNANDA DONATELLI...
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
        'RESTANTE DO SINAL - 1104: FERNANDA DONATELLI',
        'RESTANTE DO SINAL - 1104: FERNANDA DONATELLI',
        '2021-06-02'::date,
        105.0,
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
        '2021-06-02'::date,
        105.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  LANC REST RIO MIN         ...
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
        'PRO-LABORE TATY -  LANC REST RIO MIN         ',
        'PRO-LABORE TATY -  LANC REST RIO MIN         ',
        '2021-06-02'::date,
        19.0,
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
        '2021-06-02'::date,
        19.0,
        'pago'::status_parcela,
        19.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: MAELY VASCONCELO...
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
        'GASTO COM MeDICOS - OPTOMETRISTA: MAELY VASCONCELOS ',
        'GASTO COM MeDICOS - OPTOMETRISTA: MAELY VASCONCELOS ',
        '2021-06-02'::date,
        1360.0,
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
        '2021-06-02'::date,
        1360.0,
        'pago'::status_parcela,
        1360.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI...
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
        'PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI',
        'PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI',
        '2021-06-02'::date,
        1028.7,
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
        '2021-06-02'::date,
        1028.7,
        'pago'::status_parcela,
        1028.7,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1103: FRANCISCO HENRIQUE...
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
        'VENDAS DINHEIRO - 1103: FRANCISCO HENRIQUE',
        'VENDAS DINHEIRO - 1103: FRANCISCO HENRIQUE',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNI...
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
        'PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNIOR',
        'PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNIOR',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        200.0,
        'pago'::status_parcela,
        200.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - TEMPERO MANERO...
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
        'PRO-LABORE TATY - TEMPERO MANERO',
        'PRO-LABORE TATY - TEMPERO MANERO',
        '2021-06-02'::date,
        13.4,
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
        '2021-06-02'::date,
        13.4,
        'pago'::status_parcela,
        13.4,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - PAGAMENTO DE REDES SOCIAIS...
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
        'MiDIAS SOCIAIS - PAGAMENTO DE REDES SOCIAIS',
        'MiDIAS SOCIAIS - PAGAMENTO DE REDES SOCIAIS',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        350.0,
        'pago'::status_parcela,
        350.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1101: IRENE CAROLINO VIANA...
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
        'VENDAS DINHEIRO - 1101: IRENE CAROLINO VIANA',
        'VENDAS DINHEIRO - 1101: IRENE CAROLINO VIANA',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        40.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE ...
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
        'VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE ',
        'VALE TRANSPORTE - VALE TRANSPORTE: JOCICREIDE ',
        '2021-06-02'::date,
        44.0,
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
        '2021-06-02'::date,
        44.0,
        'pago'::status_parcela,
        44.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNI...
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
        'PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNIOR',
        'PRO-LABORE JUNIOR - GILBERTO DE CAMARGO SILVA JUNIOR',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        3.18,
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
        '2021-06-02'::date,
        3.18,
        'pago'::status_parcela,
        3.18,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        1.63,
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
        '2021-06-02'::date,
        1.63,
        'pago'::status_parcela,
        1.63,
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        29.56,
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
        '2021-06-02'::date,
        29.56,
        'pago'::status_parcela,
        29.56,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSS - GPS: GUIA DA PREVIDeNCIA SOCIAL...
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
        'INSS - GPS: GUIA DA PREVIDeNCIA SOCIAL',
        'INSS - GPS: GUIA DA PREVIDeNCIA SOCIAL',
        '2021-06-02'::date,
        275.0,
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
        '2021-06-02'::date,
        275.0,
        'pago'::status_parcela,
        275.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00027206471870 ALEXANDRE G...
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
        'PIX - RECEBIDO -  00027206471870 ALEXANDRE G',
        'PIX - RECEBIDO -  00027206471870 ALEXANDRE G',
        '2021-06-02'::date,
        115.0,
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
        '2021-06-02'::date,
        115.0,
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
        '2021-06-02'::date,
        1455.65,
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
        '2021-06-02'::date,
        1455.65,
        'pago'::status_parcela,
        1455.65,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00040110854802 RASHELYDER ...
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
        'PIX - RECEBIDO -  00040110854802 RASHELYDER ',
        'PIX - RECEBIDO -  00040110854802 RASHELYDER ',
        '2021-06-02'::date,
        69.0,
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
        '2021-06-02'::date,
        69.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3285...
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
        'RESTANTE DO SINAL - 3285',
        'RESTANTE DO SINAL - 3285',
        '2021-06-02'::date,
        125.0,
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
        '2021-06-02'::date,
        125.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL -  AUTO POSTO MRP            ...
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
        'COMBUSTIVEL -  AUTO POSTO MRP            ',
        'COMBUSTIVEL -  AUTO POSTO MRP            ',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO -  SUPERMERCADO VERAN LJ2 S...
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
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        '2021-06-02'::date,
        17.41,
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
        '2021-06-02'::date,
        17.41,
        'pago'::status_parcela,
        17.41,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1097: ADRIANA DE MOURA SANTOS...
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
        'VENDAS DINHEIRO - 1097: ADRIANA DE MOURA SANTOS',
        'VENDAS DINHEIRO - 1097: ADRIANA DE MOURA SANTOS',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        0.01,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-02'::date,
        19.0,
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
        '2021-06-02'::date,
        19.0,
        'pago'::status_parcela,
        19.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - CLiNICA MeDICA HoRUS VISION...
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
        'GASTO COM MeDICOS - CLiNICA MeDICA HoRUS VISION',
        'GASTO COM MeDICOS - CLiNICA MeDICA HoRUS VISION',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSS - JUROS/MULTA...
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
        'INSS - JUROS/MULTA',
        'INSS - JUROS/MULTA',
        '2021-06-02'::date,
        58.32,
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
        '2021-06-02'::date,
        58.32,
        'pago'::status_parcela,
        58.32,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  TEMPERO MANERO SUZANO BR...
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
        'ALMOcO -  TEMPERO MANERO SUZANO BR',
        'ALMOcO -  TEMPERO MANERO SUZANO BR',
        '2021-06-02'::date,
        13.4,
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
        '2021-06-02'::date,
        13.4,
        'pago'::status_parcela,
        13.4,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1096: MIGUEL SABINO DA SILVA...
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
        'VENDAS DINHEIRO - 1096: MIGUEL SABINO DA SILVA',
        'VENDAS DINHEIRO - 1096: MIGUEL SABINO DA SILVA',
        '2021-06-02'::date,
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
        '2021-06-02'::date,
        0.01,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - GOOGLE - MEU NEGOCIO - MARCELO RO...
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
        'MiDIAS SOCIAIS - GOOGLE - MEU NEGOCIO - MARCELO ROBERTO P',
        'MiDIAS SOCIAIS - GOOGLE - MEU NEGOCIO - MARCELO ROBERTO P',
        '2021-06-02'::date,
        990.0,
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
        '2021-06-02'::date,
        990.0,
        'pago'::status_parcela,
        990.0,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - KENERSON - BANCO BBM SA ...
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
        'ARMAcoES - KENERSON - BANCO BBM SA ',
        'ARMAcoES - KENERSON - BANCO BBM SA ',
        '2021-06-02'::date,
        1620.97,
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
        '2021-06-02'::date,
        1620.97,
        'pago'::status_parcela,
        1620.97,
        '2021-06-02'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1104: FERNANDA DONATELLI...
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
        'VENDAS DINHEIRO - 1104: FERNANDA DONATELLI',
        'VENDAS DINHEIRO - 1104: FERNANDA DONATELLI',
        '2021-06-02'::date,
        5.0,
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
        '2021-06-02'::date,
        5.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3043...
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
        'RESTANTE DO SINAL - 3043',
        'RESTANTE DO SINAL - 3043',
        '2021-06-03'::date,
        154.0,
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
        '2021-06-03'::date,
        154.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PaO E FILTRO DE CAFe 102...
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
        'MERCADO - PaO E FILTRO DE CAFe 102',
        'MERCADO - PaO E FILTRO DE CAFe 102',
        '2021-06-03'::date,
        4.89,
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
        '2021-06-03'::date,
        4.89,
        'pago'::status_parcela,
        4.89,
        '2021-06-03'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2040270...
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
        'CARNe - 2040270',
        'CARNe - 2040270',
        '2021-06-03'::date,
        69.0,
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
        '2021-06-03'::date,
        69.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2418...
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
        'RESTANTE DO SINAL - 2418',
        'RESTANTE DO SINAL - 2418',
        '2021-06-03'::date,
        133.0,
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
        '2021-06-03'::date,
        133.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3321...
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
        'RESTANTE DO SINAL - 3321',
        'RESTANTE DO SINAL - 3321',
        '2021-06-03'::date,
        1374.0,
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
        '2021-06-03'::date,
        1374.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2044922...
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
        'CARNe - 2044922',
        'CARNe - 2044922',
        '2021-06-03'::date,
        115.0,
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
        '2021-06-03'::date,
        115.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3011...
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
        'RESTANTE DO SINAL - 3011',
        'RESTANTE DO SINAL - 3011',
        '2021-06-03'::date,
        33.0,
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
        '2021-06-03'::date,
        33.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3290...
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
        'RESTANTE DO SINAL - 3290',
        'RESTANTE DO SINAL - 3290',
        '2021-06-03'::date,
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
        '2021-06-03'::date,
        70.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3322...
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
        'VENDAS DINHEIRO - 3322',
        'VENDAS DINHEIRO - 3322',
        '2021-06-03'::date,
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
        '2021-06-03'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1103: FRANCISCO HENRIQUE...
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
        'RESTANTE DO SINAL - 1103: FRANCISCO HENRIQUE',
        'RESTANTE DO SINAL - 1103: FRANCISCO HENRIQUE',
        '2021-06-03'::date,
        539.0,
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
        '2021-06-03'::date,
        539.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - KENERSON - BANCO BBM SA ...
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
        'ARMAcoES - KENERSON - BANCO BBM SA ',
        'ARMAcoES - KENERSON - BANCO BBM SA ',
        '2021-06-04'::date,
        763.47,
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
        '2021-06-04'::date,
        763.47,
        'pago'::status_parcela,
        763.47,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        2.15,
        'pago'::status_parcela,
        2.15,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- Lote 11/86 (500 lançamentos)

-- PIX - RECEBIDO -  00034134809878 SILAS BORGE...
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
        'PIX - RECEBIDO -  00034134809878 SILAS BORGE',
        'PIX - RECEBIDO -  00034134809878 SILAS BORGE',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        200.0,
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
        '2021-06-04'::date,
        1574.94,
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
        '2021-06-04'::date,
        1574.94,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        217.8,
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
        '2021-06-04'::date,
        217.8,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI...
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
        'PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI',
        'PRO-LABORE JUNIOR - PAPeIS - BRUNO FORTINI',
        '2021-06-04'::date,
        435.9,
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
        '2021-06-04'::date,
        435.9,
        'pago'::status_parcela,
        435.9,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        1482.67,
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
        '2021-06-04'::date,
        1482.67,
        'pago'::status_parcela,
        1482.67,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        504.82,
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
        '2021-06-04'::date,
        504.82,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO -  SUPERMERCADO VERAN LJ2 S...
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
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        '2021-06-04'::date,
        9.93,
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
        '2021-06-04'::date,
        9.93,
        'pago'::status_parcela,
        9.93,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: ARIANE GOMES ...
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
        'SALaRIO - SALaRIO: ARIANE GOMES ',
        'SALaRIO - SALaRIO: ARIANE GOMES ',
        '2021-06-04'::date,
        4293.77,
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
        '2021-06-04'::date,
        4293.77,
        'pago'::status_parcela,
        4293.77,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        27.61,
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
        '2021-06-04'::date,
        27.61,
        'pago'::status_parcela,
        27.61,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - JUROS/MULTA...
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
        'LENTES - JUROS/MULTA',
        'LENTES - JUROS/MULTA',
        '2021-06-04'::date,
        39.08,
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
        '2021-06-04'::date,
        39.08,
        'pago'::status_parcela,
        39.08,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        1489.58,
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
        '2021-06-04'::date,
        1489.58,
        'pago'::status_parcela,
        1489.58,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-04'::date,
        49.5,
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
        '2021-06-04'::date,
        49.5,
        'pago'::status_parcela,
        49.5,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3323...
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
        'VENDAS DINHEIRO - 3323',
        'VENDAS DINHEIRO - 3323',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        10.0,
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
        '2021-06-04'::date,
        6.84,
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
        '2021-06-04'::date,
        6.84,
        'pago'::status_parcela,
        6.84,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL -  POSTO CASA BLANCA         ...
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
        'COMBUSTIVEL -  POSTO CASA BLANCA         ',
        'COMBUSTIVEL -  POSTO CASA BLANCA         ',
        '2021-06-04'::date,
        49.5,
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
        '2021-06-04'::date,
        49.5,
        'pago'::status_parcela,
        49.5,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- MONTAGENS - PAGAMENTO PARA PAULINHO ...
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
        'MONTAGENS - PAGAMENTO PARA PAULINHO ',
        'MONTAGENS - PAGAMENTO PARA PAULINHO ',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1108: MARIA LuCIA FeLIX...
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
        'VENDAS DINHEIRO - 1108: MARIA LuCIA FeLIX',
        'VENDAS DINHEIRO - 1108: MARIA LuCIA FeLIX',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        40.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PRODUTOS DE LIMPEZA...
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
        'MERCADO - PRODUTOS DE LIMPEZA',
        'MERCADO - PRODUTOS DE LIMPEZA',
        '2021-06-04'::date,
        5.75,
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
        '2021-06-04'::date,
        5.75,
        'pago'::status_parcela,
        5.75,
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        4225.78,
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
        '2021-06-04'::date,
        4225.78,
        'pago'::status_parcela,
        4225.78,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        293.04,
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
        '2021-06-04'::date,
        293.04,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3331...
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
        'RESTANTE DO SINAL - 3331',
        'RESTANTE DO SINAL - 3331',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        0.01,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  HABIBS RIBEIRAO P         ...
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
        'ALMOcO -  HABIBS RIBEIRAO P         ',
        'ALMOcO -  HABIBS RIBEIRAO P         ',
        '2021-06-04'::date,
        45.64,
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
        '2021-06-04'::date,
        45.64,
        'pago'::status_parcela,
        45.64,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2042893...
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
        'CARNe - 2042893',
        'CARNe - 2042893',
        '2021-06-04'::date,
        224.0,
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
        '2021-06-04'::date,
        224.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - JUROS/MULTA...
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
        'LENTES - JUROS/MULTA',
        'LENTES - JUROS/MULTA',
        '2021-06-04'::date,
        6.91,
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
        '2021-06-04'::date,
        6.91,
        'pago'::status_parcela,
        6.91,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  PAG*GOLDENPARK            ...
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
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        'PRO-LABORE TATY -  PAG*GOLDENPARK            ',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -  GILBERTO DE CAMAR         ...
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
        'PRO-LABORE JUNIOR -  GILBERTO DE CAMAR         ',
        'PRO-LABORE JUNIOR -  GILBERTO DE CAMAR         ',
        '2021-06-04'::date,
        1.0,
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
        '2021-06-04'::date,
        1.0,
        'pago'::status_parcela,
        1.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-04'::date,
        1.0,
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
        '2021-06-04'::date,
        1.0,
        'pago'::status_parcela,
        1.0,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3263...
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
        'RESTANTE DO SINAL - 3263',
        'RESTANTE DO SINAL - 3263',
        '2021-06-04'::date,
        1600.0,
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
        '2021-06-04'::date,
        1600.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        9.9,
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
        '2021-06-04'::date,
        9.9,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00050095958851 PAMELA LARI...
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
        'PIX - RECEBIDO -  00050095958851 PAMELA LARI',
        'PIX - RECEBIDO -  00050095958851 PAMELA LARI',
        '2021-06-04'::date,
        77.0,
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
        '2021-06-04'::date,
        77.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - COMPRA DE LENTES ...
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
        'LENTES - COMPRA DE LENTES ',
        'LENTES - COMPRA DE LENTES ',
        '2021-06-04'::date,
        4186.7,
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
        '2021-06-04'::date,
        4186.7,
        'pago'::status_parcela,
        4186.7,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        49.5,
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
        '2021-06-04'::date,
        49.5,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3330...
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
        'VENDAS DINHEIRO - 3330',
        'VENDAS DINHEIRO - 3330',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        100.0,
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
        '2021-06-04'::date,
        10.24,
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
        '2021-06-04'::date,
        10.24,
        'pago'::status_parcela,
        10.24,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PRODUTOS DE LIMPEZA...
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
        'MERCADO - PRODUTOS DE LIMPEZA',
        'MERCADO - PRODUTOS DE LIMPEZA',
        '2021-06-04'::date,
        18.48,
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
        '2021-06-04'::date,
        18.48,
        'pago'::status_parcela,
        18.48,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-04'::date,
        45.64,
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
        '2021-06-04'::date,
        45.64,
        'pago'::status_parcela,
        45.64,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2428...
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
        'RESTANTE DO SINAL - 2428',
        'RESTANTE DO SINAL - 2428',
        '2021-06-04'::date,
        74.99,
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
        '2021-06-04'::date,
        74.99,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - COMPRA DE LENTES ...
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
        'LENTES - COMPRA DE LENTES ',
        'LENTES - COMPRA DE LENTES ',
        '2021-06-04'::date,
        1482.67,
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
        '2021-06-04'::date,
        1482.67,
        'pago'::status_parcela,
        1482.67,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2922...
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
        'RESTANTE DO SINAL - 2922',
        'RESTANTE DO SINAL - 2922',
        '2021-06-04'::date,
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
        '2021-06-04'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        296.0,
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
        '2021-06-04'::date,
        296.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PRODUTOS DE LIMPEZA...
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
        'MERCADO - PRODUTOS DE LIMPEZA',
        'MERCADO - PRODUTOS DE LIMPEZA',
        '2021-06-04'::date,
        9.93,
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
        '2021-06-04'::date,
        9.93,
        'pago'::status_parcela,
        9.93,
        '2021-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-04'::date,
        267.3,
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
        '2021-06-04'::date,
        267.3,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 1116: MIGUEL SABINO DA SILVA...
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
        'RESTANTE DO SINAL - 1116: MIGUEL SABINO DA SILVA',
        'RESTANTE DO SINAL - 1116: MIGUEL SABINO DA SILVA',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3338...
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
        'VENDAS DINHEIRO - 3338',
        'VENDAS DINHEIRO - 3338',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1115: ANTÔNIO DOMINGOS MATELLO...
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
        'VENDAS DINHEIRO - 1115: ANTÔNIO DOMINGOS MATELLO',
        'VENDAS DINHEIRO - 1115: ANTÔNIO DOMINGOS MATELLO',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        250.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3183...
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
        'RESTANTE DO SINAL - 3183',
        'RESTANTE DO SINAL - 3183',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3276...
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
        'RESTANTE DO SINAL - 3276',
        'RESTANTE DO SINAL - 3276',
        '2021-06-05'::date,
        180.0,
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
        '2021-06-05'::date,
        180.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2738...
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
        'RESTANTE DO SINAL - 2738',
        'RESTANTE DO SINAL - 2738',
        '2021-06-05'::date,
        125.0,
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
        '2021-06-05'::date,
        125.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PReMIOS - PREMIAcaO: TAMIRES MACIEL ...
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
        'PReMIOS - PREMIAcaO: TAMIRES MACIEL ',
        'PReMIOS - PREMIAcaO: TAMIRES MACIEL ',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2021-06-05'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3029...
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
        'RESTANTE DO SINAL - 3029',
        'RESTANTE DO SINAL - 3029',
        '2021-06-05'::date,
        88.33,
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
        '2021-06-05'::date,
        88.33,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PReMIOS - PAGAMENTO DE PREMIAcaO: KETHILYN SILVA ...
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
        'PReMIOS - PAGAMENTO DE PREMIAcaO: KETHILYN SILVA ',
        'PReMIOS - PAGAMENTO DE PREMIAcaO: KETHILYN SILVA ',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2021-06-05'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - ALMOcO   ...
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
        'PRO-LABORE TATY - ALMOcO   ',
        'PRO-LABORE TATY - ALMOcO   ',
        '2021-06-05'::date,
        13.0,
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
        '2021-06-05'::date,
        13.0,
        'pago'::status_parcela,
        13.0,
        '2021-06-05'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3337...
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
        'VENDAS DINHEIRO - 3337',
        'VENDAS DINHEIRO - 3337',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - ALMOcO DA TATY ...
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
        'PRO-LABORE TATY - ALMOcO DA TATY ',
        'PRO-LABORE TATY - ALMOcO DA TATY ',
        '2021-06-05'::date,
        13.4,
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
        '2021-06-05'::date,
        13.4,
        'pago'::status_parcela,
        13.4,
        '2021-06-05'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1116: MIGUEL SABINO DA SILVA...
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
        'VENDAS DINHEIRO - 1116: MIGUEL SABINO DA SILVA',
        'VENDAS DINHEIRO - 1116: MIGUEL SABINO DA SILVA',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PReMIOS - PAGAMENTO DE PREMIAcaO: ANA CLaUDIA ...
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
        'PReMIOS - PAGAMENTO DE PREMIAcaO: ANA CLaUDIA ',
        'PReMIOS - PAGAMENTO DE PREMIAcaO: ANA CLaUDIA ',
        '2021-06-05'::date,
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
        '2021-06-05'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2021-06-05'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2043578...
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
        'CARNe - 2043578',
        'CARNe - 2043578',
        '2021-06-07'::date,
        23.2,
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
        '2021-06-07'::date,
        23.2,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2917...
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
        'RESTANTE DO SINAL - 2917',
        'RESTANTE DO SINAL - 2917',
        '2021-06-07'::date,
        120.0,
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
        '2021-06-07'::date,
        120.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  MC DONALDS  SUS           ...
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
        'ALMOcO -  MC DONALDS  SUS           ',
        'ALMOcO -  MC DONALDS  SUS           ',
        '2021-06-07'::date,
        32.0,
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
        '2021-06-07'::date,
        32.0,
        'pago'::status_parcela,
        32.0,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3054...
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
        'RESTANTE DO SINAL - 3054',
        'RESTANTE DO SINAL - 3054',
        '2021-06-07'::date,
        2.5,
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
        '2021-06-07'::date,
        2.5,
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
        '2021-06-07'::date,
        3.08,
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
        '2021-06-07'::date,
        3.08,
        'pago'::status_parcela,
        3.08,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        138.6,
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
        '2021-06-07'::date,
        138.6,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2616...
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
        'RESTANTE DO SINAL - 2616',
        'RESTANTE DO SINAL - 2616',
        '2021-06-07'::date,
        83.0,
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
        '2021-06-07'::date,
        83.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  PAG*JOSUEBATISTADEAND SU...
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
        'ALMOcO -  PAG*JOSUEBATISTADEAND SU',
        'ALMOcO -  PAG*JOSUEBATISTADEAND SU',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  LOJAS RENNER FL 1         ...
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
        'PRO-LABORE TATY -  LOJAS RENNER FL 1         ',
        'PRO-LABORE TATY -  LOJAS RENNER FL 1         ',
        '2021-06-07'::date,
        229.6,
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
        '2021-06-07'::date,
        229.6,
        'pago'::status_parcela,
        229.6,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CReDITO a VISTA - RECEBIMENTO CIELO...
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
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        428.54,
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
        '2021-06-07'::date,
        428.54,
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
        '2021-06-07'::date,
        29.62,
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
        '2021-06-07'::date,
        29.62,
        'pago'::status_parcela,
        29.62,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  FINAMIX                   ...
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
        'PRO-LABORE TATY -  FINAMIX                   ',
        'PRO-LABORE TATY -  FINAMIX                   ',
        '2021-06-07'::date,
        66.9,
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
        '2021-06-07'::date,
        66.9,
        'pago'::status_parcela,
        66.9,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        17.9,
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
        '2021-06-07'::date,
        17.9,
        'pago'::status_parcela,
        17.9,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3227...
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
        'RESTANTE DO SINAL - 3227',
        'RESTANTE DO SINAL - 3227',
        '2021-06-07'::date,
        58.0,
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
        '2021-06-07'::date,
        58.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3247...
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
        'RESTANTE DO SINAL - 3247',
        'RESTANTE DO SINAL - 3247',
        '2021-06-07'::date,
        98.33,
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
        '2021-06-07'::date,
        98.33,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        91.08,
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
        '2021-06-07'::date,
        91.08,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CReDITO a VISTA - RECEBIMENTO CIELO...
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
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        373.02,
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
        '2021-06-07'::date,
        373.02,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3208...
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
        'RESTANTE DO SINAL - 3208',
        'RESTANTE DO SINAL - 3208',
        '2021-06-07'::date,
        133.33,
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
        '2021-06-07'::date,
        133.33,
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
        '2021-06-07'::date,
        97.21,
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
        '2021-06-07'::date,
        97.21,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        429.7,
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
        '2021-06-07'::date,
        429.7,
        'pago'::status_parcela,
        429.7,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  HIPER D AVO SUZANO        ...
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
        'PRO-LABORE TATY -  HIPER D AVO SUZANO        ',
        'PRO-LABORE TATY -  HIPER D AVO SUZANO        ',
        '2021-06-07'::date,
        112.53,
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
        '2021-06-07'::date,
        112.53,
        'pago'::status_parcela,
        112.53,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00031947937804 JONAS ALVES...
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
        'PIX - RECEBIDO -  00031947937804 JONAS ALVES',
        'PIX - RECEBIDO -  00031947937804 JONAS ALVES',
        '2021-06-07'::date,
        112.0,
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
        '2021-06-07'::date,
        112.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL -  AUTO POSTO VILA URUP      ...
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
        'COMBUSTIVEL -  AUTO POSTO VILA URUP      ',
        'COMBUSTIVEL -  AUTO POSTO VILA URUP      ',
        '2021-06-07'::date,
        89.49,
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
        '2021-06-07'::date,
        89.49,
        'pago'::status_parcela,
        89.49,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        66.9,
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
        '2021-06-07'::date,
        66.9,
        'pago'::status_parcela,
        66.9,
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        14.57,
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
        '2021-06-07'::date,
        14.57,
        'pago'::status_parcela,
        14.57,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        56.7,
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
        '2021-06-07'::date,
        56.7,
        'pago'::status_parcela,
        56.7,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3054...
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
        'RESTANTE DO SINAL - 3054',
        'RESTANTE DO SINAL - 3054',
        '2021-06-07'::date,
        104.0,
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
        '2021-06-07'::date,
        104.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00041340275864 ADRIANA NIC...
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
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2866...
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
        'RESTANTE DO SINAL - 2866',
        'RESTANTE DO SINAL - 2866',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        95.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        229.6,
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
        '2021-06-07'::date,
        229.6,
        'pago'::status_parcela,
        229.6,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 243627...
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
        'CARNe - 243627',
        'CARNe - 243627',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        12.59,
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
        '2021-06-07'::date,
        12.59,
        'pago'::status_parcela,
        12.59,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY - TEMPERO MANERO...
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
        'PRO-LABORE TATY - TEMPERO MANERO',
        'PRO-LABORE TATY - TEMPERO MANERO',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        8.5,
        'pago'::status_parcela,
        8.5,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        16.9,
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
        '2021-06-07'::date,
        16.9,
        'pago'::status_parcela,
        16.9,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- CReDITO a VISTA - RECEBIMENTO CIELO...
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
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        'CReDITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        616.37,
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
        '2021-06-07'::date,
        616.37,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2043578...
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
        'CARNe - 2043578',
        'CARNe - 2043578',
        '2021-06-07'::date,
        114.4,
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
        '2021-06-07'::date,
        114.4,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  BELLEU  DEPOSITO DE       ...
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
        'PRO-LABORE TATY -  BELLEU  DEPOSITO DE       ',
        'PRO-LABORE TATY -  BELLEU  DEPOSITO DE       ',
        '2021-06-07'::date,
        56.7,
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
        '2021-06-07'::date,
        56.7,
        'pago'::status_parcela,
        56.7,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  TEMPERO MANERO SUZANO BR...
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
        'ALMOcO -  TEMPERO MANERO SUZANO BR',
        'ALMOcO -  TEMPERO MANERO SUZANO BR',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        8.5,
        'pago'::status_parcela,
        8.5,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 1127: MARCO ANTÔNIO BARTEALNA...
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
        'VENDAS DINHEIRO - 1127: MARCO ANTÔNIO BARTEALNA',
        'VENDAS DINHEIRO - 1127: MARCO ANTÔNIO BARTEALNA',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO -  BURG KING                 ...
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
        'ALMOcO -  BURG KING                 ',
        'ALMOcO -  BURG KING                 ',
        '2021-06-07'::date,
        16.9,
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
        '2021-06-07'::date,
        16.9,
        'pago'::status_parcela,
        16.9,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3343...
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
        'VENDAS DINHEIRO - 3343',
        'VENDAS DINHEIRO - 3343',
        '2021-06-07'::date,
        280.0,
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
        '2021-06-07'::date,
        280.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3093...
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
        'RESTANTE DO SINAL - 3093',
        'RESTANTE DO SINAL - 3093',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        80.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        19.8,
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
        '2021-06-07'::date,
        19.8,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DeBITO a VISTA - RECEBIMENTO CIELO...
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
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        'DeBITO a VISTA - RECEBIMENTO CIELO',
        '2021-06-07'::date,
        0.99,
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
        '2021-06-07'::date,
        0.99,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        32.0,
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
        '2021-06-07'::date,
        32.0,
        'pago'::status_parcela,
        32.0,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  HI CHICKEN FOODS          ...
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
        'PRO-LABORE TATY -  HI CHICKEN FOODS          ',
        'PRO-LABORE TATY -  HI CHICKEN FOODS          ',
        '2021-06-07'::date,
        17.9,
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
        '2021-06-07'::date,
        17.9,
        'pago'::status_parcela,
        17.9,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - PAGAMENTO PARA CAMBRAZ ...
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
        'IMPOSTOS - PAGAMENTO PARA CAMBRAZ ',
        'IMPOSTOS - PAGAMENTO PARA CAMBRAZ ',
        '2021-06-07'::date,
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
        '2021-06-07'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO -  SUPERMERCADO VERAN LJ2 S...
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
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        '2021-06-07'::date,
        5.75,
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
        '2021-06-07'::date,
        5.75,
        'pago'::status_parcela,
        5.75,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO -  SUPERMERCADO VERAN LJ2 S...
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
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        'MERCADO -  SUPERMERCADO VERAN LJ2 S',
        '2021-06-07'::date,
        18.48,
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
        '2021-06-07'::date,
        18.48,
        'pago'::status_parcela,
        18.48,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3219...
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
        'RESTANTE DO SINAL - 3219',
        'RESTANTE DO SINAL - 3219',
        '2021-06-07'::date,
        157.0,
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
        '2021-06-07'::date,
        157.0,
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
        '2021-06-07'::date,
        3022.69,
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
        '2021-06-07'::date,
        3022.69,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        89.49,
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
        '2021-06-07'::date,
        89.49,
        'pago'::status_parcela,
        89.49,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2590...
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
        'RESTANTE DO SINAL - 2590',
        'RESTANTE DO SINAL - 2590',
        '2021-06-07'::date,
        83.0,
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
        '2021-06-07'::date,
        83.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2858...
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
        'RESTANTE DO SINAL - 2858',
        'RESTANTE DO SINAL - 2858',
        '2021-06-07'::date,
        74.0,
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
        '2021-06-07'::date,
        74.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE TATY -  YOU COM FL 040097         ...
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
        'PRO-LABORE TATY -  YOU COM FL 040097         ',
        'PRO-LABORE TATY -  YOU COM FL 040097         ',
        '2021-06-07'::date,
        429.7,
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
        '2021-06-07'::date,
        429.7,
        'pago'::status_parcela,
        429.7,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00031947937804 JONAS ALVES...
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
        'PIX - RECEBIDO -  00031947937804 JONAS ALVES',
        'PIX - RECEBIDO -  00031947937804 JONAS ALVES',
        '2021-06-07'::date,
        142.6,
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
        '2021-06-07'::date,
        142.6,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3211...
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
        'RESTANTE DO SINAL - 3211',
        'RESTANTE DO SINAL - 3211',
        '2021-06-07'::date,
        86.66,
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
        '2021-06-07'::date,
        86.66,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2042946...
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
        'CARNe - 2042946',
        'CARNe - 2042946',
        '2021-06-07'::date,
        213.1,
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
        '2021-06-07'::date,
        213.1,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR -                               ...
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
        'PRO-LABORE JUNIOR -                                       ',
        'PRO-LABORE JUNIOR -                                       ',
        '2021-06-07'::date,
        112.53,
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
        '2021-06-07'::date,
        112.53,
        'pago'::status_parcela,
        112.53,
        '2021-06-07'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00044137946809 KELLE UMBEL...
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
        'PIX - RECEBIDO -  00044137946809 KELLE UMBEL',
        'PIX - RECEBIDO -  00044137946809 KELLE UMBEL',
        '2021-06-07'::date,
        213.1,
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
        '2021-06-07'::date,
        213.1,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - COMPRA DE ARMAcoES...
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
        'ARMAcoES - COMPRA DE ARMAcoES',
        'ARMAcoES - COMPRA DE ARMAcoES',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        40.0,
        'pago'::status_parcela,
        40.0,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SOLARES DE BRINDE...
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
        'ARMAcoES - SOLARES DE BRINDE',
        'ARMAcoES - SOLARES DE BRINDE',
        '2021-06-08'::date,
        136.5,
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
        '2021-06-08'::date,
        136.5,
        'pago'::status_parcela,
        136.5,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00031795243830 FERNANDA CR...
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
        'PIX - RECEBIDO -  00031795243830 FERNANDA CR',
        'PIX - RECEBIDO -  00031795243830 FERNANDA CR',
        '2021-06-08'::date,
        59.75,
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
        '2021-06-08'::date,
        59.75,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3357...
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
        'VENDAS DINHEIRO - 3357',
        'VENDAS DINHEIRO - 3357',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00039078179821 ANATHIELLY ...
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
        'PIX - RECEBIDO -  00039078179821 ANATHIELLY ',
        'PIX - RECEBIDO -  00039078179821 ANATHIELLY ',
        '2021-06-08'::date,
        145.0,
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
        '2021-06-08'::date,
        145.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00031795243830 FERNANDA CR...
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
        'PIX - RECEBIDO -  00031795243830 FERNANDA CR',
        'PIX - RECEBIDO -  00031795243830 FERNANDA CR',
        '2021-06-08'::date,
        55.0,
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
        '2021-06-08'::date,
        55.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3329...
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
        'RESTANTE DO SINAL - 3329',
        'RESTANTE DO SINAL - 3329',
        '2021-06-08'::date,
        190.0,
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
        '2021-06-08'::date,
        190.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SOLARES DE BRINDE...
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
        'ARMAcoES - SOLARES DE BRINDE',
        'ARMAcoES - SOLARES DE BRINDE',
        '2021-06-08'::date,
        270.0,
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
        '2021-06-08'::date,
        270.0,
        'pago'::status_parcela,
        270.0,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3286...
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
        'RESTANTE DO SINAL - 3286',
        'RESTANTE DO SINAL - 3286',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        60.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00041340275864 ADRIANA NIC...
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
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 3318...
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
        'RESTANTE DO SINAL - 3318',
        'RESTANTE DO SINAL - 3318',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3361...
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
        'VENDAS DINHEIRO - 3361',
        'VENDAS DINHEIRO - 3361',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2824...
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
        'RESTANTE DO SINAL - 2824',
        'RESTANTE DO SINAL - 2824',
        '2021-06-08'::date,
        54.7,
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
        '2021-06-08'::date,
        54.7,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE JUNIOR - CHEQUE COMPENSADO        ...
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
        'PRO-LABORE JUNIOR - CHEQUE COMPENSADO        ',
        'PRO-LABORE JUNIOR - CHEQUE COMPENSADO        ',
        '2021-06-08'::date,
        624.5,
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
        '2021-06-08'::date,
        624.5,
        'pago'::status_parcela,
        624.5,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- SALaRIO - SALaRIO: SAMUEL HENRIQUE ...
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
        'SALaRIO - SALaRIO: SAMUEL HENRIQUE ',
        'SALaRIO - SALaRIO: SAMUEL HENRIQUE ',
        '2021-06-08'::date,
        1815.97,
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
        '2021-06-08'::date,
        1815.97,
        'pago'::status_parcela,
        1815.97,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - COMPRA DE ARMAcoES...
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
        'ARMAcoES - COMPRA DE ARMAcoES',
        'ARMAcoES - COMPRA DE ARMAcoES',
        '2021-06-08'::date,
        46.0,
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
        '2021-06-08'::date,
        46.0,
        'pago'::status_parcela,
        46.0,
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        1191.03,
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
        '2021-06-08'::date,
        1191.03,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2046362...
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
        'CARNe - 2046362',
        'CARNe - 2046362',
        '2021-06-08'::date,
        55.0,
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
        '2021-06-08'::date,
        55.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 2824...
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
        'RESTANTE DO SINAL - 2824',
        'RESTANTE DO SINAL - 2824',
        '2021-06-08'::date,
        52.0,
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
        '2021-06-08'::date,
        52.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - COMPRA DE ARMAcoES...
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
        'ARMAcoES - COMPRA DE ARMAcoES',
        'ARMAcoES - COMPRA DE ARMAcoES',
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        140.0,
        'pago'::status_parcela,
        140.0,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SOLARES DE BRINDE...
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
        'ARMAcoES - SOLARES DE BRINDE',
        'ARMAcoES - SOLARES DE BRINDE',
        '2021-06-08'::date,
        90.0,
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
        '2021-06-08'::date,
        90.0,
        'pago'::status_parcela,
        90.0,
        '2021-06-08'::date,
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
        '2021-06-08'::date,
        4.36,
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
        '2021-06-08'::date,
        4.36,
        'pago'::status_parcela,
        4.36,
        '2021-06-08'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 2045973...
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
        'CARNe - 2045973',
        'CARNe - 2045973',
        '2021-06-08'::date,
        59.75,
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
        '2021-06-08'::date,
        59.75,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIX - RECEBIDO -  00041340275864 ADRIANA NIC...
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
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        'PIX - RECEBIDO -  00041340275864 ADRIANA NIC',
        '2021-06-08'::date,
        190.0,
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
        '2021-06-08'::date,
        190.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 3362...
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
        'VENDAS DINHEIRO - 3362',
        'VENDAS DINHEIRO - 3362',
        '2021-06-08'::date,
        10.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );
