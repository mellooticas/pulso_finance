#!/usr/bin/env python3
# Extrai todos os valores únicos de conta_bancaria do arquivao_final.csv para data/base/contas_financeiras_bruto.csv
import pandas as pd
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/arquivao_final.csv')
ARQUIVO_SAIDA = Path('data/base/contas_financeiras_bruto.csv')

def main():
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    contas = df['conta_bancaria'].dropna().unique()
    contas = [c.strip() for c in contas if c.strip()]
    pd.DataFrame({'nome': contas}).to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f'✅ {len(contas)} contas extraídas para {ARQUIVO_SAIDA}')

if __name__ == '__main__':
    main()
