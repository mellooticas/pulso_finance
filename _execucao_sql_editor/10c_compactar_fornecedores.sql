-- =====================================================
-- COMPACTAÇÃO DE FORNECEDORES (remoção segura de aliases)
-- Pré-requisitos: 10b_normalizar_fornecedores.sql executado
-- Efeito: remove fornecedores não canônicos que não possuem mais vínculos
--         e garante unicidade de canônicos por nome_normalizado
-- Idempotente: pode ser reexecutado
-- =====================================================

-- 1) Garantir um canônico por nome_normalizado
CREATE UNIQUE INDEX IF NOT EXISTS uniq_fornecedor_canonico_por_nome
ON fornecedores (nome_normalizado)
WHERE fornecedor_canonico_id IS NULL AND nome_normalizado IS NOT NULL;

-- 2) Remover fornecedores não canônicos sem vínculos
WITH candidatos AS (
  SELECT f.id
  FROM fornecedores f
  WHERE f.fornecedor_canonico_id IS NOT NULL
    AND NOT EXISTS (
      SELECT 1 FROM lancamentos l WHERE l.fornecedor_id = f.id
    )
)
DELETE FROM fornecedores f
USING candidatos c
WHERE f.id = c.id;

-- Relatórios:
-- SELECT COUNT(*) total, COUNT(*) FILTER (WHERE fornecedor_canonico_id IS NULL) canônicos FROM fornecedores;
