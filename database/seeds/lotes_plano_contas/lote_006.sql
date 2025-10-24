DO $$
DECLARE
    plano_5_2_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_99,
        '5.2.99',
        'Outras despesas administrativas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_3_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_1,
        '5.3.1',
        'Salário de funcionários',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_3_12 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_12,
        '5.3.12',
        'Diarista',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_3_13 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_13,
        '5.3.13',
        'Vale adiantamento',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_3_14 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3_14,
        '5.3.14',
        'Bonificações para Funcionários',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.3'),
        True,
        NOW()
    );
END $$;

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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
END $$;