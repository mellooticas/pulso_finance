#!/usr/bin/env python3
"""
Executa limpeza e repopulação do banco via MCP Supabase
Usa as ferramentas MCP para evitar limite do SQL Editor
"""

import sys
from pathlib import Path

# Adicionar diretório raiz ao path
BASE_DIR = Path(__file__).parent.parent
sys.path.insert(0, str(BASE_DIR))

SEEDS_DIR = BASE_DIR / "database" / "seeds"


def ler_sql(filename: str) -> str:
    """Lê conteúdo de um arquivo SQL"""
    filepath = SEEDS_DIR / filename
    if not filepath.exists():
        raise FileNotFoundError(f"Arquivo não encontrado: {filepath}")
    
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()


def executar_via_mcp():
    """
    Executa os SQLs via MCP Supabase
    
    IMPORTANTE: Este script mostra INSTRUÇÕES de como executar via MCP.
    A execução real deve ser feita pelo Copilot usando as ferramentas MCP.
    """
    
    print("="*70)
    print("🚀 EXECUÇÃO VIA MCP SUPABASE")
    print("="*70)
    print()
    
    print("📋 Este script preparou 3 arquivos SQL para execução:")
    print()
    
    sqls = [
        ("01_limpar_banco.sql", "Limpeza de todas as tabelas"),
        ("02_povoar_mestres.sql", "População de tabelas mestres"),
        ("03_povoar_transacionais.sql", "População de lançamentos e parcelas"),
    ]
    
    for filename, descricao in sqls:
        filepath = SEEDS_DIR / filename
        if filepath.exists():
            tamanho = filepath.stat().st_size / 1024  # KB
            print(f"   ✅ {filename:30} - {descricao:40} ({tamanho:.1f} KB)")
        else:
            print(f"   ❌ {filename:30} - ARQUIVO NÃO ENCONTRADO")
    
    print()
    print("="*70)
    print("⚠️  ATENÇÃO: EXECUÇÃO MANUAL NECESSÁRIA")
    print("="*70)
    print()
    print("Para executar via MCP Supabase, use as ferramentas MCP:")
    print()
    print("1️⃣  mcp_supabase_execute_sql - Para executar cada arquivo SQL")
    print("    ou")
    print("2️⃣  mcp_supabase_apply_migration - Para aplicar como migration")
    print()
    print("="*70)
    print("📝 INSTRUÇÕES DE EXECUÇÃO")
    print("="*70)
    print()
    
    for i, (filename, descricao) in enumerate(sqls, 1):
        print(f"{i}. {descricao}")
        print(f"   Arquivo: database/seeds/{filename}")
        print()
    
    print("="*70)
    print("🔍 VALIDAÇÃO PÓS-EXECUÇÃO")
    print("="*70)
    print()
    print("Após executar, valide com:")
    print()
    print("SELECT 'lojas' as tabela, COUNT(*) as total FROM lojas")
    print("UNION ALL SELECT 'plano_contas', COUNT(*) FROM plano_contas")
    print("UNION ALL SELECT 'fornecedores', COUNT(*) FROM fornecedores")
    print("UNION ALL SELECT 'lancamentos', COUNT(*) FROM lancamentos")
    print("UNION ALL SELECT 'parcelas', COUNT(*) FROM parcelas;")
    print()
    print("Valores esperados:")
    print("  - lojas: 4")
    print("  - plano_contas: 120")
    print("  - fornecedores: 12,816")
    print("  - lancamentos: 42,863")
    print("  - parcelas: 42,863")
    print()


def main():
    """Função principal"""
    
    try:
        executar_via_mcp()
        
        print("="*70)
        print("✅ Preparação concluída!")
        print("="*70)
        print()
        print("🤖 Agora peça ao Copilot para executar os SQLs via MCP Supabase.")
        print()
        
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
