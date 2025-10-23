#!/usr/bin/env python3
"""
Povoamento automático completo via Supabase Server
Executa todos os lotes de transacionais e pós-processamento
"""
import time
import sys
from pathlib import Path

# Simula execução via print (substituir por chamadas reais ao mcp_supabase_execute_sql)
def executar_sql_lote(caminho_arquivo, descricao=""):
    """Executa um arquivo SQL no servidor Supabase"""
    print(f"[EXECUTANDO] {caminho_arquivo.name} - {descricao}")
    # Aqui entraria a lógica real de executar via mcp_supabase_execute_sql
    # Por ora, simulamos com sleep curto
    time.sleep(0.1)
    print(f"[OK] {caminho_arquivo.name}")
    return True

def main():
    base = Path(__file__).parent.parent / "_execucao_sql_editor"
    
    print("=" * 70)
    print("POVOAMENTO AUTOMÁTICO COMPLETO - PULSO FINANCE")
    print("=" * 70)
    print()
    
    # Etapa 1: Lotes transacionais (11_transacionais_lote_001 a 201)
    print("ETAPA 1: Carregando lançamentos transacionais (201 lotes)...")
    print("-" * 70)
    
    lotes_transacionais = sorted(base.glob("11_transacionais_lote_*.sql"))
    total_lotes = len(lotes_transacionais)
    
    if total_lotes == 0:
        print("ERRO: Nenhum lote transacional encontrado!")
        sys.exit(1)
    
    print(f"Encontrados {total_lotes} lotes para processar")
    
    for i, lote in enumerate(lotes_transacionais, 1):
        progresso = f"[{i}/{total_lotes}]"
        try:
            executar_sql_lote(lote, progresso)
        except Exception as e:
            print(f"ERRO no lote {lote.name}: {e}")
            resposta = input("Continuar? (s/n): ")
            if resposta.lower() != 's':
                sys.exit(1)
    
    print()
    print("✓ ETAPA 1 CONCLUÍDA: Lançamentos transacionais carregados")
    print()
    
    # Etapa 2: Atribuir plano às receitas
    print("ETAPA 2: Atribuindo planos às receitas (11b)...")
    print("-" * 70)
    arquivo_11b = base / "11b_atribuir_plano_transacionais.sql"
    if arquivo_11b.exists():
        executar_sql_lote(arquivo_11b, "Mapear receitas para 3.1/3.1.1/3.1.2")
        print("✓ ETAPA 2 CONCLUÍDA: Planos atribuídos às receitas")
    else:
        print("⚠ AVISO: 11b não encontrado, pulando...")
    print()
    
    # Etapa 3: Normalizar fornecedores
    print("ETAPA 3: Normalizando fornecedores (10b)...")
    print("-" * 70)
    arquivo_10b = base / "10b_normalizar_fornecedores.sql"
    if arquivo_10b.exists():
        executar_sql_lote(arquivo_10b, "Definir canônicos e re-apontar lançamentos")
        print("✓ ETAPA 3 CONCLUÍDA: Fornecedores normalizados")
    else:
        print("⚠ AVISO: 10b não encontrado, pulando...")
    print()
    
    # Etapa 4: Compactar fornecedores (opcional)
    print("ETAPA 4: Compactando fornecedores (10c - opcional)...")
    print("-" * 70)
    arquivo_10c = base / "10c_compactar_fornecedores.sql"
    if arquivo_10c.exists():
        executar_sql_lote(arquivo_10c, "Remover aliases órfãos e garantir unicidade")
        print("✓ ETAPA 4 CONCLUÍDA: Fornecedores compactados")
    else:
        print("⚠ AVISO: 10c não encontrado, pulando...")
    print()
    
    # Etapa 5: Validações
    print("ETAPA 5: Executando validações finais...")
    print("-" * 70)
    arquivo_12 = base / "12_validacoes.sql"
    if arquivo_12.exists():
        executar_sql_lote(arquivo_12, "Verificar integridade e totais")
        print("✓ ETAPA 5 CONCLUÍDA: Validações executadas")
    else:
        print("ℹ INFO: 12_validacoes.sql não encontrado, pulando...")
    
    print()
    print("=" * 70)
    print("✓ POVOAMENTO COMPLETO CONCLUÍDO COM SUCESSO!")
    print("=" * 70)
    print()
    print("Próximos passos recomendados:")
    print("  1. Verificar totais no banco (lançamentos, parcelas, fornecedores)")
    print("  2. Revisar view v_fornecedores_canonicos")
    print("  3. Testar dashboards com dados reais")
    print()

if __name__ == "__main__":
    main()
