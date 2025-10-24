#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Orquestra a execução completa do povoamento no Postgres (Supabase) em etapas,
com logs, controle de erros e divisão inteligente para arquivos grandes.

🚀 OTIMIZADO PARA SUPABASE:
  - Commits em lotes grandes (2000 instruções)
  - Transações agressivas para reduzir overhead de rede
  - Streaming eficiente para arquivos grandes
  - Logs de progresso detalhados

Etapas executadas, nessa ordem:
  1) 01_limpar_banco.sql
  2) Mestres (lojas, plano de contas em lotes, centros de custo, contas financeiras, fornecedores em lotes)
  3) classificar_fornecedores.sql (idempotente)
  4) 03_povoar_transacionais.sql (streaming/chunked com batching agressivo)
  5) VALIDACOES_POS_IMPORT.sql

Variáveis de ambiente esperadas:
  - DB_HOST, DB_PORT (opcional, padrão 5432), DB_NAME (padrão postgres), DB_USER (padrão postgres), DB_PASSWORD

Requisitos:
  - psycopg (v3) instalado: pip install "psycopg[binary]"

Observações:
  - Usa sslmode=require por padrão (Supabase)
  - Transações grandes = menos fsync = mais rápido
  - Commits a cada 2000 instruções em transacionais
"""
from __future__ import annotations

import os
import sys
from pathlib import Path
from typing import Iterator

import psycopg


BASE_DIR = Path(__file__).resolve().parents[1]
SEEDS_DIR = BASE_DIR / "database" / "seeds"


def _connect() -> psycopg.Connection:
    host = os.getenv("DB_HOST")
    port = int(os.getenv("DB_PORT", "5432"))
    db = os.getenv("DB_NAME", "postgres")
    user = os.getenv("DB_USER", "postgres")
    password = os.getenv("DB_PASSWORD")

    if not host or not password:
        raise RuntimeError("Defina DB_HOST e DB_PASSWORD no ambiente.")

    print(f"🔌 Conectando em {host}:{port}/{db} como {user} (SSL=require)...")
    conn = psycopg.connect(
        host=host,
        port=port,
        dbname=db,
        user=user,
        password=password,
        sslmode="require",
        autocommit=False,
    )
    
    # Otimizações de performance para bulk insert
    with conn.cursor() as cur:
        # Aumentar work_mem para operações de ordenação/agregação
        cur.execute("SET work_mem = '256MB'")
        
        # Modo turbo: desabilitar synchronous_commit (2-3x mais rápido)
        if os.getenv("TURBO_MODE"):
            cur.execute("SET synchronous_commit = OFF")
            print("   🔥 synchronous_commit = OFF (modo turbo)")
    
    print("✅ Conexão OK + otimizações de performance ativadas")
    return conn


def run_sql_file(conn: psycopg.Connection, sql_path: Path) -> None:
    """
    Executa arquivo SQL completo em uma única transação para máxima velocidade.
    """
    print(f"\n▶️  Executando: {sql_path.relative_to(BASE_DIR)}")
    sql = sql_path.read_text(encoding="utf-8")
    size_kb = len(sql) / 1024
    print(f"   📦 Tamanho: {size_kb:,.1f} KB")
    with conn.cursor() as cur:
        cur.execute(sql)
    conn.commit()
    print(f"✅ Concluído: {sql_path.name}")


def iter_sql_statements_streaming(path: Path) -> Iterator[str]:
    """
    Itera instruções SQL de um arquivo grande sem carregar tudo em memória.
    - Evita quebrar dentro de blocos DO $$ ... END $$;
    - Ignora ';' dentro de aspas simples
    """
    in_dollar = False
    in_quote = False
    buf: list[str] = []

    with path.open("r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            # Detecta início/fim de bloco DO $$
            if not in_quote and ("DO $$" in line or "do $$" in line):
                in_dollar = True
            if in_dollar and ("END $$;" in line or "end $$;" in line):
                # final do bloco: emite o bloco inteiro
                buf.append(line)
                yield "".join(buf)
                buf.clear()
                in_dollar = False
                continue

            # Controle simples de aspas simples (não lida com escapes complexos)
            if not in_dollar:
                # alterna estado de quote contando ocorrências de ' não escapadas
                i = 0
                while i < len(line):
                    ch = line[i]
                    if ch == "'":
                        # verifica escape simples '' (dois apóstrofos)
                        if i + 1 < len(line) and line[i + 1] == "'":
                            i += 2
                            continue
                        in_quote = not in_quote
                    i += 1

            buf.append(line)

            # Se não estamos em bloco nem dentro de aspas, podemos separar por ';'
            if not in_dollar and not in_quote and ";" in line:
                chunk = "".join(buf)
                parts = chunk.split(";")
                # todas menos a última terminam em ;
                for stmt in parts[:-1]:
                    s = stmt.strip()
                    if s:
                        yield s + ";"
                # o resto fica no buffer
                buf = [parts[-1]]

    # restante
    tail = "".join(buf).strip()
    if tail:
        yield tail


def run_transacionais_streaming(conn: psycopg.Connection, sql_path: Path, commit_every: int = 2000) -> None:
    """
    Executa transacionais em streaming com batching otimizado para Supabase.
    Commits maiores (2000) = menos overhead de rede/fsync.
    """
    print(f"\n▶️  Executando transacionais (streaming): {sql_path.relative_to(BASE_DIR)}")
    print(f"   ⚡ Modo turbo: commits a cada {commit_every} instruções")
    total = 0
    batch = 0
    with conn.cursor() as cur:
        for stmt in iter_sql_statements_streaming(sql_path):
            try:
                cur.execute(stmt)
                total += 1
                batch += 1
                if batch >= commit_every:
                    conn.commit()
                    print(f"   💾 Commit: {total:,} instruções ({batch} neste lote)")
                    batch = 0
            except Exception as e:
                conn.rollback()
                print("❌ Erro em instrução transacional:")
                print(stmt[:1000] + ("..." if len(stmt) > 1000 else ""))
                raise
        if batch:
            conn.commit()
            print(f"   💾 Commit final: {batch} instruções")
    print(f"✅ Transacionais concluídos: {total:,} instruções executadas")


def main(argv: list[str]) -> int:
    print("=" * 70)
    print("🚀 ORQUESTRADOR DE POVOAMENTO - MODO TURBO SUPABASE")
    print("=" * 70)
    print()
    print("⚡ Otimizações ativas:")
    print("   • Commits em lotes grandes (2000 instruções)")
    print("   • work_mem = 256MB para operações bulk")
    print("   • Transações agressivas")
    print("   • Streaming eficiente de arquivos grandes")
    print()
    print("⏱️  Tempo estimado: 5-15 minutos (dependendo da rede)")
    print()
    
    try:
        conn = _connect()
    except Exception as e:
        print(f"❌ Falha de conexão: {e}")
        return 2

    try:
        with conn:
            # 1) Limpeza
            limpar = SEEDS_DIR / "01_limpar_banco.sql"
            if limpar.exists():
                run_sql_file(conn, limpar)
            else:
                print("⚠️  Arquivo de limpeza não encontrado, pulando.")

            # 2) Mestres
            # 2.1 lojas
            lojas = SEEDS_DIR / "02_mestres_lojas.sql"
            if lojas.exists():
                run_sql_file(conn, lojas)
            else:
                print("⚠️  02_mestres_lojas.sql não encontrado, pulando.")

            # 2.2 plano de contas em lotes (se existirem), senão inteiro
            plano_lotes = sorted(SEEDS_DIR.glob("02_plano_contas_lote_*.sql"))
            if plano_lotes:
                print(f"📋 Executando {len(plano_lotes)} lotes de plano de contas...")
                for p in plano_lotes:
                    run_sql_file(conn, p)
            else:
                plano_all = SEEDS_DIR / "02_mestres_plano_contas.sql"
                if plano_all.exists():
                    run_sql_file(conn, plano_all)
                else:
                    print("⚠️  Plano de contas não encontrado, pulando.")

            # 2.3 centros de custo
            centros = SEEDS_DIR / "02_centros_executar.sql"
            if centros.exists():
                run_sql_file(conn, centros)
            else:
                centros_all = SEEDS_DIR / "02_mestres_centros_custo.sql"
                if centros_all.exists():
                    run_sql_file(conn, centros_all)
                else:
                    print("⚠️  Centros de custo não encontrado, pulando.")

            # 2.4 contas financeiras
            contas = SEEDS_DIR / "02_contas_executar.sql"
            if contas.exists():
                run_sql_file(conn, contas)
            else:
                contas_all = SEEDS_DIR / "02_mestres_contas_financeiras.sql"
                if contas_all.exists():
                    run_sql_file(conn, contas_all)
                else:
                    print("⚠️  Contas financeiras não encontrado, pulando.")

            # 2.5 fornecedores em lotes (se existirem), senão inteiro
            fornecedores_lotes = sorted(SEEDS_DIR.glob("02_fornecedores_lote_*.sql"))
            if fornecedores_lotes:
                print(f"🏭 Executando {len(fornecedores_lotes)} lotes de fornecedores...")
                for f in fornecedores_lotes:
                    run_sql_file(conn, f)
            else:
                fornecedores_all = SEEDS_DIR / "02_mestres_fornecedores.sql"
                if fornecedores_all.exists():
                    run_sql_file(conn, fornecedores_all)
                else:
                    print("⚠️  Fornecedores não encontrado, pulando.")

            # 3) Classificação (idempotente)
            classif = SEEDS_DIR / "classificar_fornecedores.sql"
            if classif.exists():
                run_sql_file(conn, classif)
            else:
                print("ℹ️  classificar_fornecedores.sql não encontrado; se já rodou manualmente, está ok.")

            # 4) Transacionais (streaming com batching agressivo)
            trans = SEEDS_DIR / "03_povoar_transacionais.sql"
            if trans.exists():
                # Supabase aguenta bem: 2000 instruções por commit = ~20MB de dados
                run_transacionais_streaming(conn, trans, commit_every=2000)
            else:
                print("⚠️  03_povoar_transacionais.sql não encontrado, pulando.")

            # 5) Validações
            valid = SEEDS_DIR / "VALIDACOES_POS_IMPORT.sql"
            if valid.exists():
                run_sql_file(conn, valid)
            else:
                print("ℹ️  VALIDACOES_POS_IMPORT.sql não encontrado; pule se não precisar agora.")

    except Exception as e:
        print(f"❌ Falha na orquestração: {e}")
        return 1
    finally:
        try:
            conn.close()
        except Exception:
            pass

    print("\n🎉 Povoamento completo com sucesso.")
    return 0


if __name__ == "__main__":
    # Modo super express: --turbo ou --express
    # Desabilita synchronous_commit (mais rápido, mas menos seguro em caso de crash)
    if "--turbo" in sys.argv or "--express" in sys.argv:
        print("\n🔥 MODO SUPER EXPRESS ATIVADO")
        print("   ⚠️  synchronous_commit = OFF (aceita risco de perda em crash)")
        print()
        # Será aplicado na função _connect se detectado
        os.environ["TURBO_MODE"] = "1"
    
    raise SystemExit(main(sys.argv))
