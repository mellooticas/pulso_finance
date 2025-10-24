DO $$
DECLARE
    plano_5_4_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4_2,
        '5.4.2',
        'Serviços técnicos em geral',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_4_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4_3,
        '5.4.3',
        'Materiais de expediente / escritório / loja',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_4_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4_4,
        '5.4.4',
        'Materiais de limpeza e manutenção predial',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_4_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4_99,
        '5.4.99',
        'Outras despesas com materiais',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_5_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_5_1,
        '5.5.1',
        'Gasolina / Combustível',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_5_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_5_2,
        '5.5.2',
        'Manutenção de veículos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_5_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_5_4,
        '5.5.4',
        'Estacionamento / Pedágios',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_5_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_5_5,
        '5.5.5',
        'Frete',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_5_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_5_99,
        '5.5.99',
        'Outras despesas com veículos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8_1,
        '5.8.1',
        'aporte em suzano',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.8'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8_2,
        '5.8.2',
        'aporte em mauá',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.8'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8_3,
        '5.8.3',
        'aporte em são mateus',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.8'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8_4,
        '5.8.4',
        'aporte em suzano2',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.8'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8_5,
        '5.8.5',
        'aporte em rio pequeno',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.8'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_6_1_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_1,
        '6.1.1',
        'Papelaria (folder, cartão visitas, etc.)',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    );
END $$;