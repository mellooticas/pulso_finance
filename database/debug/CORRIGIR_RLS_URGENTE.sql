-- 🔓 CORREÇÃO URGENTE: PERMITIR ACESSO AOS DADOS IMPORTADOS
-- Execute estas queries para permitir acesso aos dados no frontend

-- OPÇÃO 1: Desabilitar RLS temporariamente para desenvolvimento
ALTER TABLE lancamentos DISABLE ROW LEVEL SECURITY;
ALTER TABLE parcelas DISABLE ROW LEVEL SECURITY;
ALTER TABLE lojas DISABLE ROW LEVEL SECURITY;

-- OPÇÃO 2: Criar políticas mais permissivas (alternativa à OPÇÃO 1)
-- USE APENAS UMA DAS OPÇÕES!

-- Política para permitir leitura pública de lançamentos
-- DROP POLICY IF EXISTS "usuarios_podem_ver_lancamentos_das_suas_lojas" ON lancamentos;
-- CREATE POLICY "permitir_leitura_publica_lancamentos" ON lancamentos
--   FOR SELECT USING (true);

-- Política para permitir leitura pública de parcelas  
-- DROP POLICY IF EXISTS "usuarios_podem_ver_parcelas_dos_seus_lancamentos" ON parcelas;
-- CREATE POLICY "permitir_leitura_publica_parcelas" ON parcelas
--   FOR SELECT USING (true);

-- Política para permitir leitura pública de lojas
-- DROP POLICY IF EXISTS "usuarios_podem_ver_suas_lojas" ON lojas;  
-- CREATE POLICY "permitir_leitura_publica_lojas" ON lojas
--   FOR SELECT USING (true);

-- OPÇÃO 3: Criar um usuário de desenvolvimento (mais seguro)
-- INSERT INTO usuarios (id, email, nome, papel, loja_ids) 
-- VALUES (
--   gen_random_uuid(),
--   'dev@pulsofinance.com',
--   'Usuário Desenvolvimento', 
--   'admin',
--   ARRAY['3704fcce-6e02-411d-a0ad-d96de801345a']::uuid[]
-- ) ON CONFLICT DO NOTHING;

-- Verificar se RLS foi desabilitado
SELECT schemaname, tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename IN ('lancamentos', 'parcelas', 'lojas', 'plano_contas');

  | schemaname | tablename    | rowsecurity |
| ---------- | ------------ | ----------- |
| public     | lancamentos  | false       |
| public     | lojas        | false       |
| public     | parcelas     | false       |
| public     | plano_contas | false       |