-- =====================================================
-- SCRIPT DE DEBUG PARA MIGRAÇÃO YAMPA
-- Use para diagnosticar problemas antes da migração
-- =====================================================

SELECT 'INICIANDO DIAGNÓSTICO DA MIGRAÇÃO...' as status;

-- =====================================================
-- 1. VERIFICAR ESTRUTURA DO BANCO
-- =====================================================

SELECT 'Verificando tabelas principais...' as etapa;

-- Verificar se existem tabelas principais
SELECT 
    table_name,
    CASE WHEN table_name IS NOT NULL THEN '✅ EXISTE' ELSE '❌ FALTANDO' END as status
FROM (
    VALUES 
    ('lojas'),
    ('plano_contas'), 
    ('lancamentos'),
    ('parcelas')
) expected(table_name)
LEFT JOIN information_schema.tables t 
    ON t.table_name = expected.table_name 
    AND t.table_schema = 'public';

-- =====================================================
-- 2. VERIFICAR DADOS BÁSICOS
-- =====================================================

SELECT 'Verificando dados básicos...' as etapa;

-- Contar registros nas tabelas principais
SELECT 'lojas' as tabela, COUNT(*) as registros FROM lojas
UNION ALL
SELECT 'plano_contas' as tabela, COUNT(*) as registros FROM plano_contas
UNION ALL  
SELECT 'lancamentos' as tabela, COUNT(*) as registros FROM lancamentos
UNION ALL
SELECT 'parcelas' as tabela, COUNT(*) as registros FROM parcelas;

-- =====================================================
-- 3. VERIFICAR PLANO DE CONTAS
-- =====================================================

SELECT 'Verificando plano de contas...' as etapa;

SELECT 
    categoria,
    COUNT(*) as quantidade,
    COUNT(CASE WHEN aceita_lancamento THEN 1 END) as aceita_lancamentos
FROM plano_contas 
GROUP BY categoria
ORDER BY categoria;

-- =====================================================
-- 4. VERIFICAR USUÁRIOS E LOJAS
-- =====================================================

SELECT 'Verificando usuários e lojas...' as etapa;

-- Verificar usuários
SELECT 
    'usuarios' as tipo,
    COUNT(*) as quantidade
FROM auth.users;

-- Verificar lojas ativas
SELECT 
    'lojas_ativas' as tipo,
    COUNT(*) as quantidade  
FROM lojas 
WHERE ativa = true;

-- =====================================================
-- 5. VERIFICAR TABELAS TEMPORÁRIAS (se existirem)
-- =====================================================

SELECT 'Verificando tabelas temporárias...' as etapa;

-- Verificar se existem tabelas temporárias de migração anterior
SELECT 
    expected.table_name,
    CASE WHEN t.table_name IS NOT NULL THEN '⚠️ EXISTE (limpar antes da migração)' ELSE '✅ NÃO EXISTE' END as status
FROM (
    VALUES 
    ('temp_yampa_atual'),
    ('temp_yampa_antigo'),
    ('temp_mapeamento'),
    ('temp_dados_normalizados')
) expected(table_name)
LEFT JOIN information_schema.tables t 
    ON t.table_name = expected.table_name 
    AND t.table_schema = 'public';

-- =====================================================
-- 6. LIMPEZA DE TABELAS TEMPORÁRIAS (se necessário)
-- =====================================================

-- Remover tabelas temporárias se existirem
DROP TABLE IF EXISTS temp_yampa_atual CASCADE;
DROP TABLE IF EXISTS temp_yampa_antigo CASCADE;
DROP TABLE IF EXISTS temp_mapeamento CASCADE;
DROP TABLE IF EXISTS temp_dados_normalizados CASCADE;

SELECT 'Tabelas temporárias removidas (se existiam)' as limpeza;

-- =====================================================
-- 7. RESUMO DO DIAGNÓSTICO
-- =====================================================

SELECT 'DIAGNÓSTICO CONCLUÍDO!' as resultado;
SELECT 'Verifique os resultados acima antes de iniciar a migração.' as orientacao;
SELECT 'Se tudo estiver OK, execute ETAPA_1_PREPARACAO.sql' as proximo_passo;
             ^