'use client'

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'

export interface CentroCusto {
  id: string
  codigo: string
  nome: string
  descricao?: string
  loja_id?: string
  ativo: boolean
  created_at: string
  updated_at: string
  loja?: {
    id: string
    codigo: string
    nome: string
  }
}

export interface CentroCustoFilters {
  busca?: string
  loja_id?: string
  status?: 'ativo' | 'inativo' | 'todos'
}

// Hook para buscar todos os centros de custo
export function useCentrosCusto(filters?: CentroCustoFilters) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['centros-custo', filters],
    queryFn: async () => {
      let query = supabase
        .from('centros_custo')
        .select(`
          *,
          loja:lojas(id, codigo, nome)
        `)
        .order('codigo')

      // Aplicar filtros
      if (filters?.loja_id) {
        query = query.eq('loja_id', filters.loja_id)
      }

      if (filters?.status === 'ativo') {
        query = query.eq('ativo', true)
      } else if (filters?.status === 'inativo') {
        query = query.eq('ativo', false)
      }

      const { data, error } = await query

      if (error) throw error

      // Filtro de busca por texto (feito no frontend)
      let result = data || []
      if (filters?.busca) {
        const busca = filters.busca.toLowerCase()
        result = result.filter(centro => 
          centro.nome.toLowerCase().includes(busca) ||
          centro.codigo.toLowerCase().includes(busca) ||
          centro.descricao?.toLowerCase().includes(busca)
        )
      }

      return result as CentroCusto[]
    },
    enabled: !!user
  })
}

// Hook para buscar um centro de custo específico
export function useCentroCusto(id: string) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['centro-custo', id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('centros_custo')
        .select(`
          *,
          loja:lojas(id, codigo, nome)
        `)
        .eq('id', id)
        .single()

      if (error) throw error
      return data as CentroCusto
    },
    enabled: !!user && !!id
  })
}

// Hook para criar centro de custo
export function useCreateCentroCusto() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (data: Omit<CentroCusto, 'id' | 'created_at' | 'updated_at' | 'loja'>) => {
      const { data: result, error } = await supabase
        .from('centros_custo')
        .insert(data)
        .select()
        .single()

      if (error) throw error
      return result
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['centros-custo'] })
    }
  })
}

// Hook para atualizar centro de custo
export function useUpdateCentroCusto() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async ({ id, ...data }: Partial<CentroCusto> & { id: string }) => {
      const { data: result, error } = await supabase
        .from('centros_custo')
        .update(data)
        .eq('id', id)
        .select()
        .single()

      if (error) throw error
      return result
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['centros-custo'] })
    }
  })
}

// Hook para deletar centro de custo
export function useDeleteCentroCusto() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from('centros_custo')
        .delete()
        .eq('id', id)

      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['centros-custo'] })
    }
  })
}

// Hook para estatísticas dos centros de custo
export function useCentrosCustoStats() {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['centros-custo-stats'],
    queryFn: async () => {
      // Buscar estatísticas básicas
      const { data: centros, error: centrosError } = await supabase
        .from('centros_custo')
        .select('id, ativo, loja_id')

      if (centrosError) throw centrosError

      // Buscar quantos lançamentos cada centro possui
      const { data: lancamentos, error: lancamentosError } = await supabase
        .from('lancamentos')
        .select('centro_custo_id')
        .not('centro_custo_id', 'is', null)

      if (lancamentosError) throw lancamentosError

      const totalCentros = centros?.length || 0
      const centrosAtivos = centros?.filter(c => c.ativo).length || 0
      const centrosInativos = totalCentros - centrosAtivos
      
      // Contar lançamentos por centro
      const lancamentosPorCentro = lancamentos?.reduce((acc: Record<string, number>, lancamento) => {
        const centroId = lancamento.centro_custo_id
        if (centroId) {
          acc[centroId] = (acc[centroId] || 0) + 1
        }
        return acc
      }, {}) || {}

      const centrosComLancamentos = Object.keys(lancamentosPorCentro).length
      const centrosSemLancamentos = totalCentros - centrosComLancamentos

      return {
        totalCentros,
        centrosAtivos,
        centrosInativos,
        centrosComLancamentos,
        centrosSemLancamentos,
        lancamentosPorCentro
      }
    },
    enabled: !!user
  })
}