'use client'

import { TrendingUp, TrendingDown, DollarSign, Minus } from 'lucide-react'
import { Card } from '@/components/ui/card'
import { cn, formatCurrency } from '@/lib/utils'
import { DashboardKPI } from '@/hooks/use-dashboard-data'

interface KPICardProps {
  kpi: DashboardKPI
  className?: string
}

export function KPICard({ kpi, className }: KPICardProps) {
  const getIcon = () => {
    switch (kpi.icon) {
      case 'TrendingUp':
        return TrendingUp
      case 'TrendingDown':
        return TrendingDown
      case 'DollarSign':
        return DollarSign
      case 'Banknote':
        return DollarSign
      default:
        return DollarSign
    }
  }

  const Icon = getIcon()

  const getChangeIcon = () => {
    switch (kpi.changeType) {
      case 'increase':
        return <TrendingUp className="h-4 w-4" />
      case 'decrease':
        return <TrendingDown className="h-4 w-4" />
      default:
        return <Minus className="h-4 w-4" />
    }
  }

  const getChangeColor = () => {
    switch (kpi.changeType) {
      case 'increase':
        return 'text-emerald-600 bg-emerald-50'
      case 'decrease':
        return 'text-red-600 bg-red-50'
      default:
        return 'text-slate-600 bg-slate-50'
    }
  }

  return (
    <Card className={cn("p-6 hover:shadow-lg transition-all duration-200 border-0 bg-gradient-to-br from-white to-slate-50", className)}>
      <div className="flex items-center justify-between">
        <div className="flex-1">
          <div className="flex items-center gap-3 mb-2">
            <div className="p-2 rounded-lg bg-blue-50">
              <Icon className="h-5 w-5 text-blue-600" />
            </div>
            <p className="text-sm font-medium text-slate-600 leading-tight">
              {kpi.name}
            </p>
          </div>
          
          <div className="space-y-2">
            <p className="text-3xl font-bold text-slate-900 tracking-tight">
              {kpi.value}
            </p>
            
            <div className="flex items-center justify-between">
              <div className={cn(
                "flex items-center gap-1 px-2 py-1 rounded-full text-xs font-semibold",
                getChangeColor()
              )}>
                {getChangeIcon()}
                <span>{kpi.change}</span>
              </div>
              
              <p className="text-xs text-slate-500 text-right leading-tight">
                {kpi.description}
              </p>
            </div>
          </div>
        </div>
      </div>
    </Card>
  )
}