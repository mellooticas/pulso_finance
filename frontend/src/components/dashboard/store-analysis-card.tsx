'use client'

import { Card } from '@/components/ui/card'
import { formatCurrency, formatPercent } from '@/lib/utils'
import { StoreAnalysis } from '@/hooks/use-dashboard-data'
import { Building2, TrendingUp, TrendingDown } from 'lucide-react'

interface StoreAnalysisCardProps {
  stores: StoreAnalysis[]
  loading?: boolean
}

export function StoreAnalysisCard({ stores, loading }: StoreAnalysisCardProps) {
  if (loading) {
    return (
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-slate-900 mb-4">
          Performance por Loja
        </h3>
        <div className="space-y-4">
          {[...Array(3)].map((_, i) => (
            <div key={i} className="animate-pulse">
              <div className="flex items-center justify-between p-4 bg-slate-50 rounded-lg">
                <div className="flex items-center gap-3">
                  <div className="h-10 w-10 bg-slate-300 rounded-lg"></div>
                  <div className="space-y-2">
                    <div className="h-4 bg-slate-300 rounded w-24"></div>
                    <div className="h-3 bg-slate-200 rounded w-16"></div>
                  </div>
                </div>
                <div className="h-6 bg-slate-300 rounded w-20"></div>
              </div>
            </div>
          ))}
        </div>
      </Card>
    )
  }

  if (stores.length === 0) {
    return (
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-slate-900 mb-4">
          Performance por Loja
        </h3>
        <div className="text-center py-8">
          <Building2 className="h-12 w-12 text-slate-300 mx-auto mb-3" />
          <p className="text-slate-500">Nenhuma loja encontrada</p>
        </div>
      </Card>
    )
  }

  return (
    <Card className="p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-lg font-semibold text-slate-900">
          Performance por Loja
        </h3>
        <span className="text-sm text-slate-500">
          {stores.length} loja(s)
        </span>
      </div>
      
      <div className="space-y-4">
        {stores.map((store, index) => {
          const isPositive = store.lucro > 0
          const isTopPerformer = index === 0 && store.lucro > 0
          
          return (
            <div
              key={store.loja_id}
              className={`relative p-4 rounded-lg border transition-all duration-200 hover:shadow-md ${
                isTopPerformer 
                  ? 'bg-gradient-to-r from-emerald-50 to-emerald-25 border-emerald-200' 
                  : 'bg-slate-50 border-slate-200 hover:bg-slate-100'
              }`}
            >
              {isTopPerformer && (
                <div className="absolute -top-2 -right-2">
                  <div className="bg-emerald-500 text-white text-xs px-2 py-1 rounded-full font-semibold">
                    TOP
                  </div>
                </div>
              )}
              
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-4">
                  <div className={`p-3 rounded-lg ${
                    isPositive ? 'bg-emerald-100' : 'bg-red-100'
                  }`}>
                    <Building2 className={`h-5 w-5 ${
                      isPositive ? 'text-emerald-600' : 'text-red-600'
                    }`} />
                  </div>
                  
                  <div>
                    <h4 className="font-semibold text-slate-900">
                      {store.nome}
                    </h4>
                    <div className="flex items-center gap-4 mt-1">
                      <span className="text-xs text-slate-500">
                        Receita: {formatCurrency(store.receita)}
                      </span>
                      <span className="text-xs text-slate-500">
                        Despesa: {formatCurrency(store.despesa)}
                      </span>
                    </div>
                  </div>
                </div>
                
                <div className="text-right">
                  <div className="flex items-center gap-2 mb-1">
                    {isPositive ? (
                      <TrendingUp className="h-4 w-4 text-emerald-600" />
                    ) : (
                      <TrendingDown className="h-4 w-4 text-red-600" />
                    )}
                    <span className={`font-semibold ${
                      isPositive ? 'text-emerald-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(store.lucro)}
                    </span>
                  </div>
                  
                  <div className={`text-xs px-2 py-1 rounded-full ${
                    store.margem > 0 
                      ? 'bg-emerald-100 text-emerald-700' 
                      : 'bg-red-100 text-red-700'
                  }`}>
                    Margem: {formatPercent(store.margem)}
                  </div>
                </div>
              </div>
              
              {/* Barra de progresso visual */}
              <div className="mt-3">
                <div className="flex justify-between text-xs text-slate-500 mb-1">
                  <span>Margem de Lucro</span>
                  <span>{store.margem.toFixed(1)}%</span>
                </div>
                <div className="w-full bg-slate-200 rounded-full h-2">
                  <div
                    className={`h-2 rounded-full transition-all duration-500 ${
                      store.margem > 0 ? 'bg-emerald-500' : 'bg-red-500'
                    }`}
                    style={{
                      width: `${Math.min(Math.abs(store.margem), 100)}%`
                    }}
                  />
                </div>
              </div>
            </div>
          )
        })}
      </div>
      
      {stores.length > 0 && (
        <div className="mt-6 pt-4 border-t border-slate-200">
          <div className="grid grid-cols-3 gap-4 text-center">
            <div>
              <p className="text-xs text-slate-500 mb-1">Total Receitas</p>
              <p className="font-semibold text-emerald-600">
                {formatCurrency(stores.reduce((sum, store) => sum + store.receita, 0))}
              </p>
            </div>
            <div>
              <p className="text-xs text-slate-500 mb-1">Total Despesas</p>
              <p className="font-semibold text-red-600">
                {formatCurrency(stores.reduce((sum, store) => sum + store.despesa, 0))}
              </p>
            </div>
            <div>
              <p className="text-xs text-slate-500 mb-1">Lucro Total</p>
              <p className={`font-semibold ${
                stores.reduce((sum, store) => sum + store.lucro, 0) > 0 
                  ? 'text-emerald-600' 
                  : 'text-red-600'
              }`}>
                {formatCurrency(stores.reduce((sum, store) => sum + store.lucro, 0))}
              </p>
            </div>
          </div>
        </div>
      )}
    </Card>
  )
}