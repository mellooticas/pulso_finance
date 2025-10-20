"""
🔥 REDISTRIBUIR CENTROS DE CUSTO
=================================
Este script lê o CSV original do Yampa e redistribui os lançamentos
para os centros de custo corretos no Supabase.

Execução:
    cd /d/projetos/pulso_finance
    python scripts/redistribuir_centros_custo.py
"""

import os
import sys
import pandas as pd
from supabase import create_client, Client
from dotenv import load_dotenv
from datetime import datetime
import re

# Carregar variáveis de ambiente
load_dotenv()

# Configurar Supabase
SUPABASE_URL = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_SERVICE_ROLE_KEY")

if not SUPABASE_URL or not SUPABASE_KEY:
    print("❌ ERRO: Variáveis de ambiente não configuradas!")
    print("Configure NEXT_PUBLIC_SUPABASE_URL e SUPABASE_SERVICE_ROLE_KEY no .env")
    sys.exit(1)

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# Caminhos
CSV_PATH = "data/base/yampa_relatorio.csv"

# Mapeamento de centros de custo (nome no CSV -> código no banco)
CENTRO_MAP = {
    "Escritório": "CC001",
    "Loja Suzano": "CC002",
    "Loja Mauá": "CC003",
    "Loja Rio Pequeno": "CC004",
    "Loja Suzano II": "CC005",
    "Loja São Mateus": "CC006",
    "Loja Perus": "CC007",
    "Taty Mello Festas": "CC008",
    "Clínica": "CC009",
    "Pessoal": "CC010",
    "": "CC999",  # Vazio -> Sem Centro de Custo
}

def normalizar_nome(nome):
    """Normaliza nome para comparação (remove acentos, espaços, etc)"""
    if pd.isna(nome) or nome == "":
        return ""
    nome = str(nome).strip().lower()
    # Remover acentos
    nome = nome.replace('á', 'a').replace('é', 'e').replace('í', 'i')
    nome = nome.replace('ó', 'o').replace('ú', 'u').replace('ã', 'a')
    nome = nome.replace('õ', 'o').replace('ç', 'c')
    return nome

def buscar_centros_custo():
    """Busca todos os centros de custo do banco"""
    print("\n📋 Buscando centros de custo do banco...")
    response = supabase.table("centros_custo").select("id, codigo, nome").execute()
    
    centros = {}
    for c in response.data:
        centros[c['codigo']] = {
            'id': c['id'],
            'nome': c['nome']
        }
    
    print(f"✅ Encontrados {len(centros)} centros de custo")
    return centros

def buscar_lojas():
    """Busca todas as lojas do banco"""
    print("\n📋 Buscando lojas do banco...")
    response = supabase.table("lojas").select("id, codigo, nome").execute()
    
    lojas = {}
    for l in response.data:
        lojas[l['codigo']] = {
            'id': l['id'],
            'nome': l['nome']
        }
    
    print(f"✅ Encontradas {len(lojas)} lojas")
    return lojas

def ler_csv_yampa():
    """Lê o CSV original do Yampa"""
    print(f"\n📂 Lendo CSV original: {CSV_PATH}")
    
    if not os.path.exists(CSV_PATH):
        print(f"❌ ERRO: Arquivo não encontrado: {CSV_PATH}")
        sys.exit(1)
    
    # Ler CSV com encoding correto (UTF-8 com BOM)
    df = pd.read_csv(CSV_PATH, sep=';', encoding='utf-8-sig')
    
    print(f"✅ Lidos {len(df)} registros do CSV")
    print(f"📊 Colunas: {list(df.columns)}")
    
    return df

def mapear_lancamentos_centros(df, centros):
    """Mapeia cada linha do CSV ao centro de custo correto"""
    print("\n🔄 Mapeando lançamentos aos centros de custo...")
    
    # Coluna 14 é "Centro de custo" (índice 13)
    col_centro = df.columns[13]  # 0-indexed
    print(f"📌 Coluna de centro de custo: '{col_centro}'")
    
    # Contar distribuição
    distribuicao = df[col_centro].fillna("").value_counts()
    print(f"\n📊 Distribuição no CSV original:")
    for centro, count in distribuicao.items():
        codigo = CENTRO_MAP.get(centro, "???")
        print(f"   {centro or '(vazio)'}: {count} registros → {codigo}")
    
    # Criar mapeamento: (data, valor, historico) -> centro_codigo
    mapeamento = {}
    erros = 0
    
    for idx, row in df.iterrows():
        # Identificadores únicos do lançamento
        data_str = str(row['Data']).strip() if 'Data' in row else ""
        valor = float(row['Valor']) if 'Valor' in row and pd.notna(row['Valor']) else 0.0
        historico = normalizar_nome(row['Histórico'] if 'Histórico' in row else "")
        
        # Centro de custo original
        centro_nome = str(row[col_centro]).strip() if pd.notna(row[col_centro]) else ""
        centro_codigo = CENTRO_MAP.get(centro_nome, None)
        
        if centro_codigo and centro_codigo in centros:
            # Usar tupla como chave (data, valor abs, primeiras 50 chars do histórico)
            chave = (data_str, abs(valor), historico[:50])
            mapeamento[chave] = {
                'centro_codigo': centro_codigo,
                'centro_id': centros[centro_codigo]['id'],
                'centro_nome': centros[centro_codigo]['nome']
            }
        else:
            erros += 1
    
    print(f"✅ Mapeados {len(mapeamento)} lançamentos únicos")
    if erros > 0:
        print(f"⚠️  {erros} lançamentos sem centro válido (serão marcados como CC999)")
    
    return mapeamento

def atualizar_lancamentos(mapeamento, centros):
    """Atualiza os lançamentos no Supabase com os centros de custo corretos"""
    print("\n🚀 Atualizando lançamentos no Supabase...")
    
    # Buscar todos os lançamentos
    print("📥 Buscando lançamentos do banco...")
    response = supabase.table("lancamentos").select(
        "id, competencia, valor_total, historico, centro_custo_id"
    ).execute()
    
    lancamentos = response.data
    print(f"✅ Encontrados {len(lancamentos)} lançamentos no banco")
    
    # Contar quantos já têm centro
    com_centro = sum(1 for l in lancamentos if l.get('centro_custo_id'))
    sem_centro = len(lancamentos) - com_centro
    print(f"   Com centro: {com_centro}")
    print(f"   Sem centro: {sem_centro}")
    
    # Atualizar lançamentos
    atualizados = 0
    nao_encontrados = 0
    erros_update = 0
    
    # ID do centro padrão (CC999 - Sem Centro de Custo)
    centro_padrao_id = centros.get('CC999', {}).get('id')
    
    for i, lanc in enumerate(lancamentos, 1):
        if i % 1000 == 0:
            print(f"   Processando {i}/{len(lancamentos)}...")
        
        # Se já tem centro, pular
        if lanc.get('centro_custo_id'):
            continue
        
        # Tentar encontrar no mapeamento
        data_str = str(lanc.get('competencia', '')).split('T')[0]  # Apenas data
        valor = abs(float(lanc.get('valor_total', 0)))
        historico = normalizar_nome(lanc.get('historico', ''))
        
        chave = (data_str, valor, historico[:50])
        
        # Buscar no mapeamento
        centro_info = mapeamento.get(chave)
        
        if centro_info:
            centro_id = centro_info['centro_id']
        elif centro_padrao_id:
            centro_id = centro_padrao_id
            nao_encontrados += 1
        else:
            erros_update += 1
            continue
        
        # Atualizar no banco
        try:
            supabase.table("lancamentos").update({
                "centro_custo_id": centro_id
            }).eq("id", lanc['id']).execute()
            atualizados += 1
        except Exception as e:
            print(f"❌ Erro ao atualizar lançamento {lanc['id']}: {e}")
            erros_update += 1
    
    print(f"\n✅ CONCLUÍDO!")
    print(f"   ✅ Atualizados: {atualizados}")
    print(f"   ⚠️  Não encontrados (usando CC999): {nao_encontrados}")
    print(f"   ❌ Erros: {erros_update}")
    
    return atualizados

def validar_redistribuicao():
    """Valida a redistribuição dos lançamentos"""
    print("\n🔍 VALIDANDO REDISTRIBUIÇÃO...")
    
    # Contar lançamentos por centro
    response = supabase.table("lancamentos").select(
        "centro_custo_id, centros_custo(codigo, nome)"
    ).execute()
    
    distribuicao = {}
    sem_centro = 0
    
    for lanc in response.data:
        if lanc.get('centro_custo_id') and lanc.get('centros_custo'):
            centro = lanc['centros_custo']
            codigo = centro.get('codigo', 'UNKNOWN')
            nome = centro.get('nome', 'UNKNOWN')
            key = f"{codigo} - {nome}"
            distribuicao[key] = distribuicao.get(key, 0) + 1
        else:
            sem_centro += 1
    
    print(f"\n📊 Distribuição Final:")
    for centro, count in sorted(distribuicao.items()):
        print(f"   {centro}: {count:,} lançamentos")
    
    if sem_centro > 0:
        print(f"\n⚠️  Ainda há {sem_centro} lançamentos sem centro!")
    else:
        print(f"\n✅ Todos os lançamentos têm centro de custo!")

def main():
    print("=" * 70)
    print("🔥 REDISTRIBUIÇÃO DE CENTROS DE CUSTO")
    print("=" * 70)
    
    # 1. Buscar dados do banco
    centros = buscar_centros_custo()
    lojas = buscar_lojas()
    
    # Verificar se os centros foram criados
    if 'CC001' not in centros:
        print("\n❌ ERRO: Centros de custo não encontrados!")
        print("Execute primeiro: CRIAR_CENTROS_CUSTO.sql")
        sys.exit(1)
    
    # 2. Ler CSV original
    df = ler_csv_yampa()
    
    # 3. Mapear lançamentos aos centros
    mapeamento = mapear_lancamentos_centros(df, centros)
    
    # 4. Confirmar execução
    print("\n" + "=" * 70)
    print("⚠️  ATENÇÃO: Isso vai atualizar os centros de custo dos lançamentos!")
    print("=" * 70)
    resposta = input("\n🤔 Confirma execução? (SIM/não): ").strip().upper()
    
    if resposta != "SIM":
        print("❌ Operação cancelada pelo usuário")
        sys.exit(0)
    
    # 5. Atualizar lançamentos
    atualizar_lancamentos(mapeamento, centros)
    
    # 6. Validar resultado
    validar_redistribuicao()
    
    print("\n" + "=" * 70)
    print("🎉 REDISTRIBUIÇÃO CONCLUÍDA COM SUCESSO!")
    print("=" * 70)
    print("\n🚀 PRÓXIMOS PASSOS:")
    print("   1. Execute: node frontend/debug-centros-custo.js")
    print("   2. Teste os filtros no frontend (npm run dev)")
    print("   3. Valide o DRE com filtros de loja e centro de custo")

if __name__ == "__main__":
    main()
