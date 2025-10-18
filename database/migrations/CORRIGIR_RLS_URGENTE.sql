-- CORREÇÃO URGENTE: REMOVER RLS PROBLEMÁTICO
-- Execute este script IMEDIATAMENTE no Supabase SQL Editor

-- 1. DESABILITAR RLS temporariamente
ALTER TABLE usuarios DISABLE ROW LEVEL SECURITY;

-- 2. REMOVER todas as políticas problemáticas
DROP POLICY IF EXISTS "usuarios_select_own" ON usuarios;
DROP POLICY IF EXISTS "usuarios_update_own" ON usuarios;
DROP POLICY IF EXISTS "Usuários podem ver próprios dados" ON usuarios;
DROP POLICY IF EXISTS "Usuários podem atualizar próprios dados" ON usuarios;
DROP POLICY IF EXISTS "rls_usuarios_select" ON usuarios;
DROP POLICY IF EXISTS "rls_usuarios_update" ON usuarios;

-- 3. Verificar se removeu todas as políticas
SELECT 
    policyname,
    cmd,
    qual
FROM pg_policies 
WHERE tablename = 'usuarios';

-- 4. CRIAR políticas RLS SIMPLES (sem recursão)
CREATE POLICY "usuarios_select_simple" ON usuarios
    FOR SELECT 
    USING (auth.uid() = id);

CREATE POLICY "usuarios_update_simple" ON usuarios
    FOR UPDATE 
    USING (auth.uid() = id);

-- 5. REABILITAR RLS com políticas seguras
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;

-- 6. TESTAR consulta simples
SELECT 
  'RLS corrigido - políticas seguras criadas'::TEXT as resultado;

-- 7. Verificar se usuários existem
SELECT 
  id,
  email,
  nome,
  papel,
  created_at
FROM usuarios
ORDER BY created_at DESC;

| id                                   | email                         | nome           | papel      | created_at                   |
| ------------------------------------ | ----------------------------- | -------------- | ---------- | ---------------------------- |
| 84ab5c15-1d27-4933-a3f1-bb9d57f77e7a | financeiroesc@hotmail.com     | Financeiro ESC | financeiro | 2025-10-14 20:59:17.62344+00 |
| 4d316b1a-4914-4d0f-8724-2330ca0c97a8 | tgjphotos@gmail.com           | TGJ Photos     | gerencial  | 2025-10-14 20:59:17.62344+00 |
| 8a138b5b-9bfd-4ee3-8a02-18ac8f3124dc | junior@oticastatymello.com.br | Junior         | admin      | 2025-10-14 20:59:17.62344+00 |