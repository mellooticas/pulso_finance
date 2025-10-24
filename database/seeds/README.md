# 🔄 Scripts de Limpeza e Povoamento - PULSO Finance

Gerado em: 2025-10-21 17:25:39

## 📋 Arquivos Gerados

1. **00_EXECUTAR_TUDO.sql** - Script master que executa todos os passos
2. **01_limpar_banco.sql** - Limpeza de todas as tabelas
3. **02_povoar_mestres.sql** - População de tabelas mestres (lojas, plano de contas, etc)
4. **03_povoar_transacionais.sql** - População de lançamentos e parcelas

## 📊 Dados a Serem Importados

- **Lojas:** 10 registros
- **Plano de Contas:** 120 contas
- **Centros de Custo:** 11 centros
- **Contas Financeiras:** 16 contas
- **Fornecedores:** 12,815 fornecedores
- **Lançamentos:** 42,863 lançamentos
- **Parcelas:** 42,863 parcelas

## 🚀 Como Executar

### Opção 1: Via MCP Supabase (Recomendado)

Use o script Python auxiliar para executar via MCP:

```bash
python scripts/executar_via_mcp.py
```

### Opção 2: Via psql Direto

```bash
cd database/seeds
psql "postgresql://postgres:[SUA_SENHA]@db.fxsgphqzazcbjcyfqeyg.supabase.co:5432/postgres" -f 00_EXECUTAR_TUDO.sql
```

### Opção 3: Executar Manualmente Cada Etapa

```bash
# 1. Limpar
psql "..." -f 01_limpar_banco.sql

# 2. Mestres
psql "..." -f 02_povoar_mestres.sql

# 3. Transacionais
psql "..." -f 03_povoar_transacionais.sql
```

## ⚠️ IMPORTANTE

- ❌ **NÃO execute em produção sem backup!**
- ✅ Sempre teste em ambiente de desenvolvimento primeiro
- 🔒 O script `01_limpar_banco.sql` irá **APAGAR TODOS OS DADOS**
- ⏱️ A execução pode levar alguns minutos devido ao volume de dados

## 🔍 Validação Pós-Execução

Após executar, valide os dados:

```sql
-- Contar registros
SELECT 'lojas' as tabela, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'plano_contas', COUNT(*) FROM plano_contas
UNION ALL
SELECT 'fornecedores', COUNT(*) FROM fornecedores
UNION ALL
SELECT 'lancamentos', COUNT(*) FROM lancamentos
UNION ALL
SELECT 'parcelas', COUNT(*) FROM parcelas;

-- Verificar integridade referencial
SELECT 
    l.id,
    l.descricao,
    l.plano_id IS NOT NULL as tem_plano,
    l.loja_id IS NOT NULL as tem_loja
FROM lancamentos l
WHERE l.plano_id IS NULL OR l.loja_id IS NULL
LIMIT 10;
```

## 📝 Observações

- Os dados são importados de `data/seeds/*.csv`
- Substituem os 143 lotes yampa anteriores por dados consolidados
- Todos os UUIDs são regenerados no momento da importação
- Status de aprovação padrão: `aprovado`
- Origem padrão: `migracao_yampa`
