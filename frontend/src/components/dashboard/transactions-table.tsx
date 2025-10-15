'use client'

import { Card } from '@/components/ui/card'
import { formatCurrency, formatDate } from '@/lib/utils'
import { RecentTransaction } from '@/hooks/use-dashboard-data'
import { ArrowUpIcon, ArrowDownIcon } from 'lucide-react'

interface TransactionsTableProps {
  transactions: RecentTransaction[]
  loading?: boolean
}

export function TransactionsTable({ transactions, loading }: TransactionsTableProps) {
  if (loading) {
    return (
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-slate-900 mb-4">
          Últimos Lançamentos
        </h3>
        <div className="space-y-3">
          {[...Array(5)].map((_, i) => (
            <div key={i} className="animate-pulse flex items-center gap-4 p-3 bg-slate-50 rounded-lg">
              <div className="h-8 w-8 bg-slate-300 rounded-full"></div>
              <div className="flex-1 space-y-2">
                <div className="h-4 bg-slate-300 rounded w-3/4"></div>
                <div className="h-3 bg-slate-200 rounded w-1/2"></div>
              </div>
              <div className="h-5 bg-slate-300 rounded w-20"></div>
            </div>
          ))}
        </div>
      </Card>
    )
  }

  if (transactions.length === 0) {
    return (
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-slate-900 mb-4">
          Últimos Lançamentos
        </h3>
        <div className="text-center py-8">
          <p className="text-slate-500">Nenhum lançamento encontrado</p>
        </div>
      </Card>
    )
  }

  return (
    <Card className="p-6 overflow-hidden">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-lg font-semibold text-slate-900">
          Últimos Lançamentos
        </h3>
        <span className="text-sm text-slate-500">
          {transactions.length} registro(s)
        </span>
      </div>
      
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-slate-200">
              <th className="text-left text-xs font-medium text-slate-500 uppercase tracking-wider pb-3">
                Data
              </th>
              <th className="text-left text-xs font-medium text-slate-500 uppercase tracking-wider pb-3">
                Descrição
              </th>
              <th className="text-left text-xs font-medium text-slate-500 uppercase tracking-wider pb-3">
                Categoria
              </th>
              <th className="text-left text-xs font-medium text-slate-500 uppercase tracking-wider pb-3">
                Loja
              </th>
              <th className="text-right text-xs font-medium text-slate-500 uppercase tracking-wider pb-3">
                Valor
              </th>
            </tr>
          </thead>
          <tbody className="divide-y divide-slate-100">
            {transactions.map((transaction) => (
              <tr key={transaction.id} className="hover:bg-slate-50 transition-colors">
                <td className="py-4 text-sm text-slate-900">
                  {formatDate(transaction.data)}
                </td>
                <td className="py-4">
                  <div className="flex items-center gap-3">
                    <div className={`p-1.5 rounded-full ${
                      transaction.tipo === 'receita' 
                        ? 'bg-emerald-100' 
                        : 'bg-red-100'
                    }`}>
                      {transaction.tipo === 'receita' ? (
                        <ArrowUpIcon className="h-3 w-3 text-emerald-600" />
                      ) : (
                        <ArrowDownIcon className="h-3 w-3 text-red-600" />
                      )}
                    </div>
                    <div>
                      <p className="text-sm font-medium text-slate-900 truncate max-w-[200px]">
                        {transaction.descricao}
                      </p>
                      <p className={`text-xs ${
                        transaction.tipo === 'receita' 
                          ? 'text-emerald-600' 
                          : 'text-red-600'
                      }`}>
                        {transaction.tipo === 'receita' ? 'Receita' : 'Despesa'}
                      </p>
                    </div>
                  </div>
                </td>
                <td className="py-4 text-sm text-slate-600">
                  <span className="px-2 py-1 rounded-full bg-slate-100 text-xs">
                    {transaction.categoria}
                  </span>
                </td>
                <td className="py-4 text-sm text-slate-600">
                  {transaction.loja}
                </td>
                <td className="py-4 text-right">
                  <span className={`text-sm font-semibold ${
                    transaction.tipo === 'receita' 
                      ? 'text-emerald-600' 
                      : 'text-red-600'
                  }`}>
                    {transaction.tipo === 'receita' ? '+' : '-'} {formatCurrency(transaction.valor)}
                  </span>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </Card>
  )
}