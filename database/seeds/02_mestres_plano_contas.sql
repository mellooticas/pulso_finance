-- PLANO DE CONTAS
-- =====================================================


-- Nível 1
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


-- Nível 2
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


-- Nível 3
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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
    );
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


-- =====================================================