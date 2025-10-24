'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { supabase } from '@/lib/supabase'
import { useQuery } from '@tanstack/react-query'
import { 
  PlusIcon,
  MagnifyingGlassIcon,
  PencilIcon,
  TrashIcon,
  UserGroupIcon,
  ShieldCheckIcon,
  EnvelopeIcon,
  CalendarIcon,
  KeyIcon,
  ArrowDownTrayIcon,
  FunnelIcon
} from '@heroicons/react/24/outline'

// Hook para buscar usuários reais do Supabase Auth
function useUsuarios() {
  return useQuery({
    queryKey: ['usuarios-auth'],
    queryFn: async () => {
      // Buscar usuários da tabela auth.users (requer permissões de admin)
      const { data: { users }, error } = await supabase.auth.admin.listUsers()
      
      if (error) {
        console.error('Erro ao listar usuários:', error)
        // Fallback: buscar do próprio usuário logado
        const { data: { user } } = await supabase.auth.getUser()
        return user ? [user] : []
      }
      
      return users || []
    },
    staleTime: 5 * 60 * 1000,
  })
}

export default function UsuariosPage() {
  const [filtros, setFiltros] = useState({
    busca: '',
    papel: '',
    status: 'ativo'
  })

  const [showModal, setShowModal] = useState(false)

  // ✅ DADOS REAIS DO SUPABASE AUTH
  const { data: usuarios = [], isLoading, error } = useUsuarios()

  // Filtrar usuários
  const usuariosFiltrados = usuarios.filter((usuario: any) => {
    const matchBusca = !filtros.busca || 
      usuario.email?.toLowerCase().includes(filtros.busca.toLowerCase()) ||
      usuario.user_metadata?.nome?.toLowerCase().includes(filtros.busca.toLowerCase())
    
    const matchPapel = !filtros.papel || usuario.user_metadata?.papel === filtros.papel
    const matchStatus = filtros.status === 'todos' || 
      (filtros.status === 'ativo' ? !usuario.banned_until : !!usuario.banned_until)

    return matchBusca && matchPapel && matchStatus
  })

  const getPapelColor = (papel: string) => {
    const colors = {
      admin: 'bg-red-100 text-red-800',
      gerencial: 'bg-blue-100 text-blue-800', 
      financeiro: 'bg-green-100 text-green-800',
      operacional: 'bg-gray-100 text-gray-800'
    }
    return colors[papel as keyof typeof colors] || 'bg-gray-100 text-gray-800'
  }

  const getPapelLabel = (papel: string) => {
    const labels = {
      admin: 'Administrador',
      gerencial: 'Gerencial',
      financeiro: 'Financeiro', 
      operacional: 'Operacional'
    }
    return labels[papel as keyof typeof labels] || 'Usuário'
  }

  const formatDateTime = (dateString?: string) => {
    if (!dateString) return '-'
    return new Date(dateString).toLocaleString('pt-BR')
  }

  if (isLoading) {
    return (
      <div className="flex items-center justify-center h-96">
        <div className="text-center">
          <div className="text-lg font-semibold">Carregando usuários...</div>
          <div className="text-sm text-gray-600 mt-2">Aguarde</div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-96">
        <div className="text-center text-orange-600">
          <div className="text-lg font-semibold">Acesso limitado</div>
          <div className="text-sm mt-2">Você só pode visualizar seu próprio usuário</div>
          <div className="text-xs text-gray-600 mt-2">Usuários: {usuarios.length}</div>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Gestão de Usuários</h1>
          <p className="text-gray-600">
            Controle de acesso e permissões • {usuariosFiltrados.length} usuários
          </p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
            Relatório
          </button>
          <button 
            onClick={() => setShowModal(true)}
            className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
          >
            <PlusIcon className="w-4 h-4 mr-2" />
            Novo Usuário
          </button>
        </div>
      </div>

      {/* Estatísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-blue-600">
              {usuarios.length}
            </div>
            <div className="text-sm text-gray-600">Total de Usuários</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-green-600">
              {usuarios.filter((u: any) => !u.banned_until).length}
            </div>
            <div className="text-sm text-gray-600">Usuários Ativos</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-red-600">
              {usuarios.filter((u: any) => u.user_metadata?.papel === 'admin').length}
            </div>
            <div className="text-sm text-gray-600">Administradores</div>
          </div>
        </Card>
        
        <Card className="p-4">
          <div className="text-center">
            <div className="text-2xl font-bold text-purple-600">
              {usuarios.filter((u: any) => u.last_sign_in_at && new Date(u.last_sign_in_at) > new Date(Date.now() - 7*24*60*60*1000)).length}
            </div>
            <div className="text-sm text-gray-600">Ativos 7 dias</div>
          </div>
        </Card>
      </div>

      {/* Filtros */}
      <Card className="p-6">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
          {/* Busca */}
          <div className="relative">
            <MagnifyingGlassIcon className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
            <input
              type="text"
              placeholder="Buscar por nome ou email..."
              value={filtros.busca}
              onChange={(e) => setFiltros(prev => ({ ...prev, busca: e.target.value }))}
              className="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          {/* Papel */}
          <select
            value={filtros.papel}
            onChange={(e) => setFiltros(prev => ({ ...prev, papel: e.target.value }))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option value="">Todos os papéis</option>
            <option value="admin">Administrador</option>
            <option value="gerencial">Gerencial</option>
            <option value="financeiro">Financeiro</option>
            <option value="operacional">Operacional</option>
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
            onClick={() => setFiltros({ busca: '', papel: '', status: 'ativo' })}
            className="flex items-center justify-center px-4 py-2 bg-gray-100 text-gray-700 rounded-lg hover:bg-gray-200"
          >
            <FunnelIcon className="w-4 h-4 mr-2" />
            Limpar
          </button>
        </div>
      </Card>

      {/* Lista de Usuários */}
      <Card className="overflow-hidden">
        <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
          <div className="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
            <div className="col-span-3">Nome</div>
            <div className="col-span-3">Email</div>
            <div className="col-span-2">Papel</div>
            <div className="col-span-2">Último Acesso</div>
            <div className="col-span-1">Status</div>
            <div className="col-span-1">Ações</div>
          </div>
        </div>

        <div className="divide-y divide-gray-200">
          {usuariosFiltrados.length === 0 ? (
            <div className="p-8 text-center text-gray-500">
              <UserGroupIcon className="w-12 h-12 mx-auto mb-4 text-gray-300" />
              <p>Nenhum usuário encontrado</p>
              <p className="text-sm">Ajuste os filtros ou adicione um novo usuário</p>
            </div>
          ) : (
            usuariosFiltrados.map((usuario: any) => (
              <div key={usuario.id} className="px-6 py-4 hover:bg-gray-50">
                <div className="grid grid-cols-12 gap-4 items-center">
                  <div className="col-span-3">
                    <div className="flex items-center">
                      <UserGroupIcon className="w-5 h-5 mr-3 text-blue-600" />
                      <div>
                        <span className="text-sm font-medium text-gray-900 block">
                          {usuario.user_metadata?.nome || usuario.email?.split('@')[0] || 'Usuário'}
                        </span>
                        <span className="text-xs text-gray-500">
                          Criado em {formatDateTime(usuario.created_at).split(' ')[0]}
                        </span>
                      </div>
                    </div>
                  </div>
                  
                  <div className="col-span-3">
                    <div className="flex items-center">
                      <EnvelopeIcon className="w-4 h-4 mr-2 text-gray-400" />
                      <span className="text-sm text-gray-900">
                        {usuario.email}
                      </span>
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <div className="flex items-center">
                      <ShieldCheckIcon className="w-4 h-4 mr-2 text-gray-400" />
                      <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${getPapelColor(usuario.user_metadata?.papel || 'operacional')}`}>
                        {getPapelLabel(usuario.user_metadata?.papel || 'operacional')}
                      </span>
                    </div>
                  </div>
                  
                  <div className="col-span-2">
                    <div className="flex items-center text-sm text-gray-600">
                      <CalendarIcon className="w-4 h-4 mr-2" />
                      <span>{formatDateTime(usuario.last_sign_in_at)}</span>
                    </div>
                  </div>
                  
                  <div className="col-span-1">
                    <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${
                      !usuario.banned_until 
                        ? 'bg-green-100 text-green-800' 
                        : 'bg-gray-100 text-gray-800'
                    }`}>
                      {!usuario.banned_until ? 'Ativo' : 'Inativo'}
                    </span>
                  </div>
                  
                  <div className="col-span-1">
                    <div className="flex gap-1">
                      <button className="p-1 text-gray-400 hover:text-blue-600" title="Editar">
                        <PencilIcon className="w-4 h-4" />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-yellow-600" title="Resetar Senha">
                        <KeyIcon className="w-4 h-4" />
                      </button>
                      <button className="p-1 text-gray-400 hover:text-red-600" title="Excluir">
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
            <h3 className="text-lg font-semibold mb-4">Novo Usuário</h3>
            <p className="text-gray-600 mb-4">Modal para cadastro de usuário será implementado.</p>
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