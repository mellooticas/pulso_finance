#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 5/8: Gerar seed de FORNECEDORES
- Extrai possíveis fornecedores do campo 'historico'
- Aplica algumas limpezas (datas, valores, 'NF 123', múltiplos espaços)
- Salva em data/seeds/fornecedores.csv
"""

import re
from pathlib import Path
import pandas as pd

ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/fornecedores.csv")


LIMPA_PADROES = [
    (re.compile(r"\bNF\s*\d+", re.I), ""),
    (re.compile(r"\d{2}/\d{2}/\d{4}"), ""),  # datas 12/05/2024
    (re.compile(r"\d{2}/\d{2}/\d{2}"), ""),  # datas curtas 12/05/24
    (re.compile(r"R\$\s*[\d.,]+"), ""),      # valores R$ 1.234,56
]


def limpar_nome(texto: str) -> str | None:
    if not isinstance(texto, str):
        return None
    s = texto.strip()
    if not s:
        return None
    for rx, rep in LIMPA_PADROES:
        s = rx.sub(rep, s)
    s = re.sub(r"\s+", " ", s).strip()
    if len(s) < 3:
        return None
    return s


def main():
    print("=" * 60)
    print("SCRIPT 5/8: GERAR SEED DE FORNECEDORES")
    print("=" * 60)

    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)

    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")

    print("\n🏢 Extraindo e limpando nomes do campo 'historico'...")
    nomes = (
        df['historico']
        .dropna()
        .map(limpar_nome)
        .dropna()
        .drop_duplicates()
        .tolist()
    )
    print(f"✅ {len(nomes)} fornecedores potenciais")

    saida = pd.DataFrame({
        'nome': sorted(nomes),
        'documento': [''] * len(nomes),  # preencher CNPJ/CPF manualmente se soubermos
        'tipo': ['juridica'] * len(nomes),  # default
        'ativo': ['true'] * len(nomes),
    })

    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    saida.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f"✅ Arquivo criado com {len(saida)} fornecedores")

    print("\n📋 Preview (primeiros 20):")
    print(saida.head(20).to_string(index=False))
    if len(saida) > 20:
        print(f"\n... mais {len(saida) - 20} fornecedores")

    print("\n" + "=" * 60)
    print("✅ SCRIPT 5/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de fornecedores: {len(saida)}")


if __name__ == "__main__":
    main()
