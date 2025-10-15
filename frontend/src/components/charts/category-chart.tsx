'use client'

import { Doughnut } from 'react-chartjs-2'
import {
  Chart as ChartJS,
  ArcElement,
  Tooltip,
  Legend,
} from 'chart.js'
import { ChartData } from '@/hooks/use-dashboard-data'

ChartJS.register(ArcElement, Tooltip, Legend)

interface CategoryChartProps {
  data: ChartData | null
  className?: string
}

export function CategoryChart({ data, className = "" }: CategoryChartProps) {
  if (!data) {
    return (
      <div className={`flex items-center justify-center h-64 bg-slate-50 rounded-lg ${className}`}>
        <div className="text-center">
          <div className="animate-pulse">
            <div className="h-4 bg-slate-300 rounded w-32 mx-auto mb-2"></div>
            <div className="h-3 bg-slate-200 rounded w-24 mx-auto"></div>
          </div>
        </div>
      </div>
    )
  }

  const options = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'right' as const,
        labels: {
          usePointStyle: true,
          padding: 15,
          font: {
            size: 11,
            weight: 'bold' as const
          },
          generateLabels: function(chart: any) {
            const data = chart.data
            if (data.labels && data.datasets[0].data) {
              return data.labels.map((label: string, i: number) => {
                const value = data.datasets[0].data[i]
                const formattedValue = new Intl.NumberFormat('pt-BR', {
                  style: 'currency',
                  currency: 'BRL',
                  minimumFractionDigits: 0,
                  maximumFractionDigits: 0
                }).format(value)
                
                return {
                  text: `${label}: ${formattedValue}`,
                  fillStyle: data.datasets[0].backgroundColor[i],
                  strokeStyle: data.datasets[0].backgroundColor[i],
                  lineWidth: 0,
                  hidden: false,
                  index: i
                }
              })
            }
            return []
          }
        }
      },
      tooltip: {
        backgroundColor: 'rgba(15, 23, 42, 0.95)',
        titleColor: '#ffffff',
        bodyColor: '#ffffff',
        borderColor: 'rgba(99, 102, 241, 0.8)',
        borderWidth: 1,
        cornerRadius: 8,
        displayColors: true,
        callbacks: {
          label: function(context: any) {
            const total = context.dataset.data.reduce((a: number, b: number) => a + b, 0)
            const percentage = ((context.parsed * 100) / total).toFixed(1)
            const value = new Intl.NumberFormat('pt-BR', {
              style: 'currency',
              currency: 'BRL'
            }).format(context.parsed)
            return `${context.label}: ${value} (${percentage}%)`
          }
        }
      }
    },
    cutout: '50%',
    elements: {
      arc: {
        borderWidth: 2,
        borderColor: '#ffffff'
      }
    }
  }

  return (
    <div className={`h-64 ${className}`}>
      <Doughnut data={data} options={options} />
    </div>
  )
}