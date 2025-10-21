'use client'

import { useState, useMemo } from 'react'
import { useContasPagar, useContasPagarStats } from '@/hooks/use-contas-pagar-receber'
import { useLojas } from '@/hooks/use-lojas'
import { useCentrosCusto } from '@/hooks/use-centros-custo'
import { Card } from '@/components/ui/card'
import { 
  CalendarIcon,
  PlusIcon,
  FunnelIcon,
  ArrowDownTrayIcon,
  PencilIcon,
  TrashIcon,
  EyeIcon,
  MagnifyingGlassIcon,
  BuildingStorefrontIcon,
  CreditCardIcon,
  ClockIcon,
  ExclamationTriangleIcon,
  CheckCircleIcon,
  BanknotesIcon,
  DocumentTextIcon,
  CubeIcon
} from '@heroicons/react/24/outline'

export default function ContasPagarPage() {
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
    loja_id: '',
    centro_custo_id: '',
    status: '',
    busca: ''
  })

  // 🔑 Hooks de dados - consultando PARCELAS por VENCIMENTO!
  const { data: lojas } = useLojas()
  const { data: centrosCusto } = useCentrosCusto()
  
  const { data: contasPagar, isLoading } = useContasPagar({
    vencimento_inicio: periodo.inicio,
    vencimento_fim: periodo.fim,
    loja_id: filtros.loja_id || undefined,
    centro_custo_id: filtros.centro_custo_id || undefined,
    status: filtros.status as any || undefined
  })
  
  const { data: stats } = useContasPagarStats({
    vencimento_inicio: periodo.inicio,
    vencimento_fim: periodo.fim,
    loja_id: filtros.loja_id || undefined,
    centro_custo_id: filtros.centro_custo_id || undefined
  })

  // Filtrar por busca no lado do cliente (descrição)
  const contasFiltradas = useMemo(() => {
    if (!contasPagar) return []
    
    return contasPagar.filter(parcela => {
      // Filtro de busca por descrição
      if (filtros.busca && parcela.lancamento) {
        const busca = filtros.busca.toLowerCase()
        const descricao = parcela.lancamento.descricao?.toLowerCase() || ''
        return descricao.includes(busca)
      }
      return true
    })
  }, [contasPagar, filtros.busca])

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value || 0)
  }

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return date.toLocaleDateString('pt-BR')
  }

  const getStatusInfo = (status: string, dataVencimento?: string) => {
    const hoje = new Date()
    const vencimento = dataVencimento ? new Date(dataVencimento) : null
    
    if (status === 'pago') {
      return {
        badge: 'bg-green-100 text-green-800',
        icon: <CheckCircleIcon className="h-4 w-4" />,
        label: 'Pago',
        color: 'text-green-600'
      }
    }
    
    // Status previsto - verificar se está vencido
    if (vencimento && vencimento < hoje) {
      return {
        badge: 'bg-red-100 text-red-800',
        icon: <ExclamationTriangleIcon className="h-4 w-4" />,
        label: 'Vencido',
        color: 'text-red-600'
      }
    }
    
    if (vencimento) {
      const diasParaVencer = Math.ceil((vencimento.getTime() - hoje.getTime()) / (1000 * 60 * 60 * 24))
      if (diasParaVencer <= 7) {
        return {
          badge: 'bg-yellow-100 text-yellow-800',
          icon: <ClockIcon className="h-4 w-4" />,
          label: `Vence em ${diasParaVencer}d`,
          color: 'text-yellow-600'
        }
      }
    }
    
    return {
      badge: 'bg-blue-100 text-blue-800',
      icon: <ClockIcon className="h-4 w-4" />,
      label: 'Previsto',
      color: 'text-blue-600'
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="sm:flex sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Contas a Pagar
          </h1>
          <p className="mt-2 text-gray-600">
            Gerencie todas as contas e compromissos financeiros a pagar
          </p>
        </div>
        <div className="mt-4 sm:mt-0 flex space-x-3">
          <button className="inline-flex items-center px-3 py-2 border border-gray-300 rounded-md text-sm bg-white hover:bg-gray-50">
            <ArrowDownTrayIcon className="h-4 w-4 mr-2" />
            Exportar
          </button>
          <button className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700">
            <PlusIcon className="h-4 w-4 mr-2" />
            Nova Conta
          </button>
        </div>
      </div>

      {/* Cards de Resumo */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <CreditCardIcon className="h-8 w-8 text-blue-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Total a Pagar</h3>
              <p className="text-2xl font-bold text-blue-600">
                {formatCurrency(stats?.total || 0)}
              </p>
              <p className="text-sm text-gray-500">{stats?.quantidadeTotal || 0} parcelas</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ExclamationTriangleIcon className="h-8 w-8 text-red-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Contas Vencidas</h3>
              <p className="text-2xl font-bold text-red-600">
                {formatCurrency(stats?.totalVencido || 0)}
              </p>
              <p className="text-sm text-gray-500">{stats?.quantidadeVencida || 0} parcelas</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ClockIcon className="h-8 w-8 text-yellow-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Vence em 7 dias</h3>
              <p className="text-2xl font-bold text-yellow-600">
                {formatCurrency(stats?.totalVencer7Dias || 0)}
              </p>
              <p className="text-sm text-gray-500">{stats?.quantidadeVencer7Dias || 0} parcelas</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <DocumentTextIcon className="h-8 w-8 text-gray-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Total de Parcelas</h3>
              <p className="text-2xl font-bold text-gray-900">
                {stats?.quantidadeTotal || 0}
              </p>
              <p className="text-sm text-gray-500">
                {stats?.quantidadePaga || 0} pagas / {stats?.quantidadePendente || 0} pendentes
              </p>
            </div>
          </div>
        </Card>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-6 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CalendarIcon className="h-4 w-4 inline mr-1" />
              Vencimento Início
            </label>
            <input
              type="date"
              value={periodo.inicio}
              onChange={(e) => setPeriodo(prev => ({ ...prev, inicio: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
          
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CalendarIcon className="h-4 w-4 inline mr-1" />
              Vencimento Fim
            </label>
            <input
              type="date"
              value={periodo.fim}
              onChange={(e) => setPeriodo(prev => ({ ...prev, fim: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <BuildingStorefrontIcon className="h-4 w-4 inline mr-1" />
              Loja
            </label>
            <select
              value={filtros.loja_id}
              onChange={(e) => setFiltros(prev => ({ ...prev, loja_id: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todas</option>
              {lojas?.map(loja => (
                <option key={loja.id} value={loja.id}>
                  {loja.nome}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CubeIcon className="h-4 w-4 inline mr-1" />
              Centro de Custo
            </label>
            <select
              value={filtros.centro_custo_id}
              onChange={(e) => setFiltros(prev => ({ ...prev, centro_custo_id: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todos</option>
              {centrosCusto?.map(centro => (
                <option key={centro.id} value={centro.id}>
                  {centro.nome}
                </option>
              ))}
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <FunnelIcon className="h-4 w-4 inline mr-1" />
              Status
            </label>
            <select
              value={filtros.status}
              onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todos</option>
              <option value="previsto">Previsto</option>
              <option value="pago">Pago</option>
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <MagnifyingGlassIcon className="h-4 w-4 inline mr-1" />
              Buscar
            </label>
            <input
              type="text"
              placeholder="Descrição..."
              value={filtros.busca}
              onChange={(e) => setFiltros(prev => ({ ...prev, busca: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>
        </div>
      </Card>

      {/* Tabela de Contas a Pagar */}
      <Card className="overflow-hidden">
        <div className="px-6 py-4 border-b border-gray-200">
          <h3 className="text-lg font-semibold text-gray-900">
            Lista de Contas a Pagar
          </h3>
        </div>

        {isLoading ? (
          <div className="p-6 text-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto"></div>
            <p className="mt-2 text-gray-600">Carregando contas...</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="min-w-full divide-y divide-gray-200">
              <thead className="bg-gray-50">
                <tr>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Descrição
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Loja
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Vencimento
                  </th>
                  <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Valor
                  </th>
                  <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Status
                  </th>
                  <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                    Ações
                  </th>
                </tr>
              </thead>
              <tbody className="bg-white divide-y divide-gray-200">
                {contasFiltradas?.map((parcela, index) => {
                  const statusInfo = getStatusInfo(parcela.status || 'previsto', parcela.vencimento)
                  const lancamento = parcela.lancamento
                  
                  return (
                    <tr key={parcela.id} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                      <td className="px-6 py-4 text-sm text-gray-900">
                        <div className="max-w-xs">
                          <div className="font-medium">{lancamento?.descricao || '-'}</div>
                          {parcela.numero_parcela && (
                            <div className="text-gray-500 text-xs">Parcela {parcela.numero_parcela}</div>
                          )}
                        </div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {lancamento?.loja?.nome || '-'}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {parcela.vencimento ? formatDate(parcela.vencimento) : '-'}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-right font-medium text-red-600">
                        {formatCurrency(parcela.valor)}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${statusInfo.badge}`}>
                          <span className="mr-1">{statusInfo.icon}</span>
                          {statusInfo.label}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div className="flex justify-end space-x-2">
                          {parcela.status !== 'pago' && (
                            <button className="text-green-600 hover:text-green-900" title="Marcar como pago">
                              <BanknotesIcon className="h-4 w-4" />
                            </button>
                          )}
                          <button className="text-blue-600 hover:text-blue-900" title="Visualizar">
                            <EyeIcon className="h-4 w-4" />
                          </button>
                          <button className="text-gray-600 hover:text-gray-900" title="Editar">
                            <PencilIcon className="h-4 w-4" />
                          </button>
                          <button className="text-red-600 hover:text-red-900" title="Excluir">
                            <TrashIcon className="h-4 w-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  )
                })}
              </tbody>
            </table>

            {!contasFiltradas || contasFiltradas.length === 0 && (
              <div className="text-center py-12">
                <CreditCardIcon className="mx-auto h-12 w-12 text-gray-400" />
                <h3 className="mt-2 text-sm font-medium text-gray-900">Nenhuma conta encontrada</h3>
                <p className="mt-1 text-sm text-gray-500">
                  {filtros.busca || filtros.loja_id || filtros.centro_custo_id || filtros.status 
                    ? 'Tente ajustar os filtros' 
                    : 'Não há contas a pagar no período selecionado'}
                </p>
              </div>
            )}
          </div>
        )}
      </Card>
    </div>
  )
}