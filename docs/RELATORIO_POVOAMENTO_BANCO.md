# 📊 RELATÓRIO DE POVOAMENTO DO BANCO DE DADOS
## PULSO Finance - Estratégia de Migração e Importação

**Data**: 20/10/2025  
**Fonte de Dados**: `arquivao_final.csv` (39.479 registros únicos, 2020-2029)  
**Schema de Destino**: Supabase (PostgreSQL) - conforme Blueprint v2.0

---

## 🎯 OBJETIVO

Povoar o banco de dados Supabase com os dados históricos consolidados, mantendo integridade referencial, auditoria completa e compatibilidade com o sistema PULSO Finance.

---

## 📋 ESTRUTURA DO BANCO (BLUEPRINT v2.0)

### Tabelas Principais (Ordem de Dependência)

```
1. lojas (master)
2. usuarios (master)
3. fornecedores (master)
4. plano_contas (master - hierárquico)
5. centros_custos (master)
6. contas_financeiras (master - contas bancárias)
7. lancamentos (transacional - pai)
8. parcelas (transacional - filho de lancamentos)
9. extratos (conciliação)
10. conciliacoes (relacionamento extrato-parcela)
11. contratos (opcional - geração recorrente)
12. pix_transacoes (meios de pagamento)
13. cartao_transacoes (meios de pagamento)
14. auditoria_financeira (logs)
```

---

## 📊 ANÁLISE DO ARQUIVO ATUAL

### Estrutura do `arquivao_final.csv`

```
Colunas disponíveis:
- data_esperada: YYYY-MM-DD (vencimento/competência)
- data_realizada: YYYY-MM-DD (quando foi efetivado)
- plano_conta: TEXT (ex: "4.1.2 Taxas de cartões")
- historico: TEXT (descrição do lançamento)
- sequencia: TEXT (ex: "1 de 1", "2 de 5")
- conta_bancaria: TEXT (ex: "Banco do Brasil - 42")
- valor_receber: NUMERIC (sempre positivo)
- valor_recebido: NUMERIC (sempre positivo)
- valor_pagar: NUMERIC (sempre negativo)
- valor_pago: NUMERIC (sempre negativo)
- status: TEXT (Realizado, No prazo, Vencido, etc)
- cliente_fornecedor: TEXT
- meio_pagamento: TEXT (Pix, Débito, Dinheiro, etc)
- centro_custo: TEXT (ex: "Loja Suzano", "Escritório")
- projeto: TEXT
- data_alteracao: TEXT
- codigo_conciliacao: TEXT
- fonte: TEXT (backup_total ou export)
```

### Estatísticas

- **Total**: 39.479 registros
- **Período**: 2020-10-01 até 2029-09-25
- **Até 2022**: 11.614 registros (29,4%)
- **De 2023+**: 27.865 registros (70,6%)
- **Lojas identificadas**: Suzano, Mauá, Rio Pequeno, Suzano II, São Mateus, Escritório
- **Planos de conta**: ~50-80 (estimado)
- **Centros de custo**: ~10 (estimado)

---

## 🗺️ ESTRATÉGIA DE POVOAMENTO

### FASE 1: PREPARAÇÃO DE TABELAS MESTRAS

#### 1.1 Lojas
**Origem**: Extrair valores únicos de `centro_custo`

```python
# Script: gerar_seed_lojas.py
lojas_unicas = df['centro_custo'].dropna().unique()

# Mapear nomes para códigos
mapeamento_lojas = {
    "Loja Suzano": {"codigo": "SUZ", "cnpj": "11.222.333/0001-44"},
    "Loja Suzano II": {"codigo": "SU2", "cnpj": "11.222.333/0002-25"},
    "Loja Mauá": {"codigo": "MAU", "cnpj": "11.222.333/0003-06"},
    "Loja Rio Pequeno": {"codigo": "RIO", "cnpj": "11.222.333/0004-97"},
    "Loja São Mateus": {"codigo": "SMT", "cnpj": "11.222.333/0005-78"},
    "Escritório": {"codigo": "ESC", "cnpj": "11.222.333/0006-59"}
}

# Gerar CSV: lojas_seed.csv
# id, nome, codigo, cnpj, endereco, ativo, created_at
```

**Ação**: 
- ✅ Criar `data/seeds/lojas_seed.csv`
- ✅ Importar no Supabase via Dashboard ou SQL

---

#### 1.2 Plano de Contas
**Origem**: Extrair de `plano_conta` + normalizar hierarquia

```python
# Script: gerar_seed_plano_contas.py
planos_unicos = df['plano_conta'].dropna().unique()

# Estrutura hierárquica (conforme Blueprint)
# 1. ATIVO
#   1.1 Circulante
#     1.1.1 Caixa e Bancos
# 3. RECEITA
#   3.1 Receita Bruta
#     3.1.1 Vendas em dinheiro
#     3.1.2 Vendas cartões de débito
#     3.1.3 Vendas cartões de crédito
# 4. CUSTOS VARIÁVEIS
#   4.1 Impostos
#     4.1.1 Simples nacional
#     4.1.2 Taxas de cartões
# 5. DESPESAS FIXAS
#   5.2 Administrativas
#     5.2.8 Almoço / Supermercado / Lanches
# etc...

# Gerar CSV: plano_contas_seed.csv
# id, codigo, nome, tipo, pai_id, ativo, created_at
```

**Ação**: 
- ✅ Criar `data/seeds/plano_contas_seed.csv`
- ✅ Importar preservando hierarquia (pai antes de filho)
- ⚠️ Usar arquivo `plano_de_contas_correto.xlsx` como referência

---

#### 1.3 Centros de Custo
**Origem**: Mesmo que lojas (centro_custo = loja na maioria dos casos)

```python
# Script: gerar_seed_centros.py
# Usar mesmo mapeamento de lojas

# Gerar CSV: centros_custo_seed.csv
# id, codigo, nome, loja_id, tipo, ativo, created_at
```

**Ação**: 
- ✅ Criar `data/seeds/centros_custo_seed.csv`
- ✅ Vincular ao `loja_id` correspondente

---

#### 1.4 Contas Financeiras
**Origem**: Extrair de `conta_bancaria`

```python
# Script: gerar_seed_contas.py
contas_unicas = df['conta_bancaria'].dropna().unique()

# Exemplos:
# "Banco do Brasil - 42" → loja SUZ
# "Cielo - 42" → loja SUZ (cartão)
# "Caixa - 42" → loja SUZ (dinheiro)
# "Next - 12" → loja SMT

# Gerar CSV: contas_financeiras_seed.csv
# id, loja_id, tipo, banco, agencia, conta, saldo_inicial, ativo, created_at
```

**Ação**: 
- ✅ Criar `data/seeds/contas_financeiras_seed.csv`
- ⚠️ Definir `saldo_inicial` (pode ser 0 ou consultar saldo mais antigo)

---

#### 1.5 Fornecedores
**Origem**: Extrair de `cliente_fornecedor`

```python
# Script: gerar_seed_fornecedores.py
fornecedores = df['cliente_fornecedor'].dropna().unique()

# Limpar e normalizar
# "EDP BANDEIRANTES" → fornecedor
# "KONSEP CONTABILIDADE" → fornecedor
# etc...

# Gerar CSV: fornecedores_seed.csv
# id, nome, tipo, documento, contato, ativo, created_at
```

**Ação**: 
- ✅ Criar `data/seeds/fornecedores_seed.csv`
- ⚠️ Tipo = "fornecedor" (fase 1), "cliente" (fase 2)

---

### FASE 2: NORMALIZAÇÃO DE LANÇAMENTOS

#### 2.1 Estrutura de Lançamentos

**Blueprint**: 
```sql
lancamentos (
  id, loja_id, plano_id, centro_id, fornecedor_id,
  descricao, tipo, competencia, valor_total,
  observacoes, anexos, created_at, updated_at
)

parcelas (
  id, lancamento_id, numero, vencimento, valor,
  status, data_pagamento, valor_pago, conta_id,
  meio_pagamento, doc_ref, created_at
)
```

**Lógica de Conversão**:

```python
# Script: gerar_seed_lancamentos_parcelas.py

# 1. Agrupar por "sequencia" base
#    Ex: "1 de 3", "2 de 3", "3 de 3" → mesmo lancamento

# 2. Identificar sequencia_base (histórico + data_esperada)
#    Chave: historico_norm + data_primeira_parcela

# 3. Para cada grupo:
#    - Criar 1 LANCAMENTO (valor_total = soma parcelas)
#    - Criar N PARCELAS (uma para cada linha)

# 4. Mapear campos:
#    lancamento.descricao ← historico
#    lancamento.tipo ← "pagar" se valor_pagar != 0, senão "receber"
#    lancamento.competencia ← data_esperada (primeira parcela)
#    lancamento.loja_id ← map(centro_custo)
#    lancamento.plano_id ← map(plano_conta)
#    lancamento.centro_id ← map(centro_custo)
#    lancamento.fornecedor_id ← map(cliente_fornecedor)
#
#    parcela.numero ← extrair de "sequencia" (ex: "2 de 5" → 2)
#    parcela.vencimento ← data_esperada
#    parcela.valor ← valor_pagar ou valor_receber
#    parcela.status ← map(status) → "pago"/"previsto"/"vencido"
#    parcela.data_pagamento ← data_realizada (se status=Realizado)
#    parcela.valor_pago ← valor_pago ou valor_recebido
#    parcela.conta_id ← map(conta_bancaria)
#    parcela.meio_pagamento ← meio_pagamento

# Gerar 2 CSVs:
# - lancamentos_seed.csv
# - parcelas_seed.csv
```

**Desafios**:
- ⚠️ Identificar sequencias (regex: `(\d+) de (\d+)`)
- ⚠️ Agrupar parcelas do mesmo lançamento (pode ter sequencias quebradas)
- ⚠️ Mapear UUIDs de lojas/planos/centros/contas

---

#### 2.2 Mapeamento de IDs

**Problema**: CSVs usam nomes, banco usa UUIDs

**Solução**: Criar arquivo `mapeamentos.json`

```json
{
  "lojas": {
    "Loja Suzano": "uuid-loja-suzano",
    "Loja Mauá": "uuid-loja-maua",
    ...
  },
  "planos": {
    "3.1.1 Vendas em dinheiro": "uuid-plano-vendas-dinheiro",
    "4.1.2 Taxas de cartões": "uuid-plano-taxas",
    ...
  },
  "centros": {
    "Loja Suzano": "uuid-centro-suzano",
    ...
  },
  "contas": {
    "Banco do Brasil - 42": "uuid-conta-bb-42",
    ...
  },
  "fornecedores": {
    "EDP BANDEIRANTES": "uuid-fornecedor-edp",
    ...
  }
}
```

**Ação**: 
- ✅ Após importar tabelas mestras, exportar IDs do Supabase
- ✅ Popular `data/base/mapeamentos.json`
- ✅ Usar no script de geração de lançamentos/parcelas

---

### FASE 3: IMPORTAÇÃO NO SUPABASE

#### 3.1 Ordem de Importação

```
1. lojas_seed.csv
2. plano_contas_seed.csv (pai → filho)
3. centros_custo_seed.csv
4. contas_financeiras_seed.csv
5. fornecedores_seed.csv
6. [Exportar UUIDs → mapeamentos.json]
7. lancamentos_seed.csv
8. parcelas_seed.csv
```

#### 3.2 Métodos de Importação

**Opção A: Supabase Dashboard (UI)**
- ✅ Simples para tabelas mestras pequenas
- ❌ Limitado (sem transações, sem validação complexa)

**Opção B: SQL via psql/pgAdmin**
- ✅ Controle total, transações, validações
- ✅ Pode usar `COPY FROM` para performance
- ⚠️ Requer acesso direto ao Postgres

**Opção C: API Supabase (JavaScript/Python)**
- ✅ Automação completa
- ✅ Validação em tempo real
- ❌ Mais lento (linha por linha via REST)

**Recomendação**: **Opção B** (SQL) para lançamentos/parcelas (volume alto), **Opção A** (Dashboard) para mestras

---

#### 3.3 Script de Importação SQL

```sql
-- importar_dados.sql

-- 1. Lojas
\COPY lojas (id, nome, codigo, cnpj, ativo, created_at) 
  FROM '/path/lojas_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 2. Plano de Contas (ordem: raiz → folhas)
\COPY plano_contas (id, codigo, nome, tipo, pai_id, ativo, created_at) 
  FROM '/path/plano_contas_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 3. Centros de Custo
\COPY centros_custos (id, codigo, nome, loja_id, tipo, ativo, created_at) 
  FROM '/path/centros_custo_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 4. Contas Financeiras
\COPY contas_financeiras (id, loja_id, tipo, banco, conta, saldo_inicial, ativo, created_at) 
  FROM '/path/contas_financeiras_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 5. Fornecedores
\COPY fornecedores (id, nome, tipo, ativo, created_at) 
  FROM '/path/fornecedores_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 6. Lançamentos
\COPY lancamentos (id, loja_id, plano_id, centro_id, fornecedor_id, descricao, tipo, competencia, valor_total, created_at) 
  FROM '/path/lancamentos_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 7. Parcelas
\COPY parcelas (id, lancamento_id, numero, vencimento, valor, status, data_pagamento, valor_pago, conta_id, meio_pagamento, created_at) 
  FROM '/path/parcelas_seed.csv' 
  WITH (FORMAT csv, HEADER true);

-- 8. Refresh views materializadas
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_saldos_contas;
```

---

### FASE 4: VALIDAÇÃO E AUDITORIA

#### 4.1 Queries de Validação

```sql
-- Total de registros importados
SELECT 
  (SELECT COUNT(*) FROM lojas) AS lojas,
  (SELECT COUNT(*) FROM plano_contas) AS planos,
  (SELECT COUNT(*) FROM lancamentos) AS lancamentos,
  (SELECT COUNT(*) FROM parcelas) AS parcelas;

-- Integridade referencial
SELECT COUNT(*) FROM parcelas p
  LEFT JOIN lancamentos l ON p.lancamento_id = l.id
  WHERE l.id IS NULL; -- deve ser 0

-- Parcelas sem lançamento (órfãs)
SELECT COUNT(*) FROM parcelas WHERE lancamento_id IS NULL; -- deve ser 0

-- Valores zerados inválidos
SELECT COUNT(*) FROM lancamentos WHERE valor_total = 0;

-- Datas inválidas
SELECT COUNT(*) FROM parcelas WHERE vencimento IS NULL;

-- Comparar totais
SELECT 
  SUM(valor) FILTER (WHERE valor > 0) AS total_receber,
  SUM(valor) FILTER (WHERE valor < 0) AS total_pagar
FROM parcelas;

-- Deve bater com arquivao_final.csv:
-- total_receber: R$ 7.122.477,26
-- total_pagar: R$ 0,00 (valores já negativos)
```

#### 4.2 Checklist de Validação

- [ ] Total de parcelas = 39.479 (ou próximo, após agrupamento)
- [ ] Total de lançamentos = ~10.000-15.000 (estimado, após agrupamento por sequencia)
- [ ] Todos os UUIDs válidos (sem NULL em FKs obrigatórias)
- [ ] Datas no formato YYYY-MM-DD
- [ ] Valores negativos apenas em `valor_pagar` e `valor_pago`
- [ ] Status mapeado corretamente (Realizado → pago, No prazo → previsto, etc)
- [ ] Lojas: 6 registros
- [ ] Planos de conta: 50-80 registros
- [ ] Centros de custo: 6-10 registros
- [ ] Contas financeiras: 15-20 registros

---

## 🛠️ SCRIPTS A CRIAR

### 1. `gerar_seed_lojas.py`
**Input**: `arquivao_final.csv`  
**Output**: `data/seeds/lojas_seed.csv`  
**Função**: Extrair lojas únicas e gerar CSV com UUIDs

### 2. `gerar_seed_plano_contas.py`
**Input**: `arquivao_final.csv` + `plano_de_contas_correto.xlsx`  
**Output**: `data/seeds/plano_contas_seed.csv`  
**Função**: Normalizar hierarquia e gerar CSV

### 3. `gerar_seed_centros.py`
**Input**: `arquivao_final.csv`  
**Output**: `data/seeds/centros_custo_seed.csv`  
**Função**: Mapear centros de custo às lojas

### 4. `gerar_seed_contas.py`
**Input**: `arquivao_final.csv`  
**Output**: `data/seeds/contas_financeiras_seed.csv`  
**Função**: Extrair contas bancárias únicas

### 5. `gerar_seed_fornecedores.py`
**Input**: `arquivao_final.csv`  
**Output**: `data/seeds/fornecedores_seed.csv`  
**Função**: Normalizar fornecedores

### 6. `gerar_seed_lancamentos_parcelas.py`
**Input**: `arquivao_final.csv` + `mapeamentos.json`  
**Output**: `data/seeds/lancamentos_seed.csv`, `data/seeds/parcelas_seed.csv`  
**Função**: Agrupar por sequencia, mapear IDs, gerar CSVs

### 7. `exportar_uuids_supabase.py`
**Input**: Supabase (via API)  
**Output**: `data/base/mapeamentos.json`  
**Função**: Buscar UUIDs das tabelas mestras após importação

### 8. `validar_importacao.py`
**Input**: Supabase (via API)  
**Output**: Relatório de validação (console)  
**Função**: Executar queries de validação e comparar com CSV

---

## 📅 CRONOGRAMA SUGERIDO

### Semana 1: Preparação de Dados Mestres
- **Dia 1-2**: Gerar CSVs de lojas, planos, centros, contas, fornecedores
- **Dia 3**: Importar tabelas mestras no Supabase
- **Dia 4**: Exportar UUIDs e criar `mapeamentos.json`
- **Dia 5**: Validação das tabelas mestras

### Semana 2: Lançamentos e Parcelas
- **Dia 1-2**: Desenvolver script de agrupamento de sequencias
- **Dia 3**: Gerar CSVs de lançamentos e parcelas
- **Dia 4**: Importar no Supabase (SQL)
- **Dia 5**: Validação completa + ajustes

### Semana 3: Testes e Refinamento
- **Dia 1-2**: Testes de integridade e performance
- **Dia 3-4**: Correções e reprocessamento
- **Dia 5**: Auditoria final e documentação

---

## ⚠️ RISCOS E MITIGAÇÕES

| Risco | Impacto | Mitigação |
|-------|---------|-----------|
| **Sequencias quebradas** | Alto | Script de detecção + agrupamento fuzzy |
| **Mapeamento de IDs errado** | Alto | Validação cruzada + dry-run |
| **Performance de importação** | Médio | Usar `COPY` + transações |
| **RLS bloqueando importação** | Médio | Desabilitar RLS temporariamente |
| **Encoding de caracteres** | Baixo | UTF-8 em todos os CSVs |
| **Duplicatas residuais** | Baixo | Constraints UNIQUE + validação |

---

## ✅ PRÓXIMOS PASSOS

1. **Revisar estrutura das tabelas no Supabase** (confirmar DDL está aplicado)
2. **Criar scripts de geração de CSVs** (começar por lojas e planos)
3. **Importar tabelas mestras** (fase 1)
4. **Exportar UUIDs** (gerar mapeamentos.json)
5. **Desenvolver lógica de agrupamento de sequencias** (mais complexo)
6. **Gerar e importar lançamentos/parcelas** (fase 2)
7. **Validação completa** (queries + testes manuais)
8. **Documentar processo** (para futuras reimportações)

---

**Pronto para começar?** 🚀
