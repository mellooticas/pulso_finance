# 🔧 Reconciliação de Dados (export.csv → schema normalizado)

Este documento explica como transformar `data/base/export.csv` no schema do banco (lancamentos/parcelas) e validar consistência.

## Entrada
- Arquivo: `data/base/export.csv` (separador `;`, cabeçalho em PT-BR)
- Colunas principais:
  - Data esperada, Data realizada, Plano de contas, Histórico, Sequência, Conta bancária
  - Valor a receber, Valor recebido, Valor a pagar, Valor pago, Status
  - Cliente/Fornecedor, Meio de pagamento, Centro de custo, Projeto, Data da última alteração, Código da conciliação bancária

## Saída
- `data/seeds/lancamentos_from_export.csv` (para importar na tabela `lancamentos`)
- `data/seeds/parcelas_from_export.csv` (para importar na tabela `parcelas`)
- `data/analysis/base/EXPORT_CLEAN.csv` (auditoria do que foi ingerido)
- `data/base/mapeamentos.json` (preencher UUIDs reais de lojas/planos)

## Regras de transformação
- Valores PT-BR → float (1.234,56 → 1234.56)
- Datas: `DD/MM/YYYY` ou `YYYY-MM-DD`
- Tipo do lançamento:
  - receita: se `valor_receber` > 0 ou `valor_recebido` > 0
  - despesa: se `valor_pagar` < 0 ou `valor_pago` < 0 (ou `valor_pagar` > 0 como fallback)
- Valor total: maior entre receber/recebido (receita) ou abs(pagar/pago) (despesa)
- Status: "Realizado"/"Pago" → `pago`, outros → `previsto`
- Parcela: parse de `Sequência` (ex: "1 de 2", "1/4")
- Loja e Plano: resolvedores via `data/base/mapeamentos.json`

## Uso
1. Opcional: preencha `data/base/mapeamentos.json` com UUIDs reais das lojas/planos do Supabase
2. Rode o script de ingestão:
   - Python: `scripts/ingest_export_csv.py`
3. Resultado no terminal:
   - Totais e caminhos dos CSVs gerados
4. Importe os CSVs no Supabase (na ordem):
   - `lancamentos_from_export.csv` → tabela `lancamentos`
   - `parcelas_from_export.csv` → tabela `parcelas`

## Validação
- Compare os totais com `VALIDACAO_DASHBOARD.sql`
- Conferir quantidade de lançamentos vs parcelas (1:1 neste estágio)
- Conferir amostras manuais (datas, valores, status)

## Próximos passos
- Preencher IDs reais de `loja_id` e `plano_id` via join no banco (usando `loja_nome` e `plano_codigo`/`plano_nome`)
- Evoluir parser para múltiplas parcelas (se houver linhas por parcela, manter 1:1)
- Deduplicação por `Código da conciliação` (quando disponível)
