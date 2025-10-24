#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Orquestrador via MCP Supabase - Executa povoamento em chunks
Usa apenas a ferramenta mcp_supabase_execute_sql
"""
from pathlib import Path
import re

SEEDS_DIR = Path(__file__).parent.parent / "database" / "seeds"

# Lista de arquivos para executar NA ORDEM
MESTRES_FILES = [
    "02_mestres_lojas.sql",
    "02_plano_contas_lote_01.sql",
    "02_plano_contas_lote_02.sql",
    "02_plano_contas_lote_03.sql",
    "02_plano_contas_lote_04.sql",
    "02_plano_contas_lote_05.sql",
    "02_plano_contas_lote_06.sql",
    "02_mestres_centros_custo.sql",
    "02_mestres_contas_financeiras.sql",
    "02_fornecedores_lote_01.sql",
]

def split_into_do_blocks(sql_content):
    """Divide SQL em blocos DO $$ ... END $$;"""
    pattern = r'(DO \$\$.*?END \$\$;)'
    blocos = re.findall(pattern, sql_content, re.DOTALL)
    return blocos

def split_into_inserts(sql_content):
    """Divide SQL em blocos INSERT"""
    # Remove comentários e linhas vazias
    lines = [l for l in sql_content.split('\n') 
             if l.strip() and not l.strip().startswith('--')]
    
    blocks = []
    current_block = []
    
    for line in lines:
        current_block.append(line)
        if ';' in line:
            blocks.append('\n'.join(current_block))
            current_block = []
    
    if current_block:
        blocks.append('\n'.join(current_block))
    
    return [b for b in blocks if 'INSERT' in b or 'SELECT' in b or 'SET' in b]

def prepare_chunks():
    """Prepara chunks para execução"""
    print("="*70)
    print("📋 PREPARANDO CHUNKS PARA EXECUÇÃO VIA MCP")
    print("="*70)
    print()
    
    all_chunks = []
    
    for filename in MESTRES_FILES:
        filepath = SEEDS_DIR / filename
        
        if not filepath.exists():
            print(f"⚠️  Arquivo não encontrado: {filename}")
            continue
        
        print(f"📄 Processando: {filename}")
        sql_content = filepath.read_text(encoding='utf-8')
        
        # Tenta dividir em blocos DO $$
        chunks = split_into_do_blocks(sql_content)
        
        # Se não encontrou DO $$, divide em INSERTs
        if not chunks:
            chunks = split_into_inserts(sql_content)
        
        # Se ainda não tem chunks, usa o arquivo inteiro
        if not chunks:
            chunks = [sql_content]
        
        print(f"   ✅ {len(chunks)} chunks")
        
        for i, chunk in enumerate(chunks, 1):
            all_chunks.append({
                'file': filename,
                'chunk_num': i,
                'total_chunks': len(chunks),
                'sql': chunk
            })
    
    print()
    print(f"📊 Total de chunks preparados: {len(all_chunks)}")
    print()
    
    return all_chunks

def generate_mcp_commands(chunks):
    """Gera comandos MCP para execução"""
    print("="*70)
    print("🚀 COMANDOS PARA EXECUTAR VIA MCP")
    print("="*70)
    print()
    print("Cole estes comandos um por vez no terminal Python/Copilot:")
    print()
    
    for chunk in chunks:
        print(f"# {chunk['file']} - Chunk {chunk['chunk_num']}/{chunk['total_chunks']}")
        print(f"mcp_supabase_execute_sql(query='''")
        print(chunk['sql'])
        print(f"''')")
        print()
        print("-"*70)
        print()

def save_chunks_to_files(chunks):
    """Salva chunks em arquivos individuais para facilitar"""
    output_dir = SEEDS_DIR / "chunks_mcp"
    output_dir.mkdir(exist_ok=True)
    
    print(f"💾 Salvando chunks em: {output_dir}")
    print()
    
    for i, chunk in enumerate(chunks, 1):
        filename = f"{i:03d}_{chunk['file'].replace('.sql', '')}_chunk_{chunk['chunk_num']}.sql"
        filepath = output_dir / filename
        filepath.write_text(chunk['sql'], encoding='utf-8')
    
    print(f"✅ {len(chunks)} arquivos salvos")
    print()
    print("📝 Para executar via MCP, use:")
    print("   1. Abra cada arquivo em ordem (001, 002, 003...)")
    print("   2. Copie o conteúdo")
    print("   3. Execute: mcp_supabase_execute_sql(query='CONTEÚDO_COPIADO')")

def main():
    chunks = prepare_chunks()
    
    print()
    print("Escolha uma opção:")
    print("  1. Gerar comandos MCP (copiar/colar)")
    print("  2. Salvar chunks em arquivos separados")
    print("  3. Ambos")
    
    choice = input("\nOpção (1/2/3): ").strip()
    
    if choice in ['1', '3']:
        generate_mcp_commands(chunks[:5])  # Mostra apenas os 5 primeiros como exemplo
        print("... (demais chunks omitidos para não poluir)")
    
    if choice in ['2', '3']:
        save_chunks_to_files(chunks)
    
    print()
    print("="*70)
    print("✅ PREPARAÇÃO CONCLUÍDA")
    print("="*70)

if __name__ == "__main__":
    main()
