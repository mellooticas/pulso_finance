    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-15'::date,
        115.76,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-15'::date,
        115.76,
        'pago'::status_parcela,
        115.76,
        '2022-08-15'::date,
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
        '2022-08-15'::date,
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
        '2022-08-15'::date,
        270.0,
        'pago'::status_parcela,
        270.0,
        '2022-08-15'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0871: JACIELE BARBOSA DA CUNHA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0871: JACIELE BARBOSA DA CUNHA',
        'VENDAS DINHEIRO - 0871: JACIELE BARBOSA DA CUNHA',
        '2022-08-15'::date,
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
        '2022-08-15'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
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
        '2022-08-15'::date,
        1.51,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-15'::date,
        1.51,
        'pago'::status_parcela,
        1.51,
        '2022-08-15'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: ALICATE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: ALICATE',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: ALICATE',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        90.0,
        'pago'::status_parcela,
        90.0,
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        803.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        803.0,
        'pago'::status_parcela,
        803.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO TECIDO (10 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO TECIDO (10 UNIDADES)',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 0985: DIEGO FERREIRA ROMAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 0985: DIEGO FERREIRA ROMAN',
        'RESTANTE DO SINAL - 0985: DIEGO FERREIRA ROMAN',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        350.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        '2022-08-16'::date,
        648.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        648.0,
        'pago'::status_parcela,
        648.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 16/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 16/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 16/08)',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- MANUTENcaO - ALBA CHAVEIRO: CHAVE TETRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MANUTENcaO - ALBA CHAVEIRO: CHAVE TETRA',
        'MANUTENcaO - ALBA CHAVEIRO: CHAVE TETRA',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - FREELANCER: ROBERTO (DIVUL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - FREELANCER: ROBERTO (DIVULGAcaO, REF. 09/08 A 15/08)',
        'DESPESAS FUNCIONaRIOS - FREELANCER: ROBERTO (DIVULGAcaO, REF. 09/08 A 15/08)',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        200.0,
        'pago'::status_parcela,
        200.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        7.77,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        7.77,
        'pago'::status_parcela,
        7.77,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO INFANTIL',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO INFANTIL',
        '2022-08-16'::date,
        7.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        7.5,
        'pago'::status_parcela,
        7.5,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - MARKETING DIGITAL - REDES SOCIAIS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MiDIAS SOCIAIS - MARKETING DIGITAL - REDES SOCIAIS: DANIELA E MARIA EDUARDA',
        'MiDIAS SOCIAIS - MARKETING DIGITAL - REDES SOCIAIS: DANIELA E MARIA EDUARDA',
        '2022-08-16'::date,
        1000.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        1000.0,
        'pago'::status_parcela,
        1000.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        5.25,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        5.25,
        'pago'::status_parcela,
        5.25,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO SILICONE (05 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO SILICONE (05 UNIDADES)',
        '2022-08-16'::date,
        22.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        22.5,
        'pago'::status_parcela,
        22.5,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PONTE A...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PONTE ANATÔMICA',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PONTE ANATÔMICA',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        1498.16,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        1498.16,
        'pago'::status_parcela,
        1498.16,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO PeROLA (09 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO PeROLA (09 UNIDADES)',
        '2022-08-16'::date,
        18.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        18.0,
        'pago'::status_parcela,
        18.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        '2022-08-16'::date,
        5.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        5.11,
        'pago'::status_parcela,
        5.11,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        '2022-08-16'::date,
        108.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        108.0,
        'pago'::status_parcela,
        108.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CHAVE -...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CHAVE - CONJUNTO',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CHAVE - CONJUNTO',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        35.0,
        'pago'::status_parcela,
        35.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        104.05,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        104.05,
        'pago'::status_parcela,
        104.05,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: SAQUINH...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: SAQUINHO MICROFIBRA (13 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: SAQUINHO MICROFIBRA (13 UNIDADES)',
        '2022-08-16'::date,
        195.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        195.0,
        'pago'::status_parcela,
        195.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PINcA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PINcA',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PINcA',
        '2022-08-16'::date,
        11.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        11.0,
        'pago'::status_parcela,
        11.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        'ARMAcoES - SENADOR QUEIROZ: COMPRA DE ARMAcoES',
        '2022-08-16'::date,
        610.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        610.5,
        'pago'::status_parcela,
        610.5,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO FASHION',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO FASHION',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-16'::date,
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
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        90.0,
        'pago'::status_parcela,
        90.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO VELCRO (04 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO VELCRO (04 UNIDADES)',
        '2022-08-16'::date,
        8.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        8.0,
        'pago'::status_parcela,
        8.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: TERMINA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: TERMINAL DE PONTEIRA (02 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: TERMINAL DE PONTEIRA (02 UNIDADES)',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        111.01,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        111.01,
        'pago'::status_parcela,
        111.01,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PLAQUET...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PLAQUETA PARA ACETATO (04 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: PLAQUETA PARA ACETATO (04 UNIDADES)',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        450.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        450.0,
        'pago'::status_parcela,
        450.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: PaO FRANCeS, REFRESC...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS, REFRESCO EM Po E SAPONaCEO',
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS, REFRESCO EM Po E SAPONaCEO',
        '2022-08-16'::date,
        14.44,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        14.44,
        'pago'::status_parcela,
        14.44,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - NEW LENTES: COMPRA DE LENTES DE CONTATO (...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'LENTES - NEW LENTES: COMPRA DE LENTES DE CONTATO (SITE)',
        'LENTES - NEW LENTES: COMPRA DE LENTES DE CONTATO (SITE)',
        '2022-08-16'::date,
        71.01,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        71.01,
        'pago'::status_parcela,
        71.01,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ARMAcoES - KENERSON INDuSTRIA E COMeRCIO DE PR: CO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ARMAcoES - KENERSON INDuSTRIA E COMeRCIO DE PR: COMPRA DE ARMAcoES',
        'ARMAcoES - KENERSON INDuSTRIA E COMeRCIO DE PR: COMPRA DE ARMAcoES',
        '2022-08-16'::date,
        903.96,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        903.96,
        'pago'::status_parcela,
        903.96,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO METAL LUXO (04 UNIDADES)',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CORDaO METAL LUXO (04 UNIDADES)',
        '2022-08-16'::date,
        28.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        28.0,
        'pago'::status_parcela,
        28.0,
        '2022-08-16'::date,
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
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CIREX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CIREX',
        'ACESSoRIOS - SaO PAULO ACESSoRIOS oPTICOS: CIREX',
        '2022-08-16'::date,
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
        '2022-08-16'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-16'::date,
        575.52,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-16'::date,
        575.52,
        'pago'::status_parcela,
        575.52,
        '2022-08-16'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: DETERGENTE LiQUIDO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: DETERGENTE LiQUIDO',
        'MERCADO - SUPERMERCADO VERAN: DETERGENTE LiQUIDO',
        '2022-08-17'::date,
        5.38,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        5.38,
        'pago'::status_parcela,
        5.38,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 0997: GEANE DOS SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 0997: GEANE DOS SANTOS',
        'RESTANTE DO SINAL - 0997: GEANE DOS SANTOS',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
        882.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        882.0,
        'pago'::status_parcela,
        882.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0876: LIDIANI GOMES ALVES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0876: LIDIANI GOMES ALVES',
        'VENDAS DINHEIRO - 0876: LIDIANI GOMES ALVES',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        80.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: PaO FRANCeS E REFRES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS E REFRESCO EM Po',
        'MERCADO - SUPERMERCADO VERAN: PaO FRANCeS E REFRESCO EM Po',
        '2022-08-17'::date,
        5.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        5.97,
        'pago'::status_parcela,
        5.97,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        12.99,
        'pago'::status_parcela,
        12.99,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        120.0,
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
        '2022-08-17'::date,
        73.41,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        73.41,
        'pago'::status_parcela,
        73.41,
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        384.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        384.0,
        'pago'::status_parcela,
        384.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 6144: ROSALINA ALVES YAMAUCHI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 6144: ROSALINA ALVES YAMAUCHI',
        'RESTANTE DO SINAL - 6144: ROSALINA ALVES YAMAUCHI',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        300.0,
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
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: GUILHERME SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'GASTO COM MeDICOS - OPTOMETRISTA: GUILHERME SANTOS',
        'GASTO COM MeDICOS - OPTOMETRISTA: GUILHERME SANTOS',
        '2022-08-17'::date,
        240.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        240.0,
        'pago'::status_parcela,
        240.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 17/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 17/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 17/08)',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        385.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        385.0,
        'pago'::status_parcela,
        385.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO',
        'ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO',
        '2022-08-17'::date,
        12500.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        12500.0,
        'pago'::status_parcela,
        12500.0,
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        630.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        630.0,
        'pago'::status_parcela,
        630.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        '2022-08-17'::date,
        3.79,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        3.79,
        'pago'::status_parcela,
        3.79,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
        5.35,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        5.35,
        'pago'::status_parcela,
        5.35,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO (IPTU)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO (IPTU)',
        'ALUGUEL - CONCEPT IMoVEIS LTDA: SUZANO (IPTU)',
        '2022-08-17'::date,
        156.15,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        156.15,
        'pago'::status_parcela,
        156.15,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DA LOJA - REGINALDO DONIZETE: ARMaRIO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRA DA LOJA - REGINALDO DONIZETE: ARMaRIO',
        'COMPRA DA LOJA - REGINALDO DONIZETE: ARMaRIO',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        200.0,
        'pago'::status_parcela,
        200.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
        85.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        85.99,
        'pago'::status_parcela,
        85.99,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- MiDIAS SOCIAIS - HASTEN MARKETING E PRODUcoES: CAM...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MiDIAS SOCIAIS - HASTEN MARKETING E PRODUcoES: CAMPANHA - SAuDE DOS OLHOS',
        'MiDIAS SOCIAIS - HASTEN MARKETING E PRODUcoES: CAMPANHA - SAuDE DOS OLHOS',
        '2022-08-17'::date,
        384.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        384.0,
        'pago'::status_parcela,
        384.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-17'::date,
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
        '2022-08-17'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - AYOAGI COMeRCIO DE MATERIAIS: ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - AYOAGI COMeRCIO DE MATERIAIS: SABONETE LiQUIDO',
        'COMPRAS PARA LOJA - AYOAGI COMeRCIO DE MATERIAIS: SABONETE LiQUIDO',
        '2022-08-17'::date,
        5.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-17'::date,
        5.9,
        'pago'::status_parcela,
        5.9,
        '2022-08-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: PAP...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: PAPEL SULFITE A4 100F ',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: PAPEL SULFITE A4 100F ',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        13.0,
        'pago'::status_parcela,
        13.0,
        '2022-08-18'::date,
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
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        '2022-08-18'::date,
        645.74,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        645.74,
        'pago'::status_parcela,
        645.74,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - ULTRAFARMA: SORO FISIOLoGICO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - ULTRAFARMA: SORO FISIOLoGICO',
        'COMPRAS PARA LOJA - ULTRAFARMA: SORO FISIOLoGICO',
        '2022-08-18'::date,
        4.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        4.99,
        'pago'::status_parcela,
        4.99,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0877: EVANDRO RODRIGUES DE SOUZA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0877: EVANDRO RODRIGUES DE SOUZA',
        'VENDAS DINHEIRO - 0877: EVANDRO RODRIGUES DE SOUZA',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 18/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 18/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 18/08)',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        88.68,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        88.68,
        'pago'::status_parcela,
        88.68,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-18'::date,
        49.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        49.99,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: DETERGENTE E PaO FRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: DETERGENTE E PaO FRANCeS',
        'MERCADO - SUPERMERCADO VERAN: DETERGENTE E PaO FRANCeS',
        '2022-08-18'::date,
        8.18,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        8.18,
        'pago'::status_parcela,
        8.18,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-18'::date,
        597.28,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        597.28,
        'pago'::status_parcela,
        597.28,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMBUSTIVEL - GASOLINA: DIEGO FRANCISCO DOS SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMBUSTIVEL - GASOLINA: DIEGO FRANCISCO DOS SANTOS (RETIRADA DE SERVIcOS - SUZANO)',
        'COMBUSTIVEL - GASOLINA: DIEGO FRANCISCO DOS SANTOS (RETIRADA DE SERVIcOS - SUZANO)',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6232: LILIANE PRADO STACHO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6232: LILIANE PRADO STACHO',
        'VENDAS DINHEIRO - 6232: LILIANE PRADO STACHO',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        90.0,
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
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        '2022-08-18'::date,
        32.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        32.99,
        'pago'::status_parcela,
        32.99,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: DIEGO FRANCISCO DOS SANT...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: DIEGO FRANCISCO DOS SANTOS',
        'VALE - VALE ADIANTAMENTO: DIEGO FRANCISCO DOS SANTOS',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. A 01 DIA TRABALHADO) ',
        'DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. A 01 DIA TRABALHADO) ',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - COMISSaO: ANA ROSA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - COMISSaO: ANA ROSA',
        'DESPESAS FUNCIONaRIOS - COMISSaO: ANA ROSA',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-18'::date,
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
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        'LENTES - BRASLAB PRODUTOS OTICOS EIRELI: COMPRA DE LENTES',
        '2022-08-18'::date,
        1084.13,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        1084.13,
        'pago'::status_parcela,
        1084.13,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        '2022-08-18'::date,
        3.62,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-18'::date,
        3.62,
        'pago'::status_parcela,
        3.62,
        '2022-08-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6226: EUNICE ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6226: EUNICE ',
        'VENDAS DINHEIRO - 6226: EUNICE ',
        '2022-08-18'::date,
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
        '2022-08-18'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: EMERSON WILLIAM - META DI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: EMERSON WILLIAM - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: EMERSON WILLIAM - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
        192.06,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        192.06,
        'pago'::status_parcela,
        192.06,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSS - CONTRIBUIcaO PREVIDENCIaRIA DESCONTA SEGURA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'INSS - CONTRIBUIcaO PREVIDENCIaRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        'INSS - CONTRIBUIcaO PREVIDENCIaRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        '2022-08-19'::date,
        1213.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        1213.99,
        'pago'::status_parcela,
        1213.99,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - EMPoRIO DA ECONOMIA: DESINFETANTE ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - EMPoRIO DA ECONOMIA: DESINFETANTE ',
        'MERCADO - EMPoRIO DA ECONOMIA: DESINFETANTE ',
        '2022-08-19'::date,
        6.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        6.5,
        'pago'::status_parcela,
        6.5,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: ALINE DA CRUZ SANTOS - ME...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: ALINE DA CRUZ SANTOS - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: ALINE DA CRUZ SANTOS - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA LTDA: PaO FRANCeS',
        '2022-08-19'::date,
        6.25,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        6.25,
        'pago'::status_parcela,
        6.25,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - ALBERTO AKIO ICHIKAWA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - ALBERTO AKIO ICHIKAWA',
        'ALMOcO - ALBERTO AKIO ICHIKAWA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: ANDREIA PAES - META DIaRI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: ANDREIA PAES - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: ANDREIA PAES - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: REFRIGERANTE PEPSI 2...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: REFRIGERANTE PEPSI 2L',
        'MERCADO - SUPERMERCADO VERAN: REFRIGERANTE PEPSI 2L',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        7.49,
        'pago'::status_parcela,
        7.49,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: CAFe, PaO FRANCeS E ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: CAFe, PaO FRANCeS E REFRESCO EM Po',
        'MERCADO - SUPERMERCADO VERAN: CAFe, PaO FRANCeS E REFRESCO EM Po',
        '2022-08-19'::date,
        21.73,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        21.73,
        'pago'::status_parcela,
        21.73,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - AOYAGI COMeRCIO DE MATERIAIS C...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - AOYAGI COMeRCIO DE MATERIAIS CREDENCIADORA: INTERFOLHA',
        'COMPRAS PARA LOJA - AOYAGI COMeRCIO DE MATERIAIS CREDENCIADORA: INTERFOLHA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        8.5,
        'pago'::status_parcela,
        8.5,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - PRESTES MORAIS FOOD...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - PRESTES MORAIS FOOD',
        'ALMOcO - PRESTES MORAIS FOOD',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: PAPE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: PAPEL INTERFOLHA',
        'COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: PAPEL INTERFOLHA',
        '2022-08-19'::date,
        10.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        10.8,
        'pago'::status_parcela,
        10.8,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
        87.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        87.5,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - DARF PEDRA MIECA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - DARF PEDRA MIECA',
        'IMPOSTOS - DARF PEDRA MIECA',
        '2022-08-19'::date,
        301.37,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        301.37,
        'pago'::status_parcela,
        301.37,
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        252.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        252.03,
        'pago'::status_parcela,
        252.03,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSS - CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS  -...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'INSS - CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS  - 11%',
        'INSS - CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS  - 11%',
        '2022-08-19'::date,
        303.05,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        303.05,
        'pago'::status_parcela,
        303.05,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - COMeRCIO DE DOCES IMPERIAL GOL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - COMeRCIO DE DOCES IMPERIAL GOLD EIR: PACOTE DE BALAS ',
        'COMPRAS PARA LOJA - COMeRCIO DE DOCES IMPERIAL GOLD EIR: PACOTE DE BALAS ',
        '2022-08-19'::date,
        5.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        5.99,
        'pago'::status_parcela,
        5.99,
        '2022-08-19'::date,
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
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - RESTAURANTE ARTE DA COMIDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - RESTAURANTE ARTE DA COMIDA',
        'ALMOcO - RESTAURANTE ARTE DA COMIDA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2022-08-19'::date,
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
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        20.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - DARF MaRCIA TAKIUTTU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - DARF MaRCIA TAKIUTTU',
        'IMPOSTOS - DARF MaRCIA TAKIUTTU',
        '2022-08-19'::date,
        301.38,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        301.38,
        'pago'::status_parcela,
        301.38,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
        7.17,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        7.17,
        'pago'::status_parcela,
        7.17,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- LENTES - VISION PRIME COMeRCIO DE LENTES LTDA: COM...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'LENTES - VISION PRIME COMeRCIO DE LENTES LTDA: COMPRA DE LENTES - PARCELA 1/3',
        'LENTES - VISION PRIME COMeRCIO DE LENTES LTDA: COMPRA DE LENTES - PARCELA 1/3',
        '2022-08-19'::date,
        76.66,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        76.66,
        'pago'::status_parcela,
        76.66,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - DARF VINiCIUS TAKIUTTU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - DARF VINiCIUS TAKIUTTU',
        'IMPOSTOS - DARF VINiCIUS TAKIUTTU',
        '2022-08-19'::date,
        301.39,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        301.39,
        'pago'::status_parcela,
        301.39,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: GRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: GRAMPEADOR',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: GRAMPEADOR',
        '2022-08-19'::date,
        25.7,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        25.7,
        'pago'::status_parcela,
        25.7,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: LARISSA DIAS - META DIaRI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: LARISSA DIAS - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: LARISSA DIAS - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - PADARIA E MERCADO LEVE MAIS PAGUE MENOS:...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - PADARIA E MERCADO LEVE MAIS PAGUE MENOS: PAPEL HIGIeNICO',
        'MERCADO - PADARIA E MERCADO LEVE MAIS PAGUE MENOS: PAPEL HIGIeNICO',
        '2022-08-19'::date,
        18.49,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        18.49,
        'pago'::status_parcela,
        18.49,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - DARF IR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - DARF IR',
        'IMPOSTOS - DARF IR',
        '2022-08-19'::date,
        139.51,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-19'::date,
        139.51,
        'pago'::status_parcela,
        139.51,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: ALDENIR PAULA - META DIaR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: ALDENIR PAULA - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: ALDENIR PAULA - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        12.1,
        'pago'::status_parcela,
        12.1,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- PREMIAcaO - BONIFICAcaO: ZAINE SIQUEIRA - META DIa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PREMIAcaO - BONIFICAcaO: ZAINE SIQUEIRA - META DIaRIA',
        'PREMIAcaO - BONIFICAcaO: ZAINE SIQUEIRA - META DIaRIA',
        '2022-08-19'::date,
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
        '2022-08-19'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2022-08-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 0861: EDNALDO GOMES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 0861: EDNALDO GOMES',
        'RESTANTE DO SINAL - 0861: EDNALDO GOMES',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        180.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0884: ANTÔNIO MARTINS DE SOUZA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0884: ANTÔNIO MARTINS DE SOUZA',
        'VENDAS DINHEIRO - 0884: ANTÔNIO MARTINS DE SOUZA',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 20/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 20/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 20/08)',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 6238: THAIS MONTEIRO DE FRANCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 6238: THAIS MONTEIRO DE FRANCA',
        'RESTANTE DO SINAL - 6238: THAIS MONTEIRO DE FRANCA',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-20'::date,
        480.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        480.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 5810: FRANCISCO ALVES MARIANO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'CARNe - 5810: FRANCISCO ALVES MARIANO',
        'CARNe - 5810: FRANCISCO ALVES MARIANO',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        60.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - CASA DE SALGADOS DEUS e FIEL (DIEGO)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - CASA DE SALGADOS DEUS e FIEL (DIEGO)',
        'ALMOcO - CASA DE SALGADOS DEUS e FIEL (DIEGO)',
        '2022-08-20'::date,
        11.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        11.0,
        'pago'::status_parcela,
        11.0,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0879: CELSO CASTILHO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0879: CELSO CASTILHO',
        'VENDAS DINHEIRO - 0879: CELSO CASTILHO',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 6221: VANDERLEI LUIZ DE SIQUEI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 6221: VANDERLEI LUIZ DE SIQUEIRA',
        'RESTANTE DO SINAL - 6221: VANDERLEI LUIZ DE SIQUEIRA',
        '2022-08-20'::date,
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
        '2022-08-20'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-20'::date,
        126.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        126.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - IMPRESSoES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAPELARIA - IMPRESSoES',
        'PAPELARIA - IMPRESSoES',
        '2022-08-20'::date,
        2.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        2.8,
        'pago'::status_parcela,
        2.8,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - CHIBANA COMeRCIO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - CHIBANA COMeRCIO',
        'MERCADO - CHIBANA COMeRCIO',
        '2022-08-20'::date,
        2.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        2.99,
        'pago'::status_parcela,
        2.99,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-20'::date,
        5.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        5.6,
        'pago'::status_parcela,
        5.6,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - CASA DE SALGADOS DEUS e FIEL (EVELINE)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - CASA DE SALGADOS DEUS e FIEL (EVELINE)',
        'ALMOcO - CASA DE SALGADOS DEUS e FIEL (EVELINE)',
        '2022-08-20'::date,
        11.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        11.0,
        'pago'::status_parcela,
        11.0,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CoPIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAPELARIA - CoPIAS',
        'PAPELARIA - CoPIAS',
        '2022-08-20'::date,
        0.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        0.8,
        'pago'::status_parcela,
        0.8,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALMOcO - PAG* VIVIANI DOS SANTOS DIAS (WEVILLY)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALMOcO - PAG* VIVIANI DOS SANTOS DIAS (WEVILLY)',
        'ALMOcO - PAG* VIVIANI DOS SANTOS DIAS (WEVILLY)',
        '2022-08-20'::date,
        11.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-20'::date,
        11.0,
        'pago'::status_parcela,
        11.0,
        '2022-08-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        94.59,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        94.59,
        'pago'::status_parcela,
        94.59,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 22/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 22/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (REF. 22/08)',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        203.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        203.82,
        'pago'::status_parcela,
        203.82,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: NATHALIA CAROLINA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: NATHALIA CAROLINA',
        'VALE - VALE ADIANTAMENTO: NATHALIA CAROLINA',
        '2022-08-22'::date,
        751.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        751.0,
        'pago'::status_parcela,
        751.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BLO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BLOCO DE RASCUNHO E FOLHA SULFITE',
        'PAPELARIA - CASA ROLLU PAPELARIA E BAZAR LTDA: BLOCO DE RASCUNHO E FOLHA SULFITE',
        '2022-08-22'::date,
        77.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        77.3,
        'pago'::status_parcela,
        77.3,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ALINE HENRIQUE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ALINE HENRIQUE',
        'VALE - VALE ADIANTAMENTO: ALINE HENRIQUE',
        '2022-08-22'::date,
        450.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        450.0,
        'pago'::status_parcela,
        450.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - COFINS: SIMPLES NACIONAL - 07/2022...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - COFINS: SIMPLES NACIONAL - 07/2022',
        'IMPOSTOS - COFINS: SIMPLES NACIONAL - 07/2022',
        '2022-08-22'::date,
        396.64,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        396.64,
        'pago'::status_parcela,
        396.64,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: BALa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: BALaO ',
        'COMPRAS PARA LOJA - FESTIPEL EMBALAGENS LTDA: BALaO ',
        '2022-08-22'::date,
        27.8,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        27.8,
        'pago'::status_parcela,
        27.8,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - ICMS: SIMPLES NACIONAL - 07/2022...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - ICMS: SIMPLES NACIONAL - 07/2022',
        'IMPOSTOS - ICMS: SIMPLES NACIONAL - 07/2022',
        '2022-08-22'::date,
        1042.98,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        1042.98,
        'pago'::status_parcela,
        1042.98,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - INSS: SIMPLES NACIONAL - 07/2022...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - INSS: SIMPLES NACIONAL - 07/2022',
        'IMPOSTOS - INSS: SIMPLES NACIONAL - 07/2022',
        '2022-08-22'::date,
        1307.62,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        1307.62,
        'pago'::status_parcela,
        1307.62,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        310.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        310.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        45.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        58.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        58.99,
        'pago'::status_parcela,
        58.99,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACESSoRIOS - KOFUKO FESTAS: BARBANTE E BEXIGAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ACESSoRIOS - KOFUKO FESTAS: BARBANTE E BEXIGAS',
        'ACESSoRIOS - KOFUKO FESTAS: BARBANTE E BEXIGAS',
        '2022-08-22'::date,
        13.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        13.5,
        'pago'::status_parcela,
        13.5,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ALINE CRISTINA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ALINE CRISTINA',
        'VALE - VALE ADIANTAMENTO: ALINE CRISTINA',
        '2022-08-22'::date,
        665.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        665.0,
        'pago'::status_parcela,
        665.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        308.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        308.11,
        'pago'::status_parcela,
        308.11,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        252.43,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        252.43,
        'pago'::status_parcela,
        252.43,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ALDENIR PAULA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ALDENIR PAULA ',
        'VALE - VALE ADIANTAMENTO: ALDENIR PAULA ',
        '2022-08-22'::date,
        665.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        665.0,
        'pago'::status_parcela,
        665.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        3.36,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        3.36,
        'pago'::status_parcela,
        3.36,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ALINE DA CRUZ SANTOS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ALINE DA CRUZ SANTOS',
        'VALE - VALE ADIANTAMENTO: ALINE DA CRUZ SANTOS',
        '2022-08-22'::date,
        665.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        665.0,
        'pago'::status_parcela,
        665.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 6187: ADENILDO BASiLIO DOS SAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 6187: ADENILDO BASiLIO DOS SANTOS ',
        'RESTANTE DO SINAL - 6187: ADENILDO BASiLIO DOS SANTOS ',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        300.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ZAINE DE LIMA SIQUEIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ZAINE DE LIMA SIQUEIRA',
        'VALE - VALE ADIANTAMENTO: ZAINE DE LIMA SIQUEIRA',
        '2022-08-22'::date,
        607.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        607.0,
        'pago'::status_parcela,
        607.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        153.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        153.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        177.38,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        177.38,
        'pago'::status_parcela,
        177.38,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 5408: LIDIANE MILITaO DE LIMA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'CARNe - 5408: LIDIANE MILITaO DE LIMA',
        'CARNe - 5408: LIDIANE MILITaO DE LIMA',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        70.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6241: CIRO IVO DE OLIVEIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6241: CIRO IVO DE OLIVEIRA',
        'VENDAS DINHEIRO - 6241: CIRO IVO DE OLIVEIRA',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        20.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 0918: SELMA RODRIGUES DE SOUZA - PARCELA 1...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'CARNe - 0918: SELMA RODRIGUES DE SOUZA - PARCELA 1/3',
        'CARNe - 0918: SELMA RODRIGUES DE SOUZA - PARCELA 1/3',
        '2022-08-22'::date,
        42.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        42.5,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        171.24,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        171.24,
        'pago'::status_parcela,
        171.24,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        25.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        25.99,
        'pago'::status_parcela,
        25.99,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        20.49,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        20.49,
        'pago'::status_parcela,
        20.49,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        190.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESTANTE DO SINAL - 0879: CELSO CASTILHO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'RESTANTE DO SINAL - 0879: CELSO CASTILHO',
        'RESTANTE DO SINAL - 0879: CELSO CASTILHO',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        250.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        63.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        63.33,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - PIS: SIMPLES NACIONAL - 07/2022...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - PIS: SIMPLES NACIONAL - 07/2022',
        'IMPOSTOS - PIS: SIMPLES NACIONAL - 07/2022',
        '2022-08-22'::date,
        85.93,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        85.93,
        'pago'::status_parcela,
        85.93,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        11.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        11.9,
        'pago'::status_parcela,
        11.9,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: EMERSON WILLIAM...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: EMERSON WILLIAM',
        'VALE - VALE ADIANTAMENTO: EMERSON WILLIAM',
        '2022-08-22'::date,
        665.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        665.0,
        'pago'::status_parcela,
        665.0,
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        212.34,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        212.34,
        'pago'::status_parcela,
        212.34,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6242: LEIA FeLIX DE OLIVEIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6242: LEIA FeLIX DE OLIVEIRA',
        'VENDAS DINHEIRO - 6242: LEIA FeLIX DE OLIVEIRA',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        20.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE - VALE ADIANTAMENTO: ANDREIA PAES ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE - VALE ADIANTAMENTO: ANDREIA PAES ',
        'VALE - VALE ADIANTAMENTO: ANDREIA PAES ',
        '2022-08-22'::date,
        778.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        778.0,
        'pago'::status_parcela,
        778.0,
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        4.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        4.03,
        'pago'::status_parcela,
        4.03,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        3089.87,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        3089.87,
        'pago'::status_parcela,
        3089.87,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        606.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        606.0,
        'pago'::status_parcela,
        606.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- PAGTO CONTA INTERNET/TELEFONE    - CLARO NET: LOJA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'PAGTO CONTA INTERNET/TELEFONE    - CLARO NET: LOJA',
        'PAGTO CONTA INTERNET/TELEFONE    - CLARO NET: LOJA',
        '2022-08-22'::date,
        104.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        104.99,
        'pago'::status_parcela,
        104.99,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        159.07,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        159.07,
        'pago'::status_parcela,
        159.07,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0888: ANA CLARA RODRIGUES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0888: ANA CLARA RODRIGUES',
        'VENDAS DINHEIRO - 0888: ANA CLARA RODRIGUES',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        250.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - MERCADO LEVE MAIS PAGUE MENOS: CAFe E Pa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - MERCADO LEVE MAIS PAGUE MENOS: CAFe E PaO FRANCeS',
        'MERCADO - MERCADO LEVE MAIS PAGUE MENOS: CAFe E PaO FRANCeS',
        '2022-08-22'::date,
        25.68,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        25.68,
        'pago'::status_parcela,
        25.68,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- IMPOSTOS - CSLL: SIMPLES NACIONAL - 07/2022...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'IMPOSTOS - CSLL: SIMPLES NACIONAL - 07/2022',
        'IMPOSTOS - CSLL: SIMPLES NACIONAL - 07/2022',
        '2022-08-22'::date,
        108.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        108.97,
        'pago'::status_parcela,
        108.97,
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        329.72,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        329.72,
        'pago'::status_parcela,
        329.72,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - FREELANCER: ALINE HENRIQUE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - FREELANCER: ALINE HENRIQUE  (REF. A 02 DIAS TRABALHADOS - 20/08 E 22/08) ',
        'DESPESAS FUNCIONaRIOS - FREELANCER: ALINE HENRIQUE  (REF. A 02 DIAS TRABALHADOS - 20/08 E 22/08) ',
        '2022-08-22'::date,
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
        '2022-08-22'::date,
        60.0,
        'pago'::status_parcela,
        60.0,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        334.58,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        334.58,
        'pago'::status_parcela,
        334.58,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-22'::date,
        40.83,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-22'::date,
        40.83,
        'pago'::status_parcela,
        40.83,
        '2022-08-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6252: CIRLEI VIEIRA PINTO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6252: CIRLEI VIEIRA PINTO',
        'VENDAS DINHEIRO - 6252: CIRLEI VIEIRA PINTO',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - SEIJUN YAMAUCHI PAPELARIA - ME...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - SEIJUN YAMAUCHI PAPELARIA - ME',
        'COMPRAS PARA LOJA - SEIJUN YAMAUCHI PAPELARIA - ME',
        '2022-08-23'::date,
        12.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        12.9,
        'pago'::status_parcela,
        12.9,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL - CONCEPT IMoVEIS LTDA: ESCRIToRIO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'ALUGUEL - CONCEPT IMoVEIS LTDA: ESCRIToRIO',
        'ALUGUEL - CONCEPT IMoVEIS LTDA: ESCRIToRIO',
        '2022-08-23'::date,
        2490.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        2490.0,
        'pago'::status_parcela,
        2490.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-23'::date,
        632.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        632.0,
        'pago'::status_parcela,
        632.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ENIO (23/08)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (23/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ENIO (23/08)',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        10.0,
        'pago'::status_parcela,
        10.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS PARA LOJA - F D I BAZAR LTDA ME...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'COMPRAS PARA LOJA - F D I BAZAR LTDA ME',
        'COMPRAS PARA LOJA - F D I BAZAR LTDA ME',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        7.0,
        'pago'::status_parcela,
        7.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-23'::date,
        1334.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        1334.0,
        'pago'::status_parcela,
        1334.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-23'::date,
        5.77,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        5.77,
        'pago'::status_parcela,
        5.77,
        '2022-08-23'::date,
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
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        15.0,
        'pago'::status_parcela,
        15.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - S L PANIFICAcaO E CONVENIeNCIA: PaO FRAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA: PaO FRANCeS',
        'MERCADO - S L PANIFICAcaO E CONVENIeNCIA: PaO FRANCeS',
        '2022-08-23'::date,
        9.83,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        9.83,
        'pago'::status_parcela,
        9.83,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        34.65,
        'pago'::status_parcela,
        34.65,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 0890: GERMANDO FERREIRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 0890: GERMANDO FERREIRA',
        'VENDAS DINHEIRO - 0890: GERMANDO FERREIRA',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- GASTO COM MeDICOS - OPTOMETRISTA: MAURiCIO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'GASTO COM MeDICOS - OPTOMETRISTA: MAURiCIO',
        'GASTO COM MeDICOS - OPTOMETRISTA: MAURiCIO',
        '2022-08-23'::date,
        750.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        750.0,
        'pago'::status_parcela,
        750.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- nan...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'nan',
        'nan',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. A MEIO PERiODO TRABALHADO) ',
        'DESPESAS FUNCIONaRIOS - FREELANCER: JeSSICA (REF. A MEIO PERiODO TRABALHADO) ',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - DIVULGAcaO: eNIO MASCARENH...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - DIVULGAcaO: eNIO MASCARENHAS  (REF. 16/08 A 20/08)',
        'DESPESAS FUNCIONaRIOS - DIVULGAcaO: eNIO MASCARENHAS  (REF. 16/08 A 20/08)',
        '2022-08-23'::date,
        160.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        160.0,
        'pago'::status_parcela,
        160.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- MERCADO - SUPERMERCADO VERAN: ENERGeTICO (JuNIOR),...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'MERCADO - SUPERMERCADO VERAN: ENERGeTICO (JuNIOR), ISQUEIRO E PAPEL HIGIeNICO',
        'MERCADO - SUPERMERCADO VERAN: ENERGeTICO (JuNIOR), ISQUEIRO E PAPEL HIGIeNICO',
        '2022-08-23'::date,
        47.22,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        47.22,
        'pago'::status_parcela,
        47.22,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- VENDAS DINHEIRO - 6250: MARIA SOCORRO MOREIRA ALVE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VENDAS DINHEIRO - 6250: MARIA SOCORRO MOREIRA ALVES',
        'VENDAS DINHEIRO - 6250: MARIA SOCORRO MOREIRA ALVES',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        650.0,
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
        '2022-08-23'::date,
        96.98,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        96.98,
        'pago'::status_parcela,
        96.98,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 0857: NEUSA DA SILVA ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'CARNe - 0857: NEUSA DA SILVA ',
        'CARNe - 0857: NEUSA DA SILVA ',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        30.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE - VALE TRANSPORTE: ALINE HENRIQUE ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'VALE TRANSPORTE - VALE TRANSPORTE: ALINE HENRIQUE DOS SANTOS (REF. 16/08 A 24/08)',
        'VALE TRANSPORTE - VALE TRANSPORTE: ALINE HENRIQUE DOS SANTOS (REF. 16/08 A 24/08)',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        80.0,
        'pago'::status_parcela,
        80.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - FREELANCER: IAGO DE JESUS ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - FREELANCER: IAGO DE JESUS OLIVEIRA (REF. A 01 DIA TRABALHADO)',
        'DESPESAS FUNCIONaRIOS - FREELANCER: IAGO DE JESUS OLIVEIRA (REF. A 01 DIA TRABALHADO)',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        60.0,
        'pago'::status_parcela,
        60.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- DESPESAS FUNCIONaRIOS - ACORDO 3/3: ZAYNE CORDEIRO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'DESPESAS FUNCIONaRIOS - ACORDO 3/3: ZAYNE CORDEIRO',
        'DESPESAS FUNCIONaRIOS - ACORDO 3/3: ZAYNE CORDEIRO',
        '2022-08-23'::date,
        2000.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        2000.0,
        'pago'::status_parcela,
        2000.0,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 4900: MARIA JOSe SANTOS SANTANA LIECHTI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'CARNe - 4900: MARIA JOSe SANTOS SANTANA LIECHTI',
        'CARNe - 4900: MARIA JOSe SANTOS SANTANA LIECHTI',
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        180.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
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
        '2022-08-23'::date,
        581.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        581.0,
        'pago'::status_parcela,
        581.0,
        '2022-08-23'::date,
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
        '2022-08-23'::date,
        24.68,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2022-08-23'::date,
        24.68,
        'pago'::status_parcela,
        24.68,
        '2022-08-23'::date,
        NOW(),
        NOW()
    );
END $$;

-- CARNe - 0941: JOELMA RODRIGUES - PARCELA 1/3...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
