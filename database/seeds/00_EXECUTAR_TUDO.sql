-- =====================================================
-- SCRIPT MASTER DE EXECUÇÃO
-- Executa limpeza + população completa
-- Gerado em: 2025-10-21 17:25:39
-- =====================================================

-- AVISO: Este script irá LIMPAR TODOS OS DADOS do banco!
-- Execute apenas em ambiente de desenvolvimento/homologação!

\echo '=================================================='
\echo 'PULSO Finance - Limpeza e Repopulação'
\echo '=================================================='
\echo ''

\echo 'Etapa 1/3: Limpando banco...'
\i 01_limpar_banco.sql

\echo ''
\echo 'Etapa 2/3: Povoando tabelas mestres...'
\i 02_povoar_mestres.sql

\echo ''
\echo 'Etapa 3/3: Povoando lançamentos e parcelas...'
\i 03_povoar_transacionais.sql

\echo ''
\echo '=================================================='
\echo '✅ CONCLUÍDO!'
\echo '=================================================='
\echo ''
\echo 'Resumo:'
\echo '  - Lojas: 10'
\echo '  - Plano de contas: 120'
\echo '  - Centros de custo: 11'
\echo '  - Contas financeiras: 16'
\echo '  - Fornecedores: 12815'
\echo '  - Lançamentos: 42863'
\echo '  - Parcelas: 42863'
\echo ''
