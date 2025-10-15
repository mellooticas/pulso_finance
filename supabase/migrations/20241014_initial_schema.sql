-- =====================================================
-- PULSO FINANCE - SCHEMA COMPLETO v1.0
-- Sistema Financeiro para Redes de Óticas
-- Base: Análise de 47.064 transações reais Yampa
-- =====================================================

-- EXTENSÕES NECESSÁRIAS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_cron";

-- =====================================================
-- 1. ENUMS E TIPOS
-- =====================================================

-- Papéis de usuário com hierarquia
CREATE TYPE papel_usuario AS ENUM ('gerencial', 'financeiro', 'admin');

-- Tipos de lançamentos
CREATE TYPE tipo_lancamento AS ENUM ('receber', 'pagar');

-- Status de parcelas
CREATE TYPE status_parcela AS ENUM ('previsto', 'vencido', 'pago', 'parcial', 'cancelado');

-- Origem dos lançamentos
CREATE TYPE origem_lanc AS ENUM ('manual', 'migracao_yampa', 'import_csv', 'api', 'conciliacao', 'sistema');

-- Status de aprovação
CREATE TYPE status_aprovacao AS ENUM ('pendente', 'aprovado', 'rejeitado');

-- Categorias do plano de contas
CREATE TYPE categoria_conta AS ENUM ('receita', 'custo', 'despesa', 'investimento', 'outros');

-- Grupos DRE
CREATE TYPE grupo_dre AS ENUM (
  'receita_bruta', 
  'deducoes_vendas', 
  'receita_liquida', 
  'cmv', 
  'lucro_bruto', 
  'despesas_operacionais', 
  'resultado_operacional', 
  'resultado_financeiro', 
  'resultado_liquido'
);

-- Tipos de forma de pagamento
CREATE TYPE tipo_forma_pgto AS ENUM ('dinheiro', 'pix', 'cartao_debito', 'cartao_credito', 'boleto', 'transferencia', 'outros');

-- Tipos de conta financeira
CREATE TYPE tipo_conta_financeira AS ENUM ('conta_corrente', 'poupanca', 'caixa', 'investimento');

-- Tipos de conciliação
CREATE TYPE tipo_match AS ENUM ('exato', 'valor', 'aproximado', 'manual', 'ia');

-- =====================================================
-- 2. TABELAS ORGANIZACIONAIS
-- =====================================================

-- Lojas da rede
CREATE TABLE lojas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  codigo TEXT UNIQUE,
  razao_social TEXT,
  cnpj TEXT,
  endereco JSONB DEFAULT '{}',
  telefone TEXT,
  email TEXT,
  responsavel TEXT,
  ativa BOOLEAN DEFAULT TRUE,
  meta_mensal NUMERIC(12,2) DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Usuários do sistema
CREATE TABLE usuarios (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  email TEXT UNIQUE NOT NULL,
  nome TEXT NOT NULL,
  papel papel_usuario NOT NULL DEFAULT 'gerencial',
  loja_ids UUID[] DEFAULT '{}', -- Array de lojas que pode acessar
  ativo BOOLEAN DEFAULT TRUE,
  ultimo_acesso TIMESTAMPTZ,
  configuracoes JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Plano de contas estruturado
CREATE TABLE plano_contas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo TEXT UNIQUE NOT NULL,
  nome TEXT NOT NULL,
  categoria categoria_conta NOT NULL,
  grupo_dre grupo_dre,
  nivel INT NOT NULL DEFAULT 1,
  pai_id UUID REFERENCES plano_contas(id),
  descricao TEXT,
  aceita_lancamento BOOLEAN DEFAULT TRUE,
  ativo BOOLEAN DEFAULT TRUE,
  ordem_exibicao INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Centros de custo
CREATE TABLE centros_custo (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  loja_id UUID NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  codigo TEXT NOT NULL,
  nome TEXT NOT NULL,
  descricao TEXT,
  ativo BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(loja_id, codigo)
);

-- Fornecedores e clientes
CREATE TABLE fornecedores (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  tipo_pessoa TEXT CHECK (tipo_pessoa IN ('fisica', 'juridica')),
  documento TEXT, -- CPF ou CNPJ
  email TEXT,
  telefone TEXT,
  endereco JSONB DEFAULT '{}',
  banco_dados JSONB DEFAULT '{}', -- PIX, contas bancárias, etc
  observacoes TEXT,
  ativo BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- 3. SISTEMA FINANCEIRO
-- =====================================================

-- Contas financeiras (bancos, caixa, etc)
CREATE TABLE contas_financeiras (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  loja_id UUID NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  tipo tipo_conta_financeira NOT NULL,
  banco TEXT,
  agencia TEXT,
  numero TEXT,
  digito TEXT,
  apelido TEXT NOT NULL,
  saldo_inicial NUMERIC(14,2) DEFAULT 0,
  saldo_atual NUMERIC(14,2) DEFAULT 0,
  ativa BOOLEAN DEFAULT TRUE,
  sincronizar_of BOOLEAN DEFAULT FALSE, -- Open Finance
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(loja_id, apelido)
);

-- Formas de pagamento
CREATE TABLE formas_pagamento (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  tipo tipo_forma_pgto NOT NULL,
  taxa NUMERIC(5,4) DEFAULT 0, -- Taxa percentual
  prazo_dias INT DEFAULT 0, -- Prazo para recebimento
  ativa BOOLEAN DEFAULT TRUE,
  configuracoes JSONB DEFAULT '{}', -- Configs específicas (bandeira, etc)
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Lançamentos (cabeçalho das transações)
CREATE TABLE lancamentos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  loja_id UUID NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  tipo tipo_lancamento NOT NULL,
  plano_id UUID NOT NULL REFERENCES plano_contas(id),
  centro_custo_id UUID REFERENCES centros_custo(id),
  fornecedor_id UUID REFERENCES fornecedores(id),
  descricao TEXT NOT NULL,
  historico TEXT, -- Campo histórico original do Yampa
  observacoes TEXT,
  competencia DATE NOT NULL,
  valor_total NUMERIC(14,2) NOT NULL CHECK (valor_total > 0),
  num_parcelas INT NOT NULL DEFAULT 1 CHECK (num_parcelas > 0),
  origem origem_lanc DEFAULT 'manual',
  status_aprovacao status_aprovacao DEFAULT 'aprovado',
  documento_referencia TEXT, -- NF, pedido, etc
  anexos TEXT[] DEFAULT '{}',
  user_id UUID REFERENCES usuarios(id),
  aprovado_por UUID REFERENCES usuarios(id),
  aprovado_em TIMESTAMPTZ,
  metadata JSONB DEFAULT '{}', -- Dados extras da migração
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Parcelas dos lançamentos
CREATE TABLE parcelas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lancamento_id UUID NOT NULL REFERENCES lancamentos(id) ON DELETE CASCADE,
  parcela INT NOT NULL CHECK (parcela > 0),
  vencimento DATE NOT NULL,
  valor NUMERIC(14,2) NOT NULL CHECK (valor > 0),
  juros NUMERIC(14,2) DEFAULT 0,
  desconto NUMERIC(14,2) DEFAULT 0,
  valor_pago NUMERIC(14,2),
  status status_parcela NOT NULL DEFAULT 'previsto',
  data_pagamento DATE,
  forma_pagamento_id UUID REFERENCES formas_pagamento(id),
  conta_id UUID REFERENCES contas_financeiras(id),
  comprovante TEXT,
  observacao TEXT,
  conciliado BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(lancamento_id, parcela)
);

-- =====================================================
-- 4. CONCILIAÇÃO BANCÁRIA
-- =====================================================

-- Extratos bancários importados
CREATE TABLE extratos_bancarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conta_id UUID NOT NULL REFERENCES contas_financeiras(id),
  data_movimento DATE NOT NULL,
  data_valor DATE,
  descricao TEXT NOT NULL,
  documento TEXT,
  valor NUMERIC(14,2) NOT NULL,
  tipo_movimento TEXT, -- Débito/Crédito
  saldo NUMERIC(14,2),
  categoria_banco TEXT,
  hash_linha TEXT UNIQUE NOT NULL, -- Hash para evitar duplicatas
  conciliado BOOLEAN DEFAULT FALSE,
  origem_arquivo TEXT, -- Nome do arquivo importado
  linha_arquivo INT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Conciliações realizadas
CREATE TABLE conciliacoes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  extrato_id UUID NOT NULL REFERENCES extratos_bancarios(id),
  parcela_id UUID NOT NULL REFERENCES parcelas(id),
  valor_conciliado NUMERIC(14,2) NOT NULL,
  diferenca NUMERIC(14,2) DEFAULT 0,
  tipo_match tipo_match NOT NULL,
  confianca NUMERIC(3,2), -- 0.00 a 1.00 para IA
  regra_aplicada TEXT, -- Regra de conciliação usada
  aprovado_por UUID REFERENCES usuarios(id),
  aprovado_em TIMESTAMPTZ,
  observacoes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- 5. AUDITORIA E LOG
-- =====================================================

-- Log de auditoria
CREATE TABLE auditoria (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tabela TEXT NOT NULL,
  operacao TEXT NOT NULL, -- INSERT, UPDATE, DELETE
  registro_id UUID NOT NULL,
  valores_antigos JSONB,
  valores_novos JSONB,
  user_id UUID REFERENCES usuarios(id),
  ip_address INET,
  user_agent TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- =====================================================
-- 6. ÍNDICES PARA PERFORMANCE
-- =====================================================

-- Índices de performance principais
CREATE INDEX idx_lancamentos_loja_competencia ON lancamentos(loja_id, competencia);
CREATE INDEX idx_lancamentos_plano_tipo ON lancamentos(plano_id, tipo);
CREATE INDEX idx_parcelas_vencimento_status ON parcelas(vencimento, status);
CREATE INDEX idx_parcelas_lancamento ON parcelas(lancamento_id);
CREATE INDEX idx_extratos_conta_data ON extratos_bancarios(conta_id, data_movimento);
CREATE INDEX idx_extratos_conciliado ON extratos_bancarios(conciliado) WHERE NOT conciliado;
CREATE INDEX idx_usuarios_papel_ativo ON usuarios(papel, ativo) WHERE ativo;
CREATE INDEX idx_plano_contas_categoria ON plano_contas(categoria, ativo) WHERE ativo;

-- Índices para busca textual
CREATE INDEX idx_lancamentos_descricao_gin ON lancamentos USING gin(to_tsvector('portuguese', descricao));
CREATE INDEX idx_fornecedores_nome_gin ON fornecedores USING gin(to_tsvector('portuguese', nome));

-- =====================================================
-- 7. RLS (ROW LEVEL SECURITY)
-- =====================================================

-- Habilitar RLS em todas as tabelas principais
ALTER TABLE lojas ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE lancamentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE parcelas ENABLE ROW LEVEL SECURITY;
ALTER TABLE extratos_bancarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE contas_financeiras ENABLE ROW LEVEL SECURITY;

-- Políticas RLS para usuários GERENCIAL (apenas sua loja)
CREATE POLICY "gerencial_lojas" ON lojas
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel = 'admin' OR u.papel = 'financeiro' OR id = ANY(u.loja_ids))
    )
  );

-- Políticas RLS para lançamentos
CREATE POLICY "usuarios_lancamentos" ON lancamentos
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel IN ('admin', 'financeiro') OR loja_id = ANY(u.loja_ids))
    )
  );

-- Políticas similares para outras tabelas...
-- (Será expandido conforme necessário)

-- =====================================================
-- 8. TRIGGERS E FUNÇÕES
-- =====================================================

-- Função para atualizar updated_at
CREATE OR REPLACE FUNCTION atualizar_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para updated_at
CREATE TRIGGER tr_lojas_updated_at BEFORE UPDATE ON lojas
  FOR EACH ROW EXECUTE FUNCTION atualizar_updated_at();

CREATE TRIGGER tr_usuarios_updated_at BEFORE UPDATE ON usuarios
  FOR EACH ROW EXECUTE FUNCTION atualizar_updated_at();

CREATE TRIGGER tr_lancamentos_updated_at BEFORE UPDATE ON lancamentos
  FOR EACH ROW EXECUTE FUNCTION atualizar_updated_at();

CREATE TRIGGER tr_parcelas_updated_at BEFORE UPDATE ON parcelas
  FOR EACH ROW EXECUTE FUNCTION atualizar_updated_at();

-- Função de auditoria
CREATE OR REPLACE FUNCTION f_auditoria() 
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO auditoria (
    tabela, operacao, registro_id, valores_antigos, valores_novos, user_id
  ) VALUES (
    TG_TABLE_NAME,
    TG_OP,
    COALESCE(NEW.id, OLD.id),
    CASE WHEN TG_OP != 'INSERT' THEN row_to_json(OLD) END,
    CASE WHEN TG_OP != 'DELETE' THEN row_to_json(NEW) END,
    auth.uid()
  );
  RETURN COALESCE(NEW, OLD);
END;
$$ LANGUAGE plpgsql;

-- Triggers de auditoria
CREATE TRIGGER tr_auditoria_lancamentos AFTER INSERT OR UPDATE OR DELETE ON lancamentos
  FOR EACH ROW EXECUTE FUNCTION f_auditoria();

CREATE TRIGGER tr_auditoria_parcelas AFTER INSERT OR UPDATE OR DELETE ON parcelas
  FOR EACH ROW EXECUTE FUNCTION f_auditoria();

-- =====================================================
-- 9. VIEWS MATERIALIZADAS PARA BI
-- =====================================================

-- DRE consolidado por loja e mês
CREATE MATERIALIZED VIEW mv_dre_mensal AS
SELECT 
  l.loja_id,
  lo.nome as loja_nome,
  DATE_TRUNC('month', l.competencia) as mes_ref,
  pc.grupo_dre,
  pc.categoria,
  SUM(l.valor_total) as valor_total,
  COUNT(*) as qtd_lancamentos
FROM lancamentos l
JOIN plano_contas pc ON l.plano_id = pc.id
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.status_aprovacao = 'aprovado'
GROUP BY l.loja_id, lo.nome, mes_ref, pc.grupo_dre, pc.categoria;

-- Índice da view materializada
CREATE INDEX idx_mv_dre_mensal_loja_mes ON mv_dre_mensal(loja_id, mes_ref);

-- Fluxo de caixa projetado
CREATE MATERIALIZED VIEW mv_fluxo_caixa AS
SELECT 
  p.vencimento as data_ref,
  l.loja_id,
  lo.nome as loja_nome,
  p.status,
  SUM(CASE WHEN l.tipo = 'receber' THEN p.valor ELSE -p.valor END) as valor_liquido,
  SUM(SUM(CASE WHEN l.tipo = 'receber' THEN p.valor ELSE -p.valor END)) 
    OVER (PARTITION BY l.loja_id ORDER BY p.vencimento 
          ROWS UNBOUNDED PRECEDING) as saldo_acumulado
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.status_aprovacao = 'aprovado'
GROUP BY p.vencimento, l.loja_id, lo.nome, p.status;

-- Refresh automático das views (será configurado via pg_cron)
-- SELECT cron.schedule('refresh-dre', '0 2 * * *', 'REFRESH MATERIALIZED VIEW mv_dre_mensal;');
-- SELECT cron.schedule('refresh-fluxo', '0 3 * * *', 'REFRESH MATERIALIZED VIEW mv_fluxo_caixa;');

-- =====================================================
-- COMENTÁRIOS PARA DOCUMENTAÇÃO
-- =====================================================

COMMENT ON TABLE lojas IS 'Lojas da rede de óticas';
COMMENT ON TABLE usuarios IS 'Usuários do sistema com controle de acesso por nível';
COMMENT ON TABLE plano_contas IS 'Plano de contas estruturado para óticas';
COMMENT ON TABLE lancamentos IS 'Lançamentos financeiros (AP/AR)';
COMMENT ON TABLE parcelas IS 'Parcelas dos lançamentos';
COMMENT ON TABLE extratos_bancarios IS 'Extratos bancários importados';
COMMENT ON TABLE conciliacoes IS 'Conciliações automáticas e manuais';

COMMENT ON TYPE papel_usuario IS 'Níveis de acesso: gerencial (1 loja), financeiro (todas), admin (BI)';

-- =====================================================
-- FIM DO SCHEMA
-- =====================================================