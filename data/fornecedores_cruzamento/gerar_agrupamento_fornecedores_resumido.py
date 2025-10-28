# Script para resumir agrupamento de fornecedores
# Agrupa variações de nomes e soma as ocorrências

import csv
from collections import defaultdict, Counter
from pathlib import Path
import re

ARQUIVO_ENTRADA = Path('data/fornecedores_cruzamento/agrupamento_plano_descricao.csv')
ARQUIVO_SAIDA = Path('data/fornecedores_cruzamento/agrupamento_fornecedores_resumido.csv')

# Função para normalizar nomes (remove acentos, caixa baixa, ignora pontuação, etc)
def normalizar_nome(nome):
    nome = nome.lower()
    nome = re.sub(r'[^a-z0-9]+', ' ', nome)
    nome = nome.replace('lt da', 'ltda').replace('ltd', 'ltda')
    nome = nome.replace('consultoria', '').replace('contabilidade', '')
    nome = nome.replace('pix', '').replace('cnpj', '')
    nome = nome.replace('mensalidade', '').replace('acordo', '')
    nome = nome.replace('parcela', '').replace('servico', '').replace('serviço', '')
    nome = nome.replace('extra', '').replace('abertura', '').replace('alteracao', '').replace('alteração', '')
    nome = nome.replace('contrato social', '')
    nome = nome.replace('tmo', '')
    nome = nome.replace('debitos', '').replace('débito', '')
    nome = nome.replace('pagamento de boleto', '')
    nome = nome.replace(' ', '')
    return nome.strip()

def main():
    agrupado = defaultdict(Counter)
    with ARQUIVO_ENTRADA.open(encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            plano = row['plano_conta']
            desc = row['descricao']
            qtd = int(row['quantidade'])
            chave = normalizar_nome(desc)
            agrupado[chave][desc] += qtd
    # Gera arquivo resumido
    with ARQUIVO_SAIDA.open('w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(['nome_resumido','nomes_varios','total_ocorrencias'])
        for chave, counter in agrupado.items():
            nomes = list(counter.keys())
            total = sum(counter.values())
            writer.writerow([chave, '|'.join(nomes), total])

if __name__ == '__main__':
    main()
