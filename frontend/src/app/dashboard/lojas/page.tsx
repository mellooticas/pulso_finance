'use client'

import { useState } from 'react'
import { useLojas } from '@/hooks/use-lojas'
import { useLancamentosStats } from '@/hooks/use-lancamentos'
import { Card } from '@/components/ui/card'
import { 
  PlusIcon,
  BuildingStorefrontIcon,
  PencilIcon,
  TrashIcon,
  EyeIcon,
  MagnifyingGlassIcon,
  MapPinIcon,
  PhoneIcon,
  CurrencyDollarIcon,
  ChartBarIcon,
  ClockIcon,
  CheckCircleIcon,
  XCircleIcon
} from '@heroicons/react/24/outline'

export default function LojasPage() {
  const [filtros, setFiltros] = useState({
    busca: '',
    status: '',
    cidade: ''
  })
  
  const [paginacao, setPaginacao] = useState({
    pagina: 1,
    itensPorPagina: 12
  })

  const [modalLoja, setModalLoja] = useState<{
    aberto: boolean
    loja?: any
  }>({
    aberto: false
  })

  // Hooks de dados
  const { data: lojas, isLoading } = useLojas()

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value || 0)
  }

  const getStatusBadge = (status: string) => {
    const statusConfig = {
      'ativa': { 
        color: 'bg-green-100 text-green-800', 
        icon: <CheckCircleIcon className="h-3 w-3" />,
        label: 'Ativa' 
      },
      'inativa': { 
        color: 'bg-red-100 text-red-800', 
        icon: <XCircleIcon className="h-3 w-3" />,
        label: 'Inativa' 
      },
      'manutencao': { 
        color: 'bg-yellow-100 text-yellow-800', 
        icon: <ClockIcon className="h-3 w-3" />,
        label: 'Manutenção' 
      }
    }
    
    const config = statusConfig[status as keyof typeof statusConfig] || statusConfig.ativa
    
    return (
      <span className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium ${config.color}`}>
        {config.icon}
        <span className="ml-1">{config.label}</span>
      </span>
    )
  }

  // Filtrar lojas
  const lojasFiltradas = lojas?.filter(loja => {
    const matchBusca = !filtros.busca || 
      String(loja.nome || '').toLowerCase().includes(filtros.busca.toLowerCase()) ||
      String(loja.endereco || '').toLowerCase().includes(filtros.busca.toLowerCase())
    
    // Converter ativa (boolean) para status (string)
    const lojaStatus = loja.ativa ? 'ativa' : 'inativa'
    const matchStatus = !filtros.status || lojaStatus === filtros.status
    const matchCidade = !filtros.cidade || String(loja.cidade || '') === filtros.cidade
    
    return matchBusca && matchStatus && matchCidade
  }) || []

  // Paginação
  const totalItens = lojasFiltradas.length
  const totalPaginas = Math.ceil(totalItens / paginacao.itensPorPagina)
  const indiceInicio = (paginacao.pagina - 1) * paginacao.itensPorPagina
  const indiceFim = indiceInicio + paginacao.itensPorPagina
  const lojasExibidas = lojasFiltradas.slice(indiceInicio, indiceFim)

  // Estatísticas
  const lojasAtivas = lojas?.filter(loja => loja.ativa === true).length || 0
  const lojasInativas = lojas?.filter(loja => loja.ativa === false).length || 0

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="sm:flex sm:items-center sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">
            Gestão de Lojas
          </h1>
          <p className="mt-2 text-gray-600">
            Gerencie todas as lojas e unidades da empresa
          </p>
        </div>
        <div className="mt-4 sm:mt-0">
          <button 
            onClick={() => setModalLoja({ aberto: true })}
            className="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700"
          >
            <PlusIcon className="h-4 w-4 mr-2" />
            Nova Loja
          </button>
        </div>
      </div>

      {/* Cards de Resumo */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <BuildingStorefrontIcon className="h-8 w-8 text-blue-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Total de Lojas</h3>
              <p className="text-2xl font-bold text-blue-600">
                {lojas?.length || 0}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <CheckCircleIcon className="h-8 w-8 text-green-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Lojas Ativas</h3>
              <p className="text-2xl font-bold text-green-600">
                {lojasAtivas}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <XCircleIcon className="h-8 w-8 text-red-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Lojas Inativas</h3>
              <p className="text-2xl font-bold text-red-600">
                {lojasInativas}
              </p>
            </div>
          </div>
        </Card>

        <Card className="p-6">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <ChartBarIcon className="h-8 w-8 text-purple-600" />
            </div>
            <div className="ml-4">
              <h3 className="text-sm font-medium text-gray-600">Performance Média</h3>
              <p className="text-2xl font-bold text-purple-600">
                {formatCurrency(0)}
              </p>
            </div>
          </div>
        </Card>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              <MagnifyingGlassIcon className="h-4 w-4 inline mr-1" />
              Buscar
            </label>
            <input
              type="text"
              placeholder="Nome ou endereço..."
              value={filtros.busca}
              onChange={(e) => setFiltros(prev => ({ ...prev, busca: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Status
            </label>
            <select
              value={filtros.status}
              onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todos os status</option>
              <option value="ativa">Ativa</option>
              <option value="inativa">Inativa</option>
              <option value="manutencao">Manutenção</option>
            </select>
          </div>

          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Cidade
            </label>
            <select
              value={filtros.cidade}
              onChange={(e) => setFiltros(prev => ({ ...prev, cidade: e.target.value }))}
              className="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            >
              <option value="">Todas as cidades</option>
              {Array.from(new Set(lojas?.map(loja => String(loja.cidade || '')).filter(Boolean))).map(cidade => (
                <option key={cidade} value={cidade}>{cidade}</option>
              ))}
            </select>
          </div>

          <div className="flex items-end">
            <button
              onClick={() => setFiltros({ busca: '', status: '', cidade: '' })}
              className="w-full px-3 py-2 border border-gray-300 rounded-md text-sm bg-gray-50 hover:bg-gray-100"
            >
              Limpar Filtros
            </button>
          </div>
        </div>
      </Card>

      {/* Grid de Lojas */}
      {isLoading ? (
        <div className="p-6 text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto"></div>
          <p className="mt-2 text-gray-600">Carregando lojas...</p>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {lojasExibidas.map((loja) => (
            <Card key={loja.id} className="overflow-hidden hover:shadow-lg transition-shadow">
              <div className="p-6">
                <div className="flex items-start justify-between">
                  <div className="flex items-center">
                    <div className="flex-shrink-0">
                      <BuildingStorefrontIcon className="h-10 w-10 text-blue-600" />
                    </div>
                    <div className="ml-4">
                      <h3 className="text-lg font-semibold text-gray-900">
                        {String(loja.nome || '')}
                      </h3>
                      <div className="mt-1">
                        {getStatusBadge(loja.ativa ? 'ativa' : 'inativa')}
                      </div>
                    </div>
                  </div>
                </div>

                <div className="mt-4 space-y-3">
                  {loja.endereco && (
                    <div className="flex items-start text-sm text-gray-600">
                      <MapPinIcon className="h-4 w-4 text-gray-400 mt-0.5 mr-2 flex-shrink-0" />
                      <span>{String(loja.endereco || '')}</span>
                    </div>
                  )}

                  {loja.telefone && (
                    <div className="flex items-center text-sm text-gray-600">
                      <PhoneIcon className="h-4 w-4 text-gray-400 mr-2" />
                      <span>{String(loja.telefone || '')}</span>
                    </div>
                  )}
                </div>

                {/* Métricas da Loja */}
                <div className="mt-4 pt-4 border-t border-gray-200">
                  <div className="grid grid-cols-2 gap-4 text-sm">
                    <div>
                      <span className="text-gray-600">Receita Mensal</span>
                      <p className="font-semibold text-green-600">
                        {formatCurrency(0)}
                      </p>
                    </div>
                    <div>
                      <span className="text-gray-600">Despesas</span>
                      <p className="font-semibold text-red-600">
                        {formatCurrency(0)}
                      </p>
                    </div>
                  </div>
                </div>

                {/* Ações */}
                <div className="mt-4 pt-4 border-t border-gray-200">
                  <div className="flex justify-end space-x-2">
                    <button 
                      className="text-blue-600 hover:text-blue-900"
                      title="Visualizar detalhes"
                    >
                      <EyeIcon className="h-4 w-4" />
                    </button>
                    <button 
                      className="text-gray-600 hover:text-gray-900"
                      title="Editar loja"
                      onClick={() => setModalLoja({ aberto: true, loja })}
                    >
                      <PencilIcon className="h-4 w-4" />
                    </button>
                    <button 
                      className="text-red-600 hover:text-red-900"
                      title="Excluir loja"
                    >
                      <TrashIcon className="h-4 w-4" />
                    </button>
                  </div>
                </div>
              </div>
            </Card>
          ))}
        </div>
      )}

      {/* Paginação */}
      {totalPaginas > 1 && (
        <div className="flex items-center justify-between">
          <div>
            <p className="text-sm text-gray-700">
              Mostrando{' '}
              <span className="font-medium">{indiceInicio + 1}</span>{' '}
              até{' '}
              <span className="font-medium">
                {Math.min(indiceFim, totalItens)}
              </span>{' '}
              de{' '}
              <span className="font-medium">{totalItens}</span>{' '}
              lojas
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
                {paginacao.pagina} de {totalPaginas}
              </span>
              
              <button
                disabled={paginacao.pagina === totalPaginas}
                onClick={() => setPaginacao(prev => ({ ...prev, pagina: prev.pagina + 1 }))}
                className="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:opacity-50"
              >
                Próximo
              </button>
            </nav>
          </div>
        </div>
      )}

      {/* Modal para Nova/Editar Loja */}
      {modalLoja.aberto && (
        <div className="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
          <div className="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
            <div className="mt-3">
              <div className="flex items-center justify-between mb-4">
                <h3 className="text-lg font-medium text-gray-900">
                  {modalLoja.loja ? 'Editar Loja' : 'Nova Loja'}
                </h3>
                <button
                  onClick={() => setModalLoja({ aberto: false })}
                  className="text-gray-400 hover:text-gray-600"
                >
                  <XCircleIcon className="h-6 w-6" />
                </button>
              </div>

              <form className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700">
                    Nome da Loja
                  </label>
                  <input
                    type="text"
                    className="mt-1 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    placeholder="Digite o nome da loja"
                    defaultValue={modalLoja.loja?.nome}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700">
                    Endereço
                  </label>
                  <textarea
                    className="mt-1 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    rows={3}
                    placeholder="Digite o endereço completo"
                    defaultValue={modalLoja.loja?.endereco}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700">
                    Telefone
                  </label>
                  <input
                    type="tel"
                    className="mt-1 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    placeholder="(11) 99999-9999"
                    defaultValue={modalLoja.loja?.telefone}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700">
                    Responsável
                  </label>
                  <input
                    type="text"
                    className="mt-1 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    placeholder="Nome do responsável"
                    defaultValue={modalLoja.loja?.responsavel}
                  />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700">
                    Status
                  </label>
                  <select
                    className="mt-1 w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
                    defaultValue={modalLoja.loja?.status || 'ativa'}
                  >
                    <option value="ativa">Ativa</option>
                    <option value="inativa">Inativa</option>
                    <option value="manutencao">Manutenção</option>
                  </select>
                </div>

                <div className="flex justify-end space-x-3 pt-4">
                  <button
                    type="button"
                    onClick={() => setModalLoja({ aberto: false })}
                    className="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50"
                  >
                    Cancelar
                  </button>
                  <button
                    type="submit"
                    className="px-4 py-2 border border-transparent rounded-md text-sm font-medium text-white bg-blue-600 hover:bg-blue-700"
                  >
                    {modalLoja.loja ? 'Atualizar' : 'Criar'}
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}