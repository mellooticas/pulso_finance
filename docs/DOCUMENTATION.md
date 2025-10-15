# 📊 Pulso Finance - Documentação Técnica Completa

## 📋 Índice

1. [Visão Geral do Projeto](#visão-geral-do-projeto)
2. [Arquitetura do Sistema](#arquitetura-do-sistema)
3. [Tecnologias Utilizadas](#tecnologias-utilizadas)
4. [Estrutura do Projeto](#estrutura-do-projeto)
5. [Funcionalidades](#funcionalidades)
6. [API Documentation](#api-documentation)
7. [Instalação e Configuração](#instalação-e-configuração)
8. [Guia de Uso](#guia-de-uso)
9. [Análise de Dados](#análise-de-dados)
10. [Deployment](#deployment)
11. [Contribuição](#contribuição)
12. [Roadmap](#roadmap)

---

## 🎯 Visão Geral do Projeto

O **Pulso Finance** é uma plataforma completa de análise financeira desenvolvida para processar, analisar e visualizar dados financeiros a partir de arquivos Excel e CSV. O sistema oferece insights automatizados, categorização inteligente de transações e dashboards interativos para tomada de decisões financeiras.

### 🎯 Objetivos

- **Automatizar** a análise de dados financeiros
- **Categorizar** transações automaticamente
- **Visualizar** tendências e padrões financeiros
- **Detectar** anomalias e outliers
- **Gerar** relatórios personalizados
- **Fornecer** insights acionáveis

### 👥 Público-Alvo

- Pequenas e médias empresas
- Profissionais autônomos
- Consultores financeiros
- Analistas de dados
- Gestores financeiros

---

## 🏗️ Arquitetura do Sistema

### Diagrama de Arquitetura

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │     Backend     │    │   Database      │
│   (React)       │◄───┤   (FastAPI)     │◄───┤   (SQLite)      │
│                 │    │                 │    │                 │
│ • Dashboard     │    │ • API REST      │    │ • Transações    │
│ • Upload Files  │    │ • Análise       │    │ • Categorias    │
│ • Visualização  │    │ • Categorização │    │ • Usuários      │
│ • Relatórios    │    │ • Relatórios    │    │ • Configurações │
└─────────────────┘    └─────────────────┘    └─────────────────┘
        │                        │                        │
        └────────────────────────┼────────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   File Storage  │
                    │   (Local/Cloud) │
                    │                 │
                    │ • Excel Files   │
                    │ • CSV Files     │
                    │ • Reports       │
                    │ • Exports       │
                    └─────────────────┘
```

### Padrões Arquiteturais

- **MVC (Model-View-Controller)**: Separação clara de responsabilidades
- **REST API**: Comunicação entre frontend e backend
- **Repository Pattern**: Abstração da camada de dados
- **Service Layer**: Lógica de negócio centralizada
- **Dependency Injection**: Inversão de controle

---

## 🛠️ Tecnologias Utilizadas

### Backend
- **Python 3.9+**: Linguagem principal
- **FastAPI**: Framework web moderno e rápido
- **Pandas**: Manipulação e análise de dados
- **NumPy**: Computação numérica
- **SQLAlchemy**: ORM para banco de dados
- **Pydantic**: Validação de dados
- **Uvicorn**: Servidor ASGI

### Frontend
- **React 18**: Biblioteca JavaScript
- **TypeScript**: Tipagem estática
- **Material-UI**: Componentes de interface
- **Chart.js**: Gráficos interativos
- **Axios**: Cliente HTTP

### Análise e Visualização
- **Matplotlib**: Gráficos estáticos
- **Seaborn**: Visualizações estatísticas
- **Plotly**: Gráficos interativos
- **Jupyter Notebooks**: Análise exploratória

### Banco de Dados
- **SQLite**: Desenvolvimento local
- **PostgreSQL**: Produção (opcional)

### DevOps e Ferramentas
- **Git**: Controle de versão
- **Docker**: Containerização
- **Pytest**: Testes automatizados
- **Black**: Formatação de código
- **Flake8**: Linting

---

## 📁 Estrutura do Projeto

```
pulso_finance/
├── 📁 backend/                    # API e lógica de negócio
│   ├── 📁 src/
│   │   ├── 📄 financial_analyzer.py    # Análise financeira
│   │   ├── 📄 chart_generator.py       # Geração de gráficos
│   │   ├── 📁 models/                  # Modelos de dados
│   │   ├── 📁 services/                # Serviços de negócio
│   │   ├── 📁 repositories/            # Acesso a dados
│   │   └── 📁 utils/                   # Utilitários
│   ├── 📄 main.py                      # Aplicação principal
│   ├── 📄 requirements.txt             # Dependências Python
│   └── 📄 config.py                    # Configurações
│
├── 📁 frontend/                   # Interface web
│   ├── 📁 src/
│   │   ├── 📁 components/              # Componentes React
│   │   ├── 📁 pages/                   # Páginas da aplicação
│   │   ├── 📁 services/                # Serviços API
│   │   ├── 📁 hooks/                   # Custom hooks
│   │   └── 📁 utils/                   # Utilitários
│   ├── 📄 package.json                 # Dependências Node.js
│   └── 📄 tsconfig.json                # Configuração TypeScript
│
├── 📁 data/                       # Dados e uploads
│   ├── 📄 exemplo_financeiro.csv       # Dados de exemplo
│   ├── 📁 uploads/                     # Arquivos enviados
│   └── 📁 resultados_analise/          # Resultados processados
│
├── 📁 notebooks/                  # Jupyter notebooks
│   ├── 📄 analise_financeira_inicial.ipynb  # Análise exploratória
│   ├── 📄 categorization_model.ipynb        # Modelo de categorização
│   └── 📄 dashboard_prototypes.ipynb        # Protótipos de dashboard
│
├── 📁 docs/                       # Documentação
│   ├── 📄 DOCUMENTATION.md             # Este arquivo
│   ├── 📄 API_REFERENCE.md             # Referência da API
│   ├── 📄 USER_GUIDE.md                # Guia do usuário
│   └── 📄 DEPLOYMENT.md                # Guia de deploy
│
├── 📁 tests/                      # Testes automatizados
│   ├── 📁 backend/                     # Testes do backend
│   ├── 📁 frontend/                    # Testes do frontend
│   └── 📁 integration/                 # Testes de integração
│
├── 📄 README.md                   # Documentação principal
├── 📄 docker-compose.yml          # Configuração Docker
├── 📄 .gitignore                  # Arquivos ignorados pelo Git
└── 📄 LICENSE                     # Licença do projeto
```

---

## ⚡ Funcionalidades

### 📤 Upload e Processamento
- **Suporte a múltiplos formatos**: Excel (.xlsx, .xls) e CSV
- **Detecção automática de encoding**: UTF-8, Latin-1, CP1252
- **Validação de dados**: Verificação de integridade e consistência
- **Limpeza automática**: Remoção de duplicatas e tratamento de valores nulos

### 🏷️ Categorização Inteligente
- **Categorização automática**: Baseada em palavras-chave e padrões
- **Categorias personalizáveis**: Alimentação, Transporte, Saúde, etc.
- **Machine Learning**: Aprendizado baseado em histórico
- **Regras customizáveis**: Definição de regras específicas

### 📊 Análise Financeira
- **KPIs automáticos**: Margem de lucro, taxa de poupança, ROI
- **Análise temporal**: Tendências mensais, sazonalidade
- **Detecção de anomalias**: Identificação de outliers e padrões incomuns
- **Comparativos**: Receitas vs despesas, períodos diferentes

### 📈 Visualizações
- **Gráficos interativos**: Plotly.js e Chart.js
- **Dashboard responsivo**: Adaptável a diferentes dispositivos
- **Exportação**: PNG, PDF, SVG
- **Personalização**: Cores, filtros, períodos

### 📋 Relatórios
- **Relatórios automáticos**: Geração programada
- **Formatos múltiplos**: PDF, Excel, CSV
- **Templates personalizáveis**: Layouts flexíveis
- **Distribuição**: Email, download, impressão

---

## 🔌 API Documentation

### Endpoints Principais

#### 📤 Upload de Arquivos

```http
POST /upload/excel
Content-Type: multipart/form-data

{
  "file": "arquivo.xlsx"
}
```

**Resposta:**
```json
{
  "filename": "arquivo.xlsx",
  "shape": [100, 4],
  "columns": ["data", "descricao", "valor", "categoria"],
  "data_types": {
    "data": "datetime64[ns]",
    "descricao": "object",
    "valor": "float64",
    "categoria": "object"
  },
  "missing_values": {
    "data": 0,
    "descricao": 2,
    "valor": 0,
    "categoria": 5
  },
  "sample_data": [...]
}
```

#### 📊 Análise Financeira

```http
POST /analyze/financial
Content-Type: application/json

{
  "data": [...],
  "options": {
    "categorize": true,
    "detect_anomalies": true,
    "generate_charts": true
  }
}
```

**Resposta:**
```json
{
  "summary": {
    "total_receitas": 15000.00,
    "total_despesas": 12000.00,
    "saldo_liquido": 3000.00,
    "num_transacoes": 150,
    "ticket_medio": 20.00
  },
  "categories": {...},
  "charts": {...},
  "anomalies": [...]
}
```

### Códigos de Status

| Código | Descrição |
|--------|-----------|
| 200 | Sucesso |
| 400 | Erro de validação |
| 404 | Recurso não encontrado |
| 422 | Erro de processamento |
| 500 | Erro interno do servidor |

---

## ⚙️ Instalação e Configuração

### Pré-requisitos

- Python 3.9 ou superior
- Node.js 16 ou superior
- Git

### Instalação Backend

```bash
# Clonar o repositório
git clone https://github.com/seu-usuario/pulso_finance.git
cd pulso_finance

# Criar ambiente virtual
python -m venv venv
source venv/bin/activate  # Linux/Mac
# ou
venv\Scripts\activate     # Windows

# Instalar dependências
cd backend
pip install -r requirements.txt

# Executar servidor
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Instalação Frontend

```bash
# Navegar para o frontend
cd frontend

# Instalar dependências
npm install

# Executar em modo desenvolvimento
npm start

# Build para produção
npm run build
```

### Configuração com Docker

```bash
# Executar com Docker Compose
docker-compose up -d

# Verificar logs
docker-compose logs -f

# Parar serviços
docker-compose down
```

### Variáveis de Ambiente

Criar arquivo `.env` na raiz do projeto:

```env
# Backend
DATABASE_URL=sqlite:///./pulso_finance.db
SECRET_KEY=your-secret-key-here
DEBUG=True

# Frontend
REACT_APP_API_URL=http://localhost:8000
REACT_APP_ENV=development

# Email (opcional)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password
```

---

## 📚 Guia de Uso

### 1. Preparação dos Dados

#### Formato Recomendado para CSV:
```csv
data,descricao,valor,categoria
2024-01-15,Supermercado Extra,-250.00,Alimentação
2024-01-16,Salário,3500.00,Receita
2024-01-17,Conta de Luz,-120.00,Casa
```

#### Formato Recomendado para Excel:
- **Coluna A**: Data (formato dd/mm/yyyy)
- **Coluna B**: Descrição (texto)
- **Coluna C**: Valor (número, negativo para despesas)
- **Coluna D**: Categoria (opcional)

### 2. Upload e Análise

1. **Acesse a aplicação** em `http://localhost:3000`
2. **Clique em "Upload"** e selecione seu arquivo
3. **Aguarde o processamento** automático
4. **Visualize os resultados** no dashboard

### 3. Interpretação dos Resultados

#### Dashboard Principal
- **Saldo Atual**: Diferença entre receitas e despesas
- **Tendência Mensal**: Evolução ao longo do tempo
- **Distribuição por Categoria**: Principais áreas de gasto
- **Anomalias**: Transações atípicas identificadas

#### Relatórios Detalhados
- **Resumo Executivo**: KPIs principais
- **Análise Temporal**: Padrões sazonais
- **Categorização**: Detalhamento por categoria
- **Recomendações**: Insights automáticos

### 4. Customização

#### Categorias Personalizadas
```python
# Adicionar nova categoria
categorias_personalizadas = {
    'Investimentos': ['ações', 'bitcoin', 'fundos', 'tesouro'],
    'Educação': ['curso', 'livro', 'faculdade', 'certificação']
}
```

#### Regras de Negócio
```python
# Definir regras específicas
regras = {
    'alerta_gasto_alto': 1000.00,
    'meta_poupanca_mensal': 0.20,
    'categorias_prioritarias': ['Alimentação', 'Moradia', 'Transporte']
}
```

---

## 📊 Análise de Dados

### Métricas Calculadas

#### KPIs Financeiros
- **Margem de Lucro**: (Receitas - Despesas) / Receitas × 100
- **Taxa de Poupança**: Valor Poupado / Receitas × 100
- **Relação Despesa/Receita**: Despesas / Receitas × 100
- **Ticket Médio**: Valor Médio por Transação
- **Crescimento Mensal**: Variação percentual entre períodos

#### Análise Estatística
- **Medidas Centrais**: Média, mediana, moda
- **Dispersão**: Desvio padrão, variância, coeficiente de variação
- **Quartis**: Q1, Q2, Q3, IQR para detecção de outliers
- **Distribuição**: Histogramas e análise de normalidade

### Algoritmos de Detecção de Anomalias

#### Método IQR (Interquartile Range)
```python
Q1 = data.quantile(0.25)
Q3 = data.quantile(0.75)
IQR = Q3 - Q1
limite_inferior = Q1 - 1.5 * IQR
limite_superior = Q3 + 1.5 * IQR
outliers = data[(data < limite_inferior) | (data > limite_superior)]
```

#### Z-Score
```python
z_scores = np.abs(stats.zscore(data))
outliers = data[z_scores > 3]
```

### Análise Temporal

#### Decomposição de Séries Temporais
- **Tendência**: Direção geral dos dados
- **Sazonalidade**: Padrões repetitivos
- **Ruído**: Variações aleatórias

#### Detecção de Mudanças
- **Change Point Detection**: Identificação de mudanças estruturais
- **Análise de Regime**: Diferentes comportamentos ao longo do tempo

---

## 🚀 Deployment

### Ambiente de Produção

#### Servidor Linux (Ubuntu)

```bash
# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependências
sudo apt install python3-pip nginx postgresql redis-server

# Clonar projeto
git clone https://github.com/seu-usuario/pulso_finance.git
cd pulso_finance

# Configurar ambiente virtual
python3 -m venv venv
source venv/bin/activate

# Instalar dependências
pip install -r backend/requirements.txt
pip install gunicorn

# Configurar banco de dados
sudo -u postgres createdb pulso_finance
```

#### Configuração do Nginx

```nginx
server {
    listen 80;
    server_name seu-dominio.com;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /api {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

#### Arquivo de Serviço (systemd)

```ini
[Unit]
Description=Pulso Finance Backend
After=network.target

[Service]
User=www-data
Group=www-data
WorkingDirectory=/path/to/pulso_finance
Environment=PATH=/path/to/pulso_finance/venv/bin
ExecStart=/path/to/pulso_finance/venv/bin/gunicorn backend.main:app -w 4 -k uvicorn.workers.UvicornWorker
Restart=always

[Install]
WantedBy=multi-user.target
```

### Docker em Produção

#### Dockerfile Backend
```dockerfile
FROM python:3.9-slim

WORKDIR /app
COPY backend/requirements.txt .
RUN pip install -r requirements.txt

COPY backend/ .
CMD ["gunicorn", "main:app", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "--host", "0.0.0.0", "--port", "8000"]
```

#### Docker Compose Produção
```yaml
version: '3.8'
services:
  backend:
    build: ./backend
    environment:
      - DATABASE_URL=postgresql://user:pass@db:5432/pulso_finance
    depends_on:
      - db
      - redis

  frontend:
    build: ./frontend
    ports:
      - "80:80"

  db:
    image: postgres:13
    environment:
      POSTGRES_DB: pulso_finance
      POSTGRES_USER: user
      POSTGRES_PASSWORD: pass
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:alpine

volumes:
  postgres_data:
```

---

## 🤝 Contribuição

### Como Contribuir

1. **Fork** o repositório
2. **Crie** uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. **Commit** suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. **Push** para a branch (`git push origin feature/nova-funcionalidade`)
5. **Abra** um Pull Request

### Padrões de Código

#### Python (Backend)
```python
# Usar Black para formatação
black backend/

# Usar Flake8 para linting
flake8 backend/

# Usar isort para imports
isort backend/
```

#### TypeScript (Frontend)
```bash
# Usar Prettier
npm run format

# Usar ESLint
npm run lint

# Verificar tipos
npm run type-check
```

### Testes

```bash
# Backend
cd backend
pytest tests/ -v --cov=src

# Frontend
cd frontend
npm test -- --coverage
```

### Estrutura de Commits

Usar [Conventional Commits](https://www.conventionalcommits.org/):

```
feat: adiciona categorização automática
fix: corrige cálculo de KPIs
docs: atualiza documentação da API
style: ajusta formatação do código
refactor: reestrutura módulo de análise
test: adiciona testes para upload
```

---

## 🗺️ Roadmap

### Versão 1.1 (Q1 2024)
- [ ] **Autenticação de usuários**
- [ ] **Múltiplos workspaces**
- [ ] **API de terceiros** (bancos)
- [ ] **Alertas por email**
- [ ] **Exportação avançada**

### Versão 1.2 (Q2 2024)
- [ ] **Machine Learning** avançado
- [ ] **Previsões financeiras**
- [ ] **Recomendações IA**
- [ ] **Dashboard mobile**
- [ ] **Integração WhatsApp**

### Versão 2.0 (Q3 2024)
- [ ] **Aplicativo mobile**
- [ ] **Blockchain integration**
- [ ] **Crypto analysis**
- [ ] **Multi-currency support**
- [ ] **Advanced reporting**

### Versão 2.1 (Q4 2024)
- [ ] **AI-powered insights**
- [ ] **Voice commands**
- [ ] **Real-time sync**
- [ ] **Enterprise features**
- [ ] **Custom plugins**

---

## 📞 Suporte

### Documentação
- [Wiki do Projeto](https://github.com/seu-usuario/pulso_finance/wiki)
- [FAQ](https://github.com/seu-usuario/pulso_finance/wiki/FAQ)
- [Troubleshooting](https://github.com/seu-usuario/pulso_finance/wiki/Troubleshooting)

### Comunidade
- [Discord](https://discord.gg/pulso-finance)
- [GitHub Discussions](https://github.com/seu-usuario/pulso_finance/discussions)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/pulso-finance)

### Contato
- **Email**: suporte@pulsofinance.com
- **Issue Tracker**: [GitHub Issues](https://github.com/seu-usuario/pulso_finance/issues)
- **Feature Requests**: [GitHub Discussions](https://github.com/seu-usuario/pulso_finance/discussions/categories/ideas)

---

## 📄 Licença

Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para detalhes.

---

**Desenvolvido com ❤️ pela equipe Pulso Finance**

*Última atualização: 14 de outubro de 2025*