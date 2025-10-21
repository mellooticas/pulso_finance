-- ============================================================
-- 🧪 QUERIES DE VALIDAÇÃO - Dashboard Executivo
-- Data: 20/10/2025
-- Objetivo: Validar se dados do dashboard batem com banco
-- ============================================================

-- ============================================================
-- 📊 PARTE 1: KPIs DO MÊS ATUAL (Outubro/2025)
-- ============================================================

-- 1. RECEITAS DO MÊS
SELECT 
    'KPI: RECEITAS OUTUBRO/2025' as validacao,
    COUNT(*) as quantidade_lancamentos,
    SUM(valor_total) as total_receitas
FROM lancamentos
WHERE tipo = 'receber'
  AND competencia >= '2025-10-01'
  AND competencia <= '2025-10-31';

  | validacao                  | quantidade_lancamentos | total_receitas |
| -------------------------- | ---------------------- | -------------- |
| KPI: RECEITAS OUTUBRO/2025 | 2                      | 362.33         |

-- Esperado: Total de receitas do mês
-- Dashboard deve mostrar: R$ XXX.XXX,XX


-- 2. DESPESAS DO MÊS
SELECT 
    'KPI: DESPESAS OUTUBRO/2025' as validacao,
    COUNT(*) as quantidade_lancamentos,
    SUM(valor_total) as total_despesas
FROM lancamentos
WHERE tipo = 'pagar'
  AND competencia >= '2025-10-01'
  AND competencia <= '2025-10-31';

  | validacao                  | quantidade_lancamentos | total_despesas |
| -------------------------- | ---------------------- | -------------- |
| KPI: DESPESAS OUTUBRO/2025 | 1562                   | 707037.83      |

estes valores estao bem estranhos,  mas vou verificar aqui e subir outro arquivo completo para analisar o que estamos fazendo de errado






-- Esperado: Total de despesas do mês
-- Dashboard deve mostrar: R$ XXX.XXX,XX


-- 3. RESULTADO DO MÊS (Receitas - Despesas)
SELECT 
    'KPI: RESULTADO OUTUBRO/2025' as validacao,
    SUM(CASE WHEN tipo = 'receita' THEN valor_total ELSE 0 END) as receitas,
    SUM(CASE WHEN tipo = 'despesa' THEN valor_total ELSE 0 END) as despesas,
    SUM(CASE WHEN tipo = 'receita' THEN valor_total ELSE -valor_total END) as resultado
FROM lancamentos
WHERE competencia >= '2025-10-01'
  AND competencia <= '2025-10-31';


  | validacao                   | receitas | despesas  | resultado  |
| --------------------------- | -------- | --------- | ---------- |
| KPI: RESULTADO OUTUBRO/2025 | 362.33   | 707037.83 | -706675.50 |

-- Esperado: Resultado = Receitas - Despesas
-- Dashboard deve mostrar: R$ XXX.XXX,XX (verde se +, vermelho se -)


-- 4. TOTAL DE LANÇAMENTOS DO MÊS
SELECT 
    'KPI: TOTAL LANÇAMENTOS OUTUBRO/2025' as validacao,
    COUNT(*) as total_lancamentos,
    COUNT(CASE WHEN tipo = 'receita' THEN 1 END) as receitas,
    COUNT(CASE WHEN tipo = 'despesa' THEN 1 END) as despesas
FROM lancamentos
WHERE competencia >= '2025-10-01'
  AND competencia <= '2025-10-31';

  | validacao                           | total_lancamentos | receitas | despesas |
| ----------------------------------- | ----------------- | -------- | -------- |
| KPI: TOTAL LANÇAMENTOS OUTUBRO/2025 | 1564              | 2        | 1562     |

-- Esperado: Total de lançamentos
-- Dashboard deve mostrar: X.XXX lançamentos


-- ============================================================
-- 🚨 PARTE 2: ALERTAS CRÍTICOS
-- ============================================================

-- 5. CONTAS VENCIDAS (status=previsto, vencimento < hoje)
SELECT 
    'ALERTA: CONTAS VENCIDAS' as validacao,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.tipo = 'despesa'
  AND p.status = 'previsto'
  AND p.vencimento < CURRENT_DATE;

| validacao               | quantidade_parcelas | valor_total |
| ----------------------- | ------------------- | ----------- |
| ALERTA: CONTAS VENCIDAS | 0                   | null        |


-- Esperado: Parcelas vencidas (NÃO pagas ainda)
-- Dashboard deve mostrar: XX contas - R$ XX.XXX,XX


-- 6. CONTAS QUE VENCEM HOJE
SELECT 
    'ALERTA: VENCE HOJE' as validacao,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.tipo = 'despesa'
  AND p.status = 'previsto'
  AND p.vencimento = CURRENT_DATE;

  | validacao          | quantidade_parcelas | valor_total |
| ------------------ | ------------------- | ----------- |
| ALERTA: VENCE HOJE | 0                   | null        |

-- Esperado: Parcelas que vencem hoje
-- Dashboard deve mostrar: XX contas - R$ XX.XXX,XX


-- 7. CONTAS PRÓXIMOS 7 DIAS
SELECT 
    'ALERTA: PRÓXIMOS 7 DIAS' as validacao,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.tipo = 'despesa'
  AND p.status = 'previsto'
  AND p.vencimento > CURRENT_DATE
  AND p.vencimento <= CURRENT_DATE + INTERVAL '7 days';

  | validacao               | quantidade_parcelas | valor_total |
| ----------------------- | ------------------- | ----------- |
| ALERTA: PRÓXIMOS 7 DIAS | 0                   | null        |

-- Esperado: Parcelas próximos 7 dias
-- Dashboard deve mostrar: XX contas - R$ XX.XXX,XX


-- ============================================================
-- 💼 PARTE 3: AÇÕES PRIORITÁRIAS (Top 5 Vencidas)
-- ============================================================

-- 8. TOP 5 CONTAS VENCIDAS (maiores valores)
SELECT 
    'AÇÃO PRIORITÁRIA' as tipo,
    l.descricao,
    lo.nome as loja,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total,
    MIN(p.vencimento) as vencimento_mais_antigo,
    CURRENT_DATE - MIN(p.vencimento) as dias_vencido
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
LEFT JOIN lojas lo ON l.loja_id = lo.id
WHERE l.tipo = 'despesa'
  AND p.status = 'previsto'
  AND p.vencimento < CURRENT_DATE
GROUP BY l.descricao, lo.nome
ORDER BY SUM(p.valor) DESC
LIMIT 5;

Success. No rows returned




-- Esperado: Top 5 fornecedores com maior dívida vencida
-- Dashboard deve mostrar: Lista das 5 maiores contas urgentes


-- ============================================================
-- 🏪 PARTE 4: TOP 3 LOJAS
-- ============================================================

-- 9. RANKING LOJAS POR RESULTADO (Outubro/2025)
SELECT 
    'RANKING LOJAS' as validacao,
    lo.codigo,
    lo.nome,
    COUNT(*) as total_lancamentos,
    SUM(CASE WHEN l.tipo = 'receita' THEN l.valor_total ELSE 0 END) as receitas,
    SUM(CASE WHEN l.tipo = 'despesa' THEN l.valor_total ELSE 0 END) as despesas,
    SUM(CASE WHEN l.tipo = 'receita' THEN l.valor_total ELSE -l.valor_total END) as resultado
FROM lancamentos l
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.competencia >= '2025-10-01'
  AND l.competencia <= '2025-10-31'
GROUP BY lo.id, lo.codigo, lo.nome
ORDER BY resultado DESC
LIMIT 3;

-- Esperado: Top 3 lojas por resultado (receitas - despesas)
-- Dashboard deve mostrar: 🥇 1º 🥈 2º 🥉 3º


-- ============================================================
-- 📅 PARTE 5: PRÓXIMOS VENCIMENTOS (Calendário 7 dias)
-- ============================================================

-- 10. VENCIMENTOS POR DIA (próximos 7 dias)
SELECT 
    p.vencimento as data,
    COUNT(*) as quantidade_parcelas,
    SUM(p.valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.tipo = 'despesa'
  AND p.status = 'previsto'
  AND p.vencimento > CURRENT_DATE
  AND p.vencimento <= CURRENT_DATE + INTERVAL '7 days'
GROUP BY p.vencimento
ORDER BY p.vencimento;

-- Esperado: Quantidade e valor por data (próximos 7 dias)
-- Dashboard deve mostrar: Cards com data, quantidade e valor


-- ============================================================
-- 📊 PARTE 6: TOTAIS GERAIS (Validação Completa)
-- ============================================================

-- 11. RESUMO COMPLETO DO SISTEMA
SELECT 
    'RESUMO GERAL DO SISTEMA' as validacao,
    COUNT(DISTINCT l.id) as total_lancamentos_sistema,
    COUNT(DISTINCT lo.id) as total_lojas_ativas,
    COUNT(DISTINCT cc.id) as total_centros_custo,
    COUNT(DISTINCT pc.id) as total_contas_plano,
    (SELECT COUNT(*) FROM parcelas WHERE status = 'previsto') as parcelas_abertas,
    (SELECT COUNT(*) FROM parcelas WHERE status = 'pago') as parcelas_pagas
FROM lancamentos l
LEFT JOIN lojas lo ON l.loja_id = lo.id
LEFT JOIN centros_custo cc ON l.centro_custo_id = cc.id
LEFT JOIN plano_contas pc ON l.plano_conta_id = pc.id;

-- Esperado:
-- - 42.863 lançamentos totais
-- - 7 lojas ativas
-- - 11 centros de custo
-- - Parcelas abertas vs pagas


-- ============================================================
-- 🎯 PARTE 7: VARIAÇÃO MÊS ANTERIOR (Comparativo)
-- ============================================================

-- 12. COMPARATIVO OUTUBRO vs SETEMBRO 2025
WITH outubro AS (
    SELECT 
        SUM(CASE WHEN tipo = 'receita' THEN valor_total ELSE 0 END) as receitas,
        SUM(CASE WHEN tipo = 'despesa' THEN valor_total ELSE 0 END) as despesas,
        COUNT(*) as lancamentos
    FROM lancamentos
    WHERE competencia >= '2025-10-01' AND competencia <= '2025-10-31'
),
setembro AS (
    SELECT 
        SUM(CASE WHEN tipo = 'receita' THEN valor_total ELSE 0 END) as receitas,
        SUM(CASE WHEN tipo = 'despesa' THEN valor_total ELSE 0 END) as despesas,
        COUNT(*) as lancamentos
    FROM lancamentos
    WHERE competencia >= '2025-09-01' AND competencia <= '2025-09-30'
)
SELECT 
    'COMPARATIVO OUT vs SET' as validacao,
    o.receitas as receitas_outubro,
    s.receitas as receitas_setembro,
    ROUND(((o.receitas - s.receitas) / NULLIF(s.receitas, 0) * 100), 2) as variacao_receitas_pct,
    o.despesas as despesas_outubro,
    s.despesas as despesas_setembro,
    ROUND(((o.despesas - s.despesas) / NULLIF(s.despesas, 0) * 100), 2) as variacao_despesas_pct,
    o.lancamentos as lancamentos_outubro,
    s.lancamentos as lancamentos_setembro
FROM outubro o, setembro s;

-- Esperado: Variação % entre outubro e setembro
-- Dashboard deve mostrar: Setinhas ↑ ou ↓ com %


-- ============================================================
-- ✅ CHECKLIST DE VALIDAÇÃO
-- ============================================================

/*
[ ] Query 1: Receitas Outubro = Dashboard "Entradas (Receber)"
[ ] Query 2: Despesas Outubro = Dashboard "Saídas (Pagar)"
[ ] Query 3: Resultado = Dashboard "Saldo do Período"
[ ] Query 4: Lançamentos = Dashboard "Total de Lançamentos"
[ ] Query 5: Vencidas = Dashboard Alerta VERMELHO
[ ] Query 6: Vence Hoje = Dashboard Alerta LARANJA
[ ] Query 7: 7 Dias = Dashboard Alerta AMARELO
[ ] Query 8: Top 5 = Dashboard "Ações Prioritárias"
[ ] Query 9: Top 3 = Dashboard "Performance por Loja" 🥇🥈🥉
[ ] Query 10: Calendário = Dashboard "Próximos Vencimentos"
[ ] Query 11: Resumo = 42.863 lançamentos, 7 lojas
[ ] Query 12: Variação % = Setinhas ↑↓ nos KPIs
*/

-- ============================================================
-- 🚀 EXECUTAR TODAS AS QUERIES E COMPARAR COM DASHBOARD!
-- ============================================================
