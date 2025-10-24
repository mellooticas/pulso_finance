/**
 * 🔧 Hook especializado para Contas a Pagar e Receber
 * 
 * IMPORTANTE: Sistema usa tabela PARCELAS!
 * - lancamentos: cabeçalho (competência, valor total)
 * - parcelas: cada pagamento (vencimento, valor, status)
 * 
 * Para contas a pagar/receber, consultamos PARCELAS por vencimento!
 */

'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'

export interface ContasPagarReceberFilters {
  vencimento_inicio?: string
  vencimento_fim?: string
  loja_id?: string
  centro_custo_id?: string
  tipo?: 'receita' | 'despesa'
  status?: 'previsto' | 'pago' | 'atrasado' | 'cancelado'
}

// Hook para contas a pagar (consulta PARCELAS por vencimento)
export function useContasPagar(filters: ContasPagarReceberFilters = {}) {
  return useQuery({
    queryKey: ['contas-pagar', filters],
    queryFn: async () => {
      let query = supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            historico,
            competencia,
            valor_total,
            status_aprovacao,
            loja:lojas(id, codigo, nome),
            plano_conta:planos_contas(id, codigo, nome, categoria, tipo),
            centro_custo:centros_custo(id, codigo, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')  // Apenas despesas
        .order('vencimento', { ascending: true })

      // 🔑 FILTRO PRINCIPAL: Por VENCIMENTO da parcela
      if (filters.vencimento_inicio) {
        query = query.gte('vencimento', filters.vencimento_inicio)
      }
      
      if (filters.vencimento_fim) {
        query = query.lte('vencimento', filters.vencimento_fim)
      }

      // Filtro por loja do lançamento
      if (filters.loja_id) {
        query = query.eq('lancamento.loja_id', filters.loja_id)
      }
      
      // Filtro por centro de custo do lançamento
      if (filters.centro_custo_id) {
        query = query.eq('lancamento.centro_custo_id', filters.centro_custo_id)
      }
      
      // Filtro por status da parcela
      if (filters.status) {
        query = query.eq('status', filters.status)
      }

      const { data, error } = await query

      if (error) {
        console.error('❌ Erro ao carregar contas a pagar:', error)
        throw error
      }

      return data || []
    },
  })
}

// Hook para contas a receber (consulta PARCELAS por vencimento)
export function useContasReceber(filters: ContasPagarReceberFilters = {}) {
  return useQuery({
    queryKey: ['contas-receber', filters],
    queryFn: async () => {
      let query = supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            historico,
            competencia,
            valor_total,
            status_aprovacao,
            loja:lojas(id, codigo, nome),
            plano_conta:planos_contas(id, codigo, nome, categoria, tipo),
            centro_custo:centros_custo(id, codigo, nome)
          )
        `)
        .eq('lancamento.tipo', 'receber')  // Apenas receitas
        .order('vencimento', { ascending: true })

      // 🔑 FILTRO PRINCIPAL: Por VENCIMENTO da parcela
      if (filters.vencimento_inicio) {
        query = query.gte('vencimento', filters.vencimento_inicio)
      }
      
      if (filters.vencimento_fim) {
        query = query.lte('vencimento', filters.vencimento_fim)
      }

      if (filters.loja_id) {
        query = query.eq('lancamento.loja_id', filters.loja_id)
      }
      
      if (filters.centro_custo_id) {
        query = query.eq('lancamento.centro_custo_id', filters.centro_custo_id)
      }
      
      if (filters.status) {
        query = query.eq('status', filters.status)
      }

      const { data, error } = await query

      if (error) {
        console.error('❌ Erro ao carregar contas a receber:', error)
        throw error
      }

      return data || []
    },
  })
}

// Hook para estatísticas de contas a pagar por vencimento
export function useContasPagarStats(filters: ContasPagarReceberFilters = {}) {
  return useQuery({
    queryKey: ['contas-pagar-stats', filters],
    queryFn: async () => {
      let query = supabase
        .from('parcelas')
        .select(`
          valor,
          vencimento,
          status,
          lancamento:lancamentos!inner(tipo, loja_id, centro_custo_id)
        `)
        .eq('lancamento.tipo', 'pagar')

      if (filters.vencimento_inicio) {
        query = query.gte('vencimento', filters.vencimento_inicio)
      }
      
      if (filters.vencimento_fim) {
        query = query.lte('vencimento', filters.vencimento_fim)
      }

      if (filters.loja_id) {
        query = query.eq('lancamento.loja_id', filters.loja_id)
      }
      
      if (filters.centro_custo_id) {
        query = query.eq('lancamento.centro_custo_id', filters.centro_custo_id)
      }

      const { data, error } = await query

      if (error) throw error

      const hoje = new Date()
      hoje.setHours(0, 0, 0, 0)
      
      const stats = {
        total: 0,
        totalPago: 0,
        totalPendente: 0,
        totalVencido: 0,
        totalVencer7Dias: 0,
        quantidadeTotal: 0,
        quantidadePaga: 0,
        quantidadePendente: 0,
        quantidadeVencida: 0,
        quantidadeVencer7Dias: 0
      }

      data?.forEach(parcela => {
        const valor = parcela.valor || 0
        const vencimento = new Date(parcela.vencimento)
        const pago = parcela.status === 'pago'

        stats.total += valor
        stats.quantidadeTotal++

        if (pago) {
          stats.totalPago += valor
          stats.quantidadePaga++
        } else {
          stats.totalPendente += valor
          stats.quantidadePendente++

          if (vencimento < hoje) {
            stats.totalVencido += valor
            stats.quantidadeVencida++
          } else {
            const diasParaVencer = Math.ceil((vencimento.getTime() - hoje.getTime()) / (1000 * 60 * 60 * 24))
            if (diasParaVencer <= 7) {
              stats.totalVencer7Dias += valor
              stats.quantidadeVencer7Dias++
            }
          }
        }
      })

      return stats
    },
  })
}
