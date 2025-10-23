    
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
        'Conciliação - PIX RECEBIDO - DANIEL LUIZ CUSTODIO',
        'Conciliação - PIX RECEBIDO - DANIEL LUIZ CUSTODIO',
        '2024-06-19'::date,
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
        '2024-06-19'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-19'::date,
        2507.71,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        2507.71,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        '2024-06-19'::date,
        276.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        276.0,
        'pago'::status_parcela,
        276.0,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-19'::date,
        267.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        267.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- HASTEN MARKETING E PRODUÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'HASTEN MARKETING E PRODUÇÕES',
        'HASTEN MARKETING E PRODUÇÕES',
        '2024-06-19'::date,
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
        '2024-06-19'::date,
        900.0,
        'pago'::status_parcela,
        900.0,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- HASTEN MARKETING E PRODUÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'HASTEN MARKETING E PRODUÇÕES',
        'HASTEN MARKETING E PRODUÇÕES',
        '2024-06-19'::date,
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
        '2024-06-19'::date,
        720.0,
        'pago'::status_parcela,
        720.0,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-19'::date,
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
        '2024-06-19'::date,
        30.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE SOLARES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE SOLARES',
        'COMPRA DE SOLARES',
        '2024-06-19'::date,
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
        '2024-06-19'::date,
        30.0,
        'pago'::status_parcela,
        30.0,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- MD Materias p/ construção : Thinner, massa corrida...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MD Materias p/ construção : Thinner, massa corrida e vassoura > PIX: 490.832.378-00 (CPF)',
        'MD Materias p/ construção : Thinner, massa corrida e vassoura > PIX: 490.832.378-00 (CPF)',
        '2024-06-19'::date,
        72.35,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        72.35,
        'pago'::status_parcela,
        72.35,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- SEIJUN YAMAUCHI PAPELARIA ME: Envelopes...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SEIJUN YAMAUCHI PAPELARIA ME: Envelopes',
        'SEIJUN YAMAUCHI PAPELARIA ME: Envelopes',
        '2024-06-19'::date,
        8.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        8.9,
        'pago'::status_parcela,
        8.9,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- compras mercado livre 80645238599...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'compras mercado livre 80645238599',
        'compras mercado livre 80645238599',
        '2024-06-19'::date,
        62.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        62.0,
        'pago'::status_parcela,
        62.0,
        '2024-06-19'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        '2024-06-19'::date,
        519.74,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-19'::date,
        519.74,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        84.0,
        'pago'::status_parcela,
        84.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        '2025-10-18'::date,
        884.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        884.9,
        'pago'::status_parcela,
        884.9,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- IRPJ: Simples Nacional 05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'IRPJ: Simples Nacional 05/2024',
        'IRPJ: Simples Nacional 05/2024',
        '2025-10-18'::date,
        1.87,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        1.87,
        'pago'::status_parcela,
        1.87,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOMETRISTA: Eduardo 1° Quinz. Junho > PIX: 226.0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOMETRISTA: Eduardo 1° Quinz. Junho > PIX: 226.063.238-66 (CPF) / (11) 9 4717-6553 (celular)',
        'OPTOMETRISTA: Eduardo 1° Quinz. Junho > PIX: 226.063.238-66 (CPF) / (11) 9 4717-6553 (celular)',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        90.0,
        'pago'::status_parcela,
        90.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        '2024-06-20'::date,
        631.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        631.11,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SOLÓTICA: Lentes de contato (Cód. cliente: 21341 -...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SOLÓTICA: Lentes de contato (Cód. cliente: 21341 - ref. NF 001582944) > PIX: 65.532.707/0001-94 (CNPJ)',
        'SOLÓTICA: Lentes de contato (Cód. cliente: 21341 - ref. NF 001582944) > PIX: 65.532.707/0001-94 (CNPJ)',
        '2024-07-17'::date,
        246.49,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-17'::date,
        246.49,
        'pago'::status_parcela,
        246.49,
        '2024-07-17'::date,
        NOW(),
        NOW()
    );
END $$;

-- INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190/0001-01 (CNPJ) - ref. 12/06/2024 (Gislene Lima) - 15 atend.',
        'INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190/0001-01 (CNPJ) - ref. 12/06/2024 (Gislene Lima) - 15 atend.',
        '2025-02-18'::date,
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
        '2025-02-18'::date,
        450.0,
        'pago'::status_parcela,
        450.0,
        '2025-02-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        '2024-06-20'::date,
        439.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        439.97,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Rosangela Aparecida Dejane Feli...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
        'VALE ADIANTAMENTO: Rosangela Aparecida Dejane Felisbino > PIX: 116.378.698-51 (CPF)',
        '2024-06-20'::date,
        849.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        849.0,
        'pago'::status_parcela,
        849.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL LOJA - MAUÁ (IPTU)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL LOJA - MAUÁ (IPTU)',
        'ALUGUEL LOJA - MAUÁ (IPTU)',
        '2024-06-21'::date,
        93.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        93.0,
        'pago'::status_parcela,
        93.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Rogério Aparecido de Morais > P...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Rogério Aparecido de Morais > PIX: ro.gerio.morais@hotmail.com (e-mail)',
        'VALE ADIANTAMENTO: Rogério Aparecido de Morais > PIX: ro.gerio.morais@hotmail.com (e-mail)',
        '2024-06-20'::date,
        760.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        760.0,
        'pago'::status_parcela,
        760.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        '2025-10-18'::date,
        618.04,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        618.04,
        'pago'::status_parcela,
        618.04,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- CSLL: Simples Nacional 05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CSLL: Simples Nacional 05/2024',
        'CSLL: Simples Nacional 05/2024',
        '2025-10-18'::date,
        1.19,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        1.19,
        'pago'::status_parcela,
        1.19,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (SÃO MATEUS)',
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (SÃO MATEUS)',
        '2024-06-20'::date,
        659.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        659.0,
        'pago'::status_parcela,
        659.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        '2024-06-20'::date,
        612.68,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        612.68,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Eliana Savoia > PIX: (11) 9 471...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Eliana Savoia > PIX: (11) 9 4714-9764 (celular)',
        'VALE ADIANTAMENTO: Eliana Savoia > PIX: (11) 9 4714-9764 (celular)',
        '2024-06-20'::date,
        760.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        760.0,
        'pago'::status_parcela,
        760.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - JOÃO PEDRO PA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - JOÃO PEDRO PAIVA SILVA',
        'Conciliação - QR CODE PIX RECEBIDO - JOÃO PEDRO PAIVA SILVA',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        90.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Maria Elizabeth Pereira do Nasc...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
        'VALE ADIANTAMENTO: Maria Elizabeth Pereira do Nascimento > PIX: 542.980.671-49 (CPF)',
        '2024-06-20'::date,
        848.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        848.0,
        'pago'::status_parcela,
        848.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- IRRF - RENDIMENTO DO TRABALHO ASSALARIADO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        '2025-10-18'::date,
        53.24,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        53.24,
        'pago'::status_parcela,
        53.24,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- COFINS: Simples Nacional 05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COFINS: Simples Nacional 05/2024',
        'COFINS: Simples Nacional 05/2024',
        '2025-10-18'::date,
        4.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        4.33,
        'pago'::status_parcela,
        4.33,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL LOJA - MAUÁ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL LOJA - MAUÁ',
        'ALUGUEL LOJA - MAUÁ',
        '2024-06-21'::date,
        3005.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        3005.9,
        'pago'::status_parcela,
        3005.9,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX: (19) 9 9127-3092 (celular) ~ (SUZANO II)',
        'VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX: (19) 9 9127-3092 (celular) ~ (SUZANO II)',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        200.0,
        'pago'::status_parcela,
        200.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX: (19) 9 9127-3092 (celular) ~ (RIO PEQUENO)',
        'VALE ADIANTAMENTO: Thiago Yuri da Silva Yuki > PIX: (19) 9 9127-3092 (celular) ~ (RIO PEQUENO)',
        '2024-06-20'::date,
        600.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        600.0,
        'pago'::status_parcela,
        600.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413.050.558-02 (CPF) ~ (moedas escritório)',
        'VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413.050.558-02 (CPF) ~ (moedas escritório)',
        '2024-06-20'::date,
        0.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        0.2,
        'pago'::status_parcela,
        0.2,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS - 11%...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS - 11%',
        'CP SEGURADOS - CONTRIBUINTES INDIVIDUAIS - 11%',
        '2025-10-18'::date,
        348.29,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        348.29,
        'pago'::status_parcela,
        348.29,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCAR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL DEBITO MASTERCARD',
        '2024-06-20'::date,
        29.7,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        29.7,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - PALOMA DE SOUSA CARVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - PALOMA DE SOUSA CARVALHO',
        'Conciliação - PIX RECEBIDO - PALOMA DE SOUSA CARVALHO',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Retirada de moedas...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Retirada de moedas',
        'Retirada de moedas',
        '2024-06-20'::date,
        0.25,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        0.25,
        'pago'::status_parcela,
        0.25,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-20'::date,
        312.4,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        312.4,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PIS: Simples Nacional 05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PIS: Simples Nacional 05/2024',
        'PIS: Simples Nacional 05/2024',
        '2025-10-18'::date,
        0.94,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        0.94,
        'pago'::status_parcela,
        0.94,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - ROSA MARIA MARTINS SO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - ROSA MARIA MARTINS SOUSA REIS',
        'Conciliação - PIX RECEBIDO - ROSA MARIA MARTINS SOUSA REIS',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-20'::date,
        1400.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        1400.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Wevilly de Souza Fernandes Líba...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Wevilly de Souza Fernandes Líbano > PIX: 453.302.308-88 (CPF)',
        'VALE ADIANTAMENTO: Wevilly de Souza Fernandes Líbano > PIX: 453.302.308-88 (CPF)',
        '2024-06-20'::date,
        890.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        890.0,
        'pago'::status_parcela,
        890.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL CLÍNICA - MAUÁ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL CLÍNICA - MAUÁ',
        'ALUGUEL CLÍNICA - MAUÁ',
        '2024-06-21'::date,
        3005.9,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        3005.9,
        'pago'::status_parcela,
        3005.9,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Vanessa Mendes da Silva > PIX: ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Vanessa Mendes da Silva > PIX: vanessamendys151619@gmail.com (e-mail)',
        'VALE ADIANTAMENTO: Vanessa Mendes da Silva > PIX: vanessamendys151619@gmail.com (e-mail)',
        '2024-06-20'::date,
        759.36,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        759.36,
        'pago'::status_parcela,
        759.36,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL DEBITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
        'Conciliação - VENDAS - DISPONIVEL DEBITO VISA',
        '2024-06-20'::date,
        98.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        98.99,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-20'::date,
        188.29,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        188.29,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ICMS: Simples Nacional 05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ICMS: Simples Nacional 05/2024',
        'ICMS: Simples Nacional 05/2024',
        '2025-10-18'::date,
        11.56,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        11.56,
        'pago'::status_parcela,
        11.56,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (moedas escritório)',
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (moedas escritório)',
        '2024-06-20'::date,
        0.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        0.2,
        'pago'::status_parcela,
        0.2,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Retirada de moedas...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Retirada de moedas',
        'Retirada de moedas',
        '2024-06-20'::date,
        0.4,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        0.4,
        'pago'::status_parcela,
        0.4,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-20'::date,
        1116.26,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        1116.26,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Larissa Dias Fernandes Cardozo ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Larissa Dias Fernandes Cardozo > PIX: larissadiss766@gmail.com (e-mail)',
        'VALE ADIANTAMENTO: Larissa Dias Fernandes Cardozo > PIX: larissadiss766@gmail.com (e-mail)',
        '2024-06-20'::date,
        764.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        764.0,
        'pago'::status_parcela,
        764.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araú...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
        '2024-06-20'::date,
        459.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        459.0,
        'pago'::status_parcela,
        459.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - EDUARDO APARE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - EDUARDO APARECIDO DE HOLANDO',
        'Conciliação - QR CODE PIX RECEBIDO - EDUARDO APARECIDO DE HOLANDO',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        20.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        '2025-10-18'::date,
        459.37,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        459.37,
        'pago'::status_parcela,
        459.37,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - JANAINA DA SILVA DANT...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - JANAINA DA SILVA DANTAS',
        'Conciliação - PIX RECEBIDO - JANAINA DA SILVA DANTAS',
        '2024-06-20'::date,
        189.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        189.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Débora Lemes Siqueira > PIX: 38...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Débora Lemes Siqueira > PIX: 385.289.258-97 (CPF)',
        'VALE ADIANTAMENTO: Débora Lemes Siqueira > PIX: 385.289.258-97 (CPF)',
        '2024-06-20'::date,
        656.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        656.0,
        'pago'::status_parcela,
        656.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Ariani Dias Fernandes Líbano > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
        'VALE ADIANTAMENTO: Ariani Dias Fernandes Líbano > PIX: 487.287.868-07 (CPF)',
        '2024-06-20'::date,
        870.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        870.0,
        'pago'::status_parcela,
        870.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        'CONTRIBUIÇÃO PREVIDENCIÁRIA DESCONTA SEGURADO-EMPREGADO/AVULSO',
        '2025-10-18'::date,
        28.47,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        28.47,
        'pago'::status_parcela,
        28.47,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - CELIA REGINA ESPÍNDOL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - CELIA REGINA ESPÍNDOLA DOS SANTOS',
        'Conciliação - PIX RECEBIDO - CELIA REGINA ESPÍNDOLA DOS SANTOS',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO VISA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        'Conciliação - VENDAS - DISPONIVEL CREDITO VISA',
        '2024-06-20'::date,
        750.34,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        750.34,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete úni...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Luana Cristina Martins Campos >...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Luana Cristina Martins Campos > PIX: luanabraz0912@gmail.com (e-mail)',
        'VALE ADIANTAMENTO: Luana Cristina Martins Campos > PIX: luanabraz0912@gmail.com (e-mail)',
        '2024-06-20'::date,
        729.32,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        729.32,
        'pago'::status_parcela,
        729.32,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL CLÍNICA - MAUÁ (IPTU)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
        'ALUGUEL CLÍNICA - MAUÁ (IPTU)',
        '2024-06-21'::date,
        93.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        93.0,
        'pago'::status_parcela,
        93.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL LOJA - RIO PEQUENO > PIX: 52.597.549/0001-...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL LOJA - RIO PEQUENO > PIX: 52.597.549/0001-09 (CNPJ)',
        'ALUGUEL LOJA - RIO PEQUENO > PIX: 52.597.549/0001-09 (CNPJ)',
        '2024-06-20'::date,
        2875.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        2875.0,
        'pago'::status_parcela,
        2875.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- IRRF - RENDIMENTO DO TRABALHO ASSALARIADO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        '2025-10-18'::date,
        205.32,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        205.32,
        'pago'::status_parcela,
        205.32,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Jocicreide Macedo Barbosa Santo...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Jocicreide Macedo Barbosa Santos > PIX: (11) 9 8018-0836 (celular)',
        'VALE ADIANTAMENTO: Jocicreide Macedo Barbosa Santos > PIX: (11) 9 8018-0836 (celular)',
        '2024-06-20'::date,
        746.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        746.0,
        'pago'::status_parcela,
        746.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araú...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) ~ (moedas escritório)',
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) ~ (moedas escritório)',
        '2024-06-20'::date,
        0.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        0.2,
        'pago'::status_parcela,
        0.2,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        '2025-10-18'::date,
        425.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        425.97,
        'pago'::status_parcela,
        425.97,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Felipe Roger Miranda > PIX: 408...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Felipe Roger Miranda > PIX: 408.160.988-83 (CPF)',
        'VALE ADIANTAMENTO: Felipe Roger Miranda > PIX: 408.160.988-83 (CPF)',
        '2024-06-20'::date,
        889.36,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        889.36,
        'pago'::status_parcela,
        889.36,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - ROSANGELA PAI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - ROSANGELA PAIVA PEREIRA',
        'Conciliação - QR CODE PIX RECEBIDO - ROSANGELA PAIVA PEREIRA',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        419.92,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        419.92,
        'pago'::status_parcela,
        419.92,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Padaria Renascer: Pão francês > Nicolas Coutinho >...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Padaria Renascer: Pão francês > Nicolas Coutinho > PIX: 490.832.378-00 (CPF) Referente ao pão do dia19/06/2024',
        'Padaria Renascer: Pão francês > Nicolas Coutinho > PIX: 490.832.378-00 (CPF) Referente ao pão do dia19/06/2024',
        '2024-07-01'::date,
        6.06,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-01'::date,
        6.06,
        'pago'::status_parcela,
        6.06,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - THONY GUSTAVE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - THONY GUSTAVE',
        'Conciliação - QR CODE PIX RECEBIDO - THONY GUSTAVE',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        300.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- INSS: Simples Nacional  05/2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'INSS: Simples Nacional  05/2024',
        'INSS: Simples Nacional  05/2024',
        '2025-10-18'::date,
        14.11,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        14.11,
        'pago'::status_parcela,
        14.11,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Padaria Renascer: Pão francês > Nicolas Coutinho >...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Padaria Renascer: Pão francês > Nicolas Coutinho > PIX: 490.832.378-00 (CPF) Referente ao pão do dia20/06/2024',
        'Padaria Renascer: Pão francês > Nicolas Coutinho > PIX: 490.832.378-00 (CPF) Referente ao pão do dia20/06/2024',
        '2024-07-01'::date,
        8.08,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-01'::date,
        8.08,
        'pago'::status_parcela,
        8.08,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413.050.558-02 (CPF) ~ (MAUÁ)',
        'VALE ADIANTAMENTO: Mike Rodrigues Gomes > PIX: 413.050.558-02 (CPF) ~ (MAUÁ)',
        '2024-06-20'::date,
        759.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        759.0,
        'pago'::status_parcela,
        759.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        'FUNDO DE GARANTIA DO TEMPO DE SERVIÇO (competência 05/2024)',
        '2025-10-18'::date,
        776.24,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        776.24,
        'pago'::status_parcela,
        776.24,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (PERUS)',
        'VALE ADIANTAMENTO: Nicolas Coutinho da Silva > PIX: 490.832.378-00 (CPF) ~ (PERUS)',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        100.0,
        'pago'::status_parcela,
        100.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GIGI C V O LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        '2024-06-20'::date,
        568.32,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        568.32,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - SABRINA DA SI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - SABRINA DA SILVA CAMPOS ROCHA',
        'Conciliação - QR CODE PIX RECEBIDO - SABRINA DA SILVA CAMPOS ROCHA',
        '2024-06-20'::date,
        230.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        230.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araú...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) ~ (MAUÁ)',
        'VALE ADIANTAMENTO: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF) ~ (MAUÁ)',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        300.0,
        'pago'::status_parcela,
        300.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        147.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        147.82,
        'pago'::status_parcela,
        147.82,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Folha sulfite...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Folha sulfite',
        'Folha sulfite',
        '2024-06-20'::date,
        7.75,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        7.75,
        'pago'::status_parcela,
        7.75,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- IRRF - RENDIMENTO DO TRABALHO ASSALARIADO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        'IRRF - RENDIMENTO DO TRABALHO ASSALARIADO',
        '2025-10-18'::date,
        49.76,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2025-10-18'::date,
        49.76,
        'pago'::status_parcela,
        49.76,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - JOAO CARLOS DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - JOAO CARLOS DA SILVA',
        'Conciliação - PIX RECEBIDO - JOAO CARLOS DA SILVA',
        '2024-06-20'::date,
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
        '2024-06-20'::date,
        125.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
        'VALE ADIANTAMENTO: Aline Cristina Moreira da Cunha > PIX: 537.903.908-10 (CPF)',
        '2024-06-20'::date,
        890.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-20'::date,
        890.0,
        'pago'::status_parcela,
        890.0,
        '2024-06-20'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - VANESSA MENDE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - VANESSA MENDES DA SILVA',
        'Conciliação - QR CODE PIX RECEBIDO - VANESSA MENDES DA SILVA',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - ROSANGELA MENDES DA S...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - ROSANGELA MENDES DA SILVA',
        'Conciliação - PIX RECEBIDO - ROSANGELA MENDES DA SILVA',
        '2024-06-21'::date,
        137.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        137.5,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SABESP - LOJA SUZANO 2 RGI 0046782494...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SABESP - LOJA SUZANO 2 RGI 0046782494',
        'SABESP - LOJA SUZANO 2 RGI 0046782494',
        '2024-10-04'::date,
        170.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-10-04'::date,
        170.03,
        'pago'::status_parcela,
        170.03,
        '2024-10-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - SHIRLEI FACUN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - SHIRLEI FACUNDE VITURIANO',
        'Conciliação - QR CODE PIX RECEBIDO - SHIRLEI FACUNDE VITURIANO',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        250.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE ARMAÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE ARMAÇÕES',
        'COMPRA DE ARMAÇÕES',
        '2024-06-21'::date,
        111.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        111.5,
        'pago'::status_parcela,
        111.5,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: ACERTO FRANQUIA > Parcela 17/40 > PIX: 39....
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: ACERTO FRANQUIA > Parcela 17/40 > PIX: 39.406.028/0001-69 (CNPJ)',
        'ACORDO: ACERTO FRANQUIA > Parcela 17/40 > PIX: 39.406.028/0001-69 (CNPJ)',
        '2024-06-21'::date,
        318.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        318.0,
        'pago'::status_parcela,
        318.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        220.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
        'VALE TRANSPORTE: Kayllaine Pereira Alves de Araújo > PIX: 426.663.838-81 (CPF)',
        '2024-07-01'::date,
        127.2,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-01'::date,
        127.2,
        'pago'::status_parcela,
        127.2,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GIGI C V O LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        '2024-06-21'::date,
        3565.13,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        3565.13,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - VALDENICE DIAS...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - VALDENICE DIAS',
        'Conciliação - PIX RECEBIDO - VALDENICE DIAS',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete úni...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        '2024-06-21'::date,
        193.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        193.0,
        'pago'::status_parcela,
        193.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - IZABEL MOREIRA DA SIL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - IZABEL MOREIRA DA SILVA',
        'Conciliação - PIX RECEBIDO - IZABEL MOREIRA DA SILVA',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        224.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-21'::date,
        1200.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        1200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - RECARGA DE CELULAR - TIM - (11) ****...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Conciliação - RECARGA DE CELULAR - TIM - (11) *****-5739',
        'Conciliação - RECARGA DE CELULAR - TIM - (11) *****-5739',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        20.0,
        'pago'::status_parcela,
        20.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-21'::date,
        3167.95,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        3167.95,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SABESP - LOJA SUZANO RGI 0046736387...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SABESP - LOJA SUZANO RGI 0046736387',
        'SABESP - LOJA SUZANO RGI 0046736387',
        '2024-10-04'::date,
        170.03,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-10-04'::date,
        170.03,
        'pago'::status_parcela,
        170.03,
        '2024-10-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE LENTES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE LENTES',
        'COMPRA DE LENTES',
        '2024-06-21'::date,
        111.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        111.5,
        'pago'::status_parcela,
        111.5,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-21'::date,
        897.89,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-21'::date,
        897.89,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - LUANA CRISTIN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - LUANA CRISTINA MARTINS CAMPOS',
        'Conciliação - QR CODE PIX RECEBIDO - LUANA CRISTINA MARTINS CAMPOS',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX ENVIADO - TATIANA MELLO DE CAMAR...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Conciliação - PIX ENVIADO - TATIANA MELLO DE CAMARGO',
        'Conciliação - PIX ENVIADO - TATIANA MELLO DE CAMARGO',
        '2024-06-21'::date,
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
        '2024-06-21'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2024-06-21'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - PEDRO BRITO P...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - PEDRO BRITO PEREIRA',
        'Conciliação - QR CODE PIX RECEBIDO - PEDRO BRITO PEREIRA',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        1000.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- FREELANCER: Nathalia Carolina Cardoso Ribeiro Faus...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FREELANCER: Nathalia Carolina Cardoso Ribeiro Faustino (ref. 22/06/2024)',
        'FREELANCER: Nathalia Carolina Cardoso Ribeiro Faustino (ref. 22/06/2024)',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        120.0,
        'pago'::status_parcela,
        120.0,
        '2024-06-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        550.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-22'::date,
        1328.89,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        1328.89,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - BRUNO DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - BRUNO DA SILVA',
        'Conciliação - PIX RECEBIDO - BRUNO DA SILVA',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        85.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - CLEBER DA SILVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - CLEBER DA SILVA',
        'Conciliação - PIX RECEBIDO - CLEBER DA SILVA',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-22'::date,
        102.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        102.6,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Retirada de moedas...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Retirada de moedas',
        'Retirada de moedas',
        '2024-06-22'::date,
        0.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        0.6,
        'pago'::status_parcela,
        0.6,
        '2024-06-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL DEBITO ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        '2024-06-22'::date,
        280.44,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        280.44,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CHAVEIRO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CHAVEIRO',
        'CHAVEIRO',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        250.0,
        'pago'::status_parcela,
        250.0,
        '2024-06-22'::date,
        NOW(),
        NOW()
    );
END $$;

-- PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > PIX: 1...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > PIX: 15.495.166/0001-01 (CNPJ)',
        'PASSWORD INTERATIVA BI E SOFTWARE - VIXEN > PIX: 15.495.166/0001-01 (CNPJ)',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        270.0,
        'pago'::status_parcela,
        270.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - JOSE FERNANDES DOS SA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - JOSE FERNANDES DOS SANTOS',
        'Conciliação - PIX RECEBIDO - JOSE FERNANDES DOS SANTOS',
        '2024-06-22'::date,
        107.5,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        107.5,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - LAÍS FLORENTINO DA SI...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - LAÍS FLORENTINO DA SILVA',
        'Conciliação - PIX RECEBIDO - LAÍS FLORENTINO DA SILVA',
        '2024-06-22'::date,
        186.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        186.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-22'::date,
        339.34,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-22'::date,
        339.34,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - FABIANA ALVES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - FABIANA ALVES VERISSIMO DOS SANTOS',
        'Conciliação - QR CODE PIX RECEBIDO - FABIANA ALVES VERISSIMO DOS SANTOS',
        '2024-06-22'::date,
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
        '2024-06-22'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL ESCRITÓRIO - SUZANO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL ESCRITÓRIO - SUZANO',
        'ALUGUEL ESCRITÓRIO - SUZANO',
        '2024-06-24'::date,
        2294.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        2294.0,
        'pago'::status_parcela,
        2294.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- ALUGUEL ESCRITÓRIO - SUZANO (IPTU)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ALUGUEL ESCRITÓRIO - SUZANO (IPTU)',
        'ALUGUEL ESCRITÓRIO - SUZANO (IPTU)',
        '2024-06-24'::date,
        608.86,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        608.86,
        'pago'::status_parcela,
        608.86,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - IZALTINA JULIA DOS S ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - IZALTINA JULIA DOS S BARBOZA',
        'Conciliação - PIX RECEBIDO - IZALTINA JULIA DOS S BARBOZA',
        '2024-06-23'::date,
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
        '2024-06-23'::date,
        126.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Yampa +Lucro Mensal 2024...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Yampa +Lucro Mensal 2024',
        'Yampa +Lucro Mensal 2024',
        '2024-06-04'::date,
        292.78,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-04'::date,
        292.78,
        'pago'::status_parcela,
        292.78,
        '2024-06-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - JUSSARA CARVA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - JUSSARA CARVALHO F JANUARIO',
        'Conciliação - QR CODE PIX RECEBIDO - JUSSARA CARVALHO F JANUARIO',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        20.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- CLÍNICA MÉDICA HÓRUS VISION > PIX: 384.017.378-77 ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CLÍNICA MÉDICA HÓRUS VISION > PIX: 384.017.378-77 (CPF)',
        'CLÍNICA MÉDICA HÓRUS VISION > PIX: 384.017.378-77 (CPF)',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        200.0,
        'pago'::status_parcela,
        200.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - ALTAIR BARBETA MORIYASU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - ALTAIR BARBETA MORIYASU',
        'Conciliação - ALTAIR BARBETA MORIYASU',
        '2024-06-24'::date,
        2694.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        2694.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-24'::date,
        6676.47,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        6676.47,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - ANA CAROL PANTALENA YOSHIMATSU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - ANA CAROL PANTALENA YOSHIMATSU',
        'Conciliação - ANA CAROL PANTALENA YOSHIMATSU',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        500.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - DANIELA VIEIRA FERNAN...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - DANIELA VIEIRA FERNANDES DOS SANTOS',
        'Conciliação - PIX RECEBIDO - DANIELA VIEIRA FERNANDES DOS SANTOS',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        180.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - SUELEN CRISTINA REGA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - SUELEN CRISTINA REGA',
        'Conciliação - PIX RECEBIDO - SUELEN CRISTINA REGA',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        200.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - AMABILLY SILVA DE SOU...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - AMABILLY SILVA DE SOUSA',
        'Conciliação - PIX RECEBIDO - AMABILLY SILVA DE SOUSA',
        '2024-06-24'::date,
        151.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        151.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        581.12,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        581.12,
        'pago'::status_parcela,
        581.12,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GIGI C V O LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        '2024-06-24'::date,
        2444.04,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        2444.04,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        135.39,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        135.39,
        'pago'::status_parcela,
        135.39,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - LETICIA AKEMI ABRANCH...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - LETICIA AKEMI ABRANCHES NOHARA',
        'Conciliação - PIX RECEBIDO - LETICIA AKEMI ABRANCHES NOHARA',
        '2024-06-24'::date,
        78.57,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        78.57,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO JUDICIAL: Aluguel...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO JUDICIAL: Aluguel',
        'ACORDO JUDICIAL: Aluguel',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        500.0,
        'pago'::status_parcela,
        500.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- CASA ROLLU PAPELARIA E BAZAR LTDA: Folha sulfite...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'CASA ROLLU PAPELARIA E BAZAR LTDA: Folha sulfite',
        'CASA ROLLU PAPELARIA E BAZAR LTDA: Folha sulfite',
        '2024-06-24'::date,
        15.3,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        15.3,
        'pago'::status_parcela,
        15.3,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        446.33,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        446.33,
        'pago'::status_parcela,
        446.33,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - RENILZA DA SILVA BARB...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - RENILZA DA SILVA BARBOSA',
        'Conciliação - PIX RECEBIDO - RENILZA DA SILVA BARBOSA',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        125.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRAS > Nicolas Coutinho > PIX: 490.832.378-00 (...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRAS > Nicolas Coutinho > PIX: 490.832.378-00 (CPF)',
        'COMPRAS > Nicolas Coutinho > PIX: 490.832.378-00 (CPF)',
        '2024-06-24'::date,
        26.19,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        26.19,
        'pago'::status_parcela,
        26.19,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-24'::date,
        24.28,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        24.28,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MANUTENÇÃO DO CARRO (peças)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MANUTENÇÃO DO CARRO (peças)',
        'MANUTENÇÃO DO CARRO (peças)',
        '2024-06-24'::date,
        261.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        261.0,
        'pago'::status_parcela,
        261.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - NATALIA RODRIGUES DA COSTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - NATALIA RODRIGUES DA COSTA',
        'Conciliação - NATALIA RODRIGUES DA COSTA',
        '2024-06-24'::date,
        298.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        298.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.8...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
        'MONTAGEM: Douglas de Moraes Costa > PIX: 454.179.818-26 (CPF)',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        190.0,
        'pago'::status_parcela,
        190.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete úni...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-24'::date,
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
        '2024-06-24'::date,
        70.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        725.76,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        725.76,
        'pago'::status_parcela,
        725.76,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- 2° VIA BILHETE ÚNICO: Wevilly de Souza Fernandes L...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        '2° VIA BILHETE ÚNICO: Wevilly de Souza Fernandes Líbano > PIX: 453.302.308-88 (CPF)',
        '2° VIA BILHETE ÚNICO: Wevilly de Souza Fernandes Líbano > PIX: 453.302.308-88 (CPF)',
        '2024-06-24'::date,
        38.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        38.0,
        'pago'::status_parcela,
        38.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-24'::date,
        299.48,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        299.48,
        'pago'::status_parcela,
        299.48,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - CAMILA ANDRADE PINTO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - CAMILA ANDRADE PINTO',
        'Conciliação - PIX RECEBIDO - CAMILA ANDRADE PINTO',
        '2024-06-24'::date,
        325.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        325.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE ÁGUA - Rosangela > PIX: 116.378.698-51 (...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE ÁGUA - Rosangela > PIX: 116.378.698-51 (CPF)',
        'COMPRA DE ÁGUA - Rosangela > PIX: 116.378.698-51 (CPF)',
        '2024-06-24'::date,
        26.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-24'::date,
        26.0,
        'pago'::status_parcela,
        26.0,
        '2024-06-24'::date,
        NOW(),
        NOW()
    );
END $$;

-- FREELANCER: Esther Barbosa (ref. 22/06/2024) > PIX...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'FREELANCER: Esther Barbosa (ref. 22/06/2024) > PIX: (11) 9 8018-0836 (celular)',
        'FREELANCER: Esther Barbosa (ref. 22/06/2024) > PIX: (11) 9 8018-0836 (celular)',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        50.0,
        'pago'::status_parcela,
        50.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-25'::date,
        196.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        196.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - TAWANI SOARES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - TAWANI SOARES',
        'Conciliação - QR CODE PIX RECEBIDO - TAWANI SOARES',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        90.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- SABESP - ESCRITÓRIO SUZANO RGI 0685311252...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SABESP - ESCRITÓRIO SUZANO RGI 0685311252',
        'SABESP - ESCRITÓRIO SUZANO RGI 0685311252',
        '2024-10-04'::date,
        101.43,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-10-04'::date,
        101.43,
        'pago'::status_parcela,
        101.43,
        '2024-10-04'::date,
        NOW(),
        NOW()
    );
END $$;

-- ASSAÍ ATACADISTA: Itens para loja...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ASSAÍ ATACADISTA: Itens para loja',
        'ASSAÍ ATACADISTA: Itens para loja',
        '2024-06-25'::date,
        828.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        828.0,
        'pago'::status_parcela,
        828.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE ÁGUA - Felipe > PIX: 408.160.988-83 (CPF...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE ÁGUA - Felipe > PIX: 408.160.988-83 (CPF)',
        'COMPRA DE ÁGUA - Felipe > PIX: 408.160.988-83 (CPF)',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        13.0,
        'pago'::status_parcela,
        13.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - 49.771.050 PA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - 49.771.050 PAULO BARBOSA DOS SANTOS',
        'Conciliação - QR CODE PIX RECEBIDO - 49.771.050 PAULO BARBOSA DOS SANTOS',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        150.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL DEBITO ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        '2024-06-25'::date,
        393.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        393.6,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - GUSTAVO ANDRA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - GUSTAVO ANDRADE SANTOS',
        'Conciliação - QR CODE PIX RECEBIDO - GUSTAVO ANDRADE SANTOS',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        40.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        25.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - BENEDITO DE ALMEIDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - BENEDITO DE ALMEIDA',
        'Conciliação - PIX RECEBIDO - BENEDITO DE ALMEIDA',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- RESCISÃO: Maria da Conceição Ramos de Moura - Acor...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'RESCISÃO: Maria da Conceição Ramos de Moura - Acordo 1/2 > PIX: 102.281.264-52 (CPF)',
        'RESCISÃO: Maria da Conceição Ramos de Moura - Acordo 1/2 > PIX: 102.281.264-52 (CPF)',
        '2024-06-25'::date,
        902.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        902.0,
        'pago'::status_parcela,
        902.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        140.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-25'::date,
        232.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        232.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Retirada de moedas...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Retirada de moedas',
        'Retirada de moedas',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        1.0,
        'pago'::status_parcela,
        1.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-25'::date,
        71.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        71.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- compras no mercado livre 81332415946...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'compras no mercado livre 81332415946',
        'compras no mercado livre 81332415946',
        '2024-09-27'::date,
        455.92,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-09-27'::date,
        455.92,
        'pago'::status_parcela,
        455.92,
        '2024-09-27'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-07-01'::date,
        754.28,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-01'::date,
        754.28,
        'pago'::status_parcela,
        754.28,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - ROSANA MABEL ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - ROSANA MABEL DE LIMA',
        'Conciliação - QR CODE PIX RECEBIDO - ROSANA MABEL DE LIMA',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        40.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- OPTOTAL HOYA LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOTAL HOYA LTDA',
        'OPTOTAL HOYA LTDA',
        '2024-06-25'::date,
        115.25,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        115.25,
        'pago'::status_parcela,
        115.25,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL DEBITO ELO...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        'Conciliação - VENDAS - DISPONIVEL DEBITO ELO',
        '2024-06-25'::date,
        492.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        492.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE FISCALIZAÇÃO DE ESTABELECIMENTO E DE ANUNC...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE FISCALIZAÇÃO DE ESTABELECIMENTO E DE ANUNCIOS - Parcela 2/4',
        'TAXA DE FISCALIZAÇÃO DE ESTABELECIMENTO E DE ANUNCIOS - Parcela 2/4',
        '2024-06-25'::date,
        171.23,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        171.23,
        'pago'::status_parcela,
        171.23,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete úni...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-25'::date,
        2731.97,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        2731.97,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190/0001-01 (CNPJ) - ref. 01/06 a 12/06/2024 (Maria Vitória da Silva) - 16 atend.',
        'INSTITUTO VISÃO: 1° Quinz. Junho > PIX: 35.128.190/0001-01 (CNPJ) - ref. 01/06 a 12/06/2024 (Maria Vitória da Silva) - 16 atend.',
        '2025-03-03'::date,
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
        '2025-03-03'::date,
        480.0,
        'pago'::status_parcela,
        480.0,
        '2025-03-03'::date,
        NOW(),
        NOW()
    );
END $$;

-- 2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
        '2K CONSERTOS - KENNETH THYAGO SAKAMOTO > PIX: (11) 9 1357-6019 (celular)',
        '2024-06-25'::date,
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
        '2024-06-25'::date,
        119.0,
        'pago'::status_parcela,
        119.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- TAXA DE FISCALIZAÇÃO DE ANÚNCIOS - Parcela 2/4...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TAXA DE FISCALIZAÇÃO DE ANÚNCIOS - Parcela 2/4',
        'TAXA DE FISCALIZAÇÃO DE ANÚNCIOS - Parcela 2/4',
        '2024-06-25'::date,
        114.15,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        114.15,
        'pago'::status_parcela,
        114.15,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- SABESP - LOJA RIO PEQUENO RGI 0874132747...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'SABESP - LOJA RIO PEQUENO RGI 0874132747',
        'SABESP - LOJA RIO PEQUENO RGI 0874132747',
        '2024-07-12'::date,
        157.86,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-12'::date,
        157.86,
        'pago'::status_parcela,
        157.86,
        '2024-07-12'::date,
        NOW(),
        NOW()
    );
END $$;

-- LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVAL...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
        'LABORATÓRIO THC MONTAGEM E CONSERTO: THIAGO CARVALHO > PIX: 343.720.668-05 (CPF)',
        '2024-06-25'::date,
        413.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-25'::date,
        413.0,
        'pago'::status_parcela,
        413.0,
        '2024-06-25'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - ANA LUCIA FEITOSA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - ANA LUCIA FEITOSA',
        'Conciliação - PIX RECEBIDO - ANA LUCIA FEITOSA',
        '2024-06-26'::date,
        79.99,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        79.99,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete úni...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        'VALE TRANSPORTE: Mike Rodrigues Gomes (bilhete único)',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        24.0,
        'pago'::status_parcela,
        24.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GIGI C V O LTDA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        'Conciliação - PIX RECEBIDO - GIGI C V O LTDA',
        '2024-06-26'::date,
        1230.06,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        1230.06,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-26'::date,
        197.64,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        197.64,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        'EXPRESS > PIX: 30.576.013/0001-74 (CNPJ)',
        '2024-06-26'::date,
        340.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        340.0,
        'pago'::status_parcela,
        340.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        'Conciliação - PIX RECEBIDO - GI COMERCIO VAREJISTA DE OTICA LTDA',
        '2024-06-26'::date,
        526.82,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        526.82,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        130.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- HASTEN MARKETING E PRODUÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'HASTEN MARKETING E PRODUÇÕES',
        'HASTEN MARKETING E PRODUÇÕES',
        '2024-06-26'::date,
        612.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        612.0,
        'pago'::status_parcela,
        612.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
        'OPTOMETRISTA: Guilherme Santos > PIX: 41.832.948/0001-90 (CNPJ)',
        '2024-07-10'::date,
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
        '2024-07-10'::date,
        280.0,
        'pago'::status_parcela,
        280.0,
        '2024-07-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        10.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE ÁGUA - Luana > PIX: luanabraz0912@gmail....
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE ÁGUA - Luana > PIX: luanabraz0912@gmail.com (e-mail)',
        'COMPRA DE ÁGUA - Luana > PIX: luanabraz0912@gmail.com (e-mail)',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        13.0,
        'pago'::status_parcela,
        13.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- Retirada de moedas...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Retirada de moedas',
        'Retirada de moedas',
        '2024-06-26'::date,
        0.6,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        0.6,
        'pago'::status_parcela,
        0.6,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - ELIANA SAVOIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - ELIANA SAVOIA',
        'Conciliação - QR CODE PIX RECEBIDO - ELIANA SAVOIA',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- PRO-LABORE...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'PRO-LABORE',
        'PRO-LABORE',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        150.0,
        'pago'::status_parcela,
        150.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- Suzanmi Bazar e Papelaria: Papel crepom > Mike Rod...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'Suzanmi Bazar e Papelaria: Papel crepom > Mike Rodrigues > PIX: 413.050.558-02 (CPF)',
        'Suzanmi Bazar e Papelaria: Papel crepom > Mike Rodrigues > PIX: 413.050.558-02 (CPF)',
        '2024-07-01'::date,
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
        '2024-07-01'::date,
        2.5,
        'pago'::status_parcela,
        2.5,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- HASTEN MARKETING E PRODUÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'HASTEN MARKETING E PRODUÇÕES',
        'HASTEN MARKETING E PRODUÇÕES',
        '2024-06-26'::date,
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
        '2024-06-26'::date,
        720.0,
        'pago'::status_parcela,
        720.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- HASTEN MARKETING E PRODUÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'HASTEN MARKETING E PRODUÇÕES',
        'HASTEN MARKETING E PRODUÇÕES',
        '2024-06-26'::date,
        396.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-26'::date,
        396.0,
        'pago'::status_parcela,
        396.0,
        '2024-06-26'::date,
        NOW(),
        NOW()
    );
END $$;

-- ÓTICAS JRL > PIX: 51.766.595/0001-21 (CNPJ)...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ÓTICAS JRL > PIX: 51.766.595/0001-21 (CNPJ)',
        'ÓTICAS JRL > PIX: 51.766.595/0001-21 (CNPJ)',
        '2024-06-29'::date,
        1250.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-29'::date,
        1250.0,
        'pago'::status_parcela,
        1250.0,
        '2024-06-29'::date,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - BRUNA TOLEDO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - BRUNA TOLEDO RODRIGUES DOS SANTOS',
        'Conciliação - QR CODE PIX RECEBIDO - BRUNA TOLEDO RODRIGUES DOS SANTOS',
        '2024-06-27'::date,
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
        '2024-06-27'::date,
        300.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - MARIA ARAÚJO ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - MARIA ARAÚJO COSTA',
        'Conciliação - QR CODE PIX RECEBIDO - MARIA ARAÚJO COSTA',
        '2024-06-27'::date,
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
        '2024-06-27'::date,
        100.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        'Conciliação - VENDAS - DISPONIVEL CREDITO MASTERCARD',
        '2024-06-27'::date,
        38.84,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-27'::date,
        38.84,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- ENEL 25642171 - LOJA MAUÁ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ENEL 25642171 - LOJA MAUÁ',
        'ENEL 25642171 - LOJA MAUÁ',
        '2024-07-10'::date,
        303.74,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-07-10'::date,
        303.74,
        'pago'::status_parcela,
        303.74,
        '2024-07-10'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: VISION PRIME - Parcela 10/49 > PIX: 34.130...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: VISION PRIME - Parcela 10/49 > PIX: 34.130.608/0001-52 (CNPJ)',
        'ACORDO: VISION PRIME - Parcela 10/49 > PIX: 34.130.608/0001-52 (CNPJ)',
        '2024-06-29'::date,
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
        '2024-06-29'::date,
        500.0,
        'pago'::status_parcela,
        500.0,
        '2024-06-29'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-27'::date,
        950.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-27'::date,
        950.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- Conciliação - QR CODE PIX RECEBIDO - LETÍCIA MARIA...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Conciliação - QR CODE PIX RECEBIDO - LETÍCIA MARIA DA SILVA RODRIGUES',
        'Conciliação - QR CODE PIX RECEBIDO - LETÍCIA MARIA DA SILVA RODRIGUES',
        '2024-06-27'::date,
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
        '2024-06-27'::date,
        50.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
END $$;

-- COMPRA DE ARMAÇÕES...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'COMPRA DE ARMAÇÕES',
        'COMPRA DE ARMAÇÕES',
        '2024-06-27'::date,
        655.4,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-27'::date,
        655.4,
        'pago'::status_parcela,
        655.4,
        '2024-06-27'::date,
        NOW(),
        NOW()
    );
END $$;

-- TRELLO - Controles...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'TRELLO - Controles',
        'TRELLO - Controles',
        '2024-07-01'::date,
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
        '2024-07-01'::date,
        195.0,
        'pago'::status_parcela,
        195.0,
        '2024-07-01'::date,
        NOW(),
        NOW()
    );
END $$;

-- Dinheiro em caixa...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
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
        'Dinheiro em caixa',
        'Dinheiro em caixa',
        '2024-06-27'::date,
        75.0,
        1,
        'migracao_yampa'::origem_lanc,
        'aprovado'::status_aprovacao,
        NOW(),
        NOW()
    );

    -- Parcela 1/1
    INSERT INTO parcelas (
        id, lancamento_id, parcela, vencimento, valor, status,
        valor_pago, data_pagamento, created_at, updated_at
    ) VALUES (
        gen_random_uuid(),
        novo_lanc_id,
        1,
        '2024-06-27'::date,
        75.0,
        'previsto'::status_parcela,
        NULL,
        NULL,
        NOW(),
        NOW()
    );
