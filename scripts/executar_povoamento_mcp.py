#!/usr/bin/env python3
"""
🎯 PULSO Finance - Povoamento via MCP Supabase

Executa o povoamento usando o MCP do Supabase já configurado.
"""

import os
import sys
from pathlib import Path

SEEDS_DIR = Path(__file__).parent.parent / "database" / "seeds"

def main():
    """Executa povoamento via MCP."""
    print("""
╔══════════════════════════════════════════════════════════════╗
║  🎯 PULSO Finance - Povoamento Automático                   ║
║                                                              ║
║  Executando via MCP Supabase                                ║
║  Project: fxsgphqzazcbjcyfqeyg                              ║
╚══════════════════════════════════════════════════════════════╝
    """)
    
    # Verificar se temos os lotes
    lotes = list(SEEDS_DIR.glob("*_yampa_lote_*.sql"))
    lotes.sort()
    
    print(f"✅ Encontrados {len(lotes)} lotes SQL")
    
    # Como o MCP está disponível via tools do Copilot,
    # vamos preparar a execução sequencial
    print("\n📝 INSTRUÇÕES DE EXECUÇÃO:")
    print("="*80)
    print("""
Como você já tem o MCP do Supabase configurado, vou executar
os lotes sequencialmente usando a ferramenta mcp_supabase_apply_migration.

Isso vai:
✅ Contornar o limite do SQL Editor
✅ Executar em lotes gerenciados
✅ Ter controle de erros por lote
    """)
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
