-- CRIAÇÃO DE USUÁRIOS REAIS PARA PULSO FINANCE
-- Execute estas queries no Supabase SQL Editor

-- 1. Primeiro, vamos criar os usuários no Auth do Supabase
-- ATENÇÃO: Estes usuários precisam ser criados via Supabase Auth dashboard ou API
-- Depois execute as queries abaixo para criar os perfis

-- 2. Inserir perfis de usuários reais na tabela usuarios
-- Substitua os IDs pelos UUIDs reais gerados pelo Supabase Auth

-- ADMIN - junior@oticastatymello.com.br
INSERT INTO usuarios (
  id,
  email,
  nome,
  papel,
  loja_ids,
  ativo,
  configuracoes,
  criado_em
) VALUES (
  gen_random_uuid(), -- Substitua pelo ID real do Supabase Auth
  'junior@oticastatymello.com.br',
  'Junior Mello',
  'admin',
  ARRAY(SELECT id FROM lojas), -- Acesso a todas as lojas
  true,
  jsonb_build_object(
    'tema', 'light',
    'notificacoes', true,
    'idioma', 'pt-BR',
    'dashboard_layout', 'grid'
  ),
  now()
);

-- FINANCEIRO - financeiroesc@hotmail.com
INSERT INTO usuarios (
  id,
  email,
  nome,
  papel,
  loja_ids,
  ativo,
  configuracoes,
  criado_em
) VALUES (
  gen_random_uuid(), -- Substitua pelo ID real do Supabase Auth
  'financeiroesc@hotmail.com',
  'Financeiro ESC',
  'financeiro',
  ARRAY(SELECT id FROM lojas LIMIT 3), -- Acesso limitado
  true,
  jsonb_build_object(
    'tema', 'light',
    'notificacoes', true,
    'idioma', 'pt-BR',
    'dashboard_layout', 'list'
  ),
  now()
);

-- GESTOR - tgjphotos@gmail.com
INSERT INTO usuarios (
  id,
  email,
  nome,
  papel,
  loja_ids,
  ativo,
  configuracoes,
  criado_em
) VALUES (
  gen_random_uuid(), -- Substitua pelo ID real do Supabase Auth
  'tgjphotos@gmail.com',
  'TGJ Photos',
  'gerencial',
  ARRAY(SELECT id FROM lojas WHERE nome LIKE '%Matriz%'), -- Acesso à loja principal
  true,
  jsonb_build_object(
    'tema', 'dark',
    'notificacoes', true,
    'idioma', 'pt-BR',
    'dashboard_layout', 'grid'
  ),
  now()
);

-- 3. Verificar os usuários criados
SELECT 
  id,
  email,
  nome,
  papel,
  array_length(loja_ids, 1) as qtd_lojas_acesso,
  ativo,
  criado_em
FROM usuarios 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
)
ORDER BY papel, nome;