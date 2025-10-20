'use client'

import { useState } from 'react'
import { useLancamentosStats, useLancamentosEvoluçaoMensal } from '@/hooks/use-lancamentos'
import { useDRE } from '@/hooks/use-dre'
import { useLojas } from '@/hooks/use-lojas'
import { useCentrosCusto } from '@/hooks/use-centros-custo'
import { Card } from '@/components/ui/card'
import {
  CalendarIcon,
  BuildingStorefrontIcon,
  ChartPieIcon,
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon,
  CurrencyDollarIcon,
  CalculatorIcon,
  PresentationChartLineIcon,
  ArrowPathIcon
} from '@heroicons/react/24/outline'
import {
  Chart as ChartJS,
  ArcElement,
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js'
import { Pie, Bar, Line, Doughnut } from 'react-chartjs-2'

ChartJS.register(
  ArcElement,
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend
)

interface IndicadorFinanceiro {
  nome: string
  valor: number
  formato: 'currency' | 'percentage' | 'number'
  tendencia: 'up' | 'down' | 'stable'
  descricao: string
}

export default function AnaliseFinanceiraPage() {
  const [periodo, setPeriodo] = useState(() => {
    const now = new Date()
    const currentYear = now.getFullYear()
    const currentMonth = now.getMonth() + 1
    
    return {
      inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
      fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
    }
  })
  
  const [lojaFiltro, setLojaFiltro] = useState<string>('')
  const [centroCustoFiltro, setCentroCustoFiltro] = useState<string>('')
  const [tipoAnalise, setTipoAnalise] = useState<'rentabilidade' | 'liquidez' | 'endividamento' | 'atividade'>('rentabilidade')

  // Hooks de dados
  const { data: lojas } = useLojas()
  const { data: centrosCusto } = useCentrosCusto()
  const { data: statsAtual } = useLancamentosStats({
    data_inicio: periodo.inicio,
    data_fim: periodo.fim,
    loja_id: lojaFiltro || undefined,
    centro_custo_id: centroCustoFiltro || undefined
  })
  const { data: evolucao } = useLancamentosEvoluçaoMensal(new Date().getFullYear())
  const { data: dre } = useDRE({
    periodo,
    lojaId: lojaFiltro || undefined,
    centroCustoId: centroCustoFiltro || undefined
  })

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value || 0)
  }

  const formatPercentage = (value: number) => {
    return `${value.toFixed(2).replace('.', ',')}%`
  }

  // Calcular indicadores financeiros
  const indicadores: IndicadorFinanceiro[] = [
    {
      nome: 'Margem Bruta',
      valor: statsAtual ? ((statsAtual.totalReceitas - 0) / statsAtual.totalReceitas * 100) : 0,
      formato: 'percentage',
      tendencia: 'up',
      descricao: 'Receita líquida menos custos diretos'
    },
    {
      nome: 'Margem Líquida',
      valor: statsAtual ? ((statsAtual.totalReceitas - statsAtual.totalDespesas) / statsAtual.totalReceitas * 100) : 0,
      formato: 'percentage',
      tendencia: statsAtual && statsAtual.resultado > 0 ? 'up' : 'down',
      descricao: 'Percentual de lucro sobre as receitas'
    },
    {
      nome: 'ROI',
      valor: 15.5,
      formato: 'percentage',
      tendencia: 'up',
      descricao: 'Retorno sobre o investimento'
    },
    {
      nome: 'Break Even',
      valor: statsAtual ? (statsAtual.totalDespesas / (statsAtual.totalReceitas / 30)) : 0,
      formato: 'number',
      tendencia: 'stable',
      descricao: 'Dias para atingir ponto de equilíbrio'
    }
  ]

  // Dados para gráfico de distribuição de receitas
  const receitasData = {
    labels: ['Vendas à Vista', 'Vendas a Prazo', 'Serviços', 'Outras Receitas'],
    datasets: [
      {
        data: [65, 20, 10, 5],
        backgroundColor: [
          '#10B981',
          '#3B82F6',
          '#8B5CF6',
          '#F59E0B'
        ],
        borderWidth: 2,
        borderColor: '#fff'
      }
    ]
  }

  // Dados para gráfico de distribuição de despesas
  const despesasData = {
    labels: ['Pessoal', 'Aluguel', 'Marketing', 'Operacionais', 'Outras'],
    datasets: [
      {
        data: [40, 25, 15, 12, 8],
        backgroundColor: [
          '#EF4444',
          '#F97316',
          '#EAB308',
          '#84CC16',
          '#6B7280'
        ],
        borderWidth: 2,
        borderColor: '#fff'
      }
    ]
  }

  // Dados para evolução de margens
  const margensData = evolucao ? {
    labels: evolucao.map(item => item.nome),
    datasets: [
      {
        label: 'Margem Bruta (%)',
        data: evolucao.map(item => 
          item.receitas ? ((item.receitas - 0) / item.receitas * 100) : 0
        ),
        borderColor: 'rgb(59, 130, 246)',
        backgroundColor: 'rgba(59, 130, 246, 0.1)',
        tension: 0.4
      },
      {
        label: 'Margem Líquida (%)',
        data: evolucao.map(item => 
          item.receitas ? (item.resultado / item.receitas * 100) : 0
        ),
        borderColor: 'rgb(16, 185, 129)',
        backgroundColor: 'rgba(16, 185, 129, 0.1)',
        tension: 0.4
      }
    ]
  } : null

  const chartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top' as const,
      }
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="sm:flex sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Análise Financeira
          </h1>
          <p className="mt-2 text-gray-600">
            Indicadores e análises detalhadas da performance financeira
          </p>
        </div>
        <div className="mt-4 sm:mt-0 flex space-x-3">
          <select
            value={tipoAnalise}
            onChange={(e) => setTipoAnalise(e.target.value as any)}
            className="px-3 py-2 border border-gray-300 rounded-md text-sm"
          >
            <option value="rentabilidade">Rentabilidade</option>
            <option value="liquidez">Liquidez</option>
            <option value="endividamento">Endividamento</option>
            <option value="atividade">Atividade</option>
          </select>
          <button className="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
            <ArrowPathIcon className="h-4 w-4 mr-2" />
            Atualizar
          </button>
        </div>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CalendarIcon className="h-4 w-4 inline mr-1" />
              Data Início
            </label>
            <input
              type="date"
              value={periodo.inicio}
              onChange={(e) => setPeriodo(prev => ({ ...prev, inicio: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CalendarIcon className="h-4 w-4 inline mr-1" />
              Data Fim
            </label>
            <input
              type="date"
              value={periodo.fim}
              onChange={(e) => setPeriodo(prev => ({ ...prev, fim: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <BuildingStorefrontIcon className="h-4 w-4 inline mr-1" />
              Loja
            </label>
            <select
              value={lojaFiltro}
              onChange={(e) => setLojaFiltro(e.target.value)}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todas as lojas</option>
              {lojas?.map(loja => (
                <option key={loja.id} value={loja.id}>
                  {loja.nome}
                </option>
              ))}
            </select>
          </div>
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CurrencyDollarIcon className="h-4 w-4 inline mr-1" />
              Centro de Custo
            </label>
            <select
              value={centroCustoFiltro}
              onChange={(e) => setCentroCustoFiltro(e.target.value)}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todos os centros</option>
              {centrosCusto?.map(centro => (
                <option key={centro.id} value={centro.id}>
                  {centro.codigo} - {centro.nome}
                </option>
              ))}
            </select>
          </div>
        </div>
      </Card>

      {/* Indicadores Principais */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        {indicadores.map((indicador, index) => (
          <Card key={index} className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <h3 className="text-sm font-medium text-gray-600">{indicador.nome}</h3>
                <p className="text-2xl font-bold text-gray-900">
                  {indicador.formato === 'currency' 
                    ? formatCurrency(indicador.valor)
                    : indicador.formato === 'percentage'
                    ? formatPercentage(indicador.valor)
                    : indicador.valor.toFixed(1)
                  }
                </p>
                <p className="text-sm text-gray-500 mt-1">{indicador.descricao}</p>
              </div>
              <div className={`p-2 rounded-full ${
                indicador.tendencia === 'up' ? 'bg-green-100' : 
                indicador.tendencia === 'down' ? 'bg-red-100' : 'bg-gray-100'
              }`}>
                {indicador.tendencia === 'up' ? (
                  <ArrowTrendingUpIcon className="h-6 w-6 text-green-600" />
                ) : indicador.tendencia === 'down' ? (
                  <ArrowTrendingDownIcon className="h-6 w-6 text-red-600" />
                ) : (
                  <CalculatorIcon className="h-6 w-6 text-gray-600" />
                )}
              </div>
            </div>
          </Card>
        ))}
      </div>

      {/* Resumo Financeiro */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Resumo do Período</h3>
            <CurrencyDollarIcon className="h-6 w-6 text-green-600" />
          </div>
          
          <div className="space-y-4">
            <div className="flex justify-between items-center">
              <span className="text-gray-600">Total de Receitas</span>
              <span className="font-semibold text-green-600">
                {formatCurrency(statsAtual?.totalReceitas || 0)}
              </span>
            </div>
            <div className="flex justify-between items-center">
              <span className="text-gray-600">Total de Despesas</span>
              <span className="font-semibold text-red-600">
                {formatCurrency(statsAtual?.totalDespesas || 0)}
              </span>
            </div>
            <div className="border-t pt-4">
              <div className="flex justify-between items-center">
                <span className="text-gray-900 font-medium">Resultado</span>
                <span className={`font-bold text-lg ${
                  (statsAtual?.resultado || 0) >= 0 ? 'text-blue-600' : 'text-red-600'
                }`}>
                  {formatCurrency(statsAtual?.resultado || 0)}
                </span>
              </div>
            </div>
            <div className="flex justify-between items-center text-sm">
              <span className="text-gray-600">Total de Lançamentos</span>
              <span className="font-medium">{statsAtual?.totalLancamentos || 0}</span>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            Distribuição de Receitas
          </h3>
          <div className="h-64">
            <Pie data={receitasData} options={{
              ...chartOptions,
              plugins: {
                ...chartOptions.plugins,
                legend: {
                  position: 'bottom' as const
                }
              }
            }} />
          </div>
        </Card>

        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">
            Distribuição de Despesas
          </h3>
          <div className="h-64">
            <Doughnut data={despesasData} options={{
              ...chartOptions,
              plugins: {
                ...chartOptions.plugins,
                legend: {
                  position: 'bottom' as const
                }
              }
            }} />
          </div>
        </Card>
      </div>

      {/* Evolução das Margens */}
      {margensData && (
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <PresentationChartLineIcon className="h-5 w-5 text-blue-600 mr-2" />
            Evolução das Margens - {new Date().getFullYear()}
          </h3>
          <Line data={margensData} options={{
            ...chartOptions,
            scales: {
              y: {
                beginAtZero: true,
                ticks: {
                  callback: function(value: any) {
                    return value + '%'
                  }
                }
              }
            }
          }} />
        </Card>
      )}

      {/* Análise Comparativa */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">
          Análise Comparativa - Últimos 12 Meses
        </h3>
        
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Mês
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Receitas
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Despesas
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Resultado
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Margem %
                </th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {evolucao?.slice(-6).map((mes, index) => (
                <tr key={mes.mes} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                  <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                    {mes.nome}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-right text-green-600 font-medium">
                    {formatCurrency(mes.receitas)}
                  </td>
                  <td className="px-6 py-4 whitespace-nowrap text-sm text-right text-red-600 font-medium">
                    {formatCurrency(mes.despesas)}
                  </td>
                  <td className={`px-6 py-4 whitespace-nowrap text-sm text-right font-medium ${
                    mes.resultado >= 0 ? 'text-blue-600' : 'text-red-600'
                  }`}>
                    {formatCurrency(mes.resultado)}
                  </td>
                  <td className={`px-6 py-4 whitespace-nowrap text-sm text-right font-medium ${
                    mes.resultado >= 0 ? 'text-blue-600' : 'text-red-600'
                  }`}>
                    {formatPercentage(mes.receitas ? (mes.resultado / mes.receitas * 100) : 0)}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </Card>

      {/* Insights e Recomendações */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">
          Insights e Recomendações
        </h3>
        
        <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div className="space-y-4">
            <h4 className="font-medium text-gray-900">✅ Pontos Positivos</h4>
            <ul className="space-y-2 text-sm text-gray-600">
              <li className="flex items-start">
                <span className="text-green-500 mr-2">•</span>
                Margem bruta acima da média do setor
              </li>
              <li className="flex items-start">
                <span className="text-green-500 mr-2">•</span>
                Crescimento consistente nas receitas
              </li>
              <li className="flex items-start">
                <span className="text-green-500 mr-2">•</span>
                Boa diversificação de fontes de receita
              </li>
            </ul>
          </div>
          
          <div className="space-y-4">
            <h4 className="font-medium text-gray-900">⚠️ Pontos de Atenção</h4>
            <ul className="space-y-2 text-sm text-gray-600">
              <li className="flex items-start">
                <span className="text-orange-500 mr-2">•</span>
                Alto percentual de despesas operacionais
              </li>
              <li className="flex items-start">
                <span className="text-orange-500 mr-2">•</span>
                Necessidade de otimização de custos
              </li>
              <li className="flex items-start">
                <span className="text-orange-500 mr-2">•</span>
                Acompanhar sazonalidade das vendas
              </li>
            </ul>
          </div>
        </div>
      </Card>
    </div>
  )
}