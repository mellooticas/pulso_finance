#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Sistema Inteligente de Deduplicação YAMPA
- Consolida dois arquivos CSV
- Remove duplicatas priorizando arquivo mais novo
- Usa múltiplos critérios de matching
"""

import pandas as pd
import numpy as np
import re
import hashlib
from datetime import datetime
import os

# Configurações
PASTA_BASE = 'd:/projetos/pulso_finance/data/base'

def limpar_valor_brasileiro(valor_str):
    """Converte string monetária brasileira para float"""
    if pd.isna(valor_str) or valor_str == '' or str(valor_str) == 'nan':
        return 0.0
    
    valor_clean = str(valor_str).strip()
    valor_clean = valor_clean.replace('R$', '').replace(' ', '')
    valor_clean = re.sub(r'[^\d\-\.,]', '', valor_clean)
    
    if valor_clean == '' or valor_clean == '-':
        return 0.0
    
    try:
        if ',' in valor_clean:
            partes = valor_clean.split(',')
            if len(partes) == 2:
                parte_inteira = partes[0].replace('.', '')
                parte_decimal = partes[1]
                if len(parte_decimal) > 2:
                    parte_decimal = parte_decimal[:2]
                valor_final = f"{parte_inteira}.{parte_decimal}"
                return float(valor_final)
        else:
            return float(valor_clean.replace('.', ''))
    except Exception as e:
        return 0.0

def converter_data_br(data_str):
    """Converte data DD/MM/YYYY para YYYY-MM-DD"""
    if pd.isna(data_str) or data_str == '' or data_str == 'nan':
        return None
    
    try:
        data_obj = datetime.strptime(str(data_str).strip(), '%d/%m/%Y')
        return data_obj.strftime('%Y-%m-%d')
    except:
        try:
            data_obj = datetime.strptime(str(data_str).strip(), '%d/%m/%y')
            return data_obj.strftime('%Y-%m-%d')
        except:
            return None

def normalizar_texto(texto):
    """Normaliza texto para comparação"""
    if pd.isna(texto):
        return ""
    
    texto = str(texto).strip().upper()
    # Remove acentos e caracteres especiais
    texto = re.sub(r'[ÀÁÂÃÄÅ]', 'A', texto)
    texto = re.sub(r'[ÈÉÊË]', 'E', texto)
    texto = re.sub(r'[ÌÍÎÏ]', 'I', texto)
    texto = re.sub(r'[ÒÓÔÕÖ]', 'O', texto)
    texto = re.sub(r'[ÙÚÛÜ]', 'U', texto)
    texto = re.sub(r'[Ç]', 'C', texto)
    texto = re.sub(r'[^\w\s]', ' ', texto)
    texto = re.sub(r'\s+', ' ', texto)
    return texto.strip()

def processar_arquivo(caminho, nome_arquivo):
    """Processa arquivo CSV normalizando colunas e valores"""
    print(f"📂 Processando {nome_arquivo}...")
    
    try:
        df = pd.read_csv(caminho, sep=';', encoding='utf-8')
        print(f"   ✅ {len(df)} registros carregados")
        
        # Normalizar colunas baseado no arquivo
        if 'antigo' in nome_arquivo:
            # Arquivo antigo: ordem diferente
            df = df.rename(columns={
                'Data agendada': 'data_esperada',
                'Data realizada': 'data_realizada', 
                'Plano de Conta': 'plano_conta',
                'Historico': 'historico',
                'Sequencia': 'sequencia',
                'Conta bancaria': 'conta_bancaria',
                'Valor a receber': 'valor_receber',
                'Valor recebido': 'valor_recebido',
                'Valor pago': 'valor_pago',           # 3ª posição
                'Valor a pagar': 'valor_pagar',       # 4ª posição
                'Status': 'status',
                'Cliente/Fornecedor': 'cliente_fornecedor',
                'Meio de pagamento': 'meio_pagamento',
                'Centro de custo': 'centro_custo',
                'Projeto': 'projeto',
                'Data da ultima alteracao': 'data_alteracao',
                'Codigo da conciliacao bancaria': 'codigo_conciliacao'
            })
        else:
            # Arquivo atual
            df = df.rename(columns={
                'Data esperada': 'data_esperada',
                'Data realizada': 'data_realizada',
                'Plano de contas': 'plano_conta', 
                'Histórico': 'historico',
                'Sequência': 'sequencia',
                'Conta bancária': 'conta_bancaria',
                'Valor a receber': 'valor_receber',
                'Valor recebido': 'valor_recebido',
                'Valor a pagar': 'valor_pagar',       # 3ª posição
                'Valor pago': 'valor_pago',           # 4ª posição
                'Status': 'status',
                'Cliente/Fornecedor': 'cliente_fornecedor',
                'Meio de pagamento': 'meio_pagamento',
                'Centro de custo': 'centro_custo',
                'Projeto': 'projeto',
                'Data da última alteração': 'data_alteracao',
                'Código da conciliação bancária': 'codigo_conciliacao'
            })
        
        # Processar valores monetários
        df['valor_receber'] = df['valor_receber'].apply(limpar_valor_brasileiro)
        df['valor_recebido'] = df['valor_recebido'].apply(limpar_valor_brasileiro)
        
        # Corrigir sinais para arquivo antigo
        if 'antigo' in nome_arquivo:
            df['valor_pagar'] = df['valor_pagar'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
            df['valor_pago'] = df['valor_pago'].apply(lambda x: -abs(limpar_valor_brasileiro(x)) if limpar_valor_brasileiro(x) > 0 else 0)
        else:
            df['valor_pagar'] = df['valor_pagar'].apply(limpar_valor_brasileiro)
            df['valor_pago'] = df['valor_pago'].apply(limpar_valor_brasileiro)
        
        # Converter datas
        df['data_esperada'] = df['data_esperada'].apply(converter_data_br)
        df['data_realizada'] = df['data_realizada'].apply(converter_data_br)
        
        # Normalizar textos
        df['historico_norm'] = df['historico'].apply(normalizar_texto)
        df['plano_conta_norm'] = df['plano_conta'].apply(normalizar_texto)
        df['sequencia_norm'] = df['sequencia'].apply(normalizar_texto)
        
        # Filtrar registros válidos
        df_valido = df[
            (df['data_esperada'].notna()) &
            ((df['valor_receber'] != 0) | (df['valor_pagar'] != 0))
        ].copy()
        
        # Adicionar metadados
        df_valido['arquivo_origem'] = nome_arquivo
        df_valido['prioridade'] = 1 if 'antigo' in nome_arquivo else 2  # Maior = prioridade
        
        print(f"   ✅ {len(df_valido)} registros válidos")
        return df_valido
        
    except Exception as e:
        print(f"   ❌ Erro: {e}")
        return pd.DataFrame()

def gerar_chave_duplicata(row):
    """Gera chaves para detecção de duplicatas"""
    
    # Chave 1: Data + Valor + Histórico (mais rigorosa)
    chave1_data = row['data_esperada'] or 'sem_data'
    chave1_valor = abs(row['valor_receber']) + abs(row['valor_pagar'])
    chave1_hist = row['historico_norm'][:50] if row['historico_norm'] else 'sem_hist'
    chave1 = f"{chave1_data}|{chave1_valor:.2f}|{chave1_hist}"
    
    # Chave 2: Data + Valor + Sequência (alternativa)
    chave2_seq = row['sequencia_norm'][:20] if row['sequencia_norm'] else 'sem_seq'
    chave2 = f"{chave1_data}|{chave1_valor:.2f}|{chave2_seq}"
    
    # Chave 3: Data + Plano + Valor (mais ampla)
    chave3_plano = row['plano_conta_norm'][:30] if row['plano_conta_norm'] else 'sem_plano'
    chave3 = f"{chave1_data}|{chave3_plano}|{chave1_valor:.2f}"
    
    # Hash das chaves para facilitar comparação
    hash1 = hashlib.md5(chave1.encode()).hexdigest()[:12]
    hash2 = hashlib.md5(chave2.encode()).hexdigest()[:12]
    hash3 = hashlib.md5(chave3.encode()).hexdigest()[:12]
    
    return hash1, hash2, hash3, chave1, chave2, chave3

def detectar_e_remover_duplicatas(df_consolidado):
    """Detecta e remove duplicatas priorizando arquivo mais novo"""
    print(f"🔍 Detectando duplicatas em {len(df_consolidado)} registros...")
    
    # Gerar chaves de duplicata
    chaves_resultado = df_consolidado.apply(gerar_chave_duplicata, axis=1, result_type='expand')
    df_consolidado['chave1'] = chaves_resultado[0]
    df_consolidado['chave2'] = chaves_resultado[1] 
    df_consolidado['chave3'] = chaves_resultado[2]
    df_consolidado['desc_chave1'] = chaves_resultado[3]
    df_consolidado['desc_chave2'] = chaves_resultado[4]
    df_consolidado['desc_chave3'] = chaves_resultado[5]
    
    duplicatas_removidas = 0
    registros_mantidos = []
    
    # Agrupar por cada tipo de chave
    for chave_col in ['chave1', 'chave2', 'chave3']:
        print(f"   🔎 Analisando duplicatas por {chave_col}...")
        
        grupos = df_consolidado.groupby(chave_col)
        
        for nome_grupo, grupo in grupos:
            if len(grupo) > 1:
                # Duplicatas encontradas - manter apenas o de maior prioridade
                grupo_ordenado = grupo.sort_values(['prioridade', 'data_alteracao'], ascending=[False, False])
                melhor = grupo_ordenado.iloc[0]
                
                print(f"      🔄 Duplicata em {chave_col}: {len(grupo)} registros -> mantendo 1")
                print(f"         Mantido: {melhor['arquivo_origem']} - {melhor['desc_chave1'][:80]}...")
                
                duplicatas_removidas += len(grupo) - 1
                registros_mantidos.append(melhor)
            else:
                # Registro único
                registros_mantidos.append(grupo.iloc[0])
    
    # Remover duplicatas entre os próprios registros mantidos
    df_final = pd.DataFrame(registros_mantidos).drop_duplicates(subset=['chave1'])
    
    print(f"   ✅ {duplicatas_removidas} duplicatas removidas")
    print(f"   ✅ {len(df_final)} registros únicos mantidos")
    
    return df_final

def main():
    print("🚀 SISTEMA INTELIGENTE DE DEDUPLICAÇÃO YAMPA")
    print("=" * 60)
    
    # Processar arquivos
    df_atual = processar_arquivo(
        f'{PASTA_BASE}/yampa_relatorio.csv',
        'yampa_relatorio'
    )
    
    df_antigo = processar_arquivo(
        f'{PASTA_BASE}/yampa_relatorio_antigo_utf8.csv',
        'yampa_relatorio_antigo'
    )
    
    if df_atual.empty and df_antigo.empty:
        print("❌ Nenhum dado válido encontrado!")
        return
    
    # Consolidar
    df_consolidado = pd.concat([df_atual, df_antigo], ignore_index=True)
    print(f"\n📊 ANTES DA DEDUPLICAÇÃO:")
    print(f"   📈 Arquivo atual: {len(df_atual)} registros")
    print(f"   📈 Arquivo antigo: {len(df_antigo)} registros")
    print(f"   📈 Total bruto: {len(df_consolidado)} registros")
    
    # Remover duplicatas
    df_final = detectar_e_remover_duplicatas(df_consolidado)
    
    # Limpar colunas auxiliares
    colunas_limpar = [col for col in df_final.columns if col.startswith(('chave', 'desc_chave', 'historico_norm', 'plano_conta_norm', 'sequencia_norm'))]
    df_final = df_final.drop(columns=colunas_limpar)
    
    # Ordenar por data
    df_final = df_final.sort_values(['data_esperada', 'prioridade'], ascending=[True, False])
    
    # Estatísticas finais
    total_receber = df_final['valor_receber'].sum()
    total_pagar = df_final['valor_pagar'].sum()
    total_recebido = df_final['valor_recebido'].sum()
    total_pago = df_final['valor_pago'].sum()
    
    print(f"\n📊 RESULTADO FINAL:")
    print(f"   📈 Registros únicos: {len(df_final)}")
    print(f"   📉 Duplicatas removidas: {len(df_consolidado) - len(df_final)}")
    print(f"   📊 Taxa de deduplicação: {((len(df_consolidado) - len(df_final)) / len(df_consolidado) * 100):.1f}%")
    
    print(f"\n💰 RESUMO FINANCEIRO FINAL:")
    print(f"   💚 Valor a receber: R$ {total_receber:,.2f}")
    print(f"   💚 Valor recebido: R$ {total_recebido:,.2f}")
    print(f"   💙 Valor a pagar: R$ {total_pagar:,.2f}")
    print(f"   💙 Valor pago: R$ {total_pago:,.2f}")
    print(f"   📊 Saldo líquido: R$ {(total_receber + total_pagar):,.2f}")
    
    # Salvar resultado
    caminho_final = f'{PASTA_BASE}/yampa_consolidado_deduplicado.csv'
    df_final.to_csv(caminho_final, index=False, sep=';', encoding='utf-8')
    
    print(f"\n✅ DEDUPLICAÇÃO CONCLUÍDA!")
    print(f"📁 Arquivo final: {caminho_final}")
    print(f"🎯 Dados prontos para importação no banco!")

if __name__ == "__main__":
    main()