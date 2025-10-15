-- =====================================================
-- ETAPA 2: IMPORTAÇÃO DOS DADOS YAMPA
-- Execute SEGUNDO no SQL Editor do Supabase
-- Após executar ETAPA_1_PREPARACAO.sql
-- =====================================================

SELECT 'INICIANDO ETAPA 2: Importação de dados...' as status;

-- =====================================================
-- IMPORTANTE: IMPORTAR DADOS MANUALMENTE
-- =====================================================

-- ANTES DE CONTINUAR:
-- 1. Baixe os arquivos CSV:
--    - yampa_relatorio.csv (dados 2022-2025)
--    - yampa_relatorio_antigo.csv (dados 2020-2022)
-- 
-- 2. No Supabase Dashboard:
--    - Vá em Table Editor
--    - Selecione temp_yampa_atual
--    - Clique em "Insert" > "Import data from CSV"
--    - Faça upload do yampa_relatorio.csv
--    
-- 3. Repita para temp_yampa_antigo:
--    - Selecione temp_yampa_antigo  
--    - Import yampa_relatorio_antigo.csv

-- =====================================================
-- APÓS IMPORTAR OS CSVs, CONTINUE AQUI:
-- =====================================================

-- Verificar importação
SELECT 'Verificando dados importados...' as etapa;

SELECT 
    'temp_yampa_atual' as tabela, 
    COUNT(*) as registros,
    MIN(data_esperada) as data_inicio,
    MAX(data_esperada) as data_fim
FROM temp_yampa_atual
WHERE data_esperada IS NOT NULL AND data_esperada != '';

SELECT 
    'temp_yampa_antigo' as tabela, 
    COUNT(*) as registros,
    MIN(data_agendada) as data_inicio,
    MAX(data_agendada) as data_fim  
FROM temp_yampa_antigo
WHERE data_agendada IS NOT NULL AND data_agendada != '';

-- =====================================================
-- POPULAR MAPEAMENTO YAMPA -> PULSO
-- =====================================================

INSERT INTO temp_mapeamento (plano_yampa, plano_pulso_id, tipo_lancamento, categoria)
SELECT DISTINCT
    pc_yampa.nome_yampa,
    pc.id,
    CASE 
        WHEN pc.categoria = 'receita' THEN 'receber'::tipo_lancamento
        ELSE 'pagar'::tipo_lancamento
    END,
    pc.categoria::TEXT
FROM (
    -- Mapeamento manual baseado na análise dos dados
    VALUES 
    ('RECEITA VENDAS', 'receita'),
    ('RECEITA DE SERVICOS', 'receita'),
    ('VENDAS PRODUTO', 'receita'),
    ('VENDAS SERVICO', 'receita'),
    ('RECEITAS DIVERSAS', 'receita'),
    ('ALUGUEL', 'despesa'),
    ('ENERGIA ELÉTRICA', 'despesa'),
    ('TELEFONE', 'despesa'),
    ('ÁGUA', 'despesa'),
    ('SALÁRIOS', 'despesa'),
    ('ENCARGOS SOCIAIS', 'despesa'),
    ('COMBUSTÍVEL', 'despesa'),
    ('MANUTENÇÃO', 'despesa'),
    ('MATERIAL ESCRITÓRIO', 'despesa'),
    ('CONTABILIDADE', 'despesa'),
    ('BANCO TAXAS', 'despesa'),
    ('IMPOSTOS', 'despesa'),
    ('FORNECEDORES', 'despesa'),
    ('COMPRA MERCADORIAS', 'custo'),
    ('CUSTO MERCADORIA', 'custo'),
    ('FRETE', 'despesa'),
    ('MARKETING', 'despesa'),
    ('PROPAGANDA', 'despesa'),
    ('INTERNET', 'despesa')
) pc_yampa(nome_yampa, categoria_mapped)
INNER JOIN plano_contas pc ON pc.categoria::TEXT = pc_yampa.categoria_mapped
WHERE pc.aceita_lancamento = true;

-- Verificar mapeamento criado
SELECT 
    'Mapeamento criado' as status,
    COUNT(*) as total_mapeamentos
FROM temp_mapeamento;

SELECT plano_yampa, categoria, tipo_lancamento 
FROM temp_mapeamento 
ORDER BY categoria, plano_yampa;

SELECT 'ETAPA 2 CONCLUÍDA: Dados importados e mapeados!' as resultado;
SELECT 'PRÓXIMO PASSO: Execute ETAPA_3_NORMALIZACAO.sql' as proximo;