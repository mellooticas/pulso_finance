'use client'

import { useState } from 'react'
import { usePlanoContas } from '@/hooks/use-dre'
import { useLancamentos } from '@/hooks/use-lancamentos'
import { useLojas } from '@/hooks/use-lojas'
import { useCentrosCusto } from '@/hooks/use-centros-custo'
import { Card } from '@/components/ui/card'
import { 
  CalendarIcon,
  ChartBarIcon,
  ArrowDownTrayIcon,
  BuildingStorefrontIcon,
  DocumentTextIcon,
  CalculatorIcon,
  FunnelIcon
} from '@heroicons/react/24/outline'

interface BalanceteItem {
  conta: {
    id: string
    codigo: string
    nome: string
    categoria: string
    tipo: 'receita' | 'despesa'
  }
  saldoAnterior: number
  debitos: number
  creditos: number
  saldoAtual: number
}

export default function BalancetePage() {
  const [periodo, setPeriodo] = useState(() => {
    const now = new Date()
    const currentYear = now.getFullYear()
    const currentMonth = now.getMonth() + 1
    
    return {
      inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
      fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
    }
  })

  const [filtros, setFiltros] = useState({
    loja: '',
    centroCusto: '',
    categoria: '',
    tipo: '',
    apenasComMovimento: false
  })

  // Dados
  const { data: planoContas } = usePlanoContas()
  const { data: lojas } = useLojas()
  const { data: centrosCusto } = useCentrosCusto()
  
  // Lançamentos do período
  const { data: lancamentosPeriodo } = useLancamentos({
    data_inicio: periodo.inicio,
    data_fim: periodo.fim,
    loja_id: filtros.loja || undefined,
    centro_custo_id: filtros.centroCusto || undefined
  })

  // Lançamentos anteriores ao período (para saldo anterior)
  const { data: lancamentosAnteriores } = useLancamentos({
    data_inicio: '2020-01-01',
    data_fim: new Date(new Date(periodo.inicio).getTime() - 24*60*60*1000).toISOString().split('T')[0],
    loja_id: filtros.loja || undefined,
    centro_custo_id: filtros.centroCusto || undefined
  })

  // Processar dados do balancete
  const processarBalancete = (): BalanceteItem[] => {
    if (!planoContas || !lancamentosPeriodo || !lancamentosAnteriores) {
      return []
    }

    const balanceteMap = new Map<string, BalanceteItem>()

    // Inicializar todas as contas
    planoContas.forEach((conta: any) => {
      balanceteMap.set(conta.id, {
        conta: {
          id: conta.id,
          codigo: conta.codigo,
          nome: conta.nome,
          categoria: conta.categoria,
          tipo: conta.tipo
        },
        saldoAnterior: 0,
        debitos: 0,
        creditos: 0,
        saldoAtual: 0
      })
    })

    // Processar lançamentos anteriores (saldo anterior)
    lancamentosAnteriores.forEach((lancamento: any) => {
      if (!lancamento.plano_conta) return

      const item = balanceteMap.get(lancamento.plano_conta.id)
      if (item) {
        if (lancamento.tipo === 'receita') {
          item.saldoAnterior += lancamento.valor_total || lancamento.valor || 0
        } else {
          item.saldoAnterior -= lancamento.valor_total || lancamento.valor || 0
        }
      }
    })

    // Processar lançamentos do período
    lancamentosPeriodo.forEach((lancamento: any) => {
      if (!lancamento.plano_conta) return

      const item = balanceteMap.get(lancamento.plano_conta.id)
      if (item) {
        if (lancamento.tipo === 'receita') {
          item.creditos += lancamento.valor_total || lancamento.valor || 0
        } else {
          item.debitos += lancamento.valor_total || lancamento.valor || 0
        }
      }
    })

    // Calcular saldo atual
    balanceteMap.forEach((item) => {
      if (item.conta.tipo === 'receita') {
        item.saldoAtual = item.saldoAnterior + item.creditos - item.debitos
      } else {
        item.saldoAtual = item.saldoAnterior + item.debitos - item.creditos
      }
    })

    let resultado = Array.from(balanceteMap.values())

    // Aplicar filtros
    if (filtros.categoria) {
      resultado = resultado.filter(item => item.conta.categoria === filtros.categoria)
    }

    if (filtros.tipo) {
      resultado = resultado.filter(item => item.conta.tipo === filtros.tipo)
    }

    if (filtros.apenasComMovimento) {
      resultado = resultado.filter(item => 
        item.saldoAnterior !== 0 || item.debitos !== 0 || item.creditos !== 0
      )
    }

    // Ordenar por código
    return resultado.sort((a, b) => a.conta.codigo.localeCompare(b.conta.codigo))
  }

  const balancete = processarBalancete()

  // Totais
  const totais = balancete.reduce((acc, item) => ({
    saldoAnterior: acc.saldoAnterior + Math.abs(item.saldoAnterior),
    debitos: acc.debitos + item.debitos,
    creditos: acc.creditos + item.creditos,
    saldoAtual: acc.saldoAtual + Math.abs(item.saldoAtual)
  }), { saldoAnterior: 0, debitos: 0, creditos: 0, saldoAtual: 0 })

  // Categorias únicas para filtro
  const categorias = [...new Set(planoContas?.map((conta: any) => conta.categoria) || [])]

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value)
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Balancete</h1>
          <p className="text-gray-600">
            Relatório contábil com saldos por conta • {balancete.length} contas
          </p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Exportar PDF
          </button>
          <button className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Exportar Excel
          </button>
        </div>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-6 gap-4">
          {/* Período */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Data Início</label>
            <div className="relative">
              <CalendarIcon className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
              <input
                type="date"
                value={periodo.inicio}
                onChange={(e) => setPeriodo(prev => ({ ...prev, inicio: e.target.value }))}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Data Fim</label>
            <div className="relative">
              <CalendarIcon className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
              <input
                type="date"
                value={periodo.fim}
                onChange={(e) => setPeriodo(prev => ({ ...prev, fim: e.target.value }))}
                className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              />
            </div>
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

          {/* Centro de Custo */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Centro de Custo</label>
            <select
              value={filtros.centroCusto}
              onChange={(e) => setFiltros(prev => ({ ...prev, centroCusto: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Todos os centros</option>
              {centrosCusto?.map(centro => (
                <option key={centro.id} value={centro.id}>
                  {centro.codigo} - {centro.nome}
                </option>
              ))}
            </select>
          </div>

          {/* Categoria */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Categoria</label>
            <select
              value={filtros.categoria}
              onChange={(e) => setFiltros(prev => ({ ...prev, categoria: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Todas as categorias</option>
              {categorias.map(categoria => (
                <option key={categoria} value={categoria}>{categoria}</option>
              ))}
            </select>
          </div>

          {/* Tipo */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Tipo</label>
            <select
              value={filtros.tipo}
              onChange={(e) => setFiltros(prev => ({ ...prev, tipo: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            >
              <option value="">Todos</option>
              <option value="receita">Receita</option>
              <option value="despesa">Despesa</option>
            </select>
          </div>

          {/* Apenas com movimento */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Filtro</label>
            <label className="flex items-center">
              <input
                type="checkbox"
                checked={filtros.apenasComMovimento}
                onChange={(e) => setFiltros(prev => ({ ...prev, apenasComMovimento: e.target.checked }))}
                className="mr-2"
              />
              <span className="text-sm text-gray-700">Apenas com movimento</span>
            </label>
          </div>
        </div>
      </Card>

      {/* Totais */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-4">
          <div className="text-center">
            <div className="text-lg font-bold text-gray-600">
              {formatCurrency(totais.saldoAnterior)}
            </div>
            <div className="text-sm text-gray-600">Saldo Anterior</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-lg font-bold text-red-600">
              {formatCurrency(totais.debitos)}
            </div>
            <div className="text-sm text-gray-600">Total Débitos</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-lg font-bold text-green-600">
              {formatCurrency(totais.creditos)}
            </div>
            <div className="text-sm text-gray-600">Total Créditos</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-lg font-bold text-blue-600">
              {formatCurrency(totais.saldoAtual)}
            </div>
            <div className="text-sm text-gray-600">Saldo Atual</div>
          </div>
        </Card>
      </div>

      {/* Tabela do Balancete */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-1">Código</div>
            <div className="col-span-3">Conta</div>
            <div className="col-span-2">Categoria</div>
            <div className="col-span-1">Tipo</div>
            <div className="col-span-1">Saldo Anterior</div>
            <div className="col-span-1">Débitos</div>
            <div className="col-span-1">Créditos</div>
            <div className="col-span-2">Saldo Atual</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200 max-h-96 overflow-y-auto">
          {balancete.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <CalculatorIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum registro encontrado</p>
              <p className="text-sm">Ajuste os filtros ou o período</p>
            </div>
          ) : (
            balancete.map((item) => (
              <div key={item.conta.id} className="px-6 py-3 hover:bg-gray-50">
                <div className="grid grid-cols-12 gap-4 items-center">
                  <div className="col-span-1">
                    <span className="text-sm font-mono text-gray-900">
                      {item.conta.codigo}
                    </span>
                  </div>
                  
                  <div className="col-span-3">
                    <div className="flex items-center">
                      <DocumentTextIcon className="w-4 h-4 mr-2 text-gray-400" />
                      <span className="text-sm font-medium text-gray-900">
                        {item.conta.nome}
                      </span>
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <span className="text-sm text-gray-600">
                      {item.conta.categoria}
                    </span>
                  </div>
                  
                  <div className="col-span-1">
                    <span className={`text-sm font-medium ${
                      item.conta.tipo === 'receita' ? 'text-green-600' : 'text-red-600'
                    }`}>
                      {item.conta.tipo === 'receita' ? 'Receita' : 'Despesa'}
                    </span>
                  </div>
                  
                  <div className="col-span-1">
                    <span className="text-sm text-gray-900">
                      {formatCurrency(item.saldoAnterior)}
                    </span>
                  </div>
                  
                  <div className="col-span-1">
                    <span className="text-sm text-red-600">
                      {item.debitos > 0 ? formatCurrency(item.debitos) : '-'}
                    </span>
                  </div>
                  
                  <div className="col-span-1">
                    <span className="text-sm text-green-600">
                      {item.creditos > 0 ? formatCurrency(item.creditos) : '-'}
                    </span>
                  </div>
                  
                  <div className="col-span-2">
                    <span className={`text-sm font-medium ${
                      item.saldoAtual >= 0 ? 'text-blue-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(item.saldoAtual)}
                    </span>
                  </div>
                </div>
              </div>
            ))
          )}
        </div>

        {/* Linha de totais */}
        <div className="bg-gray-100 px-6 py-3 border-t-2 border-gray-300">
          <div className="grid grid-cols-12 gap-4 items-center font-semibold">
            <div className="col-span-7">
              <span className="text-sm text-gray-900">TOTAIS</span>
            </div>
            <div className="col-span-1">
              <span className="text-sm text-gray-900">
                {formatCurrency(totais.saldoAnterior)}
              </span>
            </div>
            <div className="col-span-1">
              <span className="text-sm text-red-600">
                {formatCurrency(totais.debitos)}
              </span>
            </div>
            <div className="col-span-1">
              <span className="text-sm text-green-600">
                {formatCurrency(totais.creditos)}
              </span>
            </div>
            <div className="col-span-2">
              <span className="text-sm text-blue-600">
                {formatCurrency(totais.saldoAtual)}
              </span>
            </div>
          </div>
        </div>
      </Card>
    </div>
  )
}