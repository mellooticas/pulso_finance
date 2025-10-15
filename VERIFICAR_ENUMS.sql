-- =====================================================
-- VERIFICAR ENUMS DO SISTEMA
-- Execute para confirmar todos os tipos disponíveis
-- =====================================================

SELECT 'VERIFICANDO ENUMS DISPONÍVEIS...' as status;

-- =====================================================
-- 1. VERIFICAR TIPO_LANCAMENTO
-- =====================================================

SELECT 
    'tipo_lancamento' as enum_name,
    unnest(enum_range(NULL::tipo_lancamento)) as valores_disponiveis;

-- =====================================================
-- 2. VERIFICAR STATUS_PARCELA
-- =====================================================

SELECT 
    'status_parcela' as enum_name,
    unnest(enum_range(NULL::status_parcela)) as valores_disponiveis;

-- =====================================================
-- 3. VERIFICAR CATEGORIA_CONTA
-- =====================================================

SELECT 
    'categoria_conta' as enum_name,
    unnest(enum_range(NULL::categoria_conta)) as valores_disponiveis;

-- =====================================================
-- 4. VERIFICAR PAPEL_USUARIO
-- =====================================================

SELECT 
    'papel_usuario' as enum_name,
    unnest(enum_range(NULL::papel_usuario)) as valores_disponiveis;

-- =====================================================
-- 5. VERIFICAR ORIGEM_LANC
-- =====================================================

SELECT 
    'origem_lanc' as enum_name,
    unnest(enum_range(NULL::origem_lanc)) as valores_disponiveis;

-- =====================================================
-- 6. VERIFICAR STATUS_APROVACAO
-- =====================================================

SELECT 
    'status_aprovacao' as enum_name,
    unnest(enum_range(NULL::status_aprovacao)) as valores_disponiveis;

-- =====================================================
-- 7. TESTE DE INSERÇÃO COM VALORES CORRETOS
-- =====================================================

SELECT 'TESTANDO VALORES DOS ENUMS...' as teste;

-- Teste com tipo_lancamento
SELECT 'receber'::tipo_lancamento as teste_tipo_receber;
SELECT 'pagar'::tipo_lancamento as teste_tipo_pagar;

-- Teste com status_parcela
SELECT 'previsto'::status_parcela as teste_status_previsto;
SELECT 'vencido'::status_parcela as teste_status_vencido;
SELECT 'pago'::status_parcela as teste_status_pago;
SELECT 'parcial'::status_parcela as teste_status_parcial;
SELECT 'cancelado'::status_parcela as teste_status_cancelado;

-- Teste com categoria_conta
SELECT 'receita'::categoria_conta as teste_categoria_receita;
SELECT 'custo'::categoria_conta as teste_categoria_custo;
SELECT 'despesa'::categoria_conta as teste_categoria_despesa;
SELECT 'investimento'::categoria_conta as teste_categoria_investimento;
SELECT 'outros'::categoria_conta as teste_categoria_outros;

-- =====================================================
-- 8. VERIFICAR PLANOS DE CONTAS DISPONÍVEIS
-- =====================================================

SELECT 'VERIFICANDO PLANOS DE CONTAS...' as verificacao;

SELECT 
    categoria,
    COUNT(*) as quantidade,
    COUNT(CASE WHEN aceita_lancamento = true THEN 1 END) as aceita_lancamentos
FROM plano_contas 
GROUP BY categoria
ORDER BY categoria;

-- Mostrar alguns exemplos de cada categoria
SELECT 
    categoria,
    nome,
    codigo,
    aceita_lancamento
FROM plano_contas 
WHERE aceita_lancamento = true
ORDER BY categoria, nome
LIMIT 20;

-- =====================================================
-- 9. RESULTADO FINAL
-- =====================================================

SELECT 'VERIFICAÇÃO DE ENUMS CONCLUÍDA!' as resultado;
SELECT 'Todos os valores estão disponíveis e corretos.' as status;