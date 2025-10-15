-- ==========================================
-- DIAGNÓSTICO DE RLS - PULSO Finance
-- ==========================================

-- 1. Verificar status do RLS na tabela usuarios
SELECT 
  schemaname, 
  tablename, 
  rowsecurity,
  hasrls
FROM pg_tables 
WHERE tablename = 'usuarios';

ERROR:  42703: column "hasrls" does not exist
LINE 6:   hasrls
          ^
HINT:  Perhaps you meant to reference the column "pg_tables.hasrules".

-- 2. Ver todas as políticas RLS da tabela usuarios
SELECT 
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies 
WHERE tablename = 'usuarios';

| policyname             | permissive | roles    | cmd    | qual              | with_check |
| ---------------------- | ---------- | -------- | ------ | ----------------- | ---------- |
| usuarios_select_simple | PERMISSIVE | {public} | SELECT | (auth.uid() = id) | null       |
| usuarios_update_simple | PERMISSIVE | {public} | UPDATE | (auth.uid() = id) | null       |

-- 3. Testar acesso como usuário anônimo (role que a app usa)
SET ROLE anon;
SELECT COUNT(*) as usuarios_visiveis_para_anon FROM public.usuarios;

| usuarios_visiveis_para_anon |
| --------------------------- |
| 0                           |

-- 4. Resetar role
RESET ROLE;

Success. No rows returned




-- 5. Ver usuários sem RLS (como superuser)
SELECT 
  email, 
  nome, 
  ativo,
  created_at
FROM public.usuarios 
ORDER BY created_at DESC;

| email                         | nome           | ativo | created_at                   |
| ----------------------------- | -------------- | ----- | ---------------------------- |
| financeiroesc@hotmail.com     | Financeiro ESC | true  | 2025-10-14 20:59:17.62344+00 |
| tgjphotos@gmail.com           | TGJ Photos     | true  | 2025-10-14 20:59:17.62344+00 |
| junior@oticastatymello.com.br | Junior         | true  | 2025-10-14 20:59:17.62344+00 |

-- 6. TEMPORARIAMENTE desabilitar RLS para teste (CUIDADO!)
-- DESCOMENTE APENAS PARA TESTE:
-- ALTER TABLE public.usuarios DISABLE ROW LEVEL SECURITY;

-- 7. Para reabilitar depois do teste:
-- ALTER TABLE public.usuarios ENABLE ROW LEVEL SECURITY;