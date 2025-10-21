#!/usr/bin/env python3
# Extrai todos os valores únicos de plano_conta do arquivao_final.csv para data/base/plano_contas_bruto.csv
import pandas as pd
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/arquivao_final.csv')
ARQUIVO_SAIDA = Path('data/base/plano_contas_bruto.csv')

def main():
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    planos = df['plano_conta'].dropna().unique()
    planos = [p.strip() for p in planos if p.strip()]
    pd.DataFrame({'plano_conta': planos}).to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f'✅ {len(planos)} planos extraídos para {ARQUIVO_SAIDA}')

if __name__ == '__main__':
    main()
