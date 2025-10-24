# 🔮 PULSO Finance ML API

API de Machine Learning para previsões financeiras usando Facebook Prophet.

## 📦 Instalação

```bash
cd apps/ml
pip install -r requirements.txt
```

## 🚀 Executar

```bash
# Configurar variáveis de ambiente
cp ../../frontend/.env.local .env

# Iniciar servidor
python main.py

# Ou com uvicorn diretamente
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

API estará disponível em: `http://localhost:8000`

## 📚 Documentação

Acesse: `http://localhost:8000/docs` (Swagger UI)

## 🎯 Endpoints

### Health Check
```bash
GET /api/ml/health
```

### Previsão de Receitas
```bash
POST /api/ml/forecast/receitas
Content-Type: application/json

{
  "loja_id": "uuid-da-loja",
  "periods": 30,
  "tipo": "receitas"
}
```

### Previsão de Despesas
```bash
POST /api/ml/forecast/despesas
Content-Type: application/json

{
  "loja_id": "uuid-da-loja",
  "periods": 30,
  "tipo": "despesas"
}
```

### Previsão de Fluxo de Caixa
```bash
POST /api/ml/forecast/fluxo-caixa
Content-Type: application/json

{
  "loja_id": "uuid-da-loja",
  "periods": 30,
  "tipo": "lucro"
}
```

## 📊 Resposta Exemplo

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
  ],
  "model_params": {
    "changepoint_prior_scale": 0.05,
    "seasonality_prior_scale": 10.0,
    "interval_width": 0.95
  }
}
```

## 🛠️ Tecnologias

- **Prophet** - Facebook's forecasting library
- **FastAPI** - Modern web framework
- **Pandas** - Data manipulation
- **NumPy** - Numerical computing
- **Supabase** - Database queries

## 📝 Notas

- Requer mínimo de **30 dias** de dados históricos
- Intervalos de confiança: 95% (padrão)
- Detecção automática de sazonalidade
- Anomalias: valores > 2 desvios padrão
