import unittest
import pandas as pd
import sys
import os

# Adicionar o caminho do backend ao Python path
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'backend', 'src'))

from financial_analyzer import FinancialAnalyzer

class TestFinancialAnalyzer(unittest.TestCase):
    
    def setUp(self):
        """Configurar dados de teste"""
        self.sample_data = pd.DataFrame({
            'data': pd.to_datetime(['2024-01-01', '2024-01-02', '2024-01-03', '2024-01-04', '2024-01-05']),
            'descricao': ['Salário', 'Supermercado', 'Gasolina', 'Restaurante', 'Freelance'],
            'valor': [3000.00, -250.00, -150.00, -80.00, 500.00],
            'categoria': ['Receita', 'Alimentação', 'Transporte', 'Alimentação', 'Receita']
        })
        self.analyzer = FinancialAnalyzer(self.sample_data)
    
    def test_column_detection(self):
        """Testar detecção automática de colunas"""
        self.assertEqual(self.analyzer.date_column, 'data')
        self.assertEqual(self.analyzer.amount_column, 'valor')
        self.assertEqual(self.analyzer.description_column, 'descricao')
    
    def test_calculate_summary(self):
        """Testar cálculo de resumo financeiro"""
        summary = self.analyzer.calculate_summary()
        
        self.assertEqual(summary['total_receitas'], 3500.00)
        self.assertEqual(summary['total_despesas'], 480.00)
        self.assertEqual(summary['saldo_liquido'], 3020.00)
        self.assertEqual(summary['num_transacoes'], 5)
    
    def test_categorize_transactions(self):
        """Testar categorização automática"""
        # Criar dados sem categoria
        data_without_category = self.sample_data.drop('categoria', axis=1)
        analyzer = FinancialAnalyzer(data_without_category)
        
        result = analyzer.categorize_transactions()
        self.assertIn('categoria', result.columns)
    
    def test_monthly_summary(self):
        """Testar resumo mensal"""
        monthly = self.analyzer.monthly_summary()
        self.assertIn('monthly_totals', monthly)
        self.assertIn('monthly_counts', monthly)
        self.assertIn('monthly_averages', monthly)

if __name__ == '__main__':
    unittest.main()