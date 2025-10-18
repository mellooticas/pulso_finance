# 📁 PULSO Finance - Estrutura do Projeto

## Estrutura Organizada

```
pulso_finance/
├── 🎯 APLICAÇÃO PRINCIPAL
│   ├── backend/                # API FastAPI
│   │   ├── main.py            # Ponto de entrada da API
│   │   ├── start.py           # Script de inicialização
│   │   ├── requirements.txt   # Dependências Python
│   │   └── src/               # Código fonte
│   │       ├── chart_generator.py
│   │       └── financial_analyzer.py
│   │
│   ├── frontend/              # Interface Next.js + TypeScript
│   │   ├── package.json       # Dependências Node.js
│   │   ├── next.config.ts     # Configurações Next.js
│   │   ├── tsconfig.json      # Configurações TypeScript
│   │   └── src/               # Código fonte React
│   │       ├── app/           # Pages (App Router)
│   │       ├── components/    # Componentes reutilizáveis
│   │       ├── contexts/      # Context APIs
│   │       ├── hooks/         # Custom hooks
│   │       └── lib/           # Utilitários
│   │
│   └── apps/                  # Aplicações adicionais
│       └── web/               # App web alternativo
│
├── 📊 DADOS E ANÁLISE
│   ├── data/                  # Datasets e uploads
│   │   ├── exemplo_financeiro.csv
│   │   └── base/              # Dados base (Yampa)
│   │       ├── yampa_relatorio_antigo.csv
│   │       └── yampa_relatorio.csv
│   │
│   ├── notebooks/             # Jupyter notebooks
│   │   ├── analise_dados_yampa.ipynb
│   │   └── analise_financeira_inicial.ipynb
│   │
│   └── scripts/               # Scripts de automação
│       └── analysis/          # Scripts de análise
│           ├── analise_estrutural_yampa.py
│           ├── analise_yampa_completa.py
│           └── test_api.py
│
├── 🗄️ BANCO DE DADOS
│   ├── database/              # Arquivos de banco
│   │   ├── migrations/        # Migrações e correções
│   │   │   ├── CORRIGIR_RLS_URGENTE.sql
│   │   │   ├── CORRIGIR_RLS_USUARIOS.sql
│   │   │   ├── CRIAR_PERFIS_AUTOMATICO.sql
│   │   │   ├── CRIAR_USUARIOS_REAIS.sql
│   │   │   └── SEEDS_SUPABASE.sql
│   │   │
│   │   ├── etl/               # ETL e validação
│   │   │   ├── ETAPA_1_PREPARACAO.sql
│   │   │   ├── ETAPA_2_IMPORTACAO_DADOS.sql
│   │   │   ├── ETAPA_3_NORMALIZACAO.sql
│   │   │   ├── ETAPA_4_INSERIR_BANCO.sql
│   │   │   ├── etl_migracao_yampa.sql
│   │   │   ├── TESTE_COMPLETO_MIGRACAO.sql
│   │   │   ├── TESTE_SISTEMA.sql
│   │   │   ├── VALIDACAO_BANCO.sql
│   │   │   ├── VERIFICAR_ENUMS.sql
│   │   │   └── VERIFICAR_SCHEMAS.sql
│   │   │
│   │   └── debug/             # Scripts de debug
│   │       ├── DEBUG_AUTH.sql
│   │       ├── DEBUG_MIGRACAO.sql
│   │       └── DIAGNOSTICO_USUARIOS.sql
│   │
│   └── supabase/             # Configurações Supabase
│       ├── migrations/       # Migrações oficiais
│       └── seeds/           # Seeds de dados
│
├── 🐳 INFRAESTRUTURA
│   ├── docker/               # Containerização
│   │   ├── Dockerfile        # Imagem principal
│   │   ├── docker-compose.yml # Orquestração
│   │   ├── compose.yaml      # Configuração alternativa
│   │   └── compose.debug.yaml # Debug mode
│   │
│   └── tests/                # Testes automatizados
│       └── backend/          # Testes do backend
│
├── 📚 DOCUMENTAÇÃO
│   ├── docs/                 # Documentação geral
│   │   ├── setup/           # Guias de setup
│   │   │   ├── CORRECOES_APLICADAS.md
│   │   │   ├── FINALIZACAO_BANCO.md
│   │   │   ├── FRONTEND_SETUP.md
│   │   │   ├── GUIA_MIGRACAO_YAMPA.md
│   │   │   ├── SCHEMA_MAPPING.md
│   │   │   ├── SETUP_COMPLETO_SUPABASE.md
│   │   │   └── STATUS_FINAL_SUCESSO.md
│   │   │
│   │   ├── # 💰 PULSO Finance — Blueprint Técnico v2.0.md
│   │   ├── # 🗺️ PULSO Finance — Roadmap de Execução.md
│   │   └── DOCUMENTATION.md
│   │
│   ├── README.md            # Documentação principal
│   └── PROJECT_STRUCTURE.md # Este arquivo
│
└── 📋 CONFIGURAÇÃO
    ├── .dockerignore        # Ignores para Docker
    ├── .gitignore           # Ignores para Git
    ├── LICENSE              # Licença do projeto
    ├── setup.ps1            # Setup Windows (PowerShell)
    ├── setup.sh             # Setup Unix/Linux
    └── package-lock.json    # Lock de dependências (raiz)
```

## 🎯 Principais Diretórios

### `/backend` - API FastAPI
- **Função**: API REST para processamento de dados financeiros
- **Tecnologia**: Python + FastAPI + Pandas
- **Entrada**: `python start.py` ou `uvicorn main:app`

### `/frontend` - Interface Web
- **Função**: Dashboard interativo para visualização
- **Tecnologia**: Next.js + TypeScript + React
- **Entrada**: `npm run dev`

### `/database` - Dados e Migrações
- **Função**: Scripts SQL organizados por função
- **Estrutura**: migrations/ + etl/ + debug/

### `/scripts` - Automação
- **Função**: Scripts de análise e utilitários
- **Uso**: Processamento offline, testes, análises

### `/docs` - Documentação
- **Função**: Guias, blueprints e documentação técnica
- **Organização**: setup/ para guias de instalação

## 🚀 Como Navegar

1. **Para desenvolver**: Vá para `/backend` ou `/frontend`
2. **Para dados**: Confira `/data` e `/database`
3. **Para setup**: Leia `/docs/setup`
4. **Para análise**: Use `/notebooks` e `/scripts`
5. **Para deploy**: Veja `/docker`

## 📝 Notas de Migração

✅ **Organizado**:
- Arquivos SQL movidos para `/database`
- Documentação de setup em `/docs/setup`
- Scripts Python em `/scripts/analysis`
- Arquivos Docker em `/docker`

🎯 **Próximos Passos**:
- Verificar referências quebradas
- Atualizar scripts de build
- Documentar APIs
- Configurar CI/CD