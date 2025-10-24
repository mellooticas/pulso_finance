'use client'

import { Line } from 'react-chartjs-2'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler,
  ChartOptions
} from 'chart.js'

// Registrar componentes do Chart.js
ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler
)

interface ForecastLineChartProps {
  dates: string[]
  predicted: number[]
  lowerBound: number[]
  upperBound: number[]
  title: string
  color?: string
  currency?: boolean
}

export function ForecastLineChart({
  dates,
  predicted,
  lowerBound,
  upperBound,
  title,
  color = 'rgb(59, 130, 246)', // blue-500
  currency = true
}: ForecastLineChartProps) {
  
  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr)
    return new Intl.DateTimeFormat('pt-BR', {
      day: '2-digit',
      month: 'short'
    }).format(date)
  }

  const formatValue = (value: number) => {
    if (currency) {
      return new Intl.NumberFormat('pt-BR', {
        style: 'currency',
        currency: 'BRL',
        minimumFractionDigits: 0,
        maximumFractionDigits: 0
      }).format(value)
    }
    return value.toFixed(2)
  }

  const data = {
    labels: dates.map(formatDate),
    datasets: [
      {
        label: 'Previsão',
        data: predicted,
        borderColor: color,
        backgroundColor: color.replace('rgb', 'rgba').replace(')', ', 0.1)'),
        borderWidth: 3,
        pointRadius: 0,
        pointHoverRadius: 6,
        pointHoverBackgroundColor: color,
        pointHoverBorderColor: '#fff',
        pointHoverBorderWidth: 2,
        tension: 0.4,
        fill: false
      },
      {
        label: 'Limite Superior',
        data: upperBound,
        borderColor: color.replace('rgb', 'rgba').replace(')', ', 0.3)'),
        backgroundColor: color.replace('rgb', 'rgba').replace(')', ', 0.05)'),
        borderWidth: 1,
        borderDash: [5, 5],
        pointRadius: 0,
        tension: 0.4,
        fill: '+1'
      },
      {
        label: 'Limite Inferior',
        data: lowerBound,
        borderColor: color.replace('rgb', 'rgba').replace(')', ', 0.3)'),
        backgroundColor: color.replace('rgb', 'rgba').replace(')', ', 0.15)'),
        borderWidth: 1,
        borderDash: [5, 5],
        pointRadius: 0,
        tension: 0.4,
        fill: '-1'
      }
    ]
  }

  const options: ChartOptions<'line'> = {
    responsive: true,
    maintainAspectRatio: false,
    interaction: {
      mode: 'index',
      intersect: false
    },
    plugins: {
      legend: {
        display: true,
        position: 'top',
        labels: {
          usePointStyle: true,
          padding: 15,
          font: {
            size: 12
          }
        }
      },
      title: {
        display: false
      },
      tooltip: {
        backgroundColor: 'rgba(0, 0, 0, 0.8)',
        padding: 12,
        titleFont: {
          size: 13,
          weight: 'bold'
        },
        bodyFont: {
          size: 12
        },
        callbacks: {
          label: function(context) {
            let label = context.dataset.label || ''
            if (label) {
              label += ': '
            }
            if (context.parsed.y !== null) {
              label += formatValue(context.parsed.y)
            }
            return label
          }
        }
      }
    },
    scales: {
      x: {
        grid: {
          display: false
        },
        ticks: {
          maxRotation: 45,
          minRotation: 45,
          font: {
            size: 11
          }
        }
      },
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(0, 0, 0, 0.05)'
        },
        ticks: {
          callback: function(value) {
            return formatValue(Number(value))
          },
          font: {
            size: 11
          }
        }
      }
    }
  }

  return (
    <div className="w-full" style={{ height: '400px' }}>
      <Line data={data} options={options} />
    </div>
  )
}
