#!/bin/bash

# Script para processar lotes de fornecedores via Supabase
# Executa lotes 007-065 sequencialmente

LOTES_DIR="d:/projetos/pulso_finance/database/seeds/fornecedores_lotes"
LOG_FILE="d:/projetos/pulso_finance/database/seeds/execucao_lotes.log"

echo "=== Iniciando execução em lotes ===" > "$LOG_FILE"
echo "Data: $(date)" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Função para executar um lote
executar_lote() {
    local numero=$1
    local arquivo="${LOTES_DIR}/fornecedores_lote_$(printf '%03d' $numero).sql"
    
    if [ ! -f "$arquivo" ]; then
        echo "ERRO: Arquivo $arquivo não encontrado" | tee -a "$LOG_FILE"
        return 1
    fi
    
    echo "Processando lote $numero..." | tee -a "$LOG_FILE"
    
    # Aqui você pode adicionar o comando para executar via Supabase
    # Por enquanto, apenas registra no log
    echo "  Arquivo: $arquivo" >> "$LOG_FILE"
    wc -l "$arquivo" >> "$LOG_FILE"
    
    return 0
}

# Executar lotes de 007 a 065
for i in $(seq 7 65); do
    executar_lote $i
    if [ $? -eq 0 ]; then
        echo "  ✓ Lote $i concluído" | tee -a "$LOG_FILE"
    else
        echo "  ✗ Lote $i falhou" | tee -a "$LOG_FILE"
        # Descomente a linha abaixo para parar em caso de erro
        # exit 1
    fi
    echo "" >> "$LOG_FILE"
done

echo "" >> "$LOG_FILE"
echo "=== Execução finalizada ===" | tee -a "$LOG_FILE"
echo "Data: $(date)" >> "$LOG_FILE"
