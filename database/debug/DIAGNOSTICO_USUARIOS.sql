-- DIAGNÓSTICO: Por que não há usuários criados?
-- Execute estas queries uma por uma para investigar:

-- 1. Verificar se existem usuários no Auth
SELECT 
  id, 
  email, 
  email_confirmed_at,
  created_at
FROM auth.users 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

Success. No rows returned





-- 2. Verificar se existem na tabela usuarios
SELECT 
  id,
  email,
  nome,
  papel,
  created_at
FROM usuarios 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

Success. No rows returned




-- 3. Verificar todos os usuários que existem no Auth
SELECT 
  id,
  email,
  created_at,
  email_confirmed_at IS NOT NULL as confirmado
FROM auth.users 
ORDER BY created_at DESC
LIMIT 10;

Success. No rows returned




-- 4. Verificar todos os usuários na tabela usuarios
SELECT 
  id,
  email,
  nome,
  papel,
  created_at
FROM usuarios 
ORDER BY created_at DESC
LIMIT 10;

Success. No rows returned




-- 5. Se não há usuários no Auth, vamos criar um teste simples:
-- EXECUTE APENAS SE NÃO EXISTIR NO AUTH:

-- Função para criar um usuário de teste diretamente
CREATE OR REPLACE FUNCTION teste_criar_usuario()
RETURNS TABLE(resultado TEXT)
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  teste_id UUID;
BEGIN
  -- Gerar UUID para teste
  teste_id := gen_random_uuid();
  
  -- Tentar inserir diretamente (vai falhar se não existir no auth)
  BEGIN
    INSERT INTO usuarios (
      id,
      email,
      nome,
      papel,
      ativo
    ) VALUES (
      teste_id,
      'teste@pulsofinance.com',
      'Usuario Teste',
      'gerencial',
      true
    );
    
    RETURN QUERY SELECT 'Usuário teste criado com sucesso'::TEXT;
  EXCEPTION WHEN foreign_key_violation THEN
    RETURN QUERY SELECT 'ERRO: Usuário precisa existir no Auth primeiro'::TEXT;
  END;
  
END;
$$;

-- Executar teste
SELECT * FROM teste_criar_usuario();


| resultado                                      |
| ---------------------------------------------- |
| ERRO: Usuário precisa existir no Auth primeiro |

-- Limpar teste
DROP FUNCTION teste_criar_usuario();
DELETE FROM usuarios WHERE email = 'teste@pulsofinance.com';