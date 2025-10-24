-- Migração: adicionar categoria em fornecedores e criar views de conveniência
-- Data: 2025-10-21

-- 1) Tipo enum para categorização de beneficiários
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_type t
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE t.typname = 'categoria_beneficiario'
  ) THEN
    CREATE TYPE categoria_beneficiario AS ENUM (
      'fornecedor',           -- fornecedor usual (CNPJ) / indústria / representante
      'prestador_pf',         -- prestador pessoa física (autônomo)
      'colaborador',          -- funcionário/folha/comissão/adiantamento/benefícios
      'instituicao_financeira', -- bancos, adquirentes, fintechs
      'fisco',                -- tributos e órgãos públicos
      'aluguel',              -- locadores
      'outro'                 -- rótulos genéricos que não são beneficiários
    );
  END IF;
END$$;

-- 2) Adicionar coluna em fornecedores (default fornecedor)
ALTER TABLE fornecedores
  ADD COLUMN IF NOT EXISTS categoria categoria_beneficiario NOT NULL DEFAULT 'fornecedor';

-- 3) Índice útil para filtros
CREATE INDEX IF NOT EXISTS idx_fornecedores_categoria ON fornecedores(categoria);
CREATE INDEX IF NOT EXISTS idx_fornecedores_nome_trgm ON fornecedores USING GIN (nome gin_trgm_ops);

-- 4) Views de conveniência (idempotentes)
CREATE OR REPLACE VIEW vw_fornecedores AS
  SELECT *
  FROM fornecedores
  WHERE categoria IN ('fornecedor','prestador_pf','aluguel','instituicao_financeira','fisco');

CREATE OR REPLACE VIEW vw_colaboradores AS
  SELECT *
  FROM fornecedores
  WHERE categoria = 'colaborador';

COMMENT ON VIEW vw_fornecedores IS 'Beneficiários com papel de fornecedor/prestador/banco/fisco (exclui colaboradores e rótulos genéricos).';
COMMENT ON VIEW vw_colaboradores IS 'Beneficiários classificados como colaboradores (folha, adiantamentos, comissões, VT/VR etc).';
