"""
Script de teste para o Motor de Inteligência Financeira
Simula dados para testar os cálculos sem precisar do Supabase
"""

from datetime import datetime, timedelta
from decimal import Decimal
import json

class MockSupabase:
    """Mock do cliente Supabase para testes"""
    
    def __init__(self):
        self.data_vencimento_base = datetime.now().date()
        
    def table(self, table_name):
        return MockTable(table_name, self.data_vencimento_base)

class MockTable:
    def __init__(self, table_name, data_base):
        self.table_name = table_name
        self.data_base = data_base
        self._filters = {}
        
    def select(self, fields):
        return self
        
    def eq(self, field, value):
        self._filters[field] = value
        return self
        
    def in_(self, field, values):
        self._filters[f"{field}_in"] = values
        return self
        
    def not_(self):
        return self
        
    def is_(self, field, value):
        return self
        
    def gte(self, field, value):
        return self
        
    def lte(self, field, value):
        return self
        
    def execute(self):
        """Retorna dados mockados baseado na tabela"""
        
        if self.table_name == 'parcelas' and self._filters.get('tipo') == 'pagar':
            # Simular parcelas a pagar
            return type('obj', (object,), {
                'data': [
                    # VENCIDA - 30 dias
                    {
                        'id': '1',
                        'valor_parcela': 5000.00,
                        'data_vencimento': (self.data_base - timedelta(days=30)).isoformat(),
                        'status': 'vencido',
                        'tipo': 'pagar',
                        'lancamento': {
                            'descricao': 'Fornecedor Carl Zeiss - Lentes',
                            'fornecedor': {'nome': 'Carl Zeiss Vision'},
                            'loja': {'nome': 'Matriz - Centro'},
                            'plano_conta': {'nome': 'Mercadorias'}
                        }
                    },
                    # VENCIDA - 15 dias
                    {
                        'id': '2',
                        'valor_parcela': 3500.00,
                        'data_vencimento': (self.data_base - timedelta(days=15)).isoformat(),
                        'status': 'vencido',
                        'tipo': 'pagar',
                        'lancamento': {
                            'descricao': 'Hoya - Produtos',
                            'fornecedor': {'nome': 'Optotal Hoya'},
                            'loja': {'nome': 'Shopping'},
                            'plano_conta': {'nome': 'Mercadorias'}
                        }
                    },
                    # VENCE HOJE
                    {
                        'id': '3',
                        'valor_parcela': 2000.00,
                        'data_vencimento': self.data_base.isoformat(),
                        'status': 'pendente',
                        'tipo': 'pagar',
                        'lancamento': {
                            'descricao': 'Aluguel Loja',
                            'fornecedor': {'nome': 'Imobiliária XYZ'},
                            'loja': {'nome': 'Matriz - Centro'},
                            'plano_conta': {'nome': 'Despesas Fixas'}
                        }
                    },
                    # PRÓXIMOS 7 DIAS
                    {
                        'id': '4',
                        'valor_parcela': 1500.00,
                        'data_vencimento': (self.data_base + timedelta(days=5)).isoformat(),
                        'status': 'pendente',
                        'tipo': 'pagar',
                        'lancamento': {
                            'descricao': 'Energia Elétrica',
                            'fornecedor': {'nome': 'Copel'},
                            'loja': {'nome': 'Shopping'},
                            'plano_conta': {'nome': 'Despesas Operacionais'}
                        }
                    },
                    # PRÓXIMOS 30 DIAS
                    {
                        'id': '5',
                        'valor_parcela': 4200.00,
                        'data_vencimento': (self.data_base + timedelta(days=20)).isoformat(),
                        'status': 'pendente',
                        'tipo': 'pagar',
                        'lancamento': {
                            'descricao': 'Fornecedor Solótica',
                            'fornecedor': {'nome': 'Solótica'},
                            'loja': {'nome': 'Matriz - Centro'},
                            'plano_conta': {'nome': 'Mercadorias'}
                        }
                    }
                ]
            })()
            
        elif self.table_name == 'parcelas' and self._filters.get('tipo') == 'receber':
            return type('obj', (object,), {
                'data': [
                    # Cliente inadimplente
                    {
                        'id': '6',
                        'valor_parcela': 850.00,
                        'data_vencimento': (self.data_base - timedelta(days=20)).isoformat(),
                        'status': 'vencido',
                        'tipo': 'receber',
                        'lancamento': {
                            'descricao': 'Venda Cliente João',
                            'loja': {'nome': 'Matriz - Centro'}
                        }
                    }
                ]
            })()
            
        elif self.table_name == 'lancamentos':
            # Lançamentos do mês
            return type('obj', (object,), {
                'data': [
                    # Receita Loja 1
                    {
                        'tipo': 'receber',
                        'valor_total': 45000.00,
                        'loja': {'id': '1', 'nome': 'Matriz - Centro'},
                        'fornecedor': None,
                        'plano_conta': {'codigo': '3.01', 'nome': 'Vendas'}
                    },
                    # Despesa Loja 1
                    {
                        'tipo': 'pagar',
                        'valor_total': 28000.00,
                        'loja': {'id': '1', 'nome': 'Matriz - Centro'},
                        'fornecedor': {'id': '1', 'nome': 'Carl Zeiss Vision', 'categoria': 'PRODUTOS'},
                        'plano_conta': {'codigo': '4.01', 'nome': 'Mercadorias'}
                    },
                    # Receita Loja 2
                    {
                        'tipo': 'receber',
                        'valor_total': 32000.00,
                        'loja': {'id': '2', 'nome': 'Shopping'},
                        'fornecedor': None,
                        'plano_conta': {'codigo': '3.01', 'nome': 'Vendas'}
                    },
                    # Despesa Loja 2
                    {
                        'tipo': 'pagar',
                        'valor_total': 21000.00,
                        'loja': {'id': '2', 'nome': 'Shopping'},
                        'fornecedor': {'id': '2', 'nome': 'Optotal Hoya', 'categoria': 'PRODUTOS'},
                        'plano_conta': {'codigo': '4.01', 'nome': 'Mercadorias'}
                    }
                ]
            })()
            
        return type('obj', (object,), {'data': []})()


def testar_motor_inteligencia():
    """Testa o motor com dados mockados"""
    
    print("=" * 70)
    print("🧪 TESTE DO MOTOR DE INTELIGÊNCIA FINANCEIRA")
    print("=" * 70)
    
    # Importar o engine
    from src.financial_intelligence_engine import FinancialIntelligenceEngine
    
    # Criar mock do Supabase
    mock_supabase = MockSupabase()
    
    # Criar engine
    engine = FinancialIntelligenceEngine(mock_supabase)
    
    print("\n1️⃣ Testando cálculo de juros...")
    print("-" * 70)
    
    # Testar cálculo de juros
    teste_juros = engine.calcular_juros_atraso(Decimal('5000.00'), 30)
    print(f"Valor original: R$ {teste_juros['valor_original']:.2f}")
    print(f"Dias de atraso: {teste_juros['dias_atraso']}")
    print(f"Multa (2%): R$ {teste_juros['multa']:.2f}")
    print(f"Juros (1% a.m.): R$ {teste_juros['juros']:.2f}")
    print(f"Total com acréscimos: R$ {teste_juros['total']:.2f}")
    print(f"Acréscimo: {teste_juros['percentual_acrescimo']:.2f}%")
    
    print("\n2️⃣ Testando processamento de contas a pagar...")
    print("-" * 70)
    
    contas_pagar = engine.processar_contas_a_pagar()
    
    print(f"\n📊 RESUMO:")
    print(f"   Contas vencidas: {contas_pagar['resumo']['num_vencidas']}")
    print(f"   Total vencido: R$ {contas_pagar['resumo']['total_vencido']:.2f}")
    print(f"   Juros acumulados: R$ {contas_pagar['resumo']['total_juros_acumulado']:.2f}")
    print(f"   Vence hoje: {contas_pagar['resumo']['num_vence_hoje']}")
    print(f"   Total vence hoje: R$ {contas_pagar['resumo']['total_vence_hoje']:.2f}")
    
    print(f"\n🚨 CONTAS VENCIDAS (top prioridades):")
    for conta in contas_pagar['acoes_urgentes']['vencidas'][:3]:
        print(f"   • {conta['descricao']}")
        print(f"     Valor original: R$ {conta['valor_original']:.2f} | Total: R$ {conta['total']:.2f}")
        print(f"     {conta['acao']}")
    
    print(f"\n💰 VENCE HOJE:")
    for conta in contas_pagar['acoes_urgentes']['vence_hoje']:
        print(f"   • {conta['descricao']} - R$ {conta['valor_original']:.2f}")
        print(f"     {conta['acao']}")
    
    print("\n3️⃣ Testando análise por centro de custo...")
    print("-" * 70)
    
    centro_custo = engine.analise_por_centro_custo()
    
    print(f"\n🏪 RANKING DE LOJAS:")
    for idx, loja in enumerate(centro_custo['por_loja']['ranking'], 1):
        print(f"   {idx}. {loja['loja']}")
        print(f"      Receitas: R$ {loja['receitas']:.2f}")
        print(f"      Despesas: R$ {loja['despesas']:.2f}")
        print(f"      Resultado: R$ {loja['resultado']:.2f}")
    
    if centro_custo['por_loja']['melhor']:
        melhor = centro_custo['por_loja']['melhor']
        print(f"\n⭐ MELHOR LOJA: {melhor[0]}")
        print(f"   Lucro: R$ {melhor[1]['resultado']:.2f}")
    
    print(f"\n💼 TOP FORNECEDORES:")
    for idx, forn in enumerate(centro_custo['por_fornecedor']['top_10_gastos'], 1):
        print(f"   {idx}. {forn['fornecedor']}: R$ {forn['total_gasto']:.2f} ({forn['categoria']})")
    
    print("\n4️⃣ Gerando decisões completas...")
    print("-" * 70)
    
    decisoes = engine.gerar_decisoes_hoje()
    
    print(f"\n🎯 CENTRAL DE DECISÕES - {decisoes['data_analise']}")
    
    if decisoes['alertas_criticos']:
        print(f"\n🚨 ALERTAS CRÍTICOS:")
        for alerta in decisoes['alertas_criticos']:
            print(f"   {alerta['mensagem']}")
            print(f"   Ação: {alerta['acao']}")
    
    if decisoes['acoes_hoje']:
        print(f"\n💼 AÇÕES PARA HOJE:")
        for acao in decisoes['acoes_hoje']:
            print(f"   {acao['mensagem']}")
    
    if decisoes['insights']:
        print(f"\n💡 INSIGHTS:")
        for insight in decisoes['insights']:
            print(f"   {insight['mensagem']}")
    
    # Salvar resultado
    output_file = 'test_decisoes_mock.json'
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(decisoes, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Resultado completo salvo em: {output_file}")
    print("=" * 70)
    print("🎉 TESTE CONCLUÍDO COM SUCESSO!")
    print("=" * 70)


if __name__ == "__main__":
    testar_motor_inteligencia()
