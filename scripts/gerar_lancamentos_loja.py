import csv

# Mapeamento de centro de custo para código da loja (ajuste conforme seu mapeamento real)
centro_custo_to_codigo = {
    'Loja Mauá': '048',
    'Loja Suzano': '042',
    'Loja Suzano II': '010',
    'Loja Rio Pequeno': '011',
    'Loja São Mateus': '012',
    'Escritório': '013',
    'Taty Mello Festas': '008',
    'Ecommerce': '008',
    '': '000',
    '(em branco)': '000',
}

# Caminhos dos arquivos
input_csv = r'd:\projetos\pulso_finance\_importacao_completa\lancamentos_uniao_64k.csv'
output_csv = r'd:\projetos\pulso_finance\_importacao_completa\lancamentos_uniao_64k_loja.csv'

# Nome da coluna de centro de custo no seu CSV de origem (ajuste se necessário)
CENTRO_CUSTO_COL = 'centro_custo'

# Nome da coluna de código da loja no novo CSV
LOJA_CODIGO_COL = 'loja_codigo'

with open(input_csv, newline='', encoding='utf-8') as infile:
    reader = csv.DictReader(infile)
    fieldnames = reader.fieldnames.copy()
    # Adiciona a coluna de código da loja se não existir
    if LOJA_CODIGO_COL not in fieldnames:
        fieldnames.append(LOJA_CODIGO_COL)
    
    with open(output_csv, 'w', newline='', encoding='utf-8') as outfile:
        writer = csv.DictWriter(outfile, fieldnames=fieldnames)
        writer.writeheader()
        for row in reader:
            centro = row.get(CENTRO_CUSTO_COL, '').strip()
            codigo = centro_custo_to_codigo.get(centro, '')
            row[LOJA_CODIGO_COL] = codigo
            writer.writerow(row)

print(f'Arquivo gerado: {output_csv}')
