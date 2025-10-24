#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Executa povoamento via MCP Supabase em chunks pequenos
Ideal quando a conexão direta falha mas o MCP funciona
"""
from pathlib import Path
import re

SEEDS_DIR = Path(__file__).parent.parent / "database" / "seeds"

def split_do_blocks(sql_content):
    """Divide SQL em blocos DO $$ individuais"""
    pattern = r'(DO \$\$.*?END \$\$;)'
    blocos = re.findall(pattern, sql_content, re.DOTALL)
    return blocos

def split_insert_statements(sql_content):
    """Divide SQL em INSERT statements individuais"""
    statements = []
    lines = sql_content.split('\n')
    current = []
    
    for line in lines:
        if line.strip().startswith('--') or not line.strip():
            continue
        current.append(line)
        if ';' in line:
            statements.append('\n'.join(current))
            current = []
    
    if current:
        statements.append('\n'.join(current))
    
    return statements

def main():
    print("📋 Preparando chunks para execução via MCP...")
    print()
    
    # Plano de contas - dividir em blocos DO $$
    for i in range(1, 7):
        arquivo = SEEDS_DIR / f"02_plano_contas_lote_{i:02d}.sql"
        if arquivo.exists():
            sql = arquivo.read_text(encoding='utf-8')
            blocos = split_do_blocks(sql)
            print(f"✅ Lote {i}: {len(blocos)} blocos DO $$")
            
            # Salvar cada bloco
            output_dir = SEEDS_DIR / "chunks_plano"
            output_dir.mkdir(exist_ok=True)
            
            for j, bloco in enumerate(blocos, 1):
                chunk_file = output_dir / f"plano_lote_{i:02d}_chunk_{j:03d}.sql"
                chunk_file.write_text(bloco, encoding='utf-8')
    
    print()
    print(f"📁 Chunks salvos em: {SEEDS_DIR / 'chunks_plano'}")
    print()
    print("💡 Use o MCP Supabase para executar cada chunk:")
    print("   mcp_supabase_execute_sql(query=chunk_content)")

if __name__ == "__main__":
    main()
