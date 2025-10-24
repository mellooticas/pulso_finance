#!/usr/bin/env python3
"""
🎯 PULSO Finance - Executar Povoamento Completo

Executa os 143 lotes SQL usando MCP do Supabase.
Este script será chamado pelo agente com acesso às ferramentas MCP.
"""

import sys
from pathlib import Path
import json

SEEDS_DIR = Path(__file__).parent.parent / "database" / "seeds"

def listar_lotes():
    """Lista todos os lotes SQL na ordem correta."""
    lotes = []
    
    # Lotes 01-143
    for i in range(1, 144):
        if i < 10:
            arquivo = SEEDS_DIR / f"0{i}_yampa_lote_00{i}.sql"
        elif i < 100:
            arquivo = SEEDS_DIR / f"{i}_yampa_lote_0{i}.sql"
        else:
            arquivo = SEEDS_DIR / f"{i}_yampa_lote_{i}.sql"
        
        if arquivo.exists():
            lotes.append({
                'numero': i,
                'arquivo': str(arquivo),
                'nome': f"yampa_lote_{i:03d}"
            })
    
    return lotes

def main():
    """Prepara informações para o agente executar."""
    lotes = listar_lotes()
    
    print(json.dumps({
        'total_lotes': len(lotes),
        'lotes': lotes,
        'instrucoes': {
            'ferramenta': 'mcp_supabase_apply_migration',
            'parametros': {
                'name': 'yampa_lote_XXX',
                'query': '-- Conteúdo do arquivo SQL'
            }
        }
    }, indent=2))
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
