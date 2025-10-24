"""
Script para executar povoamento de mestres via MCP em lotes inteligentes
"""
from pathlib import Path

def main():
    base_dir = Path(__file__).parent.parent
    seeds_dir = base_dir / 'database' / 'seeds'
    
    # Ler arquivo completo
    with open(seeds_dir / '02_povoar_mestres.sql', 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Encontrar seções
    sections = {}
    
    # 1. Lojas (já executado - pular)
    # 2. Plano de contas
    start_plano = content.find('-- PLANO DE CONTAS')
    end_plano = content.find('-- CENTROS DE CUSTO')
    sections['plano_contas'] = content[start_plano:end_plano].strip()
    
    # 3. Centros de custo  
    start_centros = content.find('-- CENTROS DE CUSTO')
    end_centros = content.find('-- CONTAS FINANCEIRAS')
    sections['centros_custo'] = content[start_centros:end_centros].strip()
    
    # 4. Contas financeiras
    start_contas = content.find('-- CONTAS FINANCEIRAS')
    end_contas = content.find('-- FORNECEDORES')
    sections['contas_financeiras'] = content[start_contas:end_contas].strip()
    
    # 5. Fornecedores
    start_forn = content.find('-- FORNECEDORES')
    end_forn = content.find('-- Reabilitar triggers')
    sections['fornecedores'] = content[start_forn:end_forn].strip()
    
    # Salvar cada seção em arquivo separado
    for nome, sql in sections.items():
        output_file = seeds_dir / f'02_mestres_{nome}.sql'
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(sql)
        
        linhas = len(sql.split('\n'))
        tamanho_kb = len(sql) / 1024
        print(f'✅ {nome:20s} - {linhas:6,d} linhas - {tamanho_kb:8.1f} KB - {output_file.name}')
    
    print()
    print('📁 Arquivos criados em database/seeds/')
    print('   Use: mcp_supabase_execute_sql para executar cada um')

if __name__ == '__main__':
    main()
