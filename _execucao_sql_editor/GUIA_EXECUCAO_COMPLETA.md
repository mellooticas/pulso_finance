# GUIA RÁPIDO: POVOAMENTO COMPLETO VIA SQL EDITOR

Este guia mostra como executar o povoamento completo dos dados no Supabase SQL Editor.

## 📋 Pré-requisitos

- Acesso ao Supabase SQL Editor do projeto
- Scripts em `_execucao_sql_editor/` já preparados
- Plano de contas, centros de custo, contas financeiras e fornecedores já carregados

## 🚀 Execução Passo a Passo

### ETAPA 1: Carregar Lançamentos Transacionais (201 lotes)

Os lançamentos estão divididos em 201 arquivos para respeitar o limite do SQL Editor.

**Via SQL Editor (Recomendado para pequenos volumes):**

1. Abra o Supabase SQL Editor
2. Para cada arquivo `11_transacionais_lote_XXX.sql` (001 a 201):
   - Copie todo o conteúdo do arquivo
   - Cole no SQL Editor
   - Clique em "Run" (ou Ctrl+Enter)
   - Aguarde a conclusão (cada lote leva ~10-30 segundos)
   - Repita para o próximo lote

**Dica:** Para agilizar, você pode:
- Abrir múltiplas abas do SQL Editor
- Executar lotes em paralelo (máx 5-10 simultâneos)
- Monitorar progresso via: `SELECT COUNT(*) FROM lancamentos WHERE origem = 'migracao_yampa';`

**Via Script PowerShell (Recomendado para automação completa):**

```powershell
cd d:\projetos\pulso_finance\scripts
.\executar_povoamento_completo.ps1
```

### ETAPA 2: Atribuir Planos às Receitas

Após carregar todos os lançamentos, execute o mapeamento de planos:

1. Abra `11b_atribuir_plano_transacionais.sql`
2. Copie todo o conteúdo
3. Cole no SQL Editor
4. Execute

**O que faz:**
- Mapeia "VENDAS DINHEIRO%" → plano 3.1.1
- Mapeia "VENDAS NO CARTÃO%" → plano 3.1.2  
- Mapeia "VENDAS PIX%" → plano 3.1

### ETAPA 3: Normalizar Fornecedores

Execute a normalização para consolidar fornecedores duplicados:

1. Abra `10b_normalizar_fornecedores.sql`
2. Copie todo o conteúdo
3. Cole no SQL Editor
4. Execute

**O que faz:**
- Cria função de normalização de nomes
- Adiciona coluna `nome_normalizado`
- Define fornecedores canônicos
- Re-aponta lançamentos para canônicos
- Cria view `v_fornecedores_canonicos`

### ETAPA 4: Compactar Fornecedores (Opcional)

Para remover aliases órfãos e garantir unicidade:

1. Abra `10c_compactar_fornecedores.sql`
2. Copie todo o conteúdo
3. Cole no SQL Editor
4. Execute

**O que faz:**
- Remove fornecedores não-canônicos sem vínculos
- Garante índice único por nome_normalizado

### ETAPA 5: Validar Resultados

Execute queries de validação:

```sql
-- Total de lançamentos por tipo
SELECT 
  tipo,
  COUNT(*) as total,
  SUM(valor_total) as valor_total
FROM lancamentos
WHERE origem = 'migracao_yampa'
GROUP BY tipo;

-- Total de parcelas por status
SELECT 
  status,
  COUNT(*) as total,
  SUM(valor) as valor_total
FROM parcelas p
JOIN lancamentos l ON l.id = p.lancamento_id
WHERE l.origem = 'migracao_yampa'
GROUP BY status;

-- Fornecedores canônicos
SELECT COUNT(*) as total_cadastrados FROM fornecedores;
SELECT COUNT(*) as total_canonicos FROM v_fornecedores_canonicos;

-- Lançamentos por plano de contas (top 10)
SELECT 
  pc.codigo,
  pc.nome,
  COUNT(*) as total_lancamentos,
  SUM(l.valor_total) as valor_total
FROM lancamentos l
JOIN plano_contas pc ON pc.id = l.plano_id
WHERE l.origem = 'migracao_yampa'
GROUP BY pc.codigo, pc.nome
ORDER BY valor_total DESC
LIMIT 10;
```

## 📊 Resultados Esperados

Após a execução completa:

- **Lançamentos:** ~42.863 registros
- **Parcelas:** ~42.863 registros
- **Fornecedores:** 11.765 cadastrados
- **Fornecedores Canônicos:** ~8.000-9.000 (após normalização)

## ⚠️ Troubleshooting

### "Query is too large"
- **Causa:** Lote muito grande para o SQL Editor
- **Solução:** Execute lotes menores ou use o script PowerShell

### "Timeout" durante execução
- **Causa:** Lote demorado
- **Solução:** Execute em horários de menor carga ou reduza tamanho dos lotes

### "Duplicate key" errors
- **Causa:** Lote executado mais de uma vez (UUID duplicado)
- **Solução:** Normal, ignore. Os lotes não são idempotentes por UUID

### Lançamentos sem fornecedor
- **Status:** Normal para lançamentos migrados
- **Motivo:** Fornecedores serão consolidados via normalização (10b)

## 🎯 Próximos Passos

1. ✅ Verificar totais de lançamentos e parcelas
2. ✅ Revisar fornecedores canônicos em `v_fornecedores_canonicos`
3. ✅ Testar dashboards com dados reais
4. ✅ Ajustar filtros e visualizações conforme necessário
5. ✅ Configurar permissões RLS se necessário

## 📝 Observações Importantes

- **Idempotência:** Os scripts 11b, 10b e 10c são idempotentes (podem ser reexecutados)
- **Ordem:** Respeite a ordem: 11 → 11b → 10b → 10c
- **Backup:** Sempre recomendado fazer snapshot do banco antes de grandes cargas
- **Performance:** A execução completa pode levar 1-3 horas dependendo da infraestrutura

## 🆘 Suporte

Em caso de problemas:
1. Consulte o `README.md` em `_execucao_sql_editor/`
2. Revise o `CHECKLIST.md` para validações
3. Verifique logs de erro no Supabase Dashboard
