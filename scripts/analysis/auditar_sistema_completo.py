"""
🔍 AUDITORIA COMPLETA DO SISTEMA PULSO FINANCE
Verifica TODOS os lugares que buscam dados e documenta o estado atual
"""

import os
import re
import json
from pathlib import Path
from collections import defaultdict

class AuditorSistema:
    def __init__(self, base_path):
        self.base_path = Path(base_path)
        self.frontend_path = self.base_path / "frontend"
        self.backend_path = self.base_path / "backend"
        
        self.resultado = {
            "hooks": [],
            "paginas": [],
            "componentes": [],
            "queries_supabase": [],
            "tabelas_usadas": set(),
            "problemas": [],
            "estatisticas": {}
        }
    
    def auditar_arquivo(self, arquivo):
        """Analisa um arquivo TypeScript/TSX procurando queries do Supabase"""
        try:
            conteudo = arquivo.read_text(encoding='utf-8')
            
            info = {
                "arquivo": str(arquivo.relative_to(self.base_path)),
                "tipo": self._identificar_tipo(arquivo),
                "linhas": len(conteudo.splitlines()),
                "queries": [],
                "hooks_usados": [],
                "tabelas": [],
                "usa_mock": False,
                "problemas": []
            }
            
            # Procurar queries do Supabase
            queries = re.findall(r'supabase\.(?:from|table)\([\'"](\w+)[\'"]\)', conteudo)
            info["queries"] = queries
            info["tabelas"] = list(set(queries))
            
            # Procurar hooks sendo usados
            hooks = re.findall(r'use[A-Z]\w+\(', conteudo)
            info["hooks_usados"] = list(set(hooks))
            
            # Verificar se usa dados mockados
            if 'mock' in conteudo.lower() or 'faker' in conteudo.lower():
                info["usa_mock"] = True
                info["problemas"].append("Usa dados mockados")
            
            # Verificar se tem TODO ou FIXME
            if 'TODO' in conteudo or 'FIXME' in conteudo:
                info["problemas"].append("Tem TODO/FIXME no código")
            
            # Verificar se tem comentários sobre dados faltando
            if 'dados faltando' in conteudo.lower() or 'sem dados' in conteudo.lower():
                info["problemas"].append("Comentário sobre dados faltando")
            
            # Atualizar tabelas globais
            for tabela in info["tabelas"]:
                self.resultado["tabelas_usadas"].add(tabela)
            
            return info
            
        except Exception as e:
            return {
                "arquivo": str(arquivo),
                "erro": str(e)
            }
    
    def _identificar_tipo(self, arquivo):
        """Identifica o tipo do arquivo"""
        caminho = str(arquivo)
        
        if '/hooks/' in caminho:
            return "hook"
        elif '/app/' in caminho and 'page.tsx' in caminho:
            return "pagina"
        elif '/components/' in caminho:
            return "componente"
        else:
            return "outro"
    
    def auditar_hooks(self):
        """Audita todos os hooks"""
        print("🔍 Auditando hooks...")
        
        hooks_path = self.frontend_path / "src" / "hooks"
        if not hooks_path.exists():
            print(f"⚠️  Pasta de hooks não encontrada: {hooks_path}")
            return
        
        for arquivo in hooks_path.glob("*.ts"):
            if arquivo.name.startswith('.'):
                continue
                
            info = self.auditar_arquivo(arquivo)
            self.resultado["hooks"].append(info)
            print(f"  ✓ {arquivo.name}: {len(info.get('queries', []))} queries, {len(info.get('hooks_usados', []))} hooks")
    
    def auditar_paginas(self):
        """Audita todas as páginas do dashboard"""
        print("\n📄 Auditando páginas...")
        
        dashboard_path = self.frontend_path / "src" / "app" / "dashboard"
        if not dashboard_path.exists():
            print(f"⚠️  Pasta dashboard não encontrada: {dashboard_path}")
            return
        
        for arquivo in dashboard_path.rglob("page.tsx"):
            info = self.auditar_arquivo(arquivo)
            self.resultado["paginas"].append(info)
            
            # Extrair nome da página
            partes = arquivo.relative_to(dashboard_path).parts
            nome_pagina = partes[0] if len(partes) > 1 else "dashboard-principal"
            print(f"  ✓ {nome_pagina}: {len(info.get('queries', []))} queries, usa mock: {info.get('usa_mock', False)}")
    
    def auditar_componentes(self):
        """Audita componentes que fazem queries"""
        print("\n🧩 Auditando componentes...")
        
        components_path = self.frontend_path / "src" / "components"
        if not components_path.exists():
            print(f"⚠️  Pasta de componentes não encontrada: {components_path}")
            return
        
        count = 0
        for arquivo in components_path.rglob("*.tsx"):
            if arquivo.name.startswith('.'):
                continue
            
            info = self.auditar_arquivo(arquivo)
            if info.get('queries') or info.get('hooks_usados'):
                self.resultado["componentes"].append(info)
                count += 1
        
        print(f"  ✓ {count} componentes com queries/hooks encontrados")
    
    def gerar_relatorio(self):
        """Gera relatório da auditoria"""
        print("\n" + "=" * 70)
        print("📊 RELATÓRIO DE AUDITORIA")
        print("=" * 70)
        
        # Estatísticas gerais
        total_hooks = len(self.resultado["hooks"])
        total_paginas = len(self.resultado["paginas"])
        total_componentes = len(self.resultado["componentes"])
        
        print(f"\n📈 ESTATÍSTICAS:")
        print(f"   Hooks analisados: {total_hooks}")
        print(f"   Páginas analisadas: {total_paginas}")
        print(f"   Componentes analisados: {total_componentes}")
        print(f"   Tabelas únicas usadas: {len(self.resultado['tabelas_usadas'])}")
        
        # Tabelas usadas
        print(f"\n🗄️  TABELAS DO SUPABASE USADAS:")
        if self.resultado["tabelas_usadas"]:
            for tabela in sorted(self.resultado["tabelas_usadas"]):
                print(f"   • {tabela}")
        else:
            print("   ⚠️  NENHUMA query do Supabase encontrada!")
        
        # Hooks que usam mock
        hooks_mock = [h for h in self.resultado["hooks"] if h.get("usa_mock")]
        if hooks_mock:
            print(f"\n⚠️  HOOKS USANDO DADOS MOCKADOS ({len(hooks_mock)}):")
            for hook in hooks_mock:
                print(f"   • {hook['arquivo']}")
        
        # Páginas que usam mock
        paginas_mock = [p for p in self.resultado["paginas"] if p.get("usa_mock")]
        if paginas_mock:
            print(f"\n⚠️  PÁGINAS USANDO DADOS MOCKADOS ({len(paginas_mock)}):")
            for pagina in paginas_mock:
                print(f"   • {pagina['arquivo']}")
        
        # Arquivos com problemas
        todos_arquivos = self.resultado["hooks"] + self.resultado["paginas"] + self.resultado["componentes"]
        arquivos_problemas = [a for a in todos_arquivos if a.get("problemas")]
        
        if arquivos_problemas:
            print(f"\n🐛 ARQUIVOS COM PROBLEMAS ({len(arquivos_problemas)}):")
            for arquivo in arquivos_problemas:
                print(f"   • {arquivo['arquivo']}")
                for problema in arquivo["problemas"]:
                    print(f"     - {problema}")
        
        # Top 10 arquivos com mais queries
        arquivos_queries = [(a["arquivo"], len(a.get("queries", []))) 
                           for a in todos_arquivos if a.get("queries")]
        arquivos_queries.sort(key=lambda x: x[1], reverse=True)
        
        if arquivos_queries:
            print(f"\n🔝 TOP 10 ARQUIVOS COM MAIS QUERIES:")
            for arquivo, num_queries in arquivos_queries[:10]:
                print(f"   • {arquivo}: {num_queries} queries")
        
        # Páginas SEM queries diretas (dependem de hooks)
        paginas_sem_queries = [p for p in self.resultado["paginas"] 
                              if not p.get("queries") and p.get("hooks_usados")]
        
        if paginas_sem_queries:
            print(f"\n✅ PÁGINAS USANDO APENAS HOOKS ({len(paginas_sem_queries)}):")
            for pagina in paginas_sem_queries:
                partes = pagina['arquivo'].replace('\\', '/').split('/')
                nome = partes[-2] if len(partes) >= 2 and 'page.tsx' in pagina['arquivo'] else pagina['arquivo']
                print(f"   • {nome} (usa {len(pagina.get('hooks_usados', []))} hooks)")
        
        # Salvar resultado completo em JSON
        self.resultado["tabelas_usadas"] = list(self.resultado["tabelas_usadas"])
        
        output_path = self.base_path / "data" / "analysis" / "auditoria_sistema.json"
        output_path.parent.mkdir(parents=True, exist_ok=True)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(self.resultado, f, indent=2, ensure_ascii=False)
        
        print(f"\n💾 Resultado completo salvo em: {output_path}")
        
        # Gerar checklist de validação
        self._gerar_checklist()
    
    def _gerar_checklist(self):
        """Gera checklist de validação"""
        checklist_path = self.base_path / "docs" / "CHECKLIST_VALIDACAO.md"
        
        checklist = """# ✅ Checklist de Validação do Sistema

## 🗄️ Banco de Dados

### Tabelas que DEVEM existir no Supabase:
"""
        
        for tabela in sorted(self.resultado["tabelas_usadas"]):
            checklist += f"- [ ] **{tabela}** - Verificar se existe e tem dados\n"
        
        checklist += "\n## 📄 Páginas do Dashboard\n\n"
        
        for pagina in self.resultado["paginas"]:
            partes = pagina['arquivo'].replace('\\', '/').split('/')
            nome = partes[-2] if len(partes) >= 2 and 'page.tsx' in pagina['arquivo'] else "dashboard"
            usa_mock = "⚠️ USA MOCK" if pagina.get("usa_mock") else "✓"
            num_queries = len(pagina.get("queries", []))
            num_hooks = len(pagina.get("hooks_usados", []))
            
            checklist += f"- [ ] **{nome}** {usa_mock}\n"
            checklist += f"  - Queries diretas: {num_queries}\n"
            checklist += f"  - Hooks usados: {num_hooks}\n"
            if pagina.get("problemas"):
                checklist += f"  - Problemas: {', '.join(pagina['problemas'])}\n"
            checklist += "\n"
        
        checklist += "\n## 🎣 Hooks\n\n"
        
        for hook in self.resultado["hooks"]:
            nome = hook['arquivo'].split('/')[-1]
            usa_mock = "⚠️ USA MOCK" if hook.get("usa_mock") else "✓"
            
            checklist += f"- [ ] **{nome}** {usa_mock}\n"
            if hook.get("tabelas"):
                checklist += f"  - Tabelas: {', '.join(hook['tabelas'])}\n"
            if hook.get("problemas"):
                checklist += f"  - Problemas: {', '.join(hook['problemas'])}\n"
            checklist += "\n"
        
        checklist += """
## 🧪 Testes de Integração

- [ ] Todas as páginas carregam sem erro
- [ ] Todas as queries retornam dados (não vazio)
- [ ] Sem dados mockados em produção
- [ ] Sem erros no console do navegador
- [ ] Sem erros de tipo TypeScript
- [ ] Tempo de carregamento < 3 segundos
- [ ] Supabase RLS configurado corretamente

## 🔐 Segurança

- [ ] RLS ativado em todas as tabelas
- [ ] Políticas de acesso por perfil de usuário
- [ ] Credentials não expostos no código
- [ ] HTTPS em produção

## 📊 Dados

- [ ] 45.133 transações do Yampa importadas
- [ ] Fornecedores carregados
- [ ] Lojas carregadas
- [ ] Produtos/Serviços carregados
- [ ] Plano de contas carregado
- [ ] Centros de custo carregados

---

**Data da auditoria**: """ + str(Path(__file__).stat().st_mtime) + """
**Gerado por**: auditar_sistema_completo.py
"""
        
        with open(checklist_path, 'w', encoding='utf-8') as f:
            f.write(checklist)
        
        print(f"📋 Checklist de validação salvo em: {checklist_path}")


def main():
    print("🔍 INICIANDO AUDITORIA COMPLETA DO SISTEMA")
    print("=" * 70)
    
    # Detectar caminho do projeto
    script_path = Path(__file__).resolve()
    base_path = script_path.parent.parent.parent
    
    print(f"📁 Base do projeto: {base_path}\n")
    
    auditor = AuditorSistema(base_path)
    
    # Executar auditoria
    auditor.auditar_hooks()
    auditor.auditar_paginas()
    auditor.auditar_componentes()
    
    # Gerar relatório
    auditor.gerar_relatorio()
    
    print("\n" + "=" * 70)
    print("✅ AUDITORIA CONCLUÍDA!")
    print("=" * 70)
    print("\nPróximos passos:")
    print("1. Revisar data/analysis/auditoria_sistema.json")
    print("2. Seguir docs/CHECKLIST_VALIDACAO.md")
    print("3. Corrigir arquivos com problemas")
    print("4. Garantir que todas as tabelas existem no Supabase")


if __name__ == "__main__":
    main()
