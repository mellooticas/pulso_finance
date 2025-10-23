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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_2,
        '6.1.2',
        'Site / Internet',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_3,
        '6.1.3',
        'Mídias / Propaganda',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_5,
        '6.1.5',
        'Prestadores de serviços de marketing',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_7,
        '6.1.7',
        'META ADS',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_8,
        '6.1.8',
        'SAÚDE DOS OLHOS',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_1_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1_99,
        '6.1.99',
        'Outros investimentos em marketing',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_2_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_2_1,
        '6.2.1',
        'Compra de equipamentos de informática',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_2_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_2_2,
        '6.2.2',
        'Reformas / Estrutura',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_2_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_2_3,
        '6.2.3',
        'Mobiliário',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_3_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_3_1,
        '6.3.1',
        'Consultoria',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_3_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_3_2,
        '6.3.2',
        'Treinamentos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_6_4_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_4_99,
        '6.4.99',
        'Outros investimentos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '6.4'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_7_1_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_7_1_1,
        '7.1.1',
        'Empréstimos obtidos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '7.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_7_2_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_7_2_1,
        '7.2.1',
        'Pagamento de empréstimos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '7.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_7_2_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_7_2_2,
        '7.2.2',
        'Juros bancários e por atraso',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '7.2'),
        True,
        NOW()
    );
END $$;