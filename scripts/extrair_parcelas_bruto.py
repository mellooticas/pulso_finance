#!/usr/bin/env python3
# Extrai todas as parcelas do arquivao_final.csv para data/base/parcelas_bruto.csv
import pandas as pd
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/arquivao_final.csv')
ARQUIVO_SAIDA = Path('data/base/parcelas_bruto.csv')

# Campos relevantes para parcelas
CAMPOS = [
    'sequencia',
    'data_esperada',
    'data_realizada',
    'valor_pagar',
    'valor_pago',
    'plano_conta',
    'historico',
    'centro_custo',
    'conta_bancaria',
    'status',
]

def main():
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    campos_existentes = [c for c in CAMPOS if c in df.columns]
    parcelas = df[campos_existentes].copy()
    parcelas.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f'✅ {len(parcelas)} parcelas extraídas para {ARQUIVO_SAIDA}')
    print(f'Campos: {campos_existentes}')

if __name__ == '__main__':
    main()
