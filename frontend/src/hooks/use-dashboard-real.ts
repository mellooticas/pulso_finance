'use client'

import { useLancamentosStats, useLancamentosEvoluçaoMensal } from './use-lancamentos'
import { useComparativoLojas } from './use-lojas'
import { useDRE } from './use-dre'
import { useFilters } from '@/contexts/filters-context'

// Hook principal para dados do dashboard com dados reais
export function useDashboardDataReal() {
  const { filters, periodo } = useFilters()

  // Filtros derivados do contexto
  const filtroAtual = {
    data_inicio: filters.data_inicio,
    data_fim: filters.data_fim,
    loja_id: filters.loja_id || undefined,
    centro_custo_id: filters.centro_custo_id || undefined,
  }

  // Mês anterior para variação (com base no período selecionado)
  const baseInicio = new Date(filters.data_inicio)
  const previousMonth = baseInicio.getMonth() === 0 ? 11 : baseInicio.getMonth() - 1
  const previousYear = previousMonth === 11 ? baseInicio.getFullYear() - 1 : baseInicio.getFullYear()
  const prevInicio = `${previousYear}-${String(previousMonth + 1).padStart(2, '0')}-01`
  const prevFim = new Date(previousYear, previousMonth + 1, 0).toISOString().split('T')[0]
  const filtroAnterior = {
    data_inicio: prevInicio,
    data_fim: prevFim,
    loja_id: filtroAtual.loja_id,
    centro_custo_id: filtroAtual.centro_custo_id,
  }

  // Período para hooks DRE e comparativo
  const periodoAtual = {
    inicio: filters.data_inicio,
    fim: filters.data_fim
  }

  // Hooks para dados
  const statsAtual = useLancamentosStats(filtroAtual)
  const statsAnterior = useLancamentosStats(filtroAnterior)
  const anoBase = new Date(filters.data_inicio).getFullYear()
  const evolucaoMensal = useLancamentosEvoluçaoMensal(anoBase)
  const comparativoLojas = useComparativoLojas(periodoAtual)
  const dreAtual = useDRE({ periodo: periodoAtual, lojaId: filters.loja_id || undefined, centroCustoId: filters.centro_custo_id || undefined })

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