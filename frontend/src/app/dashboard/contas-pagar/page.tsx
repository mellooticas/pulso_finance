'use client'

import { useState } from 'react'
import { useLancamentos, useLancamentosStats } from '@/hooks/use-lancamentos'
import { useLojas } from '@/hooks/use-lojas'
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
  DocumentTextIcon
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
    loja: '',
    status: '',
    vencimento: '',
    busca: ''
  })
  
  const [paginacao, setPaginacao] = useState({
    pagina: 1,
    itensPorPagina: 20
  })

  // Hooks de dados - filtrando apenas despesas
  const { data: lojas } = useLojas()
  const { data: contasPagar, isLoading } = useLancamentos({
    data_inicio: periodo.inicio,
    data_fim: periodo.fim,
    tipo: 'despesa', // Apenas despesas
    ...filtros,
    pagina: paginacao.pagina,
    limite: paginacao.itensPorPagina
  })
  const { data: stats } = useLancamentosStats({
    data_inicio: periodo.inicio,
    data_fim: periodo.fim,
    tipo: 'despesa'
  })

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
      label: 'Pendente',
      color: 'text-blue-600'
    }
  }

  // Calcular estatísticas
  const contasVencidas = contasPagar?.filter(conta => {
    const hoje = new Date()
    const vencimento = conta.data_vencimento ? new Date(conta.data_vencimento) : null
    return conta.status !== 'pago' && vencimento && vencimento < hoje
  }) || []

  const contasVencendoSemana = contasPagar?.filter(conta => {
    const hoje = new Date()
    const semanaQueVem = new Date(hoje.getTime() + 7 * 24 * 60 * 60 * 1000)
    const vencimento = conta.data_vencimento ? new Date(conta.data_vencimento) : null
    return conta.status !== 'pago' && vencimento && vencimento >= hoje && vencimento <= semanaQueVem
  }) || []

  const valorVencido = contasVencidas.reduce((acc, conta) => acc + (conta.valor || 0), 0)
  const valorVencendoSemana = contasVencendoSemana.reduce((acc, conta) => acc + (conta.valor || 0), 0)

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
                {formatCurrency(stats?.totalDespesas || 0)}
              </p>
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
                {formatCurrency(valorVencido)}
              </p>
              <p className="text-sm text-gray-500">{contasVencidas.length} contas</p>
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
                {formatCurrency(valorVencendoSemana)}
              </p>
              <p className="text-sm text-gray-500">{contasVencendoSemana.length} contas</p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <DocumentTextIcon className="h-8 w-8 text-gray-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Total de Contas</h3>
              <p className="text-2xl font-bold text-gray-900">
                {contasPagar?.length || 0}
              </p>
            </div>
          </div>
        </Card>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <CalendarIcon className="h-4 w-4 inline mr-1" />
              Data Início
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
              Data Fim
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
              value={filtros.loja}
              onChange={(e) => setFiltros(prev => ({ ...prev, loja: e.target.value }))}
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
              <FunnelIcon className="h-4 w-4 inline mr-1" />
              Status
            </label>
            <select
              value={filtros.status}
              onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todos</option>
              <option value="pendente">Pendente</option>
              <option value="pago">Pago</option>
              <option value="vencido">Vencido</option>
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
                {contasPagar?.map((conta, index) => {
                  const statusInfo = getStatusInfo(conta.status || 'pendente', conta.data_vencimento)
                  
                  return (
                    <tr key={conta.id} className={index % 2 === 0 ? 'bg-white' : 'bg-gray-50'}>
                      <td className="px-6 py-4 text-sm text-gray-900">
                        <div className="max-w-xs">
                          <div className="font-medium">{conta.descricao}</div>
                          {conta.observacoes && (
                            <div className="text-gray-500 text-xs truncate">{conta.observacoes}</div>
                          )}
                        </div>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {conta.loja?.nome || '-'}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        {conta.data_vencimento ? formatDate(conta.data_vencimento) : '-'}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-right font-medium text-red-600">
                        {formatCurrency(conta.valor)}
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                        <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${statusInfo.badge}`}>
                          <span className="mr-1">{statusInfo.icon}</span>
                          {statusInfo.label}
                        </span>
                      </td>
                      <td className="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                        <div className="flex justify-end space-x-2">
                          {conta.status !== 'pago' && (
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
          </div>
        )}

        {/* Paginação */}
        <div className="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200">
          <div className="flex-1 flex justify-between sm:hidden">
            <button
              disabled={paginacao.pagina === 1}
              onClick={() => setPaginacao(prev => ({ ...prev, pagina: prev.pagina - 1 }))}
              className="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 disabled:opacity-50"
            >
              Anterior
            </button>
            <button
              onClick={() => setPaginacao(prev => ({ ...prev, pagina: prev.pagina + 1 }))}
              className="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
            >
              Próximo
            </button>
          </div>
          <div className="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
            <div>
              <p className="text-sm text-gray-700">
                Mostrando{' '}
                <span className="font-medium">
                  {(paginacao.pagina - 1) * paginacao.itensPorPagina + 1}
                </span>{' '}
                até{' '}
                <span className="font-medium">
                  {Math.min(paginacao.pagina * paginacao.itensPorPagina, contasPagar?.length || 0)}
                </span>{' '}
                de{' '}
                <span className="font-medium">{contasPagar?.length || 0}</span>{' '}
                resultados
              </p>
            </div>
            <div>
              <nav className="relative z-0 inline-flex rounded-md shadow-sm -space-x-px">
                <button
                  disabled={paginacao.pagina === 1}
                  onClick={() => setPaginacao(prev => ({ ...prev, pagina: prev.pagina - 1 }))}
                  className="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50"
                >
                  Anterior
                </button>
                
                <span className="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                  {paginacao.pagina}
                </span>
                
                <button
                  onClick={() => setPaginacao(prev => ({ ...prev, pagina: prev.pagina + 1 }))}
                  className="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50"
                >
                  Próximo
                </button>
              </nav>
            </div>
          </div>
        </div>
      </Card>
    </div>
  )
}