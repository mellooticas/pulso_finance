'use client'

import { useState } from 'react'
import { useLancamentos } from '@/hooks/use-lancamentos'
import { useLojas } from '@/hooks/use-lojas'
import { Card } from '@/components/ui/card'
import { 
  CalendarIcon,
  ChartBarIcon,
  ArrowDownTrayIcon,
  BuildingStorefrontIcon,
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon,
  TrendingUpIcon,
  DocumentTextIcon
} from '@heroicons/react/24/outline'

interface ComparativoItem {
  categoria: string
  periodo1: {
    receitas: number
    despesas: number
    resultado: number
    transacoes: number
  }
  periodo2: {
    receitas: number
    despesas: number
    resultado: number
    transacoes: number
  }
  variacao: {
    receitas: number
    despesas: number
    resultado: number
    percentualReceitas: number
    percentualDespesas: number
    percentualResultado: number
  }
}

export default function ComparativosPage() {
  const [periodos, setPeriodos] = useState(() => {
    const now = new Date()
    const currentYear = now.getFullYear()
    const currentMonth = now.getMonth() + 1
    const previousMonth = currentMonth === 1 ? 12 : currentMonth - 1
    const previousYear = currentMonth === 1 ? currentYear - 1 : currentYear
    
    return {
      periodo1: {
        inicio: `${previousYear}-${previousMonth.toString().padStart(2, '0')}-01`,
        fim: new Date(previousYear, previousMonth, 0).toISOString().split('T')[0],
        nome: 'Período Anterior'
      },
      periodo2: {
        inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
        fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0],
        nome: 'Período Atual'
      }
    }
  })

  const [filtros, setFiltros] = useState({
    loja: '',
    tipoComparativo: 'categoria' // categoria, loja, periodo
  })

  // Dados
  const { data: lojas } = useLojas()
  
  // Lançamentos do período 1
  const { data: lancamentosPeriodo1 } = useLancamentos({
    data_inicio: periodos.periodo1.inicio,
    data_fim: periodos.periodo1.fim,
    loja_id: filtros.loja || undefined,
    pagina: 1,
    itensPorPagina: 10000
  })

  // Lançamentos do período 2
  const { data: lancamentosPeriodo2 } = useLancamentos({
    data_inicio: periodos.periodo2.inicio,
    data_fim: periodos.periodo2.fim,
    loja_id: filtros.loja || undefined,
    pagina: 1,
    itensPorPagina: 10000
  })

  // Processar comparativo por categoria
  const processarComparativoPorCategoria = (): ComparativoItem[] => {
    if (!lancamentosPeriodo1 || !lancamentosPeriodo2) {
      return []
    }

    const categorias = new Set<string>()
    
    // Coletar todas as categorias
    const todosLancamentos = [...lancamentosPeriodo1, ...lancamentosPeriodo2]
    todosLancamentos.forEach((lancamento: any) => {
      if (lancamento.plano_conta?.categoria) {
        categorias.add(lancamento.plano_conta.categoria)
      }
    })

    return Array.from(categorias).map(categoria => {
      // Dados período 1
      const periodo1Data = lancamentosPeriodo1
        .filter((l: any) => l.plano_conta?.categoria === categoria)
        .reduce((acc: any, l: any) => {
          if (l.tipo === 'receber') {
            acc.receitas += l.valor_total
          } else {
            acc.despesas += l.valor_total
          }
          acc.transacoes += 1
          return acc
        }, { receitas: 0, despesas: 0, transacoes: 0 })
      
      periodo1Data.resultado = periodo1Data.receitas - periodo1Data.despesas

      // Dados período 2
      const periodo2Data = lancamentosPeriodo2
        .filter((l: any) => l.plano_conta?.categoria === categoria)
        .reduce((acc: any, l: any) => {
          if (l.tipo === 'receber') {
            acc.receitas += l.valor_total
          } else {
            acc.despesas += l.valor_total
          }
          acc.transacoes += 1
          return acc
        }, { receitas: 0, despesas: 0, transacoes: 0 })
      
      periodo2Data.resultado = periodo2Data.receitas - periodo2Data.despesas

      // Calcular variações
      const variacaoReceitas = periodo2Data.receitas - periodo1Data.receitas
      const variacaoDespesas = periodo2Data.despesas - periodo1Data.despesas
      const variacaoResultado = periodo2Data.resultado - periodo1Data.resultado

      const percentualReceitas = periodo1Data.receitas > 0 
        ? (variacaoReceitas / periodo1Data.receitas) * 100 
        : 0

      const percentualDespesas = periodo1Data.despesas > 0 
        ? (variacaoDespesas / periodo1Data.despesas) * 100 
        : 0

      const percentualResultado = periodo1Data.resultado !== 0 
        ? (variacaoResultado / Math.abs(periodo1Data.resultado)) * 100 
        : 0

      return {
        categoria,
        periodo1: periodo1Data,
        periodo2: periodo2Data,
        variacao: {
          receitas: variacaoReceitas,
          despesas: variacaoDespesas,
          resultado: variacaoResultado,
          percentualReceitas,
          percentualDespesas,
          percentualResultado
        }
      }
    }).sort((a, b) => Math.abs(b.variacao.resultado) - Math.abs(a.variacao.resultado))
  }

  const comparativo = processarComparativoPorCategoria()

  // Totais gerais
  const totais = comparativo.reduce((acc, item) => ({
    periodo1: {
      receitas: acc.periodo1.receitas + item.periodo1.receitas,
      despesas: acc.periodo1.despesas + item.periodo1.despesas,
      resultado: acc.periodo1.resultado + item.periodo1.resultado,
      transacoes: acc.periodo1.transacoes + item.periodo1.transacoes
    },
    periodo2: {
      receitas: acc.periodo2.receitas + item.periodo2.receitas,
      despesas: acc.periodo2.despesas + item.periodo2.despesas,
      resultado: acc.periodo2.resultado + item.periodo2.resultado,
      transacoes: acc.periodo2.transacoes + item.periodo2.transacoes
    }
  }), {
    periodo1: { receitas: 0, despesas: 0, resultado: 0, transacoes: 0 },
    periodo2: { receitas: 0, despesas: 0, resultado: 0, transacoes: 0 }
  })

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value)
  }

  const formatPercentage = (value: number) => {
    const sign = value >= 0 ? '+' : ''
    return `${sign}${value.toFixed(1)}%`
  }

  const getVariationColor = (value: number, isExpense = false) => {
    if (isExpense) {
      return value > 0 ? 'text-red-600' : 'text-green-600'
    }
    return value >= 0 ? 'text-green-600' : 'text-red-600'
  }

  const getVariationIcon = (value: number, isExpense = false) => {
    const isPositive = isExpense ? value < 0 : value >= 0
    return isPositive ? ArrowTrendingUpIcon : ArrowTrendingDownIcon
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Análise Comparativa</h1>
          <p className="text-gray-600">
            Comparar resultados entre períodos • {comparativo.length} categorias
          </p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Exportar Relatório
          </button>
        </div>
      </div>

      {/* Configurações */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-6 gap-4">
          {/* Período 1 */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Início Período 1</label>
            <input
              type="date"
              value={periodos.periodo1.inicio}
              onChange={(e) => setPeriodos(prev => ({
                ...prev,
                periodo1: { ...prev.periodo1, inicio: e.target.value }
              }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Fim Período 1</label>
            <input
              type="date"
              value={periodos.periodo1.fim}
              onChange={(e) => setPeriodos(prev => ({
                ...prev,
                periodo1: { ...prev.periodo1, fim: e.target.value }
              }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          {/* Período 2 */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Início Período 2</label>
            <input
              type="date"
              value={periodos.periodo2.inicio}
              onChange={(e) => setPeriodos(prev => ({
                ...prev,
                periodo2: { ...prev.periodo2, inicio: e.target.value }
              }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Fim Período 2</label>
            <input
              type="date"
              value={periodos.periodo2.fim}
              onChange={(e) => setPeriodos(prev => ({
                ...prev,
                periodo2: { ...prev.periodo2, fim: e.target.value }
              }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          {/* Loja */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Loja</label>
            <select
              value={filtros.loja}
              onChange={(e) => setFiltros(prev => ({ ...prev, loja: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Todas as lojas</option>
              {lojas?.map(loja => (
                <option key={loja.id} value={loja.id}>
                  {loja.codigo} - {loja.nome}
                </option>
              ))}
            </select>
          </div>

          {/* Tipo de Comparativo */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Comparar por</label>
            <select
              value={filtros.tipoComparativo}
              onChange={(e) => setFiltros(prev => ({ ...prev, tipoComparativo: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="categoria">Categoria</option>
              <option value="loja">Loja</option>
              <option value="periodo">Período</option>
            </select>
          </div>
        </div>
      </Card>

      {/* Resumo Geral */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Receitas P1 vs P2</p>
              <p className="text-2xl font-bold text-green-600">
                {formatCurrency(totais.periodo2.receitas)}
              </p>
              <p className="text-sm text-gray-500">
                vs {formatCurrency(totais.periodo1.receitas)}
              </p>
            </div>
            <div className="text-right">
              <p className={`text-sm font-medium ${getVariationColor(totais.periodo2.receitas - totais.periodo1.receitas)}`}>
                {formatCurrency(totais.periodo2.receitas - totais.periodo1.receitas)}
              </p>
              <p className={`text-xs ${getVariationColor(totais.periodo2.receitas - totais.periodo1.receitas)}`}>
                {formatPercentage(totais.periodo1.receitas > 0 ? ((totais.periodo2.receitas - totais.periodo1.receitas) / totais.periodo1.receitas) * 100 : 0)}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Despesas P1 vs P2</p>
              <p className="text-2xl font-bold text-red-600">
                {formatCurrency(totais.periodo2.despesas)}
              </p>
              <p className="text-sm text-gray-500">
                vs {formatCurrency(totais.periodo1.despesas)}
              </p>
            </div>
            <div className="text-right">
              <p className={`text-sm font-medium ${getVariationColor(totais.periodo2.despesas - totais.periodo1.despesas, true)}`}>
                {formatCurrency(totais.periodo2.despesas - totais.periodo1.despesas)}
              </p>
              <p className={`text-xs ${getVariationColor(totais.periodo2.despesas - totais.periodo1.despesas, true)}`}>
                {formatPercentage(totais.periodo1.despesas > 0 ? ((totais.periodo2.despesas - totais.periodo1.despesas) / totais.periodo1.despesas) * 100 : 0)}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Resultado P1 vs P2</p>
              <p className={`text-2xl font-bold ${totais.periodo2.resultado >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                {formatCurrency(totais.periodo2.resultado)}
              </p>
              <p className="text-sm text-gray-500">
                vs {formatCurrency(totais.periodo1.resultado)}
              </p>
            </div>
            <div className="text-right">
              <p className={`text-sm font-medium ${getVariationColor(totais.periodo2.resultado - totais.periodo1.resultado)}`}>
                {formatCurrency(totais.periodo2.resultado - totais.periodo1.resultado)}
              </p>
              <p className={`text-xs ${getVariationColor(totais.periodo2.resultado - totais.periodo1.resultado)}`}>
                {formatPercentage(totais.periodo1.resultado !== 0 ? ((totais.periodo2.resultado - totais.periodo1.resultado) / Math.abs(totais.periodo1.resultado)) * 100 : 0)}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm text-gray-600">Transações P1 vs P2</p>
              <p className="text-2xl font-bold text-blue-600">
                {totais.periodo2.transacoes}
              </p>
              <p className="text-sm text-gray-500">
                vs {totais.periodo1.transacoes}
              </p>
            </div>
            <div className="text-right">
              <p className={`text-sm font-medium ${getVariationColor(totais.periodo2.transacoes - totais.periodo1.transacoes)}`}>
                {totais.periodo2.transacoes - totais.periodo1.transacoes > 0 ? '+' : ''}{totais.periodo2.transacoes - totais.periodo1.transacoes}
              </p>
            </div>
          </div>
        </Card>
      </div>

      {/* Tabela Comparativa */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-2">Categoria</div>
            <div className="col-span-2">Receitas P1 | P2</div>
            <div className="col-span-2">Despesas P1 | P2</div>
            <div className="col-span-2">Resultado P1 | P2</div>
            <div className="col-span-2">Variação Receitas</div>
            <div className="col-span-2">Variação Resultado</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200 max-h-96 overflow-y-auto">
          {comparativo.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <ChartBarIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum dado para comparação</p>
              <p className="text-sm">Verifique os períodos selecionados</p>
            </div>
          ) : (
            comparativo.map((item) => {
              const VariationIconReceitas = getVariationIcon(item.variacao.receitas)
              const VariationIconResultado = getVariationIcon(item.variacao.resultado)

              return (
                <div key={item.categoria} className="px-6 py-4 hover:bg-gray-50">
                  <div className="grid grid-cols-12 gap-4 items-center">
                    <div className="col-span-2">
                      <div className="flex items-center">
                        <DocumentTextIcon className="w-4 h-4 mr-2 text-gray-400" />
                        <span className="text-sm font-medium text-gray-900">
                          {item.categoria}
                        </span>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <div className="text-sm">
                        <div className="text-green-600">{formatCurrency(item.periodo1.receitas)}</div>
                        <div className="text-green-700 font-medium">{formatCurrency(item.periodo2.receitas)}</div>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <div className="text-sm">
                        <div className="text-red-600">{formatCurrency(item.periodo1.despesas)}</div>
                        <div className="text-red-700 font-medium">{formatCurrency(item.periodo2.despesas)}</div>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <div className="text-sm">
                        <div className={item.periodo1.resultado >= 0 ? 'text-blue-600' : 'text-red-600'}>
                          {formatCurrency(item.periodo1.resultado)}
                        </div>
                        <div className={`font-medium ${item.periodo2.resultado >= 0 ? 'text-blue-700' : 'text-red-700'}`}>
                          {formatCurrency(item.periodo2.resultado)}
                        </div>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <div className={`flex items-center text-sm ${getVariationColor(item.variacao.receitas)}`}>
                        <VariationIconReceitas className="w-4 h-4 mr-1" />
                        <div>
                          <div>{formatCurrency(item.variacao.receitas)}</div>
                          <div className="text-xs">{formatPercentage(item.variacao.percentualReceitas)}</div>
                        </div>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <div className={`flex items-center text-sm ${getVariationColor(item.variacao.resultado)}`}>
                        <VariationIconResultado className="w-4 h-4 mr-1" />
                        <div>
                          <div>{formatCurrency(item.variacao.resultado)}</div>
                          <div className="text-xs">{formatPercentage(item.variacao.percentualResultado)}</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              )
            })
          )}
        </div>
      </Card>
    </div>
  )
}