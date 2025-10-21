#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 4/8: Gerar seed de CONTAS FINANCEIRAS
- Identifica a coluna de conta (usa 'conta_bancaria' do CSV consolidado)
- Normaliza e extrai contas únicas
- Tenta inferir tipo: banco/caixa/cartao/outros
- Salva em data/seeds/contas_financeiras.csv
"""

from pathlib import Path
import pandas as pd

ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/contas_financeiras.csv")


def inferir_tipo_conta(nome: str) -> str:
    if not isinstance(nome, str):
        return 'outros'
    s = nome.lower()
    if any(x in s for x in ['caixa', 'dinheiro']):
        return 'caixa'
    if any(x in s for x in ['banco', 'conta', 'bb', 'bradesco', 'itau', 'itaú', 'santander', 'cef']):
        return 'banco'
    if any(x in s for x in ['cartao', 'cartão', 'credito', 'crédito', 'debito', 'débito']):
        return 'cartao'
    return 'outros'


def main():
    print("=" * 60)
    print("SCRIPT 4/8: GERAR SEED DE CONTAS FINANCEIRAS")
    print("=" * 60)

    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)

    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")

    candidatos = ['conta_bancaria']
    coluna = next((c for c in candidatos if c in df.columns), None)
    if not coluna:
        print("⚠️  Coluna de conta não encontrada. Criando arquivo exemplo.")
        saida = pd.DataFrame({
            'nome': ['Caixa', 'Conta Corrente', 'Cartão de Crédito'],
            'tipo': ['caixa', 'banco', 'cartao'],
            'saldo_inicial': ['0', '0', '0'],
            'ativo': ['true', 'true', 'true']
        })
    else:
        print(f"\n💳 Extraindo contas únicas da coluna '{coluna}'...")
        contas = (
            df[coluna]
            .dropna()
            .map(lambda x: x.strip())
            .loc[lambda s: s != '']
            .drop_duplicates()
            .tolist()
        )
        print(f"✅ {len(contas)} contas distintas")
        tipos = [inferir_tipo_conta(x) for x in contas]
        saida = pd.DataFrame({
            'nome': contas,
            'tipo': tipos,
            'saldo_inicial': ['0'] * len(contas),
            'ativo': ['true'] * len(contas)
        }).sort_values(['tipo', 'nome']).reset_index(drop=True)

    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    saida.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f"✅ Arquivo criado com {len(saida)} contas")

    print("\n📋 Preview:")
    print(saida.head(20).to_string(index=False))
    if len(saida) > 20:
        print(f"\n... mais {len(saida) - 20} contas")

    print("\n" + "=" * 60)
    print("✅ SCRIPT 4/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de contas: {len(saida)}")


if __name__ == "__main__":
    main()
