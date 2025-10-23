-- =====================================================
-- NORMALIZAÇÃO DE FORNECEDORES (canônicos vs. aliases)
-- Objetivo: reduzir duplicidades de fornecedores criados a partir de descrições
-- Estratégia:
--  1) Criar função de normalização (remove acentos, pontuação, espaços; minúsculas)
--  2) Adicionar coluna nome_normalizado em fornecedores
--  3) Preencher nome_normalizado para todos os registros
--  4) Adicionar coluna fornecedor_canonico_id (auto-relacionamento)
--  5) Definir um canônico por chave normalizada e apontar os demais para ele
--  6) Atualizar lancamentos.fornecedor_id para o canônico
--  7) Criar view v_fornecedores_canonicos (somente os canônicos)
-- Observações:
--  - Script idempotente: pode reexecutar sem problemas
--  - Reexecute após novas cargas (p.ex., depois de 11_transacionais_lote_*)
-- =====================================================

-- 1) Extensão para remover acentos (se disponível)
CREATE EXTENSION IF NOT EXISTS unaccent;

-- 1) Função de normalização
CREATE OR REPLACE FUNCTION public.fn_normalizar_nome_fornecedor(input text)
RETURNS text
LANGUAGE sql
IMMUTABLE
AS $$
  WITH base AS (
    SELECT unaccent(lower(coalesce(input,''))) AS s
  ),
  -- Remover e-mails, telefones, CPF/CNPJ, tokens de contexto (pix, parcela, ref, loja, rgi, boleto, acordo, desconto, pagamento, 13º, férias, rescisão, comissão)
  limpo AS (
    SELECT
      regexp_replace(
        regexp_replace(
          regexp_replace(
            regexp_replace(
              regexp_replace(
                regexp_replace(
                  regexp_replace(
                    regexp_replace(
                      regexp_replace(
                        regexp_replace(
                          regexp_replace(s,
                            '\\S+@\\S+', '', 'g' -- e-mails
                          ),
                          '(\+?\n?\d{2,3}[\s-]?)?(\(?\d{2}\)?[\s-]?)?\d{4,5}[\s-]?\d{4}', '', 'g' -- telefones
                        ),
                        '\\b\d{3}\\.\\d{3}\\.\\d{3}-\\d{2}\\b', '', 'g' -- CPF
                      ),
                      '\\b\d{2}\\.\\d{3}\\.\\d{3}/\\d{4}-\\d{2}\\b', '', 'g' -- CNPJ
                    ),
                    '\\bpix:?[^\n]*', '', 'g' -- PIX e o que segue
                  ),
                  '\\b(parcela|ref\\.?|loja|rgi|boleto|acordo|desconto|pagamento|via|taxa|mes(es)?|ano(s)?)\\b', '', 'g'
                ),
                '\\b(13o|13º|d[eé]cimo\s+terceiro|f[eé]rias|rescis[aã]o|comiss[aã]o|exame|admissional)\\b', '', 'g'
              ),
              '\\([^)]*\\)', '', 'g' -- conteúdo entre parênteses
            ),
            '[-_.,:;|>]+', ' ', 'g' -- separadores comuns
          ),
          '\\s+', ' ', 'g' -- espaços repetidos
        ),
        '[^a-z0-9]+', '', 'g' -- manter apenas a-z0-9 para chave
      ) AS s
    FROM base
  )
  SELECT NULLIF(s,'') FROM limpo;
$$;

-- 2) Coluna nome_normalizado
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'fornecedores' AND column_name = 'nome_normalizado'
  ) THEN
    ALTER TABLE fornecedores ADD COLUMN nome_normalizado text;
    CREATE INDEX IF NOT EXISTS idx_fornecedores_nome_normalizado ON fornecedores (nome_normalizado);
  END IF;
END $$;

-- 3) Preencher nome_normalizado
UPDATE fornecedores f
SET nome_normalizado = public.fn_normalizar_nome_fornecedor(f.nome)
WHERE (f.nome_normalizado IS DISTINCT FROM public.fn_normalizar_nome_fornecedor(f.nome));

-- 4) Coluna fornecedor_canonico_id (self-FK)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'fornecedores' AND column_name = 'fornecedor_canonico_id'
  ) THEN
    ALTER TABLE fornecedores
      ADD COLUMN fornecedor_canonico_id uuid NULL REFERENCES fornecedores(id) ON DELETE SET NULL;
    CREATE INDEX IF NOT EXISTS idx_fornecedores_canonico ON fornecedores (fornecedor_canonico_id);
  END IF;
END $$;

-- 5) Definir canônico por grupo (nome_normalizado)
-- Regra: para cada nome_normalizado, o canônico é o menor created_at (ou menor id como fallback)
WITH base AS (
  SELECT f.id,
         f.nome_normalizado,
         ROW_NUMBER() OVER (
           PARTITION BY f.nome_normalizado
           ORDER BY f.created_at NULLS LAST, f.id
         ) AS rn,
         FIRST_VALUE(f.id) OVER (
           PARTITION BY f.nome_normalizado
           ORDER BY f.created_at NULLS LAST, f.id
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
         ) AS canonical_id
  FROM fornecedores f
  WHERE f.nome_normalizado IS NOT NULL
)
UPDATE fornecedores f
SET fornecedor_canonico_id = b.canonical_id
FROM base b
WHERE f.id = b.id
  AND b.rn > 1
  AND (f.fornecedor_canonico_id IS DISTINCT FROM b.canonical_id);

-- 6) Atualizar lancamentos para apontar ao canônico
UPDATE lancamentos l
SET fornecedor_id = f.fornecedor_canonico_id
FROM fornecedores f
WHERE l.fornecedor_id = f.id
  AND f.fornecedor_canonico_id IS NOT NULL
  AND (l.fornecedor_id IS DISTINCT FROM f.fornecedor_canonico_id);

-- 7) View somente canônicos (opcional para o frontend)
CREATE OR REPLACE VIEW v_fornecedores_canonicos AS
SELECT *
FROM fornecedores
WHERE fornecedor_canonico_id IS NULL;

-- Relatórios rápidos
-- SELECT COUNT(*) AS total_cadastrados FROM fornecedores;
-- SELECT COUNT(*) AS total_canonicos FROM v_fornecedores_canonicos;
-- SELECT nome_normalizado, COUNT(*) qtd FROM fornecedores GROUP BY 1 HAVING COUNT(*) > 1 ORDER BY qtd DESC, nome_normalizado;
-- SELECT categoria, COUNT(*) FROM v_fornecedores_canonicos GROUP BY 1 ORDER BY 1;
