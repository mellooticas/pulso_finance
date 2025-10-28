# Script para cruzamento de fornecedores/colaboradores
# Gera agrupamento de plano de contas + descrição/histórico para análise

import csv
from collections import Counter, defaultdict
from pathlib import Path

ARQUIVO_ENTRADA = Path('data/base/uniao_64k.csv')
ARQUIVO_SAIDA = Path('data/fornecedores_cruzamento/agrupamento_plano_descricao.csv')

# Ajuste o nome das colunas conforme o cabeçalho do seu CSV
def main():
    contagem = Counter()
    agrupamento = defaultdict(set)
    with ARQUIVO_ENTRADA.open(encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            plano = row.get('plano_conta') or row.get('Plano de contas')
            desc = row.get('historico') or row.get('Histórico')
            if plano and desc:
                chave = (plano.strip(), desc.strip())
                contagem[chave] += 1
                agrupamento[plano.strip()].add(desc.strip())
    # Gera arquivo de agrupamento
    with ARQUIVO_SAIDA.open('w', encoding='utf-8', newline='') as f:
        writer = csv.writer(f, delimiter=';')
        writer.writerow(['plano_conta','descricao','quantidade'])
        for (plano, desc), qtd in contagem.most_common():
            writer.writerow([plano, desc, qtd])

if __name__ == '__main__':
    main()
