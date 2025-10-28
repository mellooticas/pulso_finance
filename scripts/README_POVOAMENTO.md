# 🚀 Orquestrador de Povoamento - Guia Rápido

## Arquivo Principal

`scripts/orquestrar_povoamento_local.py` - Orquestra toda a sequência de povoamento com otimizações para Supabase.

## Requisitos

```bash
# Instalar driver PostgreSQL
pip install "psycopg[binary]"
```

## Configuração

Defina as variáveis de ambiente:

```bash
# Windows PowerShell
$env:DB_HOST="db.fxsgphqzazcbjcyfqeyg.supabase.co"
$env:DB_PORT="5432"
$env:DB_NAME="postgres"
$env:DB_USER="postgres"
$env:DB_PASSWORD="Kt12jyh2815t@"

# Bash
export DB_HOST="db.fxsgphqzazcbjcyfqeyg.supabase.co"
export DB_PORT="5432"
export DB_NAME="postgres"
export DB_USER="postgres"
export DB_PASSWORD="Kt12jyh2815t@"
```

## Execução

### Modo Normal (Recomendado)

```bash
python scripts/orquestrar_povoamento_local.py
```

**Características:**
- ✅ Seguro e confiável
- ⚡ Commits a cada 2000 instruções
- 📊 work_mem = 256MB
- ⏱️ Tempo estimado: 10-15 minutos

### Modo Turbo (Mais Rápido)

```bash
python scripts/orquestrar_povoamento_local.py --turbo
```

**Características:**
- 🔥 2-3x mais rápido
- ⚠️ synchronous_commit = OFF (aceita risco de perda em crash)
- ⚡ Commits ainda maiores
- ⏱️ Tempo estimado: 5-8 minutos

**⚠️ ATENÇÃO:** Use `--turbo` apenas se aceitar o risco de perda de dados em caso de crash do servidor durante a execução. Para produção, use o modo normal.

## O Que o Script Faz

Executa nesta ordem:

1. **Limpeza** (`01_limpar_banco.sql`)
   - Trunca todas as tabelas
   - Reseta triggers e views

2. **Mestres** (em lotes quando disponível)
   - Lojas
   - Plano de contas (6 lotes)
   - Centros de custo
   - Contas financeiras
   - Fornecedores (1 lote, pode expandir)

3. **Classificação** (`classificar_fornecedores.sql`)
   - Ajusta categorias por padrões de nome
   - Idempotente (seguro repetir)

4. **Transacionais** (`03_povoar_transacionais.sql`)
   - Streaming eficiente (não carrega tudo em memória)
   - Commits a cada 2000 instruções
   - ~42.863 lançamentos + parcelas

5. **Validações** (`VALIDACOES_POS_IMPORT.sql`)
   - Contagens por tabela
   - Distribuição por categorias
   - Checagens de integridade

## Logs de Progresso

O script mostra logs detalhados:

```
🔌 Conectando em db.xxx.supabase.co:5432/postgres como postgres (SSL=require)...
✅ Conexão OK + otimizações de performance ativadas

▶️  Executando: database/seeds/01_limpar_banco.sql
   📦 Tamanho: 2.3 KB
✅ Concluído: 01_limpar_banco.sql

▶️  Executando transacionais (streaming): database/seeds/03_povoar_transacionais.sql
   ⚡ Modo turbo: commits a cada 2000 instruções
   💾 Commit: 2,000 instruções (2000 neste lote)
   💾 Commit: 4,000 instruções (2000 neste lote)
   ...
✅ Transacionais concluídos: 85,726 instruções executadas

🎉 Povoamento completo com sucesso.
```

## Troubleshooting

### Erro de Conexão

```
❌ Falha de conexão: [Errno 11001] getaddrinfo failed
```

**Solução:** Verifique se `DB_HOST` e `DB_PASSWORD` estão corretos.

### Erro em Instrução SQL

```
❌ Erro em instrução transacional:
INSERT INTO lancamentos ...
```

**Solução:** O script mostra a instrução problemática. Verifique constraints, FKs ou dados inválidos.

### Timeout/Lentidão

**Soluções:**
1. Use modo `--turbo` (mais rápido)
2. Execute em horário de menor carga no Supabase
3. Verifique sua conexão de internet

## Validação Pós-Execução

Após a execução, o próprio script roda as validações. Verifique a saída para:

- ✅ Totais por tabela (lojas, plano_contas, fornecedores, etc)
- ✅ Distribuição por categorias
- ✅ Checagens de tipo_pessoa
- ✅ DRE sintética

## Performance

**Hardware testado:** Conexão estável 50Mbps

| Modo | Tempo | Commits | Segurança |
|------|-------|---------|-----------|
| Normal | 10-15 min | 2000/lote | ✅ Alta |
| Turbo | 5-8 min | 2000/lote | ⚠️ Média |

## Segurança

- ✅ SSL obrigatório (sslmode=require)
- ✅ Transações com rollback em erro
- ✅ Commits parciais (não perde tudo em falha)
- ⚠️ Modo turbo desabilita sync (risco aceitável para imports)

## Próximos Passos

Após execução bem-sucedida:

1. ✅ Verifique logs de validação
2. 🎨 Teste frontend com dados reais
3. 📊 Valide DRE e relatórios
4. 🔧 Ajuste categorias se necessário

---

**💡 Dica:** Execute primeiro em ambiente de desenvolvimento/staging antes de produção!
