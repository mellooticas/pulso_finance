-- =============================================================
-- VALIDAÇÕES PÓS-IMPORTAÇÃO PULSO FINANCE
-- Pode ser executado no Supabase SQL Editor em segurança.
-- =============================================================

-- 1) Contagens básicas
SELECT 'fornecedores_total' AS metrica, COUNT(*) AS valor FROM fornecedores;
SELECT 'lancamentos_total' AS metrica, COUNT(*) AS valor FROM lancamentos;
SELECT 'parcelas_total' AS metrica, COUNT(*) AS valor FROM parcelas;

-- 2) Distribuição por tipo_pessoa e categoria
SELECT tipo_pessoa, COUNT(*) AS qtde FROM fornecedores GROUP BY 1 ORDER BY 2 DESC;
SELECT categoria, COUNT(*) AS qtde FROM fornecedores GROUP BY 1 ORDER BY 2 DESC;

-- 3) Checagens de integridade (FKs e campos críticos)
SELECT 'lanc_sem_plano' AS alerta, COUNT(*) FROM lancamentos WHERE plano_id IS NULL;
SELECT 'parc_sem_lanc'  AS alerta, COUNT(*) FROM parcelas WHERE lancamento_id IS NULL;

-- 4) Amostras recentes
SELECT id, tipo, descricao, competencia, valor_total
FROM lancamentos
ORDER BY created_at DESC NULLS LAST
LIMIT 20;

SELECT parcela, vencimento, valor, status
FROM parcelas
ORDER BY created_at DESC NULLS LAST
LIMIT 20;

-- 5) DRE (visão por grupo do plano de contas)
-- Custos e despesas variáveis (grupo 4)
SELECT SUBSTRING(pc.codigo, 1, 3) AS grupo,
       SUM(p.valor) AS total
FROM plano_contas pc
JOIN lancamentos l ON l.plano_id = pc.id
JOIN parcelas p   ON p.lancamento_id = l.id
WHERE pc.codigo LIKE '4.%'
GROUP BY 1
ORDER BY 1;

-- Despesas fixas (grupo 5) com destaque para pessoal (5.3)
SELECT CASE
         WHEN pc.codigo LIKE '5.3%' THEN '5.3 (pessoal)'
         ELSE SUBSTRING(pc.codigo, 1, 3)
       END AS grupo,
       SUM(p.valor) AS total
FROM plano_contas pc
JOIN lancamentos l ON l.plano_id = pc.id
JOIN parcelas p   ON p.lancamento_id = l.id
WHERE pc.codigo LIKE '5.%'
GROUP BY 1
ORDER BY 1;

-- 6) Bancos, fisco e aluguel (amostras por categoria do beneficiário)
SELECT f.categoria, SUM(p.valor) AS total
FROM fornecedores f
JOIN lancamentos l ON l.fornecedor_id = f.id
JOIN parcelas p    ON p.lancamento_id = l.id
WHERE f.categoria IN ('instituicao_financeira','fisco','aluguel')
GROUP BY 1
ORDER BY 2 DESC NULLS LAST;

-- 7) Verificação cruzada: colaboradores são pessoa física
SELECT SUM(CASE WHEN tipo_pessoa = 'fisica' THEN 1 ELSE 0 END) AS fisica,
       SUM(CASE WHEN tipo_pessoa = 'juridica' THEN 1 ELSE 0 END) AS juridica
FROM fornecedores
WHERE categoria = 'colaborador';

-- 8) Top 20 fornecedores por valor (indicativo de concentração)
SELECT f.nome, f.categoria, SUM(p.valor) AS total
FROM fornecedores f
JOIN lancamentos l ON l.fornecedor_id = f.id
JOIN parcelas p    ON p.lancamento_id = l.id
GROUP BY 1,2
ORDER BY 3 DESC NULLS LAST
LIMIT 20;

-- Fim
