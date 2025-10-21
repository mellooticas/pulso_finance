#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 7/8: Gerar seed de LANÇAMENTOS e PARCELAS
Agrupa por sequencia, mapeia UUIDs e gera CSVs relacionados
Gera: data/seeds/lancamentos.csv e data/seeds/parcelas.csv

EXECUTAR SOMENTE APÓS exportar_uuids_supabase.py!
"""

import pandas as pd
import json
from pathlib import Path
from datetime import datetime
import re

# Configuração
ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_MAPEAMENTOS = Path("data/seeds/mapeamentos.json")
ARQUIVO_LANCAMENTOS = Path("data/seeds/lancamentos.csv")
ARQUIVO_PARCELAS = Path("data/seeds/parcelas.csv")

def carregar_mapeamentos():
    """Carrega arquivo de mapeamentos JSON"""
    print(f"\n📂 Carregando {ARQUIVO_MAPEAMENTOS}...")
    
    if not ARQUIVO_MAPEAMENTOS.exists():
        raise FileNotFoundError(
            f"❌ Arquivo {ARQUIVO_MAPEAMENTOS} não encontrado!\n"
            "   Execute primeiro: python scripts/exportar_uuids_supabase.py"
        )
    
    with open(ARQUIVO_MAPEAMENTOS, 'r', encoding='utf-8') as f:
        mapa = json.load(f)
    
    print(f"   ✅ Mapeamentos carregados")
    print(f"      - Lojas: {len(mapa['lojas'])}")
    print(f"      - Planos: {len(mapa['plano_contas'])}")
    print(f"      - Centros: {len(mapa['centros_custos'])}")
    
    return mapa

def mapear_uuid(valor, tipo, mapeamentos):
    """Mapeia valor para UUID usando mapeamentos"""
    if not valor or pd.isna(valor):
        return None
    
    valor_str = str(valor).strip()
    
    if valor_str in mapeamentos[tipo]:
        return mapeamentos[tipo][valor_str]['uuid']
    
    return None

def extrair_numero_sequencia(sequencia):
    """
    Extrai número da parcela e total de parcelas
    Exemplos: '1 de 3' → (1, 3), '2/5' → (2, 5), 'parcela única' → (1, 1)
    """
    if not sequencia or pd.isna(sequencia):
        return (1, 1)
    
    seq_str = str(sequencia).strip().lower()
    
    # Padrão: "X de Y" ou "X/Y"
    match = re.search(r'(\d+)\s*(?:de|/)\s*(\d+)', seq_str)
    if match:
        return (int(match.group(1)), int(match.group(2)))
    
    # Parcela única
    return (1, 1)

def agrupar_por_lancamento(df, mapeamentos):
    """
    Agrupa registros por lançamento baseado em sequencia
    Retorna lista de lançamentos com suas parcelas
    """
    print("\n🔍 Agrupando registros por lançamento...")
    
    lancamentos = []
    parcelas_todas = []
    
    # Mapear UUIDs antes de processar
    df['loja_uuid'] = df['loja'].apply(lambda x: mapear_uuid(x, 'lojas', mapeamentos))
    df['plano_uuid'] = df['plano_conta'].apply(lambda x: mapear_uuid(x, 'plano_contas', mapeamentos))
    df['centro_uuid'] = df['centro_custo'].apply(lambda x: mapear_uuid(x, 'centros_custos', mapeamentos))
    
    # Extrair informações de sequência
    df['parcela_num'], df['parcela_total'] = zip(*df['sequencia'].apply(extrair_numero_sequencia))
    
    # Agrupar por características comuns (sequencia, data, plano, historico)
    # Registros com mesma sequencia "X de Y" são do mesmo lançamento
    grupos = df.groupby(['sequencia', 'historico', 'loja', 'plano_conta', 'tipo'])
    
    lancamento_id = 1
    
    for nome_grupo, grupo in grupos:
        # Dados do lançamento (primeira linha do grupo)
        primeira = grupo.iloc[0]
        
        # Criar lançamento
        lancamento = {
            'id': f'LANC-{lancamento_id:06d}',
            'loja_id': primeira['loja_uuid'],
            'plano_conta_id': primeira['plano_uuid'],
            'centro_custo_id': primeira['centro_uuid'],
            'tipo': primeira['tipo'],
            'descricao': primeira['historico'],
            'valor_total': grupo['valor'].astype(float).sum(),
            'data_lancamento': primeira['data_esperada'],
            'num_parcelas': len(grupo),
            'observacoes': f"Importado de {primeira['sequencia']}"
        }
        
        lancamentos.append(lancamento)
        
        # Criar parcelas
        for idx, row in grupo.iterrows():
            parcela = {
                'lancamento_id': lancamento['id'],
                'numero': row['parcela_num'],
                'valor': row['valor'],
                'vencimento': row['data_esperada'],
                'status': row['tipo'],  # 'pago' ou 'pagar'
                'data_pagamento': row['data_realizada'] if row['tipo'] == 'pago' else None
            }
            
            parcelas_todas.append(parcela)
        
        lancamento_id += 1
    
    print(f"   ✅ {len(lancamentos)} lançamentos criados")
    print(f"   ✅ {len(parcelas_todas)} parcelas criadas")
    
    return pd.DataFrame(lancamentos), pd.DataFrame(parcelas_todas)

def main():
    print("=" * 60)
    print("SCRIPT 7/8: GERAR SEED DE LANÇAMENTOS E PARCELAS")
    print("=" * 60)
    
    # Criar diretório de seeds se não existir
    ARQUIVO_LANCAMENTOS.parent.mkdir(parents=True, exist_ok=True)
    
    try:
        # Carregar mapeamentos
        mapeamentos = carregar_mapeamentos()
        
        # Ler arquivo consolidado
        print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
        df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
        print(f"✅ {len(df):,} registros carregados")
        
        # Agrupar em lançamentos e parcelas
        lancamentos_df, parcelas_df = agrupar_por_lancamento(df, mapeamentos)
        
        # Salvar CSVs
        print(f"\n💾 Salvando {ARQUIVO_LANCAMENTOS}...")
        lancamentos_df.to_csv(ARQUIVO_LANCAMENTOS, index=False, encoding='utf-8')
        print(f"   ✅ {len(lancamentos_df)} lançamentos salvos")
        
        print(f"\n💾 Salvando {ARQUIVO_PARCELAS}...")
        parcelas_df.to_csv(ARQUIVO_PARCELAS, index=False, encoding='utf-8')
        print(f"   ✅ {len(parcelas_df)} parcelas salvas")
        
        # Estatísticas
        print("\n📈 Estatísticas:")
        print(f"   - Total de lançamentos: {len(lancamentos_df)}")
        print(f"   - Total de parcelas: {len(parcelas_df)}")
        print(f"   - Média de parcelas por lançamento: {len(parcelas_df) / len(lancamentos_df):.2f}")
        print(f"   - Lançamentos com múltiplas parcelas: {len(lancamentos_df[lancamentos_df['num_parcelas'] > 1])}")
        
        # Preview
        print(f"\n📋 Preview lançamentos (primeiros 5):")
        print(lancamentos_df.head().to_string(index=False))
        
        print(f"\n📋 Preview parcelas (primeiros 10):")
        print(parcelas_df.head(10).to_string(index=False))
        
        print("\n" + "=" * 60)
        print("✅ SCRIPT 7/8 CONCLUÍDO")
        print("=" * 60)
        print(f"\n📁 Arquivos gerados:")
        print(f"   - {ARQUIVO_LANCAMENTOS}")
        print(f"   - {ARQUIVO_PARCELAS}")
        print("\n🔜 Próximo: Importar CSVs no Supabase, depois executar validar_importacao.py")
        
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        return 1

if __name__ == "__main__":
    exit(main())
