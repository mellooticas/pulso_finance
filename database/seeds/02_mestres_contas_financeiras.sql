-- CONTAS FINANCEIRAS
-- =====================================================

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco Inter - 11',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco Inter - 11'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco Inter - 42',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco Inter - 42'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco Inter - GTN Holding',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco Inter - GTN Holding'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco do Brasil - 10',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco do Brasil - 10'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco do Brasil - 11',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco do Brasil - 11'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco do Brasil - 12',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco do Brasil - 12'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco do brasil - 42',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco do brasil - 42'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco do brasil - 48',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco do brasil - 48'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Banco padrão do sistema',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Banco padrão do sistema'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'conta_corrente'::tipo_conta_financeira,
    'Itaú Pessoal',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Itaú Pessoal'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'caixa'::tipo_conta_financeira,
    'Caixa (Dinheiro)',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Caixa (Dinheiro)'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'caixa'::tipo_conta_financeira,
    'Caixa - 12',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Caixa - 12'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'caixa'::tipo_conta_financeira,
    'Caixa - 42',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Caixa - 42'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'caixa'::tipo_conta_financeira,
    'Caixa - 48',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Caixa - 48'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'investimento'::tipo_conta_financeira,
    'Next - 12',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Next - 12'
);

INSERT INTO contas_financeiras (id, loja_id, tipo, apelido, saldo_inicial, saldo_atual, ativa, created_at, updated_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'investimento'::tipo_conta_financeira,
    'Nubank Atelie',
    0.0,
    0.0,
    True,
    NOW(),
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM contas_financeiras WHERE apelido = 'Nubank Atelie'
);


-- =====================================================