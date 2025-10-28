#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Teste rápido de conexão ao Supabase
"""
import os

# Configurar credenciais
os.environ['DB_HOST'] = 'db.fxsgphqzazcbjcyfqeyg.supabase.co'
os.environ['DB_PORT'] = '5432'
os.environ['DB_NAME'] = 'postgres'
os.environ['DB_USER'] = 'postgres'
os.environ['DB_PASSWORD'] = 'Kt12jyh2815t@'

try:
    import psycopg
    print("✅ psycopg importado com sucesso")
    
    print(f"\n🔌 Tentando conectar em {os.environ['DB_HOST']}...")
    conn = psycopg.connect(
        host=os.environ['DB_HOST'],
        port=int(os.environ['DB_PORT']),
        dbname=os.environ['DB_NAME'],
        user=os.environ['DB_USER'],
        password=os.environ['DB_PASSWORD'],
        sslmode='require',
        connect_timeout=10
    )
    
    print("✅ CONEXÃO BEM-SUCEDIDA!")
    
    # Teste simples
    with conn.cursor() as cur:
        cur.execute("SELECT COUNT(*) as total FROM lojas;")
        result = cur.fetchone()
        print(f"✅ Query funcionou! Lojas no banco: {result[0]}")
    
    conn.close()
    print("\n🎉 OPÇÃO C FUNCIONA! Pode usar o orquestrador local.")
    
except Exception as e:
    print(f"\n❌ FALHA: {e}")
    print("\n💡 Se falhou, use OPÇÃO B (SQL Editor) que é mais confiável.")
