'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'

// Types para Lojas
export interface Loja {
  id: string
  codigo: string
  nome: string
  cidade: string
  endereco?: string
  telefone?: string
  email?: string
  ativa: boolean
  created_at: string
  updated_at: string
}

// Hook para todas as lojas
export function useLojas() {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['lojas'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lojas')
        .select('*')
        .order('codigo')

      if (error) {
        console.error('❌ Erro ao carregar lojas:', error)
        throw error
      }

      return data as Loja[]
    },
    enabled: !!user,
  })
}

// Hook para loja específica
export function useLoja(id: string) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['loja', id],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('lojas')
        .select('*')
        .eq('id', id)
        .single()

      if (error) {
        console.error('❌ Erro ao carregar loja:', error)
        throw error
      }

      return data as Loja
    },
    enabled: !!user && !!id,
  })
}

// Hook para estatísticas por loja
export function useLojaStats(lojaId: string, periodo?: { inicio: string; fim: string }) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['loja-stats', lojaId, periodo],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia, parcelas(valor, valor_pago, status, vencimento)')
        .eq('loja_id', lojaId)

      if (periodo?.inicio) {
        query = query.gte('competencia', periodo.inicio)
      }
      if (periodo?.fim) {
        query = query.lte('competencia', periodo.fim)
      }

      const { data, error } = await query

      if (error) throw error

      const stats = {
        totalReceitas: 0,
        totalDespesas: 0,
        receitasRecebidas: 0,
        despesasPagas: 0,
        parcelasPendentes: 0,
        parcelasVencidas: 0,
        totalLancamentos: data.length
      }

      data.forEach(lancamento => {
        if (lancamento.tipo === 'receber') {
          stats.totalReceitas += lancamento.valor_total
          
          // Somar valores recebidos das parcelas
          lancamento.parcelas?.forEach(parcela => {
            if (parcela.status === 'pago') {
              stats.receitasRecebidas += parcela.valor_pago || 0
            } else {
              stats.parcelasPendentes++
              if (new Date(parcela.vencimento) < new Date()) {
                stats.parcelasVencidas++
              }
            }
          })
        } else {
          stats.totalDespesas += lancamento.valor_total
          
          // Somar valores pagos das parcelas
          lancamento.parcelas?.forEach(parcela => {
            if (parcela.status === 'pago') {
              stats.despesasPagas += parcela.valor_pago || 0
            } else {
              stats.parcelasPendentes++
              if (new Date(parcela.vencimento) < new Date()) {
                stats.parcelasVencidas++
              }
            }
          })
        }
      })

      return {
        ...stats,
        resultado: stats.totalReceitas - stats.totalDespesas,
        recebimentoPendente: stats.totalReceitas - stats.receitasRecebidas,
        pagamentoPendente: stats.totalDespesas - stats.despesasPagas
      }
    },
    enabled: !!user && !!lojaId,
  })
}

// Hook para comparativo entre lojas
export function useComparativoLojas(periodo?: { inicio: string; fim: string }) {
  const { user } = useAuth()
  const { data: lojas } = useLojas()

  return useQuery({
    queryKey: ['comparativo-lojas', periodo],
    queryFn: async () => {
      if (!lojas) return []

      const comparativo = await Promise.all(
        lojas.map(async (loja) => {
          let query = supabase
            .from('lancamentos')
            .select('tipo, valor_total')
            .eq('loja_id', loja.id)

          if (periodo?.inicio) {
            query = query.gte('competencia', periodo.inicio)
          }
          if (periodo?.fim) {
            query = query.lte('competencia', periodo.fim)
          }

          const { data, error } = await query

          if (error) throw error

          const stats = data.reduce((acc, lancamento) => {
            if (lancamento.tipo === 'receber') {
              acc.receitas += lancamento.valor_total
            } else {
              acc.despesas += lancamento.valor_total
            }
            return acc
          }, { receitas: 0, despesas: 0 })

          return {
            loja,
            ...stats,
            resultado: stats.receitas - stats.despesas,
            totalLancamentos: data.length
          }
        })
      )

      return comparativo.sort((a, b) => b.resultado - a.resultado)
    },
    enabled: !!user && !!lojas,
  })
}

// Hook para ranking de lojas por performance
export function useRankingLojas(criterio: 'receitas' | 'resultado' | 'lancamentos' = 'resultado') {
  const { data: comparativo } = useComparativoLojas()

  return useQuery({
    queryKey: ['ranking-lojas', criterio, comparativo],
    queryFn: async () => {
      if (!comparativo) return []

      const ranking = [...comparativo].sort((a, b) => {
        switch (criterio) {
          case 'receitas':
            return b.receitas - a.receitas
          case 'lancamentos':
            return b.totalLancamentos - a.totalLancamentos
          case 'resultado':
          default:
            return b.resultado - a.resultado
        }
      })

      return ranking.map((item, index) => {
        const criterioKey = criterio === 'lancamentos' ? 'totalLancamentos' : criterio
        const total = comparativo.reduce((acc, c) => {
          const key = criterio === 'lancamentos' ? 'totalLancamentos' : criterio
          return acc + (c as any)[key]
        }, 0)
        
        return {
          ...item,
          posicao: index + 1,
          percentual: total > 0 ? ((item as any)[criterioKey] / total) * 100 : 0
        }
      })
    },
    enabled: !!comparativo,
  })
}