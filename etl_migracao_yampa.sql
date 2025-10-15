-- =====================================================
-- SCRIPT ETL - MIGRAÇÃO DADOS YAMPA PARA PULSO FINANCE
-- Migra 47.064 transações para estrutura normalizada
-- =====================================================

-- Este script deve ser executado APÓS:
-- 1. Schema inicial (20241014_initial_schema.sql)
-- 2. Seeds iniciais (01_initial_data.sql)

BEGIN;

-- =====================================================
-- 1. CRIAR TABELAS TEMPORÁRIAS PARA IMPORTAÇÃO
-- =====================================================

-- Tabela temporária para dados atuais (2022-2025)
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

-- Tabela temporária para dados antigos (2020-2022)
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

-- =====================================================
-- 2. FUNÇÕES AUXILIARES PARA MIGRAÇÃO
-- =====================================================

-- Função para converter valores brasileiros
CREATE OR REPLACE FUNCTION converter_valor_br(valor_texto TEXT)
RETURNS NUMERIC(14,2) AS $$
BEGIN
    IF valor_texto IS NULL OR valor_texto = '' OR valor_texto = ' ' THEN
        RETURN 0.00;
    END IF;
    
    valor_texto := TRIM(valor_texto);
    
    IF valor_texto IN ('0,00', '0', '', ' ') THEN
        RETURN 0.00;
    END IF;
    
    -- Remove pontos (separadores de milhares) e substitui vírgula por ponto
    IF POSITION(',' IN valor_texto) > 0 THEN
        IF (LENGTH(valor_texto) - POSITION(',' IN valor_texto)) = 2 THEN
            -- Formato brasileiro: 1.234,56
            valor_texto := REPLACE(SUBSTRING(valor_texto, 1, POSITION(',' IN valor_texto) - 1), '.', '') || 
                          '.' || 
                          SUBSTRING(valor_texto, POSITION(',' IN valor_texto) + 1);
        ELSE
            -- Apenas vírgula sem ser decimal
            valor_texto := REPLACE(valor_texto, ',', '.');
        END IF;
    ELSE
        -- Remove pontos se não houver vírgula
        valor_texto := REPLACE(valor_texto, '.', '');
    END IF;
    
    RETURN valor_texto::NUMERIC(14,2);
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0.00;
END;
$$ LANGUAGE plpgsql;

-- Função para mapear centro de custo para loja
CREATE OR REPLACE FUNCTION mapear_loja_id(centro_custo TEXT)
RETURNS UUID AS $$
DECLARE
    loja_id UUID;
BEGIN
    SELECT id INTO loja_id FROM lojas 
    WHERE nome ILIKE '%' || TRIM(centro_custo) || '%'
    ORDER BY LENGTH(nome) 
    LIMIT 1;
    
    -- Se não encontrar, usar Escritório como padrão
    IF loja_id IS NULL THEN
        SELECT id INTO loja_id FROM lojas WHERE codigo = 'ESC';
    END IF;
    
    RETURN loja_id;
END;
$$ LANGUAGE plpgsql;

-- Função para mapear plano de contas
CREATE OR REPLACE FUNCTION mapear_plano_id(plano_texto TEXT)
RETURNS UUID AS $$
DECLARE
    plano_id UUID;
    codigo_limpo TEXT;
BEGIN
    IF plano_texto IS NULL OR TRIM(plano_texto) = '' THEN
        -- Retornar conta padrão "Outros"
        SELECT id INTO plano_id FROM plano_contas WHERE codigo = '13.99';
        RETURN plano_id;
    END IF;
    
    codigo_limpo := TRIM(plano_texto);
    
    -- Tentar busca exata pelo nome
    SELECT id INTO plano_id FROM plano_contas 
    WHERE nome ILIKE codigo_limpo;
    
    IF plano_id IS NOT NULL THEN
        RETURN plano_id;
    END IF;
    
    -- Tentar busca pelo código (extrair números)
    SELECT id INTO plano_id FROM plano_contas 
    WHERE codigo = SUBSTRING(codigo_limpo FROM '^[0-9.]+');
    
    IF plano_id IS NOT NULL THEN
        RETURN plano_id;
    END IF;
    
    -- Mapeamento específico para dados antigos
    SELECT id INTO plano_id FROM plano_contas 
    WHERE CASE 
        WHEN codigo_limpo ILIKE '%receita%' OR codigo_limpo ILIKE '%faturamento%' THEN codigo = '3'
        WHEN codigo_limpo ILIKE '%custos%' OR codigo_limpo ILIKE '%variaveis%' THEN codigo = '4' 
        WHEN codigo_limpo ILIKE '%despesas%' OR codigo_limpo ILIKE '%fixas%' THEN codigo = '5'
        WHEN codigo_limpo ILIKE '%investimento%' THEN codigo = '6'
        WHEN codigo_limpo ILIKE '%movimentacao%' OR codigo_limpo ILIKE '%operacional%' THEN codigo = '7'
        ELSE codigo = '13.99'
    END;
    
    -- Se ainda não encontrou, usar conta padrão
    IF plano_id IS NULL THEN
        SELECT id INTO plano_id FROM plano_contas WHERE codigo = '13.99';
    END IF;
    
    RETURN plano_id;
END;
$$ LANGUAGE plpgsql;

-- Função para mapear forma de pagamento
CREATE OR REPLACE FUNCTION mapear_forma_pagamento_id(meio_pgto TEXT)
RETURNS UUID AS $$
DECLARE
    forma_id UUID;
BEGIN
    IF meio_pgto IS NULL OR TRIM(meio_pgto) = '' THEN
        RETURN NULL;
    END IF;
    
    SELECT id INTO forma_id FROM formas_pagamento 
    WHERE nome ILIKE '%' || TRIM(meio_pgto) || '%'
    ORDER BY LENGTH(nome)
    LIMIT 1;
    
    RETURN forma_id;
END;
$$ LANGUAGE plpgsql;

-- Função para mapear fornecedor
CREATE OR REPLACE FUNCTION mapear_fornecedor_id(cliente_fornecedor TEXT)
RETURNS UUID AS $$
DECLARE
    fornecedor_id UUID;
BEGIN
    IF cliente_fornecedor IS NULL OR TRIM(cliente_fornecedor) = '' THEN
        RETURN NULL;
    END IF;
    
    SELECT id INTO fornecedor_id FROM fornecedores 
    WHERE nome ILIKE '%' || TRIM(cliente_fornecedor) || '%'
    ORDER BY LENGTH(nome)
    LIMIT 1;
    
    RETURN fornecedor_id;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- 3. IMPORTAR DADOS (substitua por COPY FROM CSV real)
-- =====================================================

-- NOTA: Em produção, estes COPY devem apontar para os arquivos CSV reais:
-- COPY temp_yampa_atual FROM '/path/to/yampa_relatorio.csv' DELIMITER ';' CSV HEADER ENCODING 'UTF8';
-- COPY temp_yampa_antigo FROM '/path/to/yampa_relatorio_antigo.csv' DELIMITER ';' CSV HEADER ENCODING 'LATIN1';

-- Para este exemplo, vamos simular alguns registros
INSERT INTO temp_yampa_atual VALUES 
('22/08/2022', '22/08/2022', '4.1.1 Simples nacional', 'DAS - Simples Nacional 07/2022 > R$ 742,44', '1', '', '', '', '742,44', '742,44', 'Realizado', '', 'Pagto Boleto', 'Escritório', '', '22/08/2022', ''),
('20/10/2022', '20/10/2022', '3.1.8 Vendas pix', 'Venda PIX - Cliente 2122', '2', '', '250,00', '250,00', '', '', 'Realizado', 'Cliente Teste', 'PIX', 'Loja Suzano', '', '20/10/2022', '');

INSERT INTO temp_yampa_antigo VALUES
('01/10/2020', '01/10/2020', '3 - Receita/Faturamento', 'VENDAS DINHEIRO - 2122', '1', '', '250', '250', '0', '0', 'Realizado', '', 'Dinheiro', '', '', '01/10/2020', ''),
('01/10/2020', '01/10/2020', '4 - Custos Variaveis', 'CUSTO PRODUTO - 2122', '2', '', '0', '0', '150', '150', 'Realizado', 'Fornecedor A', 'Pagto Boleto', '', '', '01/10/2020', '');

-- =====================================================
-- 4. MIGRAÇÃO - DADOS ATUAIS (2022-2025)
-- =====================================================

-- Inserir lançamentos dos dados atuais
INSERT INTO lancamentos (
    loja_id,
    tipo,
    plano_id,
    fornecedor_id,
    descricao,
    historico,
    competencia,
    valor_total,
    num_parcelas,
    origem,
    status_aprovacao,
    user_id,
    metadata
)
SELECT 
    mapear_loja_id(centro_custo) as loja_id,
    CASE 
        WHEN converter_valor_br(valor_receber) > 0 THEN 'receber'::tipo_lancamento
        ELSE 'pagar'::tipo_lancamento 
    END as tipo,
    mapear_plano_id(plano_contas) as plano_id,
    mapear_fornecedor_id(cliente_fornecedor) as fornecedor_id,
    COALESCE(NULLIF(TRIM(historico), ''), 'Migração Yampa') as descricao,
    historico,
    TO_DATE(data_esperada, 'DD/MM/YYYY') as competencia,
    GREATEST(
        converter_valor_br(valor_receber), 
        converter_valor_br(valor_pagar)
    ) as valor_total,
    1 as num_parcelas,
    'migracao_yampa'::origem_lanc,
    'aprovado'::status_aprovacao,
    NULL as user_id,
    jsonb_build_object(
        'sequencia_yampa', sequencia,
        'conta_bancaria_yampa', conta_bancaria,
        'projeto_yampa', projeto,
        'data_alteracao_yampa', data_ultima_alteracao,
        'codigo_conciliacao_yampa', codigo_conciliacao
    )
FROM temp_yampa_atual
WHERE data_esperada IS NOT NULL 
  AND data_esperada != ''
  AND (converter_valor_br(valor_receber) > 0 OR converter_valor_br(valor_pagar) > 0);

-- Inserir parcelas dos dados atuais
INSERT INTO parcelas (
    lancamento_id,
    parcela,
    vencimento,
    valor,
    valor_pago,
    status,
    data_pagamento,
    forma_pagamento_id,
    observacao
)
SELECT 
    l.id as lancamento_id,
    1 as parcela,
    TO_DATE(t.data_esperada, 'DD/MM/YYYY') as vencimento,
    l.valor_total,
    CASE 
        WHEN l.tipo = 'receber' THEN converter_valor_br(t.valor_recebido)
        ELSE converter_valor_br(t.valor_pago)
    END as valor_pago,
    CASE 
        WHEN t.status = 'Realizado' THEN 'pago'::status_parcela
        WHEN t.status = 'Atrasado' THEN 'vencido'::status_parcela
        ELSE 'previsto'::status_parcela
    END as status,
    CASE 
        WHEN t.status = 'Realizado' THEN TO_DATE(t.data_realizada, 'DD/MM/YYYY')
        ELSE NULL
    END as data_pagamento,
    mapear_forma_pagamento_id(t.meio_pagamento) as forma_pagamento_id,
    t.status as observacao
FROM lancamentos l
JOIN temp_yampa_atual t ON l.metadata->>'sequencia_yampa' = t.sequencia
WHERE l.origem = 'migracao_yampa';

-- =====================================================
-- 5. MIGRAÇÃO - DADOS ANTIGOS (2020-2022)
-- =====================================================

-- Inserir lançamentos dos dados antigos
INSERT INTO lancamentos (
    loja_id,
    tipo,
    plano_id,
    fornecedor_id,
    descricao,
    historico,
    competencia,
    valor_total,
    num_parcelas,
    origem,
    status_aprovacao,
    user_id,
    metadata
)
SELECT 
    (SELECT id FROM lojas WHERE codigo = 'ESC') as loja_id, -- Todos no escritório por padrão
    CASE 
        WHEN converter_valor_br(valor_receber) > 0 THEN 'receber'::tipo_lancamento
        ELSE 'pagar'::tipo_lancamento 
    END as tipo,
    mapear_plano_id(plano_conta) as plano_id,
    mapear_fornecedor_id(cliente_fornecedor) as fornecedor_id,
    COALESCE(NULLIF(TRIM(historico), ''), 'Migração Yampa Antigo') as descricao,
    historico,
    TO_DATE(data_agendada, 'DD/MM/YYYY') as competencia,
    GREATEST(
        converter_valor_br(valor_receber), 
        converter_valor_br(valor_pagar)
    ) as valor_total,
    1 as num_parcelas,
    'migracao_yampa'::origem_lanc,
    'aprovado'::status_aprovacao,
    NULL as user_id,
    jsonb_build_object(
        'sequencia_yampa', sequencia,
        'conta_bancaria_yampa', conta_bancaria,
        'projeto_yampa', projeto,
        'data_alteracao_yampa', data_ultima_alteracao,
        'codigo_conciliacao_yampa', codigo_conciliacao,
        'periodo', 'antigo_2020_2022'
    )
FROM temp_yampa_antigo
WHERE data_agendada IS NOT NULL 
  AND data_agendada != ''
  AND (converter_valor_br(valor_receber) > 0 OR converter_valor_br(valor_pagar) > 0);

-- Inserir parcelas dos dados antigos
INSERT INTO parcelas (
    lancamento_id,
    parcela,
    vencimento,
    valor,
    valor_pago,
    status,
    data_pagamento,
    forma_pagamento_id,
    observacao
)
SELECT 
    l.id as lancamento_id,
    1 as parcela,
    TO_DATE(t.data_agendada, 'DD/MM/YYYY') as vencimento,
    l.valor_total,
    CASE 
        WHEN l.tipo = 'receber' THEN converter_valor_br(t.valor_recebido)
        ELSE converter_valor_br(t.valor_pago)
    END as valor_pago,
    CASE 
        WHEN t.status = 'Realizado' THEN 'pago'::status_parcela
        ELSE 'previsto'::status_parcela
    END as status,
    CASE 
        WHEN t.status = 'Realizado' THEN TO_DATE(t.data_realizada, 'DD/MM/YYYY')
        ELSE NULL
    END as data_pagamento,
    mapear_forma_pagamento_id(t.meio_pagamento) as forma_pagamento_id,
    CONCAT('Migrado período antigo - ', t.status) as observacao
FROM lancamentos l
JOIN temp_yampa_antigo t ON l.metadata->>'sequencia_yampa' = t.sequencia
WHERE l.origem = 'migracao_yampa' AND l.metadata->>'periodo' = 'antigo_2020_2022';

-- =====================================================
-- 6. ATUALIZAR ESTATÍSTICAS E VIEWS
-- =====================================================

-- Refresh das views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

-- Estatísticas da migração
DO $$
DECLARE
    total_lancamentos INTEGER;
    total_parcelas INTEGER;
    periodo_inicio DATE;
    periodo_fim DATE;
    valor_total_migrado NUMERIC(14,2);
BEGIN
    SELECT COUNT(*) INTO total_lancamentos FROM lancamentos WHERE origem = 'migracao_yampa';
    SELECT COUNT(*) INTO total_parcelas FROM parcelas p 
    JOIN lancamentos l ON p.lancamento_id = l.id 
    WHERE l.origem = 'migracao_yampa';
    
    SELECT MIN(competencia), MAX(competencia) INTO periodo_inicio, periodo_fim 
    FROM lancamentos WHERE origem = 'migracao_yampa';
    
    SELECT SUM(valor_total) INTO valor_total_migrado 
    FROM lancamentos WHERE origem = 'migracao_yampa';
    
    RAISE NOTICE '=== MIGRAÇÃO YAMPA CONCLUÍDA ===';
    RAISE NOTICE 'Lançamentos migrados: %', total_lancamentos;
    RAISE NOTICE 'Parcelas criadas: %', total_parcelas;
    RAISE NOTICE 'Período: % a %', periodo_inicio, periodo_fim;
    RAISE NOTICE 'Valor total migrado: R$ %', valor_total_migrado;
END $$;

-- Limpar funções temporárias
DROP FUNCTION converter_valor_br(TEXT);
DROP FUNCTION mapear_loja_id(TEXT);
DROP FUNCTION mapear_plano_id(TEXT);
DROP FUNCTION mapear_forma_pagamento_id(TEXT);
DROP FUNCTION mapear_fornecedor_id(TEXT);

-- Limpar tabelas temporárias
DROP TABLE temp_yampa_atual;
DROP TABLE temp_yampa_antigo;

COMMIT;