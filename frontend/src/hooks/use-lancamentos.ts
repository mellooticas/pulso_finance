'use client'

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'

// Types para Lançamentos
export interface Lancamento {
  id: string
  loja_id: string
  tipo: 'receber' | 'pagar'
  plano_id: string
  descricao: string
  historico: string
  competencia: string
  valor_total: number
  origem: string
  metadata: any
  created_at: string
  updated_at: string
  
  // Relacionamentos
  loja?: {
    id: string
    codigo: string
    nome: string
    cidade: string
  }
  plano_conta?: {
    id: string
    codigo: string
    nome: string
    tipo: string
  }
  parcelas?: Parcela[]
}

export interface Parcela {
  id: string
  lancamento_id: string
  parcela: number
  vencimento: string
  valor: number
  valor_pago: number
  status: 'pendente' | 'pago' | 'atrasado'
  data_pagamento?: string
  forma_pagamento_id?: string
  
  // Relacionamentos
  forma_pagamento?: {
    id: string
    nome: string
    tipo: string
  }
}

export interface LancamentoFilters {
  loja_id?: string
  tipo?: 'receber' | 'pagar'
  plano_id?: string
  data_inicio?: string
  data_fim?: string
  status?: 'pendente' | 'pago' | 'atrasado'
  origem?: string
}

// Hook principal para lançamentos
export function useLancamentos(filters: LancamentoFilters = {}) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['lancamentos', filters],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select(`
          *,
          loja:lojas!inner(id, codigo, nome, cidade),
          plano_conta:plano_contas!inner(id, codigo, nome, tipo),
          parcelas(
            *,
            forma_pagamento:formas_pagamento(id, nome, tipo)
          )
        `)
        .order('competencia', { ascending: false })

      // Aplicar filtros
      if (filters.loja_id) {
        query = query.eq('loja_id', filters.loja_id)
      }
      
      if (filters.tipo) {
        query = query.eq('tipo', filters.tipo)
      }
      
      if (filters.plano_id) {
        query = query.eq('plano_id', filters.plano_id)
      }
      
      if (filters.data_inicio) {
        query = query.gte('competencia', filters.data_inicio)
      }
      
      if (filters.data_fim) {
        query = query.lte('competencia', filters.data_fim)
      }

      const { data, error } = await query

      if (error) {
        console.error('❌ Erro ao carregar lançamentos:', error)
        throw error
      }

      return data as Lancamento[]
    },
    enabled: !!user,
  })
}

// Hook para estatísticas dos lançamentos
export function useLancamentosStats(filters: LancamentoFilters = {}) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['lancamentos-stats', filters],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia')

      // Aplicar mesmos filtros
      if (filters.loja_id) query = query.eq('loja_id', filters.loja_id)
      if (filters.tipo) query = query.eq('tipo', filters.tipo)
      if (filters.data_inicio) query = query.gte('competencia', filters.data_inicio)
      if (filters.data_fim) query = query.lte('competencia', filters.data_fim)

      const { data, error } = await query

      if (error) throw error

      // Calcular estatísticas
      const stats = data.reduce((acc, lancamento) => {
        if (lancamento.tipo === 'receber') {
          acc.totalReceitas += lancamento.valor_total
        } else {
          acc.totalDespesas += lancamento.valor_total
        }
        acc.totalLancamentos++
        return acc
      }, {
        totalReceitas: 0,
        totalDespesas: 0,
        totalLancamentos: 0,
        resultado: 0
      })

      stats.resultado = stats.totalReceitas - stats.totalDespesas

      return stats
    },
    enabled: !!user,
  })
}

// Hook para evolução mensal
export function useLancamentosEvoluçaoMensal(ano: number = new Date().getFullYear()) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['lancamentos-evolucao', ano],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia')
        .gte('competencia', `${ano}-01-01`)
        .lte('competencia', `${ano}-12-31`)

      if (error) throw error

      // Agrupar por mês
      const evolucao = Array.from({ length: 12 }, (_, i) => ({
        mes: i + 1,
        nome: new Date(ano, i).toLocaleDateString('pt-BR', { month: 'short' }),
        receitas: 0,
        despesas: 0,
        resultado: 0
      }))

      data.forEach(lancamento => {
        const mes = new Date(lancamento.competencia).getMonth()
        if (lancamento.tipo === 'receber') {
          evolucao[mes].receitas += lancamento.valor_total
        } else {
          evolucao[mes].despesas += lancamento.valor_total
        }
      })

      evolucao.forEach(item => {
        item.resultado = item.receitas - item.despesas
      })

      return evolucao
    },
    enabled: !!user,
  })
}

// Hook para lançamentos por loja
export function useLancamentosPorLoja(filters: Omit<LancamentoFilters, 'loja_id'> = {}) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['lancamentos-por-loja', filters],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          loja:lojas!inner(id, codigo, nome, cidade)
        `)

      // Aplicar filtros exceto loja_id
      if (filters.tipo) query = query.eq('tipo', filters.tipo)
      if (filters.data_inicio) query = query.gte('competencia', filters.data_inicio)
      if (filters.data_fim) query = query.lte('competencia', filters.data_fim)

      const { data, error } = await query

      if (error) throw error

      // Agrupar por loja
      const porLoja = data.reduce((acc, lancamento) => {
        const lojaId = lancamento.loja.id
        
        if (!acc[lojaId]) {
          acc[lojaId] = {
            loja: lancamento.loja,
            receitas: 0,
            despesas: 0,
            resultado: 0,
            totalLancamentos: 0
          }
        }

        if (lancamento.tipo === 'receber') {
          acc[lojaId].receitas += lancamento.valor_total
        } else {
          acc[lojaId].despesas += lancamento.valor_total
        }
        
        acc[lojaId].totalLancamentos++
        return acc
      }, {} as Record<string, any>)

      // Calcular resultado e converter para array
      return Object.values(porLoja).map((item: any) => ({
        ...item,
        resultado: item.receitas - item.despesas
      }))
    },
    enabled: !!user,
  })
}

// Hook para criar lançamento
export function useCreateLancamento() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (novoLancamento: Omit<Lancamento, 'id' | 'created_at' | 'updated_at'>) => {
      const { data, error } = await supabase
        .from('lancamentos')
        .insert(novoLancamento)
        .select()
        .single()

      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['lancamentos'] })
      queryClient.invalidateQueries({ queryKey: ['lancamentos-stats'] })
    }
  })
}

// Hook para atualizar lançamento
export function useUpdateLancamento() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async ({ id, updates }: { id: string; updates: Partial<Lancamento> }) => {
      const { data, error } = await supabase
        .from('lancamentos')
        .update(updates)
        .eq('id', id)
        .select()
        .single()

      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['lancamentos'] })
      queryClient.invalidateQueries({ queryKey: ['lancamentos-stats'] })
    }
  })
}

// Hook para deletar lançamento
export function useDeleteLancamento() {
  const queryClient = useQueryClient()

  return useMutation({
    mutationFn: async (id: string) => {
      const { error } = await supabase
        .from('lancamentos')
        .delete()
        .eq('id', id)

      if (error) throw error
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['lancamentos'] })
      queryClient.invalidateQueries({ queryKey: ['lancamentos-stats'] })
    }
  })
}