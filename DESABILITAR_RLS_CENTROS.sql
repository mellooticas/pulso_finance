-- ============================================================
-- 🔓 DESABILITAR RLS EM CENTROS_CUSTO
-- ============================================================
-- PROBLEMA: Centros de custo não aparecem para usuários
-- SOLUÇÃO: Desabilitar RLS temporariamente (desenvolvimento)

-- Desabilitar RLS na tabela centros_custo
ALTER TABLE centros_custo DISABLE ROW LEVEL SECURITY;

-- Verificar se funcionou
SELECT 
    schemaname,
    tablename,
    rowsecurity
FROM pg_tables
WHERE tablename = 'centros_custo';

| schemaname | tablename     | rowsecurity |
| ---------- | ------------- | ----------- |
| public     | centros_custo | false       |

-- Testar query
SELECT codigo, nome, ativo 
FROM centros_custo 
WHERE codigo LIKE 'CC%'
ORDER BY codigo
LIMIT 10;

| codigo | nome              | ativo |
| ------ | ----------------- | ----- |
| CC001  | Escritório        | true  |
| CC002  | Loja Suzano       | true  |
| CC003  | Loja Mauá         | true  |
| CC004  | Loja Rio Pequeno  | true  |
| CC005  | Loja Suzano II    | true  |
| CC006  | Loja São Mateus   | true  |
| CC007  | Loja Perus        | true  |
| CC008  | Taty Mello Festas | true  |
| CC009  | Clínica           | true  |
| CC010  | Pessoal           | true  |