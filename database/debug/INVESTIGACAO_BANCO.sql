-- =============================================
-- QUERIES DE INVESTIGAÇÃO - PULSO FINANCE
-- =============================================
-- Execute estas queries no Supabase SQL Editor para investigar o estado atual

-- =============================================
-- 1. VERIFICAR QUAIS TABELAS EXISTEM
-- =============================================
SELECT 
  table_name,
  table_type
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;

| table_name         | table_type |
| ------------------ | ---------- |
| auditoria          | BASE TABLE |
| centros_custo      | BASE TABLE |
| conciliacoes       | BASE TABLE |
| contas_financeiras | BASE TABLE |
| extratos_bancarios | BASE TABLE |
| formas_pagamento   | BASE TABLE |
| fornecedores       | BASE TABLE |
| lancamentos        | BASE TABLE |
| lojas              | BASE TABLE |
| parcelas           | BASE TABLE |
| plano_contas       | BASE TABLE |
| usuarios           | BASE TABLE |

-- =============================================
-- 2. VERIFICAR LOJAS EXISTENTES
-- =============================================
SELECT 
  'LOJAS CADASTRADAS' as info,
  COUNT(*) as total
FROM lojas;

-- Detalhes das lojas
SELECT 
  codigo,
  nome,
  razao_social,
  ativa,
  meta_mensal
FROM lojas 
ORDER BY codigo;

-- =============================================
-- 3. VERIFICAR PLANO DE CONTAS
-- =============================================
SELECT 
  'PLANO DE CONTAS' as info,
  COUNT(*) as total
FROM plano_contas;

-- Amostra do plano de contas
SELECT 
  codigo,
  nome,
  categoria,
  nivel,
  aceita_lancamento,
  ativo
FROM plano_contas 
WHERE ativo = true
ORDER BY codigo
LIMIT 20;

-- =============================================
-- 4. VERIFICAR USUÁRIOS
-- =============================================
SELECT 
  'USUÁRIOS CADASTRADOS' as info,
  COUNT(*) as total
FROM usuarios;

-- Detalhes dos usuários (se existirem)
SELECT 
  email,
  nome,
  papel,
  ativo,
  created_at
FROM usuarios
ORDER BY created_at;

-- =============================================
-- 5. VERIFICAR LANÇAMENTOS EXISTENTES
-- =============================================
SELECT 
  'LANÇAMENTOS EXISTENTES' as info,
  COUNT(*) as total
FROM lancamentos;

-- Se existirem lançamentos, mostrar alguns detalhes
SELECT 
  l.origem,
  COUNT(*) as quantidade,
  MIN(l.competencia) as data_inicio,
  MAX(l.competencia) as data_fim,
  SUM(l.valor_total) as valor_total
FROM lancamentos l
GROUP BY l.origem
ORDER BY quantidade DESC;

-- =============================================
-- 6. VERIFICAR PARCELAS EXISTENTES
-- =============================================
SELECT 
  'PARCELAS EXISTENTES' as info,
  COUNT(*) as total
FROM parcelas;

-- Status das parcelas (se existirem)
SELECT 
  status,
  COUNT(*) as quantidade,
  SUM(valor) as valor_total
FROM parcelas
GROUP BY status;

-- =============================================
-- 7. VERIFICAR FORMAS DE PAGAMENTO
-- =============================================
SELECT 
  'FORMAS DE PAGAMENTO' as info,
  COUNT(*) as total
FROM formas_pagamento;

-- Detalhes das formas de pagamento
SELECT 
  nome,
  tipo,
  taxa,
  prazo_dias,
  ativa
FROM formas_pagamento
ORDER BY nome;

-- =============================================
-- 8. VERIFICAR CONTAS FINANCEIRAS
-- =============================================
SELECT 
  'CONTAS FINANCEIRAS' as info,
  COUNT(*) as total
FROM contas_financeiras;

-- Detalhes das contas financeiras
SELECT 
  cf.apelido,
  cf.tipo,
  cf.banco,
  cf.saldo_atual,
  cf.ativa,
  lo.nome as loja_nome
FROM contas_financeiras cf
LEFT JOIN lojas lo ON cf.loja_id = lo.id
ORDER BY cf.apelido;

-- =============================================
-- 9. VERIFICAR CENTROS DE CUSTO
-- =============================================
SELECT 
  'CENTROS DE CUSTO' as info,
  COUNT(*) as total
FROM centros_custo;

-- Detalhes dos centros de custo
SELECT 
  cc.codigo,
  cc.nome,
  cc.ativo,
  lo.nome as loja_nome
FROM centros_custo cc
LEFT JOIN lojas lo ON cc.loja_id = lo.id
ORDER BY lo.nome, cc.codigo;

-- =============================================
-- 10. VERIFICAR FORNECEDORES
-- =============================================
SELECT 
  'FORNECEDORES' as info,
  COUNT(*) as total
FROM fornecedores;

-- Amostra de fornecedores
SELECT 
  nome,
  tipo_pessoa,
  documento,
  ativo
FROM fornecedores
WHERE ativo = true
ORDER BY nome
LIMIT 10;

-- =============================================
-- 11. VERIFICAR ESTRUTURA DE COLUNAS
-- =============================================

-- Colunas da tabela lancamentos
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns 
WHERE table_name = 'lancamentos' 
  AND table_schema = 'public'
ORDER BY ordinal_position;

-- =============================================
-- 12. VERIFICAR ENUMS DISPONÍVEIS
-- =============================================
SELECT 
  t.typname as enum_name,
  e.enumlabel as enum_value
FROM pg_type t 
JOIN pg_enum e ON t.oid = e.enumtypid  
WHERE t.typname IN (
  'papel_usuario', 
  'tipo_lancamento', 
  'status_parcela', 
  'origem_lanc',
  'categoria_conta',
  'grupo_dre',
  'tipo_forma_pgto',
  'tipo_conta_financeira'
)
ORDER BY t.typname, e.enumsortorder;

-- =============================================
-- 13. VERIFICAR SE HÁ DADOS DO YAMPA
-- =============================================

-- Verificar se já existe migração do Yampa
SELECT 
  'Dados Yampa existentes' as info,
  COUNT(*) as lancamentos
FROM lancamentos 
WHERE origem = 'migracao_yampa';

-- Se existir, mostrar detalhes
SELECT 
  DATE_TRUNC('month', competencia) as mes,
  COUNT(*) as quantidade,
  SUM(valor_total) as valor_total
FROM lancamentos 
WHERE origem = 'migracao_yampa'
GROUP BY DATE_TRUNC('month', competencia)
ORDER BY mes DESC
LIMIT 12;

-- =============================================
-- 14. VERIFICAR PERMISSÕES E RLS
-- =============================================

-- Verificar se RLS está ativo
SELECT 
  schemaname,
  tablename,
  rowsecurity
FROM pg_tables 
WHERE schemaname = 'public'
  AND tablename IN ('lojas', 'lancamentos', 'parcelas', 'usuarios')
ORDER BY tablename;

-- =============================================
-- 15. RESUMO GERAL DO BANCO
-- =============================================
SELECT 
  'RESUMO GERAL' as categoria,
  'Tabelas criadas' as item,
  COUNT(*) as valor
FROM information_schema.tables 
WHERE table_schema = 'public'

UNION ALL

SELECT 
  'DADOS',
  'Lojas',
  COUNT(*)
FROM lojas

UNION ALL

SELECT 
  'DADOS',
  'Plano de Contas',
  COUNT(*)
FROM plano_contas

UNION ALL

SELECT 
  'DADOS',
  'Usuários',
  COUNT(*)
FROM usuarios

UNION ALL

SELECT 
  'DADOS',
  'Lançamentos',
  COUNT(*)
FROM lancamentos

UNION ALL

SELECT 
  'DADOS',
  'Parcelas',
  COUNT(*)
FROM parcelas;

-- =============================================
-- FIM DAS INVESTIGAÇÕES
-- =============================================