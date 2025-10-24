'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { useProdutos } from '@/hooks/useRealData'
import { 
  PlusIcon,
  MagnifyingGlassIcon,
  PencilIcon,
  TrashIcon,
  ClipboardDocumentListIcon,
  TagIcon,
  CubeIcon,
  ArrowDownTrayIcon,
  FunnelIcon
} from '@heroicons/react/24/outline'

export default function ProdutosServicosPage() {
  const [filtros, setFiltros] = useState({
    busca: '',
    tipo: '',
    categoria: '',
    status: 'ativo'
  })

  const [showModal, setShowModal] = useState(false)

  // ✅ DADOS REAIS DO SUPABASE - retorna categorias com produtos
  const { data: categoriasData = [], isLoading, error } = useProdutos()
  
  // Flatten all products from all categories
  const produtos = categoriasData.flatMap((cat: any) => 
    cat.produtos?.map((p: any) => ({ ...p, categoria: cat.nome })) || []
  )

  // Filtrar produtos
  const produtosFiltrados = produtos.filter((produto: any) => {
    const matchBusca = !filtros.busca || 
      produto.nome?.toLowerCase().includes(filtros.busca.toLowerCase()) ||
      produto.codigo?.toLowerCase().includes(filtros.busca.toLowerCase())
    
    const matchTipo = !filtros.tipo || produto.tipo === filtros.tipo
    const matchCategoria = !filtros.categoria || produto.categoria === filtros.categoria
    const matchStatus = filtros.status === 'todos' || 
      (filtros.status === 'ativo' ? produto.ativo : !produto.ativo)

    return matchBusca && matchTipo && matchCategoria && matchStatus
  })

  const categorias = [...new Set(produtos.map((p: any) => p.categoria).filter(Boolean))]

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value || 0)
  }

  if (isLoading) {
    return (
      <div className="flex items-center justify-center h-96">
        <div className="text-center">
          <div className="text-lg font-semibold">Carregando produtos...</div>
          <div className="text-sm text-gray-600 mt-2">Aguarde</div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-96">
        <div className="text-center text-red-600">
          <div className="text-lg font-semibold">Erro ao carregar produtos</div>
          <div className="text-sm mt-2">{String(error)}</div>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Produtos e Serviços</h1>
          <p className="text-gray-600">
            Catálogo de produtos e serviços • {produtosFiltrados.length} itens
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
            Novo Item
          </button>
        </div>
      </div>

      {/* Estatísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-blue-600">
              {produtos.length}
            </div>
            <div className="text-sm text-gray-600">Total de Itens</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-green-600">
              {produtos.filter((p: any) => p.tipo === 'produto').length}
            </div>
            <div className="text-sm text-gray-600">Produtos</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-purple-600">
              {produtos.filter((p: any) => p.tipo === 'servico').length}
            </div>
            <div className="text-sm text-gray-600">Serviços</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-orange-600">
              {categorias.length}
            </div>
            <div className="text-sm text-gray-600">Categorias</div>
          </div>
        </Card>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-5 gap-4">
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

          {/* Tipo */}
          <select
            value={filtros.tipo}
            onChange={(e) => setFiltros(prev => ({ ...prev, tipo: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todos os tipos</option>
            <option value="produto">Produtos</option>
            <option value="servico">Serviços</option>
          </select>

          {/* Categoria */}
          <select
            value={filtros.categoria}
            onChange={(e) => setFiltros(prev => ({ ...prev, categoria: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todas as categorias</option>
            {categorias.map(categoria => (
              <option key={categoria} value={categoria}>{categoria}</option>
            ))}
          </select>

          {/* Status */}
          <select
            value={filtros.status}
            onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="ativo">Apenas ativos</option>
            <option value="inativo">Apenas inativos</option>
            <option value="todos">Todos</option>
          </select>

          {/* Limpar Filtros */}
          <button
            onClick={() => setFiltros({ busca: '', tipo: '', categoria: '', status: 'ativo' })}
            className="flex items-center justify-center px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
          >
            <FunnelIcon className="w-4 h-4 mr-2" />
            Limpar
          </button>
        </div>
      </Card>

      {/* Lista */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-1">Código</div>
            <div className="col-span-3">Nome</div>
            <div className="col-span-2">Tipo/Categoria</div>
            <div className="col-span-1">Unidade</div>
            <div className="col-span-2">Valor Referência</div>
            <div className="col-span-2">Descrição</div>
            <div className="col-span-1">Ações</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200">
          {produtosFiltrados.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <ClipboardDocumentListIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum item encontrado</p>
              <p className="text-sm">Ajuste os filtros ou adicione um novo item</p>
            </div>
          ) : (
            produtosFiltrados.map((produto) => (
              <div key={produto.id} className="px-6 py-4 hover:bg-gray-50">
                <div className="grid grid-cols-12 gap-4 items-center">
                  <div className="col-span-1">
                    <span className="text-sm font-mono text-gray-900">
                      {produto.codigo}
                    </span>
                  </div>
                  
                  <div className="col-span-3">
                    <div className="flex items-center">
                      {produto.tipo === 'produto' ? (
                        <CubeIcon className="w-4 h-4 mr-2 text-blue-600" />
                      ) : (
                        <ClipboardDocumentListIcon className="w-4 h-4 mr-2 text-green-600" />
                      )}
                      <span className="text-sm font-medium text-gray-900">
                        {produto.nome}
                      </span>
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <div>
                      <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                        produto.tipo === 'produto' 
                          ? 'bg-blue-100 text-blue-800' 
                          : 'bg-green-100 text-green-800'
                      }`}>
                        {produto.tipo === 'produto' ? 'Produto' : 'Serviço'}
                      </span>
                      {produto.categoria && (
                        <div className="text-xs text-gray-500 mt-1">
                          {produto.categoria}
                        </div>
                      )}
                    </div>
                  </div>
                  
                  <div className="col-span-1">
                    <span className="text-sm text-gray-600">
                      {produto.unidade || '-'}
                    </span>
                  </div>
                  
                  <div className="col-span-2">
                    <span className="text-sm font-medium text-gray-900">
                      {produto.valor_referencia ? formatCurrency(produto.valor_referencia) : '-'}
                    </span>
                  </div>
                  
                  <div className="col-span-2">
                    <span className="text-sm text-gray-600 truncate">
                      {produto.descricao || '-'}
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
            ))
          )}
        </div>
      </Card>

      {/* Modal (placeholder) */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-full max-w-2xl">
            <h3 className="text-lg font-semibold mb-4">Novo Produto/Serviço</h3>
            <p className="text-gray-600 mb-4">Modal para cadastro será implementado.</p>
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