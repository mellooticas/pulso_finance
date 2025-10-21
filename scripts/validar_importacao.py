#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script 8/8: Validar Importação
Conecta ao Supabase e executa queries de validação
Gera: data/seeds/relatorio_validacao.txt

EXECUTAR SOMENTE APÓS importar TODOS os CSVs no Supabase!
"""

from pathlib import Path
from supabase import create_client, Client
import os
from dotenv import load_dotenv
from datetime import datetime

# Configuração
ARQUIVO_SAIDA = Path("data/seeds/relatorio_validacao.txt")

# Carregar variáveis de ambiente
load_dotenv()

def conectar_supabase() -> Client:
    """Conecta ao Supabase usando variáveis de ambiente"""
    url = os.getenv("NEXT_PUBLIC_SUPABASE_URL")
    key = os.getenv("NEXT_PUBLIC_SUPABASE_ANON_KEY")
    
    if not url or not key:
        raise ValueError("❌ Variáveis NEXT_PUBLIC_SUPABASE_URL e NEXT_PUBLIC_SUPABASE_ANON_KEY não encontradas no .env")
    
    return create_client(url, key)

def validar_contagens(supabase: Client, relatorio):
    """Valida contagem de registros em cada tabela"""
    print("\n📊 Validando contagens...")
    relatorio.append("=" * 60)
    relatorio.append("VALIDAÇÃO DE CONTAGENS")
    relatorio.append("=" * 60)
    
    tabelas = ['lojas', 'centros_custos', 'plano_contas', 'contas_financeiras', 'fornecedores', 'lancamentos', 'parcelas']
    
    for tabela in tabelas:
        try:
            response = supabase.table(tabela).select('id', count='exact').execute()
            count = response.count
            print(f"   ✅ {tabela}: {count:,} registros")
            relatorio.append(f"{tabela}: {count:,} registros")
        except Exception as e:
            print(f"   ❌ {tabela}: Erro - {e}")
            relatorio.append(f"{tabela}: ERRO - {e}")
    
    relatorio.append("")

def validar_integridade_referencial(supabase: Client, relatorio):
    """Valida integridade referencial (foreign keys)"""
    print("\n🔗 Validando integridade referencial...")
    relatorio.append("=" * 60)
    relatorio.append("INTEGRIDADE REFERENCIAL")
    relatorio.append("=" * 60)
    
    # Lançamentos com loja inválida
    try:
        response = supabase.rpc('validar_lancamentos_loja_invalida').execute()
        invalidos = len(response.data) if response.data else 0
        status = "✅" if invalidos == 0 else "❌"
        print(f"   {status} Lançamentos com loja inválida: {invalidos}")
        relatorio.append(f"Lançamentos com loja inválida: {invalidos}")
    except:
        print("   ⚠️  RPC validar_lancamentos_loja_invalida não encontrado (criar manualmente)")
        relatorio.append("Lançamentos com loja inválida: [RPC não encontrado]")
    
    # Parcelas órfãs (sem lançamento)
    try:
        response = supabase.rpc('validar_parcelas_orfas').execute()
        orfas = len(response.data) if response.data else 0
        status = "✅" if orfas == 0 else "❌"
        print(f"   {status} Parcelas órfãs: {orfas}")
        relatorio.append(f"Parcelas órfãs: {orfas}")
    except:
        print("   ⚠️  RPC validar_parcelas_orfas não encontrado (criar manualmente)")
        relatorio.append("Parcelas órfãs: [RPC não encontrado]")
    
    relatorio.append("")

def validar_valores(supabase: Client, relatorio):
    """Valida somas e valores financeiros"""
    print("\n💰 Validando valores financeiros...")
    relatorio.append("=" * 60)
    relatorio.append("VALIDAÇÃO DE VALORES")
    relatorio.append("=" * 60)
    
    # Soma total de lançamentos
    try:
        response = supabase.rpc('soma_total_lancamentos').execute()
        total = response.data[0]['total'] if response.data else 0
        print(f"   ✅ Soma total lançamentos: R$ {total:,.2f}")
        relatorio.append(f"Soma total lançamentos: R$ {total:,.2f}")
    except Exception as e:
        print(f"   ⚠️  Erro ao calcular soma: {e}")
        relatorio.append(f"Soma total lançamentos: [Erro - {e}]")
    
    # Soma total de parcelas
    try:
        response = supabase.rpc('soma_total_parcelas').execute()
        total = response.data[0]['total'] if response.data else 0
        print(f"   ✅ Soma total parcelas: R$ {total:,.2f}")
        relatorio.append(f"Soma total parcelas: R$ {total:,.2f}")
    except Exception as e:
        print(f"   ⚠️  Erro ao calcular soma: {e}")
        relatorio.append(f"Soma total parcelas: [Erro - {e}]")
    
    relatorio.append("")

def validar_datas(supabase: Client, relatorio):
    """Valida datas (range, consistência)"""
    print("\n📅 Validando datas...")
    relatorio.append("=" * 60)
    relatorio.append("VALIDAÇÃO DE DATAS")
    relatorio.append("=" * 60)
    
    # Range de datas de lançamentos
    try:
        response = supabase.rpc('range_datas_lancamentos').execute()
        if response.data:
            data_min = response.data[0].get('data_min')
            data_max = response.data[0].get('data_max')
            print(f"   ✅ Range lançamentos: {data_min} a {data_max}")
            relatorio.append(f"Range lançamentos: {data_min} a {data_max}")
    except Exception as e:
        print(f"   ⚠️  Erro ao buscar range: {e}")
        relatorio.append(f"Range lançamentos: [Erro - {e}]")
    
    # Range de datas de parcelas
    try:
        response = supabase.rpc('range_datas_parcelas').execute()
        if response.data:
            data_min = response.data[0].get('data_min')
            data_max = response.data[0].get('data_max')
            print(f"   ✅ Range parcelas: {data_min} a {data_max}")
            relatorio.append(f"Range parcelas: {data_min} a {data_max}")
    except Exception as e:
        print(f"   ⚠️  Erro ao buscar range: {e}")
        relatorio.append(f"Range parcelas: [Erro - {e}]")
    
    relatorio.append("")

def main():
    print("=" * 60)
    print("SCRIPT 8/8: VALIDAR IMPORTAÇÃO")
    print("=" * 60)
    
    # Criar diretório de seeds se não existir
    ARQUIVO_SAIDA.parent.mkdir(parents=True, exist_ok=True)
    
    relatorio = []
    relatorio.append("=" * 60)
    relatorio.append("RELATÓRIO DE VALIDAÇÃO DE IMPORTAÇÃO")
    relatorio.append(f"Data: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    relatorio.append("=" * 60)
    relatorio.append("")
    
    try:
        # Conectar ao Supabase
        print("\n🔌 Conectando ao Supabase...")
        supabase = conectar_supabase()
        print("   ✅ Conectado com sucesso")
        
        # Executar validações
        validar_contagens(supabase, relatorio)
        validar_integridade_referencial(supabase, relatorio)
        validar_valores(supabase, relatorio)
        validar_datas(supabase, relatorio)
        
        # Salvar relatório
        print(f"\n💾 Salvando {ARQUIVO_SAIDA}...")
        with open(ARQUIVO_SAIDA, 'w', encoding='utf-8') as f:
            f.write('\n'.join(relatorio))
        
        print(f"✅ Relatório salvo com sucesso")
        
        print("\n" + "=" * 60)
        print("✅ SCRIPT 8/8 CONCLUÍDO")
        print("=" * 60)
        print(f"\n📁 Relatório gerado: {ARQUIVO_SAIDA}")
        print("\n🎉 PROCESSO DE POVOAMENTO COMPLETO!")
        print("\n📋 Próximos passos:")
        print("   1. Revisar relatório de validação")
        print("   2. Corrigir inconsistências se houver")
        print("   3. Executar queries SQL adicionais conforme necessário")
        print("   4. Configurar RLS policies no Supabase")
        print("   5. Testar frontend com dados reais")
        
    except Exception as e:
        print(f"\n❌ Erro: {e}")
        relatorio.append("")
        relatorio.append("=" * 60)
        relatorio.append(f"ERRO DURANTE VALIDAÇÃO: {e}")
        relatorio.append("=" * 60)
        
        with open(ARQUIVO_SAIDA, 'w', encoding='utf-8') as f:
            f.write('\n'.join(relatorio))
        
        return 1

if __name__ == "__main__":
    exit(main())
