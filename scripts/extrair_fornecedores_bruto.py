#!/usr/bin/env python3
# Extrai todos os valores únicos de historico do arquivao_final.csv para data/base/fornecedores_bruto.csv
import pandas as pd
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/arquivao_final.csv')
ARQUIVO_SAIDA = Path('data/base/fornecedores_bruto.csv')

def main():
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    fornecedores = df['historico'].dropna().unique()
    fornecedores = [f.strip() for f in fornecedores if f.strip()]
    pd.DataFrame({'nome': fornecedores}).to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f'✅ {len(fornecedores)} fornecedores extraídos para {ARQUIVO_SAIDA}')

if __name__ == '__main__':
    main()
