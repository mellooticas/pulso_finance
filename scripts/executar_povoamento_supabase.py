"""
Script para executar povoamento via MCP Supabase
Divide arquivos grandes em lotes menores para evitar timeouts
"""
import os
import re
from pathlib import Path

def ler_sql(caminho):
    """Lê arquivo SQL"""
    with open(caminho, 'r', encoding='utf-8') as f:
        return f.read()

def dividir_plano_contas(sql_content):
    """Divide o plano de contas em blocos DO $$ individuais"""
    # Encontrar todos os blocos DO $$
    pattern = r'(DO \$\$.*?END \$\$;)'
    blocos = re.findall(pattern, sql_content, re.DOTALL)
    
    print(f"   - Encontrados {len(blocos)} blocos DO $$")
    
    # Agrupar em lotes de 20 blocos
    lotes = []
    for i in range(0, len(blocos), 20):
        lote = '\n\n'.join(blocos[i:i+20])
        lotes.append(lote)
    
    return lotes

def main():
    base_dir = Path(__file__).parent.parent
    seeds_dir = base_dir / 'database' / 'seeds'
    
    print("🚀 Iniciando povoamento via Supabase...")
    print()
    
    # 1. Lojas (já executado)
    print("✅ 1/5 Lojas (já executadas)")
    
    # 2. Plano de contas - dividir em lotes
    print("📋 2/5 Plano de contas...")
    sql_plano = ler_sql(seeds_dir / '02_mestres_plano_contas.sql')
    lotes_plano = dividir_plano_contas(sql_plano)
    
    # Salvar lotes
    for i, lote in enumerate(lotes_plano, 1):
        output_file = seeds_dir / f'02_plano_contas_lote_{i:02d}.sql'
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(lote)
    
    print(f"   ✅ Dividido em {len(lotes_plano)} lotes")
    print(f"   📁 Arquivos: 02_plano_contas_lote_01.sql até 02_plano_contas_lote_{len(lotes_plano):02d}.sql")
    print()
    
    # 3. Centros de custo
    print("🏢 3/5 Centros de custo...")
    sql_centros = ler_sql(seeds_dir / '02_mestres_centros_custo.sql')
    with open(seeds_dir / '02_centros_executar.sql', 'w', encoding='utf-8') as f:
        f.write(sql_centros)
    print("   ✅ Preparado")
    print()
    
    # 4. Contas financeiras
    print("💳 4/5 Contas financeiras...")
    sql_contas = ler_sql(seeds_dir / '02_mestres_contas_financeiras.sql')
    with open(seeds_dir / '02_contas_executar.sql', 'w', encoding='utf-8') as f:
        f.write(sql_contas)
    print("   ✅ Preparado")
    print()
    
    # 5. Fornecedores - dividir em lotes
    print("🏭 5/5 Fornecedores...")
    sql_fornecedores = ler_sql(seeds_dir / '02_mestres_fornecedores.sql')
    
    # Dividir por INSERT INTO
    inserts = sql_fornecedores.split('INSERT INTO fornecedores')
    inserts = [f'INSERT INTO fornecedores{ins}' for ins in inserts[1:] if ins.strip()]
    
    print(f"   - Encontrados {len(inserts)} INSERTs")
    
    # Agrupar em lotes de 500
    lotes_forn = []
    for i in range(0, len(inserts), 500):
        lote = '\n'.join(inserts[i:i+500])
        lotes_forn.append(lote)
    
    # Salvar lotes
    for i, lote in enumerate(lotes_forn, 1):
        output_file = seeds_dir / f'02_fornecedores_lote_{i:02d}.sql'
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(lote)
    
    print(f"   ✅ Dividido em {len(lotes_forn)} lotes")
    print(f"   📁 Arquivos: 02_fornecedores_lote_01.sql até 02_fornecedores_lote_{len(lotes_forn):02d}.sql")
    print()
    
    print("=" * 60)
    print("✅ PREPARAÇÃO CONCLUÍDA!")
    print("=" * 60)
    print()
    print("📌 Próximos passos:")
    print(f"   1. Executar {len(lotes_plano)} lotes do plano de contas via MCP")
    print(f"   2. Executar centros de custo")
    print(f"   3. Executar contas financeiras")
    print(f"   4. Executar {len(lotes_forn)} lotes de fornecedores via MCP")
    print()

if __name__ == '__main__':
    main()
