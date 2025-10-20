-- ============================================================
-- 🔍 INVESTIGAÇÃO: Por que não aparecem contas a pagar?
-- Data: 20/10/2025 - Filtro até fim do mês
-- ============================================================

-- 1. Verificar estrutura e sample de lançamentos
SELECT 
    'SAMPLE DE LANÇAMENTOS' as secao,
    id,
    tipo,
    descricao,
    competencia,
    valor_total,
    num_parcelas,
    status_aprovacao,
    created_at
FROM lancamentos
LIMIT 5;

-- 1.5. Verificar PARCELAS (onde estão os vencimentos!)
SELECT 
    'SAMPLE DE PARCELAS' as secao,
    p.id,
    p.vencimento,
    p.valor,
    p.status,
    p.data_pagamento,
    l.tipo as tipo_lancamento,
    l.descricao
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
ORDER BY p.vencimento DESC
LIMIT 10;

-- 2. Contar lançamentos por tipo
SELECT 
    'LANÇAMENTOS POR TIPO' as secao,
    tipo,
    COUNT(*) as quantidade
FROM lancamentos
GROUP BY tipo;

-- 3. Range de datas no banco
SELECT 
    'RANGE DE DATAS' as secao,
    MIN(competencia) as data_mais_antiga,
    MAX(competencia) as data_mais_recente,
    COUNT(*) as total_lancamentos
FROM lancamentos;

-- 4. Lançamentos em OUTUBRO/2025 (competência)
SELECT 
    'OUTUBRO 2025 - COMPETÊNCIA' as secao,
    tipo,
    COUNT(*) as quantidade,
    SUM(valor_total) as valor_total
FROM lancamentos
WHERE competencia >= '2025-10-01' 
  AND competencia <= '2025-10-31'
GROUP BY tipo;

-- 5. PARCELAS com vencimento em OUTUBRO/2025 (AQUI ESTÃO AS CONTAS!)
SELECT 
    'OUTUBRO 2025 - VENCIMENTO (PARCELAS)' as secao,
    l.tipo,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total,
    COUNT(CASE WHEN p.status = 'previsto' THEN 1 END) as parcelas_previstas,
    COUNT(CASE WHEN p.status = 'pago' THEN 1 END) as parcelas_pagas,
    COUNT(CASE WHEN p.status = 'atrasado' THEN 1 END) as parcelas_atrasadas
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
GROUP BY l.tipo;

-- 6. Sample de PARCELAS em OUTUBRO/2025 (detalhado)
SELECT 
    'SAMPLE PARCELAS OUTUBRO 2025' as secao,
    p.vencimento,
    p.valor,
    p.status,
    p.data_pagamento,
    l.tipo as tipo_lancamento,
    l.descricao,
    lo.nome as loja
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
LEFT JOIN lojas lo ON l.loja_id = lo.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
ORDER BY p.vencimento, l.tipo
LIMIT 20;

-- 7. Verificar se existe tabela de parcelas
SELECT 
    'VERIFICAR PARCELAS' as secao,
    COUNT(*) as total_parcelas
FROM parcelas
WHERE vencimento >= '2025-10-01' 
  AND vencimento <= '2025-10-31';

-- 8. Sample de parcelas em outubro (se existir)
SELECT 
    p.vencimento,
    p.valor,
    p.status,
    l.tipo as tipo_lancamento,
    l.descricao
FROM parcelas p
LEFT JOIN lancamentos l ON p.lancamento_id = l.id
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
ORDER BY p.vencimento
LIMIT 10;

-- 9. Verificar distribuição temporal das PARCELAS
SELECT 
    TO_CHAR(p.vencimento, 'YYYY-MM') as mes_ano,
    l.tipo,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
GROUP BY TO_CHAR(p.vencimento, 'YYYY-MM'), l.tipo
ORDER BY mes_ano DESC, l.tipo
LIMIT 20;

-- 10. ANÁLISE CRÍTICA: Parcelas previstas vs pagas
SELECT 
    'ANÁLISE DE STATUS' as secao,
    p.status,
    COUNT(*) as quantidade,
    SUM(p.valor) as valor_total
FROM parcelas p
WHERE p.vencimento >= '2025-10-01' 
  AND p.vencimento <= '2025-10-31'
GROUP BY p.status
ORDER BY p.status;

-- ============================================================
-- 💡 ANÁLISE ESPERADA:
--
-- CENÁRIO 1: Dados são de 2024 ou anteriores
--   - MAX(competencia) < '2025-10-01'
--   - Solução: Verificar se dados precisam ser atualizados
--
-- CENÁRIO 2: Sistema usa 'data_vencimento' para contas futuras
--   - competencia está no passado, data_vencimento no futuro
--   - Solução: Filtrar por data_vencimento em vez de competencia
--
-- CENÁRIO 3: Contas a pagar estão em tabela 'parcelas'
--   - lancamentos tem competência passada
--   - parcelas tem vencimentos futuros
--   - Solução: Consultar tabela parcelas
--
-- CENÁRIO 4: Não há dados futuros cadastrados
--   - Sistema só tem histórico, sem previsões
--   - Solução: Implementar cadastro de contas a pagar futuras
-- ============================================================
