# 🎯 SEQUÊNCIA COMPLETA SETUP SUPABASE - BANCO VAZIO

## 📋 **ORDEM DE EXECUÇÃO (SQL Editor)**

Execute essas queries **UMA POR VEZ** no SQL Editor do Supabase, na ordem exata:

---

## **QUERY 1: EXTENSÕES E TIPOS BÁSICOS**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 1: EXTENSÕES E TIPOS
-- =====================================================

-- Extensões necessárias
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Tipos enumerados
CREATE TYPE papel_usuario AS ENUM ('gerencial', 'financeiro', 'admin');
CREATE TYPE tipo_lancamento AS ENUM ('receber', 'pagar');
CREATE TYPE status_parcela AS ENUM ('previsto', 'vencido', 'pago', 'parcial', 'cancelado');
CREATE TYPE origem_lanc AS ENUM ('manual', 'import_csv', 'api', 'conciliacao', 'sistema', 'migracao_yampa');
CREATE TYPE status_aprovacao AS ENUM ('pendente', 'aprovado', 'rejeitado');
CREATE TYPE categoria_conta AS ENUM ('receita', 'custo', 'despesa', 'investimento', 'outros');
CREATE TYPE grupo_dre AS ENUM (
  'receita_bruta', 
  'deducoes_vendas', 
  'receita_liquida', 
  'cmv', 
  'lucro_bruto', 
  'despesas_operacionais', 
  'resultado_operacional', 
  'resultado_financeiro', 
  'resultado_liquido',
  'outros'
);
CREATE TYPE tipo_forma_pgto AS ENUM ('dinheiro', 'pix', 'cartao_debito', 'cartao_credito', 'boleto', 'transferencia', 'outros');
CREATE TYPE tipo_conta_financeira AS ENUM ('conta_corrente', 'poupanca', 'caixa', 'investimento');
CREATE TYPE tipo_match AS ENUM ('exato', 'valor', 'aproximado', 'manual', 'ia');

SELECT 'STEP 1 COMPLETO: Extensões e tipos criados' as status;
```

---

## **QUERY 2: TABELAS ORGANIZACIONAIS**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 2: TABELAS ORGANIZACIONAIS
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
  loja_ids UUID[] DEFAULT '{}',
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
  documento TEXT,
  email TEXT,
  telefone TEXT,
  endereco JSONB DEFAULT '{}',
  banco_dados JSONB DEFAULT '{}',
  observacoes TEXT,
  ativo BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

SELECT 'STEP 2 COMPLETO: Tabelas organizacionais criadas' as status;
```

---

## **QUERY 3: SISTEMA FINANCEIRO**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 3: SISTEMA FINANCEIRO
-- =====================================================

-- Contas financeiras
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
  sincronizar_of BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(loja_id, apelido)
);

-- Formas de pagamento
CREATE TABLE formas_pagamento (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  tipo tipo_forma_pgto NOT NULL,
  taxa NUMERIC(5,4) DEFAULT 0,
  prazo_dias INT DEFAULT 0,
  ativa BOOLEAN DEFAULT TRUE,
  configuracoes JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Lançamentos (cabeçalho)
CREATE TABLE lancamentos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  loja_id UUID NOT NULL REFERENCES lojas(id) ON DELETE CASCADE,
  tipo tipo_lancamento NOT NULL,
  plano_id UUID NOT NULL REFERENCES plano_contas(id),
  centro_custo_id UUID REFERENCES centros_custo(id),
  fornecedor_id UUID REFERENCES fornecedores(id),
  descricao TEXT NOT NULL,
  historico TEXT,
  observacoes TEXT,
  competencia DATE NOT NULL,
  valor_total NUMERIC(14,2) NOT NULL CHECK (valor_total > 0),
  num_parcelas INT NOT NULL DEFAULT 1 CHECK (num_parcelas > 0),
  origem origem_lanc DEFAULT 'manual',
  status_aprovacao status_aprovacao DEFAULT 'aprovado',
  documento_referencia TEXT,
  anexos TEXT[] DEFAULT '{}',
  user_id UUID REFERENCES usuarios(id),
  aprovado_por UUID REFERENCES usuarios(id),
  aprovado_em TIMESTAMPTZ,
  metadata JSONB DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Parcelas
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

SELECT 'STEP 3 COMPLETO: Sistema financeiro criado' as status;
```

---

## **QUERY 4: CONCILIAÇÃO E AUDITORIA**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 4: CONCILIAÇÃO E AUDITORIA
-- =====================================================

-- Extratos bancários
CREATE TABLE extratos_bancarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conta_id UUID NOT NULL REFERENCES contas_financeiras(id),
  data_movimento DATE NOT NULL,
  data_valor DATE,
  descricao TEXT NOT NULL,
  documento TEXT,
  valor NUMERIC(14,2) NOT NULL,
  tipo_movimento TEXT,
  saldo NUMERIC(14,2),
  categoria_banco TEXT,
  hash_linha TEXT UNIQUE NOT NULL,
  conciliado BOOLEAN DEFAULT FALSE,
  origem_arquivo TEXT,
  linha_arquivo INT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Conciliações
CREATE TABLE conciliacoes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  extrato_id UUID NOT NULL REFERENCES extratos_bancarios(id),
  parcela_id UUID NOT NULL REFERENCES parcelas(id),
  valor_conciliado NUMERIC(14,2) NOT NULL,
  diferenca NUMERIC(14,2) DEFAULT 0,
  tipo_match tipo_match NOT NULL,
  confianca NUMERIC(3,2),
  regra_aplicada TEXT,
  aprovado_por UUID REFERENCES usuarios(id),
  aprovado_em TIMESTAMPTZ,
  observacoes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Auditoria
CREATE TABLE auditoria (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  tabela TEXT NOT NULL,
  operacao TEXT NOT NULL,
  registro_id UUID NOT NULL,
  valores_antigos JSONB,
  valores_novos JSONB,
  user_id UUID REFERENCES usuarios(id),
  ip_address INET,
  user_agent TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

SELECT 'STEP 4 COMPLETO: Conciliação e auditoria criadas' as status;
```

---

## **QUERY 5: ÍNDICES E PERFORMANCE**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 5: ÍNDICES E PERFORMANCE
-- =====================================================

-- Índices principais
CREATE INDEX idx_lancamentos_loja_competencia ON lancamentos(loja_id, competencia);
CREATE INDEX idx_lancamentos_plano_tipo ON lancamentos(plano_id, tipo);
CREATE INDEX idx_lancamentos_origem ON lancamentos(origem);
CREATE INDEX idx_parcelas_vencimento_status ON parcelas(vencimento, status);
CREATE INDEX idx_parcelas_lancamento ON parcelas(lancamento_id);
CREATE INDEX idx_extratos_conta_data ON extratos_bancarios(conta_id, data_movimento);
CREATE INDEX idx_extratos_conciliado ON extratos_bancarios(conciliado) WHERE NOT conciliado;
CREATE INDEX idx_usuarios_papel_ativo ON usuarios(papel, ativo) WHERE ativo;
CREATE INDEX idx_plano_contas_categoria ON plano_contas(categoria, ativo) WHERE ativo;
CREATE INDEX idx_contas_financeiras_loja ON contas_financeiras(loja_id, ativa) WHERE ativa;

-- Índices para busca textual
CREATE INDEX idx_lancamentos_descricao_gin ON lancamentos USING gin(to_tsvector('portuguese', descricao));
CREATE INDEX idx_fornecedores_nome_gin ON fornecedores USING gin(to_tsvector('portuguese', nome));

-- Índices para JSON
CREATE INDEX idx_lancamentos_metadata_gin ON lancamentos USING gin(metadata);
CREATE INDEX idx_usuarios_configuracoes_gin ON usuarios USING gin(configuracoes);

SELECT 'STEP 5 COMPLETO: Índices criados' as status;
```

---

## **QUERY 6: RLS (ROW LEVEL SECURITY)**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 6: ROW LEVEL SECURITY
-- =====================================================

-- Habilitar RLS
ALTER TABLE lojas ENABLE ROW LEVEL SECURITY;
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE lancamentos ENABLE ROW LEVEL SECURITY;
ALTER TABLE parcelas ENABLE ROW LEVEL SECURITY;
ALTER TABLE extratos_bancarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE contas_financeiras ENABLE ROW LEVEL SECURITY;
ALTER TABLE centros_custo ENABLE ROW LEVEL SECURITY;

-- Política para lojas (gerencial vê só suas lojas, financeiro/admin veem todas)
CREATE POLICY "usuarios_podem_ver_suas_lojas" ON lojas
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel IN ('admin', 'financeiro') OR id = ANY(u.loja_ids))
    )
  );

-- Política para lançamentos
CREATE POLICY "usuarios_podem_ver_lancamentos_das_suas_lojas" ON lancamentos
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel IN ('admin', 'financeiro') OR loja_id = ANY(u.loja_ids))
    )
  );

-- Política para parcelas (via lançamentos)
CREATE POLICY "usuarios_podem_ver_parcelas_dos_seus_lancamentos" ON parcelas
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM lancamentos l
      JOIN usuarios u ON u.id = auth.uid()
      WHERE l.id = parcelas.lancamento_id
      AND (u.papel IN ('admin', 'financeiro') OR l.loja_id = ANY(u.loja_ids))
    )
  );

-- Política para contas financeiras
CREATE POLICY "usuarios_podem_ver_contas_das_suas_lojas" ON contas_financeiras
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel IN ('admin', 'financeiro') OR loja_id = ANY(u.loja_ids))
    )
  );

-- Política para centros de custo
CREATE POLICY "usuarios_podem_ver_centros_das_suas_lojas" ON centros_custo
  FOR ALL TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios u 
      WHERE u.id = auth.uid() 
      AND (u.papel IN ('admin', 'financeiro') OR loja_id = ANY(u.loja_ids))
    )
  );

SELECT 'STEP 6 COMPLETO: RLS policies criadas' as status;
```

---

## **QUERY 7: TRIGGERS E FUNÇÕES**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 7: TRIGGERS E FUNÇÕES
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

CREATE TRIGGER tr_fornecedores_updated_at BEFORE UPDATE ON fornecedores
  FOR EACH ROW EXECUTE FUNCTION atualizar_updated_at();

CREATE TRIGGER tr_contas_financeiras_updated_at BEFORE UPDATE ON contas_financeiras
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

-- Triggers de auditoria para tabelas críticas
CREATE TRIGGER tr_auditoria_lancamentos AFTER INSERT OR UPDATE OR DELETE ON lancamentos
  FOR EACH ROW EXECUTE FUNCTION f_auditoria();

CREATE TRIGGER tr_auditoria_parcelas AFTER INSERT OR UPDATE OR DELETE ON parcelas
  FOR EACH ROW EXECUTE FUNCTION f_auditoria();

SELECT 'STEP 7 COMPLETO: Triggers e funções criadas' as status;
```

---

## **QUERY 8: VIEWS MATERIALIZADAS PARA BI**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 8: VIEWS MATERIALIZADAS
-- =====================================================

-- DRE consolidado
CREATE MATERIALIZED VIEW mv_dre_mensal AS
SELECT 
  l.loja_id,
  lo.nome as loja_nome,
  DATE_TRUNC('month', l.competencia) as mes_ref,
  pc.grupo_dre,
  pc.categoria,
  SUM(CASE WHEN l.tipo = 'receber' THEN l.valor_total ELSE -l.valor_total END) as valor_total,
  COUNT(*) as qtd_lancamentos
FROM lancamentos l
JOIN plano_contas pc ON l.plano_id = pc.id
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.status_aprovacao = 'aprovado'
GROUP BY l.loja_id, lo.nome, mes_ref, pc.grupo_dre, pc.categoria;

CREATE INDEX idx_mv_dre_mensal_loja_mes ON mv_dre_mensal(loja_id, mes_ref);

-- Fluxo de caixa
CREATE MATERIALIZED VIEW mv_fluxo_caixa AS
SELECT 
  p.vencimento as data_ref,
  l.loja_id,
  lo.nome as loja_nome,
  l.tipo,
  p.status,
  SUM(CASE WHEN l.tipo = 'receber' THEN p.valor ELSE -p.valor END) as valor_liquido,
  SUM(SUM(CASE WHEN l.tipo = 'receber' THEN p.valor ELSE -p.valor END)) 
    OVER (PARTITION BY l.loja_id ORDER BY p.vencimento 
          ROWS UNBOUNDED PRECEDING) as saldo_acumulado
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
JOIN lojas lo ON l.loja_id = lo.id
WHERE l.status_aprovacao = 'aprovado'
GROUP BY p.vencimento, l.loja_id, lo.nome, l.tipo, p.status;

CREATE INDEX idx_mv_fluxo_caixa_loja_data ON mv_fluxo_caixa(loja_id, data_ref);

SELECT 'STEP 8 COMPLETO: Views BI criadas' as status;
```

---

## **QUERY 9: DADOS INICIAIS (SEEDS)**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 9: DADOS INICIAIS (SEEDS)
-- =====================================================

-- LOJAS DA REDE (baseado na análise Yampa)
INSERT INTO lojas (nome, codigo, razao_social, cnpj, ativa, meta_mensal) VALUES
('Escritório', 'ESC', 'Mellooticas LTDA', '12.345.678/0001-00', true, 0.00),
('Loja Suzano', 'SUZ', 'Mellooticas Suzano LTDA', '12.345.678/0002-00', true, 120000.00),
('Loja Mauá', 'MAU', 'Mellooticas Mauá LTDA', '12.345.678/0003-00', true, 100000.00),
('Loja Rio Pequeno', 'RIO', 'Mellooticas Rio Pequeno LTDA', '12.345.678/0004-00', true, 95000.00),
('Loja Suzano II', 'SU2', 'Mellooticas Suzano II LTDA', '12.345.678/0005-00', true, 85000.00),
('Loja São Mateus', 'SMT', 'Mellooticas São Mateus LTDA', '12.345.678/0006-00', true, 90000.00),
('Loja Perus', 'PER', 'Mellooticas Perus LTDA', '12.345.678/0007-00', true, 80000.00);

-- FORMAS DE PAGAMENTO (baseado na análise Yampa)
INSERT INTO formas_pagamento (nome, tipo, taxa, prazo_dias, ativa) VALUES
('PIX', 'pix', 0.0000, 0, true),
('Dinheiro', 'dinheiro', 0.0000, 0, true),
('Boleto Bancário', 'boleto', 0.0150, 1, true),
('Cartão Débito à Vista', 'cartao_debito', 0.0299, 1, true),
('Cartão Crédito à Vista', 'cartao_credito', 0.0349, 30, true),
('Cartão Crédito Parcelado', 'cartao_credito', 0.0399, 30, true),
('Transferência Bancária', 'transferencia', 0.0000, 1, true);

-- PLANO DE CONTAS ESTRUTURADO (baseado no Yampa + melhorias)
INSERT INTO plano_contas (codigo, nome, categoria, grupo_dre, nivel, aceita_lancamento, ordem_exibicao) VALUES
-- RECEITAS (Classe 3)
('3', 'RECEITAS', 'receita', 'receita_bruta', 1, false, 100),
('3.1', 'Receitas de Vendas', 'receita', 'receita_bruta', 2, false, 101),
('3.1.1', 'Vendas em Dinheiro', 'receita', 'receita_bruta', 3, true, 102),
('3.1.2', 'Vendas Cartões de Débito', 'receita', 'receita_bruta', 3, true, 103),
('3.1.3', 'Vendas Cartões de Crédito', 'receita', 'receita_bruta', 3, true, 104),
('3.1.4', 'Vendas Cartões Parceladas', 'receita', 'receita_bruta', 3, true, 105),
('3.1.5', 'Vendas Cheques', 'receita', 'receita_bruta', 3, true, 106),
('3.1.6', 'Vendas Crediário', 'receita', 'receita_bruta', 3, true, 107),
('3.1.7', 'Vendas Convênios', 'receita', 'receita_bruta', 3, true, 108),
('3.1.8', 'Vendas PIX', 'receita', 'receita_bruta', 3, true, 109),
('3.1.10', 'Pagamento de Festas', 'receita', 'receita_bruta', 3, true, 110),
('3.2', 'Outras Receitas', 'receita', 'receita_bruta', 2, false, 111),
('3.2.1', 'Receitas de Serviços', 'receita', 'receita_bruta', 3, true, 112),
('3.2.2', 'Receitas Financeiras', 'receita', 'resultado_financeiro', 3, true, 113),

-- CUSTOS VARIÁVEIS (Classe 4)
('4', 'CUSTOS VARIÁVEIS', 'custo', 'cmv', 1, false, 200),
('4.1', 'Impostos sobre Vendas', 'custo', 'deducoes_vendas', 2, false, 201),
('4.1.1', 'Simples Nacional', 'custo', 'deducoes_vendas', 3, true, 202),
('4.1.2', 'ICMS', 'custo', 'deducoes_vendas', 3, true, 203),
('4.1.3', 'PIS', 'custo', 'deducoes_vendas', 3, true, 204),
('4.1.4', 'COFINS', 'custo', 'deducoes_vendas', 3, true, 205),
('4.2', 'Custo dos Produtos Vendidos', 'custo', 'cmv', 2, false, 206),
('4.2.1', 'Fornecedores de Armações', 'custo', 'cmv', 3, true, 207),
('4.2.2', 'Fornecedores de Lentes', 'custo', 'cmv', 3, true, 208),
('4.2.3', 'Fornecedores de Lentes de Contato', 'custo', 'cmv', 3, true, 209),
('4.2.4', 'Fornecedores de Acessórios', 'custo', 'cmv', 3, true, 210),
('4.3', 'Comissões sobre Vendas', 'custo', 'cmv', 2, false, 211),
('4.3.1', 'Comissões Vendedores', 'custo', 'cmv', 3, true, 212),
('4.3.2', 'Comissões Gerentes', 'custo', 'cmv', 3, true, 213),
('4.4', 'Custos Operacionais', 'custo', 'cmv', 2, false, 214),
('4.4.1', 'Frete de Compras', 'custo', 'cmv', 3, true, 215),
('4.4.2', 'Embalagens', 'custo', 'cmv', 3, true, 216),
('4.4.3', 'Gastos com Médicos', 'custo', 'cmv', 3, true, 217),
('4.4.4', 'Montagem de Óculos', 'custo', 'cmv', 3, true, 218),
('4.7', 'Taxas e Franquias', 'custo', 'cmv', 2, false, 219),
('4.7.1', 'Pagamento Franquia', 'custo', 'cmv', 3, true, 220),

-- DESPESAS OPERACIONAIS (Classe 5)
('5', 'DESPESAS OPERACIONAIS', 'despesa', 'despesas_operacionais', 1, false, 300),
('5.1', 'Despesas Administrativas', 'despesa', 'despesas_operacionais', 2, false, 301),
('5.1.1', 'Material de Escritório', 'despesa', 'despesas_operacionais', 3, true, 302),
('5.1.2', 'Telefone e Internet', 'despesa', 'despesas_operacionais', 3, true, 303),
('5.1.3', 'Correios e Sedex', 'despesa', 'despesas_operacionais', 3, true, 304),
('5.1.4', 'Software e Licenças', 'despesa', 'despesas_operacionais', 3, true, 305),
('5.1.5', 'Contabilidade', 'despesa', 'despesas_operacionais', 3, true, 306),
('5.2', 'Despesas Comerciais', 'despesa', 'despesas_operacionais', 2, false, 307),
('5.2.1', 'Marketing e Publicidade', 'despesa', 'despesas_operacionais', 3, true, 308),
('5.2.2', 'Brindes e Amostras', 'despesa', 'despesas_operacionais', 3, true, 309),
('5.2.3', 'Viagens e Hospedagens', 'despesa', 'despesas_operacionais', 3, true, 310),
('5.2.4', 'Aluguel e Condomínio', 'despesa', 'despesas_operacionais', 3, true, 311),
('5.2.5', 'Energia Elétrica', 'despesa', 'despesas_operacionais', 3, true, 312),
('5.2.6', 'Água e Esgoto', 'despesa', 'despesas_operacionais', 3, true, 313),
('5.2.7', 'Limpeza e Conservação', 'despesa', 'despesas_operacionais', 3, true, 314),
('5.2.8', 'Almoço / Supermercado / Lanches', 'despesa', 'despesas_operacionais', 3, true, 315),
('5.2.21', 'Pagamento Cartão de Crédito', 'despesa', 'despesas_operacionais', 3, true, 316),
('5.3', 'Despesas com Pessoal', 'despesa', 'despesas_operacionais', 2, false, 317),
('5.3.1', 'Salário de Funcionários', 'despesa', 'despesas_operacionais', 3, true, 318),
('5.3.2', 'Encargos Sociais', 'despesa', 'despesas_operacionais', 3, true, 319),
('5.3.3', 'Vale Transporte e Refeição', 'despesa', 'despesas_operacionais', 3, true, 320),
('5.3.4', 'Plano de Saúde', 'despesa', 'despesas_operacionais', 3, true, 321),
('5.3.5', 'Treinamentos', 'despesa', 'despesas_operacionais', 3, true, 322),
('5.3.9', 'Pró-labore', 'despesa', 'despesas_operacionais', 3, true, 323),
('5.3.13', 'Vale Adiantamento', 'despesa', 'despesas_operacionais', 3, true, 324),

-- INVESTIMENTOS (Classe 6)
('6', 'INVESTIMENTOS', 'investimento', 'outros', 1, false, 400),
('6.1', 'Móveis e Utensílios', 'investimento', 'outros', 2, true, 401),
('6.2', 'Equipamentos de Informática', 'investimento', 'outros', 2, true, 402),
('6.3', 'Reformas e Benfeitorias', 'investimento', 'outros', 2, true, 403),
('6.4', 'Veículos', 'investimento', 'outros', 2, true, 404),

-- MOVIMENTAÇÕES NÃO OPERACIONAIS (Classe 7)
('7', 'MOVIMENTAÇÕES NÃO OPERACIONAIS', 'outros', 'resultado_financeiro', 1, false, 500),
('7.1', 'Entradas Não Operacionais', 'receita', 'resultado_financeiro', 2, false, 501),
('7.1.1', 'Empréstimos Obtidos', 'receita', 'resultado_financeiro', 3, true, 502),
('7.2', 'Saídas Não Operacionais', 'despesa', 'resultado_financeiro', 2, false, 503),
('7.2.1', 'Pagamento de Empréstimos', 'despesa', 'resultado_financeiro', 3, true, 504),

-- OUTRAS CONTAS
('13', 'CONTAS ESPECIAIS', 'outros', 'outros', 1, false, 900),
('13.99', 'Saldo Inicial Padrão Yampa', 'outros', 'outros', 2, true, 901);

-- Atualizar referências pai no plano de contas
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3') WHERE codigo LIKE '3.%' AND codigo != '3';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3.1') WHERE codigo LIKE '3.1.%' AND codigo != '3.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '3.2') WHERE codigo LIKE '3.2.%' AND codigo != '3.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4') WHERE codigo LIKE '4.%' AND codigo != '4';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.1') WHERE codigo LIKE '4.1.%' AND codigo != '4.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.2') WHERE codigo LIKE '4.2.%' AND codigo != '4.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.3') WHERE codigo LIKE '4.3.%' AND codigo != '4.3';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.4') WHERE codigo LIKE '4.4.%' AND codigo != '4.4';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '4.7') WHERE codigo LIKE '4.7.%' AND codigo != '4.7';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5') WHERE codigo LIKE '5.%' AND codigo != '5';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.1') WHERE codigo LIKE '5.1.%' AND codigo != '5.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.2') WHERE codigo LIKE '5.2.%' AND codigo != '5.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '5.3') WHERE codigo LIKE '5.3.%' AND codigo != '5.3';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '6') WHERE codigo LIKE '6.%' AND codigo != '6';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7') WHERE codigo LIKE '7.%' AND codigo != '7';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7.1') WHERE codigo LIKE '7.1.%' AND codigo != '7.1';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '7.2') WHERE codigo LIKE '7.2.%' AND codigo != '7.2';
UPDATE plano_contas SET pai_id = (SELECT id FROM plano_contas WHERE codigo = '13') WHERE codigo LIKE '13.%' AND codigo != '13';

-- CENTROS DE CUSTO POR LOJA
INSERT INTO centros_custo (loja_id, codigo, nome, descricao)
SELECT 
  l.id,
  'VND',
  'Vendas',
  'Centro de vendas da loja'
FROM lojas l;

INSERT INTO centros_custo (loja_id, codigo, nome, descricao)
SELECT 
  l.id,
  'OPE',
  'Operacional',
  'Operações da loja'
FROM lojas l;

-- FORNECEDORES PRINCIPAIS (baseado na análise Yampa)
INSERT INTO fornecedores (nome, tipo_pessoa, documento, ativo) VALUES
('SOLÓTICA - Lentes de Contato', 'juridica', '65.532.707/0001-94', true),
('FAST COMPANY ARMAÇÕES E LENTES LTDA', 'juridica', NULL, true),
('KONSEP CONTABILIDADE E CONSULTORIA LTDA', 'juridica', NULL, true),
('EDP BANDEIRANTES', 'juridica', NULL, true),
('CLARO NET', 'juridica', NULL, true),
('Restaurante Japallu', 'juridica', NULL, true),
('Padaria Renascer', 'juridica', NULL, true),
('Liris Ichie - Confeitaria', 'juridica', NULL, true),
('iFood', 'juridica', NULL, true),
('Uber', 'juridica', NULL, true),
('Softpel', 'juridica', NULL, true),
('Giovanna Mello de Camargo', 'fisica', NULL, true);

-- CONTAS FINANCEIRAS PARA CADA LOJA
INSERT INTO contas_financeiras (loja_id, tipo, banco, apelido, saldo_inicial, ativa) 
SELECT 
  l.id as loja_id,
  'conta_corrente'::tipo_conta_financeira,
  'Banco do Brasil',
  l.nome || ' - CC BB',
  0,
  true
FROM lojas l;

INSERT INTO contas_financeiras (loja_id, tipo, banco, apelido, saldo_inicial, ativa) 
SELECT 
  l.id as loja_id,
  'caixa'::tipo_conta_financeira,
  NULL,
  l.nome || ' - Caixa',
  0,
  true
FROM lojas l;

-- Refresh das views materializadas
REFRESH MATERIALIZED VIEW mv_dre_mensal;
REFRESH MATERIALIZED VIEW mv_fluxo_caixa;

SELECT 'STEP 9 COMPLETO: Seeds inseridos com sucesso' as status;
```

---

## **QUERY 10: VALIDAÇÃO FINAL**

```sql
-- =====================================================
-- PULSO FINANCE - STEP 10: VALIDAÇÃO FINAL
-- =====================================================

-- Resumo dos dados inseridos
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

| tabela              | total |
| ------------------- | ----- |
| Centros de Custo    | 14    |
| Contas Financeiras  | 14    |
| Formas de Pagamento | 7     |
| Fornecedores        | 12    |
| Lojas               | 7     |
| Plano de Contas     | 72    |

-- Verificar RLS habilitado
SELECT 
  tablename,
  rowsecurity as rls_habilitado
FROM pg_tables 
WHERE schemaname = 'public' 
  AND tablename IN ('lojas', 'usuarios', 'lancamentos', 'parcelas', 'contas_financeiras')
ORDER BY tablename;

| tablename          | rls_habilitado |
| ------------------ | -------------- |
| contas_financeiras | true           |
| lancamentos        | true           |
| lojas              | true           |
| parcelas           | true           |
| usuarios           | true           |

-- Teste funcional básico
DO $$
DECLARE
  loja_teste_id UUID;
  plano_teste_id UUID;
  centro_teste_id UUID;
  lancamento_teste_id UUID;
BEGIN
  -- Buscar IDs para teste
  SELECT id INTO loja_teste_id FROM lojas WHERE codigo = 'SUZ' LIMIT 1;
  SELECT id INTO plano_teste_id FROM plano_contas WHERE codigo = '3.1.1' LIMIT 1;
  SELECT id INTO centro_teste_id FROM centros_custo WHERE loja_id = loja_teste_id LIMIT 1;
  
  -- Inserir lançamento de teste
  INSERT INTO lancamentos (
    loja_id, tipo, plano_id, centro_custo_id,
    descricao, competencia, valor_total, num_parcelas
  ) VALUES (
    loja_teste_id, 'receber', plano_teste_id, centro_teste_id,
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

-- Relatório final
SELECT 
  '🎉 BANCO PULSO FINANCE CRIADO COM SUCESSO!' as status,
  'Todas as validações passaram' as resultado,
  'Pronto para desenvolvimento do frontend Next.js 15' as proximo_passo;

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

SELECT 'SETUP COMPLETO: Execute as 10 queries em sequência no SQL Editor' as instrucao;
```

---

## ✅ **INSTRUÇÕES DE EXECUÇÃO**

1. **Acesse** [dashboard.supabase.com](https://dashboard.supabase.com)
2. **Crie** novo projeto: `pulso-finance-prod`
3. **Vá** para SQL Editor
4. **Execute** as 10 queries **UMA POR VEZ** na ordem exata
5. **Aguarde** cada query terminar antes da próxima
6. **Verifique** os resultados de cada step

**Após executar todas as queries, você terá um banco completo e pronto para produção!** 🚀