DO $$
DECLARE
    plano_3_1_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_2,
        '3.1.2',
        'Vendas cartões de débito',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_3,
        '3.1.3',
        'Vendas cartões de crédito',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_4,
        '3.1.4',
        'Vendas em cheque',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_6 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_6,
        '3.1.6',
        'Restante de entrada',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_7,
        '3.1.7',
        'Carnê',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_8,
        '3.1.8',
        'Vendas pix',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_9 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_9,
        '3.1.9',
        'Taxas de Vendas no Cartão',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_99,
        '3.1.99',
        'Outros produtos/serviços',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '3.1'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_2_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_2_1,
        '3.2.1',
        'aporte de suzano',
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
    plano_3_2_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_2_2,
        '3.2.2',
        'aporte de mauá',
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