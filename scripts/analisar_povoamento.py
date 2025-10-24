"""
Script para executar povoamento completo via chamadas diretas ao MCP
Executa lotes pequenos para evitar timeouts
"""
import re
import sys
from pathlib import Path

def dividir_sql_em_blocos_executaveis(sql_content, max_blocos=10):
    """Divide SQL em blocos pequenos executáveis"""
    # Para DO $$ blocks
    if 'DO $$' in sql_content:
        pattern = r'(DO \$\$.*?END \$\$;)'
        blocos = re.findall(pattern, sql_content, re.DOTALL)
        
        # Agrupar em lotes de max_blocos
        lotes = []
        for i in range(0, len(blocos), max_blocos):
            lote = '\n\n'.join(blocos[i:i+max_blocos])
            lotes.append(lote)
        return lotes
    
    # Para INSERTs simples
    elif 'INSERT INTO' in sql_content:
        # Pegar header (comentários e SET session)
        lines = sql_content.split('\n')
        header = []
        inserts = []
        
        for line in lines:
            if line.strip().startswith('--') or 'SET session' in line:
                header.append(line)
            elif line.strip().startswith('INSERT INTO'):
                inserts.append(line)
            elif inserts and line.strip():
                # Linha de continuação do último INSERT
                inserts[-1] += '\n' + line
        
        # Agrupar INSERTs em lotes
        lotes = []
        for i in range(0, len(inserts), max_blocos):
            lote = '\n'.join(header[:3]) + '\n\n' + '\n\n'.join(inserts[i:i+max_blocos])
            lotes.append(lote)
        return lotes
    
    # Fallback: dividir por tamanho
    max_size = 50000  # 50KB
    lotes = []
    current = ""
    
    for line in sql_content.split('\n'):
        if len(current) + len(line) > max_size:
            if current:
                lotes.append(current)
            current = line + '\n'
        else:
            current += line + '\n'
    
    if current:
        lotes.append(current)
    
    return lotes


def main():
    base_dir = Path(__file__).parent.parent
    seeds_dir = base_dir / 'database' / 'seeds'
    
    print("=" * 70)
    print(" 🚀 ESTRATÉGIA DE POVOAMENTO - ANÁLISE E PLANEJAMENTO")
    print("=" * 70)
    print()
    
    # Analisar cada arquivo
    arquivos = [
        ('02_povoar_mestres.sql', 'Tabelas Mestres (lojas, plano, centros, contas, fornecedores)'),
        ('03_povoar_transacionais.sql', 'Lançamentos e Parcelas')
    ]
    
    for arquivo, descricao in arquivos:
        caminho = seeds_dir / arquivo
        if not caminho.exists():
            print(f"❌ Arquivo não encontrado: {arquivo}")
            continue
        
        with open(caminho, 'r', encoding='utf-8') as f:
            sql = f.read()
        
        tamanho_kb = len(sql) / 1024
        linhas = len(sql.split('\n'))
        
        print(f"📄 {arquivo}")
        print(f"   {descricao}")
        print(f"   📊 Tamanho: {tamanho_kb:.1f} KB")
        print(f"   📏 Linhas: {linhas:,}")
        
        # Tentar dividir
        lotes = dividir_sql_em_blocos_executaveis(sql, max_blocos=10)
        print(f"   🔀 Dividido em: {len(lotes)} lotes")
        
        if len(lotes) > 0:
            print(f"   📦 Tamanho médio por lote: {tamanho_kb/len(lotes):.1f} KB")
        
        # Salvar lotes
        output_dir = seeds_dir / f"lotes_{arquivo.replace('.sql', '')}"
        output_dir.mkdir(exist_ok=True)
        
        for i, lote in enumerate(lotes, 1):
            lote_path = output_dir / f"lote_{i:03d}.sql"
            with open(lote_path, 'w', encoding='utf-8') as f:
                f.write(lote)
        
        print(f"   ✅ Lotes salvos em: {output_dir.name}/")
        print()
    
    print("=" * 70)
    print(" ✅ ANÁLISE CONCLUÍDA!")
    print("=" * 70)
    print()
    print("📌 Recomendação:")
    print("   Dado o tamanho dos arquivos (especialmente transacionais com 2M+ linhas),")
    print("   a melhor abordagem é:")
    print()
    print("   OPÇÃO 1 (Recomendada): Instalar PostgreSQL client e executar via psql")
    print("   - Download: https://www.postgresql.org/download/windows/")
    print("   - Executar: psql -h db.fxsgphqzazcbjcyfqeyg.supabase.co -U postgres -d postgres -f 02_povoar_mestres.sql")
    print()
    print("   OPÇÃO 2: Executar manualmente via Supabase SQL Editor")
    print("   - Abrir: https://supabase.com/dashboard/project/fxsgphqzazcbjcyfqeyg/sql")
    print("   - Copiar e executar cada lote manualmente")
    print()
    print("   OPÇÃO 3: Usar Copilot GitHub para executar via MCP")
    print("   - Pedir ao assistente para executar cada lote dos diretórios criados")
    print()

if __name__ == '__main__':
    main()
