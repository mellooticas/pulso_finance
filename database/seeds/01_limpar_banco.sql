-- =====================================================
-- LIMPEZA DO BANCO PULSO FINANCE
-- Remove todos os dados mantendo estrutura e constraints
-- Gerado em: 2025-10-21 17:19:23
-- =====================================================

-- Desabilitar triggers temporariamente para performance
SET session_replication_role = replica;

-- Limpar em ordem reversa de dependências
TRUNCATE TABLE auditoria CASCADE;
TRUNCATE TABLE conciliacoes CASCADE;
TRUNCATE TABLE extratos_bancarios CASCADE;
TRUNCATE TABLE parcelas CASCADE;
TRUNCATE TABLE lancamentos CASCADE;
TRUNCATE TABLE fornecedores CASCADE;
TRUNCATE TABLE formas_pagamento CASCADE;
TRUNCATE TABLE contas_financeiras CASCADE;
TRUNCATE TABLE centros_custo CASCADE;
TRUNCATE TABLE plano_contas CASCADE;
TRUNCATE TABLE usuarios CASCADE;
TRUNCATE TABLE lojas CASCADE;

-- Reabilitar triggers
SET session_replication_role = DEFAULT;

-- Refresh views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

SELECT 'Limpeza concluída com sucesso!' as resultado;
