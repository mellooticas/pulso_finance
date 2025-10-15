import pandas as pd
import numpy as np
from typing import Dict, List, Any, Optional
from datetime import datetime, timedelta
import re

class FinancialAnalyzer:
    """Classe para análise de dados financeiros"""
    
    def __init__(self, dataframe: pd.DataFrame):
        self.df = dataframe.copy()
        self.date_column = None
        self.amount_column = None
        self.description_column = None
        self._detect_columns()
    
    def _detect_columns(self):
        """Detecta automaticamente as colunas de data, valor e descrição"""
        columns = self.df.columns.str.lower()
        
        # Detectar coluna de data
        date_patterns = ['data', 'date', 'fecha', 'dt']
        for col in self.df.columns:
            if any(pattern in col.lower() for pattern in date_patterns):
                self.date_column = col
                break
        
        # Detectar coluna de valor
        amount_patterns = ['valor', 'amount', 'value', 'montante', 'preco', 'price']
        for col in self.df.columns:
            if any(pattern in col.lower() for pattern in amount_patterns):
                self.amount_column = col
                break
        
        # Detectar coluna de descrição
        desc_patterns = ['descricao', 'description', 'desc', 'historico', 'details']
        for col in self.df.columns:
            if any(pattern in col.lower() for pattern in desc_patterns):
                self.description_column = col
                break
    
    def categorize_transactions(self) -> pd.DataFrame:
        """Categoriza transações automaticamente"""
        if not self.description_column:
            return self.df
        
        categories = {
            'Alimentação': ['mercado', 'supermercado', 'restaurante', 'lanche', 'food', 'ifood'],
            'Transporte': ['uber', 'taxi', 'gasolina', 'combustivel', 'metro', 'onibus'],
            'Saúde': ['farmacia', 'medico', 'hospital', 'clinica', 'consulta'],
            'Educação': ['escola', 'faculdade', 'curso', 'livro', 'educacao'],
            'Entretenimento': ['cinema', 'netflix', 'spotify', 'jogo', 'show'],
            'Casa': ['energia', 'agua', 'gas', 'internet', 'telefone', 'aluguel'],
            'Outros': []
        }
        
        def classify_transaction(description):
            if pd.isna(description):
                return 'Outros'
            
            desc_lower = str(description).lower()
            for category, keywords in categories.items():
                if any(keyword in desc_lower for keyword in keywords):
                    return category
            return 'Outros'
        
        self.df['categoria'] = self.df[self.description_column].apply(classify_transaction)
        return self.df
    
    def calculate_summary(self) -> Dict[str, Any]:
        """Calcula resumo financeiro"""
        if not self.amount_column:
            return {}
        
        # Converter coluna de valor para numérico
        amounts = pd.to_numeric(self.df[self.amount_column], errors='coerce')
        
        positive_amounts = amounts[amounts > 0]
        negative_amounts = amounts[amounts < 0]
        
        summary = {
            'total_receitas': float(positive_amounts.sum()) if len(positive_amounts) > 0 else 0,
            'total_despesas': float(abs(negative_amounts.sum())) if len(negative_amounts) > 0 else 0,
            'saldo_liquido': float(amounts.sum()),
            'num_transacoes': len(self.df),
            'ticket_medio': float(amounts.mean()) if len(amounts) > 0 else 0,
            'maior_receita': float(positive_amounts.max()) if len(positive_amounts) > 0 else 0,
            'maior_despesa': float(abs(negative_amounts.min())) if len(negative_amounts) > 0 else 0
        }
        
        return summary
    
    def monthly_summary(self) -> Dict[str, Any]:
        """Resumo mensal das transações"""
        if not self.date_column or not self.amount_column:
            return {}
        
        # Converter coluna de data
        self.df[self.date_column] = pd.to_datetime(self.df[self.date_column], errors='coerce')
        
        # Agrupar por mês
        monthly = self.df.groupby(self.df[self.date_column].dt.to_period('M'))[self.amount_column].agg([
            'sum', 'count', 'mean'
        ]).round(2)
        
        return {
            'monthly_totals': monthly['sum'].to_dict(),
            'monthly_counts': monthly['count'].to_dict(),
            'monthly_averages': monthly['mean'].to_dict()
        }
    
    def category_summary(self) -> Dict[str, Any]:
        """Resumo por categoria"""
        if 'categoria' not in self.df.columns or not self.amount_column:
            return {}
        
        category_summary = self.df.groupby('categoria')[self.amount_column].agg([
            'sum', 'count', 'mean'
        ]).round(2)
        
        return {
            'totals': category_summary['sum'].to_dict(),
            'counts': category_summary['count'].to_dict(),
            'averages': category_summary['mean'].to_dict()
        }