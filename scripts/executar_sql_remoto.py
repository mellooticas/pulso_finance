#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Executa arquivos SQL no Postgres remoto (Supabase) com SSL.

Uso (bash no Windows):

  DB_HOST="..." DB_PORT="5432" DB_NAME="postgres" \
  DB_USER="postgres" DB_PASSWORD='SUA_SENHA' \
  /d/projetos/pulso_finance/.venv/Scripts/python.exe scripts/executar_sql_remoto.py \
    database/seeds/01_limpar_banco.sql database/seeds/02_povoar_mestres.sql

Observações:
- Requer psycopg v3 (psycopg[binary])
- Força sslmode=require
"""

from __future__ import annotations
import os
import sys
from pathlib import Path
import psycopg


def run_sql_file(conn: psycopg.Connection, sql_path: Path) -> None:
    sql = sql_path.read_text(encoding='utf-8')
    with conn.cursor() as cur:
        cur.execute(sql)
    # commit explícito por arquivo para feedback claro
    conn.commit()


def main(argv: list[str]) -> int:
    if len(argv) < 2:
        print("Uso: executar_sql_remoto.py <arquivo.sql> [<arquivo2.sql> ...]", file=sys.stderr)
        return 2

    host = os.getenv('DB_HOST')
    port = int(os.getenv('DB_PORT', '5432'))
    db = os.getenv('DB_NAME', 'postgres')
    user = os.getenv('DB_USER', 'postgres')
    password = os.getenv('DB_PASSWORD')

    if not host or not password:
        print("Erro: defina DB_HOST e DB_PASSWORD no ambiente.", file=sys.stderr)
        return 2

    print(f"Conectando em {host}:{port}/{db} como {user} (SSL=require)...")
    try:
        # Usa parâmetros nomeados para evitar problemas de escaping na DSN
        with psycopg.connect(
            host=host,
            port=port,
            dbname=db,
            user=user,
            password=password,
            sslmode="require",
            autocommit=False,
        ) as conn:
            print("✅ Conexão OK")
            for arg in argv[1:]:
                sql_path = Path(arg)
                if not sql_path.exists():
                    print(f"⚠️  Arquivo não encontrado: {sql_path}")
                    continue
                print(f"\n▶️  Executando: {sql_path}")
                run_sql_file(conn, sql_path)
                print(f"✅ Concluído: {sql_path}")
    except Exception as e:
        print("❌ Erro na execução:", e, file=sys.stderr)
        return 1

    print("\n🎉 Finalizado com sucesso.")
    return 0


if __name__ == '__main__':
    raise SystemExit(main(sys.argv))
