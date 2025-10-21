import os
import pandas as pd
from datetime import datetime


def br_to_float(val) -> float:
    if val is None:
        return 0.0
    if isinstance(val, (int, float)):
        return float(val)
    s = str(val).strip()
    if s == '' or s.lower() in {'nan', 'none', '-'}:
        return 0.0
    s = s.replace('R$', '').replace(' ', '')
    if ',' in s:
        s = s.replace('.', '').replace(',', '.')
    try:
        return float(s)
    except Exception:
        return 0.0


def parse_date(s):
    if pd.isna(s):
        return None
    s = str(s)
    for fmt in ('%d/%m/%Y', '%Y-%m-%d', '%d/%m/%Y %H:%M:%S', '%Y-%m-%d %H:%M:%S'):
        try:
            return datetime.strptime(s, fmt)
        except Exception:
            pass
    return None


def main():
    base_dir = os.path.dirname(os.path.dirname(__file__))
    path = os.path.join(base_dir, 'data', 'base', 'export.csv')
    print(f'Reading: {path}')
    df = pd.read_csv(path, sep=';', dtype=str, encoding='utf-8')

    # rename
    df = df.rename(columns={
        'Data esperada': 'data_esperada',
        'Data realizada': 'data_realizada',
        'Plano de contas': 'plano_contas',
        'Histórico': 'historico',
        'Sequência': 'sequencia',
        'Valor a receber': 'valor_receber',
        'Valor recebido': 'valor_recebido',
        'Valor a pagar': 'valor_pagar',
        'Valor pago': 'valor_pago',
        'Centro de custo': 'centro_custo',
        'Status': 'status',
    })

    # numeric
    for c in ['valor_receber', 'valor_recebido', 'valor_pagar', 'valor_pago']:
        df[c + '_num'] = df[c].apply(br_to_float)

    # tipo
    def tipo(row):
        if row['valor_receber_num'] > 0 or row['valor_recebido_num'] > 0:
            return 'receita'
        if row['valor_pagar_num'] < 0 or row['valor_pago_num'] < 0 or row['valor_pagar_num'] > 0:
            return 'despesa'
        return 'indefinido'

    df['tipo'] = df.apply(tipo, axis=1)

    # valor_total
    def valor_total(row):
        if row['tipo'] == 'receita':
            return max(row['valor_receber_num'], row['valor_recebido_num'])
        if row['tipo'] == 'despesa':
            return max(abs(row['valor_pagar_num']), abs(row['valor_pago_num']))
        return 0.0

    df['valor_total'] = df.apply(valor_total, axis=1)

    # datas
    df['data_esperada_dt'] = df['data_esperada'].apply(parse_date)
    df['data_realizada_dt'] = df['data_realizada'].apply(parse_date)

    # summary
    total_rows = len(df)
    tipos = df['tipo'].value_counts().to_dict()
    status = df['status'].fillna('N/A').value_counts().head(10).to_dict()
    lojas = df['centro_custo'].fillna('N/A').value_counts().to_dict()
    top_planos = df['plano_contas'].fillna('N/A').value_counts().head(15).to_dict()

    period_esp_min = df['data_esperada_dt'].min()
    period_esp_max = df['data_esperada_dt'].max()
    period_real_min = df['data_realizada_dt'].min()
    period_real_max = df['data_realizada_dt'].max()

    receitas_sum = df[df['tipo'] == 'receita']['valor_total'].sum()
    despesas_sum = df[df['tipo'] == 'despesa']['valor_total'].sum()

    print('\n=== RESUMO DO EXPORT ===')
    print(f'Total linhas: {total_rows}')
    print(f"Tipos: {tipos}")
    print(f"Status (top10): {status}")
    print(f"Lojas (centro_custo): {list(lojas.keys())}")
    print('\nTop 15 Plano de Contas:')
    for k, v in top_planos.items():
        print(f'  - {k}: {v}')
    print('\nPeríodo (Data esperada):', period_esp_min, '→', period_esp_max)
    print('Período (Data realizada):', period_real_min, '→', period_real_max)
    print(f"\nTotais:\n  • Receitas: R$ {receitas_sum:,.2f}\n  • Despesas: R$ {despesas_sum:,.2f}")


if __name__ == '__main__':
    main()
