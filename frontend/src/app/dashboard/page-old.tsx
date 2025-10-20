'use client'

import Link from 'next/link'
import { useAuth } from '@/contexts/auth-context'
import { useDashboardDataReal, formatKPIValue, formatVariation } from '@/hooks/use-dashboard-real'
import { Card } from '@/components/ui/card'
import { 
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon,
  CalculatorIcon,
  DocumentTextIcon,
  ArrowUpIcon,
  ArrowDownIcon,
  EyeIcon,
  ChartBarIcon
} from '@heroicons/react/24/outline'

export default function DashboardPage() {
  const { profile } = useAuth()
  const { 
    loading, 
    error, 
    kpis,
    comparativoLojas,
    statsAtual
  } = useDashboardDataReal()

  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Carregando Dashboard
          </h3>
          <p className="text-slate-600">
            Preparando seus dados financeiros...
          </p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="bg-red-50 border border-red-200 rounded-lg p-6 max-w-md">
            <h3 className="text-lg font-semibold text-red-800 mb-2">Erro ao carregar dados</h3>
            <p className="text-red-600 mb-4">
              Não foi possível carregar os dados do dashboard
            </p>
            <button 
              onClick={() => window.location.reload()}
              className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700"
            >
              Tentar Novamente
            </button>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Dashboard Financeiro</h1>
          <p className="text-gray-600">Visão geral dos dados do sistema PULSO Finance</p>
        </div>
        
        <Link 
          href="/dashboard/lancamentos"
          className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
        >
          <EyeIcon className="w-4 h-4 mr-2" />
          Ver Lançamentos
        </Link>
      </div>

      {/* KPIs Grid */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {kpis.map((kpi, index) => {
          const IconComponent = kpi.icon === 'ArrowTrendingUpIcon' ? ArrowTrendingUpIcon : 
                              kpi.icon === 'ArrowTrendingDownIcon' ? ArrowTrendingDownIcon :
                              kpi.icon === 'CalculatorIcon' ? CalculatorIcon : 
                              DocumentTextIcon

          return (
            <Card key={index} className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-medium text-gray-600">{kpi.name}</p>
                  <p className="text-2xl font-bold text-gray-900">
                    {formatKPIValue(kpi.value, kpi.format)}
                  </p>
                </div>
                <div className={`p-3 rounded-full ${kpi.color === 'green' ? 'bg-green-100' : kpi.color === 'red' ? 'bg-red-100' : 'bg-blue-100'}`}>
                  <IconComponent className={`w-6 h-6 ${kpi.color === 'green' ? 'text-green-600' : kpi.color === 'red' ? 'text-red-600' : 'text-blue-600'}`} />
                </div>
              </div>
              
              {/* Variação */}
              <div className="mt-3 flex items-center">
                {kpi.variationType === 'increase' ? (
                  <ArrowUpIcon className="w-4 h-4 text-green-500 mr-1" />
                ) : (
                  <ArrowDownIcon className="w-4 h-4 text-red-500 mr-1" />
                )}
                <span className={`text-sm ${kpi.variationType === 'increase' ? 'text-green-600' : 'text-red-600'}`}>
                  {formatVariation(kpi.variation)}
                </span>
                <span className="text-sm text-gray-500 ml-1">vs. mês anterior</span>
              </div>
            </Card>
          )
        })}
      </div>

      {/* Comparativo por Lojas */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Performance por Loja</h3>
            <ChartBarIcon className="w-5 h-5 text-blue-600" />
          </div>
          
          <div className="space-y-4">
            {comparativoLojas?.slice(0, 5).map((loja, index) => (
              <div key={loja.loja.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div>
                  <p className="font-medium text-gray-900">{loja.loja.codigo}</p>
                  <p className="text-sm text-gray-600">{loja.loja.nome}</p>
                </div>
                <div className="text-right">
                  <p className="font-medium text-gray-900">
                    {formatKPIValue(loja.resultado, 'currency')}
                  </p>
                  <p className="text-sm text-gray-600">
                    {loja.totalLancamentos} lançamentos
                  </p>
                </div>
              </div>
            ))}
          </div>
          
          {comparativoLojas && comparativoLojas.length > 5 && (
            <div className="mt-4 text-center">
              <Link 
                href="/dashboard/lojas" 
                className="text-blue-600 hover:text-blue-800 text-sm"
              >
                Ver todas as lojas →
              </Link>
            </div>
          )}
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Resumo Financeiro</h3>
            <CalculatorIcon className="w-5 h-5 text-green-600" />
          </div>
          
          <div className="space-y-4">
            <div className="flex justify-between items-center p-3 bg-green-50 rounded-lg">
              <span className="text-gray-700">Total de Receitas</span>
              <span className="font-semibold text-green-600">
                {formatKPIValue(statsAtual?.totalReceitas || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-red-50 rounded-lg">
              <span className="text-gray-700">Total de Despesas</span>
              <span className="font-semibold text-red-600">
                {formatKPIValue(statsAtual?.totalDespesas || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
              <span className="text-gray-700">Resultado</span>
              <span className={`font-semibold ${(statsAtual?.resultado || 0) >= 0 ? 'text-blue-600' : 'text-red-600'}`}>
                {formatKPIValue(statsAtual?.resultado || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-gray-50 rounded-lg">
              <span className="text-gray-700">Total de Lançamentos</span>
              <span className="font-semibold text-gray-700">
                {formatKPIValue(statsAtual?.totalLancamentos || 0, 'number')}
              </span>
            </div>
          </div>
        </Card>
      </div>

      {/* Ações Rápidas */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Ações Rápidas</h3>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Link 
            href="/dashboard/lancamentos" 
            className="flex items-center p-4 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors"
          >
            <DocumentTextIcon className="w-8 h-8 text-blue-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">Lançamentos</h4>
              <p className="text-sm text-gray-600">Visualizar todos os lançamentos</p>
            </div>
          </Link>
          
          <Link 
            href="/dashboard/dre" 
            className="flex items-center p-4 bg-green-50 rounded-lg hover:bg-green-100 transition-colors"
          >
            <ChartBarIcon className="w-8 h-8 text-green-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">DRE</h4>
              <p className="text-sm text-gray-600">Demonstração do Resultado</p>
            </div>
          </Link>
          
          <Link 
            href="/dashboard/lojas" 
            className="flex items-center p-4 bg-purple-50 rounded-lg hover:bg-purple-100 transition-colors"
          >
            <ArrowTrendingUpIcon className="w-8 h-8 text-purple-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">Análise por Loja</h4>
              <p className="text-sm text-gray-600">Comparativo e performance</p>
            </div>
          </Link>
        </div>
      </Card>
    </div>
  )
}

  if (error) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center max-w-md">
          <AlertCircle className="h-12 w-12 text-red-500 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Erro ao Carregar Dados
          </h3>
          <p className="text-slate-600 mb-4">
            {error?.message || 'Erro desconhecido'}
          </p>
          <button
            onClick={refetch}
            className="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
          >
            <RefreshCcw className="h-4 w-4" />
            Tentar Novamente
          </button>
        </div>
      </div>
    )
  }

  const currentDate = new Date()
  const monthName = new Intl.DateTimeFormat('pt-BR', { month: 'long' }).format(currentDate)
  const year = currentDate.getFullYear()

  return (
    <div className="space-y-8">
      {/* Header Aprimorado */}
      <div className="bg-gradient-to-r from-blue-600 to-purple-600 -mx-4 sm:-mx-6 lg:-mx-8 px-4 sm:px-6 lg:px-8 py-8 rounded-xl text-white">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold mb-2">
              Dashboard Financeiro
            </h1>
            <p className="text-blue-100 flex items-center gap-2">
              <CalendarDays className="h-4 w-4" />
              Bem-vindo de volta, {profile?.nome}! • {monthName} de {year}
            </p>
          </div>
          <div className="hidden sm:block">
            <div className="bg-white/10 backdrop-blur-sm rounded-lg p-4">
              <p className="text-sm text-blue-100 mb-1">Papel no Sistema</p>
              <p className="font-semibold capitalize">{profile?.papel}</p>
            </div>
          </div>
        </div>
      </div>

      {/* KPIs Grid */}
      <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-4">
        {kpis.map((kpi, index) => (
          <KPICard key={index} kpi={kpi} />
        ))}
      </div>

      {/* Charts Section */}
      <div className="grid grid-cols-1 gap-6 lg:grid-cols-3">
        {/* Receitas vs Despesas */}
        <Card className="lg:col-span-2 p-6">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-3">
              <div className="p-2 rounded-lg bg-blue-50">
                <BarChart3 className="h-5 w-5 text-blue-600" />
              </div>
              <div>
                <h3 className="text-lg font-semibold text-slate-900">
                  Receitas vs Despesas
                </h3>
                <p className="text-sm text-slate-600">
                  Últimos 6 meses • Comparativo mensal
                </p>
              </div>
            </div>
          </div>
          <RevenueExpenseChart data={revenueVsExpenseData} />
        </Card>

        {/* Categorias de Despesas */}
        <Card className="p-6">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-3">
              <div className="p-2 rounded-lg bg-purple-50">
                <PieChart className="h-5 w-5 text-purple-600" />
              </div>
              <div>
                <h3 className="text-lg font-semibold text-slate-900">
                  Despesas por Categoria
                </h3>
                <p className="text-sm text-slate-600">
                  Mês atual • Top 6 categorias
                </p>
              </div>
            </div>
          </div>
          <CategoryChart data={categoryData} />
        </Card>
      </div>

      {/* Segunda linha de gráficos */}
      <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
        {/* Fluxo de Caixa */}
        <Card className="p-6">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-3">
              <div className="p-2 rounded-lg bg-emerald-50">
                <BarChart3 className="h-5 w-5 text-emerald-600" />
              </div>
              <div>
                <h3 className="text-lg font-semibold text-slate-900">
                  Fluxo de Caixa Mensal
                </h3>
                <p className="text-sm text-slate-600">
                  Últimos 6 meses • Entrada - Saída
                </p>
              </div>
            </div>
          </div>
          <CashFlowChart data={cashFlowData} />
        </Card>

        {/* Performance por Loja */}
        <StoreAnalysisCard stores={storeAnalysis} loading={loading} />
      </div>

      {/* Transações Recentes */}
      <TransactionsTable transactions={recentTransactions} loading={loading} />

      {/* Footer com Informações Extras */}
      <Card className="p-6 bg-gradient-to-r from-slate-50 to-slate-100 border-slate-200">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 text-center">
          <div>
            <p className="text-sm text-slate-600 mb-1">Última Atualização</p>
            <p className="font-semibold text-slate-900">
              {new Date().toLocaleString('pt-BR')}
            </p>
          </div>
          <div>
            <p className="text-sm text-slate-600 mb-1">Transações Processadas</p>
            <p className="font-semibold text-slate-900">
              {recentTransactions.length} hoje
            </p>
          </div>
          <div>
            <p className="text-sm text-slate-600 mb-1">Lojas Monitoradas</p>
            <p className="font-semibold text-slate-900">
              {storeAnalysis.length} loja(s)
            </p>
          </div>
        </div>
      </Card>
    </div>
  )
}