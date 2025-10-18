-- CRIAR PERFIS DOS USUÁRIOS JÁ AUTENTICADOS
-- Execute este script no Supabase SQL Editor

-- 1. Primeiro, vamos ver quais usuários existem no Auth
SELECT 
  'Usuários no Auth:' as info,
  id,
  email,
  created_at
FROM auth.users 
ORDER BY created_at DESC;

-- 2. Verificar se já existem perfis
SELECT 
  'Perfis existentes:' as info,
  id,
  email,
  nome
FROM usuarios;

-- 3. Criar perfis para todos os usuários do Auth que não têm perfil
INSERT INTO usuarios (
  id,
  email,
  nome,
  papel,
  loja_ids,
  ativo,
  configuracoes,
  ultimo_acesso
)
SELECT 
  au.id,
  au.email,
  CASE 
    WHEN au.email = 'junior@oticastatymello.com.br' THEN 'Junior Mello'
    WHEN au.email = 'financeiroesc@hotmail.com' THEN 'Financeiro ESC'
    WHEN au.email = 'tgjphotos@gmail.com' THEN 'TGJ Photos'
    ELSE SPLIT_PART(au.email, '@', 1) -- Nome baseado no email
  END as nome,
  CASE 
    WHEN au.email = 'junior@oticastatymello.com.br' THEN 'admin'::papel_usuario
    WHEN au.email = 'financeiroesc@hotmail.com' THEN 'financeiro'::papel_usuario
    WHEN au.email = 'tgjphotos@gmail.com' THEN 'gerencial'::papel_usuario
    ELSE 'gerencial'::papel_usuario
  END as papel,
  CASE 
    WHEN au.email = 'junior@oticastatymello.com.br' THEN 
      (SELECT ARRAY_AGG(id) FROM lojas) -- Todas as lojas para admin
    ELSE 
      (SELECT ARRAY_AGG(id) FROM lojas LIMIT 2) -- 2 lojas para outros
  END as loja_ids,
  true as ativo,
  jsonb_build_object(
    'tema', 'light',
    'notificacoes', true,
    'idioma', 'pt-BR',
    'dashboard_layout', 'grid',
    'primeira_vez', true
  ) as configuracoes,
  now() as ultimo_acesso
FROM auth.users au
LEFT JOIN usuarios u ON au.id = u.id
WHERE u.id IS NULL -- Só criar para quem não tem perfil
  AND au.email IS NOT NULL;

-- 4. Verificar se criou corretamente
SELECT 
  'Perfis criados:' as info,
  u.email,
  u.nome,
  u.papel,
  array_length(u.loja_ids, 1) as qtd_lojas,
  u.ativo,
  u.created_at
FROM usuarios u
ORDER BY u.created_at DESC;

-- 5. Testar se o usuário específico do erro foi criado
SELECT 
  'Usuário do erro encontrado:' as info,
  id,
  email,
  nome,
  papel
FROM usuarios 
WHERE id = '8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc';

-- 6. Resultado final
SELECT 
  'Total de usuários criados: ' || COUNT(*)::TEXT as resultado
FROM usuarios;


| resultado                    |
| ---------------------------- |
| Total de usuários criados: 3 |