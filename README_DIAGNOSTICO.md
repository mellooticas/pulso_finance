# 🔥 URGENTE - Diagnóstico do Banco de Dados

## 🎯 O Que Você Precisa Fazer AGORA

Identificamos que o DRE está "doce de criança" e a Análise Financeira está "candidato de esquerda sem inteligência" porque **OS FILTROS NÃO FUNCIONAM** e provavelmente **OS DADOS NÃO ESTÃO NO BANCO**.

Para eu consertar, preciso saber O QUE REALMENTE tem no banco Supabase!

---

## 📋 OPÇÃO 1: Automático (Recomendado) ⚡

Execute este script Python que vai fazer TUDO sozinho:

```bash
cd /d/projetos/pulso_finance
python scripts/analysis/inventariar_banco_dados.py
```

**O que vai acontecer:**
1. ✓ Conecta no Supabase automaticamente
2. ✓ Verifica todas as tabelas
3. ✓ Conta registros em cada tabela
4. ✓ Identifica o que está faltando
5. ✓ Gera relatório completo em JSON

**Resultado:**
- Arquivo: `data/analysis/inventario_banco_dados.json`
- Me mande esse arquivo!

**Pré-requisito:**
- Precisa ter credenciais em `frontend/.env.local`:
```env
NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon
```

---

## 📋 OPÇÃO 2: Manual (se o script não funcionar) 🐢

### Passo 1: Abrir Supabase SQL Editor
1. Acesse https://supabase.com
2. Selecione seu projeto
3. Clique em "SQL Editor"

### Passo 2: Executar Queries
Abra o arquivo `DIAGNOSTICO_BANCO.sql` que eu criei na raiz do projeto.

Execute as queries **UMA POR UMA** e copie os resultados.

**Queries mais importantes:**

#### Query 1 - Listar Tabelas
```sql
SELECT 
    table_name,
    (SELECT COUNT(*) FROM information_schema.columns WHERE table_name = t.table_name) as num_colunas
FROM information_schema.tables t
WHERE table_schema = 'public'
ORDER BY table_name;
```

#### Query 2 - Contar Registros
Para cada tabela que existir, execute:
```sql
SELECT 'lancamentos' as tabela, COUNT(*) as total FROM lancamentos;
SELECT 'parcelas' as tabela, COUNT(*) as total FROM parcelas;
SELECT 'fornecedores' as tabela, COUNT(*) as total FROM fornecedores;
SELECT 'lojas' as tabela, COUNT(*) as total FROM lojas;
SELECT 'produtos_servicos' as tabela, COUNT(*) as total FROM produtos_servicos;
SELECT 'planos_contas' as tabela, COUNT(*) as total FROM planos_contas;
SELECT 'centros_custo' as tabela, COUNT(*) as total FROM centros_custo;
```

#### Query 3 - Verificar RLS (está bloqueando?)
```sql
SELECT 
    tablename,
    rowsecurity as rls_habilitado
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY tablename;
```

### Passo 3: Me Mandar os Resultados
Copie TUDO e cole num arquivo de texto ou aqui no chat.

---

## 🔍 O Que Vou Descobrir

Com essas queries vou saber:

### ✅ Estrutura do Banco
- Quais tabelas existem?
- Quantas colunas tem cada tabela?
- Tem as colunas necessárias para filtros? (data, loja_id, centro_custo_id)

### ✅ Dados Importados
- Tem os 45.133 lançamentos do Yampa? ← **CRÍTICO!**
- Tem os 5 fornecedores principais?
- Tem as 8 lojas?
- Tem os ~2.000 produtos?

### ✅ Problemas Técnicos
- RLS está bloqueando queries?
- Foreign Keys estão configuradas?
- Índices existem para performance?

### ✅ Por Que Filtros Não Funcionam
- Falta a coluna `loja_id`?
- Falta a coluna `centro_custo_id`?
- Falta a coluna `competencia` (data)?
- Relacionamentos quebrados?

---

## 🚀 Depois do Diagnóstico

Assim que você me mandar os resultados, eu vou:

### Se o banco estiver VAZIO:
```typescript
// Vou criar/corrigir:
1. Scripts de migração (CREATE TABLE)
2. Scripts de importação (INSERT dos 45k dados)
3. Configuração de RLS
4. Criação de índices
```

### Se o banco tiver dados MAS filtros não funcionam:
```typescript
// Vou consertar:
1. Hooks para fazer queries dinâmicas
2. Páginas para passar filtros corretos
3. Adicionar filtros faltando (se necessário)
4. Otimizar queries para performance
```

### Se o banco estiver OK:
```typescript
// Vou transformar:
DRE: "doce de criança" → "sistema enterprise"
Análise: "candidato de esquerda" → "Einstein com MBA"
Filtros: "decoração" → "funcionam de verdade"
```

---

## ⚠️ IMPORTANTE

**NÃO CONTINUE** codando outras coisas antes disso!

Por quê? Porque se o banco estiver vazio ou com estrutura errada, TODO o trabalho nos hooks/páginas vai ser perdido. Preciso saber O QUE TEM LÁ primeiro para fazer direito.

---

## 📞 Como Me Mandar os Resultados

**Opção 1 (Melhor):**
```bash
python scripts/analysis/inventariar_banco_dados.py
# Me manda o arquivo: data/analysis/inventario_banco_dados.json
```

**Opção 2:**
- Execute as queries manualmente
- Copie TODOS os resultados
- Cole aqui no chat ou crie arquivo .txt

**Opção 3:**
- Print da tela do Supabase mostrando as tabelas
- Screenshot dos resultados das queries principais

---

## 🎯 Próximos Passos

```
VOCÊ faz diagnóstico → ME MANDA resultados
     ↓
EU analiso → CRIO código corrigido
     ↓
VOCÊ testa → FUNCIONA! 🎉
     ↓
Sistema sai de "jardim de infância" → "ENTERPRISE REAL"
```

---

**Vai lá, executa e me manda! Tô esperando aqui! 🔥**

Qualquer erro que der, me manda print que eu te ajudo!
