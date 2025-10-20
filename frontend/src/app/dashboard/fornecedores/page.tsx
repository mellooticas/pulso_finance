'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { 
  PlusIcon,
  MagnifyingGlassIcon,
  PencilIcon,
  TrashIcon,
  UserGroupIcon,
  PhoneIcon,
  EnvelopeIcon,
  MapPinIcon,
  ArrowDownTrayIcon,
  FunnelIcon,
  DocumentTextIcon
} from '@heroicons/react/24/outline'

// Interface temporária - será substituída por hook real
interface Fornecedor {
  id: string
  codigo: string
  nome: string
  nome_fantasia?: string
  cnpj?: string
  cpf?: string
  tipo: 'juridica' | 'fisica'
  email?: string
  telefone?: string
  endereco?: string
  cidade?: string
  estado?: string
  cep?: string
  ativo: boolean
  observacoes?: string
  created_at: string
  updated_at: string
}

export default function FornecedoresPage() {
  const [filtros, setFiltros] = useState({
    busca: '',
    tipo: '',
    cidade: '',
    status: 'ativo'
  })

  const [showModal, setShowModal] = useState(false)

  // Dados mockados temporariamente - será substituído por hook real
  const fornecedores: Fornecedor[] = [
    {
      id: '1',
      codigo: 'FORN001',
      nome: 'Distribuidora ABC Ltda',
      nome_fantasia: 'ABC Distribuidora',
      cnpj: '12.345.678/0001-90',
      cpf: undefined,
      tipo: 'juridica',
      email: 'contato@abcdist.com.br',
      telefone: '(11) 98765-4321',
      endereco: 'Rua das Flores, 123',
      cidade: 'São Paulo',
      estado: 'SP',
      cep: '01234-567',
      ativo: true,
      observacoes: 'Fornecedor principal de produtos',
      created_at: '2024-01-15',
      updated_at: '2024-01-15'
    },
    {
      id: '2',
      codigo: 'FORN002',
      nome: 'João Silva Serviços',
      nome_fantasia: undefined,
      cnpj: undefined,
      cpf: '123.456.789-00',
      tipo: 'fisica',
      email: 'joao@email.com',
      telefone: '(11) 91234-5678',
      endereco: 'Av. Central, 456',
      cidade: 'São Paulo',
      estado: 'SP',
      cep: '05678-901',
      ativo: true,
      observacoes: 'Prestador de serviços de manutenção',
      created_at: '2024-01-20',
      updated_at: '2024-01-20'
    }
  ]

  // Filtrar fornecedores
  const fornecedoresFiltrados = fornecedores.filter((fornecedor) => {
    const matchBusca = !filtros.busca || 
      fornecedor.nome.toLowerCase().includes(filtros.busca.toLowerCase()) ||
      fornecedor.codigo.toLowerCase().includes(filtros.busca.toLowerCase()) ||
      fornecedor.nome_fantasia?.toLowerCase().includes(filtros.busca.toLowerCase())
    
    const matchTipo = !filtros.tipo || fornecedor.tipo === filtros.tipo
    const matchCidade = !filtros.cidade || fornecedor.cidade === filtros.cidade
    const matchStatus = filtros.status === 'todos' || 
      (filtros.status === 'ativo' ? fornecedor.ativo : !fornecedor.ativo)

    return matchBusca && matchTipo && matchCidade && matchStatus
  })

  // Cidades únicas para o filtro
  const cidades = [...new Set(fornecedores.map(f => f.cidade).filter(Boolean))]

  const limparFiltros = () => {
    setFiltros({
      busca: '',
      tipo: '',
      cidade: '',
      status: 'ativo'
    })
  }

  const formatDocument = (fornecedor: Fornecedor) => {
    if (fornecedor.tipo === 'juridica' && fornecedor.cnpj) {
      return `CNPJ: ${fornecedor.cnpj}`
    }
    if (fornecedor.tipo === 'fisica' && fornecedor.cpf) {
      return `CPF: ${fornecedor.cpf}`
    }
    return '-'
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Fornecedores</h1>
          <p className="text-gray-600">
            Gerenciar fornecedores e prestadores • {fornecedoresFiltrados.length} fornecedores
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
            Novo Fornecedor
          </button>
        </div>
      </div>

      {/* Estatísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-blue-600">
              {fornecedores.length}
            </div>
            <div className="text-sm text-gray-600">Total</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-green-600">
              {fornecedores.filter(f => f.ativo).length}
            </div>
            <div className="text-sm text-gray-600">Ativos</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-purple-600">
              {fornecedores.filter(f => f.tipo === 'juridica').length}
            </div>
            <div className="text-sm text-gray-600">Pessoa Jurídica</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-orange-600">
              {fornecedores.filter(f => f.tipo === 'fisica').length}
            </div>
            <div className="text-sm text-gray-600">Pessoa Física</div>
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
              placeholder="Buscar por nome, código..."
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
            <option value="juridica">Pessoa Jurídica</option>
            <option value="fisica">Pessoa Física</option>
          </select>

          {/* Cidade */}
          <select
            value={filtros.cidade}
            onChange={(e) => setFiltros(prev => ({ ...prev, cidade: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todas as cidades</option>
            {cidades.map(cidade => (
              <option key={cidade} value={cidade}>{cidade}</option>
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
            onClick={limparFiltros}
            className="flex items-center justify-center px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
          >
            <FunnelIcon className="w-4 h-4 mr-2" />
            Limpar
          </button>
        </div>
      </Card>

      {/* Lista de Fornecedores */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-1">Código</div>
            <div className="col-span-3">Nome / Fantasia</div>
            <div className="col-span-2">Documento</div>
            <div className="col-span-2">Contato</div>
            <div className="col-span-2">Localização</div>
            <div className="col-span-1">Status</div>
            <div className="col-span-1">Ações</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200">
          {fornecedoresFiltrados.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <UserGroupIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum fornecedor encontrado</p>
              <p className="text-sm">Ajuste os filtros ou adicione um novo fornecedor</p>
            </div>
          ) : (
            fornecedoresFiltrados.map((fornecedor) => (
              <div key={fornecedor.id} className="px-6 py-4 hover:bg-gray-50">
                <div className="grid grid-cols-12 gap-4 items-center">
                  <div className="col-span-1">
                    <span className="text-sm font-mono text-gray-900">
                      {fornecedor.codigo}
                    </span>
                  </div>
                  
                  <div className="col-span-3">
                    <div className="flex items-center">
                      <UserGroupIcon className="w-4 h-4 mr-2 text-blue-600" />
                      <div>
                        <span className="text-sm font-medium text-gray-900 block">
                          {fornecedor.nome}
                        </span>
                        {fornecedor.nome_fantasia && (
                          <span className="text-xs text-gray-500">
                            {fornecedor.nome_fantasia}
                          </span>
                        )}
                      </div>
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <span className="text-sm text-gray-600">
                      {formatDocument(fornecedor)}
                    </span>
                    <div className="text-xs text-gray-500">
                      {fornecedor.tipo === 'juridica' ? 'PJ' : 'PF'}
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <div className="space-y-1">
                      {fornecedor.telefone && (
                        <div className="flex items-center text-sm text-gray-600">
                          <PhoneIcon className="w-3 h-3 mr-1" />
                          {fornecedor.telefone}
                        </div>
                      )}
                      {fornecedor.email && (
                        <div className="flex items-center text-sm text-gray-600">
                          <EnvelopeIcon className="w-3 h-3 mr-1" />
                          {fornecedor.email}
                        </div>
                      )}
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    {fornecedor.cidade && (
                      <div className="flex items-center text-sm text-gray-600">
                        <MapPinIcon className="w-3 h-3 mr-1" />
                        <span>{fornecedor.cidade}, {fornecedor.estado}</span>
                      </div>
                    )}
                    {fornecedor.cep && (
                      <div className="text-xs text-gray-500">
                        CEP: {fornecedor.cep}
                      </div>
                    )}
                  </div>
                  
                  <div className="col-span-1">
                    <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                      fornecedor.ativo 
                        ? 'bg-green-100 text-green-800' 
                        : 'bg-gray-100 text-gray-800'
                    }`}>
                      {fornecedor.ativo ? 'Ativo' : 'Inativo'}
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

      {/* Modal para Novo Fornecedor (placeholder) */}
      {showModal && (
        <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
          <div className="bg-white rounded-lg p-6 w-full max-w-2xl">
            <h3 className="text-lg font-semibold mb-4">Novo Fornecedor</h3>
            <p className="text-gray-600 mb-4">
              Modal para cadastrar novo fornecedor será implementado.
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