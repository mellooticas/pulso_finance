# 🔮 PREVISÕES FINANCEIRAS COM ML - GUIA COMPLETO

## ✅ STATUS: IMPLEMENTADO

Sistema de previsão financeira usando **Facebook Prophet** + **FastAPI** + **React**.

---

## 📦 O QUE FOI IMPLEMENTADO

### Backend Python (FastAPI + Prophet)
1. **Prophet Engine** (`apps/ml/forecasting/prophet_engine.py`) - 300 linhas
   - Classe `FinancialForecaster` com Prophet
   - Preparação de dados (agregação diária)
   - Treinamento e previsão
   - Detecção de sazonalidade automática
   - Análise de tendências
   - Detecção de anomalias (2 desvios padrão)

2. **FastAPI Server** (`apps/ml/main.py`) - 350 linhas
   - 4 endpoints REST
   - Integração com Supabase
   - CORS configurado
   - Validação com Pydantic

3. **Endpoints Disponíveis:**
   - `POST /api/ml/forecast/receitas` - Previsão de receitas
   - `POST /api/ml/forecast/despesas` - Previsão de despesas
   - `POST /api/ml/forecast/fluxo-caixa` - Projeção de caixa
   - `GET /api/ml/health` - Health check

### Frontend React (Next.js)
1. **Página de Previsões** (`frontend/src/app/dashboard/previsoes/page.tsx`) - 700 linhas
   - 4 cards de resumo
   - Tabs: Receitas / Despesas / Fluxo / Anomalias
   - Visualização de previsões
   - Alertas de períodos críticos
   - Tabelas interativas

2. **Features UI:**
   - Seletor de período (7, 15, 30, 60, 90 dias)
   - Botão de atualização
   - Loading states
   - Tratamento de erros
   - Formatação de moeda/data

---

## 🚀 COMO INSTALAR

### 1. Instalar Dependências Python

```bash
cd apps/ml
pip install -r requirements.txt
```

**Pacotes instalados:**
- prophet==1.1.5
- pandas==2.2.0
- numpy==1.26.4
- scikit-learn==1.4.0
- fastapi==0.109.2
- uvicorn[standard]==0.27.1
- supabase==2.3.4
- python-dotenv==1.0.1

### 2. Configurar Variáveis de Ambiente

Crie `apps/ml/.env`:

```bash
# Copiar do frontend
NEXT_PUBLIC_SUPABASE_URL=https://xocjltqzaojqzdpnajfo.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-anon-key

# Service Role Key (necessário para queries diretas)
SUPABASE_SERVICE_ROLE_KEY=sua-service-role-key
```

**Como obter Service Role Key:**
1. Acesse: https://supabase.com/dashboard/project/xocjltqzaojqzdpnajfo/settings/api
2. Copie: "service_role" key (⚠️ NUNCA exponha no frontend)

### 3. Iniciar API ML

```bash
cd apps/ml
python main.py
```

API rodará em: `http://localhost:8000`

**Verificar saúde:**
```bash
curl http://localhost:8000/api/ml/health
```

### 4. Testar Previsão

```bash
curl -X POST http://localhost:8000/api/ml/forecast/receitas \
  -H "Content-Type: application/json" \
  -d '{
    "loja_id": "7bc97a80-8f17-4f76-94ce-5a1eb2da5b8e",
    "periods": 30,
    "tipo": "receitas"
  }'
```

---

## 📊 COMO USAR NO FRONTEND

### 1. Iniciar Dev Server

```bash
cd frontend
npm run dev
```

### 2. Acessar Previsões

Navegue para: **Dashboard → Relatórios → 🔮 Previsões ML**

Ou direto: `http://localhost:3000/dashboard/previsoes`

### 3. Visualizar Dados

**Tabs disponíveis:**
1. **Receitas** - Previsão de entradas futuras
2. **Despesas** - Previsão de saídas futuras
3. **Fluxo de Caixa** - Receitas - Despesas (saldo projetado)
4. **Anomalias** - Detecção de valores atípicos no histórico

**Seletor de período:**
- 7 dias
- 15 dias
- 30 dias (padrão)
- 60 dias
- 90 dias

---

## 🧪 TESTANDO COM DADOS REAIS

### Requisitos Mínimos
- **30 dias** de lançamentos no banco
- Lançamentos com `status = PAGO` ou `RECEBIDO`
- `data_competencia` preenchida
- `valor_pago` > 0

### Verificar Dados Disponíveis

```sql
-- Quantidade de receitas
SELECT COUNT(*), 
       MIN(data_competencia) as inicio,
       MAX(data_competencia) as fim
FROM lancamentos
WHERE loja_id = '7bc97a80-8f17-4f76-94ce-5a1eb2da5b8e'
  AND tipo = 'ENTRADA'
  AND status IN ('PAGO', 'RECEBIDO');

-- Quantidade de despesas
SELECT COUNT(*), 
       MIN(data_competencia) as inicio,
       MAX(data_competencia) as fim
FROM lancamentos
WHERE loja_id = '7bc97a80-8f17-4f76-94ce-5a1eb2da5b8e'
  AND tipo = 'SAIDA'
  AND status = 'PAGO';
```

---

## 📈 EXEMPLOS DE RESPOSTA

### Previsão de Receitas

```json
{
  "success": true,
  "serie_type": "receitas",
  "historical_days": 365,
  "forecast_days": 30,
  "forecast": {
    "dates": ["2025-10-24", "2025-10-25", ...],
    "predicted": [12500.50, 13200.30, ...],
    "lower_bound": [10000.00, 10500.00, ...],
    "upper_bound": [15000.00, 15900.00, ...],
    "trend": [12000.00, 12100.00, ...],
    "yearly": [500.00, 600.00, ...]
  },
  "trend": {
    "trend_direction": "crescente",
    "trend_change_percent": 5.2,
    "avg_next_30_days": 12850.75,
    "min_predicted": 11200.00,
    "max_predicted": 14500.00
  },
  "anomalies": [
    {
      "date": "2025-01-15",
      "actual": 25000.00,
      "expected": 12000.00,
      "deviation": 13000.00,
      "severity": "alta"
    }
  ]
}
```

### Fluxo de Caixa

```json
{
  "success": true,
  "dates": ["2025-10-24", ...],
  "receitas_previstas": [12500, ...],
  "despesas_previstas": [8000, ...],
  "fluxo_caixa_diario": [4500, ...],
  "saldo_acumulado": [4500, 9000, ...],
  "periodos_criticos": [
    {
      "date": "2025-11-05",
      "saldo": -1500.00,
      "deficit": 1500.00
    }
  ],
  "resumo": {
    "total_receitas": 375000.00,
    "total_despesas": 240000.00,
    "saldo_final": 135000.00,
    "dias_negativos": 3,
    "maior_deficit": -2500.00
  }
}
```

---

## 🔧 CONFIGURAÇÕES AVANÇADAS

### Ajustar Sensibilidade do Prophet

Edite `apps/ml/forecasting/prophet_engine.py`:

```python
forecaster = FinancialForecaster(
    changepoint_prior_scale=0.05,  # 0.001-0.5 (padrão: 0.05)
    # Menor valor = tendência mais suave
    # Maior valor = mais flexível a mudanças
    
    seasonality_prior_scale=10.0,  # 0.01-10 (padrão: 10.0)
    # Controla força da sazonalidade
    
    yearly_seasonality=True,  # Detectar padrões anuais
    weekly_seasonality=False,  # Detectar padrões semanais
    daily_seasonality=False    # Detectar padrões diários
)
```

### Ajustar Detecção de Anomalias

```python
def detect_anomalies(self, df, forecast, threshold=2.0):
    # threshold = desvios padrão
    # 2.0 = ~95% dos dados (padrão)
    # 3.0 = ~99.7% (mais conservador)
    # 1.5 = ~86% (mais sensível)
```

### CORS (adicionar origens)

Edite `apps/ml/main.py`:

```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "https://seu-dominio.com"  # Adicionar produção
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

## 🐛 TROUBLESHOOTING

### Erro: "Dados insuficientes"

**Problema:** Menos de 30 dias de histórico  
**Solução:** 
1. Verifique query SQL acima
2. Adicione mais lançamentos no banco
3. Ou reduza período: `data_inicio` na request

### Erro: "Can't connect to Supabase"

**Problema:** Service Role Key inválida  
**Solução:**
1. Verifique `apps/ml/.env`
2. Confirme que SUPABASE_SERVICE_ROLE_KEY está correto
3. Teste: `curl http://localhost:8000/api/ml/health`

### Erro: "ModuleNotFoundError: No module named 'prophet'"

**Problema:** Dependências não instaladas  
**Solução:**
```bash
cd apps/ml
pip install -r requirements.txt
```

### API ML não está rodando

**Verificar:**
```bash
# Windows
netstat -ano | findstr :8000

# Linux/Mac
lsof -i :8000
```

**Iniciar manualmente:**
```bash
cd apps/ml
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### Frontend não conecta com API

**Problema:** CORS bloqueado  
**Solução:**
1. Verifique se API está em `localhost:8000`
2. Confirme que CORS está configurado
3. Veja console do navegador (F12)

---

## 📚 PRÓXIMAS MELHORIAS

### Curto Prazo (Sprint 2 - Fase 2)
- [ ] Gráficos interativos com Chart.js
- [ ] Exportação para CSV/PDF
- [ ] Comparação: Previsto vs Real
- [ ] Alertas automáticos (e-mail/push)

### Médio Prazo
- [ ] Multi-lojas (seletor de loja)
- [ ] Histórico de previsões
- [ ] Métricas de acurácia (MAPE, RMSE)
- [ ] Retraining automático
- [ ] Cache de previsões

### Longo Prazo
- [ ] Modelos alternativos (ARIMA, LSTM)
- [ ] Ensemble de modelos
- [ ] Previsão por categoria
- [ ] Previsão por centro de custo
- [ ] Análise de cenários (otimista/pessimista)

---

## 🎯 MÉTRICAS DE SUCESSO

### Performance
- **Tempo de resposta:** < 5s para 365 dias
- **Acurácia:** MAPE < 15%
- **Cobertura:** Intervalos de confiança 95%

### Usabilidade
- **Facilidade:** Sem configuração manual
- **Visualização:** Gráficos claros
- **Alertas:** Notificação de períodos críticos

---

## 📞 SUPORTE

### Links Úteis
- **Prophet Docs:** https://facebook.github.io/prophet/
- **FastAPI Docs:** https://fastapi.tiangolo.com/
- **Swagger UI:** http://localhost:8000/docs

### Logs
```bash
# Ver logs da API
cd apps/ml
python main.py

# Logs aparecem no console
```

---

## ✅ CHECKLIST DE VALIDAÇÃO

- [ ] API ML rodando em `localhost:8000`
- [ ] Health check retorna `{"status": "healthy"}`
- [ ] Frontend acessível em `localhost:3000`
- [ ] Página `/dashboard/previsoes` carrega
- [ ] Cards de resumo exibem valores
- [ ] Tabelas mostram previsões
- [ ] Anomalias são detectadas
- [ ] Fluxo de caixa calcula corretamente
- [ ] Sem erros no console

---

**🎉 Previsões ML Implementadas com Sucesso!**

**Arquivos Criados:**
- `apps/ml/forecasting/prophet_engine.py` (300 linhas)
- `apps/ml/main.py` (350 linhas)
- `apps/ml/requirements.txt` (15 linhas)
- `frontend/src/app/dashboard/previsoes/page.tsx` (700 linhas)
- Total: **~1,365 linhas de código**

**Tecnologias:**
- Facebook Prophet (ML)
- FastAPI (API)
- React + Next.js (UI)
- Supabase (Dados)
- TypeScript (Type Safety)
