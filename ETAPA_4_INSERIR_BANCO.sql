-- =====================================================
-- ETAPA 4: INSERIR DADOS NO BANCO PRINCIPAL
-- Execute QUARTO (FINAL) no SQL Editor do Supabase
-- Após executar ETAPA_3_NORMALIZACAO.sql
-- =====================================================

SELECT 'INICIANDO ETAPA 4: Inserção no banco principal...' as status;

-- =====================================================
-- OBTER LOJA PADRÃO E USUÁRIO
-- =====================================================

-- Buscar ID da primeira loja disponível
DO $$
DECLARE
    loja_id_var UUID;
    user_id_var UUID;
BEGIN
    -- Buscar primeira loja ativa
    SELECT id INTO loja_id_var 
    FROM lojas 
    WHERE ativa = true 
    ORDER BY created_at 
    LIMIT 1;
    
    -- Buscar primeiro usuário (assumindo que é o admin)
    SELECT id INTO user_id_var 
    FROM auth.users 
    ORDER BY created_at 
    LIMIT 1;
    
    -- Guardar em variáveis temporárias
    CREATE TEMP TABLE vars (loja_id UUID, user_id UUID);
    INSERT INTO vars VALUES (loja_id_var, user_id_var);
END $$;

-- =====================================================
-- INSERIR LANÇAMENTOS PRINCIPAIS
-- =====================================================

-- Primeiro, inserir os lançamentos
INSERT INTO lancamentos (
    id,
    loja_id,
    plano_id,
    tipo,
    competencia,
    descricao,
    observacoes,
    valor_total,
    num_parcelas,
    user_id,
    created_at,
    updated_at
)
SELECT 
    gen_random_uuid() as id,
    v.loja_id,
    dn.plano_id,
    dn.tipo,
    dn.data_competencia,
    COALESCE(
        CASE 
            WHEN dn.historico IS NOT NULL AND dn.fornecedor IS NOT NULL THEN 
                dn.historico || ' - ' || dn.fornecedor
            WHEN dn.historico IS NOT NULL THEN dn.historico
            WHEN dn.fornecedor IS NOT NULL THEN dn.fornecedor
            ELSE 'Migração Yampa'
        END,
        'Migração Yampa'
    ) as descricao,
    COALESCE(
        CASE 
            WHEN dn.centro_custo IS NOT NULL AND dn.centro_custo != '' THEN 
                'Centro de Custo: ' || dn.centro_custo
            ELSE NULL
        END,
        'Migração automática do sistema Yampa'
    ) as observacoes,
    dn.valor,
    1 as num_parcelas, -- Sempre 1 parcela para dados históricos
    v.user_id,
    COALESCE(dn.data_competencia, CURRENT_DATE) as created_at,
    COALESCE(dn.data_competencia, CURRENT_DATE) as updated_at
    
FROM temp_dados_normalizados dn
CROSS JOIN vars v
WHERE 
    dn.plano_id IS NOT NULL
    AND dn.valor > 0
    AND dn.data_competencia IS NOT NULL
    AND dn.data_competencia >= '2020-01-01'
    AND dn.data_competencia <= CURRENT_DATE;

-- =====================================================
-- INSERIR PARCELAS
-- =====================================================

-- Agora inserir as parcelas correspondentes
INSERT INTO parcelas (
    id,
    lancamento_id,
    parcela,
    valor,
    vencimento,
    data_pagamento,
    status,
    observacao,
    created_at,
    updated_at
)
SELECT 
    gen_random_uuid() as id,
    l.id as lancamento_id,
    1 as parcela,
    l.valor_total as valor,
    COALESCE(dn.data_vencimento, l.competencia) as vencimento,
    
    -- Se o status indica que foi pago/recebido, marcar data de pagamento
    CASE 
        WHEN UPPER(dn.status_original) LIKE '%REALIZADA%' 
            OR UPPER(dn.status_original) LIKE '%PAGO%'
            OR UPPER(dn.status_original) LIKE '%RECEBIDO%'
            OR UPPER(dn.status_original) LIKE '%QUITADO%'
        THEN COALESCE(dn.data_vencimento, l.competencia)
        ELSE NULL
    END as data_pagamento,
    
    -- Definir status baseado no status original
    CASE 
        WHEN UPPER(dn.status_original) LIKE '%REALIZADA%' 
            OR UPPER(dn.status_original) LIKE '%PAGO%'
            OR UPPER(dn.status_original) LIKE '%RECEBIDO%'
            OR UPPER(dn.status_original) LIKE '%QUITADO%'
        THEN 'pago'::status_parcela
        
        WHEN COALESCE(dn.data_vencimento, l.competencia) < CURRENT_DATE
        THEN 'vencido'::status_parcela
        
        ELSE 'previsto'::status_parcela
    END as status,
    
    -- Observações com informações adicionais
    CASE 
        WHEN dn.centro_custo IS NOT NULL AND dn.centro_custo != '' 
        THEN 'Centro de Custo: ' || dn.centro_custo || ' | Status Original: ' || COALESCE(dn.status_original, 'N/A')
        ELSE 'Status Original: ' || COALESCE(dn.status_original, 'N/A')
    END as observacao,
    
    COALESCE(dn.data_competencia, CURRENT_DATE) as created_at,
    COALESCE(dn.data_competencia, CURRENT_DATE) as updated_at

FROM lancamentos l
INNER JOIN temp_dados_normalizados dn 
    ON l.plano_id = dn.plano_id 
    AND l.tipo = dn.tipo 
    AND l.competencia = dn.data_competencia 
    AND l.valor_total = dn.valor
WHERE l.created_at >= CURRENT_DATE - INTERVAL '1 hour'; -- Apenas os recém inseridos

-- =====================================================
-- RELATÓRIO FINAL DA MIGRAÇÃO
-- =====================================================

SELECT 'MIGRAÇÃO CONCLUÍDA!' as resultado;

-- Estatísticas gerais
SELECT 
    'RESUMO GERAL' as secao,
    COUNT(*) as total_lancamentos,
    SUM(valor_total) as valor_total_migrado,
    MIN(competencia) as primeira_data,
    MAX(competencia) as ultima_data
FROM lancamentos 
WHERE created_at >= CURRENT_DATE - INTERVAL '1 hour';

-- Estatísticas por tipo
SELECT 
    'POR TIPO' as secao,
    tipo,
    COUNT(*) as quantidade,
    SUM(valor_total) as valor_total,
    ROUND(AVG(valor_total), 2) as valor_medio
FROM lancamentos 
WHERE created_at >= CURRENT_DATE - INTERVAL '1 hour'
GROUP BY tipo
ORDER BY tipo;

-- Estatísticas por ano
SELECT 
    'POR ANO' as secao,
    EXTRACT(YEAR FROM competencia) as ano,
    COUNT(*) as lancamentos,
    SUM(CASE WHEN tipo = 'receber' THEN valor_total ELSE 0 END) as receitas,
    SUM(CASE WHEN tipo = 'pagar' THEN valor_total ELSE 0 END) as despesas
FROM lancamentos 
WHERE created_at >= CURRENT_DATE - INTERVAL '1 hour'
GROUP BY EXTRACT(YEAR FROM competencia)
ORDER BY ano;

-- Status das parcelas
SELECT 
    'STATUS PARCELAS' as secao,
    status,
    COUNT(*) as quantidade,
    SUM(valor) as valor_total
FROM parcelas 
WHERE created_at >= CURRENT_DATE - INTERVAL '1 hour'
GROUP BY status
ORDER BY status;

-- Top 10 planos de contas mais utilizados
SELECT 
    'TOP PLANOS DE CONTAS' as secao,
    pc.nome,
    pc.categoria,
    COUNT(l.*) as uso_frequencia,
    SUM(l.valor_total) as valor_total
FROM lancamentos l
INNER JOIN plano_contas pc ON pc.id = l.plano_id
WHERE l.created_at >= CURRENT_DATE - INTERVAL '1 hour'
GROUP BY pc.id, pc.nome, pc.categoria
ORDER BY uso_frequencia DESC
LIMIT 10;

-- =====================================================
-- LIMPEZA DAS TABELAS TEMPORÁRIAS
-- =====================================================

SELECT 'Limpando tabelas temporárias...' as limpeza;

DROP TABLE IF EXISTS temp_yampa_atual CASCADE;
DROP TABLE IF EXISTS temp_yampa_antigo CASCADE;
DROP TABLE IF EXISTS temp_mapeamento CASCADE;
DROP TABLE IF EXISTS temp_dados_normalizados CASCADE;
DROP TABLE IF EXISTS vars CASCADE;

-- =====================================================
-- ATUALIZAR ESTATÍSTICAS DO BANCO
-- =====================================================

ANALYZE lancamentos;
ANALYZE parcelas;
ANALYZE plano_contas;

SELECT 'MIGRAÇÃO YAMPA FINALIZADA COM SUCESSO!' as final;
SELECT 'Acesse o dashboard para visualizar os dados migrados.' as orientacao;