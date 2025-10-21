#!/usr/bin/env python3
# Extrai todos os registros do arquivao_final.csv para data/base/lancamentos_bruto.csv
import pandas as pd
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/arquivao_final.csv')
ARQUIVO_SAIDA = Path('data/base/lancamentos_bruto.csv')

def main():
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    df.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f'✅ {len(df)} lançamentos extraídos para {ARQUIVO_SAIDA}')

if __name__ == '__main__':
    main()
