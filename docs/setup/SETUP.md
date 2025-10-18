# 🔧 Guia de Instalação e Execução - Pulso Finance

## 📋 Pré-requisitos

- **Python 3.9+** instalado
- **Node.js 16+** instalado
- **Git** instalado

## ⚡ Instalação Rápida

### 1. Clone o Repositório
```bash
git clone https://github.com/seu-usuario/pulso_finance.git
cd pulso_finance
```

### 2. Configure o Backend
```bash
# Navegar para o backend
cd backend

# Criar ambiente virtual
python -m venv venv

# Ativar ambiente virtual
# Windows:
venv\Scripts\activate
# Linux/Mac:
source venv/bin/activate

# Instalar dependências
pip install -r requirements.txt

# Executar servidor
python main.py
```

O backend estará disponível em: `http://localhost:8000`

### 3. Configure o Frontend (em outro terminal)
```bash
# Navegar para o frontend
cd frontend

# Instalar dependências
npm install

# Executar aplicação
npm start
```

O frontend estará disponível em: `http://localhost:3000`

## 📊 Testando com Dados de Exemplo

1. Acesse `http://localhost:3000`
2. Vá para a seção "Upload"
3. Faça upload do arquivo `data/exemplo_financeiro.csv`
4. Visualize os resultados no dashboard

## 🐳 Executar com Docker

```bash
# Executar todos os serviços
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar serviços
docker-compose down
```

## 📓 Jupyter Notebooks

Para explorar os notebooks de análise:

```bash
# Instalar Jupyter (se não tiver)
pip install jupyter

# Executar Jupyter
jupyter notebook notebooks/

# Abrir o notebook: analise_financeira_inicial.ipynb
```

## 🔍 Endpoints da API

- **Health Check**: `GET http://localhost:8000/health`
- **Upload Excel**: `POST http://localhost:8000/upload/excel`
- **Upload CSV**: `POST http://localhost:8000/upload/csv`
- **Documentação**: `http://localhost:8000/docs`

## 📁 Estrutura dos Dados

### Formato CSV Esperado:
```csv
data,descricao,valor,categoria
2024-01-15,Supermercado Extra,-250.00,Alimentação
2024-01-16,Salário,3500.00,Receita
```

### Campos Obrigatórios:
- **data**: Data da transação (YYYY-MM-DD)
- **descricao**: Descrição da transação
- **valor**: Valor (positivo para receitas, negativo para despesas)
- **categoria**: Categoria da transação (opcional, será categorizado automaticamente)

## 🚨 Solução de Problemas

### Erro: "ModuleNotFoundError"
```bash
# Certifique-se de que o ambiente virtual está ativado
# Reinstale as dependências
pip install -r backend/requirements.txt
```

### Erro: "Port already in use"
```bash
# Verificar processos usando a porta
lsof -i :8000  # Linux/Mac
netstat -ano | findstr :8000  # Windows

# Parar processo ou usar outra porta
uvicorn main:app --port 8001
```

### Frontend não carrega
```bash
# Limpar cache do npm
npm cache clean --force

# Reinstalar dependências
rm -rf node_modules package-lock.json
npm install
```

## 📚 Próximos Passos

1. **Explore o notebook**: `notebooks/analise_financeira_inicial.ipynb`
2. **Teste a API**: Visite `http://localhost:8000/docs`
3. **Carregue seus dados**: Use a interface web para upload
4. **Personalize**: Modifique categorias e regras de negócio

## 🎯 Features Principais

✅ **Upload de arquivos** Excel/CSV  
✅ **Análise automática** de dados financeiros  
✅ **Categorização inteligente** de transações  
✅ **Dashboard interativo** com gráficos  
✅ **Detecção de anomalias** e outliers  
✅ **Cálculo de KPIs** financeiros  
✅ **Exportação de relatórios** em múltiplos formatos  

---

**🎉 Pronto! Seu sistema Pulso Finance está funcionando!**

Para mais informações, consulte a [documentação completa](docs/DOCUMENTATION.md).