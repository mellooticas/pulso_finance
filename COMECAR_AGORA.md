# 🚀 COMEÇAR AGORA - CARGA TRANSACIONAL

## Status Atual
✅ **Base de dados pronta para receber 42.863 lançamentos**
⏳ **Aguardando execução dos 201 lotes transacionais**

---

## Método 1: AUTOMÁTICO (Recomendado)

### Pré-requisito: Supabase CLI instalado

```powershell
# 1. Instalar Supabase CLI (se ainda não tem)
npm install -g supabase

# 2. Fazer login
supabase login

# 3. Link com seu projeto
cd d:\projetos\pulso_finance
supabase link --project-ref SEU_PROJECT_REF

# 4. Executar script automático
cd scripts
.\executar_povoamento_completo.ps1
```

**Tempo estimado:** 1-1.5 horas  
**Intervenção:** Nenhuma (totalmente automático)

---

## Método 2: MANUAL VIA SQL EDITOR (Mais simples, sem instalação)

### Passo a Passo

1. **Abra o Supabase SQL Editor**
   - Vá para: https://supabase.com/dashboard
   - Selecione seu projeto
   - Clique em "SQL Editor"

2. **Execute os lotes em sequência**
   
   **DICA:** Abra 5-10 abas do SQL Editor para executar em paralelo!

   Para cada lote (001 a 201):
   
   a. Abra o arquivo: `_execucao_sql_editor/11_transacionais_lote_XXX.sql`
   
   b. Copie TODO o conteúdo (Ctrl+A, Ctrl+C)
   
   c. Cole no SQL Editor (Ctrl+V)
   
   d. Execute (Ctrl+Enter ou botão "Run")
   
   e. Aguarde ~10-30 segundos
   
   f. ✅ Quando terminar, vá para o próximo lote

3. **Monitore o progresso**
   ```sql
   SELECT COUNT(*) FROM lancamentos WHERE origem = 'migracao_yampa';
   ```
   - Meta: 42.863 lançamentos

**Tempo estimado:** 2-4 horas (1-2 horas se executar 5-10 lotes em paralelo)  
**Intervenção:** Copiar/colar cada lote

---

## Ordem de Execução dos Lotes

```
11_transacionais_lote_001.sql  ← Começar aqui
11_transacionais_lote_002.sql
11_transacionais_lote_003.sql
...
11_transacionais_lote_199.sql
11_transacionais_lote_200.sql
11_transacionais_lote_201.sql  ← Terminar aqui
```

---

## Executando em Paralelo (Acelerar Manual)

1. Abra **5 abas** do SQL Editor
2. Em cada aba, execute lotes diferentes:
   - Aba 1: lotes 001, 006, 011, 016, ...
   - Aba 2: lotes 002, 007, 012, 017, ...
   - Aba 3: lotes 003, 008, 013, 018, ...
   - Aba 4: lotes 004, 009, 014, 019, ...
   - Aba 5: lotes 005, 010, 015, 020, ...

**Reduz tempo de 4h para ~1h!**

---

## Após Terminar TODOS os Lotes

### 1. Validar Totais

```sql
-- Deve retornar ~42.863
SELECT COUNT(*) FROM lancamentos WHERE origem = 'migracao_yampa';

-- Deve retornar ~42.863
SELECT COUNT(*) FROM parcelas 
WHERE lancamento_id IN (
  SELECT id FROM lancamentos WHERE origem = 'migracao_yampa'
);
```

### 2. Reexecutar Pós-Processamento (Recomendado)

Copie e cole cada um destes arquivos no SQL Editor:

```
1. _execucao_sql_editor/11b_atribuir_plano_transacionais.sql
2. _execucao_sql_editor/10b_normalizar_fornecedores.sql
3. _execucao_sql_editor/10c_compactar_fornecedores.sql
```

### 3. Validações Finais

```sql
-- Lançamentos por tipo
SELECT tipo, COUNT(*), SUM(valor_total) 
FROM lancamentos 
WHERE origem = 'migracao_yampa'
GROUP BY tipo;

-- Top 10 planos mais usados
SELECT 
  pc.codigo,
  pc.nome,
  COUNT(*) as total,
  SUM(l.valor_total) as valor_total
FROM lancamentos l
JOIN plano_contas pc ON pc.id = l.plano_id
WHERE l.origem = 'migracao_yampa'
GROUP BY pc.codigo, pc.nome
ORDER BY total DESC
LIMIT 10;

-- Fornecedores canônicos
SELECT COUNT(*) FROM v_fornecedores_canonicos;
```

---

## ⚠️ IMPORTANTE

### Se Precisar Recomeçar

```sql
-- ATENÇÃO: Isso apaga TODOS os lançamentos migrados!
-- Use apenas se precisar resetar e recomeçar

DELETE FROM parcelas 
WHERE lancamento_id IN (
  SELECT id FROM lancamentos WHERE origem = 'migracao_yampa'
);

DELETE FROM lancamentos WHERE origem = 'migracao_yampa';
```

### Não Execute o Mesmo Lote 2x

- Os lotes NÃO são idempotentes
- Executar 2x criará duplicatas
- Se executou por engano, use o reset acima

---

## 📊 Progresso Esperado

```
Lote 001   ▰▱▱▱▱▱▱▱▱▱  0.5%  (~200 lançamentos)
Lote 050   ▰▰▰▰▰▱▱▱▱▱  25%   (~10.000 lançamentos)
Lote 100   ▰▰▰▰▰▰▰▰▱▱  50%   (~21.000 lançamentos)
Lote 150   ▰▰▰▰▰▰▰▰▰▱  75%   (~32.000 lançamentos)
Lote 201   ▰▰▰▰▰▰▰▰▰▰  100%  (~42.863 lançamentos)
```

---

## 🎯 Quando Terminar

1. ✅ Execute validações (queries acima)
2. ✅ Teste dashboards com dados reais
3. ✅ Revise fornecedores em `v_fornecedores_canonicos`
4. ✅ Celebre! 🎉

---

## 🆘 Se der erro

1. **"Query is too large"**
   - Normal, os lotes já estão divididos
   - Continue com o próximo lote

2. **"Timeout"**
   - Aguarde alguns minutos
   - Execute novamente o mesmo lote
   - Se persistir, execute em horário de menor carga

3. **Erro SQL**
   - Copie a mensagem de erro
   - Verifique se o lote anterior foi concluído
   - Consulte `GUIA_EXECUCAO_COMPLETA.md`

---

## 📞 Documentação Completa

- **Guia detalhado:** `_execucao_sql_editor/GUIA_EXECUCAO_COMPLETA.md`
- **Resumo técnico:** `RESUMO_EXECUCAO.md`
- **Checklist:** `_execucao_sql_editor/CHECKLIST.md`

---

**COMEÇAR AGORA:**

```
1. Abra Supabase SQL Editor
2. Abra _execucao_sql_editor/11_transacionais_lote_001.sql
3. Copie tudo e execute
4. Repita para os próximos 200 lotes
5. ✅ Pronto!
```

**BOA SORTE! 🚀**
