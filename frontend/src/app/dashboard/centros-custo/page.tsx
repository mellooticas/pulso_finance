'use client'

import { useState } from 'react'
import { useCentrosCusto, useCentrosCustoStats, CentroCustoFilters } from '@/hooks/use-centros-custo'
import { useLojas } from '@/hooks/use-lojas'
import { Card } from '@/components/ui/card'
import { 
  PlusIcon,
  MagnifyingGlassIcon,
  PencilIcon,
  TrashIcon,
  TagIcon,
  BuildingStorefrontIcon,
  ChartBarIcon,
  ArrowDownTrayIcon,
  FunnelIcon
} from '@heroicons/react/24/outline'

export default function CentrosCustoPage() {
  const [filtros, setFiltros] = useState<CentroCustoFilters>({
    busca: '',
    loja_id: '',
    status: 'ativo'
  })

  const [showModal, setShowModal] = useState(false)

  // Dados
  const { data: centros, isLoading, error } = useCentrosCusto(filtros)
  const { data: stats } = useCentrosCustoStats()
  const { data: lojas } = useLojas()

  // Função para limpar filtros
  const limparFiltros = () => {
    setFiltros({
      busca: '',
      loja_id: '',
      status: 'ativo'
    })
  }

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Centros de Custo</h1>
            <p className="text-gray-600">Gerenciar centros de custo por loja</p>
          </div>
        </div>
        
        <Card className="p-6">
          <div className="animate-pulse space-y-4">
            {[...Array(8)].map((_, i) => (
              <div key={i} className="h-4 bg-gray-200 rounded"></div>
            ))}
          </div>
        </Card>
      </div>
    )
  }

  if (error) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Centros de Custo</h1>
            <p className="text-gray-600">Gerenciar centros de custo por loja</p>
          </div>
        </div>
        
        <Card className="p-6">
          <div className="text-center text-red-600">
            <p>Erro ao carregar centros de custo: {error.message}</p>
          </div>
        </Card>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Centros de Custo</h1>
          <p className="text-gray-600">
            Gerenciar centros de custo por loja • {centros?.length || 0} centros
          </p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Exportar
          </button>
          <button 
            onClick={() => setShowModal(true)}
            className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
          >
            <PlusIcon className="w-4 h-4 mr-2" />
            Novo Centro
          </button>
        </div>
      </div>

      {/* Estatísticas */}
      {stats && (
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
          <Card className="p-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-blue-600">
                {stats.totalCentros}
              </div>
              <div className="text-sm text-gray-600">Total</div>
            </div>
          </Card>
          
          <Card className="p-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-green-600">
                {stats.centrosAtivos}
              </div>
              <div className="text-sm text-gray-600">Ativos</div>
            </div>
          </Card>
          
          <Card className="p-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-gray-600">
                {stats.centrosInativos}
              </div>
              <div className="text-sm text-gray-600">Inativos</div>
            </div>
          </Card>
          
          <Card className="p-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-blue-600">
                {stats.centrosComLancamentos}
              </div>
              <div className="text-sm text-gray-600">Com Lançamentos</div>
            </div>
          </Card>
          
          <Card className="p-4">
            <div className="text-center">
              <div className="text-2xl font-bold text-yellow-600">
                {stats.centrosSemLancamentos}
              </div>
              <div className="text-sm text-gray-600">Sem Lançamentos</div>
            </div>
          </Card>
        </div>
      )}

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {/* Busca */}
          <div className="relative">
            <MagnifyingGlassIcon className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar por nome ou código..."
              value={filtros.busca}
              onChange={(e) => setFiltros(prev => ({ ...prev, busca: e.target.value }))}
              className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          {/* Loja */}
          <select
            value={filtros.loja_id}
            onChange={(e) => setFiltros(prev => ({ ...prev, loja_id: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todas as lojas</option>
            {lojas?.map(loja => (
              <option key={loja.id} value={loja.id}>
                {loja.codigo} - {loja.nome}
              </option>
            ))}
          </select>

          {/* Status */}
          <select
            value={filtros.status}
            onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value as any }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="ativo">Apenas ativos</option>
            <option value="inativo">Apenas inativos</option>
            <option value="todos">Todos</option>
          </select>

          {/* Limpar Filtros */}
          <button
            onClick={limparFiltros}
            className="flex items-center justify-center px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
          >
            <FunnelIcon className="w-4 h-4 mr-2" />
            Limpar
          </button>
        </div>
      </Card>

      {/* Lista de Centros */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-2">Código</div>
            <div className="col-span-3">Nome</div>
            <div className="col-span-2">Loja</div>
            <div className="col-span-1">Status</div>
            <div className="col-span-1">Lançamentos</div>
            <div className="col-span-2">Descrição</div>
            <div className="col-span-1">Ações</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200">
          {!centros || centros.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <TagIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum centro de custo encontrado</p>
              <p className="text-sm">Ajuste os filtros ou adicione um novo centro</p>
            </div>
          ) : (
            centros.map((centro) => {
              const numLancamentos = stats?.lancamentosPorCentro[centro.id] || 0
              
              return (
                <div key={centro.id} className="px-6 py-4 hover:bg-gray-50">
                  <div className="grid grid-cols-12 gap-4 items-center">
                    <div className="col-span-2">
                      <span className="text-sm font-mono text-gray-900">
                        {centro.codigo}
                      </span>
                    </div>
                    
                    <div className="col-span-3">
                      <div className="flex items-center">
                        <TagIcon className="w-4 h-4 mr-2 text-blue-600" />
                        <span className="text-sm font-medium text-gray-900">
                          {centro.nome}
                        </span>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      {centro.loja ? (
                        <div className="flex items-center">
                          <BuildingStorefrontIcon className="w-4 h-4 mr-1 text-gray-400" />
                          <span className="text-sm text-gray-600">
                            {centro.loja.codigo} - {centro.loja.nome}
                          </span>
                        </div>
                      ) : (
                        <span className="text-sm text-gray-400">Geral</span>
                      )}
                    </div>
                    
                    <div className="col-span-1">
                      <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                        centro.ativo 
                          ? 'bg-green-100 text-green-800' 
                          : 'bg-gray-100 text-gray-800'
                      }`}>
                        {centro.ativo ? 'Ativo' : 'Inativo'}
                      </span>
                    </div>
                    
                    <div className="col-span-1">
                      <div className="flex items-center">
                        <ChartBarIcon className="w-4 h-4 mr-1 text-gray-400" />
                        <span className="text-sm text-gray-600">
                          {numLancamentos}
                        </span>
                      </div>
                    </div>
                    
                    <div className="col-span-2">
                      <span className="text-sm text-gray-600 truncate">
                        {centro.descricao || '-'}
                      </span>
                    </div>
                    
                    <div className="col-span-1">
                      <div className="flex gap-1">
                        <button className="p-1 text-gray-400 hover:text-blue-600">
                          <PencilIcon className="w-4 h-4" />
                        </button>
                        <button className="p-1 text-gray-400 hover:text-red-600">
                          <TrashIcon className="w-4 h-4" />
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              )
            })
          )}
        </div>
      </Card>

      {/* Modal para Novo Centro (placeholder) */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-full max-w-md">
            <h3 className="text-lg font-semibold mb-4">Novo Centro de Custo</h3>
            <p className="text-gray-600 mb-4">
              Modal para criar novo centro de custo será implementado.
            </p>
            <div className="flex justify-end gap-3">
              <button
                onClick={() => setShowModal(false)}
                className="px-4 py-2 text-gray-600 border border-gray-300 rounded-lg hover:bg-gray-50"
              >
                Cancelar
              </button>
              <button
                onClick={() => setShowModal(false)}
                className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
              >
                Salvar
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}