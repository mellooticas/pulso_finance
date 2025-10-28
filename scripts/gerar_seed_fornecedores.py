#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 5/8: Gerar seed de FORNECEDORES
- Extrai possíveis fornecedores do campo 'historico'
- Usa a conta contábil (plano_conta) para determinar se é colaborador (5.3.*) ou fornecedor
- Aplica algumas limpezas (datas, valores, 'NF 123', múltiplos espaços)
- Salva em data/seeds/fornecedores.csv
"""

import re
from pathlib import Path
import pandas as pd

# Importa utilidades de mapeamento por plano de contas
try:
    from scripts.mapeamento_categorias_plano_contas import (
        obter_categoria_por_conta,
        obter_tipo_pessoa_por_categoria,
    )
except Exception:
    # Fallback caso o import via pacote falhe (execução direta)
    from mapeamento_categorias_plano_contas import (
        obter_categoria_por_conta,
        obter_tipo_pessoa_por_categoria,
    )

ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/fornecedores.csv")

# Observação importante:
# O tipo_pessoa (fisica/juridica) será derivado da categoria do beneficiário,
# calculada a partir do plano de contas por fornecedor. Qualquer fornecedor que
# possua conta no grupo 5.3.* (pessoal) será marcado como colaborador (fisica).
CONTAS_COLABORADOR = ['5.3']

LIMPA_PADROES = [
    (re.compile(r"\bNF\s*\d+", re.I), ""),
    (re.compile(r"\d{2}/\d{2}/\d{4}"), ""),  # datas 12/05/2024
    (re.compile(r"\d{2}/\d{2}/\d{2}"), ""),  # datas curtas 12/05/24
    (re.compile(r"R\$\s*[\d.,]+"), ""),      # valores R$ 1.234,56
]

# Padrões que NÃO devem virar fornecedores (excluir completamente)
# Mantemos apenas rótulos muito genéricos que não agregam valor
EXCLUI_PADROES = [
    re.compile(r"^FUNCION[ÁA]RIOS?\s*$", re.I),
    re.compile(r"^PAGAMENTO\s+FUNCION[ÁA]RIOS?\s*$", re.I),
    re.compile(r"^FOLHA\s+DE\s+PAGAMENTO\s*$", re.I),
    re.compile(r"^PAGAMENTO\s*$", re.I),
]


def limpar_nome(texto: str) -> str | None:
    if not isinstance(texto, str):
        return None
    s = texto.strip()
    if not s:
        return None
    for rx, rep in LIMPA_PADROES:
        s = rx.sub(rep, s)
    s = re.sub(r"\s+", " ", s).strip()
    if len(s) < 3:
        return None
    # Excluir padrões que devem ser removidos completamente
    for rx in EXCLUI_PADROES:
        if rx.search(s):
            return None
    return s


def eh_conta_colaborador(codigo_conta: str) -> bool:
    """
    Determina se uma conta contábil representa despesa com pessoal (colaboradores).
    Retorna True se a conta for do grupo 5.3.* (Despesas com pessoal).
    """
    if not isinstance(codigo_conta, str):
        return False
    
    codigo_limpo = codigo_conta.strip()
    
    # Verifica se começa com qualquer um dos prefixos de colaborador
    for prefixo in CONTAS_COLABORADOR:
        if codigo_limpo.startswith(prefixo):
            return True
    
    return False


def main():
    print("=" * 60)
    print("SCRIPT 5/8: GERAR SEED DE FORNECEDORES")
    print("=" * 60)

    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)

    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")

    print("\n🏢 Extraindo e limpando nomes do campo 'historico'...")
    
    # Criar uma estrutura para mapear nome -> info baseada na(s) conta(s)
    fornecedores_map = {}  # {nome: {'tipo': 'fisica|juridica', 'categoria': '...','contas': set()}}
    
    for _, row in df.iterrows():
        historico = row.get('historico')
        conta = row.get('plano_conta')
        
        nome_limpo = limpar_nome(historico)
        if not nome_limpo:
            continue
        
        # Inicializa o fornecedor se ainda não existe
        if nome_limpo not in fornecedores_map:
            fornecedores_map[nome_limpo] = {
                'tipo': 'juridica',      # default (ajustado depois)
                'categoria': 'fornecedor',
                'contas': set(),
            }
        
        # Adiciona a conta ao conjunto
        if isinstance(conta, str):
            conta_codigo = conta.split()[0] if ' ' in conta else conta
            fornecedores_map[nome_limpo]['contas'].add(conta_codigo)

    # Após agregar as contas por fornecedor, determinar categoria e tipo
    prioridade = [
        'colaborador',
        'instituicao_financeira',
        'fisco',
        'aluguel',
        'prestador_pf',
        'fornecedor',
        'outro',
    ]

    def escolher_categoria(contas: set[str]) -> str:
        if not contas:
            return 'fornecedor'
        categorias = []
        for c in contas:
            try:
                categorias.append(obter_categoria_por_conta(c))
            except Exception:
                categorias.append('fornecedor')
        # Escolhe a categoria com maior prioridade
        for cat in prioridade:
            if cat in categorias:
                return cat
        return 'fornecedor'

    for info in fornecedores_map.values():
        cat = escolher_categoria(info['contas'])
        info['categoria'] = cat
        info['tipo'] = obter_tipo_pessoa_por_categoria(cat)
    
    print(f"✅ {len(fornecedores_map)} fornecedores potenciais")

    # Classificar por tipo
    print("\n🔍 Classificando tipo de pessoa (física vs jurídica)...")
    colaboradores = sum(1 for f in fornecedores_map.values() if f['tipo'] == 'fisica')
    fornecedores = len(fornecedores_map) - colaboradores
    
    print(f"   👤 {colaboradores} colaboradores (pessoa física - contas 5.3.*)")
    print(f"   🏢 {fornecedores} fornecedores (pessoa jurídica)")

    # Criar DataFrame final
    saida = pd.DataFrame([
        {
            'nome': nome,
            'documento': '',
            'tipo': info['tipo'],
            'categoria': info['categoria'],
            'ativo': 'true'
        }
        for nome, info in sorted(fornecedores_map.items())
    ])

    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    saida.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    print(f"✅ Arquivo criado com {len(saida)} fornecedores")

    print("\n📋 Preview (primeiros 20):")
    print(saida.head(20).to_string(index=False))
    if len(saida) > 20:
        print(f"\n... mais {len(saida) - 20} fornecedores")

    # Mostrar alguns exemplos de cada tipo
    print("\n📊 Exemplos de COLABORADORES (pessoa física):")
    colaboradores_df = saida[saida['tipo'] == 'fisica']
    if len(colaboradores_df) > 0:
        print(colaboradores_df.head(10)['nome'].to_string(index=False))
    
    print("\n📊 Exemplos de FORNECEDORES (pessoa jurídica):")
    fornecedores_df = saida[saida['tipo'] == 'juridica']
    if len(fornecedores_df) > 0:
        print(fornecedores_df.head(10)['nome'].to_string(index=False))

    print("\n📋 Distribuição por categoria (inicial):")
    print(saida['categoria'].value_counts().to_string())

    print("\n" + "=" * 60)
    print("✅ SCRIPT 5/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de fornecedores: {len(saida)}")
    print(f"   👤 Colaboradores (física): {colaboradores}")
    print(f"   🏢 Fornecedores (jurídica): {fornecedores}")


if __name__ == "__main__":
    main()
