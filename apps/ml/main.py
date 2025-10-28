"""
🚀 FastAPI ML Server

API REST para serviços de Machine Learning:
- Previsão de receitas/despesas (Prophet)
- Detecção de anomalias
- Análise de tendências
- Fluxo de caixa projetado
"""

from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field
from typing import List, Dict, Optional
from datetime import datetime, timedelta
import os
from dotenv import load_dotenv

# ML Engine
from forecasting.prophet_engine import forecast_financial_series

# Supabase
from supabase import create_client, Client

load_dotenv()

# Configuração
SUPABASE_URL = os.getenv('NEXT_PUBLIC_SUPABASE_URL')
SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY')

if not SUPABASE_URL or not SUPABASE_KEY:
    raise ValueError("Variáveis de ambiente Supabase não configuradas!")

supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)

# FastAPI App
app = FastAPI(
    title="PULSO Finance ML API",
    description="API de Machine Learning para previsões financeiras",
    version="1.0.0"
)

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:3001"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


# Models
class ForecastRequest(BaseModel):
    loja_id: str = Field(..., description="ID da loja")
    periods: int = Field(30, description="Dias para prever", ge=7, le=90)
    tipo: str = Field(..., description="Tipo: receitas, despesas, lucro")
    data_inicio: Optional[str] = Field(None, description="Data inicial (YYYY-MM-DD)")
    data_fim: Optional[str] = Field(None, description="Data final (YYYY-MM-DD)")


class ForecastResponse(BaseModel):
    success: bool
    serie_type: str
    historical_days: int
    forecast_days: int
    forecast: Dict
    trend: Dict
    anomalies: List[Dict]
    model_params: Dict


# Endpoints
@app.get("/")
def root():
    """Health check"""
    return {
        "status": "online",
        "service": "PULSO Finance ML API",
        "version": "1.0.0",
        "endpoints": [
            "/api/ml/forecast/receitas",
            "/api/ml/forecast/despesas",
            "/api/ml/forecast/fluxo-caixa"
        ]
    }


@app.post("/api/ml/forecast/receitas", response_model=ForecastResponse)
async def forecast_receitas(request: ForecastRequest):
    """
    Previsão de receitas futuras usando Prophet
    
    - Busca lançamentos de entrada no Supabase
    - Treina modelo Prophet
    - Retorna previsão + análise de tendência + anomalias
    """
    try:
        # Definir período (padrão: últimos 365 dias)
        data_fim = datetime.now().strftime('%Y-%m-%d')
        data_inicio = (datetime.now() - timedelta(days=365)).strftime('%Y-%m-%d')
        
        if request.data_inicio:
            data_inicio = request.data_inicio
        if request.data_fim:
            data_fim = request.data_fim
        
        # Buscar parcelas pagas de receitas (join com lancamentos)
        query = supabase.table('parcelas') \
            .select('vencimento, valor_pago, data_pagamento, lancamentos!inner(tipo, loja_id, competencia)') \
            .eq('status', 'pago') \
            .eq('lancamentos.tipo', 'receber') \
            .eq('lancamentos.loja_id', request.loja_id) \
            .gte('data_pagamento', data_inicio) \
            .lte('data_pagamento', data_fim) \
            .order('data_pagamento')
        
        response = query.execute()
        
        total_registros = len(response.data) if response.data else 0
        
        if total_registros < 30:
            raise HTTPException(
                status_code=400,
                detail={
                    "error": "dados_insuficientes",
                    "message": f"Dados insuficientes para previsão. Necessário mínimo de 30 dias de histórico.",
                    "encontrado": total_registros,
                    "minimo": 30,
                    "sugestao": "Aguarde mais tempo de operação ou importe dados históricos"
                }
            )
        
        # Preparar dados (usar data_pagamento e valor_pago)
        data = [
            {
                'data': item['data_pagamento'] or item['vencimento'],
                'valor': float(item['valor_pago']) if item['valor_pago'] else 0
            }
            for item in response.data
        ]
        
        # Executar previsão
        result = forecast_financial_series(
            data=data,
            periods=request.periods,
            serie_type='receitas'
        )
        
        if not result['success']:
            raise HTTPException(status_code=500, detail=result.get('error'))
        
        return result
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/ml/forecast/despesas", response_model=ForecastResponse)
async def forecast_despesas(request: ForecastRequest):
    """
    Previsão de despesas futuras usando Prophet
    
    - Busca lançamentos de saída no Supabase
    - Treina modelo Prophet
    - Retorna previsão + análise de tendência + anomalias
    """
    try:
        # Definir período
        data_fim = datetime.now().strftime('%Y-%m-%d')
        data_inicio = (datetime.now() - timedelta(days=365)).strftime('%Y-%m-%d')
        
        if request.data_inicio:
            data_inicio = request.data_inicio
        if request.data_fim:
            data_fim = request.data_fim
        
        # Buscar parcelas pagas de despesas (join com lancamentos)
        query = supabase.table('parcelas') \
            .select('vencimento, valor_pago, data_pagamento, lancamentos!inner(tipo, loja_id, competencia)') \
            .eq('status', 'pago') \
            .eq('lancamentos.tipo', 'pagar') \
            .eq('lancamentos.loja_id', request.loja_id) \
            .gte('data_pagamento', data_inicio) \
            .lte('data_pagamento', data_fim) \
            .order('data_pagamento')
        
        response = query.execute()
        
        total_registros = len(response.data) if response.data else 0
        
        if total_registros < 30:
            raise HTTPException(
                status_code=400,
                detail={
                    "error": "dados_insuficientes",
                    "message": f"Dados insuficientes para previsão de despesas. Necessário mínimo de 30 dias de histórico.",
                    "encontrado": total_registros,
                    "minimo": 30,
                    "sugestao": "Aguarde mais tempo de operação ou importe dados históricos"
                }
            )
        
        # Preparar dados (usar data_pagamento e valor_pago, valores positivos)
        data = [
            {
                'data': item['data_pagamento'] or item['vencimento'],
                'valor': abs(float(item['valor_pago'])) if item['valor_pago'] else 0
            }
            for item in response.data
        ]
        
        # Executar previsão
        result = forecast_financial_series(
            data=data,
            periods=request.periods,
            serie_type='despesas'
        )
        
        if not result['success']:
            raise HTTPException(status_code=500, detail=result.get('error'))
        
        return result
        
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.post("/api/ml/forecast/fluxo-caixa")
async def forecast_fluxo_caixa(request: ForecastRequest):
    """
    Previsão de fluxo de caixa (receitas - despesas)
    
    - Combina previsões de receitas e despesas
    - Calcula saldo projetado
    - Identifica períodos críticos
    """
    try:
        # Prever receitas
        receitas_req = ForecastRequest(
            loja_id=request.loja_id,
            periods=request.periods,
            tipo='receitas',
            data_inicio=request.data_inicio,
            data_fim=request.data_fim
        )
        receitas_result = await forecast_receitas(receitas_req)
        
        # Prever despesas
        despesas_req = ForecastRequest(
            loja_id=request.loja_id,
            periods=request.periods,
            tipo='despesas',
            data_inicio=request.data_inicio,
            data_fim=request.data_fim
        )
        despesas_result = await forecast_despesas(despesas_req)
        
        # Calcular fluxo de caixa
        receitas_forecast = receitas_result['forecast']['predicted']
        despesas_forecast = despesas_result['forecast']['predicted']
        
        fluxo_caixa = [
            round(r - d, 2) 
            for r, d in zip(receitas_forecast, despesas_forecast)
        ]
        
        # Saldo acumulado
        saldo_acumulado = []
        saldo_atual = 0
        for fluxo in fluxo_caixa:
            saldo_atual += fluxo
            saldo_acumulado.append(round(saldo_atual, 2))
        
        # Identificar períodos críticos (saldo negativo)
        periodos_criticos = [
            {
                'date': receitas_result['forecast']['dates'][i],
                'saldo': saldo,
                'deficit': abs(saldo)
            }
            for i, saldo in enumerate(saldo_acumulado)
            if saldo < 0
        ]
        
        return {
            'success': True,
            'loja_id': request.loja_id,
            'periods': request.periods,
            'dates': receitas_result['forecast']['dates'],
            'receitas_previstas': receitas_forecast,
            'despesas_previstas': despesas_forecast,
            'fluxo_caixa_diario': fluxo_caixa,
            'saldo_acumulado': saldo_acumulado,
            'periodos_criticos': periodos_criticos,
            'resumo': {
                'total_receitas': round(sum(receitas_forecast), 2),
                'total_despesas': round(sum(despesas_forecast), 2),
                'saldo_final': round(saldo_acumulado[-1], 2),
                'dias_negativos': len(periodos_criticos),
                'maior_deficit': min(saldo_acumulado) if saldo_acumulado else 0
            }
        }
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@app.get("/api/ml/health")
def health_check():
    """Verifica saúde da API e conexões"""
    try:
        # Testar conexão Supabase
        supabase.table('lojas').select('id').limit(1).execute()
        
        return {
            'status': 'healthy',
            'supabase': 'connected',
            'timestamp': datetime.now().isoformat()
        }
    except Exception as e:
        return {
            'status': 'unhealthy',
            'error': str(e),
            'timestamp': datetime.now().isoformat()
        }


if __name__ == '__main__':
    import uvicorn
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )
