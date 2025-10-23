DO $$
DECLARE
    plano_5_3_15 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_15,
        '5.3.15',
        'Aprovisionamento para 13 e Férias',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_3,
        '5.3.3',
        'VT e VR',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_4,
        '5.3.4',
        'Rescisão',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_5,
        '5.3.5',
        'FGTS',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_6 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_6,
        '5.3.6',
        'INSS - Federação - Sindicato - IR',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_7,
        '5.3.7',
        '13º e férias',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_8,
        '5.3.8',
        'Exames ocupacionais',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_9 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_9,
        '5.3.9',
        'Pro-Labores',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_3_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_99,
        '5.3.99',
        'Outras despesas com pessoal',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_4_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4_1,
        '5.4.1',
        'Manutenção máquinas e equipamentos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.4'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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