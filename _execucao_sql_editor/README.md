# 🚀 EXECUÇÃO VIA SQL EDITOR - GUIA RÁPIDO

## ✅ Status Atual

**Já executado via MCP:**
- ✅ Limpeza completa do banco
- ✅ 10 Lojas inseridas
- ✅ 3 Contas raiz do plano inseridas

---

## 📋 ORDEM DE EXECUÇÃO (Copiar → Colar → Run)

### 1️⃣ Plano de Contas (6 arquivos - ~2 minutos)

Execute **na ordem**:

```
01_plano_contas_lote_01.sql  (20 contas)
02_plano_contas_lote_02.sql  (20 contas)
03_plano_contas_lote_03.sql  (20 contas)
04_plano_contas_lote_04.sql  (20 contas)
05_plano_contas_lote_05.sql  (20 contas)
06_plano_contas_lote_06.sql  (20 contas)
```

**Como fazer:**
1. Abra o arquivo no VS Code
2. Ctrl+A (selecionar tudo)
3. Ctrl+C (copiar)
4. Vá ao SQL Editor do Supabase
5. Ctrl+V (colar)
6. Clique "Run" ou Ctrl+Enter
7. Aguarde o ✅ de sucesso
8. Próximo arquivo

---

### 2️⃣ Centros de Custo (~10 segundos)

```
07_centros_custo.sql  (11 centros)
```

---

### 3️⃣ Contas Financeiras (~10 segundos)

```
08_contas_financeiras.sql  (16 contas)
```

---

### 4️⃣ Fornecedores (dividido em lotes)

Se o SQL Editor acusar que a query é grande demais, execute os lotes gerados:

```
09_fornecedores_lote_001.sql
09_fornecedores_lote_002.sql
```

Observações:
- Os lotes são idempotentes (usam ON CONFLICT DO NOTHING)
- Execute na ordem 001, 002, ...
- Se existir também o arquivo único `09_fornecedores.sql` e ele falhar por tamanho, prefira os lotes

---

### 5️⃣ Classificação de Fornecedores (após transacionais)

A classificação usa o plano de contas dos lançamentos. Portanto, execute após os lotes de transacionais (ou reexecute depois):

```
10_classificar_fornecedores.sql  (ajusta categorias via plano de contas)
```

---

### 6️⃣ Transacionais - ARQUIVO GRANDE (dividido em lotes)

Para evitar o limite do SQL Editor, já geramos os lotes automaticamente. Execute na ordem:

```
11_transacionais_lote_001.sql
11_transacionais_lote_002.sql
...
11_transacionais_lote_201.sql
```

Observações:
- Cada arquivo contém um número seguro de statements para colar e executar
- Se algum lote acusar erro por reexecução, é esperado (idempotência); continue com o próximo
- Após concluir todos os lotes, reexecute o passo 5 (10_classificar_fornecedores.sql)

---

### 6.1️⃣ Atribuir Plano às Transações (pós-processamento)

Após inserir os lançamentos, ajuste os planos de contas dos recebimentos com base em padrões conhecidos (ex.: "VENDAS DINHEIRO"):

```
11b_atribuir_plano_transacionais.sql  (mapeia receitas para 3.1/3.1.1, idempotente)
```

Observações:
- O script atua somente em lançamentos com origem = 'migracao_yampa'
- Usa códigos já criados no plano (ex.: 3.1.1 – Vendas em dinheiro; se 3.1.2 não existir, cai para 3.1)
- Pode ser reexecutado sem problemas

---

### 7️⃣ Validações (~10 segundos)

```
12_validacoes.sql  (checagens finais)
```

**Você verá:**
- Contagens por tabela
- Distribuição de categorias
- Checagens de integridade
- DRE sintética

---

## 🎯 CHECKLIST DE EXECUÇÃO

```
☐ 01_plano_contas_lote_01.sql
☐ 02_plano_contas_lote_02.sql
☐ 03_plano_contas_lote_03.sql
☐ 04_plano_contas_lote_04.sql
☐ 05_plano_contas_lote_05.sql
☐ 06_plano_contas_lote_06.sql
☐ 07_centros_custo.sql
☐ 08_contas_financeiras.sql
☐ 09_fornecedores_lote_001.sql
☐ 09_fornecedores_lote_002.sql
☐ 10_classificar_fornecedores.sql
☐ 11_transacionais_lote_001.sql … 11_transacionais_lote_201.sql
☐ 11b_atribuir_plano_transacionais.sql
☐ 12_validacoes.sql
```

---

## ✅ TOTAIS ESPERADOS (após validações)

| Tabela | Total Esperado |
|--------|----------------|
| lojas | 10 |
| plano_contas | ~120 |
| centros_custo | 11 |
| contas_financeiras | 16 |
| fornecedores | 12.815 |
| lancamentos | 42.863 |
| parcelas | 42.863 |

---

## 🔧 TROUBLESHOOTING

### ❌ Erro de FK (foreign key)
```
violates foreign key constraint
```
**Solução:** Execute os arquivos na ordem indicada

### ❌ Timeout
```
statement timeout
```
**Solução:** Divida o arquivo 11_transacionais.sql em partes

### ❌ Duplicata
```
duplicate key value
```
**Solução:** Normal se executou 2x. Ignore ou use ON CONFLICT DO NOTHING

---

## ⏱️ TEMPO TOTAL ESTIMADO

- 📋 Plano de Contas: 2 minutos
- 🏢 Centros: 10 segundos
- 💳 Contas: 10 segundos
- 🏭 Fornecedores: 30 segundos
- 🔄 Classificação: 5 segundos
- 💰 Transacionais: 3-5 minutos
- ✅ Validações: 10 segundos

**TOTAL: ~7-9 minutos** ⚡

---

## 🎉 APÓS CONCLUIR

1. ✅ Revise a saída das validações
2. 🎨 Teste o frontend
3. 📊 Valide DRE e relatórios
4. 🗑️ Delete esta pasta quando terminar!

---

**💡 DICA:** Mantenha o SQL Editor aberto em uma aba e os arquivos em outra aba do VS Code. Assim você só precisa copiar/colar sequencialmente!

### 8️⃣ Normalização de Fornecedores (canônicos)

Para reduzir duplicatas (ex.: variações de nomes como Casa Rolu, Kenerson, etc.) e apontar lançamentos para um único fornecedor correto, execute:

```
10b_normalizar_fornecedores.sql  (cria nome_normalizado, define fornecedor canônico e atualiza lançamentos)
```

Notas:
- O script é idempotente, pode ser reexecutado após novas cargas
- Ele também cria a view `v_fornecedores_canonicos` para o frontend usar apenas os canônicos

### 9️⃣ Compactação (opcional e segura)

Para deixar o banco ainda mais enxuto, após normalizar e reendereçar os lançamentos para o canônico, você pode remover os aliases sem vínculo:

```
10c_compactar_fornecedores.sql  (remove não canônicos sem vínculos e garante 1 canônico por chave)
```
