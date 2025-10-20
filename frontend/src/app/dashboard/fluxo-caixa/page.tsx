'use client'

import { useState } from 'react'
import { useFluxoCaixa, useVencimentosProximos } from '@/hooks/use-fluxo-caixa'
import { useLojas } from '@/hooks/use-lojas'
import { useCentrosCusto } from '@/hooks/use-centros-custo'
import { Card } from '@/components/ui/card'
import { 
  CalendarIcon,
  BuildingStorefrontIcon,
  BanknotesIcon,
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon,
  DocumentArrowDownIcon,
  PrinterIcon,
  ChartBarIcon,
  CurrencyDollarIcon,
  ClockIcon
} from '@heroicons/react/24/outline'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js'
import { Line, Bar } from 'react-chartjs-2'

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend
)

export default function FluxoCaixaPage() {
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
  const [tipoVisualizacao, setTipoVisualizacao] = useState<'diario' | 'semanal' | 'mensal'>('diario')

  // Hooks de dados
  const { data: lojas } = useLojas()
  const { data: centrosCusto } = useCentrosCusto()
  const { 
    data: fluxo, 
    isLoading: loadingFluxo, 
    error: errorFluxo 
  } = useFluxoCaixa({
    periodo,
    lojaId: lojaFiltro || undefined,
    centroCustoId: centroCustoFiltro || undefined
  })
  
  const { 
    data: vencimentos, 
    isLoading: loadingVencimentos 
  } = useVencimentosProximos() // Vencimentos próximos

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value || 0)
  }

  const formatDate = (date: string) => {
    return new Date(date).toLocaleDateString('pt-BR')
  }

  // Dados para gráfico de evolução (dados mock temporários até ter dados históricos)
  const fluxoChartData = fluxo ? {
    labels: ['Hoje', 'Ontem', '2 dias', '3 dias', '4 dias', '5 dias', '6 dias'],
    datasets: [
      {
        label: 'Entradas',
        data: [fluxo.entradas_periodo, 8500, 7200, 9100, 6800, 8900, 7600],
        backgroundColor: 'rgba(34, 197, 94, 0.8)',
        borderColor: 'rgb(34, 197, 94)',
        borderWidth: 2,
      },
      {
        label: 'Saídas',
        data: [fluxo.saidas_periodo, 6200, 5800, 7300, 4900, 6700, 5500],
        backgroundColor: 'rgba(239, 68, 68, 0.8)',
        borderColor: 'rgb(239, 68, 68)',
        borderWidth: 2,
      }
    ]
  } : null

  // Dados para gráfico de saldo acumulado
  const saldoChartData = fluxo ? {
    labels: ['Hoje', 'Ontem', '2 dias', '3 dias', '4 dias', '5 dias', '6 dias'],
    datasets: [
      {
        label: 'Saldo Acumulado',
        data: [
          fluxo.saldo_total_atual,
          fluxo.saldo_total_atual - fluxo.resultado_periodo,
          fluxo.saldo_total_atual - (fluxo.resultado_periodo * 1.2),
          fluxo.saldo_total_atual - (fluxo.resultado_periodo * 0.8),
          fluxo.saldo_total_atual - (fluxo.resultado_periodo * 1.5),
          fluxo.saldo_total_atual - (fluxo.resultado_periodo * 0.9),
          fluxo.saldo_total_atual - (fluxo.resultado_periodo * 1.1)
        ],
        borderColor: 'rgb(59, 130, 246)',
        backgroundColor: 'rgba(59, 130, 246, 0.1)',
        tension: 0.4,
        fill: true
      }
    ]
  } : null

  const chartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top' as const,
      },
      title: {
        display: true,
        text: 'Fluxo de Caixa - Movimentação Diária'
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        ticks: {
          callback: function(value: any) {
            return new Intl.NumberFormat('pt-BR', {
              style: 'currency',
              currency: 'BRL',
              minimumFractionDigits: 0,
              maximumFractionDigits: 0
            }).format(value)
          }
        }
      }
    }
  }

  // Calcular totais do período
  const totais = fluxo ? {
    entradas: fluxo.entradas_periodo,
    saidas: fluxo.saidas_periodo,
    saldo: fluxo.resultado_periodo
  } : { entradas: 0, saidas: 0, saldo: 0 }

  if (loadingFluxo) {
    return (
      <div className="flex items-center justify-center min-h-96">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="sm:flex sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Fluxo de Caixa
          </h1>
          <p className="mt-2 text-gray-600">
            Controle de entradas e saídas de recursos financeiros
          </p>
        </div>
        <div className="mt-4 sm:mt-0 flex space-x-3">
          <select
            value={tipoVisualizacao}
            onChange={(e) => setTipoVisualizacao(e.target.value as any)}
            className="px-3 py-2 border border-gray-300 rounded-md text-sm"
          >
            <option value="diario">Diário</option>
            <option value="semanal">Semanal</option>
            <option value="mensal">Mensal</option>
          </select>
          <button className="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm leading-4 font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
            <PrinterIcon className="h-4 w-4 mr-2" />
            Imprimir
          </button>
          <button className="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
            <DocumentArrowDownIcon className="h-4 w-4 mr-2" />
            Exportar
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

      {/* KPIs Principais */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ArrowTrendingUpIcon className="h-8 w-8 text-green-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-lg font-semibold text-gray-900">Total Entradas</h3>
              <p className="text-2xl font-bold text-green-600">{formatCurrency(totais.entradas)}</p>
              <p className="text-sm text-gray-500">Período selecionado</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ArrowTrendingDownIcon className="h-8 w-8 text-red-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-lg font-semibold text-gray-900">Total Saídas</h3>
              <p className="text-2xl font-bold text-red-600">{formatCurrency(totais.saidas)}</p>
              <p className="text-sm text-gray-500">Período selecionado</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <BanknotesIcon className={`h-8 w-8 ${totais.saldo >= 0 ? 'text-blue-600' : 'text-red-600'}`} />
            </div>
            <div className="ml-4">
              <h3 className="text-lg font-semibold text-gray-900">Saldo Líquido</h3>
              <p className={`text-2xl font-bold ${totais.saldo >= 0 ? 'text-blue-600' : 'text-red-600'}`}>
                {formatCurrency(totais.saldo)}
              </p>
              <p className="text-sm text-gray-500">Entradas - Saídas</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ChartBarIcon className="h-8 w-8 text-purple-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-lg font-semibold text-gray-900">Média Diária</h3>
              <p className="text-2xl font-bold text-purple-600">
                {formatCurrency(fluxo ? fluxo.media_saidas_diaria : 0)}
              </p>
              <p className="text-sm text-gray-500">Média de saídas diárias</p>
            </div>
          </div>
        </Card>
      </div>

      {/* Gráficos */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {fluxoChartData && (
          <Card className="p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-4">
              Movimentação por Dia
            </h3>
            <Bar data={fluxoChartData} options={chartOptions} />
          </Card>
        )}

        {saldoChartData && (
          <Card className="p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-4">
              Saldo Acumulado
            </h3>
            <Line data={saldoChartData} options={{
              ...chartOptions,
              plugins: {
                ...chartOptions.plugins,
                title: {
                  display: true,
                  text: 'Evolução do Saldo Acumulado'
                }
              }
            }} />
          </Card>
        )}
      </div>

      {/* Tabela de Movimentação Detalhada */}
      <Card className="overflow-hidden">
        <div className="px-6 py-4 border-b border-gray-200">
          <h3 className="text-lg font-semibold text-gray-900">
            Movimentação Detalhada - {formatDate(periodo.inicio)} a {formatDate(periodo.fim)}
          </h3>
        </div>
        <div className="overflow-x-auto">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Conta
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Entradas
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Saídas
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Resultado
                </th>
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Saldo Atual
                </th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-200">
              {fluxo && fluxo.contas && fluxo.contas.length > 0 ? (
                fluxo.contas.map((conta, index) => (
                  <tr key={conta.conta_id} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                    <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      {conta.conta_nome}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-right text-green-600 font-medium">
                      {formatCurrency(conta.entradas_periodo)}
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap text-sm text-right text-red-600 font-medium">
                      {formatCurrency(conta.saidas_periodo)}
                    </td>
                    <td className={`px-6 py-4 whitespace-nowrap text-sm text-right font-medium ${
                      (conta.entradas_periodo - conta.saidas_periodo) >= 0 ? 'text-blue-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(conta.entradas_periodo - conta.saidas_periodo)}
                    </td>
                    <td className={`px-6 py-4 whitespace-nowrap text-sm text-right font-bold ${
                      conta.saldo_atual >= 0 ? 'text-blue-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(conta.saldo_atual)}
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={5} className="px-6 py-12 text-center text-gray-500">
                    Nenhuma conta encontrada
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </Card>

      {/* Vencimentos Próximos */}
      {vencimentos && (
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <ClockIcon className="h-5 w-5 text-orange-600 mr-2" />
            Vencimentos - Próximos 7 Dias
          </h3>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div className="bg-green-50 p-4 rounded-lg">
              <h4 className="text-sm font-medium text-green-800">A Receber</h4>
              <p className="text-xl font-bold text-green-600">
                {formatCurrency(vencimentos.totalReceber)}
              </p>
              <p className="text-sm text-green-700">{vencimentos.aReceber?.length || 0} contas</p>
            </div>
            <div className="bg-red-50 p-4 rounded-lg">
              <h4 className="text-sm font-medium text-red-800">A Pagar</h4>
              <p className="text-xl font-bold text-red-600">
                {formatCurrency(vencimentos.totalPagar)}
              </p>
              <p className="text-sm text-red-700">{vencimentos.aPagar?.length || 0} contas</p>
            </div>
            <div className="bg-blue-50 p-4 rounded-lg">
              <h4 className="text-sm font-medium text-blue-800">Saldo Líquido</h4>
              <p className={`text-xl font-bold ${
                (vencimentos.totalReceber - vencimentos.totalPagar) >= 0 ? 'text-blue-600' : 'text-red-600'
              }`}>
                {formatCurrency(vencimentos.totalReceber - vencimentos.totalPagar)}
              </p>
            </div>
          </div>

          {vencimentos?.aPagar && vencimentos.aPagar.length > 0 && (
            <div className="border-t pt-4">
              <h4 className="text-sm font-medium text-gray-700 mb-2">Próximos Vencimentos (A Pagar)</h4>
              <div className="space-y-2">
                {vencimentos.aPagar.slice(0, 5).map((item: any, index: number) => (
                  <div key={index} className="flex justify-between items-center py-2 px-3 bg-gray-50 rounded">
                    <div>
                      <span className="text-sm font-medium">{item.lancamento?.descricao || 'Sem descrição'}</span>
                      <span className="text-xs text-gray-500 ml-2">
                        Venc: {formatDate(item.vencimento)}
                      </span>
                    </div>
                    <span className="text-sm font-medium text-red-600">
                      {formatCurrency(item.valor)}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          )}
        </Card>
      )}
    </div>
  )
}