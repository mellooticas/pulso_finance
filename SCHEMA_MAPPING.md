# 🗄️ MAPEAMENTO SCHEMA PULSO FINANCE

## 📊 ANÁLISE DOS DADOS YAMPA

### Dados Processados:
- **47.064 transações** (27.134 atuais + 19.930 antigas)
- **147 contas** no plano de contas
- **9 centros de custo** identificados (lojas + escritório)
- **8 formas de pagamento** principais

## 🏗️ ESTRUTURA DO BANCO PROPOSTA

### 1. TABELAS ORGANIZACIONAIS

#### `lojas`
```sql
CREATE TABLE lojas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  codigo TEXT UNIQUE,
  razao_social TEXT,
  cnpj TEXT,
  endereco JSONB,
  ativa BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

**Dados a migrar:**
- Loja Suzano
- Loja Mauá  
- Loja Rio Pequeno
- Loja Suzano II
- Loja São Mateus
- Loja Perus
- Escritório (centro administrativo)

#### `usuarios`
```sql
CREATE TABLE usuarios (
  id UUID PRIMARY KEY, -- auth.users.id
  email TEXT UNIQUE NOT NULL,
  nome TEXT NOT NULL,
  papel papel_usuario NOT NULL DEFAULT 'gerencial',
  loja_ids UUID[] DEFAULT '{}', -- RLS multi-tenant
  ativo BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TYPE papel_usuario AS ENUM ('gerencial', 'financeiro', 'admin');
```

**Níveis de Acesso:**
- **GERENCIAL**: acesso apenas à sua loja
- **FINANCEIRO**: acesso a todas as lojas, KPIs operacionais
- **ADMIN**: BI completo, analytics avançados

### 2. PLANO DE CONTAS NORMALIZADO

#### `plano_contas`
```sql
CREATE TABLE plano_contas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  codigo TEXT UNIQUE NOT NULL,
  nome TEXT NOT NULL,
  categoria categoria_conta NOT NULL,
  grupo_dre grupo_dre,
  nivel INT NOT NULL,
  pai_id UUID REFERENCES plano_contas(id),
  ativo BOOLEAN DEFAULT TRUE
);

CREATE TYPE categoria_conta AS ENUM ('receita', 'custo', 'despesa', 'outros');
CREATE TYPE grupo_dre AS ENUM ('receita_bruta', 'deducoes', 'receita_liquida', 'cmv', 'lucro_bruto', 'despesas_operacionais', 'resultado_operacional', 'resultado_financeiro', 'resultado_liquido');
```

**Mapeamento dos dados Yampa:**
- `3.x.x` → Receitas
- `4.x.x` → Custos 
- `5.x.x` → Despesas
- `6.x.x` → Investimentos
- `7.x.x` → Movimentações não operacionais

### 3. TRANSAÇÕES FINANCEIRAS

#### `lancamentos` (cabeçalho)
```sql
CREATE TABLE lancamentos (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  loja_id UUID NOT NULL REFERENCES lojas(id),
  tipo tipo_lancamento NOT NULL,
  plano_id UUID NOT NULL REFERENCES plano_contas(id),
  centro_custo_id UUID REFERENCES centros_custo(id),
  fornecedor_id UUID REFERENCES fornecedores(id),
  descricao TEXT NOT NULL,
  historico TEXT,
  competencia DATE NOT NULL,
  valor_total NUMERIC(14,2) NOT NULL,
  num_parcelas INT DEFAULT 1,
  origem origem_lanc DEFAULT 'migração_yampa',
  status_aprovacao status_aprovacao DEFAULT 'aprovado',
  user_id UUID,
  aprovado_por UUID,
  aprovado_em TIMESTAMPTZ,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TYPE tipo_lancamento AS ENUM ('receber', 'pagar');
CREATE TYPE origem_lanc AS ENUM ('manual', 'migração_yampa', 'import_csv', 'api', 'conciliacao');
CREATE TYPE status_aprovacao AS ENUM ('pendente', 'aprovado', 'rejeitado');
```

#### `parcelas` (detalhe)
```sql
CREATE TABLE parcelas (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  lancamento_id UUID NOT NULL REFERENCES lancamentos(id) ON DELETE CASCADE,
  parcela INT NOT NULL,
  vencimento DATE NOT NULL,
  valor NUMERIC(14,2) NOT NULL,
  valor_pago NUMERIC(14,2),
  status status_parcela NOT NULL DEFAULT 'previsto',
  data_pagamento DATE,
  forma_pagamento_id UUID REFERENCES formas_pagamento(id),
  conta_id UUID REFERENCES contas_financeiras(id),
  comprovante TEXT,
  observacao TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TYPE status_parcela AS ENUM ('previsto', 'vencido', 'pago', 'parcial', 'cancelado');
```

### 4. FORMAS DE PAGAMENTO

#### `formas_pagamento`
```sql
CREATE TABLE formas_pagamento (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nome TEXT NOT NULL,
  tipo tipo_forma_pgto NOT NULL,
  taxa NUMERIC(5,4) DEFAULT 0,
  prazo_dias INT DEFAULT 0,
  ativa BOOLEAN DEFAULT TRUE
);

CREATE TYPE tipo_forma_pgto AS ENUM ('dinheiro', 'pix', 'cartao_debito', 'cartao_credito', 'boleto', 'transferencia');
```

**Dados a migrar:**
- PIX (49.7% dos pagamentos atuais)
- Boleto (19.7%)
- Dinheiro (10.7%)
- Cartão débito/crédito
- Transferência

### 5. CONCILIAÇÃO BANCÁRIA

#### `extratos_bancarios`
```sql
CREATE TABLE extratos_bancarios (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  conta_id UUID NOT NULL REFERENCES contas_financeiras(id),
  data_movimento DATE NOT NULL,
  descricao TEXT NOT NULL,
  documento TEXT,
  valor NUMERIC(14,2) NOT NULL,
  saldo NUMERIC(14,2),
  hash_linha TEXT UNIQUE NOT NULL, -- evita duplicatas
  conciliado BOOLEAN DEFAULT FALSE,
  parcela_id UUID REFERENCES parcelas(id),
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

#### `conciliacoes`
```sql
CREATE TABLE conciliacoes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  extrato_id UUID NOT NULL REFERENCES extratos_bancarios(id),
  parcela_id UUID NOT NULL REFERENCES parcelas(id),
  valor_conciliado NUMERIC(14,2) NOT NULL,
  diferenca NUMERIC(14,2) DEFAULT 0,
  tipo_match tipo_match NOT NULL,
  confianca NUMERIC(3,2), -- 0.00 a 1.00 para IA
  aprovado_por UUID REFERENCES usuarios(id),
  aprovado_em TIMESTAMPTZ,
  observacoes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TYPE tipo_match AS ENUM ('exato', 'valor', 'aproximado', 'manual', 'ia');
```

## 🔄 PROCESSO DE MIGRAÇÃO

### Fase 1: Estrutura Base
1. Criar lojas (6 + escritório)
2. Configurar plano de contas (147 contas)
3. Criar usuários com níveis de acesso
4. Configurar formas de pagamento

### Fase 2: Migração Transações
1. **Dados Antigos (2020-2022)**: 19.930 registros
   - Estrutura mais simples
   - Mapeamento direto das categorias
   
2. **Dados Atuais (2022-2025)**: 27.134 registros
   - Estrutura detalhada
   - Centros de custo definidos
   - Formas de pagamento específicas

### Fase 3: Inteligência
1. Motor de conciliação híbrido
2. Regras de pareamento automático
3. IA para casos complexos

## 📊 VIEWS MATERIALIZADAS PARA BI

### `mv_dre_consolidado`
```sql
CREATE MATERIALIZED VIEW mv_dre_consolidado AS
SELECT 
  loja_id,
  DATE_TRUNC('month', competencia) as mes,
  grupo_dre,
  SUM(valor_total) as valor,
  COUNT(*) as qtd_lancamentos
FROM lancamentos l
JOIN plano_contas p ON l.plano_id = p.id
WHERE status_aprovacao = 'aprovado'
GROUP BY loja_id, mes, grupo_dre;
```

### `mv_fluxo_caixa`
```sql
CREATE MATERIALIZED VIEW mv_fluxo_caixa AS
SELECT 
  loja_id,
  vencimento,
  status,
  SUM(CASE WHEN tipo = 'receber' THEN valor ELSE -valor END) as saldo_dia,
  SUM(SUM(CASE WHEN tipo = 'receber' THEN valor ELSE -valor END)) 
    OVER (PARTITION BY loja_id ORDER BY vencimento) as saldo_acumulado
FROM parcelas p
JOIN lancamentos l ON p.lancamento_id = l.id
GROUP BY loja_id, vencimento, status;
```

## 🎯 KPIs POR NÍVEL DE ACESSO

### GERENCIAL (Loja específica)
- Faturamento diário/mensal
- Ticket médio
- Formas de pagamento
- Principais produtos (CMV)

### FINANCEIRO (Todas lojas)
- DRE consolidado básico
- Fluxo de caixa 30/60/90 dias  
- Conciliação bancária
- Inadimplência

### ADMIN (BI Completo)
- PULSO Score (0-100) por loja
- Ranking de performance
- Insights preditivos com IA
- Análise comparativa multi-loja
- Projeções financeiras

## 🚀 PRÓXIMOS PASSOS

1. **Criar schema no Supabase**
2. **Implementar RLS policies**
3. **Script de migração ETL**
4. **Configurar dashboards por nível**
5. **Motor de conciliação básico**

---

**Objetivo**: Centro neurálgico financeiro para tomada de decisões ágeis com base em dados reais comprovados (R$ 10.7M em resultado).