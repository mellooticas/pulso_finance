import argparse
import os
import re
from typing import List


def ensure_dir(path: str):
    os.makedirs(os.path.dirname(path), exist_ok=True)


def write_chunk(output_prefix: str, idx: int, header: str, rows: List[str], add_on_conflict: bool = False):
    fname = f"{output_prefix}{idx:03d}.sql"
    ensure_dir(fname)
    # Remove trailing comma from last row, if present
    chunk_rows = rows.copy()
    if chunk_rows:
        chunk_rows[-1] = re.sub(r",\s*$", "", chunk_rows[-1])

    with open(fname, "w", encoding="utf-8") as f:
        f.write(header)
        f.write("\nVALUES\n")
        for i, r in enumerate(chunk_rows):
            # Garantir indentação agradável
            line = r
            if not line.startswith("    "):
                line = "    " + line.lstrip()
            f.write(line)
            if not line.endswith("\n"):
                f.write("\n")
        f.write(" ")
        if add_on_conflict:
            f.write("ON CONFLICT DO NOTHING;")
        else:
            f.write(";")
        f.write("\n")
    return fname


def split_values_file_multi(input_path: str, output_prefix: str, rows_per_chunk: int, add_on_conflict: bool):
    """
    Divide um arquivo SQL contendo UM OU MAIS blocos de
    INSERT ... VALUES (...), (...), ... em múltiplos arquivos menores.
    Cada bloco encontrado é processado e quebrado em lotes sequenciais.
    """
    with open(input_path, "r", encoding="utf-8", errors="ignore") as f:
        content = f.read()

    # Normalizar quebras e iterar por linhas
    lines = content.replace("\r\n", "\n").replace("\r", "\n").split("\n")

    out_files: List[str] = []
    idx_global = 1
    in_insert = False
    header = ""
    rows: List[str] = []

    def flush_current_block():
        nonlocal idx_global, rows, header, out_files
        if not rows:
            return
        # Normalizar linhas (sem ';')
        norm_rows = [r.rstrip(";") for r in rows if r.strip()]
        chunks = [norm_rows[i:i + rows_per_chunk] for i in range(0, len(norm_rows), rows_per_chunk)]
        for chunk in chunks:
            out = write_chunk(output_prefix, idx_global, header, chunk, add_on_conflict=add_on_conflict)
            out_files.append(out)
            idx_global += 1
        rows = []

    for raw in lines:
        line = raw.rstrip()
        if not in_insert:
            # Procurar início de um bloco INSERT ... VALUES
            # Dividimos a linha na primeira ocorrência de 'VALUES' (case-insensitive)
            if re.search(r"\bINSERT\b\s+INTO\s+", line, flags=re.IGNORECASE):
                # Podemos ter o header em múltiplas linhas até encontrar 'VALUES'
                header_buf = [line]
                # Se a linha ainda não contém 'VALUES', vamos acumular até achar
                # (Para simplicidade, vamos adicionar linhas vazias/seguintes no header
                # até encontrarmos a palavra 'VALUES' nas próximas iterações)
                if re.search(r"\bVALUES\b", line, flags=re.IGNORECASE):
                    header_text = re.split(r"\bVALUES\b", "\n".join(header_buf), flags=re.IGNORECASE)[0]
                    header = header_text.strip()
                    in_insert = True
                else:
                    # Entramos em modo de header multiline; continuar lendo linhas seguintes
                    in_insert = True
                    # Continuaremos adicionando linhas seguintes até encontrar VALUES
                    # e então converteremos header_buf -> header quando VALUES aparecer.
                    # Para isso, usamos um estado temporário onde rows ainda estará vazio
                    # até o encontro de VALUES.
                    header = ""  # será preenchido ao detectar VALUES
                    rows = []
                continue
        else:
            # Estamos dentro de um bloco INSERT
            if not header:
                # Ainda coletando header até 'VALUES'
                if re.search(r"\bVALUES\b", line, flags=re.IGNORECASE):
                    # Tudo que veio antes do 'VALUES' faz parte do header; precisamos reconstituir
                    # Como simplificação: vamos supor que o header ocupa as linhas desde o último
                    # 'INSERT INTO' até esta linha, removendo a palavra VALUES e o que vem depois.
                    # Para maior robustez, mantemos apenas até 'VALUES'.
                    before_values = re.split(r"\bVALUES\b", line, flags=re.IGNORECASE)[0]
                    # Tentamos montar um header plausível combinando uma linha de INSERT anterior
                    # com esta linha. Caso falhe, caímos para uma heurística.
                    if before_values.strip():
                        header = before_values.strip()
                    else:
                        # Heurística: se por algum motivo não conseguimos, colocamos algo genérico
                        header = "INSERT INTO fornecedores (id, nome, tipo_pessoa, documento, ativo, created_at, updated_at)"
                    # Após encontrar VALUES, passamos a coletar as linhas de valores a partir do restante da linha (se houver)
                    # porém o formato típico coloca cada tupla em uma nova linha, então seguimos adiante
                # Não adicionamos linhas ao header explícito além disso
                continue

            # Coletar linhas de valores
            if not line:
                continue
            if line.endswith(";") and not line.endswith("),;"):
                # Fim deste bloco INSERT
                rows.append(line[:-1])  # sem o ';'
                flush_current_block()
                in_insert = False
                header = ""
                continue
            rows.append(line)

    # Flush final se arquivo terminar sem ponto e vírgula (raro)
    if in_insert and rows:
        flush_current_block()

    if not out_files:
        raise RuntimeError("Nenhum bloco 'INSERT INTO ... VALUES' encontrado para dividir.")

    return out_files


def split_statements_file(input_path: str, output_prefix: str, statements_per_chunk: int):
    """
    Divide um arquivo SQL grande em vários arquivos, separando por ponto e vírgula ';'.
    Mantém o ponto e vírgula em cada statement e preserva a ordem.
    """
    out_files = []
    ensure_dir(f"{output_prefix}001.sql")
    idx = 1
    count = 0
    current_path = f"{output_prefix}{idx:03d}.sql"
    out = open(current_path, "w", encoding="utf-8")

    def new_chunk_file(index: int):
        path = f"{output_prefix}{index:03d}.sql"
        return open(path, "w", encoding="utf-8"), path

    buf = []
    with open(input_path, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            buf.append(line)
            if line.rstrip().endswith(";"):
                # Fechou um statement
                out.writelines(buf)
                buf = []
                count += 1
                if count >= statements_per_chunk:
                    out.close()
                    out_files.append(current_path)
                    idx += 1
                    count = 0
                    out, current_path = new_chunk_file(idx)

    # Escrever qualquer resto do buffer (sem ponto e vírgula final)
    if buf:
        out.writelines(buf)
    out.close()
    out_files.append(current_path)
    return out_files


def main():
    parser = argparse.ArgumentParser(description="Divide arquivos SQL grandes em lotes menores para o Supabase SQL Editor.")
    parser.add_argument("--input", required=True, help="Caminho do arquivo SQL de entrada")
    parser.add_argument("--output-prefix", required=True, help="Prefixo do caminho/arquivo de saída (ex.: _execucao_sql_editor/09_fornecedores_lote_)")
    parser.add_argument("--mode", choices=["values", "statements"], required=True, help="Modo de divisão: 'values' para INSERT ... VALUES, 'statements' por ';'")
    parser.add_argument("--rows-per-chunk", type=int, default=1000, help="Linhas por lote (modo 'values')")
    parser.add_argument("--statements-per-chunk", type=int, default=2000, help="Statements por lote (modo 'statements')")
    parser.add_argument("--on-conflict", action="store_true", help="Adicionar 'ON CONFLICT DO NOTHING' ao final do INSERT (modo 'values')")

    args = parser.parse_args()

    if args.mode == "values":
        files = split_values_file_multi(args.input, args.output_prefix, args.rows_per_chunk, args.on_conflict)
    else:
        files = split_statements_file(args.input, args.output_prefix, args.statements_per_chunk)

    print("Arquivos gerados:")
    for f in files:
        print(f" - {f}")


if __name__ == "__main__":
    main()
