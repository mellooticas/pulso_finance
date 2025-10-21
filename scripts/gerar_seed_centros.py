#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 2/8: Gerar seed de CENTROS DE CUSTO
Extrai centros únicos do arquivao_final.csv
Gera: data/seeds/centros_custos.csv
"""

import pandas as pd
from pathlib import Path

# Configuração
ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/centros_custos.csv")

def main():
    print("=" * 60)
    print("SCRIPT 2/8: GERAR SEED DE CENTROS DE CUSTO")
    print("=" * 60)
    
    # Criar diretório de seeds se não existir
    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)
    
    # Ler arquivo consolidado
    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")
    
    # Extrair centros únicos
    print("\n🎯 Extraindo centros de custo únicos...")
    centros_unicos = df['centro_custo'].dropna().unique()
    centros_unicos = sorted([centro.strip() for centro in centros_unicos if centro.strip()])
    
    print(f"✅ {len(centros_unicos)} centros encontrados:")
    for centro in centros_unicos[:15]:  # Mostrar primeiros 15
        count = len(df[df['centro_custo'] == centro])
        print(f"   - {centro}: {count:,} registros")
    
    if len(centros_unicos) > 15:
        print(f"   ... mais {len(centros_unicos) - 15} centros")
    
    # Criar DataFrame de centros
    # IMPORTANTE: manter 'codigo' igual ao nome original para facilitar o mapeamento
    centros_df = pd.DataFrame({
        'codigo': centros_unicos,   # mesmo valor do dataset de origem
        'nome': centros_unicos,
        'descricao': [f'Centro de custo {centro}' for centro in centros_unicos],
        'ativo': 'true'
    })
    
    # Salvar CSV
    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    centros_df.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    
    print(f"✅ Arquivo criado com {len(centros_df)} centros")
    print(f"\n📋 Preview (primeiros 10):")
    print(centros_df.head(10).to_string(index=False))
    
    if len(centros_df) > 10:
        print(f"\n... mais {len(centros_df) - 10} centros")
    
    print("\n" + "=" * 60)
    print("✅ SCRIPT 2/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de centros: {len(centros_df)}")
    print("\n🔜 Próximo: python scripts/gerar_seed_plano_contas.py")

if __name__ == "__main__":
    main()
