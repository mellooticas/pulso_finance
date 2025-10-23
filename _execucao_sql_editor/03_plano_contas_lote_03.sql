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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
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
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_4_4_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_4_5,
        '4.4.5',
        'Comissões DSR',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.4'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_4_4_9 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_4_9,
        '4.4.9',
        'Cancelamentos de Vendas',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.4'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_4_6_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_6_1,
        '4.6.1',
        'Transporte festas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.6'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_4_6_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_6_2,
        '4.6.2',
        'Consertos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.6'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_4_7_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_7_1,
        '4.7.1',
        'Pagto Franquia',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '4.7'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_1_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_1_1,
        '5.1.1',
        'Tarifas bancárias',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_1_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_1_2,
        '5.1.2',
        'Aluguel de máquinas de cartão',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_1_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_1_3,
        '5.1.3',
        'Tarifas DOC/TED',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.1'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_1,
        '5.2.1',
        'Telefone e internet',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_10 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_10,
        '5.2.10',
        'Cartórios',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_11 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_11,
        '5.2.11',
        'Contador',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_12 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_12,
        '5.2.12',
        'Mensalidade de softwares',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_13 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_13,
        '5.2.13',
        'Alarme monitorado / Segurança',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_14 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_14,
        '5.2.14',
        'Compras para loja',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    ) ON CONFLICT (codigo) DO NOTHING;
END $$;

DO $$
DECLARE
    plano_5_2_15 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_15,
        '5.2.15',
        'Montagens',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    );
END $$;