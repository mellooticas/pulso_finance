-- =====================================================
-- ETAPA 1: PREPARAÇÃO E TABELAS TEMPORÁRIAS
-- Execute PRIMEIRO no SQL Editor do Supabase
-- =====================================================

-- Validar estrutura atual
SELECT 'Verificando tabelas existentes...' as status;

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('lojas', 'usuarios', 'plano_contas', 'lancamentos', 'parcelas')
ORDER BY table_name;

-- Contar registros atuais
SELECT 
  'lojas' as tabela, COUNT(*) as registros FROM lojas
UNION ALL
SELECT 
  'usuarios' as tabela, COUNT(*) as registros FROM usuarios  
UNION ALL
SELECT 
  'plano_contas' as tabela, COUNT(*) as registros FROM plano_contas
UNION ALL
SELECT 
  'lancamentos' as tabela, COUNT(*) as registros FROM lancamentos
UNION ALL
SELECT 
  'parcelas' as tabela, COUNT(*) as registros FROM parcelas;

-- =====================================================
-- CRIAR TABELAS TEMPORÁRIAS PARA IMPORTAÇÃO YAMPA
-- =====================================================

-- Tabela temporária para dados atuais (yampa_relatorio.csv)
DROP TABLE IF EXISTS temp_yampa_atual;
CREATE TEMP TABLE temp_yampa_atual (
    data_esperada TEXT,
    data_realizada TEXT,
    plano_contas TEXT,
    historico TEXT,
    sequencia TEXT,
    conta_bancaria TEXT,
    valor_receber TEXT,
    valor_recebido TEXT,
    valor_pagar TEXT,
    valor_pago TEXT,
    status TEXT,
    cliente_fornecedor TEXT,
    meio_pagamento TEXT,
    centro_custo TEXT,
    projeto TEXT,
    data_ultima_alteracao TEXT,
    codigo_conciliacao TEXT
);

-- Tabela temporária para dados antigos (yampa_relatorio_antigo.csv)
DROP TABLE IF EXISTS temp_yampa_antigo;
CREATE TEMP TABLE temp_yampa_antigo (
    data_agendada TEXT,
    data_realizada TEXT,
    plano_conta TEXT,
    historico TEXT,
    sequencia TEXT,
    conta_bancaria TEXT,
    valor_receber TEXT,
    valor_recebido TEXT,
    valor_pago TEXT,
    valor_pagar TEXT,
    status TEXT,
    cliente_fornecedor TEXT,
    meio_pagamento TEXT,
    centro_custo TEXT,
    projeto TEXT,
    data_ultima_alteracao TEXT,
    codigo_conciliacao TEXT
);

-- Tabela de mapeamento Yampa -> Pulso
DROP TABLE IF EXISTS temp_mapeamento;
CREATE TEMP TABLE temp_mapeamento (
    plano_yampa TEXT,
    plano_pulso_id UUID,
    tipo_lancamento tipo_lancamento,
    categoria TEXT
);

-- Tabela de dados normalizados
DROP TABLE IF EXISTS temp_dados_normalizados;
CREATE TEMP TABLE temp_dados_normalizados (
    id UUID DEFAULT gen_random_uuid(),
    data_competencia DATE,
    data_vencimento DATE,
    plano_id UUID,
    tipo tipo_lancamento,
    valor NUMERIC(14,2),
    historico TEXT,
    fornecedor TEXT,
    centro_custo TEXT,
    status_original TEXT,
    origem origem_lanc DEFAULT 'migracao_yampa'
);

SELECT 'ETAPA 1 CONCLUÍDA: Tabelas temporárias criadas!' as resultado;
SELECT 'PRÓXIMO PASSO: Execute ETAPA_2_IMPORTACAO_DADOS.sql' as proximo;