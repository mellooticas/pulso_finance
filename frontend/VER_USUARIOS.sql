-- ==========================================
-- VERIFICAR USUÁRIOS EXISTENTES
-- ==========================================

-- 1. Ver todos os usuários na tabela usuarios
SELECT 
  id,
  email,
  nome,
  papel,
  ativo,
  loja_ids,
  ultimo_acesso,
  created_at,
  updated_at
FROM public.usuarios 
ORDER BY created_at DESC;

-- 2. Contar total de usuários
SELECT COUNT(*) as total_usuarios FROM public.usuarios;

-- 3. Ver usuários por papel
SELECT 
  papel,
  COUNT(*) as quantidade,
  STRING_AGG(email, ', ') as emails
FROM public.usuarios 
GROUP BY papel;

-- 4. Ver usuários ativos vs inativos
SELECT 
  ativo,
  COUNT(*) as quantidade
FROM public.usuarios 
GROUP BY ativo;

-- 5. Ver últimos acessos
SELECT 
  email,
  nome,
  ultimo_acesso,
  CASE 
    WHEN ultimo_acesso IS NULL THEN 'Nunca logou'
    WHEN ultimo_acesso > NOW() - INTERVAL '1 day' THEN 'Último dia'
    WHEN ultimo_acesso > NOW() - INTERVAL '7 days' THEN 'Última semana'
    ELSE 'Mais de 1 semana'
  END as status_acesso
FROM public.usuarios 
ORDER BY ultimo_acesso DESC NULLS LAST;