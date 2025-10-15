# 📊 MIGRAÇÃO COMPLETA YAMPA → PULSO FINANCE

## 🎯 Objetivo
Migrar **47.064 transações** do sistema Yampa para o Pulso Finance, organizadas em 4 etapas executáveis no SQL Editor do Supabase.

## 🔍 PRÉ-VERIFICAÇÃO

### Execute PRIMEIRO: Diagnóstico
**Arquivo:** `DEBUG_MIGRACAO.sql`
- Verifica estrutura do banco
- Limpa tabelas temporárias antigas
- Valida dados básicos

### Execute SEGUNDO: Teste do Sistema  
**Arquivo:** `TESTE_SISTEMA.sql`
- Testa funcionalidades básicas
- Verifica performance
- Confirma que está tudo funcionando

## 📋 PRÉ-REQUISITOS

### 1. Arquivos CSV Necessários
- `yampa_atual.csv` - Dados de 2022-2025 
- `yampa_antigo.csv` - Dados de 2020-2022

### 2. Estrutura dos CSVs Yampa Atual
```
data_esperada,valor_receber,valor_pagar,valor_recebido,valor_pago,data_realizada,plano_contas,historico,cliente_fornecedor,centro_custo,status
```

### 3. Estrutura dos CSVs Yampa Antigo  
```
data_agendada,valor_receber,valor_pagar,valor_recebido,valor_pago,data_realizada,plano_conta,historico,cliente_fornecedor,centro_custo,status
```

## 🚀 EXECUÇÃO PASSO A PASSO

### ⚠️ ANTES DE COMEÇAR
1. **`DEBUG_MIGRACAO.sql`** - Diagnóstico completo
2. **`TESTE_SISTEMA.sql`** - Teste de funcionamento

### ETAPA 1: PREPARAÇÃO
**Arquivo:** `ETAPA_1_PREPARACAO.sql`
- Criar tabelas temporárias
- Configurar mapeamento de planos de contas
- Validar estrutura do banco

**➡️ Execute no SQL Editor do Supabase**

---

### ETAPA 2: IMPORTAÇÃO DOS CSVs
**Arquivo:** `ETAPA_2_IMPORTACAO_DADOS.sql`
- Importar dados via CSV upload
- Carregar mapeamentos de planos de contas
- Validar importação

**📤 Processo de Upload:**
1. Execute o script SQL
2. Use o botão "Import data via CSV" no Supabase
3. Selecione os arquivos CSV
4. Configure as colunas conforme o script

---

### ETAPA 3: NORMALIZAÇÃO
**Arquivo:** `ETAPA_3_NORMALIZACAO.sql`
- Converter formatos de data
- Normalizar valores monetários
- Mapear planos de contas
- Classificar receitas/despesas

**➡️ Execute no SQL Editor do Supabase**

---

### ETAPA 4: INSERÇÃO FINAL
**Arquivo:** `ETAPA_4_INSERIR_BANCO.sql`
- Inserir lançamentos no banco principal
- Criar parcelas correspondentes
- Gerar relatórios de migração
- Limpar tabelas temporárias

**➡️ Execute no SQL Editor do Supabase**

## 📊 RESULTADOS ESPERADOS

### Dados Migrados
- ✅ **47.064** transações financeiras
- ✅ **5 anos** de histórico (2020-2025)
- ✅ **7 lojas** diferentes
- ✅ Receitas e despesas categorizadas
- ✅ Status de pagamento preservado

### Dashboard Funcional
- 📈 KPIs financeiros em tempo real
- 📊 Gráficos de receitas/despesas
- 🏪 Análise por loja
- 📅 Fluxo de caixa histórico
- 🎯 Categorização detalhada

## ⚠️ IMPORTANTES

### Ordem de Execução
**OBRIGATÓRIO executar na sequência:**
1. ETAPA_1_PREPARACAO.sql
2. ETAPA_2_IMPORTACAO_DADOS.sql (+ upload CSVs)
3. ETAPA_3_NORMALIZACAO.sql  
4. ETAPA_4_INSERIR_BANCO.sql

### Validações
- Cada etapa inclui queries de validação
- Conferir resultados antes de prosseguir
- Em caso de erro, revisar CSVs e reexecutar

### Performance
- Scripts otimizados para evitar timeout
- Processamento em lotes gerenciáveis
- Limpeza automática de tabelas temporárias

## 🎉 PÓS-MIGRAÇÃO

Após a conclusão:
1. **Acesse o dashboard** - dados reais estarão visíveis
2. **Confira KPIs** - receitas, despesas, fluxo de caixa
3. **Teste filtros** - por período, loja, categoria
4. **Valide gráficos** - Chart.js com dados históricos

---

**🚀 PRONTO PARA MIGRAÇÃO!**  
**Execute as 4 etapas em sequência no Supabase SQL Editor**