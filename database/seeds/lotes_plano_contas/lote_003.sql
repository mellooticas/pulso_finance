DO $$
DECLARE
    plano_3_2_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_2_3,
        '3.2.3',
        'aporte de são mateus',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_1_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_1_1,
        '4.1.1',
        'Simples nacional',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_1_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_1_2,
        '4.1.2',
        'Taxas de cartões',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_1_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_1_99,
        '4.1.99',
        'Outros custos financeiros',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_1,
        '4.2.1',
        'Fornecedores',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_3,
        '4.2.3',
        'Fornecedores de Lentes',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_4,
        '4.2.4',
        'Fornecedores de Armações',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_5,
        '4.2.5',
        'fornecedor de bolos para festas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_6 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_6,
        '4.2.6',
        'fornecedores de pães para festas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_7,
        '4.2.7',
        'forencedores de decorações para festas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2_8,
        '4.2.8',
        'fornecedores doces personalisados para festas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_3_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_3_1,
        '4.3.1',
        'Custos com embalagens',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_4_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_4_1,
        '4.4.1',
        'Comissão interna',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_4_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_4_3,
        '4.4.3',
        'Gastos com Médicos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_4_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_4_4,
        '4.4.4',
        'Montagem',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.4'),
        True,
        NOW()
    );
END $$;