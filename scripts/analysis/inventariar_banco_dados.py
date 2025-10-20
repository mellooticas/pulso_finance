"""
🔍 INVENTÁRIO DO BANCO DE DADOS SUPABASE
Conecta no banco e verifica O QUE REALMENTE EXISTE
"""

import os
import sys
from pathlib import Path
from datetime import datetime
import json

def verificar_supabase():
    """Verifica se as credenciais do Supabase estão configuradas"""
    
    # Procurar em .env ou .env.local
    env_files = [
        Path("frontend/.env.local"),
        Path("frontend/.env"),
        Path(".env"),
        Path(".env.local")
    ]
    
    supabase_url = None
    supabase_key = None
    
    for env_file in env_files:
        if env_file.exists():
            print(f"📄 Lendo {env_file}...")
            with open(env_file, 'r') as f:
                for line in f:
                    if 'NEXT_PUBLIC_SUPABASE_URL' in line:
                        supabase_url = line.split('=')[1].strip()
                    elif 'NEXT_PUBLIC_SUPABASE_ANON_KEY' in line:
                        supabase_key = line.split('=')[1].strip()
    
    if not supabase_url or not supabase_key:
        print("❌ Credenciais do Supabase não encontradas!")
        print("\nCrie um arquivo frontend/.env.local com:")
        print("NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co")
        print("NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon")
        return None, None
    
    print(f"✅ Supabase URL: {supabase_url}")
    print(f"✅ Anon Key: {supabase_key[:20]}...{supabase_key[-10:]}")
    
    return supabase_url, supabase_key


def inventariar_banco(supabase_url, supabase_key):
    """Faz inventário completo do banco"""
    
    try:
        from supabase import create_client
    except ImportError:
        print("❌ Biblioteca supabase não instalada!")
        print("Execute: pip install supabase")
        return None
    
    print("\n🔌 Conectando no Supabase...")
    supabase = create_client(supabase_url, supabase_key)
    
    # Lista de tabelas esperadas
    tabelas_esperadas = [
        'lancamentos',
        'parcelas',
        'fornecedores',
        'lojas',
        'planos_contas',
        'centros_custo',
        'produtos_servicos',
        'usuarios',
        'profiles',
        'empresas'
    ]
    
    inventario = {
        'data_inventario': datetime.now().isoformat(),
        'supabase_url': supabase_url,
        'tabelas': {},
        'resumo': {
            'total_tabelas_encontradas': 0,
            'total_tabelas_esperadas': len(tabelas_esperadas),
            'total_registros': 0,
            'tabelas_vazias': [],
            'tabelas_faltando': [],
            'tabelas_ok': []
        }
    }
    
    print("\n📊 Verificando tabelas...\n")
    print("=" * 70)
    
    for tabela in tabelas_esperadas:
        print(f"\n🔍 {tabela}...")
        
        try:
            # Tentar contar registros
            response = supabase.table(tabela).select('*', count='exact').limit(0).execute()
            
            count = response.count if hasattr(response, 'count') else 0
            
            inventario['tabelas'][tabela] = {
                'existe': True,
                'total_registros': count,
                'status': 'OK' if count > 0 else 'VAZIA'
            }
            
            if count > 0:
                print(f"   ✅ {count:,} registros")
                inventario['resumo']['tabelas_ok'].append(tabela)
                inventario['resumo']['total_registros'] += count
            else:
                print(f"   ⚠️  Tabela VAZIA")
                inventario['resumo']['tabelas_vazias'].append(tabela)
            
            inventario['resumo']['total_tabelas_encontradas'] += 1
            
            # Tentar pegar amostra de dados (primeiro registro)
            if count > 0:
                sample = supabase.table(tabela).select('*').limit(1).execute()
                if sample.data:
                    inventario['tabelas'][tabela]['colunas'] = list(sample.data[0].keys())
                    inventario['tabelas'][tabela]['exemplo'] = sample.data[0]
            
        except Exception as e:
            erro_str = str(e)
            print(f"   ❌ ERRO: {erro_str}")
            
            inventario['tabelas'][tabela] = {
                'existe': False,
                'erro': erro_str,
                'status': 'FALTANDO'
            }
            
            inventario['resumo']['tabelas_faltando'].append(tabela)
    
    print("\n" + "=" * 70)
    print("\n📋 RESUMO DO INVENTÁRIO")
    print("=" * 70)
    
    print(f"\n✅ Tabelas encontradas: {inventario['resumo']['total_tabelas_encontradas']}/{inventario['resumo']['total_tabelas_esperadas']}")
    print(f"📊 Total de registros: {inventario['resumo']['total_registros']:,}")
    
    if inventario['resumo']['tabelas_ok']:
        print(f"\n✅ TABELAS COM DADOS ({len(inventario['resumo']['tabelas_ok'])}):")
        for tabela in inventario['resumo']['tabelas_ok']:
            count = inventario['tabelas'][tabela]['total_registros']
            print(f"   • {tabela}: {count:,} registros")
    
    if inventario['resumo']['tabelas_vazias']:
        print(f"\n⚠️  TABELAS VAZIAS ({len(inventario['resumo']['tabelas_vazias'])}):")
        for tabela in inventario['resumo']['tabelas_vazias']:
            print(f"   • {tabela}")
    
    if inventario['resumo']['tabelas_faltando']:
        print(f"\n❌ TABELAS FALTANDO ({len(inventario['resumo']['tabelas_faltando'])}):")
        for tabela in inventario['resumo']['tabelas_faltando']:
            print(f"   • {tabela}")
            if 'erro' in inventario['tabelas'][tabela]:
                print(f"     Erro: {inventario['tabelas'][tabela]['erro']}")
    
    # Análises específicas
    print("\n" + "=" * 70)
    print("🔬 ANÁLISES ESPECÍFICAS")
    print("=" * 70)
    
    # Verificar dados do Yampa
    if 'lancamentos' in inventario['resumo']['tabelas_ok']:
        count_lanc = inventario['tabelas']['lancamentos']['total_registros']
        print(f"\n💰 LANÇAMENTOS:")
        print(f"   • Total: {count_lanc:,} registros")
        print(f"   • Esperado: 45.133 (dados Yampa)")
        
        if count_lanc >= 45000:
            print(f"   ✅ Dados do Yampa parecem estar importados!")
        elif count_lanc > 0:
            print(f"   ⚠️  Poucos registros. Falta importar dados do Yampa?")
        else:
            print(f"   ❌ VAZIO! Precisa importar dados do Yampa URGENTE!")
    
    # Verificar fornecedores
    if 'fornecedores' in inventario['resumo']['tabelas_ok']:
        count_forn = inventario['tabelas']['fornecedores']['total_registros']
        print(f"\n🏢 FORNECEDORES:")
        print(f"   • Total: {count_forn} registros")
        print(f"   • Esperado: 5 (Zeiss, Hoya, Solótica, Braslab, Fast Company)")
        
        if count_forn >= 5:
            print(f"   ✅ Fornecedores principais parecem estar cadastrados")
        else:
            print(f"   ⚠️  Faltam fornecedores!")
    
    # Verificar lojas
    if 'lojas' in inventario['resumo']['tabelas_ok']:
        count_lojas = inventario['tabelas']['lojas']['total_registros']
        print(f"\n🏪 LOJAS:")
        print(f"   • Total: {count_lojas} registros")
        print(f"   • Esperado: 8 lojas")
        
        if count_lojas >= 8:
            print(f"   ✅ Lojas cadastradas")
        else:
            print(f"   ⚠️  Faltam lojas!")
    
    # Verificar produtos
    if 'produtos_servicos' in inventario['resumo']['tabelas_ok']:
        count_prod = inventario['tabelas']['produtos_servicos']['total_registros']
        print(f"\n📦 PRODUTOS/SERVIÇOS:")
        print(f"   • Total: {count_prod} registros")
        print(f"   • Esperado: ~2.000 (1.588 lentes + 105 armações + tratamentos)")
        
        if count_prod >= 1500:
            print(f"   ✅ Produtos principais cadastrados")
        else:
            print(f"   ⚠️  Faltam produtos!")
    
    # Salvar inventário
    output_path = Path('data/analysis/inventario_banco_dados.json')
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(inventario, f, indent=2, ensure_ascii=False, default=str)
    
    print(f"\n💾 Inventário completo salvo em: {output_path}")
    
    # Gerar relatório de ação
    gerar_relatorio_acao(inventario)
    
    return inventario


def gerar_relatorio_acao(inventario):
    """Gera relatório com ações necessárias"""
    
    relatorio_path = Path('docs/ACOES_NECESSARIAS.md')
    
    relatorio = """# 🎯 AÇÕES NECESSÁRIAS - Baseado no Inventário do Banco

**Data**: """ + datetime.now().strftime('%d/%m/%Y %H:%M:%S') + """

---

## 📊 STATUS ATUAL

"""
    
    total_encontradas = inventario['resumo']['total_tabelas_encontradas']
    total_esperadas = inventario['resumo']['total_tabelas_esperadas']
    total_registros = inventario['resumo']['total_registros']
    
    relatorio += f"- Tabelas encontradas: **{total_encontradas}/{total_esperadas}**\n"
    relatorio += f"- Total de registros: **{total_registros:,}**\n"
    relatorio += f"- Tabelas vazias: **{len(inventario['resumo']['tabelas_vazias'])}**\n"
    relatorio += f"- Tabelas faltando: **{len(inventario['resumo']['tabelas_faltando'])}**\n\n"
    
    # Ações baseadas no status
    relatorio += "## 🚨 AÇÕES URGENTES\n\n"
    
    if inventario['resumo']['tabelas_faltando']:
        relatorio += "### ❌ Criar Tabelas Faltando\n\n"
        relatorio += "```bash\n"
        relatorio += "# Execute as migrations do Supabase:\n"
        for tabela in inventario['resumo']['tabelas_faltando']:
            relatorio += f"# - {tabela}\n"
        relatorio += "```\n\n"
    
    if inventario['resumo']['tabelas_vazias']:
        relatorio += "### ⚠️  Popular Tabelas Vazias\n\n"
        for tabela in inventario['resumo']['tabelas_vazias']:
            relatorio += f"- [ ] **{tabela}** - Importar dados\n"
        relatorio += "\n"
    
    # Verificar lançamentos do Yampa
    if 'lancamentos' in inventario['tabelas']:
        count_lanc = inventario['tabelas']['lancamentos'].get('total_registros', 0)
        
        if count_lanc < 45000:
            relatorio += "### 🔥 CRÍTICO: Importar Dados do Yampa\n\n"
            relatorio += f"Atualmente: **{count_lanc:,} lançamentos**  \n"
            relatorio += f"Necessário: **45.133 lançamentos**  \n\n"
            relatorio += "```bash\n"
            relatorio += "cd backend\n"
            relatorio += "python import_to_supabase.py\n"
            relatorio += "```\n\n"
    
    # Verificações de integridade
    relatorio += "## ✅ CHECKLIST DE VALIDAÇÃO\n\n"
    relatorio += "### Dados Essenciais\n"
    relatorio += "- [ ] 45.133 lançamentos do Yampa importados\n"
    relatorio += "- [ ] 5 fornecedores principais cadastrados\n"
    relatorio += "- [ ] 8 lojas cadastradas\n"
    relatorio += "- [ ] ~2.000 produtos/serviços cadastrados\n"
    relatorio += "- [ ] Plano de contas configurado\n"
    relatorio += "- [ ] Centros de custo configurados\n\n"
    
    relatorio += "### Testes de Integração\n"
    relatorio += "- [ ] Dashboard principal carrega dados\n"
    relatorio += "- [ ] Central de Decisões mostra alertas reais\n"
    relatorio += "- [ ] Contas a pagar/receber com valores corretos\n"
    relatorio += "- [ ] DRE calculando corretamente\n"
    relatorio += "- [ ] Fluxo de caixa com projeções\n\n"
    
    relatorio += "---\n\n"
    relatorio += "**Gerado por**: `inventariar_banco_dados.py`  \n"
    relatorio += "**Inventário completo**: `data/analysis/inventario_banco_dados.json`\n"
    
    with open(relatorio_path, 'w', encoding='utf-8') as f:
        f.write(relatorio)
    
    print(f"📋 Relatório de ações salvo em: {relatorio_path}")


def main():
    print("=" * 70)
    print("🔍 INVENTÁRIO DO BANCO DE DADOS SUPABASE")
    print("=" * 70)
    print()
    
    # Verificar credenciais
    supabase_url, supabase_key = verificar_supabase()
    
    if not supabase_url or not supabase_key:
        return
    
    # Fazer inventário
    inventario = inventariar_banco(supabase_url, supabase_key)
    
    if inventario:
        print("\n" + "=" * 70)
        print("✅ INVENTÁRIO CONCLUÍDO!")
        print("=" * 70)
        print("\nPróximos passos:")
        print("1. Revisar data/analysis/inventario_banco_dados.json")
        print("2. Seguir docs/ACOES_NECESSARIAS.md")
        print("3. Importar dados faltando")
        print("4. Validar sistema end-to-end")


if __name__ == "__main__":
    main()
