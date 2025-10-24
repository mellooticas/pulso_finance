#!/usr/bin/env python3
"""
Script para executar lotes de fornecedores sequencialmente no Supabase.
Usa o MCP do Supabase para executar cada lote individualmente.
"""

import os
import subprocess
import sys
from pathlib import Path

LOTES_DIR = Path("d:/projetos/pulso_finance/database/seeds/fornecedores_lotes")
INICIO = 7  # Lote inicial
FIM = 10     # Lote final

def executar_lote(numero):
    """Executa um lote via arquivo SQL"""
    arquivo = LOTES_DIR / f"fornecedores_lote_{numero:03d}.sql"
    
    if not arquivo.exists():
        print(f"❌ Arquivo não encontrado: {arquivo}")
        return False
    
    print(f"📥 Processando lote {numero}...")
    print(f"   Arquivo: {arquivo.name}")
    
    # Ler o conteúdo do arquivo
    with open(arquivo, 'r', encoding='utf-8') as f:
        sql_content = f.read()
    
    # Contar linhas
    num_linhas = sql_content.count('\n') + 1
    print(f"   Linhas: {num_linhas}")
    
    # Aqui você execut aria via MCP Supabase
    # Por enquanto, apenas simula
    print(f"   ✓ SQL lido com sucesso")
    
    return True

def main():
    print("="*60)
    print("EXECUÇÃO DE LOTES DE FORNECEDORES")
    print("="*60)
    print()
    
    sucessos = 0
    falhas = 0
    
    for i in range(INICIO, FIM + 1):
        if executar_lote(i):
            sucessos += 1
        else:
            falhas += 1
        print()
    
    print("="*60)
    print(f"RESUMO: {sucessos} sucessos, {falhas} falhas")
    print("="*60)

if __name__ == "__main__":
    main()
