DO $$
DECLARE
    plano_5_2_16 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_16,
        '5.2.16',
        'Entregas',
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
    plano_5_2_17 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_17,
        '5.2.17',
        'Documentação empresa',
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
    plano_5_2_18 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_18,
        '5.2.18',
        'Compra da loja',
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
    plano_5_2_19 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_19,
        '5.2.19',
        'Acessórios',
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
    plano_5_2_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_2,
        '5.2.2',
        'Celular',
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
    plano_5_2_20 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_20,
        '5.2.20',
        'Energia Elétrica Escritório',
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
    plano_5_2_21 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_21,
        '5.2.21',
        'Pagamento Cartão de Crédito',
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
    plano_5_2_22 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_22,
        '5.2.22',
        'Compras para Festa',
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
    plano_5_2_23 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_23,
        '5.2.23',
        'Locação para Festas',
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
    plano_5_2_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_3,
        '5.2.3',
        'Energia elétrica',
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
    plano_5_2_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_4,
        '5.2.4',
        'Aluguel e condomínio',
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
    plano_5_2_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_5,
        '5.2.5',
        'Água',
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
    plano_5_2_6 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_6,
        '5.2.6',
        'IPTU e taxas públicas',
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
    plano_5_2_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_7,
        '5.2.7',
        'Motoboy para Entrega',
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
    plano_5_2_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2_8,
        '5.2.8',
        'Almoço / Supermercado / Lanches',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        3,
        (SELECT id FROM plano_contas WHERE codigo = '5.2'),
        True,
        NOW()
    );
END $$;