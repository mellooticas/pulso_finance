import pandas as pd
import numpy as np
from datetime import datetime
import re
from collections import Counter

print("=" * 80)
print("ANÁLISE ESTRUTURAL PROFUNDA - DADOS YAMPA")
print("Mapeamento para Schema PULSO Finance")
print("=" * 80)

def tratar_valor_brasileiro(valor):
    """Converte valores brasileiros para float"""
    if pd.isna(valor) or valor == '' or valor == ' ':
        return 0.0
    valor = str(valor).strip()
    if valor in ['0,00', '0', '', ' ']:
        return 0.0
    if ',' in valor:
        if valor.count(',') == 1:
            partes = valor.split(',')
            parte_inteira = partes[0].replace('.', '')
            parte_decimal = partes[1]
            valor_tratado = parte_inteira + '.' + parte_decimal
        else:
            valor_tratado = valor.replace(',', '.')
    else:
        valor_tratado = valor.replace('.', '')
    try:
        return float(valor_tratado)
    except:
        return 0.0

def extrair_info_historico(historico):
    """Extrai informações estruturadas do histórico"""
    if pd.isna(historico):
        return {}
    
    historico = str(historico).upper()
    info = {}
    
    # Detectar tipo de transação
    if 'VENDAS' in historico:
        info['tipo'] = 'venda'
        if 'DINHEIRO' in historico:
            info['forma_pagamento'] = 'dinheiro'
        elif 'CARTÃO' in historico or 'CARTAO' in historico:
            info['forma_pagamento'] = 'cartao'
        elif 'PIX' in historico:
            info['forma_pagamento'] = 'pix'
    elif 'DAS' in historico:
        info['tipo'] = 'imposto'
        info['categoria'] = 'simples_nacional'
    elif 'PIS' in historico:
        info['tipo'] = 'imposto'
        info['categoria'] = 'pis'
    elif 'PAGAMENTO' in historico:
        info['tipo'] = 'pagamento'
    elif 'EMPRÉSTIMO' in historico:
        info['tipo'] = 'emprestimo'
    elif 'SINAL' in historico:
        info['tipo'] = 'sinal'
    
    # Extrair valores em R$
    valores = re.findall(r'R\$\s*[\d.,]+', historico)
    if valores:
        info['valor_historico'] = valores[0]
    
    # Extrair códigos numéricos (podem ser IDs de transação)
    codigos = re.findall(r'\b\d{4,}\b', historico)
    if codigos:
        info['codigo_ref'] = codigos[0]
    
    return info

# CARREGAR DADOS
print("\n1. CARREGANDO E PROCESSANDO DADOS...")
print("-" * 50)

yampa_atual = pd.read_csv('data/base/yampa_relatorio.csv', sep=';', encoding='utf-8')
yampa_antigo = pd.read_csv('data/base/yampa_relatorio_antigo.csv', sep=';', encoding='latin-1')

print(f"✓ Dados atuais: {yampa_atual.shape[0]:,} registros")
print(f"✓ Dados antigos: {yampa_antigo.shape[0]:,} registros")

# PROCESSAR VALORES
yampa_atual['valor_receber_num'] = yampa_atual['Valor a receber'].apply(tratar_valor_brasileiro)
yampa_atual['valor_recebido_num'] = yampa_atual['Valor recebido'].apply(tratar_valor_brasileiro)
yampa_atual['valor_pagar_num'] = yampa_atual['Valor a pagar'].apply(tratar_valor_brasileiro)
yampa_atual['valor_pago_num'] = yampa_atual['Valor pago'].apply(tratar_valor_brasileiro)

yampa_antigo['valor_receber_num'] = yampa_antigo['Valor a receber'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_recebido_num'] = yampa_antigo['Valor recebido'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_pagar_num'] = yampa_antigo['Valor a pagar'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_pago_num'] = yampa_antigo['Valor pago'].apply(tratar_valor_brasileiro)

# ANÁLISE 1: PLANO DE CONTAS
print("\n2. ANÁLISE DO PLANO DE CONTAS")
print("-" * 50)

print("PLANO DE CONTAS - DADOS ATUAIS:")
contas_atuais = yampa_atual['Plano de contas'].value_counts()
for conta, freq in contas_atuais.head(15).items():
    pct = (freq / len(yampa_atual)) * 100
    print(f"  {conta}: {freq:,} ({pct:.1f}%)")

print("\nPLANO DE CONTAS - DADOS ANTIGOS:")
contas_antigas = yampa_antigo['Plano de Conta'].value_counts()
for conta, freq in contas_antigas.head(15).items():
    pct = (freq / len(yampa_antigo)) * 100
    print(f"  {conta}: {freq:,} ({pct:.1f}%)")

# ANÁLISE 2: FORNECEDORES/CLIENTES
print("\n3. ANÁLISE DE FORNECEDORES/CLIENTES")
print("-" * 50)

print("TOP FORNECEDORES/CLIENTES - DADOS ATUAIS:")
fornecedores_atuais = yampa_atual['Cliente/Fornecedor'].value_counts()
for forn, freq in fornecedores_atuais.head(10).items():
    if pd.notna(forn) and forn.strip():
        print(f"  {forn}: {freq:,} transações")

print("\nTOP FORNECEDORES/CLIENTES - DADOS ANTIGOS:")
fornecedores_antigos = yampa_antigo['Cliente/Fornecedor'].value_counts()
for forn, freq in fornecedores_antigos.head(10).items():
    if pd.notna(forn) and forn.strip():
        print(f"  {forn}: {freq:,} transações")

# ANÁLISE 3: FORMAS DE PAGAMENTO
print("\n4. ANÁLISE DE FORMAS DE PAGAMENTO")
print("-" * 50)

print("FORMAS DE PAGAMENTO - DADOS ATUAIS:")
formas_atuais = yampa_atual['Meio de pagamento'].value_counts()
for forma, freq in formas_atuais.head(10).items():
    if pd.notna(forma) and forma.strip():
        pct = (freq / len(yampa_atual)) * 100
        print(f"  {forma}: {freq:,} ({pct:.1f}%)")

print("\nFORMAS DE PAGAMENTO - DADOS ANTIGOS:")
formas_antigas = yampa_antigo['Meio de pagamento'].value_counts()
for forma, freq in formas_antigas.head(10).items():
    if pd.notna(forma) and forma.strip():
        pct = (freq / len(yampa_antigo)) * 100
        print(f"  {forma}: {freq:,} ({pct:.1f}%)")

# ANÁLISE 4: CENTROS DE CUSTO
print("\n5. ANÁLISE DE CENTROS DE CUSTO")
print("-" * 50)

print("CENTROS DE CUSTO - DADOS ATUAIS:")
centros_atuais = yampa_atual['Centro de custo'].value_counts()
for centro, freq in centros_atuais.head(10).items():
    if pd.notna(centro) and centro.strip():
        print(f"  {centro}: {freq:,} transações")

# ANÁLISE 5: PADRÕES DE HISTÓRICO
print("\n6. ANÁLISE DE PADRÕES NO HISTÓRICO")
print("-" * 50)

print("Analisando históricos para extração de padrões...")
historicos_sample = yampa_atual['Histórico'].dropna().head(20)

for i, hist in enumerate(historicos_sample, 1):
    info = extrair_info_historico(hist)
    print(f"  {i:2d}. {str(hist)[:60]}...")
    if info:
        print(f"      → {info}")

# ANÁLISE 6: DISTRIBUIÇÃO TEMPORAL
print("\n7. ANÁLISE TEMPORAL")
print("-" * 50)

# Converter datas
yampa_atual['data_esperada_dt'] = pd.to_datetime(yampa_atual['Data esperada'], format='%d/%m/%Y', errors='coerce')
yampa_atual['ano_mes'] = yampa_atual['data_esperada_dt'].dt.to_period('M')

yampa_antigo['data_agendada_dt'] = pd.to_datetime(yampa_antigo['Data agendada'], format='%d/%m/%Y', errors='coerce')
yampa_antigo['ano_mes'] = yampa_antigo['data_agendada_dt'].dt.to_period('M')

print("DISTRIBUIÇÃO POR MÊS (últimos 12 meses dados atuais):")
dist_mensal_atual = yampa_atual['ano_mes'].value_counts().sort_index().tail(12)
for mes, freq in dist_mensal_atual.items():
    print(f"  {mes}: {freq:,} transações")

# ANÁLISE 7: VALORES MÉDIOS POR CATEGORIA
print("\n8. ANÁLISE DE VALORES POR CATEGORIA")
print("-" * 50)

print("VALORES MÉDIOS POR PLANO DE CONTAS (Top 10 - Dados Atuais):")
for conta in contas_atuais.head(10).index:
    dados_conta = yampa_atual[yampa_atual['Plano de contas'] == conta]
    valor_medio_receber = dados_conta['valor_receber_num'].mean()
    valor_medio_pagar = dados_conta['valor_pagar_num'].mean()
    
    if valor_medio_receber > 0:
        print(f"  {conta}")
        print(f"    → Valor médio a receber: R$ {valor_medio_receber:.2f}")
    if valor_medio_pagar > 0:
        print(f"  {conta}")
        print(f"    → Valor médio a pagar: R$ {valor_medio_pagar:.2f}")

print("\n" + "=" * 80)
print("ANÁLISE ESTRUTURAL CONCLUÍDA!")
print("Próximo passo: Mapear para schema PULSO Finance")
print("=" * 80)