'use client'

import { useLancamentosStats, useLancamentosEvoluçaoMensal } from './use-lancamentos'
import { useComparativoLojas } from './use-lojas'
import { useDRE } from './use-dre'

// Hook principal para dados do dashboard com dados reais
export function useDashboardDataReal() {
  // Período atual (mês atual)
  const currentDate = new Date()
  const currentMonth = currentDate.getMonth() + 1
  const currentYear = currentDate.getFullYear()
  
  // Períodos para filtros de lançamentos
  const filtroAtual = {
    data_inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
    data_fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
  }

  const previousMonth = currentMonth === 1 ? 12 : currentMonth - 1
  const previousYear = currentMonth === 1 ? currentYear - 1 : currentYear
  
  const filtroAnterior = {
    data_inicio: `${previousYear}-${previousMonth.toString().padStart(2, '0')}-01`,
    data_fim: new Date(previousYear, previousMonth, 0).toISOString().split('T')[0]
  }

  // Períodos para hooks DRE e comparativo (formato diferente)
  const periodoAtual = {
    inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
    fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
  }

  // Hooks para dados
  const statsAtual = useLancamentosStats(filtroAtual)
  const statsAnterior = useLancamentosStats(filtroAnterior)
  const evolucaoMensal = useLancamentosEvoluçaoMensal(currentYear)
  const comparativoLojas = useComparativoLojas(periodoAtual)
  const dreAtual = useDRE(periodoAtual)

  // Calcular valores financeiros corretos (entradas = receitas, saídas = despesas)
  const entradasAtual = statsAtual.data?.totalReceitas || 0
  const saidasAtual = statsAtual.data?.totalDespesas || 0
  const saldoAtual = statsAtual.data?.resultado || 0
  
  const entradasAnterior = statsAnterior.data?.totalReceitas || 0
  const saidasAnterior = statsAnterior.data?.totalDespesas || 0
  const saldoAnterior = statsAnterior.data?.resultado || 0

  // KPIs Financeiros Corretos
  const kpis = [
    {
      name: 'Entradas (Receber)',
      description: 'Total de receitas do período',
      value: entradasAtual,
      previousValue: entradasAnterior,
      format: 'currency',
      icon: 'ArrowTrendingUpIcon',
      color: 'green'
    },
    {
      name: 'Saídas (Pagar)', 
      description: 'Total de despesas do período',
      value: saidasAtual,
      previousValue: saidasAnterior,
      format: 'currency',
      icon: 'ArrowTrendingDownIcon',
      color: 'red'
    },
    {
      name: 'Saldo do Período',
      description: 'Resultado financeiro (Entradas - Saídas)',
      value: saldoAtual,
      previousValue: saldoAnterior,
      format: 'currency',
      icon: 'CalculatorIcon',
      color: saldoAtual >= 0 ? 'green' : 'red'
    },
    {
      name: 'Total de Lançamentos',
      description: 'Quantidade de movimentações',
      value: statsAtual.data?.totalLancamentos || 0,
      previousValue: statsAnterior.data?.totalLancamentos || 0,
      format: 'number',
      icon: 'DocumentTextIcon',
      color: 'blue'
    }
  ]

  // Calcular variação percentual
  const calculateVariation = (current: number, previous: number) => {
    if (previous === 0) return current > 0 ? 100 : 0
    return ((current - previous) / previous) * 100
  }

  const kpisComVariacao = kpis.map(kpi => ({
    ...kpi,
    variation: calculateVariation(kpi.value, kpi.previousValue),
    variationType: kpi.value >= kpi.previousValue ? 'increase' : 'decrease'
  }))

  // Dados para gráfico de evolução mensal
  const chartEvolucao = {
    labels: evolucaoMensal.data?.map(item => item.nome) || [],
    datasets: [
      {
        label: 'Receitas',
        data: evolucaoMensal.data?.map(item => item.receitas) || [],
        borderColor: 'rgb(34, 197, 94)',
        backgroundColor: 'rgba(34, 197, 94, 0.1)',
        tension: 0.1
      },
      {
        label: 'Despesas',
        data: evolucaoMensal.data?.map(item => item.despesas) || [],
        borderColor: 'rgb(239, 68, 68)',
        backgroundColor: 'rgba(239, 68, 68, 0.1)',
        tension: 0.1
      },
      {
        label: 'Resultado',
        data: evolucaoMensal.data?.map(item => item.resultado) || [],
        borderColor: 'rgb(59, 130, 246)',
        backgroundColor: 'rgba(59, 130, 246, 0.1)',
        tension: 0.1
      }
    ]
  }

  // Dados para gráfico de lojas
  const chartLojas = {
    labels: comparativoLojas.data?.map(item => item.loja.codigo) || [],
    datasets: [
      {
        label: 'Resultado por Loja',
        data: comparativoLojas.data?.map(item => item.resultado) || [],
        backgroundColor: [
          'rgba(34, 197, 94, 0.8)',
          'rgba(59, 130, 246, 0.8)', 
          'rgba(168, 85, 247, 0.8)',
          'rgba(245, 101, 101, 0.8)',
          'rgba(251, 191, 36, 0.8)',
          'rgba(14, 165, 233, 0.8)',
          'rgba(139, 92, 246, 0.8)'
        ]
      }
    ]
  }

  return {
    // Estados de loading
    loading: statsAtual.isLoading || statsAnterior.isLoading || evolucaoMensal.isLoading || comparativoLojas.isLoading,
    error: statsAtual.error || statsAnterior.error || evolucaoMensal.error || comparativoLojas.error,
    
    // KPIs processados
    kpis: kpisComVariacao,
    
    // Dados para gráficos
    chartEvolucao,
    chartLojas,
    
    // Dados brutos para componentes específicos
    statsAtual: statsAtual.data,
    comparativoLojas: comparativoLojas.data,
    evolucaoMensal: evolucaoMensal.data,
    dreAtual: dreAtual.data,
    
    // Informações de período
    periodoAtual,
    filtroAtual,
    filtroAnterior
  }
}

// Função auxiliar para formatar valores
export function formatKPIValue(value: number, format: 'currency' | 'number' | 'percentage') {
  switch (format) {
    case 'currency':
      return new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL'
      }).format(value)
    
    case 'percentage':
      return `${value.toFixed(1)}%`
    
    case 'number':
    default:
      return new Intl.NumberFormat('pt-BR').format(value)
  }
}

// Função auxiliar para formatar variação
export function formatVariation(variation: number) {
  const sign = variation >= 0 ? '+' : ''
  return `${sign}${variation.toFixed(1)}%`
}