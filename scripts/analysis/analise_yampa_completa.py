import pandas as pd
import numpy as np
from datetime import datetime

print("=" * 80)
print("ANÁLISE FINANCEIRA COMPLETA - YAMPA (2020-2025)")
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

# 1. CARREGAMENTO DOS DADOS
print("\n1. CARREGANDO DADOS...")
print("-" * 50)

yampa_atual = pd.read_csv('data/base/yampa_relatorio.csv', sep=';', encoding='utf-8')
yampa_antigo = pd.read_csv('data/base/yampa_relatorio_antigo.csv', sep=';', encoding='latin-1')

print(f"✓ Dados atuais: {yampa_atual.shape[0]:,} transações")
print(f"✓ Dados antigos: {yampa_antigo.shape[0]:,} transações")
print(f"✓ TOTAL: {yampa_atual.shape[0] + yampa_antigo.shape[0]:,} transações")

# 2. PROCESSAMENTO DOS VALORES
print("\n2. PROCESSANDO VALORES FINANCEIROS...")
print("-" * 50)

# Processar dados atuais
yampa_atual['valor_receber_num'] = yampa_atual['Valor a receber'].apply(tratar_valor_brasileiro)
yampa_atual['valor_recebido_num'] = yampa_atual['Valor recebido'].apply(tratar_valor_brasileiro)
yampa_atual['valor_pagar_num'] = yampa_atual['Valor a pagar'].apply(tratar_valor_brasileiro)
yampa_atual['valor_pago_num'] = yampa_atual['Valor pago'].apply(tratar_valor_brasileiro)

# Processar dados antigos
yampa_antigo['valor_receber_num'] = yampa_antigo['Valor a receber'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_recebido_num'] = yampa_antigo['Valor recebido'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_pagar_num'] = yampa_antigo['Valor a pagar'].apply(tratar_valor_brasileiro)
yampa_antigo['valor_pago_num'] = yampa_antigo['Valor pago'].apply(tratar_valor_brasileiro)

print("✓ Valores convertidos para formato numérico")

# 3. RESUMO FINANCEIRO - DADOS ATUAIS (2022-2025)
print("\n3. RESUMO FINANCEIRO - PERÍODO ATUAL (2022-2025)")
print("-" * 50)

total_receber_atual = yampa_atual['valor_receber_num'].sum()
total_recebido_atual = yampa_atual['valor_recebido_num'].sum()
total_pagar_atual = yampa_atual['valor_pagar_num'].sum()
total_pago_atual = yampa_atual['valor_pago_num'].sum()

print(f"💰 Total a receber: R$ {total_receber_atual:,.2f}")
print(f"✅ Total recebido: R$ {total_recebido_atual:,.2f}")
print(f"💸 Total a pagar: R$ {total_pagar_atual:,.2f}")
print(f"✅ Total pago: R$ {total_pago_atual:,.2f}")

receita_liquida_atual = total_recebido_atual - total_pago_atual
print(f"📊 RESULTADO LÍQUIDO ATUAL: R$ {receita_liquida_atual:,.2f}")

# 4. RESUMO FINANCEIRO - DADOS ANTIGOS (2020-2022)
print("\n4. RESUMO FINANCEIRO - PERÍODO ANTIGO (2020-2022)")
print("-" * 50)

total_receber_antigo = yampa_antigo['valor_receber_num'].sum()
total_recebido_antigo = yampa_antigo['valor_recebido_num'].sum()
total_pagar_antigo = yampa_antigo['valor_pagar_num'].sum()
total_pago_antigo = yampa_antigo['valor_pago_num'].sum()

print(f"💰 Total a receber: R$ {total_receber_antigo:,.2f}")
print(f"✅ Total recebido: R$ {total_recebido_antigo:,.2f}")
print(f"💸 Total a pagar: R$ {total_pagar_antigo:,.2f}")
print(f"✅ Total pago: R$ {total_pago_antigo:,.2f}")

receita_liquida_antigo = total_recebido_antigo - total_pago_antigo
print(f"📊 RESULTADO LÍQUIDO ANTIGO: R$ {receita_liquida_antigo:,.2f}")

# 5. CONSOLIDADO GERAL (2020-2025)
print("\n5. CONSOLIDADO GERAL - 5 ANOS (2020-2025)")
print("=" * 50)

total_recebido_geral = total_recebido_atual + total_recebido_antigo
total_pago_geral = total_pago_atual + total_pago_antigo
receita_liquida_geral = total_recebido_geral - total_pago_geral

print(f"🏆 RECEITAS TOTAIS: R$ {total_recebido_geral:,.2f}")
print(f"🏆 DESPESAS TOTAIS: R$ {total_pago_geral:,.2f}")
print(f"🏆 RESULTADO LÍQUIDO (5 ANOS): R$ {receita_liquida_geral:,.2f}")

# Análise de crescimento
if receita_liquida_antigo != 0:
    crescimento = ((receita_liquida_atual - receita_liquida_antigo) / abs(receita_liquida_antigo)) * 100
    print(f"📈 CRESCIMENTO: {crescimento:+.1f}%")

# 6. ANÁLISE DE STATUS
print("\n6. ANÁLISE DE STATUS DAS TRANSAÇÕES")
print("-" * 50)

print("Status - Período Atual:")
status_atual = yampa_atual['Status'].value_counts()
for status, count in status_atual.items():
    pct = (count / len(yampa_atual)) * 100
    print(f"  {status}: {count:,} ({pct:.1f}%)")

print("\nStatus - Período Antigo:")
status_antigo = yampa_antigo['Status'].value_counts()
for status, count in status_antigo.items():
    pct = (count / len(yampa_antigo)) * 100
    print(f"  {status}: {count:,} ({pct:.1f}%)")

# 7. TOP CONTAS - RECEITAS
print("\n7. TOP 10 CONTAS - RECEITAS")
print("-" * 50)

# Dados atuais - receitas
receitas_atuais = yampa_atual[yampa_atual['valor_recebido_num'] > 0].groupby('Plano de contas')['valor_recebido_num'].sum().sort_values(ascending=False).head(10)
print("Período Atual (2022-2025):")
for conta, valor in receitas_atuais.items():
    print(f"  {conta}: R$ {valor:,.2f}")

# Dados antigos - receitas
receitas_antigas = yampa_antigo[yampa_antigo['valor_recebido_num'] > 0].groupby('Plano de Conta')['valor_recebido_num'].sum().sort_values(ascending=False).head(10)
print("\nPeríodo Antigo (2020-2022):")
for conta, valor in receitas_antigas.items():
    print(f"  {conta}: R$ {valor:,.2f}")

# 8. TOP CONTAS - DESPESAS
print("\n8. TOP 10 CONTAS - DESPESAS")
print("-" * 50)

# Dados atuais - despesas
despesas_atuais = yampa_atual[yampa_atual['valor_pago_num'] > 0].groupby('Plano de contas')['valor_pago_num'].sum().sort_values(ascending=False).head(10)
print("Período Atual (2022-2025):")
for conta, valor in despesas_atuais.items():
    print(f"  {conta}: R$ {valor:,.2f}")

# Dados antigos - despesas
despesas_antigas = yampa_antigo[yampa_antigo['valor_pago_num'] > 0].groupby('Plano de Conta')['valor_pago_num'].sum().sort_values(ascending=False).head(10)
print("\nPeríodo Antigo (2020-2022):")
for conta, valor in despesas_antigas.items():
    print(f"  {conta}: R$ {valor:,.2f}")

# 9. ANÁLISE POR ANO
print("\n9. ANÁLISE ANUAL")
print("-" * 50)

# Converter datas para análise anual
yampa_atual['Data esperada'] = pd.to_datetime(yampa_atual['Data esperada'], format='%d/%m/%Y', errors='coerce')
yampa_atual['ano'] = yampa_atual['Data esperada'].dt.year

yampa_antigo['Data agendada'] = pd.to_datetime(yampa_antigo['Data agendada'], format='%d/%m/%Y', errors='coerce')
yampa_antigo['ano'] = yampa_antigo['Data agendada'].dt.year

# Resultado por ano - dados antigos
print("Resultado por ano (dados antigos):")
for ano in sorted(yampa_antigo['ano'].dropna().unique()):
    ano_data = yampa_antigo[yampa_antigo['ano'] == ano]
    receitas = ano_data['valor_recebido_num'].sum()
    despesas = ano_data['valor_pago_num'].sum()
    resultado = receitas - despesas
    print(f"  {int(ano)}: R$ {resultado:,.2f} (R$ {receitas:,.2f} - R$ {despesas:,.2f})")

# Resultado por ano - dados atuais
print("\nResultado por ano (dados atuais):")
for ano in sorted(yampa_atual['ano'].dropna().unique()):
    ano_data = yampa_atual[yampa_atual['ano'] == ano]
    receitas = ano_data['valor_recebido_num'].sum()
    despesas = ano_data['valor_pago_num'].sum()
    resultado = receitas - despesas
    print(f"  {int(ano)}: R$ {resultado:,.2f} (R$ {receitas:,.2f} - R$ {despesas:,.2f})")

print("\n" + "=" * 80)
print("ANÁLISE CONCLUÍDA!")
print("=" * 80)