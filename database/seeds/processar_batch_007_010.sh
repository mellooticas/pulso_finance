#!/bin/bash

# Script para processar lotes individuais via script Python
# Este script cria arquivos temporários menores para execução

LOTES_DIR="d:/projetos/pulso_finance/database/seeds/fornecedores_lotes"
TEMP_COMBINED="d:/projetos/pulso_finance/database/seeds/temp_combined_batch.sql"

echo "Processando lotes 007-010..."

# Combinar os 4 lotes em um único arquivo
cat "${LOTES_DIR}/fornecedores_lote_007.sql" \
    "${LOTES_DIR}/fornecedores_lote_008.sql" \
    "${LOTES_DIR}/fornecedores_lote_009.sql" \
    "${LOTES_DIR}/fornecedores_lote_010.sql" > "$TEMP_COMBINED"

echo "Arquivo combinado criado: $TEMP_COMBINED"
wc -l "$TEMP_COMBINED"

echo ""
echo "Execute o seguinte comando manualmente via MCP Supabase:"
echo "cat $TEMP_COMBINED | supabase db execute"
