#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 1/8: Gerar seed de LOJAS
Extrai lojas únicas do campo centro_custo do arquivao_final.csv
Gera: data/seeds/lojas.csv
"""

import pandas as pd
from pathlib import Path

# Configuração
ARQUIVO_ENTRADA = Path("data/base/arquivao_final.csv")
ARQUIVO_SAIDA = Path("data/seeds/lojas.csv")

def extrair_loja(centro_custo):
    """Extrai código da loja do centro de custo"""
    if not centro_custo or pd.isna(centro_custo):
        return None
    
    centro = str(centro_custo).upper().strip()
    
    # Padrões conhecidos: "Loja Suzano", "Escritório", "Escola", etc.
    if 'SUZANO' in centro:
        return 'SUZ'
    elif 'MAUÁ' in centro or 'MAUA' in centro:
        return 'MAU'
    elif 'RIO' in centro:
        return 'RIO'
    elif 'SANTO' in centro or 'SMT' in centro:
        return 'SMT'
    elif 'ESCOLA' in centro or 'ESC' in centro:
        return 'ESC'
    elif 'PERDIZ' in centro or 'PER' in centro:
        return 'PER'
    elif 'ESCRITÓRIO' in centro or 'ESCRITORIO' in centro:
        return 'SU2'  # Suzano 2 / Escritório
    
    return None

def main():
    print("=" * 60)
    print("SCRIPT 1/8: GERAR SEED DE LOJAS")
    print("=" * 60)
    
    # Criar diretório de seeds se não existir
    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)
    
    # Ler arquivo consolidado
    print(f"\n📂 Lendo {ARQUIVO_ENTRADA}...")
    df = pd.read_csv(ARQUIVO_ENTRADA, dtype=str, sep=';')
    print(f"✅ {len(df):,} registros carregados")
    
    # Extrair lojas únicas do centro_custo
    print("\n🏪 Extraindo lojas únicas do campo 'centro_custo'...")
    df['loja_codigo'] = df['centro_custo'].apply(extrair_loja)
    
    lojas_unicas = df['loja_codigo'].dropna().unique()
    lojas_unicas = sorted(lojas_unicas)
    
    print(f"✅ {len(lojas_unicas)} lojas encontradas:")
    for loja in lojas_unicas:
        count = len(df[df['loja_codigo'] == loja])
        print(f"   - {loja}: {count:,} registros")
    
    # Mapear nomes completos das lojas
    mapa_lojas = {
        'SUZ': 'Suzano',
        'SU2': 'Suzano 2 / Escritório',
        'MAU': 'Mauá',
        'RIO': 'Rio Claro',
        'SMT': 'Santo André',
        'ESC': 'Escola',
        'PER': 'Perdizes'
    }
    
    # Criar DataFrame de lojas
    lojas_df = pd.DataFrame({
        'codigo': lojas_unicas,
        'nome': [mapa_lojas.get(codigo, codigo) for codigo in lojas_unicas],
        'ativo': 'true'
    })
    
    # Salvar CSV
    print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
    lojas_df.to_csv(ARQUIVO_SAIDA, index=False, encoding='utf-8')
    
    print(f"✅ Arquivo criado com {len(lojas_df)} lojas")
    print(f"\n📋 Preview:")
    print(lojas_df.to_string(index=False))
    
    print("\n" + "=" * 60)
    print("✅ SCRIPT 1/8 CONCLUÍDO")
    print("=" * 60)
    print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
    print(f"📊 Total de lojas: {len(lojas_df)}")
    print("\n🔜 Próximo: python scripts/gerar_seed_centros.py")

if __name__ == "__main__":
    main()
