// Hook para dados do dashboard
'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'
import { formatCurrency, calculateVariation, getMonthName } from '@/lib/utils'

export interface DashboardKPI {
  name: string
  value: string
  rawValue: number
  change: string
  changeType: 'increase' | 'decrease' | 'neutral'
  icon: string
  description: string
}

export interface ChartData {
  labels: string[]
  datasets: {
    label: string
    data: number[]
    backgroundColor?: string | string[]
    borderColor?: string
    borderWidth?: number
    tension?: number
  }[]
}

export interface RecentTransaction {
  id: string
  data: string
  descricao: string
  categoria: string
  valor: number
  tipo: 'receita' | 'despesa'
  loja: string
}

export interface StoreAnalysis {
  loja_id: string
  nome: string
  receita: number
  despesa: number
  lucro: number
  margem: number
}

export function useDashboardData() {
  const { profile } = useAuth()
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  
  // Estados dos dados
  const [kpis, setKpis] = useState<DashboardKPI[]>([])
  const [revenueVsExpenseData, setRevenueVsExpenseData] = useState<ChartData | null>(null)
  const [cashFlowData, setCashFlowData] = useState<ChartData | null>(null)
  const [categoryData, setCategoryData] = useState<ChartData | null>(null)
  const [recentTransactions, setRecentTransactions] = useState<RecentTransaction[]>([])
  const [storeAnalysis, setStoreAnalysis] = useState<StoreAnalysis[]>([])

  const fetchDashboardData = async () => {
    if (!profile) return

    try {
      setLoading(true)
      setError(null)

      const currentDate = new Date()
      const currentMonth = currentDate.getMonth() + 1
      const currentYear = currentDate.getFullYear()
      const previousMonth = currentMonth === 1 ? 12 : currentMonth - 1
      const previousYear = currentMonth === 1 ? currentYear - 1 : currentYear

      // Filtro por lojas do usuário
      const userStores = profile.loja_ids || []

      // 1. KPIs do mês atual - USANDO ESTRUTURA CORRETA
      const { data: currentMonthData, error: currentError } = await supabase
        .from('lancamentos')
        .select(`
          valor_total,
          tipo,
          competencia,
          loja_id,
          plano_contas!inner(codigo, nome, categoria)
        `)
        .gte('competencia', `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`)
        .lt('competencia', `${currentYear}-${(currentMonth + 1).toString().padStart(2, '0')}-01`)
        .in('loja_id', userStores)
        .eq('status_aprovacao', 'aprovado')

      if (currentError) throw currentError

      // 2. KPIs do mês anterior para comparação
      const { data: previousMonthData, error: previousError } = await supabase
        .from('lancamentos')
        .select(`
          valor_total,
          tipo,
          loja_id
        `)
        .gte('competencia', `${previousYear}-${previousMonth.toString().padStart(2, '0')}-01`)
        .lt('competencia', `${previousYear}-${currentMonth.toString().padStart(2, '0')}-01`)
        .in('loja_id', userStores)
        .eq('status_aprovacao', 'aprovado')

      if (previousError) throw previousError

      // Calcular KPIs atuais - usando campos corretos
      const currentRevenue = currentMonthData
        ?.filter(item => item.tipo === 'receber') // receber = receita
        .reduce((sum, item) => sum + item.valor_total, 0) || 0

      const currentExpense = currentMonthData
        ?.filter(item => item.tipo === 'pagar') // pagar = despesa
        .reduce((sum, item) => sum + item.valor_total, 0) || 0

      const currentProfit = currentRevenue - currentExpense

      // Calcular KPIs anteriores
      const previousRevenue = previousMonthData
        ?.filter(item => item.tipo === 'receber')
        .reduce((sum, item) => sum + item.valor_total, 0) || 0

      const previousExpense = previousMonthData
        ?.filter(item => item.tipo === 'pagar')
        .reduce((sum, item) => sum + item.valor_total, 0) || 0

      const previousProfit = previousRevenue - previousExpense

      // 3. Fluxo de caixa (últimos 6 meses)
      const { data: cashFlowRaw, error: cashFlowError } = await supabase
        .from('lancamentos')
        .select('valor_total, tipo, competencia')
        .gte('competencia', new Date(currentYear, currentMonth - 7, 1).toISOString().split('T')[0])
        .in('loja_id', userStores)
        .eq('status_aprovacao', 'aprovado')
        .order('competencia', { ascending: true })

      if (cashFlowError) throw cashFlowError

      // 4. Últimos lançamentos
      const { data: recentData, error: recentError } = await supabase
        .from('lancamentos')
        .select(`
          id,
          competencia,
          descricao,
          valor_total,
          tipo,
          plano_contas(nome),
          lojas(nome)
        `)
        .in('loja_id', userStores)
        .eq('status_aprovacao', 'aprovado')
        .order('created_at', { ascending: false })
        .limit(10)

      if (recentError) throw recentError

      // 5. Análise por loja
      const { data: storeData, error: storeError } = await supabase
        .from('lancamentos')
        .select(`
          valor_total,
          tipo,
          loja_id,
          lojas(nome)
        `)
        .gte('competencia', `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`)
        .in('loja_id', userStores)
        .eq('status_aprovacao', 'aprovado')

      if (storeError) throw storeError

      // Processar KPIs
      const revenueVariation = calculateVariation(currentRevenue, previousRevenue)
      const expenseVariation = calculateVariation(currentExpense, previousExpense)
      const profitVariation = calculateVariation(currentProfit, previousProfit)

      const processedKpis: DashboardKPI[] = [
        {
          name: 'Receita do Mês',
          value: formatCurrency(currentRevenue),
          rawValue: currentRevenue,
          change: `${revenueVariation.type === 'increase' ? '+' : revenueVariation.type === 'decrease' ? '-' : ''}${revenueVariation.percentage.toFixed(1)}%`,
          changeType: revenueVariation.type,
          icon: 'TrendingUp',
          description: `${getMonthName(currentDate)} de ${currentYear}`
        },
        {
          name: 'Despesas do Mês',
          value: formatCurrency(currentExpense),
          rawValue: currentExpense,
          change: `${expenseVariation.type === 'increase' ? '+' : expenseVariation.type === 'decrease' ? '-' : ''}${expenseVariation.percentage.toFixed(1)}%`,
          changeType: expenseVariation.type === 'increase' ? 'decrease' : 'increase', // Inverter para despesa
          icon: 'TrendingDown',
          description: `${getMonthName(currentDate)} de ${currentYear}`
        },
        {
          name: 'Lucro Líquido',
          value: formatCurrency(currentProfit),
          rawValue: currentProfit,
          change: `${profitVariation.type === 'increase' ? '+' : profitVariation.type === 'decrease' ? '-' : ''}${profitVariation.percentage.toFixed(1)}%`,
          changeType: profitVariation.type,
          icon: 'DollarSign',
          description: `Margem: ${currentRevenue > 0 ? ((currentProfit / currentRevenue) * 100).toFixed(1) : '0'}%`
        },
        {
          name: 'Fluxo de Caixa',
          value: formatCurrency(currentRevenue + currentProfit),
          rawValue: currentRevenue + currentProfit,
          change: '+8.2%',
          changeType: 'increase',
          icon: 'Banknote',
          description: 'Projeção mensal'
        }
      ]

      setKpis(processedKpis)

      // Processar gráfico de receita vs despesa (últimos 6 meses)
      const last6Months = []
      for (let i = 5; i >= 0; i--) {
        const date = new Date(currentYear, currentMonth - 1 - i, 1)
        last6Months.push({
          month: getMonthName(date),
          year: date.getFullYear(),
          monthNum: date.getMonth() + 1
        })
      }

      const monthlyData = last6Months.map(month => {
        const monthData = currentMonthData?.filter(item => {
          const itemDate = new Date(item.competencia)
          return itemDate.getMonth() + 1 === month.monthNum && itemDate.getFullYear() === month.year
        }) || []

        const revenue = monthData.filter(item => item.tipo === 'receber').reduce((sum, item) => sum + item.valor_total, 0)
        const expense = monthData.filter(item => item.tipo === 'pagar').reduce((sum, item) => sum + item.valor_total, 0)

        return { month: month.month, revenue, expense }
      })

      setRevenueVsExpenseData({
        labels: monthlyData.map(d => d.month),
        datasets: [
          {
            label: 'Receitas',
            data: monthlyData.map(d => d.revenue),
            backgroundColor: 'rgba(34, 197, 94, 0.8)',
            borderColor: 'rgb(34, 197, 94)',
            borderWidth: 2
          },
          {
            label: 'Despesas',
            data: monthlyData.map(d => d.expense),
            backgroundColor: 'rgba(239, 68, 68, 0.8)',
            borderColor: 'rgb(239, 68, 68)',
            borderWidth: 2
          }
        ]
      })

      // Processar fluxo de caixa
      const cashFlowMonthly = last6Months.map(month => {
        const monthCashFlow = cashFlowRaw?.filter(item => {
          const itemDate = new Date(item.competencia)
          return itemDate.getMonth() + 1 === month.monthNum && itemDate.getFullYear() === month.year
        }) || []

        const flow = monthCashFlow.reduce((sum, item) => {
          return sum + (item.tipo === 'receber' ? item.valor_total : -item.valor_total)
        }, 0)

        return flow
      })

      setCashFlowData({
        labels: last6Months.map(m => m.month),
        datasets: [
          {
            label: 'Fluxo de Caixa',
            data: cashFlowMonthly,
            borderColor: 'rgb(59, 130, 246)',
            backgroundColor: 'rgba(59, 130, 246, 0.1)',
            borderWidth: 3,
            tension: 0.4
          }
        ]
      })

      // Processar categorias baseado no plano de contas
      const categoryTotals = currentMonthData?.reduce((acc, item) => {
        if (item.plano_contas && Array.isArray(item.plano_contas) && item.plano_contas.length > 0 && item.tipo === 'pagar') {
          const categoryName = item.plano_contas[0].categoria || item.plano_contas[0].nome
          acc[categoryName] = (acc[categoryName] || 0) + item.valor_total
        }
        return acc
      }, {} as Record<string, number>) || {}

      const categoryEntries = Object.entries(categoryTotals).sort(([,a], [,b]) => b - a).slice(0, 6)

      setCategoryData({
        labels: categoryEntries.map(([name]) => name),
        datasets: [
          {
            label: 'Despesas por Categoria',
            data: categoryEntries.map(([,value]) => value),
            backgroundColor: [
              '#ef4444', '#f97316', '#eab308', '#22c55e', '#3b82f6', '#8b5cf6'
            ]
          }
        ]
      })

      // Processar transações recentes
      const processedTransactions: RecentTransaction[] = recentData?.map(item => ({
        id: item.id,
        data: item.competencia,
        descricao: item.descricao,
        categoria: (Array.isArray(item.plano_contas) && item.plano_contas.length > 0) ? item.plano_contas[0].nome : 'Sem categoria',
        valor: item.valor_total,
        tipo: item.tipo === 'receber' ? 'receita' : 'despesa',
        loja: (Array.isArray(item.lojas) && item.lojas.length > 0) ? item.lojas[0].nome : 'Sem loja'
      })) || []

      setRecentTransactions(processedTransactions)

      // Processar análise por loja
      const storeAnalysisData = userStores.map(storeId => {
        const storeTransactions = storeData?.filter(item => item.loja_id === storeId) || []
        const storeName = (storeTransactions.length > 0 && Array.isArray(storeTransactions[0].lojas) && storeTransactions[0].lojas.length > 0) 
          ? storeTransactions[0].lojas[0].nome 
          : `Loja ${storeId}`
        
        const revenue = storeTransactions.filter(t => t.tipo === 'receber').reduce((sum, t) => sum + t.valor_total, 0)
        const expense = storeTransactions.filter(t => t.tipo === 'pagar').reduce((sum, t) => sum + t.valor_total, 0)
        const profit = revenue - expense
        const margin = revenue > 0 ? (profit / revenue) * 100 : 0

        return {
          loja_id: storeId,
          nome: storeName,
          receita: revenue,
          despesa: expense,
          lucro: profit,
          margem: margin
        }
      }).sort((a, b) => b.lucro - a.lucro)

      setStoreAnalysis(storeAnalysisData)

    } catch (err) {
      console.error('Erro ao buscar dados do dashboard:', err)
      setError(err instanceof Error ? err.message : 'Erro desconhecido')
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    if (profile) {
      fetchDashboardData()
    }
  }, [profile])

  return {
    loading,
    error,
    kpis,
    revenueVsExpenseData,
    cashFlowData,
    categoryData,
    recentTransactions,
    storeAnalysis,
    refetch: fetchDashboardData
  }
}