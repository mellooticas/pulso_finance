'use client'

import { useState } from 'react'
import { useAuth } from '@/contexts/auth-context'
import { useDRE, useDREEvoluçaoMensal, useComparativoDRE } from '@/hooks/use-dre'
import { useLojas } from '@/hooks/use-lojas'
import { formatKPIValue } from '@/hooks/use-dashboard-real'
import { Card } from '@/components/ui/card'
import { 
  CalendarIcon,
  BuildingStorefrontIcon,
  ChartBarIcon,
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon
} from '@heroicons/react/24/outline'

export default function DREPage() {
  const { profile } = useAuth()
  const [periodo, setPeriodo] = useState(() => {
    const now = new Date()
    const currentYear = now.getFullYear()
    const currentMonth = now.getMonth() + 1
    
    return {
      inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
      fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
    }
  })
  
  const [lojaFiltro, setLojaFiltro] = useState<string>('')

  // Hooks de dados
  const { data: lojas } = useLojas()
  const { 
    data: dre, 
    isLoading: loadingDRE, 
    error: errorDRE 
  } = useDRE(periodo, lojaFiltro || undefined)
  
  const { 
    data: evolucao, 
    isLoading: loadingEvolucao 
  } = useDREEvoluçaoMensal(new Date().getFullYear(), lojaFiltro || undefined)
  
  const { 
    data: comparativo, 
    isLoading: loadingComparativo 
  } = useComparativoDRE(periodo)

  const handlePeriodoChange = (field: 'inicio' | 'fim', value: string) => {
    setPeriodo(prev => ({ ...prev, [field]: value }))
  }

  const calcularMargem = (resultado: number, receita: number) => {
    return receita > 0 ? (resultado / receita) * 100 : 0
  }

  if (loadingDRE) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Carregando DRE
          </h3>
          <p className="text-slate-600">
            Processando dados financeiros...
          </p>
        </div>
      </div>
    )
  }

  if (errorDRE) {
    return (
      <div className="p-6">
        <div className="bg-red-50 border border-red-200 rounded-lg p-4">
          <p className="text-red-800">Erro ao carregar DRE: {errorDRE.message}</p>
        </div>
      </div>
    )
  }

  return (
    <div className="p-6 max-w-7xl mx-auto space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Demonstração do Resultado do Exercício (DRE)
          </h1>
          <p className="text-gray-600 mt-1">
            Análise detalhada de receitas, despesas e resultado
          </p>
        </div>
      </div>

      {/* Filtros */}
      <Card className="p-4">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              <CalendarIcon className="w-4 h-4 inline mr-1" />
              Data Início
            </label>
            <input
              type="date"
              value={periodo.inicio}
              onChange={(e) => handlePeriodoChange('inicio', e.target.value)}
              className="w-full border border-gray-300 rounded-md px-3 py-2 text-sm"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              <CalendarIcon className="w-4 h-4 inline mr-1" />
              Data Fim
            </label>
            <input
              type="date"
              value={periodo.fim}
              onChange={(e) => handlePeriodoChange('fim', e.target.value)}
              className="w-full border border-gray-300 rounded-md px-3 py-2 text-sm"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              <BuildingStorefrontIcon className="w-4 h-4 inline mr-1" />
              Loja
            </label>
            <select
              value={lojaFiltro}
              onChange={(e) => setLojaFiltro(e.target.value)}
              className="w-full border border-gray-300 rounded-md px-3 py-2 text-sm"
            >
              <option value="">Todas as lojas</option>
              {lojas?.map(loja => (
                <option key={loja.id} value={loja.id}>
                  {loja.codigo} - {loja.nome}
                </option>
              ))}
            </select>
          </div>
        </div>
      </Card>

      {/* Resumo DRE */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Total de Receitas</p>
              <p className="text-2xl font-bold text-green-600">
                {formatKPIValue(dre?.receitas.total || 0, 'currency')}
              </p>
            </div>
            <div className="p-3 bg-green-100 rounded-full">
              <ArrowTrendingUpIcon className="w-6 h-6 text-green-600" />
            </div>
          </div>
          <p className="text-sm text-gray-500 mt-2">
            {dre?.receitas.contasArray?.length || 0} contas de receita
          </p>
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Total de Despesas</p>
              <p className="text-2xl font-bold text-red-600">
                {formatKPIValue(dre?.despesas.total || 0, 'currency')}
              </p>
            </div>
            <div className="p-3 bg-red-100 rounded-full">
              <ArrowTrendingDownIcon className="w-6 h-6 text-red-600" />
            </div>
          </div>
          <p className="text-sm text-gray-500 mt-2">
            {dre?.despesas.contasArray?.length || 0} contas de despesa
          </p>
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-600">Resultado</p>
              <p className={`text-2xl font-bold ${(dre?.resultado.liquido || 0) >= 0 ? 'text-blue-600' : 'text-red-600'}`}>
                {formatKPIValue(dre?.resultado.liquido || 0, 'currency')}
              </p>
            </div>
            <div className={`p-3 rounded-full ${(dre?.resultado.liquido || 0) >= 0 ? 'bg-blue-100' : 'bg-red-100'}`}>
              <ChartBarIcon className={`w-6 h-6 ${(dre?.resultado.liquido || 0) >= 0 ? 'text-blue-600' : 'text-red-600'}`} />
            </div>
          </div>
          <p className="text-sm text-gray-500 mt-2">
            Margem: {calcularMargem(dre?.resultado.liquido || 0, dre?.receitas.total || 0).toFixed(1)}%
          </p>
        </Card>
      </div>

      {/* DRE Detalhada */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Receitas */}
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <ArrowTrendingUpIcon className="w-5 h-5 text-green-600 mr-2" />
            Receitas
          </h3>
          
          <div className="space-y-3">
            {dre?.receitas.contasArray?.map((conta) => (
              <div key={conta.id} className="flex items-center justify-between p-3 bg-green-50 rounded-lg">
                <div>
                  <p className="font-medium text-gray-900">{conta.nome}</p>
                  <p className="text-sm text-gray-600">{conta.codigo}</p>
                </div>
                <div className="text-right">
                  <p className="font-medium text-green-600">
                    {formatKPIValue(conta.valor, 'currency')}
                  </p>
                  <p className="text-sm text-gray-600">
                    {((conta.valor / (dre?.receitas.total || 1)) * 100).toFixed(1)}%
                  </p>
                </div>
              </div>
            ))}
            
            {(!dre?.receitas.contasArray || dre.receitas.contasArray.length === 0) && (
              <p className="text-gray-500 text-center py-4">Nenhuma receita encontrada no período</p>
            )}
          </div>
        </Card>

        {/* Despesas */}
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <ArrowTrendingDownIcon className="w-5 h-5 text-red-600 mr-2" />
            Despesas
          </h3>
          
          <div className="space-y-3">
            {dre?.despesas.contasArray?.map((conta) => (
              <div key={conta.id} className="flex items-center justify-between p-3 bg-red-50 rounded-lg">
                <div>
                  <p className="font-medium text-gray-900">{conta.nome}</p>
                  <p className="text-sm text-gray-600">{conta.codigo}</p>
                </div>
                <div className="text-right">
                  <p className="font-medium text-red-600">
                    {formatKPIValue(conta.valor, 'currency')}
                  </p>
                  <p className="text-sm text-gray-600">
                    {((conta.valor / (dre?.despesas.total || 1)) * 100).toFixed(1)}%
                  </p>
                </div>
              </div>
            ))}
            
            {(!dre?.despesas.contasArray || dre.despesas.contasArray.length === 0) && (
              <p className="text-gray-500 text-center py-4">Nenhuma despesa encontrada no período</p>
            )}
          </div>
        </Card>
      </div>

      {/* Comparativo por Loja */}
      {!lojaFiltro && (
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <ChartBarIcon className="w-5 h-5 text-blue-600 mr-2" />
            Resultado por Loja
          </h3>
          
          {loadingComparativo ? (
            <div className="animate-pulse space-y-3">
              {[...Array(3)].map((_, i) => (
                <div key={i} className="h-16 bg-gray-200 rounded-lg"></div>
              ))}
            </div>
          ) : (
            <div className="space-y-3">
              {comparativo?.map((item) => (
                <div key={item.loja.id} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                  <div>
                    <p className="font-medium text-gray-900">{item.loja.codigo}</p>
                    <p className="text-sm text-gray-600">{item.loja.nome}</p>
                  </div>
                  <div className="text-right">
                    <p className={`font-medium text-lg ${item.resultado >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                      {formatKPIValue(item.resultado, 'currency')}
                    </p>
                    <p className="text-sm text-gray-600">
                      Margem: {item.margemBruta.toFixed(1)}% | Part.: {item.participacao.toFixed(1)}%
                    </p>
                  </div>
                </div>
              ))}
              
              {(!comparativo || comparativo.length === 0) && (
                <p className="text-gray-500 text-center py-4">Nenhum dado encontrado no período</p>
              )}
            </div>
          )}
        </Card>
      )}

      {/* Evolução Mensal */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
          <ChartBarIcon className="w-5 h-5 text-purple-600 mr-2" />
          Evolução Mensal {new Date().getFullYear()}
        </h3>
        
        {loadingEvolucao ? (
          <div className="animate-pulse">
            <div className="h-40 bg-gray-200 rounded-lg"></div>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <div className="grid grid-cols-12 gap-2 min-w-full">
              {evolucao?.map((mes) => (
                <div key={mes.mes} className="text-center">
                  <div className="text-xs text-gray-600 mb-2 font-medium">
                    {mes.nome}
                  </div>
                  
                  <div className="space-y-1">
                    <div className="h-20 flex items-end justify-center bg-gray-50 rounded-lg p-1">
                      <div 
                        className="bg-green-500 rounded-t w-4"
                        style={{ 
                          height: `${Math.max(5, (mes.receitas / Math.max(...(evolucao?.map(m => m.receitas) || [1]))) * 70)}px` 
                        }}
                        title={`Receitas: ${formatKPIValue(mes.receitas, 'currency')}`}
                      ></div>
                      <div 
                        className="bg-red-500 rounded-t w-4 ml-1"
                        style={{ 
                          height: `${Math.max(5, (mes.despesas / Math.max(...(evolucao?.map(m => m.despesas) || [1]))) * 70)}px` 
                        }}
                        title={`Despesas: ${formatKPIValue(mes.despesas, 'currency')}`}
                      ></div>
                    </div>
                    
                    <div className={`text-xs font-medium ${mes.resultado >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                      {mes.resultado >= 0 ? '+' : ''}{(mes.resultado / 1000).toFixed(0)}k
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        )}
      </Card>
    </div>
  )
}