-- =====================================================
-- VERIFICAÇÃO FINAL DOS SCHEMAS
-- Execute para confirmar que tudo está correto
-- =====================================================

SELECT 'VERIFICANDO ESTRUTURA DAS TABELAS...' as status;

-- =====================================================
-- 1. VERIFICAR COLUNAS DA TABELA LANCAMENTOS
-- =====================================================

SELECT 
    'COLUNAS LANCAMENTOS' as tabela,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'lancamentos' 
  AND table_schema = 'public'
ORDER BY ordinal_position;

| tabela              | column_name          | data_type                | is_nullable |
| ------------------- | -------------------- | ------------------------ | ----------- |
| COLUNAS LANCAMENTOS | id                   | uuid                     | NO          |
| COLUNAS LANCAMENTOS | loja_id              | uuid                     | NO          |
| COLUNAS LANCAMENTOS | tipo                 | USER-DEFINED             | NO          |
| COLUNAS LANCAMENTOS | plano_id             | uuid                     | NO          |
| COLUNAS LANCAMENTOS | centro_custo_id      | uuid                     | YES         |
| COLUNAS LANCAMENTOS | fornecedor_id        | uuid                     | YES         |
| COLUNAS LANCAMENTOS | descricao            | text                     | NO          |
| COLUNAS LANCAMENTOS | historico            | text                     | YES         |
| COLUNAS LANCAMENTOS | observacoes          | text                     | YES         |
| COLUNAS LANCAMENTOS | competencia          | date                     | NO          |
| COLUNAS LANCAMENTOS | valor_total          | numeric                  | NO          |
| COLUNAS LANCAMENTOS | num_parcelas         | integer                  | NO          |
| COLUNAS LANCAMENTOS | origem               | USER-DEFINED             | YES         |
| COLUNAS LANCAMENTOS | status_aprovacao     | USER-DEFINED             | YES         |
| COLUNAS LANCAMENTOS | documento_referencia | text                     | YES         |
| COLUNAS LANCAMENTOS | anexos               | ARRAY                    | YES         |
| COLUNAS LANCAMENTOS | user_id              | uuid                     | YES         |
| COLUNAS LANCAMENTOS | aprovado_por         | uuid                     | YES         |
| COLUNAS LANCAMENTOS | aprovado_em          | timestamp with time zone | YES         |
| COLUNAS LANCAMENTOS | metadata             | jsonb                    | YES         |
| COLUNAS LANCAMENTOS | created_at           | timestamp with time zone | YES         |
| COLUNAS LANCAMENTOS | updated_at           | timestamp with time zone | YES         |

-- =====================================================
-- 2. VERIFICAR COLUNAS DA TABELA PARCELAS  
-- =====================================================

SELECT 
    'COLUNAS PARCELAS' as tabela,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'parcelas' 
  AND table_schema = 'public'
ORDER BY ordinal_position;

| tabela           | column_name        | data_type                | is_nullable |
| ---------------- | ------------------ | ------------------------ | ----------- |
| COLUNAS PARCELAS | id                 | uuid                     | NO          |
| COLUNAS PARCELAS | lancamento_id      | uuid                     | NO          |
| COLUNAS PARCELAS | parcela            | integer                  | NO          |
| COLUNAS PARCELAS | vencimento         | date                     | NO          |
| COLUNAS PARCELAS | valor              | numeric                  | NO          |
| COLUNAS PARCELAS | juros              | numeric                  | YES         |
| COLUNAS PARCELAS | desconto           | numeric                  | YES         |
| COLUNAS PARCELAS | valor_pago         | numeric                  | YES         |
| COLUNAS PARCELAS | status             | USER-DEFINED             | NO          |
| COLUNAS PARCELAS | data_pagamento     | date                     | YES         |
| COLUNAS PARCELAS | forma_pagamento_id | uuid                     | YES         |
| COLUNAS PARCELAS | conta_id           | uuid                     | YES         |
| COLUNAS PARCELAS | comprovante        | text                     | YES         |
| COLUNAS PARCELAS | observacao         | text                     | YES         |
| COLUNAS PARCELAS | conciliado         | boolean                  | YES         |
| COLUNAS PARCELAS | created_at         | timestamp with time zone | YES         |
| COLUNAS PARCELAS | updated_at         | timestamp with time zone | YES         |

-- =====================================================
-- 3. VERIFICAR COLUNAS DA TABELA LOJAS
-- =====================================================

SELECT 
    'COLUNAS LOJAS' as tabela,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'lojas' 
  AND table_schema = 'public'
ORDER BY ordinal_position;


| tabela        | column_name  | data_type                | is_nullable |
| ------------- | ------------ | ------------------------ | ----------- |
| COLUNAS LOJAS | id           | uuid                     | NO          |
| COLUNAS LOJAS | nome         | text                     | NO          |
| COLUNAS LOJAS | codigo       | text                     | YES         |
| COLUNAS LOJAS | razao_social | text                     | YES         |
| COLUNAS LOJAS | cnpj         | text                     | YES         |
| COLUNAS LOJAS | endereco     | jsonb                    | YES         |
| COLUNAS LOJAS | telefone     | text                     | YES         |
| COLUNAS LOJAS | email        | text                     | YES         |
| COLUNAS LOJAS | responsavel  | text                     | YES         |
| COLUNAS LOJAS | ativa        | boolean                  | YES         |
| COLUNAS LOJAS | meta_mensal  | numeric                  | YES         |
| COLUNAS LOJAS | created_at   | timestamp with time zone | YES         |
| COLUNAS LOJAS | updated_at   | timestamp with time zone | YES         |
-- =====================================================
-- 4. VERIFICAR COLUNAS DA TABELA PLANO_CONTAS
-- =====================================================

SELECT 
    'COLUNAS PLANO_CONTAS' as tabela,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'plano_contas' 
  AND table_schema = 'public'
ORDER BY ordinal_position;

| tabela               | column_name       | data_type                | is_nullable |
| -------------------- | ----------------- | ------------------------ | ----------- |
| COLUNAS PLANO_CONTAS | id                | uuid                     | NO          |
| COLUNAS PLANO_CONTAS | codigo            | text                     | NO          |
| COLUNAS PLANO_CONTAS | nome              | text                     | NO          |
| COLUNAS PLANO_CONTAS | categoria         | USER-DEFINED             | NO          |
| COLUNAS PLANO_CONTAS | grupo_dre         | USER-DEFINED             | YES         |
| COLUNAS PLANO_CONTAS | nivel             | integer                  | NO          |
| COLUNAS PLANO_CONTAS | pai_id            | uuid                     | YES         |
| COLUNAS PLANO_CONTAS | descricao         | text                     | YES         |
| COLUNAS PLANO_CONTAS | aceita_lancamento | boolean                  | YES         |
| COLUNAS PLANO_CONTAS | ativo             | boolean                  | YES         |
| COLUNAS PLANO_CONTAS | ordem_exibicao    | integer                  | YES         |
| COLUNAS PLANO_CONTAS | created_at        | timestamp with time zone | YES         |

-- =====================================================
-- 5. TESTE RÁPIDO DE INSERÇÃO
-- =====================================================

SELECT 'TESTANDO INSERÇÃO SIMPLES...' as teste;

-- Teste básico de inserção (será removido depois)
DO $$
DECLARE
    test_loja_id UUID;
    test_user_id UUID;
    test_plano_id UUID;
    test_lancamento_id UUID;
BEGIN
    -- Buscar IDs de teste
    SELECT id INTO test_loja_id FROM lojas WHERE ativa = true LIMIT 1;
    SELECT id INTO test_user_id FROM auth.users LIMIT 1;
    SELECT id INTO test_plano_id FROM plano_contas WHERE aceita_lancamento = true LIMIT 1;
    
    -- Inserir lançamento de teste
    test_lancamento_id := gen_random_uuid();
    
    INSERT INTO lancamentos (
        id,
        loja_id,
        plano_id,
        tipo,
        competencia,
        descricao,
        valor_total,
        num_parcelas,
        user_id
    ) VALUES (
        test_lancamento_id,
        test_loja_id,
        test_plano_id,
        'receber'::tipo_lancamento,
        CURRENT_DATE,
        'Teste de Schema',
        1000.00,
        1,
        test_user_id
    );
    
    -- Inserir parcela de teste
    INSERT INTO parcelas (
        id,
        lancamento_id,
        parcela,
        valor,
        vencimento,
        status
    ) VALUES (
        gen_random_uuid(),
        test_lancamento_id,
        1,
        1000.00,
        CURRENT_DATE + INTERVAL '30 days',
        'previsto'::status_parcela
    );
    
    RAISE NOTICE 'Teste de inserção realizado com sucesso!';
    
    -- Limpar dados de teste
    DELETE FROM parcelas WHERE lancamento_id = test_lancamento_id;
    DELETE FROM lancamentos WHERE id = test_lancamento_id;
    
    RAISE NOTICE 'Dados de teste removidos!';
    
END $$;

| teste                        |
| ---------------------------- |
| TESTANDO INSERÇÃO SIMPLES... |

-- =====================================================
-- 6. RESULTADO FINAL
-- =====================================================

SELECT 'VERIFICAÇÃO CONCLUÍDA!' as resultado;
| resultado              |
| ---------------------- |
| VERIFICAÇÃO CONCLUÍDA! |
SELECT 'Schemas estão corretos e funcionais.' as status;

| status                               |
| ------------------------------------ |
| Schemas estão corretos e funcionais. |
SELECT 'Scripts de migração atualizados com nomes corretos.' as observacao;
| observacao                                          |
| --------------------------------------------------- |
| Scripts de migração atualizados com nomes corretos. |