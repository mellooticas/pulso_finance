DO $$
DECLARE
    plano_6_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_4,
        '6.4',
        'Outros investimentos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '6'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_7_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_7_1,
        '7.1',
        'Entradas não operacionais',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '7'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_99_98 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_99_98,
        '99.98',
        'Acerto de caixa',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '99'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_1,
        '3.1.1',
        'Vendas em dinheiro',
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
    plano_3_1_10 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1_10,
        '3.1.10',
        'Pagto de Festas',
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