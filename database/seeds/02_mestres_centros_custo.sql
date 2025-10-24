-- CENTROS DE CUSTO
-- =====================================================

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Buffet Taty Mello Festas',
    'Buffet Taty Mello Festas',
    'Centro de custo Buffet Taty Mello Festas',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Buffet Taty Mello Festas'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Clínica',
    'Clínica',
    'Centro de custo Clínica',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Clínica'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Escritório',
    'Escritório',
    'Centro de custo Escritório',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Escritório'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja Mauá',
    'Loja Mauá',
    'Centro de custo Loja Mauá',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja Mauá'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja Perus',
    'Loja Perus',
    'Centro de custo Loja Perus',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja Perus'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja Rio Pequeno',
    'Loja Rio Pequeno',
    'Centro de custo Loja Rio Pequeno',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja Rio Pequeno'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja Suzano',
    'Loja Suzano',
    'Centro de custo Loja Suzano',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja Suzano'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja Suzano II',
    'Loja Suzano II',
    'Centro de custo Loja Suzano II',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja Suzano II'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Loja São Mateus',
    'Loja São Mateus',
    'Centro de custo Loja São Mateus',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Loja São Mateus'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Pessoal',
    'Pessoal',
    'Centro de custo Pessoal',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Pessoal'
);

INSERT INTO centros_custo (id, loja_id, codigo, nome, descricao, ativo, created_at)
SELECT 
    gen_random_uuid(),
    (SELECT id FROM lojas LIMIT 1),
    'Taty Mello Festas',
    'Taty Mello Festas',
    'Centro de custo Taty Mello Festas',
    True,
    NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM centros_custo WHERE codigo = 'Taty Mello Festas'
);


-- =====================================================