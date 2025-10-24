"""
Script para executar SQLs grandes direto no Supabase via psycopg2
"""
import os
import re
import sys
from pathlib import Path

try:
    import psycopg2
except ImportError:
    print("❌ Biblioteca psycopg2 não instalada!")
    print("   Instale com: pip install psycopg2-binary")
    sys.exit(1)

# Connection string do Supabase
CONN_STRING = "postgresql://postgres:gg4SzQdEJg2jxwWp@db.fxsgphqzazcbjcyfqeyg.supabase.co:5432/postgres"

def executar_sql_arquivo(cursor, caminho, descricao):
    """Executa um arquivo SQL"""
    print(f"⏳ {descricao}...")
    
    with open(caminho, 'r', encoding='utf-8') as f:
        sql = f.read()
    
    # Remover comentários e linhas vazias
    sql = re.sub(r'--.*$', '', sql, flags=re.MULTILINE)
    sql = '\n'.join([line for line in sql.split('\n') if line.strip()])
    
    try:
        cursor.execute(sql)
        print(f"   ✅ Concluído!")
        return True
    except Exception as e:
        print(f"   ❌ Erro: {str(e)[:200]}")
        return False

def main():
    base_dir = Path(__file__).parent.parent
    seeds_dir = base_dir / 'database' / 'seeds'
    
    print("=" * 60)
    print("🚀 POVOAMENTO DO BANCO SUPABASE")
    print("=" * 60)
    print()
    
    # Conectar ao banco
    print("🔌 Conectando ao Supabase...")
    try:
        conn = psycopg2.connect(CONN_STRING)
        conn.autocommit = False  # Usar transações manuais
        cursor = conn.cursor()
        print("   ✅ Conectado!")
        print()
    except Exception as e:
        print(f"   ❌ Erro na conexão: {e}")
        return
    
    try:
        # 1. Lojas (já executado, mas vamos confirmar)
        cursor.execute("SELECT COUNT(*) FROM lojas")
        count_lojas = cursor.fetchone()[0]
        if count_lojas == 0:
            print("📍 1/5 Inserindo lojas...")
            cursor.execute("""
                INSERT INTO lojas (id, codigo, nome, ativa, created_at, updated_at)
                VALUES 
                    (gen_random_uuid(), 'MAU', 'Mauá', True, NOW(), NOW()),
                    (gen_random_uuid(), 'PER', 'Perdizes', True, NOW(), NOW()),
                    (gen_random_uuid(), 'RIO', 'Rio Claro', True, NOW(), NOW()),
                    (gen_random_uuid(), 'SUZ', 'Suzano', True, NOW(), NOW())
            """)
            conn.commit()
            print("   ✅ 4 lojas inseridas!")
        else:
            print(f"✅ 1/5 Lojas (já existem {count_lojas})")
        print()
        
        # 2. Plano de contas
        if executar_sql_arquivo(cursor, seeds_dir / '02_mestres_plano_contas.sql', '📋 2/5 Plano de contas'):
            conn.commit()
            cursor.execute("SELECT COUNT(*) FROM plano_contas")
            print(f"   📊 {cursor.fetchone()[0]} contas inseridas")
        else:
            conn.rollback()
            print("   ⚠️  Rollback executado")
        print()
        
        # 3. Centros de custo
        if executar_sql_arquivo(cursor, seeds_dir / '02_mestres_centros_custo.sql', '🏢 3/5 Centros de custo'):
            conn.commit()
            cursor.execute("SELECT COUNT(*) FROM centros_custo")
            print(f"   📊 {cursor.fetchone()[0]} centros inseridos")
        else:
            conn.rollback()
            print("   ⚠️  Rollback executado")
        print()
        
        # 4. Contas financeiras
        if executar_sql_arquivo(cursor, seeds_dir / '02_mestres_contas_financeiras.sql', '💳 4/5 Contas financeiras'):
            conn.commit()
            cursor.execute("SELECT COUNT(*) FROM contas_financeiras")
            print(f"   📊 {cursor.fetchone()[0]} contas inseridas")
        else:
            conn.rollback()
            print("   ⚠️  Rollback executado")
        print()
        
        # 5. Fornecedores
        if executar_sql_arquivo(cursor, seeds_dir / '02_mestres_fornecedores.sql', '🏭 5/5 Fornecedores'):
            conn.commit()
            cursor.execute("SELECT COUNT(*) FROM fornecedores")
            print(f"   📊 {cursor.fetchone()[0]} fornecedores inseridos")
        else:
            conn.rollback()
            print("   ⚠️  Rollback executado")
        print()
        
        print("=" * 60)
        print("✅ POVOAMENTO DE MESTRES CONCLUÍDO!")
        print("=" * 60)
        print()
        print("📊 Resumo:")
        cursor.execute("SELECT COUNT(*) FROM lojas")
        print(f"   - Lojas: {cursor.fetchone()[0]}")
        cursor.execute("SELECT COUNT(*) FROM plano_contas")
        print(f"   - Plano de contas: {cursor.fetchone()[0]}")
        cursor.execute("SELECT COUNT(*) FROM centros_custo")
        print(f"   - Centros de custo: {cursor.fetchone()[0]}")
        cursor.execute("SELECT COUNT(*) FROM contas_financeiras")
        print(f"   - Contas financeiras: {cursor.fetchone()[0]}")
        cursor.execute("SELECT COUNT(*) FROM fornecedores")
        print(f"   - Fornecedores: {cursor.fetchone()[0]}")
        print()
        
    except Exception as e:
        print(f"❌ Erro: {e}")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()
        print("🔌 Desconectado")

if __name__ == '__main__':
    main()
