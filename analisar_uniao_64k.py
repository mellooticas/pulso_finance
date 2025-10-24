import pandas as pd
import numpy as np

print("=" * 80)
print("ANALISE DO ARQUIVO uniao_64k.csv")
print("=" * 80)

# Ler arquivo
df = pd.read_csv('data/base/uniao_64k.csv', sep=';', encoding='utf-8')

print(f"\nTOTAL DE LINHAS: {len(df)}")
print(f"\nCOLUNAS DISPONIVEIS:")
for col in df.columns:
    print(f"   - {col}")

# Analisar colunas de valores
print(f"\nANALISE DE VALORES:")

def limpar_valor(val):
    """Limpa valores brasileiros"""
    if pd.isna(val) or val in ['', '-', 'nan', 'NaN']:
        return 0.0
    val = str(val).replace('R$', '').replace(' ', '').strip()
    if val == '' or val == '-':
        return 0.0
    # Remover pontos de milhar, manter vírgula decimal
    if ',' in val and '.' in val:
        val = val.replace('.', '')
    val = val.replace(',', '.')
    try:
        return float(val)
    except:
        return 0.0

# Verificar diferentes combinações de colunas
colunas_valor = []
for col in df.columns:
    if 'valor' in col.lower() or 'receber' in col.lower() or 'pagar' in col.lower():
        colunas_valor.append(col)

print(f"\nCOLUNAS DE VALOR ENCONTRADAS:")
for col in colunas_valor:
    print(f"   - {col}")

# Analisar cada coluna de valor
print(f"\nANALISE DETALHADA:")

for col in colunas_valor:
    df[f'{col}_limpo'] = df[col].apply(limpar_valor)
    total = df[f'{col}_limpo'].sum()
    nao_zero = (df[f'{col}_limpo'] != 0).sum()
    print(f"\n   {col}:")
    print(f"      Total: R$ {total:,.2f}")
    print(f"      Registros não-zero: {nao_zero}")
    if nao_zero > 0:
        print(f"      Amostra (5 primeiros não-zero):")
        amostras = df[df[f'{col}_limpo'] != 0][col].head(5)
        for val in amostras:
            print(f"         {val}")

# Classificar em receitas e despesas
print(f"\nCLASSIFICACAO RECEITAS vs DESPESAS:")

# Método 1: Usar colunas específicas
receitas_cols = [col for col in colunas_valor if 'receber' in col.lower() or 'recebido' in col.lower()]
despesas_cols = [col for col in colunas_valor if 'pagar' in col.lower() or 'pago' in col.lower()]

print(f"\n   Colunas de RECEITA: {receitas_cols}")
print(f"   Colunas de DESPESA: {despesas_cols}")

# Calcular totais
total_receitas = 0
total_despesas = 0
count_receitas = 0
count_despesas = 0

for col in receitas_cols:
    col_limpo = f'{col}_limpo'
    if col_limpo in df.columns:
        valores_positivos = df[col_limpo][df[col_limpo] > 0]
        total_receitas += valores_positivos.sum()
        count_receitas += len(valores_positivos)

for col in despesas_cols:
    col_limpo = f'{col}_limpo'
    if col_limpo in df.columns:
        # Despesas podem estar como negativo
        valores = df[col_limpo].abs()
        valores_positivos = valores[valores > 0]
        total_despesas += valores_positivos.sum()
        count_despesas += len(valores_positivos)

print(f"\n   Total RECEITAS: R$ {total_receitas:,.2f} ({count_receitas} registros)")
print(f"   Total DESPESAS: R$ {total_despesas:,.2f} ({count_despesas} registros)")

# Verificar fonte dos dados
print(f"\nANALISE POR FONTE:")
if 'fonte' in df.columns:
    fontes = df['fonte'].value_counts()
    for fonte, count in fontes.items():
        print(f"   {fonte}: {count} registros")
        # Calcular valores por fonte
        df_fonte = df[df['fonte'] == fonte]
        rec_fonte = 0
        desp_fonte = 0
        for col in receitas_cols:
            col_limpo = f'{col}_limpo'
            if col_limpo in df_fonte.columns:
                rec_fonte += df_fonte[col_limpo][df_fonte[col_limpo] > 0].sum()
        for col in despesas_cols:
            col_limpo = f'{col}_limpo'
            if col_limpo in df_fonte.columns:
                desp_fonte += df_fonte[col_limpo].abs()[df_fonte[col_limpo] != 0].sum()
        print(f"      Receitas: R$ {rec_fonte:,.2f}")
        print(f"      Despesas: R$ {desp_fonte:,.2f}")

print("\n" + "=" * 80)
print("CONCLUSÃO:")
print("=" * 80)
print(f"O arquivo tem {len(df)} linhas, mas apenas 12.054 foram inseridas no banco.")
print(f"Provavelmente o script de importação não processou todas as linhas ou")
print(f"filtrou muitos registros por conta de valores zerados ou dados inválidos.")
print("=" * 80)
