'use client'

import { useState } from 'react'
import { usePlanoContas } from '@/hooks/use-dre'
import { Card } from '@/components/ui/card'
import { 
  PlusIcon,
  MagnifyingGlassIcon,
  PencilIcon,
  TrashIcon,
  FolderIcon,
  FolderOpenIcon,
  DocumentTextIcon,
  FunnelIcon,
  ArrowDownTrayIcon
} from '@heroicons/react/24/outline'

// Interface para o Plano de Contas
interface PlanoContas {
  id: string
  codigo: string
  nome: string
  categoria: string
  tipo: 'receita' | 'despesa'
  ativo: boolean
  descricao?: string
  nivel: number
  conta_pai?: string
  created_at: string
  updated_at: string
}

export default function PlanoContasPage() {
  const [filtros, setFiltros] = useState({
    busca: '',
    categoria: '',
    tipo: '',
    status: 'ativo'
  })

  const [expandedItems, setExpandedItems] = useState<string[]>([])

  // Dados do plano de contas
  const { data: contas, isLoading, error } = usePlanoContas()

  // Filtrar contas
  const contasFiltradas = contas?.filter((conta: PlanoContas) => {
    const matchBusca = !filtros.busca || 
      conta.nome.toLowerCase().includes(filtros.busca.toLowerCase()) ||
      conta.codigo.toLowerCase().includes(filtros.busca.toLowerCase())
    
    const matchCategoria = !filtros.categoria || conta.categoria === filtros.categoria
    const matchTipo = !filtros.tipo || conta.tipo === filtros.tipo
    const matchStatus = filtros.status === 'todos' || 
      (filtros.status === 'ativo' ? conta.ativo : !conta.ativo)

    return matchBusca && matchCategoria && matchTipo && matchStatus
  }) || []

  // Organizar contas em hierarquia
  const organizarHierarquia = (contas: PlanoContas[]) => {
    const contasPai = contas.filter(conta => !conta.conta_pai)
    const contasFilhas = contas.filter(conta => conta.conta_pai)

    return contasPai.map(pai => ({
      ...pai,
      filhas: contasFilhas.filter(filha => filha.conta_pai === pai.id)
    }))
  }

  const contasHierarquicas = organizarHierarquia(contasFiltradas)

  // Categorias únicas para o filtro
  const categorias = [...new Set(contas?.map((conta: PlanoContas) => conta.categoria) || [])]

  const toggleExpanded = (contaId: string) => {
    setExpandedItems(prev => 
      prev.includes(contaId) 
        ? prev.filter(id => id !== contaId)
        : [...prev, contaId]
    )
  }

  const getIconeConta = (conta: PlanoContas, temFilhas: boolean) => {
    if (temFilhas) {
      return expandedItems.includes(conta.id) ? FolderOpenIcon : FolderIcon
    }
    return DocumentTextIcon
  }

  const getCorTipo = (tipo: string) => {
    return tipo === 'receita' ? 'text-green-600' : 'text-red-600'
  }

  if (isLoading) {
    return (
      <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Plano de Contas</h1>
            <p className="text-gray-600">Gerenciar estrutura contábil</p>
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
            <h1 className="text-2xl font-bold text-gray-900">Plano de Contas</h1>
            <p className="text-gray-600">Gerenciar estrutura contábil</p>
          </div>
        </div>
        
        <Card className="p-6">
          <div className="text-center text-red-600">
            <p>Erro ao carregar plano de contas: {error.message}</p>
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
          <h1 className="text-2xl font-bold text-gray-900">Plano de Contas</h1>
          <p className="text-gray-600">
            Gerenciar estrutura contábil • {contasFiltradas.length} contas
          </p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Exportar
          </button>
          <button className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
            <PlusIcon className="w-4 h-4 mr-2" />
            Nova Conta
          </button>
        </div>
      </div>

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

          {/* Tipo */}
          <select
            value={filtros.tipo}
            onChange={(e) => setFiltros(prev => ({ ...prev, tipo: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todos os tipos</option>
            <option value="receita">Receita</option>
            <option value="despesa">Despesa</option>
          </select>

          {/* Status */}
          <select
            value={filtros.status}
            onChange={(e) => setFiltros(prev => ({ ...prev, status: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="ativo">Apenas ativas</option>
            <option value="inativo">Apenas inativas</option>
            <option value="todos">Todas</option>
          </select>
        </div>
      </Card>

      {/* Lista de Contas */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-1">Código</div>
            <div className="col-span-4">Nome da Conta</div>
            <div className="col-span-2">Categoria</div>
            <div className="col-span-1">Tipo</div>
            <div className="col-span-1">Status</div>
            <div className="col-span-2">Descrição</div>
            <div className="col-span-1">Ações</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200">
          {contasHierarquicas.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <FolderIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhuma conta encontrada</p>
              <p className="text-sm">Ajuste os filtros ou adicione uma nova conta</p>
            </div>
          ) : (
            contasHierarquicas.map((conta) => {
              const temFilhas = conta.filhas && conta.filhas.length > 0
              const IconeConta = getIconeConta(conta, temFilhas)
              const isExpanded = expandedItems.includes(conta.id)

              return (
                <div key={conta.id}>
                  {/* Conta Principal */}
                  <div className="px-6 py-4 hover:bg-gray-50">
                    <div className="grid grid-cols-12 gap-4 items-center">
                      <div className="col-span-1">
                        <span className="text-sm font-mono text-gray-900">
                          {conta.codigo}
                        </span>
                      </div>
                      
                      <div className="col-span-4">
                        <div className="flex items-center">
                          <button
                            onClick={() => temFilhas && toggleExpanded(conta.id)}
                            className={`mr-2 ${temFilhas ? 'cursor-pointer' : 'cursor-default'}`}
                          >
                            <IconeConta className={`w-4 h-4 ${temFilhas ? 'text-blue-600' : 'text-gray-400'}`} />
                          </button>
                          <span className="text-sm font-medium text-gray-900">
                            {conta.nome}
                          </span>
                        </div>
                      </div>
                      
                      <div className="col-span-2">
                        <span className="text-sm text-gray-600">
                          {conta.categoria}
                        </span>
                      </div>
                      
                      <div className="col-span-1">
                        <span className={`text-sm font-medium ${getCorTipo(conta.tipo)}`}>
                          {conta.tipo === 'receita' ? 'Receita' : 'Despesa'}
                        </span>
                      </div>
                      
                      <div className="col-span-1">
                        <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                          conta.ativo 
                            ? 'bg-green-100 text-green-800' 
                            : 'bg-gray-100 text-gray-800'
                        }`}>
                          {conta.ativo ? 'Ativa' : 'Inativa'}
                        </span>
                      </div>
                      
                      <div className="col-span-2">
                        <span className="text-sm text-gray-600 truncate">
                          {conta.descricao || '-'}
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

                  {/* Contas Filhas */}
                  {temFilhas && isExpanded && conta.filhas?.map((filha: PlanoContas) => (
                    <div key={filha.id} className="px-6 py-3 bg-gray-25 border-l-4 border-blue-200 ml-6">
                      <div className="grid grid-cols-12 gap-4 items-center">
                        <div className="col-span-1">
                          <span className="text-sm font-mono text-gray-700">
                            {filha.codigo}
                          </span>
                        </div>
                        
                        <div className="col-span-4">
                          <div className="flex items-center">
                            <DocumentTextIcon className="w-4 h-4 mr-2 text-gray-400" />
                            <span className="text-sm text-gray-800">
                              {filha.nome}
                            </span>
                          </div>
                        </div>
                        
                        <div className="col-span-2">
                          <span className="text-sm text-gray-500">
                            {filha.categoria}
                          </span>
                        </div>
                        
                        <div className="col-span-1">
                          <span className={`text-sm ${getCorTipo(filha.tipo)}`}>
                            {filha.tipo === 'receita' ? 'Receita' : 'Despesa'}
                          </span>
                        </div>
                        
                        <div className="col-span-1">
                          <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                            filha.ativo 
                              ? 'bg-green-100 text-green-800' 
                              : 'bg-gray-100 text-gray-800'
                          }`}>
                            {filha.ativo ? 'Ativa' : 'Inativa'}
                          </span>
                        </div>
                        
                        <div className="col-span-2">
                          <span className="text-sm text-gray-500 truncate">
                            {filha.descricao || '-'}
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
                  ))}
                </div>
              )
            })
          )}
        </div>
      </Card>

      {/* Estatísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-blue-600">
              {contasFiltradas.length}
            </div>
            <div className="text-sm text-gray-600">Total de Contas</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-green-600">
              {contasFiltradas.filter(c => c.tipo === 'receita').length}
            </div>
            <div className="text-sm text-gray-600">Contas de Receita</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-red-600">
              {contasFiltradas.filter(c => c.tipo === 'despesa').length}
            </div>
            <div className="text-sm text-gray-600">Contas de Despesa</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-gray-600">
              {categorias.length}
            </div>
            <div className="text-sm text-gray-600">Categorias</div>
          </div>
        </Card>
      </div>
    </div>
  )
}