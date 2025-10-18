-- SCRIPT PARA CRIAR USUÁRIOS REAIS NO SUPABASE
-- Execute este script no SQL Editor do Supabase

-- IMPORTANTE: ESTE SCRIPT DEVE SER EXECUTADO EM 2 ETAPAS:
-- ETAPA 1: Criar usuários no Auth primeiro (via Dashboard)
-- ETAPA 2: Executar este script para criar os perfis

-- 1. Verificar estrutura da tabela usuarios
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'usuarios' 
AND table_schema = 'public'
ORDER BY ordinal_position;

-- 2. Limpar usuários de teste se existirem
DELETE FROM usuarios WHERE email IN (
  'admin@pulsofinance.com',
  'gerente@pulsofinance.com', 
  'financeiro@pulsofinance.com'
);

-- 3. ANTES DE EXECUTAR ESTE SCRIPT, CRIE ESTES USUÁRIOS NO SUPABASE AUTH:
-- Acesse: Supabase Dashboard > Authentication > Users
-- Clique em "Add user" para cada email:

-- Usuario 1:
-- Email: junior@oticastatymello.com.br
-- Password: Kt12jyh2815t@
-- [✓] Auto Confirm User

-- Usuario 2:
-- Email: financeiroesc@hotmail.com  
-- Password: 123456789
-- [✓] Auto Confirm User

-- Usuario 3:
-- Email: tgjphotos@gmail.com
-- Password: 123456789  
-- [✓] Auto Confirm User

-- 4. APÓS CRIAR NO AUTH, EXECUTE ESTA FUNÇÃO:
CREATE OR REPLACE FUNCTION criar_perfis_usuarios()
RETURNS TABLE(resultado TEXT)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  admin_id UUID;
  financeiro_id UUID;
  gestor_id UUID;
  todas_lojas UUID[];
BEGIN
  -- Buscar todas as lojas
  SELECT ARRAY(SELECT id FROM lojas ORDER BY nome) INTO todas_lojas;
  
  -- Buscar IDs dos usuários criados no Auth
  SELECT id INTO admin_id FROM auth.users WHERE email = 'junior@oticastatymello.com.br';
  SELECT id INTO financeiro_id FROM auth.users WHERE email = 'financeiroesc@hotmail.com';
  SELECT id INTO gestor_id FROM auth.users WHERE email = 'tgjphotos@gmail.com';
  
  -- Verificar se todos os usuários foram encontrados
  IF admin_id IS NULL THEN
    RETURN QUERY SELECT 'ERRO: Usuário junior@oticastatymello.com.br não encontrado no Auth'::TEXT;
    RETURN;
  END IF;
  
  IF financeiro_id IS NULL THEN
    RETURN QUERY SELECT 'ERRO: Usuário financeiroesc@hotmail.com não encontrado no Auth'::TEXT;
    RETURN;
  END IF;
  
  IF gestor_id IS NULL THEN
    RETURN QUERY SELECT 'ERRO: Usuário tgjphotos@gmail.com não encontrado no Auth'::TEXT;
    RETURN;
  END IF;
  
  -- ADMIN - junior@oticastatymello.com.br
  INSERT INTO usuarios (
    id,
    email,
    nome,
    papel,
    loja_ids,
    ativo,
    configuracoes,
    ultimo_acesso
  ) VALUES (
    admin_id,
    'junior@oticastatymello.com.br',
    'Junior Mello',
    'admin',
    todas_lojas, -- Acesso a todas as lojas
    true,
    jsonb_build_object(
      'tema', 'light',
      'notificacoes', true,
      'idioma', 'pt-BR',
      'dashboard_layout', 'grid',
      'primeira_vez', true
    ),
    now()
  );
  
  RETURN QUERY SELECT 'Usuário ADMIN criado: junior@oticastatymello.com.br'::TEXT;
  
  -- FINANCEIRO - financeiroesc@hotmail.com  
  INSERT INTO usuarios (
    id,
    email,
    nome,
    papel,
    loja_ids,
    ativo,
    configuracoes,
    ultimo_acesso
  ) VALUES (
    financeiro_id,
    'financeiroesc@hotmail.com',
    'Financeiro ESC',
    'financeiro',
    todas_lojas[1:4], -- Acesso às primeiras 4 lojas
    true,
    jsonb_build_object(
      'tema', 'light',
      'notificacoes', true,
      'idioma', 'pt-BR',
      'dashboard_layout', 'list',
      'primeira_vez', true
    ),
    now()
  );
  
  RETURN QUERY SELECT 'Usuário FINANCEIRO criado: financeiroesc@hotmail.com'::TEXT;
  
  -- GESTOR - tgjphotos@gmail.com
  INSERT INTO usuarios (
    id,
    email,
    nome,
    papel,
    loja_ids,
    ativo,
    configuracoes,
    ultimo_acesso
  ) VALUES (
    gestor_id,
    'tgjphotos@gmail.com',
    'TGJ Photos',
    'gerencial',
    todas_lojas[1:2], -- Acesso às 2 primeiras lojas
    true,
    jsonb_build_object(
      'tema', 'dark',
      'notificacoes', true,
      'idioma', 'pt-BR',
      'dashboard_layout', 'grid',
      'primeira_vez', true
    ),
    now()
  );
  
  RETURN QUERY SELECT 'Usuário GERENCIAL criado: tgjphotos@gmail.com'::TEXT;
  
  RETURN QUERY SELECT '====== CRIAÇÃO CONCLUÍDA ======'::TEXT;
  RETURN QUERY SELECT 'Todos os perfis foram criados com sucesso!'::TEXT;
  
END;
$$;

-- 5. Executar a função (APENAS APÓS CRIAR NO AUTH)
SELECT * FROM criar_perfis_usuarios();

-- 6. Verificar usuários criados
SELECT 
  u.email,
  u.nome,
  u.papel,
  array_length(u.loja_ids, 1) as qtd_lojas,
  u.ativo,
  u.configuracoes->>'tema' as tema,
  u.created_at,
  au.email_confirmed_at IS NOT NULL as email_confirmado
FROM usuarios u
JOIN auth.users au ON u.id = au.id
WHERE u.email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
)
ORDER BY 
  CASE u.papel 
    WHEN 'admin' THEN 1 
    WHEN 'gerencial' THEN 2 
    WHEN 'financeiro' THEN 3 
  END;

-- 7. Remover função temporária
DROP FUNCTION criar_perfis_usuarios();

-- 8. TESTE FINAL: Verificar se tudo está funcionando
SELECT 
  'Total de usuários criados: ' || COUNT(*)::TEXT as resultado
FROM usuarios 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

-- 9. PRÓXIMO PASSO: Testar login
-- Acesse: http://localhost:3000
-- Faça login com qualquer um dos emails e senhas criadas