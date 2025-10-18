'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'

// Types para Plano de Contas
export interface PlanoConta {
  id: string
  codigo: string
  nome: string
  tipo: 'receita' | 'despesa' | 'ativo' | 'passivo' | 'patrimonio'
  parent_id?: string
  nivel: number
  ativa: boolean
  created_at: string
  updated_at: string
}

// Hook para todas as contas
export function usePlanoContas() {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['plano-contas'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('plano_contas')
        .select('*')
        .order('codigo')

      if (error) {
        console.error('❌ Erro ao carregar plano de contas:', error)
        throw error
      }

      return data as PlanoConta[]
    },
    enabled: !!user,
  })
}

// Hook para contas por tipo
export function useContasPorTipo(tipo: PlanoConta['tipo']) {
  const { data: todasContas } = usePlanoContas()

  return useQuery({
    queryKey: ['contas-por-tipo', tipo, todasContas],
    queryFn: async () => {
      if (!todasContas) return []
      return todasContas.filter(conta => conta.tipo === tipo)
    },
    enabled: !!todasContas,
  })
}

// Hook para DRE (Demonstração do Resultado do Exercício)
export function useDRE(periodo?: { inicio: string; fim: string }, lojaId?: string) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['dre', periodo, lojaId],
    queryFn: async () => {
      // Buscar lançamentos do período
      let query = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          competencia,
          plano_conta:plano_contas(id, codigo, nome, tipo)
        `)

      if (periodo?.inicio) {
        query = query.gte('competencia', periodo.inicio)
      }
      if (periodo?.fim) {
        query = query.lte('competencia', periodo.fim)
      }
      if (lojaId) {
        query = query.eq('loja_id', lojaId)
      }

      const { data, error } = await query

      if (error) throw error

      // Estruturar DRE
      const dre = {
        receitas: {
          total: 0,
          contas: {} as Record<string, { nome: string; valor: number; codigo: string }>
        },
        despesas: {
          total: 0,
          contas: {} as Record<string, { nome: string; valor: number; codigo: string }>
        },
        resultado: {
          bruto: 0,
          liquido: 0
        }
      }

      // Processar lançamentos
      data.forEach(lancamento => {
        const conta = lancamento.plano_conta
        const valor = lancamento.valor_total

        if (lancamento.tipo === 'receber') {
          dre.receitas.total += valor
          
          if (!dre.receitas.contas[conta.id]) {
            dre.receitas.contas[conta.id] = {
              nome: conta.nome,
              codigo: conta.codigo,
              valor: 0
            }
          }
          dre.receitas.contas[conta.id].valor += valor
        } else {
          dre.despesas.total += valor
          
          if (!dre.despesas.contas[conta.id]) {
            dre.despesas.contas[conta.id] = {
              nome: conta.nome,
              codigo: conta.codigo,
              valor: 0
            }
          }
          dre.despesas.contas[conta.id].valor += valor
        }
      })

      // Calcular resultado
      dre.resultado.bruto = dre.receitas.total - dre.despesas.total
      dre.resultado.liquido = dre.resultado.bruto // Aqui poderia ter impostos, etc.

      // Converter contas para arrays ordenados
      const receitasArray = Object.entries(dre.receitas.contas)
        .map(([id, conta]) => ({ id, ...conta }))
        .sort((a, b) => b.valor - a.valor)

      const despesasArray = Object.entries(dre.despesas.contas)
        .map(([id, conta]) => ({ id, ...conta }))
        .sort((a, b) => b.valor - a.valor)

      return {
        ...dre,
        receitas: {
          ...dre.receitas,
          contasArray: receitasArray
        },
        despesas: {
          ...dre.despesas,
          contasArray: despesasArray
        }
      }
    },
    enabled: !!user,
  })
}

// Hook para evolução DRE mensal
export function useDREEvoluçaoMensal(ano: number = new Date().getFullYear(), lojaId?: string) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['dre-evolucao', ano, lojaId],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia')
        .gte('competencia', `${ano}-01-01`)
        .lte('competencia', `${ano}-12-31`)

      if (lojaId) {
        query = query.eq('loja_id', lojaId)
      }

      const { data, error } = await query

      if (error) throw error

      // Agrupar por mês
      const evolucao = Array.from({ length: 12 }, (_, i) => {
        const mes = i + 1
        return {
          mes,
          nome: new Date(ano, i).toLocaleDateString('pt-BR', { month: 'short' }),
          receitas: 0,
          despesas: 0,
          resultado: 0,
          margemBruta: 0
        }
      })

      data.forEach(lancamento => {
        const mes = new Date(lancamento.competencia).getMonth()
        if (lancamento.tipo === 'receber') {
          evolucao[mes].receitas += lancamento.valor_total
        } else {
          evolucao[mes].despesas += lancamento.valor_total
        }
      })

      // Calcular resultado e margem
      evolucao.forEach(item => {
        item.resultado = item.receitas - item.despesas
        item.margemBruta = item.receitas > 0 ? (item.resultado / item.receitas) * 100 : 0
      })

      return evolucao
    },
    enabled: !!user,
  })
}

// Hook para comparativo DRE por loja
export function useComparativoDRE(periodo?: { inicio: string; fim: string }) {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['comparativo-dre', periodo],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          loja:lojas(id, codigo, nome, cidade)
        `)

      if (periodo?.inicio) {
        query = query.gte('competencia', periodo.inicio)
      }
      if (periodo?.fim) {
        query = query.lte('competencia', periodo.fim)
      }

      const { data, error } = await query

      if (error) throw error

      // Agrupar por loja
      const comparativo = data.reduce((acc, lancamento) => {
        const lojaId = lancamento.loja.id
        
        if (!acc[lojaId]) {
          acc[lojaId] = {
            loja: lancamento.loja,
            receitas: 0,
            despesas: 0,
            resultado: 0,
            margemBruta: 0,
            participacao: 0
          }
        }

        if (lancamento.tipo === 'receber') {
          acc[lojaId].receitas += lancamento.valor_total
        } else {
          acc[lojaId].despesas += lancamento.valor_total
        }

        return acc
      }, {} as Record<string, any>)

      // Calcular resultado, margem e participação
      const totalReceitas = Object.values(comparativo).reduce((acc: number, item: any) => acc + item.receitas, 0)
      
      Object.values(comparativo).forEach((item: any) => {
        item.resultado = item.receitas - item.despesas
        item.margemBruta = item.receitas > 0 ? (item.resultado / item.receitas) * 100 : 0
        item.participacao = totalReceitas > 0 ? (item.receitas / totalReceitas) * 100 : 0
      })

      return Object.values(comparativo).sort((a: any, b: any) => b.receitas - a.receitas)
    },
    enabled: !!user,
  })
}