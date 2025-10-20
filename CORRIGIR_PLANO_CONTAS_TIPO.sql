-- ============================================================
-- 🔧 CORRIGIR PLANO DE CONTAS: Adicionar coluna TIPO
-- ============================================================
-- 
-- PROBLEMA: plano_contas tem apenas "categoria" mas apps precisam de "tipo"
-- SOLUÇÃO: Adicionar coluna "tipo" derivada da categoria
--
-- ============================================================

-- 1. Criar ENUM para tipo (se não existir)
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'tipo_conta') THEN
        CREATE TYPE tipo_conta AS ENUM ('receita', 'despesa');
    END IF;
END $$;

-- 2. Adicionar coluna "tipo" à tabela plano_contas
ALTER TABLE plano_contas 
ADD COLUMN IF NOT EXISTS tipo tipo_conta;

-- 3. Atualizar valores baseado na categoria
UPDATE plano_contas
SET tipo = CASE 
    WHEN categoria = 'receita' THEN 'receita'::tipo_conta
    WHEN categoria IN ('custo', 'despesa') THEN 'despesa'::tipo_conta
    ELSE 'despesa'::tipo_conta  -- Default para outros
END
WHERE tipo IS NULL;

-- 4. Tornar coluna NOT NULL
ALTER TABLE plano_contas 
ALTER COLUMN tipo SET NOT NULL;

-- 5. Verificar resultado
SELECT 
    tipo,
    categoria,
    COUNT(*) as quantidade,
    string_agg(DISTINCT codigo, ', ' ORDER BY codigo) as exemplos
FROM plano_contas
GROUP BY tipo, categoria
ORDER BY tipo, categoria;

-- 6. Sample de contas atualizadas
SELECT 
    codigo,
    nome,
    categoria,
    tipo,
    grupo_dre
FROM plano_contas
ORDER BY tipo, codigo
LIMIT 20;

-- ============================================================
-- ✅ Resultado esperado:
--    - plano_contas.tipo agora existe com valores 'receita' ou 'despesa'
--    - Receitas: categoria='receita' → tipo='receita'
--    - Despesas: categoria IN ('custo','despesa','investimento','outros') → tipo='despesa'
-- ============================================================

| codigo | nome                       | categoria | tipo    | grupo_dre            |
| ------ | -------------------------- | --------- | ------- | -------------------- |
| 3      | RECEITAS                   | receita   | receita | receita_bruta        |
| 3.1    | Receitas de Vendas         | receita   | receita | receita_bruta        |
| 3.1.1  | Vendas em Dinheiro         | receita   | receita | receita_bruta        |
| 3.1.10 | Pagamento de Festas        | receita   | receita | receita_bruta        |
| 3.1.2  | Vendas Cartões de Débito   | receita   | receita | receita_bruta        |
| 3.1.3  | Vendas Cartões de Crédito  | receita   | receita | receita_bruta        |
| 3.1.4  | Vendas Cartões Parceladas  | receita   | receita | receita_bruta        |
| 3.1.5  | Vendas Cheques             | receita   | receita | receita_bruta        |
| 3.1.6  | Vendas Crediário           | receita   | receita | receita_bruta        |
| 3.1.7  | Vendas Convênios           | receita   | receita | receita_bruta        |
| 3.1.8  | Vendas PIX                 | receita   | receita | receita_bruta        |
| 3.2    | Outras Receitas            | receita   | receita | receita_bruta        |
| 3.2.1  | Receitas de Serviços       | receita   | receita | receita_bruta        |
| 3.2.2  | Receitas Financeiras       | receita   | receita | resultado_financeiro |
| 7.1    | Entradas Não Operacionais  | receita   | receita | resultado_financeiro |
| 7.1.1  | Empréstimos Obtidos        | receita   | receita | resultado_financeiro |
| 13     | CONTAS ESPECIAIS           | outros    | despesa | outros               |
| 13.99  | Saldo Inicial Padrão Yampa | outros    | despesa | outros               |
| 4      | CUSTOS VARIÁVEIS           | custo     | despesa | cmv                  |
| 4.1    | Impostos sobre Vendas      | custo     | despesa | deducoes_vendas      |