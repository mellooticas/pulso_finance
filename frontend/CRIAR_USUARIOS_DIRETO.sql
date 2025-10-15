-- ==========================================
-- CRIAR USUÁRIOS REAIS - PULSO Finance
-- ==========================================

-- 1. Inserir usuários na tabela usuarios (será sincronizado com Auth via trigger)
INSERT INTO public.usuarios (
  email, 
  nome, 
  papel, 
  loja_ids, 
  ativo,
  configuracoes
) VALUES 
  -- Usuário Gerencial
  (
    'junior@oticastatymello.com.br', 
    'Junior Tatymello', 
    'gerencial', 
    '["1", "2", "3", "4", "5", "6", "7"]'::jsonb,
    true,
    '{
      "tema": "light",
      "notificacoes": true,
      "dashboard_widgets": ["receitas", "despesas", "fluxo_caixa", "dre"],
      "filtro_padrao_periodo": "30_dias"
    }'::jsonb
  ),
  -- Usuário Financeiro Escada
  (
    'financeiroesc@hotmail.com', 
    'Financeiro Escada', 
    'financeiro', 
    '["3"]'::jsonb,
    true,
    '{
      "tema": "light",
      "notificacoes": true,
      "dashboard_widgets": ["receitas", "despesas", "fluxo_caixa"],
      "filtro_padrao_periodo": "30_dias"
    }'::jsonb
  ),
  -- Usuário Admin
  (
    'tgjphotos@gmail.com', 
    'Admin Sistema', 
    'admin', 
    '["1", "2", "3", "4", "5", "6", "7"]'::jsonb,
    true,
    '{
      "tema": "dark",
      "notificacoes": true,
      "dashboard_widgets": ["receitas", "despesas", "fluxo_caixa", "dre", "conciliacao"],
      "filtro_padrao_periodo": "90_dias"
    }'::jsonb
  )
ON CONFLICT (email) DO UPDATE SET
  nome = EXCLUDED.nome,
  papel = EXCLUDED.papel,
  loja_ids = EXCLUDED.loja_ids,
  ativo = EXCLUDED.ativo,
  configuracoes = EXCLUDED.configuracoes,
  updated_at = CURRENT_TIMESTAMP;

-- 2. Verificar se os usuários foram criados
SELECT 
  email, 
  nome, 
  papel, 
  ativo,
  loja_ids,
  created_at
FROM public.usuarios 
ORDER BY created_at DESC;

-- 3. Criar usuários no Auth (execute isso no dashboard do Supabase)
/*
Para cada usuário, execute no dashboard do Supabase > Authentication > Users:

1. junior@oticastatymello.com.br / 123456
2. financeiroesc@hotmail.com / 123456  
3. tgjphotos@gmail.com / 123456

Ou use a API:
*/

-- 4. Verificar se RLS está funcionando
SELECT 
  schemaname, 
  tablename, 
  rowsecurity 
FROM pg_tables 
WHERE tablename = 'usuarios';

-- 5. Testar consulta com RLS
SET ROLE authenticator;
SELECT * FROM public.usuarios LIMIT 1;