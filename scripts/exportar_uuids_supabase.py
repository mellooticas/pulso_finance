#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 6/8: Exportar UUIDs do Supabase
Conecta ao Supabase e exporta UUIDs das tabelas master
Gera: data/seeds/mapeamentos.json

EXECUTAR SOMENTE APÓS importar os 5 CSVs anteriores no Supabase!
"""

import json
from pathlib import Path
from supabase import create_client, Client
import os
from dotenv import load_dotenv

# Configuração
ARQUIVO_SAIDA = Path("data/seeds/mapeamentos.json")

# Carregar variáveis de ambiente
load_dotenv()

def conectar_supabase() -> Client:
    """Conecta ao Supabase usando variáveis de ambiente"""
    url = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
    key = os.getenv("NEXT_PUBLIC_SUPABASE_ANON_KEY")
    
    if not url or not key:
        raise ValueError("❌ Variáveis NEXT_PUBLIC_SUPABASE_URL e NEXT_PUBLIC_SUPABASE_ANON_KEY não encontradas no .env")
    
    return create_client(url, key)

def exportar_lojas(supabase: Client) -> dict:
    """Exporta mapeamento codigo → UUID de lojas"""
    print("\n🏪 Exportando lojas...")
    response = supabase.table('lojas').select('id, codigo, nome').execute()
    
    mapa = {}
    for loja in response.data:
        mapa[loja['codigo']] = {
            'uuid': loja['id'],
            'nome': loja['nome']
        }
    
    print(f"   ✅ {len(mapa)} lojas exportadas")
    return mapa

def exportar_centros(supabase: Client) -> dict:
    """Exporta mapeamento codigo → UUID de centros de custo"""
    print("\n🎯 Exportando centros de custo...")
    response = supabase.table('centros_custos').select('id, codigo, nome').execute()
    
    mapa = {}
    for centro in response.data:
        mapa[centro['codigo']] = {
            'uuid': centro['id'],
            'nome': centro['nome']
        }
    
    print(f"   ✅ {len(mapa)} centros exportados")
    return mapa

def exportar_planos(supabase: Client) -> dict:
    """Exporta mapeamento codigo → UUID de plano de contas"""
    print("\n📊 Exportando plano de contas...")
    response = supabase.table('plano_contas').select('id, codigo, nome').execute()
    
    mapa = {}
    for plano in response.data:
        mapa[plano['codigo']] = {
            'uuid': plano['id'],
            'nome': plano['nome']
        }
    
    print(f"   ✅ {len(mapa)} planos exportados")
    return mapa

def exportar_contas(supabase: Client) -> dict:
    """Exporta mapeamento nome → UUID de contas financeiras"""
    print("\n💳 Exportando contas financeiras...")
    response = supabase.table('contas_financeiras').select('id, nome').execute()
    
    mapa = {}
    for conta in response.data:
        mapa[conta['nome']] = {
            'uuid': conta['id']
        }
    
    print(f"   ✅ {len(mapa)} contas exportadas")
    return mapa

def exportar_fornecedores(supabase: Client) -> dict:
    """Exporta mapeamento nome → UUID de fornecedores"""
    print("\n🏢 Exportando fornecedores...")
    response = supabase.table('fornecedores').select('id, nome').execute()
    
    mapa = {}
    for fornecedor in response.data:
        mapa[fornecedor['nome']] = {
            'uuid': fornecedor['id']
        }
    
    print(f"   ✅ {len(mapa)} fornecedores exportados")
    return mapa

def main():
    print("=" * 60)
    print("SCRIPT 6/8: EXPORTAR UUIDS DO SUPABASE")
    print("=" * 60)
    
    # Criar diretório de seeds se não existir
    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)
    
    try:
        # Conectar ao Supabase
        print("\n🔌 Conectando ao Supabase...")
        supabase = conectar_supabase()
        print("   ✅ Conectado com sucesso")
        
        # Exportar todas as tabelas master
        mapeamentos = {
            'lojas': exportar_lojas(supabase),
            'centros_custos': exportar_centros(supabase),
            'plano_contas': exportar_planos(supabase),
            'contas_financeiras': exportar_contas(supabase),
            'fornecedores': exportar_fornecedores(supabase),
            'metadata': {
                'versao': '1.0',
                'data_exportacao': pd.Timestamp.now().isoformat()
            }
        }
        
        # Salvar JSON
        print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
        with open(ARQUIVO_SAIDA, 'w', encoding='utf-8') as f:
            json.dump(mapeamentos, f, indent=2, ensure_ascii=False)
        
        print(f"✅ Arquivo criado com sucesso")
        
        # Estatísticas
        print("\n📈 Estatísticas:")
        print(f"   - Lojas: {len(mapeamentos['lojas'])}")
        print(f"   - Centros de custo: {len(mapeamentos['centros_custos'])}")
        print(f"   - Planos de contas: {len(mapeamentos['plano_contas'])}")
        print(f"   - Contas financeiras: {len(mapeamentos['contas_financeiras'])}")
        print(f"   - Fornecedores: {len(mapeamentos['fornecedores'])}")
        
        print("\n" + "=" * 60)
        print("✅ SCRIPT 6/8 CONCLUÍDO")
        print("=" * 60)
        print(f"\n📁 Arquivo gerado: {ARQUIVO_SAIDA}")
        print("\n🔜 Próximo: python scripts/gerar_seed_lancamentos_parcelas.py")
        
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        print("\n⚠️  Certifique-se de que:")
        print("   1. As tabelas master foram importadas no Supabase")
        print("   2. O arquivo .env existe com NEXT_PUBLIC_SUPABASE_URL e NEXT_PUBLIC_SUPABASE_ANON_KEY")
        print("   3. As credenciais estão corretas")
        return 1

if __name__ == "__main__":
    import pandas as pd  # Importar aqui para metadata
    exit(main())
