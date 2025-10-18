# Pulso Finance - Análise Financeira

Sistema de análise financeira para processamento de dados de planilhas Excel e CSV.

## 📊 Funcionalidades

- Importação e análise de dados financeiros (Excel/CSV)
- Visualização de gráficos e relatórios
- Análise de fluxo de caixa
- Categorização automática de transações
- Relatórios personalizados
- Dashboard interativo

## 🚀 Tecnologias

- **Backend**: Python (FastAPI)
- **Frontend**: React + TypeScript
- **Análise de Dados**: Pandas, NumPy, Matplotlib
- **Banco de Dados**: SQLite/PostgreSQL
- **Visualização**: Plotly, Chart.js

## 📁 Estrutura do Projeto

```
pulso_finance/
├── 🎯 APLICAÇÃO PRINCIPAL
│   ├── backend/                # API e lógica de negócio (FastAPI)
│   ├── frontend/              # Interface web (Next.js + TypeScript)
│   └── apps/                  # Apps adicionais
│
├── 📊 DADOS E ANÁLISE
│   ├── data/                  # Dados de exemplo e uploads
│   ├── notebooks/             # Jupyter notebooks para análise
│   └── scripts/               # Scripts de análise e utilitários
│       └── analysis/          # Scripts específicos de análise
│
├── 🗄️ BANCO DE DADOS
│   ├── database/              # Arquivos relacionados ao banco
│   │   ├── migrations/        # Migrações e correções SQL
│   │   ├── etl/              # Scripts de ETL e validação
│   │   └── debug/            # Scripts de debug e diagnóstico
│   └── supabase/             # Configurações do Supabase
│
├── 🐳 INFRAESTRUTURA
│   ├── docker/               # Arquivos Docker e compose
│   └── tests/                # Testes automatizados
│
└── 📚 DOCUMENTAÇÃO
    ├── docs/                 # Documentação geral
    │   └── setup/           # Documentação de setup e migração
    └── README.md            # Este arquivo
```

## 🔧 Instalação

### Pré-requisitos
- Python 3.9+
- Node.js 18+
- Docker (opcional)

### Configuração Rápida

1. **Clone o repositório**
   ```bash
   git clone https://github.com/mellooticas/pulso_finance.git
   cd pulso_finance
   ```

2. **Backend (FastAPI)**
   ```bash
   cd backend
   python -m venv .venv
   source .venv/bin/activate  # Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   python start.py
   ```

3. **Frontend (Next.js)**
   ```bash
   cd frontend
   npm install
   npm run dev
   ```

### Com Docker 🐳
```bash
cd docker
docker-compose up -d
```

## � Como Usar

1. **Acesse a aplicação**: `http://localhost:3000` (Frontend) e `http://localhost:8000` (API)
2. **Faça upload de arquivos**: Excel ou CSV com dados financeiros
3. **Visualize relatórios**: Dashboard interativo com gráficos e métricas
4. **Exporte análises**: Relatórios em PDF ou planilhas processadas

## 📚 Documentação Adicional

- 📋 **Setup Completo**: `docs/setup/` - Guias detalhados de configuração
- 🗄️ **Banco de Dados**: `database/` - Migrações e scripts SQL
- 🔧 **Scripts**: `scripts/analysis/` - Ferramentas de análise
- 🐳 **Docker**: `docker/` - Configurações de contêiner

## 📈 Roadmap

- [x] ✅ Estrutura base do projeto organizada
- [x] ✅ Backend FastAPI funcional
- [x] ✅ Frontend Next.js + TypeScript
- [ ] 🔄 Dashboard de métricas financeiras
- [ ] 🔄 Importação automática de dados
- [ ] 🔄 Relatórios personalizáveis
- [ ] 🔄 API de integração externa

## 🤝 Contribuição

1. Fork o projeto
2. Crie sua feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request