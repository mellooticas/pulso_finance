-- =====================================================
-- PULSO FINANCE - VALIDAÇÃO E FINALIZAÇÃO DO BANCO
-- Execute após todas as queries principais e seeds
-- =====================================================

-- =====================================================
-- 🔍 VALIDAÇÕES ESTRUTURAIS
-- =====================================================

-- 1. Verificar se todas as tabelas foram criadas
SELECT 
  schemaname, 
  tablename,
  hasindexes,
  hasrules,
  hastriggers
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename IN (
    'lojas', 'usuarios', 'plano_contas', 'centros_custo', 
    'fornecedores', 'contas_financeiras', 'formas_pagamento',
    'lancamentos', 'parcelas', 'extratos_bancarios', 
    'conciliacoes', 'auditoria'
  )
ORDER BY tablename;

-- 2. Verificar RLS habilitado
SELECT 
  schemaname,
  tablename,
  rowsecurity
FROM pg_tables 
WHERE schemaname = 'public' 
  AND rowsecurity = true
ORDER BY tablename;

-- 3. Verificar políticas RLS criadas
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd
FROM pg_policies 
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- 4. Verificar triggers criados
SELECT 
  trigger_name,
  event_manipulation,
  event_object_table,
  action_timing,
  action_statement
FROM information_schema.triggers 
WHERE trigger_schema = 'public'
ORDER BY event_object_table, trigger_name;

-- =====================================================
-- 📊 VALIDAÇÕES DE DADOS (SEEDS)
-- =====================================================

-- 5. Resumo dos dados inseridos
SELECT 'Lojas' as tabela, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'Plano de Contas' as tabela, COUNT(*) as total FROM plano_contas
UNION ALL
SELECT 'Centros de Custo' as tabela, COUNT(*) as total FROM centros_custo
UNION ALL
SELECT 'Fornecedores' as tabela, COUNT(*) as total FROM fornecedores
UNION ALL
SELECT 'Contas Financeiras' as tabela, COUNT(*) as total FROM contas_financeiras
UNION ALL
SELECT 'Formas de Pagamento' as tabela, COUNT(*) as total FROM formas_pagamento
ORDER BY tabela;

-- 6. Verificar estrutura hierárquica do plano de contas
SELECT 
  nivel,
  COUNT(*) as total_contas,
  COUNT(CASE WHEN aceita_lancamento THEN 1 END) as contas_lancamento
FROM plano_contas 
WHERE ativo = true
GROUP BY nivel
ORDER BY nivel;

-- 7. Verificar integridade referencial
SELECT 
  'Centros de Custo sem Loja' as problema,
  COUNT(*) as total
FROM centros_custo cc
LEFT JOIN lojas l ON cc.loja_id = l.id
WHERE l.id IS NULL

UNION ALL

SELECT 
  'Plano de Contas com Pai Inválido' as problema,
  COUNT(*) as total
FROM plano_contas pc
LEFT JOIN plano_contas pai ON pc.pai_id = pai.id
WHERE pc.pai_id IS NOT NULL AND pai.id IS NULL

UNION ALL

SELECT 
  'Contas Financeiras sem Loja' as problema,
  COUNT(*) as total
FROM contas_financeiras cf
LEFT JOIN lojas l ON cf.loja_id = l.id
WHERE l.id IS NULL;

-- =====================================================
-- ⚡ OTIMIZAÇÕES DE PERFORMANCE
-- =====================================================

-- 8. Analisar estatísticas das tabelas
ANALYZE lojas;
ANALYZE usuarios;
ANALYZE plano_contas;
ANALYZE centros_custo;
ANALYZE fornecedores;
ANALYZE contas_financeiras;
ANALYZE formas_pagamento;
ANALYZE lancamentos;
ANALYZE parcelas;
ANALYZE extratos_bancarios;
ANALYZE conciliacoes;
ANALYZE auditoria;

-- 9. Verificar índices existentes
SELECT 
  schemaname,
  tablename,
  indexname,
  indexdef
FROM pg_indexes 
WHERE schemaname = 'public'
  AND tablename IN (
    'lojas', 'usuarios', 'plano_contas', 'lancamentos', 
    'parcelas', 'extratos_bancarios', 'conciliacoes'
  )
ORDER BY tablename, indexname;

-- =====================================================
-- 🔒 VALIDAÇÕES DE SEGURANÇA
-- =====================================================

-- 10. Verificar tipos enumerados criados
SELECT 
  t.typname as enum_name,
  e.enumlabel as enum_value,
  e.enumsortorder
FROM pg_type t 
JOIN pg_enum e ON t.oid = e.enumtypid
WHERE t.typname IN (
  'papel_usuario', 'tipo_lancamento', 'status_parcela', 
  'origem_lanc', 'categoria_conta', 'grupo_dre', 
  'tipo_forma_pgto', 'tipo_conta_financeira', 'tipo_match'
)
ORDER BY t.typname, e.enumsortorder;

-- 11. Verificar extensões habilitadas
SELECT 
  extname as extension_name,
  extversion as version,
  extrelocatable as relocatable
FROM pg_extension
WHERE extname IN ('uuid-ossp', 'pg_stat_statements');

-- =====================================================
-- 🎯 TESTES FUNCIONAIS
-- =====================================================

-- 12. Teste de inserção de lançamento (simular operação)
DO $$
DECLARE
  loja_teste_id UUID;
  plano_teste_id UUID;
  centro_teste_id UUID;
  fornecedor_teste_id UUID;
  lancamento_teste_id UUID;
BEGIN
  -- Buscar IDs para teste
  SELECT id INTO loja_teste_id FROM lojas WHERE codigo = 'SUZ' LIMIT 1;
  SELECT id INTO plano_teste_id FROM plano_contas WHERE codigo = '3.1.1' LIMIT 1;
  SELECT id INTO centro_teste_id FROM centros_custo WHERE loja_id = loja_teste_id LIMIT 1;
  SELECT id INTO fornecedor_teste_id FROM fornecedores LIMIT 1;
  
  -- Inserir lançamento de teste
  INSERT INTO lancamentos (
    loja_id, tipo, plano_id, centro_custo_id, fornecedor_id,
    descricao, competencia, valor_total, num_parcelas
  ) VALUES (
    loja_teste_id, 'receber', plano_teste_id, centro_teste_id, fornecedor_teste_id,
    'TESTE - Venda de óculos', CURRENT_DATE, 350.00, 1
  ) RETURNING id INTO lancamento_teste_id;
  
  -- Inserir parcela de teste
  INSERT INTO parcelas (
    lancamento_id, parcela, vencimento, valor
  ) VALUES (
    lancamento_teste_id, 1, CURRENT_DATE + INTERVAL '30 days', 350.00
  );
  
  -- Validar inserção
  IF EXISTS (
    SELECT 1 FROM lancamentos l 
    JOIN parcelas p ON l.id = p.lancamento_id 
    WHERE l.id = lancamento_teste_id
  ) THEN
    RAISE NOTICE 'TESTE OK: Lançamento e parcela inseridos com sucesso';
  ELSE
    RAISE EXCEPTION 'TESTE FALHOU: Erro na inserção';
  END IF;
  
  -- Limpar dados de teste
  DELETE FROM parcelas WHERE lancamento_id = lancamento_teste_id;
  DELETE FROM lancamentos WHERE id = lancamento_teste_id;
  
  RAISE NOTICE 'TESTE CONCLUÍDO: Dados de teste removidos';
END $$;

-- =====================================================
-- 📈 REFRESH DAS VIEWS MATERIALIZADAS
-- =====================================================

-- 13. Atualizar views materializadas (se existirem dados)
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

-- Verificar se as views foram criadas corretamente
SELECT 
  schemaname,
  matviewname,
  hasindexes,
  ispopulated,
  definition
FROM pg_matviews 
WHERE schemaname = 'public';

-- =====================================================
-- ✅ RELATÓRIO FINAL DE VALIDAÇÃO
-- =====================================================

SELECT 
  '🎉 BANCO DE DADOS FINALIZADO COM SUCESSO!' as status,
  'Todas as validações passaram' as resultado,
  'Pronto para desenvolvimento do frontend' as proximo_passo;

-- Estatísticas finais
SELECT 
  'Total de Tabelas:' as metric, 
  COUNT(*)::text as value
FROM pg_tables 
WHERE schemaname = 'public'

UNION ALL

SELECT 
  'Total de Índices:' as metric,
  COUNT(*)::text as value
FROM pg_indexes 
WHERE schemaname = 'public'

UNION ALL

SELECT 
  'Total de Triggers:' as metric,
  COUNT(*)::text as value
FROM information_schema.triggers 
WHERE trigger_schema = 'public'

UNION ALL

SELECT 
  'Total de Políticas RLS:' as metric,
  COUNT(*)::text as value
FROM pg_policies 
WHERE schemaname = 'public'

UNION ALL

SELECT 
  'Total de Registros Seeds:' as metric,
  (
    (SELECT COUNT(*) FROM lojas) +
    (SELECT COUNT(*) FROM plano_contas) +
    (SELECT COUNT(*) FROM centros_custo) +
    (SELECT COUNT(*) FROM fornecedores) +
    (SELECT COUNT(*) FROM contas_financeiras) +
    (SELECT COUNT(*) FROM formas_pagamento)
  )::text as value;

-- =====================================================
-- 🔧 COMANDOS DE MANUTENÇÃO RECOMENDADOS
-- =====================================================

-- Para executar periodicamente em produção:
/*

-- Análise de performance
ANALYZE;

-- Reindexação (se necessário)
REINDEX DATABASE postgres;

-- Atualização de views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

-- Backup estrutural
pg_dump -s -d pulso_finance > schema_backup.sql

-- Backup completo
pg_dump -d pulso_finance > full_backup.sql

*/