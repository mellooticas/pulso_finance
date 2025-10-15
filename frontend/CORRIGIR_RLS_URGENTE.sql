-- ==========================================
-- CORRIGIR POLÍTICAS RLS - PULSO Finance
-- ==========================================

-- PROBLEMA IDENTIFICADO:
-- As políticas RLS estão comparando auth.uid() com usuarios.id
-- Mas esses são IDs diferentes!
-- auth.uid() = ID do Auth Supabase
-- usuarios.id = ID da tabela usuarios

-- SOLUÇÃO 1: Remover políticas incorretas
DROP POLICY IF EXISTS "usuarios_select_simple" ON public.usuarios;
DROP POLICY IF EXISTS "usuarios_update_simple" ON public.usuarios;

-- SOLUÇÃO 2: Criar políticas corretas baseadas em email
-- (Já que não temos mapeamento direto de IDs)

-- Política para SELECT: usuário pode ver apenas seu próprio registro
CREATE POLICY "usuarios_select_own" ON public.usuarios
  FOR SELECT 
  TO public
  USING (
    email = auth.jwt() ->> 'email'
  );

-- Política para UPDATE: usuário pode atualizar apenas seu próprio registro
CREATE POLICY "usuarios_update_own" ON public.usuarios
  FOR UPDATE 
  TO public
  USING (
    email = auth.jwt() ->> 'email'
  )
  WITH CHECK (
    email = auth.jwt() ->> 'email'
  );

-- SOLUÇÃO 3: Política para permitir leitura para aplicação (anon role)
-- Esta política permite que a aplicação leia usuários quando necessário
CREATE POLICY "usuarios_read_authenticated" ON public.usuarios
  FOR SELECT 
  TO authenticated
  USING (true);

-- SOLUÇÃO 4: Política para permitir leitura limitada para role anon
-- Permite que a aplicação encontre usuários para autenticação
CREATE POLICY "usuarios_auth_lookup" ON public.usuarios
  FOR SELECT 
  TO anon
  USING (ativo = true);

-- VERIFICAÇÃO: Testar as novas políticas
SET ROLE anon;
SELECT COUNT(*) as usuarios_visiveis_anon FROM public.usuarios;
RESET ROLE;

SET ROLE authenticated;
SELECT COUNT(*) as usuarios_visiveis_authenticated FROM public.usuarios;
RESET ROLE;

-- Ver políticas atuais
SELECT 
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies 
WHERE tablename = 'usuarios';


| policyname                  | permissive | roles           | cmd    | qual                                     |
| --------------------------- | ---------- | --------------- | ------ | ---------------------------------------- |
| usuarios_auth_lookup        | PERMISSIVE | {anon}          | SELECT | (ativo = true)                           |
| usuarios_read_authenticated | PERMISSIVE | {authenticated} | SELECT | true                                     |
| usuarios_select_own         | PERMISSIVE | {public}        | SELECT | (email = (auth.jwt() ->> 'email'::text)) |
| usuarios_update_own         | PERMISSIVE | {public}        | UPDATE | (email = (auth.jwt() ->> 'email'::text)) |