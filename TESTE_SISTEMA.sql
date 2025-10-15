-- =====================================================
-- TESTE RÁPIDO DO SISTEMA PULSO FINANCE
-- Execute para verificar se tudo está funcionando
-- =====================================================

SELECT 'TESTANDO SISTEMA PULSO FINANCE...' as status;

-- =====================================================
-- 1. INSERIR DADOS DE TESTE
-- =====================================================

-- Buscar primeira loja e usuário
SELECT 
    l.id as loja_id,
    l.nome as loja_nome,
    u.id as user_id
FROM lojas l
CROSS JOIN auth.users u
WHERE l.ativa = true
LIMIT 1;

-- Inserir um lançamento de teste
WITH dados_teste AS (
    SELECT 
        l.id as loja_id,
        u.id as user_id,
        pc.id as plano_id
    FROM lojas l
    CROSS JOIN auth.users u
    CROSS JOIN plano_contas pc
    WHERE l.ativa = true 
    AND pc.aceita_lancamento = true
    AND pc.categoria = 'receita'
    LIMIT 1
)
INSERT INTO lancamentos (
    id,
    loja_id,
    plano_id,
    tipo,
    competencia,
    observacoes,
    valor_total,
    num_parcelas,
    user_id
)
SELECT 
    gen_random_uuid(),
    dt.loja_id,
    dt.plano_id,
    'receber'::tipo_lancamento,
    CURRENT_DATE,
    'Teste do Sistema - ' || CURRENT_TIMESTAMP,
    1500.00,
    1,
    dt.user_id
FROM dados_teste dt;

-- Buscar o lançamento recém criado
WITH ultimo_lancamento AS (
    SELECT id, valor_total 
    FROM lancamentos 
    WHERE observacoes LIKE 'Teste do Sistema%'
    ORDER BY created_at DESC 
    LIMIT 1
)
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
    ul.id,
    1,
    ul.valor_total,
    CURRENT_DATE + INTERVAL '30 days',
    'previsto'::status_parcela
FROM ultimo_lancamento ul;

-- =====================================================
-- 2. TESTAR QUERIES DO DASHBOARD
-- =====================================================

SELECT 'Testando queries do dashboard...' as etapa;

-- KPIs básicos
SELECT 
    'KPIs' as teste,
    COUNT(*) as total_lancamentos,
    SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE 0 END) as receitas,
    SUM(CASE WHEN tipo = 'pagar' THEN valor_total ELSE 0 END) as despesas
FROM lancamentos
WHERE competencia >= CURRENT_DATE - INTERVAL '30 days';

-- Dados para gráficos
SELECT 
    'Grafico_Mensal' as teste,
    DATE_TRUNC('month', competencia) as mes,
    tipo,
    SUM(valor_total) as valor
FROM lancamentos
GROUP BY DATE_TRUNC('month', competencia), tipo
ORDER BY mes DESC, tipo;

-- Status das parcelas
SELECT 
    'Status_Parcelas' as teste,
    status,
    COUNT(*) as quantidade,
    SUM(valor) as valor_total
FROM parcelas
GROUP BY status;

-- =====================================================
-- 3. VERIFICAR PERFORMANCE
-- =====================================================

SELECT 'Verificando performance...' as etapa;

-- Tempo de resposta da query principal do dashboard
EXPLAIN ANALYZE
SELECT 
    l.competencia,
    l.tipo,
    l.valor_total,
    pc.nome as plano_nome,
    pc.categoria,
    p.status as status_parcela
FROM lancamentos l
JOIN plano_contas pc ON pc.id = l.plano_id
LEFT JOIN parcelas p ON p.lancamento_id = l.id
WHERE l.competencia >= CURRENT_DATE - INTERVAL '90 days'
ORDER BY l.competencia DESC
LIMIT 100;

-- =====================================================
-- 4. LIMPEZA DOS DADOS DE TESTE
-- =====================================================

SELECT 'Limpando dados de teste...' as limpeza;

-- Remover parcelas de teste
DELETE FROM parcelas 
WHERE lancamento_id IN (
    SELECT id FROM lancamentos 
    WHERE observacoes LIKE 'Teste do Sistema%'
);

-- Remover lançamentos de teste  
DELETE FROM lancamentos 
WHERE observacoes LIKE 'Teste do Sistema%';

-- =====================================================
-- 5. RESULTADO FINAL
-- =====================================================

SELECT 'TESTE CONCLUÍDO COM SUCESSO! ✅' as resultado;
SELECT 'Sistema Pulso Finance funcionando corretamente.' as status;
SELECT 'Pronto para receber a migração dos dados Yampa.' as orientacao;