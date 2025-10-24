import csv

# Mapeamento de centro de custo para código da loja
centro_custo_to_codigo = {
    'Loja Mauá': '048',
    'Loja Suzano': '042',
    'Loja Suzano II': '010',
    'Loja Rio Pequeno': '011',
    'Loja São Mateus': '012',
    'Escritório': '013',
    'Taty Mello Festas': '007',
    'Ecommerce': '008',
    '': '000',
    '(em branco)': '000',
}

# Mapeamento de código para UUID da loja
codigo_to_uuid = {
    '011': '069c77db-2502-4fa6-b714-51e76f9bc719',
    '008': '114c9820-9fb8-4210-9c18-ca73d93b61ee',
    '013': '534cba2b-932f-4d26-b003-ae1dcb903361',
    '042': 'bab835bc-2df1-4f54-87c3-8151c61ec642',
    '009': 'f03f5cc3-d2ed-4fa1-b8a8-d49f2b0ff59b',
    '012': 'f2a684b9-91b3-4650-b2c0-d64124d3a571',
    '010': 'f333a360-ee11-4a16-b98c-1d41961ca0bd',
    '048': 'f8302fdd-615d-44c6-9dd2-233332937fe1',
    '007': 'f9b6f9e7-3aa8-4023-b56b-e2a964175536',
    '000': '',
}

# Caminhos dos arquivos
input_csv = r'd:\projetos\pulso_finance\data\base\uniao_64k.csv'
output_csv = r'd:\projetos\pulso_finance\data\base\uniao_64k_uuid.csv'

# Nome da coluna de centro de custo no seu CSV de origem (ajuste se necessário)
CENTRO_CUSTO_COL = 'centro_custo'

with open(input_csv, newline='', encoding='utf-8') as infile:
    reader = csv.DictReader(infile, delimiter=';')
    fieldnames = reader.fieldnames.copy()
    # Garante que 'loja_id' estará no cabeçalho
    if 'loja_id' not in fieldnames:
        fieldnames.append('loja_id')

    with open(output_csv, 'w', newline='', encoding='utf-8') as outfile:
        writer = csv.DictWriter(outfile, fieldnames=fieldnames, delimiter=';')
        writer.writeheader()
        for row in reader:
            centro = row.get(CENTRO_CUSTO_COL, '').strip()
            codigo = centro_custo_to_codigo.get(centro, '')
            uuid = codigo_to_uuid.get(codigo, '')
            row['loja_id'] = uuid
            writer.writerow(row)

print(f'Arquivo gerado: {output_csv}')
