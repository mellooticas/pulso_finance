-- =====================================================
-- ATRIBUIR PLANO AOS LANÇAMENTOS (PÓS 11)
-- Objetivo: alinhar receitas migradas ao plano de contas correto
-- Escopo: somente origem = 'migracao_yampa'
-- Idempotente: pode reexecutar sem efeitos colaterais
-- =====================================================

-- Observação importante:
-- Este script foca em RECEITAS (tipo = 'receber'), pois os lotes de 11
-- vêm com fornecedor_id geralmente NULL para despesas. Sem o vínculo
-- de fornecedor/categoria, mapear despesas com precisão exigiria regras
-- adicionais. Podemos evoluir depois com uma tabela de mapeamento.

-- 0) Helpers (pegar id por código) – inline via subquery scalar para evitar dependência
-- Nota: um subselect escalar vazio retorna NULL, permitindo COALESCE.

-- 1) Vendas em dinheiro → 3.1.1 (se não existir, cai para 3.1)
UPDATE lancamentos l
SET plano_id = COALESCE(
  (SELECT id FROM plano_contas WHERE codigo = '3.1.1' LIMIT 1),
  (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
)
WHERE l.origem = 'migracao_yampa'::origem_lanc
  AND l.tipo = 'receber'::tipo_lancamento
  AND l.descricao ILIKE 'VENDAS DINHEIRO%'
  AND (
    l.plano_id IS DISTINCT FROM COALESCE(
      (SELECT id FROM plano_contas WHERE codigo = '3.1.1' LIMIT 1),
      (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
    )
  );

-- 2) Vendas no cartão → 3.1.2 (se não existir, cai para 3.1)
UPDATE lancamentos l
SET plano_id = COALESCE(
  (SELECT id FROM plano_contas WHERE codigo = '3.1.2' LIMIT 1),
  (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
)
WHERE l.origem = 'migracao_yampa'::origem_lanc
  AND l.tipo = 'receber'::tipo_lancamento
  AND (
    l.descricao ILIKE 'VENDAS NO CART%' OR
    l.descricao ILIKE 'VENDAS CART%' OR
    l.descricao ILIKE 'VENDAS NO CARTA%'
  )
  AND (
    l.plano_id IS DISTINCT FROM COALESCE(
      (SELECT id FROM plano_contas WHERE codigo = '3.1.2' LIMIT 1),
      (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
    )
  );

-- 3) Vendas PIX/Transferências → 3.1 (genérico de receita de vendas)
UPDATE lancamentos l
SET plano_id = (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
WHERE l.origem = 'migracao_yampa'::origem_lanc
  AND l.tipo = 'receber'::tipo_lancamento
  AND (
    l.descricao ILIKE 'VENDAS PIX%' OR
    l.descricao ILIKE '% PIX %' OR
    l.descricao ILIKE 'VENDAS TRANSF%'
  )
  AND (
    l.plano_id IS DISTINCT FROM (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
  );

-- 4) Fallback opcional: quaisquer recebíveis sem plano definido conhecido → 3.1
-- (descomente se quiser forçar todos os recebíveis cadastrados via migração a 3.1)
-- UPDATE lancamentos l
-- SET plano_id = (SELECT id FROM plano_contas WHERE codigo = '3.1' LIMIT 1)
-- WHERE l.origem = 'migracao_yampa'::origem_lanc
--   AND l.tipo = 'receber'::tipo_lancamento
--   AND (
--     l.plano_id IS NULL OR NOT EXISTS (
--       SELECT 1 FROM plano_contas pc WHERE pc.id = l.plano_id AND pc.codigo LIKE '3.%'
--     )
--   );

-- Relatórios rápidos (opcional)
-- SELECT pc.codigo, COUNT(*)
-- FROM lancamentos l
-- JOIN plano_contas pc ON pc.id = l.plano_id
-- WHERE l.origem = 'migracao_yampa' AND l.tipo = 'receber'
-- GROUP BY 1 ORDER BY 1;
