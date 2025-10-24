# 📋 GUIA DE EXECUÇÃO DOS LOTES DE FORNECEDORES

## Status Atual
- ✅ Lotes 001-005 executados (405 registros)
- ✅ Lote 006 executado (~193 registros)
- ✅ Classificação executada (215 colaborador, 383 fornecedor)
- **Total atual: 598 fornecedores**

## Lotes Pendentes
- 🔄 Lotes 007-065 (59 arquivos restantes)
- Cada arquivo tem ~200 registros
- Total estimado pendente: ~11,800 registros

## Estratégia de Execução

### Opção 1: Manual via Interface Supabase SQL Editor
1. Acessar: https://supabase.com/dashboard/project/[seu-projeto]/sql/new
2. Para cada lote (007-065):
   - Copiar conteúdo do arquivo `fornecedores_lote_XXX.sql`
   - Colar no editor SQL
   - Clicar em "Run"
   - Aguardar confirmação
3. A cada 5 lotes, executar classificação:
   ```sql
   -- Executar database/seeds/classificar_fornecedores.sql
   ```

### Opção 2: Script Bash + Supabase CLI
```bash
cd d:/projetos/pulso_finance/database/seeds/fornecedores_lotes

# Executar lotes em batch
for i in {007..015}; do
  echo "Executando lote $i..."
  supabase db execute < fornecedores_lote_$(printf '%03d' $i).sql
  if [ $? -eq 0 ]; then
    echo "✓ Lote $i concluído"
  else
    echo "✗ Lote $i falhou"
    break
  fi
done

# Após cada 10 lotes, reclassificar
supabase db execute < ../classificar_fornecedores.sql
```

### Opção 3: Python + Supabase Client
```python
from supabase import create_client
import os
from pathlib import Path

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")
supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

lotes_dir = Path("d:/projetos/pulso_finance/database/seeds/fornecedores_lotes")

for i in range(7, 66):
    arquivo = lotes_dir / f"fornecedores_lote_{i:03d}.sql"
    with open(arquivo, 'r', encoding='utf-8') as f:
        sql = f.read()
    
    print(f"Executando lote {i}...")
    result = supabase.rpc('exec_sql', {'query': sql}).execute()
    print(f"✓ Lote {i} concluído")
    
    # A cada 10 lotes, classificar
    if i % 10 == 0:
        with open(lotes_dir.parent / "classificar_fornecedores.sql", 'r') as f:
            classificacao_sql = f.read()
        supabase.rpc('exec_sql', {'query': classificacao_sql}).execute()
        print(f"✓ Classificação executada após lote {i}")
```

## Batches Recomendados

### Batch 1: Lotes 007-015 (9 lotes, ~1,800 registros)
- Arquivos: fornecedores_lote_007.sql até fornecedores_lote_015.sql
- Após execução: rodar classificação

### Batch 2: Lotes 016-025 (10 lotes, ~2,000 registros)
- Arquivos: fornecedores_lote_016.sql até fornecedores_lote_025.sql
- Após execução: rodar classificação

### Batch 3: Lotes 026-035 (10 lotes, ~2,000 registros)
- Arquivos: fornecedores_lote_026.sql até fornecedores_lote_035.sql
- Após execução: rodar classificação

### Batch 4: Lotes 036-045 (10 lotes, ~2,000 registros)
- Arquivos: fornecedores_lote_036.sql até fornecedores_lote_045.sql
- Após execução: rodar classificação

### Batch 5: Lotes 046-055 (10 lotes, ~2,000 registros)
- Arquivos: fornecedores_lote_046.sql até fornecedores_lote_055.sql
- Após execução: rodar classificação

### Batch 6: Lotes 056-065 (10 lotes, ~2,000 registros)
- Arquivos: fornecedores_lote_056.sql até fornecedores_lote_065.sql
- Após execução: rodar classificação FINAL

## Validação Final

Após todos os lotes:

```sql
-- 1. Contar total de fornecedores
SELECT COUNT(*) as total FROM fornecedores;
-- Esperado: ~12,398 registros (598 atuais + 11,800 novos)

-- 2. Verificar distribuição por categoria
SELECT 
  categoria,
  COUNT(*) as quantidade,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) as percentual
FROM fornecedores 
GROUP BY categoria 
ORDER BY quantidade DESC;

-- 3. Verificar registros sem categoria
SELECT COUNT(*) as sem_categoria 
FROM fornecedores 
WHERE categoria IS NULL OR categoria = 'fornecedor';

-- 4. Sample de cada categoria
SELECT categoria, nome 
FROM fornecedores 
WHERE categoria != 'fornecedor'
ORDER BY categoria, RANDOM() 
LIMIT 20;
```

## Próximos Passos

Após conclusão dos fornecedores:
1. ✅ Validar integridade (contagens, FK, etc.)
2. 🔄 Executar lançamentos (transacionais)
3. 🔄 Executar parcelas (se aplicável)
4. 🔄 Testes no frontend
5. 🔄 Documentação final

## Notas Importantes

- ⚠️ Todos os arquivos já estão corrigidos (sem ON CONFLICT)
- ⚠️ Cada arquivo tem ~200 INSERTs (tamanho gerenciável)
- ⚠️ Classificação pode ser rodada múltiplas vezes (é idempotente)
- ⚠️ Não há unique constraints no nome (duplicatas são permitidas)
- ⚠️ Backup recomendado antes de processos em larga escala

## Comandos Úteis

```bash
# Contar lotes restantes
ls -1 d:/projetos/pulso_finance/database/seeds/fornecedores_lotes/fornecedores_lote_*.sql | wc -l

# Contar total de INSERTs em todos os lotes
grep -h "gen_random_uuid()" d:/projetos/pulso_finance/database/seeds/fornecedores_lotes/fornecedores_lote_*.sql | wc -l

# Verificar integridade dos arquivos (devem terminar com ;)
for f in d:/projetos/pulso_finance/database/seeds/fornecedores_lotes/fornecedores_lote_*.sql; do
  tail -1 "$f" | grep -q ";" || echo "ERRO: $f não termina com ;"
done
```
