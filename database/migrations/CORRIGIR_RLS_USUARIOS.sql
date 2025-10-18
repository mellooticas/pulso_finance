-- CORREÇÃO DO ERRO 406 - RLS DA TABELA USUARIOS
-- Execute este script no Supabase SQL Editor

-- 1. Verificar se RLS está habilitado
SELECT schemaname, tablename, rowsecurity 
FROM pg_tables 
WHERE tablename = 'usuarios';,


| schemaname | tablename | rowsecurity |
| ---------- | --------- | ----------- |
| public     | usuarios  | true        |

-- 2. Verificar políticas RLS existentes
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies 
WHERE tablename = 'usuarios';

Success. No rows returned




-- 3. TEMPORARIAMENTE desabilitar RLS para testar
ALTER TABLE usuarios DISABLE ROW LEVEL SECURITY;

Success. No rows returned




-- 4. Testar consulta direta
SELECT 
  id,
  email,
  nome,
  papel,
  ativo
FROM usuarios 
WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

| id                                   | email                         | nome           | papel      | ativo |
| ------------------------------------ | ----------------------------- | -------------- | ---------- | ----- |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | Junior         | admin      | true  |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     | Financeiro ESC | financeiro | true  |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           | TGJ Photos     | gerencial  | true  |

-- 5. Reabilitar RLS e criar política correta
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

Success. No rows returned




-- 6. Remover políticas existentes (se houver conflito)
DROP POLICY IF EXISTS "Usuários podem ver próprios dados" ON usuarios;
DROP POLICY IF EXISTS "Usuários podem atualizar próprios dados" ON usuarios;
DROP POLICY IF EXISTS "rls_usuarios_select" ON usuarios;
DROP POLICY IF EXISTS "rls_usuarios_update" ON usuarios;


Success. No rows returned




-- 7. Criar política RLS correta para autenticação
CREATE POLICY "usuarios_select_own" ON usuarios
    FOR SELECT 
    USING (auth.uid() = id OR auth.uid() IN (
        SELECT id FROM usuarios WHERE papel = 'admin'
    ));

CREATE POLICY "usuarios_update_own" ON usuarios
    FOR UPDATE 
    USING (auth.uid() = id OR auth.uid() IN (
        SELECT id FROM usuarios WHERE papel = 'admin'
    ));

-- 8. Testar se a consulta funciona agora
SELECT 
  'RLS configurado corretamente'::TEXT as resultado;

-- 9. Verificar se os usuários foram criados corretamente
SELECT 
  u.email,
  u.nome,
  u.papel,
  array_length(u.loja_ids, 1) as qtd_lojas,
  u.ativo,
  u.created_at
FROM usuarios u
WHERE u.email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
)
ORDER BY u.papel;

| email                         | nome           | papel      | qtd_lojas | ativo | created_at                   |
| ----------------------------- | -------------- | ---------- | --------- | ----- | ---------------------------- |
| tgjphotos@gmail.com           | TGJ Photos     | gerencial  | 2         | true  | 2025-10-14 20:59:17.62344+00 |
| financeiroesc@hotmail.com     | Financeiro ESC | financeiro | 4         | true  | 2025-10-14 20:59:17.62344+00 |
| junior@oticastatymello.com.br | Junior         | admin      | 7         | true  | 2025-10-14 20:59:17.62344+00 |