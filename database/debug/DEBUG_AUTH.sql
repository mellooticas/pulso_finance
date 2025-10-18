-- DEBUG: Verificar usuário autenticado atual
-- Execute no Supabase SQL Editor

-- 1. Ver todos os usuários no Auth
SELECT 
  id,
  email,
  created_at,
  email_confirmed_at IS NOT NULL as confirmado
FROM auth.users 
ORDER BY created_at DESC;


| id                                   | email                         | created_at                    | confirmado |
| ------------------------------------ | ----------------------------- | ----------------------------- | ---------- |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           | 2025-10-14 20:58:59.779829+00 | true       |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     | 2025-10-14 20:58:37.123607+00 | true       |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | 2025-10-14 20:58:13.746055+00 | true       |
-- 2. Ver quais emails você criou
SELECT 
  id,
  email
FROM auth.users 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

| id                                   | email                         |
| ------------------------------------ | ----------------------------- |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br |

-- 3. Verificar se existe perfil para o ID específico do erro
SELECT 
  id,
  email,
  nome
FROM usuarios 
WHERE id = '8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc';

| id                                   | email                         | nome   |
| ------------------------------------ | ----------------------------- | ------ |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | Junior |

-- 4. Ver todos os perfis existentes
SELECT 
  id,
  email,
  nome,
  papel
FROM usuarios;| id                                   | email                         | nome           | papel      |
| ------------------------------------ | ----------------------------- | -------------- | ---------- |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     | Financeiro ESC | financeiro |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           | TGJ Photos     | gerencial  |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | Junior         | admin      |

-- 5. EXECUTAR CRIAÇÃO DE PERFIS (apenas se não existirem)
-- Copie e execute a função criar_perfis_usuarios() do arquivo CRIAR_USUARIOS_REAIS.sql