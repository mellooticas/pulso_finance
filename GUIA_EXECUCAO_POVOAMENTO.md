# 🚀 GUIA DE EXECUÇÃO - POVOAMENTO DO BANCO

## 📋 Resumo
8 scripts criados para povoar o Supabase com 39.479 registros financeiros consolidados.

---

## ✅ SCRIPTS CRIADOS

### **Master Tables (Scripts 1-5)**
1. ✅ `gerar_seed_lojas.py` - 7 lojas (SUZ, SU2, MAU, RIO, SMT, ESC, PER)
2. ✅ `gerar_seed_centros.py` - ~10 centros de custo
3. ✅ `gerar_seed_plano_contas.py` - ~50-80 planos hierárquicos
4. ✅ `gerar_seed_contas.py` - Contas financeiras
5. ✅ `gerar_seed_fornecedores.py` - Fornecedores extraídos do histórico

### **UUID Mapping (Script 6)**
6. ✅ `exportar_uuids_supabase.py` - Exporta UUIDs → mapeamentos.json

### **Transactional Tables (Script 7)**
7. ✅ `gerar_seed_lancamentos_parcelas.py` - Lançamentos + parcelas com UUIDs

### **Validation (Script 8)**
8. ✅ `validar_importacao.py` - Queries de validação → relatório

---

## 🎯 SEQUÊNCIA DE EXECUÇÃO

### **FASE 1: Gerar CSVs Master Tables** ⏱️ ~5 min
```bash
# Ativar ambiente virtual
source .venv/Scripts/activate  # ou .venv/bin/activate no Linux/Mac

# Executar scripts na ordem
python scripts/gerar_seed_lojas.py
python scripts/gerar_seed_centros.py
python scripts/gerar_seed_plano_contas.py
python scripts/gerar_seed_contas.py
python scripts/gerar_seed_fornecedores.py
```

**Output esperado:**
- ✅ `data/seeds/lojas.csv` (7 linhas)
- ✅ `data/seeds/centros_custos.csv` (~10 linhas)
- ✅ `data/seeds/plano_contas.csv` (~50-80 linhas)
- ✅ `data/seeds/contas_financeiras.csv` (~5-10 linhas)
- ✅ `data/seeds/fornecedores.csv` (~100+ linhas)

**⚠️ IMPORTANTE:**
- Revisar `plano_contas.csv` - ajustar nomes e tipos (receita/despesa)
- Revisar `fornecedores.csv` - remover inválidos, completar CNPJ/CPF

---

### **FASE 2: Importar Master Tables no Supabase** ⏱️ ~10 min

**Opção A: Interface Supabase (recomendado)**
1. Acessar: https://supabase.com/dashboard
2. Selecionar projeto PULSO Finance
3. Menu: Table Editor
4. Para cada tabela:
   - Clicar em `Import CSV`
   - Selecionar arquivo correspondente
   - Mapear colunas (auto-detect geralmente funciona)
   - Confirmar importação

**Ordem de importação (respeitar dependências):**
1. lojas.csv → tabela `lojas`
2. centros_custos.csv → tabela `centros_custos`
3. plano_contas.csv → tabela `plano_contas` (atenção: hierarquia pai/filho)
4. contas_financeiras.csv → tabela `contas_financeiras`
5. fornecedores.csv → tabela `fornecedores`

**Opção B: SQL (avançado)**
```sql
-- Exemplo para lojas
COPY lojas (codigo, nome, ativo)
FROM '/path/to/lojas.csv'
CSV HEADER;
```

---

### **FASE 3: Exportar UUIDs** ⏱️ ~2 min
```bash
# Certificar que .env existe com credenciais Supabase
python scripts/exportar_uuids_supabase.py
```

**Output esperado:**
- ✅ `data/seeds/mapeamentos.json` - Contém UUIDs de todas as master tables

**Validação:**
```bash
# Ver conteúdo do mapeamento
cat data/seeds/mapeamentos.json | head -50
```

---

### **FASE 4: Gerar CSVs Transacionais** ⏱️ ~3 min
```bash
python scripts/gerar_seed_lancamentos_parcelas.py
```

**Output esperado:**
- ✅ `data/seeds/lancamentos.csv` (~15.000-20.000 lançamentos)
- ✅ `data/seeds/parcelas.csv` (39.479 parcelas)

**Validação:**
```bash
# Ver quantas linhas
wc -l data/seeds/lancamentos.csv
wc -l data/seeds/parcelas.csv
```

---

### **FASE 5: Importar Transacionais no Supabase** ⏱️ ~15 min

**Ordem CRÍTICA (respeitar foreign keys):**
1. lancamentos.csv → tabela `lancamentos`
2. parcelas.csv → tabela `parcelas`

**⚠️ ATENÇÃO:**
- Parcelas dependem de lançamentos
- UUIDs devem bater com mapeamentos.json
- Em caso de erro de FK, verificar mapeamentos

---

### **FASE 6: Validar Importação** ⏱️ ~5 min
```bash
python scripts/validar_importacao.py
```

**Output esperado:**
- ✅ `data/seeds/relatorio_validacao.txt` - Relatório completo

**Verificações executadas:**
- ✅ Contagens em todas as tabelas
- ✅ Integridade referencial (FKs)
- ✅ Somas de valores financeiros
- ✅ Range de datas (2020-2029)

---

## 🔍 QUERIES DE VALIDAÇÃO MANUAL

### Contagens
```sql
-- Verificar contagens
SELECT 'lojas' as tabela, COUNT(*) as total FROM lojas
UNION ALL
SELECT 'centros_custos', COUNT(*) FROM centros_custos
UNION ALL
SELECT 'plano_contas', COUNT(*) FROM plano_contas
UNION ALL
SELECT 'lancamentos', COUNT(*) FROM lancamentos
UNION ALL
SELECT 'parcelas', COUNT(*) FROM parcelas;
```

### Integridade Referencial
```sql
-- Parcelas órfãs (sem lançamento)
SELECT COUNT(*) as parcelas_orfas
FROM parcelas p
LEFT JOIN lancamentos l ON p.lancamento_id = l.id
WHERE l.id IS NULL;

-- Lançamentos com loja inválida
SELECT COUNT(*) as lancamentos_invalidos
FROM lancamentos l
LEFT JOIN lojas lo ON l.loja_id = lo.id
WHERE lo.id IS NULL;
```

### Valores
```sql
-- Soma total de lançamentos
SELECT SUM(valor_total) as total_lancamentos
FROM lancamentos;

-- Soma total de parcelas
SELECT SUM(valor) as total_parcelas
FROM parcelas;

-- Diferença (deve ser próxima de zero)
SELECT 
  (SELECT SUM(valor_total) FROM lancamentos) as total_lanc,
  (SELECT SUM(valor) FROM parcelas) as total_parc,
  (SELECT SUM(valor_total) FROM lancamentos) - (SELECT SUM(valor) FROM parcelas) as diferenca;
```

### Datas
```sql
-- Range de datas
SELECT 
  MIN(data_lancamento) as data_min,
  MAX(data_lancamento) as data_max,
  COUNT(*) as total
FROM lancamentos;
```

---

## ⏱️ CRONOGRAMA TOTAL

| Fase | Atividade | Tempo | Acumulado |
|------|-----------|-------|-----------|
| 1 | Gerar CSVs master | 5 min | 5 min |
| 1.1 | Revisar/ajustar CSVs | 30 min | 35 min |
| 2 | Importar master tables | 10 min | 45 min |
| 3 | Exportar UUIDs | 2 min | 47 min |
| 4 | Gerar CSVs transacionais | 3 min | 50 min |
| 5 | Importar transacionais | 15 min | 1h 5min |
| 6 | Validar importação | 5 min | 1h 10min |
| 6.1 | Corrigir inconsistências | 1-2h | **2-3h** |

**⏱️ Tempo total estimado: 2-3 horas** (incluindo revisões e correções)

---

## 🎯 CHECKLIST DE VALIDAÇÃO FINAL

- [ ] **Contagens corretas**
  - [ ] 7 lojas
  - [ ] ~10 centros de custo
  - [ ] ~50-80 planos de contas
  - [ ] 39.479 parcelas
  - [ ] ~15.000-20.000 lançamentos

- [ ] **Integridade referencial**
  - [ ] 0 parcelas órfãs
  - [ ] 0 lançamentos com loja inválida
  - [ ] 0 lançamentos com plano inválido
  - [ ] 0 lançamentos com centro inválido

- [ ] **Valores**
  - [ ] Soma lançamentos ≈ soma parcelas (diferença < 1%)
  - [ ] Valores negativos para despesas/pagar/pago
  - [ ] Valores positivos apenas para receitas

- [ ] **Datas**
  - [ ] Range: 2020-10-01 a 2029-09-25
  - [ ] Sem datas NULL em campos obrigatórios
  - [ ] Datas em formato YYYY-MM-DD

- [ ] **Hierarquia**
  - [ ] Plano de contas: códigos pai existem
  - [ ] Sequencia: parcelas agrupadas corretamente
  - [ ] Lançamento → parcelas: 1:N funcionando

---

## 🚨 TROUBLESHOOTING

### Erro: "NEXT_PUBLIC_SUPABASE_URL not found"
**Solução:** Criar arquivo `.env` na raiz com:
```env
NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anonima
```

### Erro: "Foreign key constraint violation"
**Causa:** Ordem de importação incorreta ou UUIDs inválidos
**Solução:**
1. Verificar ordem de importação (master → transacional)
2. Re-executar `exportar_uuids_supabase.py`
3. Re-executar `gerar_seed_lancamentos_parcelas.py`

### Erro: "Duplicate key value violates unique constraint"
**Causa:** Importação duplicada
**Solução:**
1. Truncar tabelas no Supabase
2. Re-importar CSVs

### Valores não batem
**Causa:** Deduplicação ou conversão incorreta
**Solução:**
1. Verificar arquivao_final.csv (deve ter 39.479 linhas)
2. Re-executar scripts de geração
3. Comparar somas antes/depois

---

## 📞 PRÓXIMOS PASSOS

Após validação completa:

1. **Configurar RLS Policies** (Security)
   - Políticas por loja
   - Políticas por usuário
   - Permissões de leitura/escrita

2. **Testar Frontend**
   - Conectar ao Supabase
   - Testar filtros (data, loja, centro)
   - Verificar dashboards (DRE, Fluxo, etc.)

3. **Performance**
   - Criar índices em colunas de filtro
   - Otimizar queries lentas
   - Considerar materialized views

4. **Backup**
   - Exportar dump do banco
   - Versionar CSVs finais
   - Documentar processo

---

## 📊 RESUMO DOS ARQUIVOS

### Entrada
- `data/base/arquivao_final.csv` - 39.479 registros consolidados

### Intermediários (gerados)
- `data/seeds/lojas.csv`
- `data/seeds/centros_custos.csv`
- `data/seeds/plano_contas.csv`
- `data/seeds/contas_financeiras.csv`
- `data/seeds/fornecedores.csv`
- `data/seeds/mapeamentos.json`
- `data/seeds/lancamentos.csv`
- `data/seeds/parcelas.csv`

### Saída final
- `data/seeds/relatorio_validacao.txt`

---

**✅ SCRIPTS PRONTOS PARA EXECUÇÃO!**

🚀 **Comando para iniciar:**
```bash
python scripts/gerar_seed_lojas.py
```
