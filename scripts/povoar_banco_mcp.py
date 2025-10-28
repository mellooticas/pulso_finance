#!/usr/bin/env python3
"""
🎯 PULSO Finance - Povoamento via MCP Supabase

Executa os scripts SQL de povoamento usando o MCP do Supabase,
contornando o limite do SQL Editor para queries grandes.

Uso:
    python scripts/povoar_banco_mcp.py
"""

import os
import sys
from pathlib import Path
import time

# Configuração
PROJECT_REF = "fxsgphqzazcbjcyfqeyg"
SEEDS_DIR = Path(__file__).parent.parent / "database" / "seeds"

def listar_arquivos_sql():
    """Lista todos os arquivos SQL de povoamento na ordem correta."""
    arquivos = []
    
    # Migração base primeiro
    migracao = SEEDS_DIR / "00_EXECUTAR_MIGRACAO.sql"
    if migracao.exists():
        arquivos.append(("00_MIGRACAO", migracao))
    
    # Lotes yampa (01-143)
    for i in range(1, 144):
        lote = SEEDS_DIR / f"{i:02d}_yampa_lote_{i:03d}.sql" if i < 100 else SEEDS_DIR / f"{i}_yampa_lote_{i}.sql"
        if lote.exists():
            arquivos.append((f"LOTE_{i:03d}", lote))
    
    return arquivos

def ler_sql(arquivo: Path) -> str:
    """Lê o conteúdo de um arquivo SQL."""
    with open(arquivo, 'r', encoding='utf-8') as f:
        return f.read()

def executar_via_mcp(nome: str, sql: str, dry_run: bool = False):
    """
    Executa SQL via MCP do Supabase.
    
    Como o MCP está configurado como ferramenta HTTP, você pode:
    1. Usar a ferramenta mcp_supabase_apply_migration
    2. Ou executar via mcp_supabase_execute_sql para queries DML
    """
    print(f"\n{'='*80}")
    print(f"📦 Executando: {nome}")
    print(f"📊 Tamanho: {len(sql):,} caracteres")
    print(f"{'='*80}")
    
    if dry_run:
        print("🔍 DRY RUN - SQL não será executado")
        print(f"Primeiras 500 caracteres:\n{sql[:500]}")
        return True
    
    # Aqui você executaria via MCP
    # Como não temos acesso direto ao MCP via Python sem biblioteca específica,
    # vamos criar um script que você pode executar manualmente
    print("⚠️  Execute manualmente via MCP ou psql:")
    print(f"   Arquivo: {nome}")
    return True

def main():
    """Função principal."""
    print("""
    ╔══════════════════════════════════════════════════════════════╗
    ║  🎯 PULSO Finance - Povoamento via MCP Supabase             ║
    ║                                                              ║
    ║  Este script prepara os arquivos SQL para execução via:     ║
    ║  1. MCP do Supabase (mcp_supabase_apply_migration)         ║
    ║  2. Conexão direta via psql                                 ║
    ║  3. Supabase CLI                                            ║
    ╚══════════════════════════════════════════════════════════════╝
    """)
    
    # Listar arquivos
    arquivos = listar_arquivos_sql()
    
    if not arquivos:
        print("❌ Nenhum arquivo SQL encontrado em database/seeds/")
        return 1
    
    print(f"\n✅ Encontrados {len(arquivos)} arquivos SQL para executar\n")
    
    # Exibir resumo
    total_size = 0
    for nome, arquivo in arquivos:
        tamanho = os.path.getsize(arquivo)
        total_size += tamanho
        print(f"   {nome:20s} - {tamanho:>10,} bytes - {arquivo.name}")
    
    print(f"\n📊 Tamanho total: {total_size:,} bytes ({total_size/1024/1024:.2f} MB)")
    
    # Perguntar método de execução
    print("\n" + "="*80)
    print("MÉTODO DE EXECUÇÃO")
    print("="*80)
    print("""
    Escolha o método de execução:
    
    1. Via MCP Supabase (mcp_supabase_apply_migration)
       ✅ Melhor para migrations
       ✅ Controle de versão
       ⚠️  Requer ferramenta MCP ativa
    
    2. Via psql (conexão direta)
       ✅ Sem limites de tamanho
       ✅ Mais rápido para grandes volumes
       ⚠️  Requer senha do banco
    
    3. Gerar script shell unificado
       ✅ Executar todos de uma vez
       ✅ Fácil de revisar
    
    4. Dry run (apenas visualizar)
    """)
    
    escolha = input("Escolha (1-4): ").strip()
    
    if escolha == "1":
        executar_via_mcp_tool(arquivos)
    elif escolha == "2":
        executar_via_psql(arquivos)
    elif escolha == "3":
        gerar_script_shell(arquivos)
    elif escolha == "4":
        dry_run(arquivos)
    else:
        print("❌ Opção inválida")
        return 1
    
    return 0

def executar_via_mcp_tool(arquivos):
    """Executa via ferramenta MCP do Supabase."""
    print("\n🔧 EXECUÇÃO VIA MCP SUPABASE")
    print("="*80)
    print("""
    Para executar via MCP, use a ferramenta 'mcp_supabase_apply_migration':
    
    Para cada arquivo SQL, execute:
    """)
    
    for i, (nome, arquivo) in enumerate(arquivos, 1):
        sql = ler_sql(arquivo)
        print(f"""
    {i}. {nome}:
       await mcp_supabase_apply_migration({{
           name: "{nome.lower()}",
           query: `{sql[:100]}...`
       }})
    """)
        
        if i >= 3:
            print("    ... (143 arquivos no total)")
            break
    
    print("""
    💡 DICA: Como são muitos arquivos, recomendo usar método 2 (psql) ou 3 (script shell)
    """)

def executar_via_psql(arquivos):
    """Gera comandos psql para execução direta."""
    print("\n🐘 EXECUÇÃO VIA PSQL (CONEXÃO DIRETA)")
    print("="*80)
    
    # Solicitar senha
    print("\nVocê precisará da senha do banco PostgreSQL.")
    print("Connection string: postgresql://postgres:[YOUR_PASSWORD]@db.fxsgphqzazcbjcyfqeyg.supabase.co:5432/postgres")
    
    usar_env = input("\nUsar senha da variável de ambiente SUPABASE_DB_PASSWORD? (s/n): ").strip().lower()
    
    if usar_env == 's':
        senha = os.getenv('SUPABASE_DB_PASSWORD')
        if not senha:
            print("❌ Variável SUPABASE_DB_PASSWORD não encontrada")
            print("   Configure com: export SUPABASE_DB_PASSWORD='sua_senha'")
            return
    else:
        from getpass import getpass
        senha = getpass("Digite a senha do PostgreSQL: ")
    
    # Gerar script de execução
    script_path = SEEDS_DIR / "executar_psql.sh"
    
    with open(script_path, 'w', encoding='utf-8') as f:
        f.write("#!/bin/bash\n")
        f.write("# Script gerado automaticamente - PULSO Finance\n")
        f.write("# Executa povoamento via psql\n\n")
        f.write(f"export PGPASSWORD='{senha}'\n")
        f.write("HOST='db.fxsgphqzazcbjcyfqeyg.supabase.co'\n")
        f.write("PORT='5432'\n")
        f.write("USER='postgres'\n")
        f.write("DB='postgres'\n\n")
        
        for nome, arquivo in arquivos:
            f.write(f"echo '📦 Executando {nome}...'\n")
            f.write(f"psql -h $HOST -p $PORT -U $USER -d $DB -f '{arquivo.absolute()}'\n")
            f.write(f"if [ $? -eq 0 ]; then\n")
            f.write(f"    echo '✅ {nome} concluído'\n")
            f.write(f"else\n")
            f.write(f"    echo '❌ Erro em {nome}'\n")
            f.write(f"    exit 1\n")
            f.write(f"fi\n\n")
        
        f.write("echo '🎉 Povoamento concluído!'\n")
        f.write("unset PGPASSWORD\n")
    
    # Tornar executável
    os.chmod(script_path, 0o755)
    
    print(f"\n✅ Script gerado: {script_path}")
    print("\n📝 Para executar:")
    print(f"   bash {script_path}")

def gerar_script_shell(arquivos):
    """Gera script shell para execução manual."""
    print("\n📜 GERANDO SCRIPT SHELL")
    print("="*80)
    
    script_path = SEEDS_DIR / "executar_povoamento.sh"
    
    with open(script_path, 'w', encoding='utf-8') as f:
        f.write("#!/bin/bash\n")
        f.write("# PULSO Finance - Script de Povoamento\n")
        f.write("# Gerado automaticamente\n\n")
        f.write("# Configure estas variáveis antes de executar:\n")
        f.write("export PGPASSWORD='SUA_SENHA_AQUI'\n")
        f.write("HOST='db.fxsgphqzazcbjcyfqeyg.supabase.co'\n")
        f.write("PORT='5432'\n")
        f.write("USER='postgres'\n")
        f.write("DB='postgres'\n\n")
        f.write("# Verificar se psql está instalado\n")
        f.write("if ! command -v psql &> /dev/null; then\n")
        f.write("    echo '❌ psql não encontrado. Instale PostgreSQL client.'\n")
        f.write("    exit 1\n")
        f.write("fi\n\n")
        
        for i, (nome, arquivo) in enumerate(arquivos, 1):
            f.write(f"echo 'Executando {i}/{len(arquivos)}: {nome}...'\n")
            f.write(f"psql -h $HOST -p $PORT -U $USER -d $DB -f '{arquivo.absolute()}'\n\n")
        
        f.write("echo '🎉 Povoamento concluído!'\n")
        f.write("unset PGPASSWORD\n")
    
    os.chmod(script_path, 0o755)
    
    print(f"\n✅ Script gerado: {script_path}")
    print("\n📝 Antes de executar:")
    print("   1. Edite o arquivo e substitua 'SUA_SENHA_AQUI'")
    print("   2. Execute: bash executar_povoamento.sh")

def dry_run(arquivos):
    """Executa dry run para visualizar."""
    print("\n🔍 DRY RUN - Visualização")
    print("="*80)
    
    for nome, arquivo in arquivos[:3]:
        sql = ler_sql(arquivo)
        executar_via_mcp(nome, sql, dry_run=True)
        time.sleep(0.5)
    
    print(f"\n... (+{len(arquivos)-3} arquivos)")

if __name__ == "__main__":
    sys.exit(main())
