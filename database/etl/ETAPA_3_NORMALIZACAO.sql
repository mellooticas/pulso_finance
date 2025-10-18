-- =====================================================
-- ETAPA 3: NORMALIZAÇÃO E TRANSFORMAÇÃO DOS DADOS
-- Execute TERCEIRO no SQL Editor do Supabase
-- Após executar ETAPA_2_IMPORTACAO_DADOS.sql
-- =====================================================

SELECT 'INICIANDO ETAPA 3: Normalização dos dados...' as status;

-- =====================================================
-- FUNÇÃO AUXILIAR PARA CONVERSÃO DE DATAS
-- =====================================================

CREATE OR REPLACE FUNCTION convert_yampa_date(date_text TEXT)
RETURNS DATE AS $$
BEGIN
    -- Tentar formato DD/MM/YYYY
    IF date_text ~ '^\d{1,2}/\d{1,2}/\d{4}$' THEN
        RETURN TO_DATE(date_text, 'DD/MM/YYYY');
    END IF;
    
    -- Tentar formato YYYY-MM-DD
    IF date_text ~ '^\d{4}-\d{1,2}-\d{1,2}$' THEN
        RETURN TO_DATE(date_text, 'YYYY-MM-DD');
    END IF;
    
    -- Se não conseguir converter, retorna null
    RETURN NULL;
    
EXCEPTION WHEN OTHERS THEN
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- NORMALIZAR DADOS ATUAIS (2022-2025)
-- =====================================================

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
    convert_yampa_date(ya.data_esperada) as data_competencia,
    convert_yampa_date(COALESCE(ya.data_realizada, ya.data_esperada)) as data_vencimento,
    
    -- Buscar plano de contas correspondente
    COALESCE(
        tm.plano_pulso_id,
        (SELECT id FROM plano_contas WHERE categoria = 'outros' AND aceita_lancamento LIMIT 1)
    ) as plano_id,
    
    -- Determinar tipo baseado nos valores
    CASE 
        WHEN COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC > 0 THEN 'receber'::tipo_lancamento
        WHEN COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC > 0 THEN 'pagar'::tipo_lancamento
        ELSE 'pagar'::tipo_lancamento
    END as tipo,
    
    -- Valor (sempre positivo)
    GREATEST(
        COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_recebido, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_pago, ''), '0')::NUMERIC
    ) as valor,
    
    -- Campos de texto
    TRIM(ya.historico) as historico,
    TRIM(ya.cliente_fornecedor) as fornecedor,
    TRIM(ya.centro_custo) as centro_custo,
    TRIM(ya.status) as status_original

FROM temp_yampa_atual ya
LEFT JOIN temp_mapeamento tm ON UPPER(TRIM(ya.plano_contas)) = UPPER(TRIM(tm.plano_yampa))
WHERE 
    ya.data_esperada IS NOT NULL 
    AND ya.data_esperada != ''
    AND (
        COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_recebido, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_pago, ''), '0')::NUMERIC > 0
    );

-- =====================================================
-- NORMALIZAR DADOS ANTIGOS (2020-2022)
-- =====================================================

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
    convert_yampa_date(ya.data_agendada) as data_competencia,
    convert_yampa_date(COALESCE(ya.data_realizada, ya.data_agendada)) as data_vencimento,
    
    -- Buscar plano de contas correspondente
    COALESCE(
        tm.plano_pulso_id,
        (SELECT id FROM plano_contas WHERE categoria = 'outros' AND aceita_lancamento LIMIT 1)
    ) as plano_id,
    
    -- Determinar tipo baseado nos valores
    CASE 
        WHEN COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC > 0 THEN 'receber'::tipo_lancamento
        WHEN COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC > 0 THEN 'pagar'::tipo_lancamento
        ELSE 'pagar'::tipo_lancamento
    END as tipo,
    
    -- Valor (sempre positivo)
    GREATEST(
        COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_recebido, ''), '0')::NUMERIC,
        COALESCE(NULLIF(ya.valor_pago, ''), '0')::NUMERIC
    ) as valor,
    
    -- Campos de texto
    TRIM(ya.historico) as historico,
    TRIM(ya.cliente_fornecedor) as fornecedor,
    TRIM(ya.centro_custo) as centro_custo,
    TRIM(ya.status) as status_original

FROM temp_yampa_antigo ya
LEFT JOIN temp_mapeamento tm ON UPPER(TRIM(ya.plano_conta)) = UPPER(TRIM(tm.plano_yampa))
WHERE 
    ya.data_agendada IS NOT NULL 
    AND ya.data_agendada != ''
    AND (
        COALESCE(NULLIF(ya.valor_receber, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_pagar, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_recebido, ''), '0')::NUMERIC > 0 OR
        COALESCE(NULLIF(ya.valor_pago, ''), '0')::NUMERIC > 0
    );

-- =====================================================
-- VERIFICAR NORMALIZAÇÃO
-- =====================================================

SELECT 'Dados normalizados:' as etapa;

SELECT 
    COUNT(*) as total_registros,
    COUNT(CASE WHEN tipo = 'receber' THEN 1 END) as receitas,
    COUNT(CASE WHEN tipo = 'pagar' THEN 1 END) as despesas,
    MIN(data_competencia) as data_inicial,
    MAX(data_competencia) as data_final,
    SUM(CASE WHEN tipo = 'receber' THEN valor ELSE 0 END) as total_receitas,
    SUM(CASE WHEN tipo = 'pagar' THEN valor ELSE 0 END) as total_despesas
FROM temp_dados_normalizados
WHERE valor > 0;

-- Verificar distribuição por ano
SELECT 
    EXTRACT(YEAR FROM data_competencia) as ano,
    COUNT(*) as registros,
    SUM(CASE WHEN tipo = 'receber' THEN valor ELSE 0 END) as receitas,
    SUM(CASE WHEN tipo = 'pagar' THEN valor ELSE 0 END) as despesas
FROM temp_dados_normalizados 
WHERE data_competencia IS NOT NULL
GROUP BY EXTRACT(YEAR FROM data_competencia)
ORDER BY ano;

-- Limpar função auxiliar
DROP FUNCTION convert_yampa_date(TEXT);

SELECT 'ETAPA 3 CONCLUÍDA: Dados normalizados!' as resultado;
SELECT 'PRÓXIMO PASSO: Execute ETAPA_4_INSERIR_BANCO.sql' as proximo;

ERROR:  42P01: relation "temp_dados_normalizados" does not exist
LINE 38: INSERT INTO temp_dados_normalizados (
                     ^