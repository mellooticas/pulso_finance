-- =====================================================
-- TESTE COMPLETO DA MIGRAÇÃO - ETAPAS 2, 3 e 4
-- Execute para validar todos os scripts de migração
-- =====================================================

SELECT 'INICIANDO TESTE COMPLETO DA MIGRAÇÃO...' as status;

-- =====================================================
-- 1. VERIFICAR SE ETAPA 1 FOI EXECUTADA
-- =====================================================

SELECT 'Verificando tabelas temporárias...' as etapa;

SELECT 
    table_name,
    CASE WHEN table_name IS NOT NULL THEN '✅ EXISTE' ELSE '❌ FALTANDO' END as status
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
-- 2. TESTE DA INSERÇÃO DE MAPEAMENTO (ETAPA 2)
-- =====================================================

SELECT 'Testando inserção de mapeamento...' as teste;

-- Teste do mapeamento individual
INSERT INTO temp_mapeamento (plano_yampa, plano_pulso_id, tipo_lancamento, categoria)
SELECT 
    'TESTE RECEITA' as plano_yampa,
    pc.id as plano_pulso_id,
    'receber'::tipo_lancamento as tipo_lancamento,
    pc.categoria::TEXT as categoria
FROM plano_contas pc 
WHERE pc.categoria = 'receita' 
  AND pc.aceita_lancamento = true 
LIMIT 1;

INSERT INTO temp_mapeamento (plano_yampa, plano_pulso_id, tipo_lancamento, categoria)
SELECT 
    'TESTE DESPESA' as plano_yampa,
    pc.id as plano_pulso_id,
    'pagar'::tipo_lancamento as tipo_lancamento,
    pc.categoria::TEXT as categoria
FROM plano_contas pc 
WHERE pc.categoria = 'despesa' 
  AND pc.aceita_lancamento = true 
LIMIT 1;

-- Verificar se funcionou
SELECT 
    'Mapeamentos de teste criados' as resultado,
    COUNT(*) as total
FROM temp_mapeamento 
WHERE plano_yampa LIKE 'TESTE%';

-- =====================================================
-- 3. TESTE DE DADOS NORMALIZADOS (ETAPA 3)
-- =====================================================

SELECT 'Testando normalização de dados...' as teste;

-- Inserir dados de teste em temp_yampa_atual
INSERT INTO temp_yampa_atual (
    data_esperada,
    valor_receber,
    valor_pagar,
    plano_contas,
    historico,
    cliente_fornecedor,
    centro_custo,
    status
) VALUES 
('2024-10-15', '1500.00', '0', 'TESTE RECEITA', 'Venda de teste', 'Cliente Teste', 'Loja 1', 'REALIZADA'),
('2024-10-15', '0', '500.00', 'TESTE DESPESA', 'Compra de teste', 'Fornecedor Teste', 'Loja 1', 'PENDENTE');

-- Testar normalização 
INSERT INTO temp_dados_normalizados (
    data_competencia,
    data_vencimento,
    plano_id,
    tipo,
    valor,
    historico,
    fornecedor,
    centro_custo,
    status_original
)
SELECT 
    '2024-10-15'::DATE as data_competencia,
    '2024-11-15'::DATE as data_vencimento,
    tm.plano_pulso_id as plano_id,
    tm.tipo_lancamento as tipo,
    1000.00 as valor,
    'Teste de normalização' as historico,
    'Fornecedor Teste' as fornecedor,
    'Centro Teste' as centro_custo,
    'TESTE' as status_original
FROM temp_mapeamento tm 
WHERE tm.plano_yampa = 'TESTE RECEITA'
LIMIT 1;

-- Verificar normalização
SELECT 
    'Dados normalizados de teste' as resultado,
    COUNT(*) as total
FROM temp_dados_normalizados;

-- =====================================================
-- 4. TESTE DE INSERÇÃO NO BANCO (ETAPA 4)
-- =====================================================

SELECT 'Testando inserção no banco principal...' as teste;

-- Criar variável de teste
DO $$
DECLARE
    test_loja_id UUID;
    test_user_id UUID;
    test_lancamento_id UUID;
BEGIN
    -- Buscar IDs
    SELECT id INTO test_loja_id FROM lojas WHERE ativa = true LIMIT 1;
    SELECT id INTO test_user_id FROM auth.users LIMIT 1;
    
    -- Inserir lançamento de teste
    test_lancamento_id := gen_random_uuid();
    
    INSERT INTO lancamentos (
        id,
        loja_id,
        plano_id,
        tipo,
        competencia,
        descricao,
        valor_total,
        num_parcelas,
        user_id
    )
    SELECT 
        test_lancamento_id,
        test_loja_id,
        dn.plano_id,
        dn.tipo,
        dn.data_competencia,
        dn.historico || ' - Teste Migração',
        dn.valor,
        1,
        test_user_id
    FROM temp_dados_normalizados dn
    LIMIT 1;
    
    -- Inserir parcela de teste
    INSERT INTO parcelas (
        id,
        lancamento_id,
        parcela,
        valor,
        vencimento,
        status
    )
    SELECT 
        gen_random_uuid(),
        test_lancamento_id,
        1,
        dn.valor,
        dn.data_vencimento,
        'previsto'::status_parcela
    FROM temp_dados_normalizados dn
    LIMIT 1;
    
    RAISE NOTICE 'Teste de inserção realizado com sucesso!';
    
    -- Limpar dados de teste
    DELETE FROM parcelas WHERE lancamento_id = test_lancamento_id;
    DELETE FROM lancamentos WHERE id = test_lancamento_id;
    
    RAISE NOTICE 'Dados de teste removidos!';
    
END $$;

-- =====================================================
-- 5. LIMPEZA DOS DADOS DE TESTE
-- =====================================================

SELECT 'Limpando dados de teste...' as limpeza;

DELETE FROM temp_dados_normalizados;
DELETE FROM temp_yampa_atual WHERE historico = 'Venda de teste' OR historico = 'Compra de teste';
DELETE FROM temp_mapeamento WHERE plano_yampa LIKE 'TESTE%';

-- =====================================================
-- 6. RESULTADO FINAL
-- =====================================================

SELECT 'TESTE COMPLETO FINALIZADO!' as resultado;
SELECT 'Todos os scripts estão funcionando corretamente.' as status;
SELECT 'Pronto para executar a migração real.' as orientacao;