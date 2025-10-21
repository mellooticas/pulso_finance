#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 3/8: Gerar seed de PLANO DE CONTAS
- Lê data/base/arquivao_final.csv (sep=';')
- Extrai valores únicos de 'plano_conta'
- Separa 'codigo' (ex: 3.1.2) e 'nome' (ex: Vendas cartões de débito)
- Infere 'codigo_pai' pela hierarquia (removendo o último nível do código)
- Infere 'tipo' (receita/despesa)
- Salva em data/seeds/plano_contas.csv
"""

import re
from pathlib import Path
import pandas as pd

ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/plano_contas.csv")

CODIGO_RE = re.compile(r"^(\d+(?:\.\d+)*)\s+(.*)$")


def split_codigo_nome(valor: str):
    if not isinstance(valor, str):
        return None, None
    s = valor.strip()
    if not s:
        return None, None
    m = CODIGO_RE.match(s)
    if m:
        return m.group(1), m.group(2).strip()
    # quando não há código, usar o texto como nome
    return None, s


def codigo_pai(codigo: str):
    if not codigo:
        return None
    partes = codigo.split('.')
    if len(partes) <= 1:
        return None
    return '.'.join(partes[:-1])


def inferir_tipo(codigo: str, nome: str):
    nome_l = (nome or '').lower()
    # Heurística: códigos iniciando com '3' são receitas (comum nos planos BR)
    if codigo and codigo.split('.')[0] == '3':
        return 'receita'
    # Palavras-chave de receita
    if any(k in nome_l for k in ['receita', 'venda', 'vendas', 'faturamento', 'entrada']):
        return 'receita'
    return 'despesa'


def main():
    print("=" * 60)
    print("SCRIPT 3/8: GERAR SEED DE PLANO DE CONTAS")
    print("=" * 60)

    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)

    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")

    print("\n📊 Extraindo valores únicos de 'plano_conta'...")
    planos_raw = (
        df['plano_conta']
        .dropna()
        .map(lambda x: x.strip())
        .loc[lambda s: s != '']
        .drop_duplicates()
        .tolist()
    )
    print(f"✅ {len(planos_raw)} valores distintos")

    codigos = []
    nomes = []
    for v in planos_raw:
        cod, nm = split_codigo_nome(v)
        codigos.append(cod)
        nomes.append(nm)

    planos_df = pd.DataFrame({
        'codigo': codigos,
        'nome': nomes,
        'plano_conta_original': planos_raw,
    })

    # Quando não houver código, usar o próprio nome como "codigo" para manter unicidade
    planos_df['codigo'] = planos_df.apply(
        lambda r: r['codigo'] if isinstance(r['codigo'], str) and r['codigo'].strip() else r['nome'], axis=1
    )

    # Remover possíveis duplicatas pelo código final
    planos_df = planos_df.drop_duplicates(subset=['codigo']).reset_index(drop=True)

    # Hierarquia e tipo
    planos_df['codigo_pai'] = planos_df['codigo'].apply(codigo_pai)
    planos_df['tipo'] = planos_df.apply(lambda r: inferir_tipo(r['codigo'], r['nome']), axis=1)
    planos_df['ativo'] = 'true'

    # Ordenar por código (ordenação natural simples)
    planos_df = planos_df.sort_values('codigo').reset_index(drop=True)

    print("\n📈 Estatísticas:")
    print(f"   - Total de planos: {len(planos_df)}")
    print(f"   - Receitas: {len(planos_df[planos_df['tipo'] == 'receita'])}")
    print(f"   - Despesas: {len(planos_df[planos_df['tipo'] == 'despesa'])}")
    print(f"   - Com pai: {planos_df['codigo_pai'].notna().sum()}")
    print(f"   - Sem pai: {planos_df['codigo_pai'].isna().sum()}")

    # Salvar apenas colunas necessárias
    saida = planos_df[['codigo', 'nome', 'codigo_pai', 'tipo', 'ativo']]

    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    saida.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f"✅ Arquivo criado com {len(saida)} planos")

    print("\n📋 Preview (primeiros 15):")
    print(saida.head(15).to_string(index=False))

    print("\n" + "=" * 60)
    print("✅ SCRIPT 3/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de planos: {len(saida)}")
    print("\n⚠️  Dica: Revise nomes/tipos. Se já tiver um dicionário oficial, podemos ajustar por script.")


if __name__ == "__main__":
    main()
