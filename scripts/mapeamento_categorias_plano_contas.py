#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Mapeamento completo de categorias (enum do banco) por Plano de Contas.

Este mapeamento define a relação entre contas contábeis e as categorias de beneficiários
usando os valores válidos do enum categoria_beneficiario no banco:
- colaborador: funcionário/folha/comissão/adiantamento/benefícios
- fornecedor: fornecedor/prestador padrão (CNPJ/PJ), utilidades, materiais, etc. [padrão]
- aluguel: locadores/condomínio
- instituicao_financeira: bancos, adquirentes, fintechs
- fisco: tributos/taxas públicas/órgãos públicos
- prestador_pf: prestador pessoa física (autônomo) — não mapeado diretamente aqui
- outro: rótulos genéricos que não são beneficiários — não mapeado aqui

Estrutura do Plano de Contas:
- 3.x: Receitas (não gera fornecedor)
- 4.x: Custos e Despesas Variáveis (impacta DRE como custo/despesa, mas categoria do beneficiário continua sendo uma das acima)
    - 4.1: Custos financeiros (instituicao_financeira)
    - 4.2: Custos com fornecedores (fornecedor)
    - 4.3: Outras operações (fornecedor)
    - 4.4: Comissões internas (colaborador) e outros serviços (fornecedor)
    - 4.6: Despesas operacionais (fornecedor)
    - 4.7: Franquias (fornecedor)
- 5.x: Despesas Fixas
  - 5.1: Despesas bancárias (banco)
  - 5.2: Despesas administrativas (utilidade/fornecedor/servico)
  - 5.3: Despesas com pessoal (colaborador) ⭐ PRINCIPAL
  - 5.4: Despesas com materiais e equipamentos (fornecedor/servico)
  - 5.5: Despesas com veículos (fornecedor)
  - 5.8: Outros tipos de despesas (fornecedor)
- 6.x: Investimentos (fornecedor/servico)
- 7.x: Movimentações Não Operacionais (banco/fornecedor)
"""

# Mapeamento: prefixo da conta -> categoria do beneficiário
# Quanto mais específico o prefixo, maior a prioridade (5.3.1 > 5.3 > 5)

MAPEAMENTO_CATEGORIAS = {
    # ========================================================================
    # GRUPO 5.3: DESPESAS COM PESSOAL (COLABORADOR) ⭐
    # ========================================================================
    '5.3': 'colaborador',           # Todas despesas com pessoal
    '5.3.1': 'colaborador',         # Salário de funcionários
    '5.3.3': 'colaborador',         # VT e VR
    '5.3.4': 'colaborador',         # Rescisão
    '5.3.5': 'colaborador',         # FGTS
    '5.3.6': 'colaborador',         # INSS - Federação - Sindicato - IR
    '5.3.7': 'colaborador',         # 13º e férias
    '5.3.8': 'colaborador',         # Exames ocupacionais
    '5.3.9': 'colaborador',         # Pro-Labores
    '5.3.12': 'colaborador',        # Diarista
    '5.3.13': 'colaborador',        # Vale adiantamento
    '5.3.14': 'colaborador',        # Bonificações para Funcionários
    '5.3.15': 'colaborador',        # Aprovisionamento para 13 e Férias
    '5.3.99': 'colaborador',        # Outras despesas com pessoal
    
    # ========================================================================
    # GRUPO 5.2: DESPESAS ADMINISTRATIVAS (MISTO)
    # ========================================================================
    '5.2.4': 'aluguel',             # Aluguel e condomínio
    '5.2.1': 'fornecedor',          # Telefone e internet (utilidade)
    '5.2.2': 'fornecedor',          # Celular (utilidade)
    '5.2.3': 'fornecedor',          # Energia elétrica (utilidade)
    '5.2.20': 'fornecedor',         # Energia Elétrica Escritório (utilidade)
    '5.2.5': 'fornecedor',          # Água (utilidade)
    '5.2.6': 'fisco',               # IPTU e taxas públicas
    '5.2.11': 'fornecedor',         # Contador (serviço PJ)
    '5.2.10': 'fornecedor',         # Cartórios (serviço)
    '5.2.12': 'fornecedor',         # Mensalidade de softwares (serviço)
    '5.2.13': 'fornecedor',         # Alarme monitorado / Segurança (serviço)
    '5.2.17': 'fornecedor',         # Documentação empresa (serviço)
    '5.2.7': 'fornecedor',          # Motoboy para Entrega — custo de vendas (DRE)
    '5.2.8': 'fornecedor',          # Almoço / Supermercado / Lanches
    '5.2.14': 'fornecedor',         # Compras para loja
    '5.2.15': 'fornecedor',         # Montagens
    '5.2.16': 'fornecedor',         # Entregas
    '5.2.18': 'fornecedor',         # Compra da loja
    '5.2.19': 'fornecedor',         # Acessórios
    '5.2.21': 'instituicao_financeira',  # Pagamento Cartão de Crédito
    '5.2.22': 'fornecedor',         # Compras para Festa
    '5.2.23': 'fornecedor',         # Locação para Festas
    '5.2.99': 'fornecedor',         # Outras despesas administrativas
    
    # ========================================================================
    # GRUPO 5.1: DESPESAS BANCÁRIAS (INSTITUIÇÃO FINANCEIRA)
    # ========================================================================
    '5.1': 'instituicao_financeira',   # Todas despesas bancárias
    '5.1.1': 'instituicao_financeira', # Tarifas bancárias
    '5.1.2': 'instituicao_financeira', # Aluguel de máquinas de cartão
    '5.1.3': 'instituicao_financeira', # Tarifas DOC/TED
    
    # ========================================================================
    # GRUPO 5.4: MATERIAIS E EQUIPAMENTOS (FORNECEDOR)
    # ========================================================================
    '5.4.1': 'fornecedor',          # Manutenção máquinas e equipamentos (serviço PJ)
    '5.4.2': 'fornecedor',          # Serviços técnicos em geral (serviço PJ)
    '5.4.3': 'fornecedor',          # Materiais de expediente / escritório / loja
    '5.4.4': 'fornecedor',          # Materiais de limpeza e manutenção predial
    '5.4.99': 'fornecedor',         # Outras despesas com materiais
    
    # ========================================================================
    # GRUPO 5.5: DESPESAS COM VEÍCULOS (FORNECEDOR)
    # ========================================================================
    '5.5.1': 'fornecedor',          # Gasolina / Combustível
    '5.5.2': 'fornecedor',          # Manutenção de veículos (serviço PJ)
    '5.5.4': 'fornecedor',          # Estacionamento / Pedágios
    '5.5.5': 'fornecedor',          # Frete
    '5.5.99': 'fornecedor',         # Outras despesas com veículos
    
    # ========================================================================
    # GRUPO 4.1: CUSTOS FINANCEIROS (INSTITUIÇÃO FINANCEIRA / FISCO)
    # ========================================================================
    '4.1': 'instituicao_financeira',  # Custos financeiros
    '4.1.1': 'fisco',                 # Simples nacional
    '4.1.2': 'instituicao_financeira',# Taxas de cartões
    '4.1.99': 'instituicao_financeira',# Outros custos financeiros
    
    # ========================================================================
    # GRUPO 4.2: CUSTOS COM FORNECEDORES (FORNECEDOR)
    # ========================================================================
    '4.2': 'fornecedor',            # Todas custos com fornecedores
    '4.2.1': 'fornecedor',          # Fornecedores
    '4.2.3': 'fornecedor',          # Fornecedores de Lentes
    '4.2.4': 'fornecedor',          # Fornecedores de Armações
    '4.2.5': 'fornecedor',          # fornecedor de bolos para festas
    '4.2.6': 'fornecedor',          # fornecedores de pães para festas
    '4.2.7': 'fornecedor',          # forencedores de decorações para festas
    '4.2.8': 'fornecedor',          # fornecedores doces personalisados para festas
    
    # ========================================================================
    # GRUPO 4.3: OUTRAS OPERAÇÕES (FORNECEDOR)
    # ========================================================================
    '4.3': 'fornecedor',            # Outras operações
    '4.3.1': 'fornecedor',          # Custos com embalagens
    
    # ========================================================================
    # GRUPO 4.4: COMISSÕES E SERVIÇOS (COLABORADOR/FORNECEDOR)
    # ========================================================================
    '4.4.1': 'colaborador',         # Comissão interna (funcionários)
    '4.4.5': 'colaborador',         # Comissões DSR (funcionários)
    '4.4.3': 'fornecedor',          # Gastos com Médicos — custo de vendas (DRE)
    '4.4.4': 'fornecedor',          # Montagem (serviço PJ)
    '4.4.9': 'fornecedor',          # Cancelamentos de Vendas
    
    # ========================================================================
    # GRUPO 4.6: DESPESAS OPERACIONAIS (FORNECEDOR/SERVIÇO)
    # ========================================================================
    '4.6.1': 'fornecedor',          # Transporte festas
    '4.6.2': 'fornecedor',          # Consertos (serviço PJ)
    
    # ========================================================================
    # GRUPO 4.7: FRANQUIAS (FORNECEDOR)
    # ========================================================================
    '4.7': 'fornecedor',            # Franquias
    '4.7.1': 'fornecedor',          # Pagto Franquia
    
    # ========================================================================
    # GRUPO 6: INVESTIMENTOS (FORNECEDOR)
    # ========================================================================
    '6.1.1': 'fornecedor',          # Papelaria (folder, cartão visitas, etc.)
    '6.1.2': 'fornecedor',          # Site / Internet (serviço PJ)
    '6.1.3': 'fornecedor',          # Mídias / Propaganda (serviço PJ)
    '6.1.5': 'fornecedor',          # Prestadores de serviços de marketing
    '6.1.7': 'fornecedor',          # META ADS
    '6.1.8': 'fornecedor',          # SAÚDE DOS OLHOS
    '6.1.99': 'fornecedor',         # Outros investimentos em marketing
    '6.2.1': 'fornecedor',          # Compra de equipamentos de informática
    '6.2.2': 'fornecedor',          # Reformas / Estrutura (serviço PJ)
    '6.2.3': 'fornecedor',          # Mobiliário
    '6.3.1': 'fornecedor',          # Consultoria (serviço PJ)
    '6.3.2': 'fornecedor',          # Treinamentos (serviço PJ)
    '6.4.99': 'fornecedor',         # Outros investimentos
    
    # ========================================================================
    # GRUPO 7: MOVIMENTAÇÕES NÃO OPERACIONAIS (INSTITUIÇÃO FINANCEIRA)
    # ========================================================================
    '7.1.1': 'instituicao_financeira', # Empréstimos obtidos
    '7.2.1': 'instituicao_financeira', # Pagamento de empréstimos
    '7.2.2': 'instituicao_financeira', # Juros bancários e por atraso
    
    # ========================================================================
    # OUTROS
    # ========================================================================
    '5.8': 'fornecedor',            # Aportes entre lojas (movimentação interna)
}


def obter_categoria_por_conta(codigo_conta: str) -> str:
    """
    Retorna a categoria do beneficiário baseada no código da conta contábil.
    
    A busca é feita do mais específico para o mais genérico:
    1. Tenta match exato (ex: "5.3.1")
    2. Tenta subgrupo de 3 dígitos (ex: "5.3")
    3. Tenta grupo principal (ex: "5")
    4. Retorna 'fornecedor' como padrão
    
    Args:
        codigo_conta: Código da conta no formato "X.Y.Z" ou "X.Y"
        
    Returns:
    Categoria: 'colaborador', 'fornecedor', 'aluguel', 'instituicao_financeira',
           'fisco', 'prestador_pf' (se aplicável) ou 'outro'
    """
    if not isinstance(codigo_conta, str):
        return 'fornecedor'
    
    # Remove espaços e pega apenas o código (antes de qualquer espaço)
    codigo_limpo = codigo_conta.strip().split()[0] if ' ' in codigo_conta else codigo_conta.strip()
    
    # 1. Tenta match exato
    if codigo_limpo in MAPEAMENTO_CATEGORIAS:
        return MAPEAMENTO_CATEGORIAS[codigo_limpo]
    
    # 2. Tenta matches progressivamente mais genéricos
    partes = codigo_limpo.split('.')
    for i in range(len(partes), 0, -1):
        prefixo = '.'.join(partes[:i])
        if prefixo in MAPEAMENTO_CATEGORIAS:
            return MAPEAMENTO_CATEGORIAS[prefixo]
    
    # 3. Padrão: fornecedor
    return 'fornecedor'


def obter_tipo_pessoa_por_categoria(categoria: str) -> str:
    """
    Retorna o tipo de pessoa baseado na categoria.
    
    Args:
        categoria: Categoria do beneficiário
        
    Returns:
        'fisica' se for colaborador, 'juridica' para os demais
    """
    return 'fisica' if categoria == 'colaborador' else 'juridica'


# Estatísticas e validações
if __name__ == '__main__':
    print("="*60)
    print("MAPEAMENTO DE CATEGORIAS - PLANO DE CONTAS")
    print("="*60)
    
    # Contar por categoria
    from collections import Counter
    categorias = Counter(MAPEAMENTO_CATEGORIAS.values())
    
    print(f"\n📊 Total de contas mapeadas: {len(MAPEAMENTO_CATEGORIAS)}")
    print("\n📋 Distribuição por categoria:")
    for cat, qtd in categorias.most_common():
        print(f"   {cat:15} : {qtd:3} contas")
    
    # Exemplos
    print("\n🧪 Exemplos de classificação:")
    testes = [
        '5.3.1',    # Salário -> colaborador
        '5.3.7',    # 13º e férias -> colaborador
        '5.2.4',    # Aluguel -> aluguel
        '5.2.3',    # Energia -> utilidade
        '5.1.1',    # Tarifas -> banco
        '4.2.1',    # Fornecedores -> fornecedor
        '6.3.1',    # Consultoria -> servico
        '5.2.6',    # IPTU -> imposto
        '5.2.99',   # Outras adm -> fornecedor (padrão)
    ]
    
    for conta in testes:
        cat = obter_categoria_por_conta(conta)
        tipo = obter_tipo_pessoa_por_categoria(cat)
        print(f"   {conta:10} -> {cat:15} ({tipo})")
