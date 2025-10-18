#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para consolidar dados do YAMPA (atual + antigo) e gerar SQLs de migração
"""

import pandas as pd
import numpy as np
import uuid
from datetime import datetime
import re
import os

# Configurações
PASTA_BASE = 'd:/projetos/pulso_finance/data/base'
PASTA_SEEDS = 'd:/projetos/pulso_finance/database/seeds'
REGISTROS_POR_ARQUIVO = 150

def limpar_valor(valor_str):
    """Converte string monetária brasileira para float"""
    if pd.isna(valor_str) or valor_str == '' or valor_str == 'nan':
        return 0.0
    
    # Remove espaços e caracteres especiais
    valor_clean = str(valor_str).strip()
    valor_clean = valor_clean.replace('R$', '').replace(' ', '')
    
    # Remover caracteres não numéricos, mantendo apenas dígitos, vírgula, ponto e sinal negativo
    valor_clean = re.sub(r'[^\d\-\.,]', '', valor_clean)
    
    if valor_clean == '' or valor_clean == '-':
        return 0.0
    
    try:
        # Formato brasileiro: 1.234.567,89
        # Primeiro, verificar se há vírgula (decimal brasileiro)
        if ',' in valor_clean:
            # Se há vírgula, tudo antes dela são milhares, depois dela são centavos
            partes = valor_clean.split(',')
            if len(partes) == 2:
                # Remover pontos da parte inteira (separadores de milhar)
                parte_inteira = partes[0].replace('.', '')
                parte_decimal = partes[1]
                
                # Garantir que parte decimal tenha no máximo 2 dígitos
                if len(parte_decimal) > 2:
                    parte_decimal = parte_decimal[:2]
                
                valor_final = f"{parte_inteira}.{parte_decimal}"
                return float(valor_final)
        else:
            # Sem vírgula - pode ser número inteiro ou formato americano
            # Se há pontos, assumir que é separador de milhar brasileiro
            if '.' in valor_clean:
                # Contar quantos pontos há
                pontos = valor_clean.count('.')
                if pontos == 1:
                    # Um ponto - pode ser decimal americano ou milhar brasileiro
                    partes = valor_clean.split('.')
                    if len(partes[1]) <= 2:  # Provavelmente decimal americano
                        return float(valor_clean)
                    else:  # Provavelmente milhar brasileiro
                        return float(valor_clean.replace('.', ''))
                else:
                    # Múltiplos pontos - separadores de milhar brasileiros
                    return float(valor_clean.replace('.', ''))
            else:
                # Apenas dígitos
                return float(valor_clean)
                
    except Exception as e:
        print(f"Erro ao converter valor: {valor_str} -> {valor_clean} | Erro: {e}")
        return 0.0

def converter_data(data_str):
    """Converte data DD/MM/YYYY para YYYY-MM-DD"""
    if pd.isna(data_str) or data_str == '' or data_str == 'nan':
        return None
    
    try:
        # Formato DD/MM/YYYY
        data_obj = datetime.strptime(str(data_str).strip(), '%d/%m/%Y')
        return data_obj.strftime('%Y-%m-%d')
    except:
        try:
            # Formato DD/MM/YY
            data_obj = datetime.strptime(str(data_str).strip(), '%d/%m/%y')
            return data_obj.strftime('%Y-%m-%d')
        except:
            print(f"Erro ao converter data: {data_str}")
            return None

def processar_arquivo_csv(caminho_arquivo, nome_arquivo):
    """Processa um arquivo CSV do YAMPA"""
    print(f"\n📂 Processando {nome_arquivo}...")
    
    try:
        # Ler CSV
        df = pd.read_csv(caminho_arquivo, sep=';', encoding='utf-8')
        print(f"   ✅ {len(df)} registros encontrados")
        
        # Normalizar nomes das colunas
        df.columns = df.columns.str.strip()
        
        # ATENÇÃO: Os arquivos têm ordem diferente de colunas!
        if 'yampa_relatorio_antigo' in nome_arquivo:
            # Arquivo antigo: Valor a receber | Valor recebido | Valor pago | Valor a pagar
            colunas_map = {
                'Data agendada': 'data_esperada', 
                'Data realizada': 'data_realizada',
                'Plano de Conta': 'plano_conta',
                'Historico': 'historico',
                'Sequencia': 'sequencia',
                'Conta bancaria': 'conta_bancaria',
                'Valor a receber': 'valor_receber',
                'Valor recebido': 'valor_recebido',
                'Valor pago': 'valor_pago',          # CORRETO: 3ª coluna
                'Valor a pagar': 'valor_pagar',      # CORRETO: 4ª coluna  
                'Status': 'status',
                'Cliente/Fornecedor': 'cliente_fornecedor',
                'Meio de pagamento': 'meio_pagamento',
                'Centro de custo': 'centro_custo',
                'Projeto': 'projeto',
                'Data da ultima alteracao': 'data_alteracao',
                'Codigo da conciliacao bancaria': 'codigo_conciliacao'
            }
        else:
            # Arquivo atual: Valor a receber | Valor recebido | Valor a pagar | Valor pago
            colunas_map = {
                'Data esperada': 'data_esperada',
                'Data realizada': 'data_realizada',
                'Plano de contas': 'plano_conta',
                'Histórico': 'historico',
                'Sequência': 'sequencia',
                'Conta bancária': 'conta_bancaria',
                'Valor a receber': 'valor_receber',
                'Valor recebido': 'valor_recebido',
                'Valor a pagar': 'valor_pagar',       # CORRETO: 3ª coluna
                'Valor pago': 'valor_pago',           # CORRETO: 4ª coluna
                'Status': 'status',
                'Cliente/Fornecedor': 'cliente_fornecedor',
                'Cliente/Fornecee\ndor': 'cliente_fornecedor',  # Quebra de linha
                'Meio de pagamento': 'meio_pagamento',
                'Centro de custo': 'centro_custo',
                'Projeto': 'projeto',
                'Data da última alteração': 'data_alteracao',
                'Código da conciliação bancária': 'codigo_conciliacao'
            }
        
        df = df.rename(columns=colunas_map)
        
        # Processar valores monetários
        df['valor_receber'] = df['valor_receber'].apply(limpar_valor)
        df['valor_recebido'] = df['valor_recebido'].apply(limpar_valor)
        
        # CORREÇÃO ESPECÍFICA: No arquivo antigo, valores a pagar/pago são positivos mas deveriam ser negativos
        if 'yampa_relatorio_antigo' in nome_arquivo:
            # Arquivo antigo: valores a pagar são positivos, mas devem ser negativos
            df['valor_pagar'] = df['valor_pagar'].apply(lambda x: -abs(limpar_valor(x)) if limpar_valor(x) > 0 else 0)
            df['valor_pago'] = df['valor_pago'].apply(lambda x: -abs(limpar_valor(x)) if limpar_valor(x) > 0 else 0)
        else:
            # Arquivo atual: valores já vêm com sinal correto
            df['valor_pagar'] = df['valor_pagar'].apply(limpar_valor)
            df['valor_pago'] = df['valor_pago'].apply(limpar_valor)
        
        # Converter datas
        df['data_esperada'] = df['data_esperada'].apply(converter_data)
        df['data_realizada'] = df['data_realizada'].apply(converter_data)
        
        # Filtrar registros válidos
        df_valido = df[
            (df['data_esperada'].notna()) &
            ((df['valor_receber'] != 0) | (df['valor_pagar'] != 0))
        ].copy()
        
        print(f"   ✅ {len(df_valido)} registros válidos após filtros")
        
        # Adicionar origem
        df_valido['origem_arquivo'] = nome_arquivo
        
        return df_valido
        
    except Exception as e:
        print(f"   ❌ Erro ao processar {nome_arquivo}: {e}")
        return pd.DataFrame()

def consolidar_dados():
    """Consolida dados dos dois arquivos CSV"""
    print("🔄 Consolidando dados do YAMPA...")
    
    # Processar arquivo atual
    df_atual = processar_arquivo_csv(
        f'{PASTA_BASE}/yampa_relatorio.csv',
        'yampa_relatorio'
    )
    
    # Processar arquivo antigo
    df_antigo = processar_arquivo_csv(
        f'{PASTA_BASE}/yampa_relatorio_antigo_utf8.csv', 
        'yampa_relatorio_antigo'
    )
    
    if df_atual.empty and df_antigo.empty:
        print("❌ Nenhum dado válido encontrado!")
        return pd.DataFrame()
    
    # Consolidar
    df_consolidado = pd.concat([df_atual, df_antigo], ignore_index=True)
    
    # Ordenar por data
    df_consolidado = df_consolidado.sort_values(['data_esperada', 'origem_arquivo'])
    
    print(f"\n📊 RESUMO DA CONSOLIDAÇÃO:")
    print(f"   📈 Arquivo atual: {len(df_atual)} registros")
    print(f"   📈 Arquivo antigo: {len(df_antigo)} registros")
    print(f"   📈 Total consolidado: {len(df_consolidado)} registros")
    
    # Estatísticas
    total_receber = df_consolidado['valor_receber'].sum()
    total_pagar = df_consolidado['valor_pagar'].sum()
    total_recebido = df_consolidado['valor_recebido'].sum()
    total_pago = df_consolidado['valor_pago'].sum()
    
    print(f"\n💰 RESUMO FINANCEIRO:")
    print(f"   💚 Valor a receber: R$ {total_receber:,.2f}")
    print(f"   💚 Valor recebido: R$ {total_recebido:,.2f}")
    print(f"   💙 Valor a pagar: R$ {total_pagar:,.2f}")
    print(f"   💙 Valor pago: R$ {total_pago:,.2f}")
    print(f"   📊 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}")
    
    return df_consolidado

def salvar_csv_consolidado(df):
    """Salva CSV consolidado"""
    caminho = f'{PASTA_BASE}/yampa_consolidated_completo.csv'
    df.to_csv(caminho, index=False, sep=';', encoding='utf-8')
    print(f"💾 CSV consolidado salvo: {caminho}")
    return caminho

if __name__ == "__main__":
    print("🚀 INICIANDO CONSOLIDAÇÃO DOS DADOS YAMPA")
    print("=" * 50)
    
    # Consolidar dados
    df_consolidado = consolidar_dados()
    
    if not df_consolidado.empty:
        # Salvar CSV consolidado
        caminho_csv = salvar_csv_consolidado(df_consolidado)
        
        print(f"\n✅ CONSOLIDAÇÃO CONCLUÍDA!")
        print(f"📁 Arquivo gerado: {caminho_csv}")
        print(f"📊 Total de registros: {len(df_consolidado)}")
    else:
        print("❌ Falha na consolidação!")