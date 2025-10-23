
-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 107/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 107/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 108/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 108/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 109/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 109/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 110/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 110/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 111/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 111/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > ...
DO $$
DECLARE
    novo_lanc_id UUID := gen_random_uuid();
    plano_id_ref UUID;
    fornecedor_id_ref UUID;
BEGIN
    -- Buscar plano de contas (usar primeiro plano disponível como fallback)
    SELECT id INTO plano_id_ref FROM plano_contas WHERE ativo = true LIMIT 1;
    
    -- Inserir lançamento
    INSERT INTO lancamentos (
        id, loja_id, tipo, plano_id, fornecedor_id,
        descricao, historico, competencia, valor_total, num_parcelas,
        origem, status_aprovacao, created_at, updated_at
    ) VALUES (
        novo_lanc_id,
        (SELECT id FROM lojas LIMIT 1),
        'pagar'::tipo_lancamento,
        plano_id_ref,
        NULL,
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 112/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        'ACORDO: KONSEP CONTABILIDADE E CONSULTORIA LTDA > Parcela 112/112 > PIX: 08.450.703.0001/23 (CNPJ)',
        '2025-10-18'::date,
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
        '2025-10-18'::date,
        400.0,
        'pago'::status_parcela,
        400.0,
        '2025-10-18'::date,
        NOW(),
        NOW()
    );
END $$;

-- Reabilitar triggers
SET session_replication_role = DEFAULT;

-- Refresh views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

SELECT 'Lançamentos e parcelas povoados com sucesso!' as resultado;
