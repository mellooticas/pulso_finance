"""
🔮 Prophet Forecasting Engine

Motor de previsão de séries temporais financeiras usando Facebook Prophet.

Features:
- Previsão de receitas e despesas
- Detecção automática de sazonalidade
- Intervalos de confiança (80%, 95%)
- Análise de tendências
- Detecção de anomalias históricas
"""

import pandas as pd
import numpy as np
from prophet import Prophet
from datetime import datetime, timedelta
from typing import Dict, List, Tuple, Optional
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class FinancialForecaster:
    """
    Previsão de séries temporais financeiras com Prophet
    """
    
    def __init__(self, 
                 changepoint_prior_scale: float = 0.05,
                 seasonality_prior_scale: float = 10.0,
                 holidays_prior_scale: float = 10.0,
                 yearly_seasonality: bool = True,
                 weekly_seasonality: bool = False,
                 daily_seasonality: bool = False):
        """
        Inicializa o forecaster com parâmetros do Prophet
        
        Args:
            changepoint_prior_scale: Flexibilidade da tendência (0.001-0.5)
            seasonality_prior_scale: Força da sazonalidade (0.01-10)
            holidays_prior_scale: Impacto de feriados
            yearly_seasonality: Detectar padrões anuais
            weekly_seasonality: Detectar padrões semanais
            daily_seasonality: Detectar padrões diários
        """
        self.model = Prophet(
            changepoint_prior_scale=changepoint_prior_scale,
            seasonality_prior_scale=seasonality_prior_scale,
            holidays_prior_scale=holidays_prior_scale,
            yearly_seasonality=yearly_seasonality,
            weekly_seasonality=weekly_seasonality,
            daily_seasonality=daily_seasonality,
            interval_width=0.95  # 95% de confiança
        )
        self.is_fitted = False
        
    def prepare_data(self, 
                     data: List[Dict], 
                     date_column: str = 'data',
                     value_column: str = 'valor') -> pd.DataFrame:
        """
        Prepara dados para o Prophet (formato: ds, y)
        
        Args:
            data: Lista de dicionários com dados históricos
            date_column: Nome da coluna de data
            value_column: Nome da coluna de valor
            
        Returns:
            DataFrame no formato Prophet (ds, y)
        """
        df = pd.DataFrame(data)
        
        # Converter para datetime
        df['ds'] = pd.to_datetime(df[date_column])
        df['y'] = df[value_column].astype(float)
        
        # Agregar por dia (soma de transações do mesmo dia)
        df_agg = df.groupby('ds')['y'].sum().reset_index()
        
        # Preencher dias faltantes com 0
        date_range = pd.date_range(
            start=df_agg['ds'].min(),
            end=df_agg['ds'].max(),
            freq='D'
        )
        df_full = pd.DataFrame({'ds': date_range})
        df_full = df_full.merge(df_agg, on='ds', how='left')
        df_full['y'] = df_full['y'].fillna(0)
        
        logger.info(f"Dados preparados: {len(df_full)} dias, "
                   f"{df_full['ds'].min()} a {df_full['ds'].max()}")
        
        return df_full
    
    def fit(self, df: pd.DataFrame) -> None:
        """
        Treina o modelo Prophet com dados históricos
        
        Args:
            df: DataFrame com colunas 'ds' (datetime) e 'y' (float)
        """
        logger.info("Iniciando treinamento do modelo Prophet...")
        self.model.fit(df)
        self.is_fitted = True
        logger.info("✅ Modelo treinado com sucesso!")
        
    def predict(self, periods: int = 30) -> pd.DataFrame:
        """
        Gera previsões para os próximos N dias
        
        Args:
            periods: Número de dias para prever
            
        Returns:
            DataFrame com previsões (ds, yhat, yhat_lower, yhat_upper)
        """
        if not self.is_fitted:
            raise ValueError("Modelo não treinado. Execute fit() primeiro.")
        
        # Criar dataframe com datas futuras
        future = self.model.make_future_dataframe(periods=periods)
        
        # Prever
        forecast = self.model.predict(future)
        
        logger.info(f"Previsão gerada para {periods} dias")
        
        return forecast
    
    def get_forecast_summary(self, 
                            forecast: pd.DataFrame,
                            include_history: bool = False) -> Dict:
        """
        Extrai resumo da previsão em formato JSON
        
        Args:
            forecast: DataFrame com previsões do Prophet
            include_history: Incluir dados históricos
            
        Returns:
            Dicionário com previsões formatadas
        """
        if include_history:
            df = forecast.tail(90)  # Últimos 90 dias
        else:
            df = forecast[forecast['ds'] > datetime.now()]
        
        return {
            'dates': df['ds'].dt.strftime('%Y-%m-%d').tolist(),
            'predicted': df['yhat'].round(2).tolist(),
            'lower_bound': df['yhat_lower'].round(2).tolist(),
            'upper_bound': df['yhat_upper'].round(2).tolist(),
            'trend': df['trend'].round(2).tolist() if 'trend' in df.columns else None,
            'yearly': df['yearly'].round(2).tolist() if 'yearly' in df.columns else None,
        }
    
    def analyze_trend(self, forecast: pd.DataFrame) -> Dict:
        """
        Analisa tendência da série temporal
        
        Args:
            forecast: DataFrame com previsões
            
        Returns:
            Análise de tendência
        """
        future_forecast = forecast[forecast['ds'] > datetime.now()].head(30)
        
        trend_start = future_forecast['trend'].iloc[0]
        trend_end = future_forecast['trend'].iloc[-1]
        trend_change = ((trend_end - trend_start) / trend_start) * 100
        
        avg_predicted = future_forecast['yhat'].mean()
        
        return {
            'trend_direction': 'crescente' if trend_change > 0 else 'decrescente',
            'trend_change_percent': round(trend_change, 2),
            'avg_next_30_days': round(avg_predicted, 2),
            'min_predicted': round(future_forecast['yhat'].min(), 2),
            'max_predicted': round(future_forecast['yhat'].max(), 2),
        }
    
    def detect_anomalies(self, 
                        df: pd.DataFrame,
                        forecast: pd.DataFrame,
                        threshold: float = 2.0) -> List[Dict]:
        """
        Detecta anomalias em dados históricos
        
        Args:
            df: Dados históricos (ds, y)
            forecast: Previsões do Prophet
            threshold: Desvios padrão para considerar anomalia
            
        Returns:
            Lista de anomalias detectadas
        """
        # Merge histórico com previsões
        merged = df.merge(
            forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']], 
            on='ds', 
            how='left'
        )
        
        # Calcular resíduos
        merged['residual'] = merged['y'] - merged['yhat']
        merged['abs_residual'] = merged['residual'].abs()
        
        # Desvio padrão dos resíduos
        std_residual = merged['residual'].std()
        
        # Detectar anomalias (valores fora de N desvios padrão)
        anomalies = merged[merged['abs_residual'] > (threshold * std_residual)]
        
        return [
            {
                'date': row['ds'].strftime('%Y-%m-%d'),
                'actual': round(row['y'], 2),
                'expected': round(row['yhat'], 2),
                'deviation': round(row['residual'], 2),
                'severity': 'alta' if row['abs_residual'] > (3 * std_residual) else 'média'
            }
            for _, row in anomalies.iterrows()
        ]


def forecast_financial_series(
    data: List[Dict],
    periods: int = 30,
    serie_type: str = 'receitas'
) -> Dict:
    """
    Pipeline completo de previsão financeira
    
    Args:
        data: Dados históricos [{data: '2024-01-01', valor: 1000}, ...]
        periods: Dias para prever
        serie_type: Tipo ('receitas', 'despesas', 'lucro')
        
    Returns:
        Previsão completa com análises
    """
    try:
        # Inicializar forecaster
        forecaster = FinancialForecaster(
            changepoint_prior_scale=0.05,
            seasonality_prior_scale=10.0
        )
        
        # Preparar dados
        df = forecaster.prepare_data(data)
        
        # Treinar modelo
        forecaster.fit(df)
        
        # Prever
        forecast = forecaster.predict(periods=periods)
        
        # Extrair resumos
        forecast_summary = forecaster.get_forecast_summary(forecast, include_history=True)
        trend_analysis = forecaster.analyze_trend(forecast)
        anomalies = forecaster.detect_anomalies(df, forecast)
        
        return {
            'success': True,
            'serie_type': serie_type,
            'historical_days': len(df),
            'forecast_days': periods,
            'forecast': forecast_summary,
            'trend': trend_analysis,
            'anomalies': anomalies[:10],  # Top 10 anomalias
            'model_params': {
                'changepoint_prior_scale': 0.05,
                'seasonality_prior_scale': 10.0,
                'interval_width': 0.95
            }
        }
        
    except Exception as e:
        logger.error(f"Erro no forecasting: {str(e)}")
        return {
            'success': False,
            'error': str(e)
        }


if __name__ == '__main__':
    # Teste com dados sintéticos
    from datetime import datetime, timedelta
    
    # Gerar dados de exemplo
    start_date = datetime.now() - timedelta(days=365)
    test_data = [
        {
            'data': (start_date + timedelta(days=i)).strftime('%Y-%m-%d'),
            'valor': 10000 + np.random.normal(0, 2000) + (5000 * np.sin(i / 30))
        }
        for i in range(365)
    ]
    
    # Executar previsão
    result = forecast_financial_series(test_data, periods=30, serie_type='receitas')
    
    print("\n📊 RESULTADO DO FORECAST:")
    print(f"Sucesso: {result['success']}")
    print(f"Dias históricos: {result['historical_days']}")
    print(f"Tendência: {result['trend']['trend_direction']} "
          f"({result['trend']['trend_change_percent']}%)")
    print(f"Anomalias detectadas: {len(result['anomalies'])}")
