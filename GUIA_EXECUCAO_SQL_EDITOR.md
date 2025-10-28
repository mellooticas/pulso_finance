# 🚀 POVOAMENTO VIA SQL EDITOR SUPABASE
## Método Mais Rápido e Confiável

## ✅ PASSOS PARA EXECUÇÃO

### 1️⃣ Limpeza (CONCLUÍDA ✅)
```sql
-- Já executamos via MCP
-- ✅ Lojas: 10 inseridas
```

### 2️⃣ Plano de Contas (6 Lotes)

Abra o SQL Editor do Supabase e execute estes arquivos **na ordem**:

1. `database/seeds/02_plano_contas_lote_01.sql`
2. `database/seeds/02_plano_contas_lote_02.sql`
3. `database/seeds/02_plano_contas_lote_03.sql`
4. `database/seeds/02_plano_contas_lote_04.sql`
5. `database/seeds/02_plano_contas_lote_05.sql`
6. `database/seeds/02_plano_contas_lote_06.sql`

**Como fazer:**
- Abra cada arquivo no VS Code
- Copie todo o conteúdo (Ctrl+A, Ctrl+C)
- Cole no SQL Editor do Supabase
- Clique em "Run" ou Ctrl+Enter
- Aguarde conclusão (~10-30 segundos por lote)
- Passe para o próximo

### 3️⃣ Centros de Custo

Arquivo: `database/seeds/02_mestres_centros_custo.sql`

### 4️⃣ Contas Financeiras

Arquivo: `database/seeds/02_mestres_contas_financeiras.sql`

### 5️⃣ Fornecedores

Arquivo: `database/seeds/02_fornecedores_lote_01.sql`

### 6️⃣ Classificação

Arquivo: `database/seeds/classificar_fornecedores.sql`

### 7️⃣ Transacionais (MAIOR ARQUIVO)

**OPÇÃO A - Arquivo Completo (se o SQL Editor suportar):**
- `database/seeds/03_povoar_transacionais.sql`

**OPÇÃO B - Se der timeout, divida manualmente:**
1. Abra o arquivo no VS Code
2. Procure por "-- Lote" ou "INSERT INTO lancamentos"
3. Execute em partes de ~1000 linhas por vez

### 8️⃣ Validações

Arquivo: `database/seeds/VALIDACOES_POS_IMPORT.sql`

---

## ⚡ DICAS PARA VELOCIDADE

### No SQL Editor do Supabase:
1. ✅ Desabilite "Auto-commit" se houver a opção
2. ✅ Execute em horário de menor carga
3. ✅ Se der timeout, divida em blocos menores

### Atalhos:
- **Ctrl+A**: Selecionar tudo
- **Ctrl+C**: Copiar
- **Ctrl+V**: Colar no SQL Editor
- **Ctrl+Enter**: Executar

---

## 📊 ORDEM DE EXECUÇÃO RESUMIDA

```
1. ✅ Limpeza (FEITO via MCP)
2. ✅ Lojas (FEITO via MCP - 10 lojas)
3. ⏳ Plano de Contas (6 lotes) ← PRÓXIMO
4. ⏳ Centros de Custo
5. ⏳ Contas Financeiras
6. ⏳ Fornecedores
7. ⏳ Classificação
8. ⏳ Transacionais
9. ⏳ Validações
```

---

## 🔧 SE DER ERRO

### Erro de FK (chave estrangeira):
```
violates foreign key constraint
```
**Solução:** Execute os arquivos na ordem correta (a ordem acima)

### Timeout:
```
statement timeout
```
**Solução:** Divida o arquivo em partes menores

### Duplicata:
```
duplicate key value
```
**Solução:** Normal se executou 2x. Use `ON CONFLICT DO NOTHING`

---

## 💡 ALTERNATIVA RÁPIDA

Se preferir automação, posso criar um script que:
1. Lê cada arquivo
2. Divide em chunks de 500 linhas
3. Executa via MCP automaticamente

**Quer que eu faça isso?** Ou prefere fazer manualmente no SQL Editor (mais visual e com controle)?

---

## ✅ DEPOIS DE CONCLUIR

Execute esta query para confirmar:

```sql
SELECT 
  'lojas' as tabela, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'plano_contas', COUNT(*) FROM plano_contas
UNION ALL
SELECT 'centros_custo', COUNT(*) FROM centros_custo
UNION ALL
SELECT 'contas_financeiras', COUNT(*) FROM contas_financeiras
UNION ALL
SELECT 'fornecedores', COUNT(*) FROM fornecedores
UNION ALL
SELECT 'lancamentos', COUNT(*) FROM lancamentos
UNION ALL
SELECT 'parcelas', COUNT(*) FROM parcelas;
```

**Totais esperados:**
- lojas: 10
- plano_contas: ~120
- centros_custo: 11
- contas_financeiras: 16
- fornecedores: 12,815
- lancamentos: 42,863
- parcelas: 42,863
