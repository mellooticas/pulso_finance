'use client'

import { useAuth } from '@/contexts/auth-context'
import { useDashboardData } from '@/hooks/use-dashboard-data'
import { Card } from '@/components/ui/card'
import { KPICard } from '@/components/dashboard/kpi-card'
import { TransactionsTable } from '@/components/dashboard/transactions-table'
import { StoreAnalysisCard } from '@/components/dashboard/store-analysis-card'
import { RevenueExpenseChart } from '@/components/charts/revenue-expense-chart'
import { CashFlowChart } from '@/components/charts/cash-flow-chart'
import { CategoryChart } from '@/components/charts/category-chart'
import { 
  CalendarDays,
  BarChart3,
  PieChart,
  Loader2,
  AlertCircle,
  RefreshCcw
} from 'lucide-react'

export default function DashboardPage() {
  const { profile } = useAuth()
  const { 
    loading, 
    error, 
    kpis, 
    revenueVsExpenseData, 
    cashFlowData, 
    categoryData, 
    recentTransactions, 
    storeAnalysis,
    refetch 
  } = useDashboardData()

  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <Loader2 className="h-8 w-8 text-blue-600 animate-spin mx-auto mb-4" />
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
        <div className="text-center max-w-md">
          <AlertCircle className="h-12 w-12 text-red-500 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Erro ao Carregar Dados
          </h3>
          <p className="text-slate-600 mb-4">
            {error}
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