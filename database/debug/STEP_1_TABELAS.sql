-- =============================================
-- INVESTIGAÇÃO INICIAL - PULSO FINANCE
-- =============================================
-- Execute primeiro para descobrir o estado básico

-- 🔍 STEP 1: Quais tabelas existem?
SELECT 
  table_name as "Tabela",
  CASE 
    WHEN table_name LIKE '%lancamento%' THEN '💰'
    WHEN table_name LIKE '%loja%' THEN '🏢'
    WHEN table_name LIKE '%plano%' THEN '📊'
    WHEN table_name LIKE '%usuario%' THEN '👥'
    ELSE '📋'
  END as "Ícone"
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;

| Tabela             | Ícone |
| ------------------ | ----- |
| auditoria          | 📋    |
| centros_custo      | 📋    |
| conciliacoes       | 📋    |
| contas_financeiras | 📋    |
| extratos_bancarios | 📋    |
| formas_pagamento   | 📋    |
| fornecedores       | 📋    |
| lancamentos        | 💰    |
| lojas              | 🏢    |
| parcelas           | 📋    |
| plano_contas       | 📊    |
| usuarios           | 👥    |