import plotly.graph_objects as go
import plotly.express as px
import pandas as pd
from typing import Dict, Any, List
import json

class ChartGenerator:
    """Gerador de gráficos para análise financeira"""
    
    def __init__(self, dataframe: pd.DataFrame):
        self.df = dataframe
    
    def create_balance_chart(self, amount_column: str) -> Dict[str, Any]:
        """Gráfico de saldo acumulado"""
        if amount_column not in self.df.columns:
            return {}
        
        # Calcular saldo acumulado
        cumulative_balance = self.df[amount_column].cumsum()
        
        fig = go.Figure()
        fig.add_trace(go.Scatter(
            x=list(range(len(cumulative_balance))),
            y=cumulative_balance,
            mode='lines+markers',
            name='Saldo Acumulado',
            line=dict(color='blue', width=2)
        ))
        
        fig.update_layout(
            title='Evolução do Saldo',
            xaxis_title='Transações',
            yaxis_title='Valor (R$)',
            showlegend=True
        )
        
        return json.loads(fig.to_json())
    
    def create_category_pie_chart(self, category_data: Dict[str, float]) -> Dict[str, Any]:
        """Gráfico de pizza por categoria"""
        if not category_data:
            return {}
        
        # Filtrar apenas valores negativos (despesas)
        expenses = {k: abs(v) for k, v in category_data.items() if v < 0}
        
        if not expenses:
            return {}
        
        fig = px.pie(
            values=list(expenses.values()),
            names=list(expenses.keys()),
            title='Distribuição de Despesas por Categoria'
        )
        
        return json.loads(fig.to_json())
    
    def create_monthly_bar_chart(self, monthly_data: Dict[str, float]) -> Dict[str, Any]:
        """Gráfico de barras mensal"""
        if not monthly_data:
            return {}
        
        months = list(monthly_data.keys())
        values = list(monthly_data.values())
        
        fig = go.Figure(data=[
            go.Bar(x=months, y=values, name='Total Mensal')
        ])
        
        fig.update_layout(
            title='Total por Mês',
            xaxis_title='Mês',
            yaxis_title='Valor (R$)'
        )
        
        return json.loads(fig.to_json())
    
    def create_income_expense_chart(self, amount_column: str) -> Dict[str, Any]:
        """Gráfico comparativo receitas vs despesas"""
        if amount_column not in self.df.columns:
            return {}
        
        amounts = pd.to_numeric(self.df[amount_column], errors='coerce')
        
        receitas = amounts[amounts > 0].sum()
        despesas = abs(amounts[amounts < 0].sum())
        
        fig = go.Figure(data=[
            go.Bar(
                x=['Receitas', 'Despesas'],
                y=[receitas, despesas],
                marker_color=['green', 'red']
            )
        ])
        
        fig.update_layout(
            title='Receitas vs Despesas',
            yaxis_title='Valor (R$)'
        )
        
        return json.loads(fig.to_json())
    
    def create_trend_analysis(self, date_column: str, amount_column: str) -> Dict[str, Any]:
        """Análise de tendência temporal"""
        if date_column not in self.df.columns or amount_column not in self.df.columns:
            return {}
        
        # Converter data
        df_temp = self.df.copy()
        df_temp[date_column] = pd.to_datetime(df_temp[date_column], errors='coerce')
        df_temp = df_temp.dropna(subset=[date_column])
        
        # Agrupar por data
        daily_totals = df_temp.groupby(df_temp[date_column].dt.date)[amount_column].sum()
        
        fig = go.Figure()
        fig.add_trace(go.Scatter(
            x=daily_totals.index,
            y=daily_totals.values,
            mode='lines+markers',
            name='Total Diário'
        ))
        
        fig.update_layout(
            title='Tendência Temporal dos Valores',
            xaxis_title='Data',
            yaxis_title='Valor (R$)'
        )
        
        return json.loads(fig.to_json())