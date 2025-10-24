'use client'

export function useExportData() {
  
  const exportToCSV = (data: any[], filename: string) => {
    if (!data || data.length === 0) {
      alert('Não há dados para exportar')
      return
    }

    // Pegar headers das keys do primeiro objeto
    const headers = Object.keys(data[0])
    
    // Criar linhas CSV
    const csvContent = [
      headers.join(','), // Header
      ...data.map(row => 
        headers.map(header => {
          const value = row[header]
          // Escapar valores com vírgula ou aspas
          if (typeof value === 'string' && (value.includes(',') || value.includes('"'))) {
            return `"${value.replace(/"/g, '""')}"`
          }
          return value
        }).join(',')
      )
    ].join('\n')

    // Criar blob e download
    const blob = new Blob(['\ufeff' + csvContent], { type: 'text/csv;charset=utf-8;' })
    const link = document.createElement('a')
    link.href = URL.createObjectURL(blob)
    link.download = `${filename}_${new Date().toISOString().split('T')[0]}.csv`
    link.click()
    URL.revokeObjectURL(link.href)
  }

  const exportForecastToCSV = (forecast: any, type: 'receitas' | 'despesas') => {
    if (!forecast) return

    const data = forecast.forecast.dates.map((date: string, i: number) => ({
      Data: new Date(date).toLocaleDateString('pt-BR'),
      Previsto: forecast.forecast.predicted[i].toFixed(2),
      'Limite Inferior': forecast.forecast.lower_bound[i].toFixed(2),
      'Limite Superior': forecast.forecast.upper_bound[i].toFixed(2),
      Tendência: forecast.forecast.trend[i].toFixed(2)
    }))

    exportToCSV(data, `previsao_${type}`)
  }

  const exportFluxoCaixaToCSV = (fluxo: any) => {
    if (!fluxo) return

    const data = fluxo.dates.map((date: string, i: number) => ({
      Data: new Date(date).toLocaleDateString('pt-BR'),
      Receitas: fluxo.receitas_previstas[i].toFixed(2),
      Despesas: fluxo.despesas_previstas[i].toFixed(2),
      'Fluxo Diário': fluxo.fluxo_caixa_diario[i].toFixed(2),
      'Saldo Acumulado': fluxo.saldo_acumulado[i].toFixed(2)
    }))

    exportToCSV(data, 'fluxo_caixa')
  }

  const exportAnomaliesToCSV = (anomalies: any[], type: string) => {
    if (!anomalies || anomalies.length === 0) {
      alert('Não há anomalias para exportar')
      return
    }

    const data = anomalies.map(anomaly => ({
      Data: new Date(anomaly.date).toLocaleDateString('pt-BR'),
      'Valor Real': anomaly.actual.toFixed(2),
      'Valor Esperado': anomaly.expected.toFixed(2),
      'Desvio': anomaly.deviation.toFixed(2),
      Severidade: anomaly.severity
    }))

    exportToCSV(data, `anomalias_${type}`)
  }

  return {
    exportToCSV,
    exportForecastToCSV,
    exportFluxoCaixaToCSV,
    exportAnomaliesToCSV
  }
}
