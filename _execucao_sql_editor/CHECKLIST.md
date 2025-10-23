# 📊 CHECKLIST DE EXECUÇÃO

Marque ✅ conforme for executando:

## Plano de Contas (6 lotes)
- [ ] 01_plano_contas_lote_01.sql
- [ ] 02_plano_contas_lote_02.sql
- [ ] 03_plano_contas_lote_03.sql
- [ ] 04_plano_contas_lote_04.sql
- [ ] 05_plano_contas_lote_05.sql
- [ ] 06_plano_contas_lote_06.sql

## Mestres Complementares
- [ ] 07_centros_custo.sql
- [ ] 08_contas_financeiras.sql
- [ ] 09_fornecedores_lote_001.sql
- [ ] 09_fornecedores_lote_002.sql

## Classificação
- [ ] 10_classificar_fornecedores.sql

## Normalização de Fornecedores (canônicos)
- [ ] 10b_normalizar_fornecedores.sql

## Transacionais (arquivo grande em lotes)
- [ ] 11_transacionais_lote_001.sql … 11_transacionais_lote_201.sql

## Pós-processamento
- [ ] 11b_atribuir_plano_transacionais.sql

## Validações (final)
- [ ] 12_validacoes.sql

---

## ✅ Totais Esperados nas Validações

Após executar 12_validacoes.sql, você deve ver:

```
lojas: 10
plano_contas: ~120
centros_custo: 11
contas_financeiras: 16
fornecedores: 12.815
lancamentos: 42.863
parcelas: 42.863
```

---

## 🎉 Quando Terminar

1. ✅ Confirme os totais acima
2. 🎨 Teste o frontend
3. 📊 Valide DRE e relatórios
4. 🗑️ Delete a pasta `_execucao_sql_editor/`

---

**Data de execução:** _____________

**Tempo total:** _____________

**Observações:**
_____________________________________________
_____________________________________________
_____________________________________________
