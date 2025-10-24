DO $$
DECLARE
    plano_13 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_13,
        '13',
        'Acerto do Caixa',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        1,
        NULL,
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4,
        '4',
        'Custos Variáveis',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        1,
        NULL,
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5,
        '5',
        'Despesas Fixas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        1,
        NULL,
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_7 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_7,
        '7',
        'Movimentações Não Operacionais',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        1,
        NULL,
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_13_99 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_13_99,
        '13.99',
        'Saldo inicial padrão yampa',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '13'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_1,
        '3.1',
        'Receita de vendas',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_2,
        '3.2',
        'Outras receitas de vendas',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_3_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_3_3,
        '3.3',
        'Recebimento de juros',
        'receita'::categoria_conta,
        'receita'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '3'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_4_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_4_2,
        '4.2',
        'Custos com fornecedores',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '4'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_2 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_2,
        '5.2',
        'Despesas administrativas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_3,
        '5.3',
        'Despesas com pessoal',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_4 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_4,
        '5.4',
        'Despesas com materiais e equipamentos',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_5_8 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_5_8,
        '5.8',
        'Outros tipos de despesas',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '5'),
        True,
        NOW()
    );
END $$;

DO $$
DECLARE
    plano_6_1 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_1,
        '6.1',
        'Investimentos em marketing',
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
    plano_6_3 UUID := gen_random_uuid();
BEGIN
    INSERT INTO plano_contas (id, codigo, nome, categoria, tipo, nivel, pai_id, ativo, created_at)
    VALUES (
        plano_6_3,
        '6.3',
        'Investimentos em desenvolvimento empresarial',
        'despesa'::categoria_conta,
        'despesa'::tipo_conta,
        2,
        (SELECT id FROM plano_contas WHERE codigo = '6'),
        True,
        NOW()
    );
END $$;