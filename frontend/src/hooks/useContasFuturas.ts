/**
 * PULSO Finance - Hooks Corrigidos para Contas Futuras
 * Inclui valores pendentes, contas futuras e separação competência vs caixa
 */

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'

// =============================================
// HOOK: Fluxo de Caixa REAL (apenas realizados)
// =============================================
export function useFluxoCaixaRealizado({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['fluxo-caixa-realizado', { periodo, loja_id }],
    queryFn: async () => {
      // Buscar apenas parcelas PAGAS (caixa real)
      let query = supabase
        .from('parcelas')
        .select(`
          valor_parcela,
          data_pagamento,
          lancamento:lancamentos!inner(
            tipo,
            descricao,
            loja_id,
            plano_conta:planos_contas(nome)
          )
        `)
        .not('data_pagamento', 'is', null)  // Apenas pagas
        .gte('data_pagamento', periodo.inicio)
        .lte('data_pagamento', periodo.fim)
        .order('data_pagamento')

      if (loja_id) {
        query = query.eq('lancamentos.loja_id', loja_id)
      }

      const { data, error } = await query

      if (error) throw error

      // Processar movimentações por dia
      const movimentacoes = data || []
      const fluxoPorDia = movimentacoes.reduce((acc: any, mov) => {
        const data = mov.data_pagamento
        if (!acc[data]) {
          acc[data] = { entradas: 0, saidas: 0, transacoes: [] }
        }

        const valor = mov.valor_parcela || 0
        const lancamento = Array.isArray(mov.lancamento) ? mov.lancamento[0] : mov.lancamento
        if (lancamento?.tipo === 'receber') {
          acc[data].entradas += valor
        } else {
          acc[data].saidas += valor
        }

        acc[data].transacoes.push(mov)
        return acc
      }, {})

      // Calcular saldos acumulados
      let saldoAcumulado = 0
      const fluxoDiario = Object.keys(fluxoPorDia)
        .sort()
        .map(data => {
          const mov = fluxoPorDia[data]
          const saldoDia = mov.entradas - mov.saidas
          saldoAcumulado += saldoDia

          return {
            data,
            entradas: mov.entradas,
            saidas: mov.saidas,
            saldo_dia: saldoDia,
            saldo_acumulado: saldoAcumulado,
            transacoes: mov.transacoes
          }
        })

      return {
        periodo,
        tipo: 'caixa_realizado',
        total_entradas: movimentacoes.filter(m => {
          const lanc = Array.isArray(m.lancamento) ? m.lancamento[0] : m.lancamento
          return lanc?.tipo === 'receber'
        }).reduce((sum, m) => sum + (m.valor_parcela || 0), 0),
        total_saidas: movimentacoes.filter(m => {
          const lanc = Array.isArray(m.lancamento) ? m.lancamento[0] : m.lancamento
          return lanc?.tipo === 'pagar'
        }).reduce((sum, m) => sum + (m.valor_parcela || 0), 0),
        fluxo_diario: fluxoDiario
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 3 * 60 * 1000,
  })
}

// =============================================
// HOOK: Contas a Pagar/Receber (pendentes)
// =============================================
export function useContasPendentes({
  tipo,
  vencimento_ate,
  loja_id
}: {
  tipo?: 'receber' | 'pagar'
  vencimento_ate?: string
  loja_id?: string
} = {}) {
  return useQuery({
    queryKey: ['contas-pendentes', { tipo, vencimento_ate, loja_id }],
    queryFn: async () => {
      // Buscar parcelas PENDENTES
      let query = supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            tipo,
            descricao,
            loja_id,
            fornecedor:fornecedores(nome),
            plano_conta:planos_contas(nome)
          )
        `)
        .is('data_pagamento', null)  // Apenas não pagas
        .eq('status', 'pendente')
        .order('data_vencimento')

      // Filtros
      if (tipo) {
        query = query.eq('lancamentos.tipo', tipo)
      }

      if (vencimento_ate) {
        query = query.lte('data_vencimento', vencimento_ate)
      }

      if (loja_id) {
        query = query.eq('lancamentos.loja_id', loja_id)
      }

      const { data, error } = await query

      if (error) throw error

      // Agrupar por status de vencimento
      const hoje = new Date().toISOString().split('T')[0]
      const contas = data || []

      const agrupadas = {
        vencidas: contas.filter(c => c.data_vencimento < hoje),
        vencendo_hoje: contas.filter(c => c.data_vencimento === hoje),
        vencendo_7_dias: contas.filter(c => {
          const vencimento = new Date(c.data_vencimento)
          const limite = new Date()
          limite.setDate(limite.getDate() + 7)
          return vencimento > new Date(hoje) && vencimento <= limite
        }),
        futuras: contas.filter(c => {
          const vencimento = new Date(c.data_vencimento)
          const limite = new Date()
          limite.setDate(limite.getDate() + 7)
          return vencimento > limite
        })
      }

      // Calcular totais
      const calcularTotal = (lista: any[]) => 
        lista.reduce((sum, conta) => sum + (conta.valor_parcela || 0), 0)

      return {
        contas_por_status: agrupadas,
        totais: {
          vencidas: calcularTotal(agrupadas.vencidas),
          vencendo_hoje: calcularTotal(agrupadas.vencendo_hoje),
          vencendo_7_dias: calcularTotal(agrupadas.vencendo_7_dias),
          futuras: calcularTotal(agrupadas.futuras),
          total_geral: calcularTotal(contas)
        },
        resumo: {
          total_contas: contas.length,
          valor_total: calcularTotal(contas),
          tipo_filtro: tipo || 'todas'
        }
      }
    },
    staleTime: 2 * 60 * 1000,
  })
}

// =============================================
// HOOK: DRE por Competência vs Caixa
// =============================================
export function useDREComparativo({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['dre-comparativo', { periodo, loja_id }],
    queryFn: async () => {
      // 1. DRE por COMPETÊNCIA (lançamentos)
      let queryCompetencia = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          plano_conta:planos_contas!inner(codigo, nome)
        `)
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)

      if (loja_id) {
        queryCompetencia = queryCompetencia.eq('loja_id', loja_id)
      }

      // 2. DRE por CAIXA (parcelas pagas)
      let queryCaixa = supabase
        .from('parcelas')
        .select(`
          valor_parcela,
          lancamento:lancamentos!inner(
            tipo,
            plano_conta:planos_contas!inner(codigo, nome)
          )
        `)
        .not('data_pagamento', 'is', null)
        .gte('data_pagamento', periodo.inicio)
        .lte('data_pagamento', periodo.fim)

      if (loja_id) {
        queryCaixa = queryCaixa.eq('lancamentos.loja_id', loja_id)
      }

      const [
        { data: competencia, error: errorComp },
        { data: caixa, error: errorCaixa }
      ] = await Promise.all([
        queryCompetencia,
        queryCaixa
      ])

      if (errorComp || errorCaixa) {
        throw new Error('Erro ao buscar dados da DRE')
      }

      // Processar competência
      const processarDados = (dados: any[], campo_valor: string) => {
        const receitas = dados.filter(d => d.tipo === 'receber' || d.lancamento?.tipo === 'receber')
        const despesas = dados.filter(d => d.tipo === 'pagar' || d.lancamento?.tipo === 'pagar')

        return {
          total_receitas: receitas.reduce((sum, r) => sum + (r[campo_valor] || 0), 0),
          total_despesas: despesas.reduce((sum, d) => sum + (d[campo_valor] || 0), 0),
          detalhes_receitas: receitas.reduce((acc: any, r) => {
            const plano = r.plano_conta?.nome || r.lancamento?.plano_conta?.nome || 'Outros'
            acc[plano] = (acc[plano] || 0) + (r[campo_valor] || 0)
            return acc
          }, {}),
          detalhes_despesas: despesas.reduce((acc: any, d) => {
            const plano = d.plano_conta?.nome || d.lancamento?.plano_conta?.nome || 'Outros'
            acc[plano] = (acc[plano] || 0) + (d[campo_valor] || 0)
            return acc
          }, {})
        }
      }

      const dreCompetencia = processarDados(competencia || [], 'valor_total')
      const dreCaixa = processarDados(caixa || [], 'valor_parcela')

      // Calcular diferenças
      const diferencas = {
        receitas: dreCompetencia.total_receitas - dreCaixa.total_receitas,
        despesas: dreCompetencia.total_despesas - dreCaixa.total_despesas,
        resultado: (dreCompetencia.total_receitas - dreCompetencia.total_despesas) - 
                  (dreCaixa.total_receitas - dreCaixa.total_despesas)
      }

      return {
        periodo,
        competencia: {
          ...dreCompetencia,
          resultado: dreCompetencia.total_receitas - dreCompetencia.total_despesas
        },
        caixa: {
          ...dreCaixa,
          resultado: dreCaixa.total_receitas - dreCaixa.total_despesas
        },
        diferencas,
        analise: {
          contas_a_receber: diferencas.receitas > 0 ? diferencas.receitas : 0,
          contas_a_pagar: diferencas.despesas > 0 ? diferencas.despesas : 0,
          gap_fluxo: Math.abs(diferencas.resultado)
        }
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 5 * 60 * 1000,
  })
}

// =============================================
// HOOK: Projeção de Fluxo Futuro
// =============================================
export function useProjecaoFluxo({
  meses_adiante = 6,
  loja_id
}: {
  meses_adiante?: number
  loja_id?: string
} = {}) {
  return useQuery({
    queryKey: ['projecao-fluxo', { meses_adiante, loja_id }],
    queryFn: async () => {
      // Calcular período futuro
      const hoje = new Date()
      const futuro = new Date(hoje)
      futuro.setMonth(futuro.getMonth() + meses_adiante)

      const periodo_futuro = {
        inicio: hoje.toISOString().split('T')[0],
        fim: futuro.toISOString().split('T')[0]
      }

      // Buscar parcelas futuras
      let query = supabase
        .from('parcelas')
        .select(`
          data_vencimento,
          valor_parcela,
          status,
          lancamento:lancamentos!inner(
            tipo,
            descricao,
            fornecedor:fornecedores(nome)
          )
        `)
        .is('data_pagamento', null)  // Não pagas
        .gte('data_vencimento', periodo_futuro.inicio)
        .lte('data_vencimento', periodo_futuro.fim)
        .order('data_vencimento')

      if (loja_id) {
        query = query.eq('lancamentos.loja_id', loja_id)
      }

      const { data, error } = await query

      if (error) throw error

      // Agrupar por mês
      const projecaoPorMes = (data || []).reduce((acc: any, parcela) => {
        const mesAno = parcela.data_vencimento.substring(0, 7) // YYYY-MM
        
        if (!acc[mesAno]) {
          acc[mesAno] = {
            entradas_previstas: 0,
            saidas_previstas: 0,
            saldo_previsto: 0,
            transacoes: []
          }
        }

        const valor = parcela.valor_parcela || 0
        const lancamento = Array.isArray(parcela.lancamento) ? parcela.lancamento[0] : parcela.lancamento
        if (lancamento?.tipo === 'receber') {
          acc[mesAno].entradas_previstas += valor
        } else {
          acc[mesAno].saidas_previstas += valor
        }

        acc[mesAno].saldo_previsto = acc[mesAno].entradas_previstas - acc[mesAno].saidas_previstas
        acc[mesAno].transacoes.push(parcela)

        return acc
      }, {})

      // Calcular totais gerais
      const totalEntradas = Object.values(projecaoPorMes).reduce((sum: number, mes: any) => sum + mes.entradas_previstas, 0)
      const totalSaidas = Object.values(projecaoPorMes).reduce((sum: number, mes: any) => sum + mes.saidas_previstas, 0)

      return {
        periodo_projecao: periodo_futuro,
        projecao_mensal: projecaoPorMes,
        totais: {
          entradas_previstas: totalEntradas,
          saidas_previstas: totalSaidas,
          saldo_previsto: totalEntradas - totalSaidas
        },
        alertas: {
          meses_negativos: Object.entries(projecaoPorMes).filter(([_, mes]: any) => mes.saldo_previsto < 0).length,
          maior_saida: Math.max(...Object.values(projecaoPorMes).map((mes: any) => mes.saidas_previstas)),
          mês_crítico: Object.entries(projecaoPorMes).reduce((pior: any, [mes, dados]: any) => 
            (!pior || dados.saldo_previsto < pior.saldo) ? { mes, saldo: dados.saldo_previsto } : pior, null
          )
        }
      }
    },
    staleTime: 10 * 60 * 1000,
  })
}

// =============================================
// HOOK: Dashboard KPIs Corrigido
// =============================================
export function useDashboardKPIsCorrigido({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['dashboard-kpis-corrigido', { periodo, loja_id }],
    queryFn: async () => {
      // Usar hooks especializados
      const [dreComparativo, contasPendentes, projecaoFluxo] = await Promise.all([
        // Simular calls dos outros hooks - em produção usaria os dados diretamente
        fetch('/api/dre-comparativo').then(r => r.json()).catch(() => ({})),
        fetch('/api/contas-pendentes').then(r => r.json()).catch(() => ({})),
        fetch('/api/projecao-fluxo').then(r => r.json()).catch(() => ({}))
      ])

      // KPIs principais corrigidos
      return {
        periodo,
        kpis_corrigidos: {
          // Caixa real (apenas realizados)
          caixa_realizado: dreComparativo.caixa?.resultado || 0,
          // Competência (lançamentos do período)
          resultado_competencia: dreComparativo.competencia?.resultado || 0,
          // Gap entre competência e caixa
          gap_realizacao: dreComparativo.diferencas?.resultado || 0,
          // Contas pendentes
          contas_a_receber: contasPendentes.totais?.total_geral || 0,
          // Projeção futura
          saldo_futuro_6m: projecaoFluxo.totais?.saldo_previsto || 0
        },
        alertas_financeiros: {
          gap_alto: Math.abs(dreComparativo.diferencas?.resultado || 0) > 10000,
          contas_vencidas: (contasPendentes.totais?.vencidas || 0) > 0,
          fluxo_futuro_negativo: (projecaoFluxo.totais?.saldo_previsto || 0) < 0,
          realizacao_baixa: Math.abs(dreComparativo.diferencas?.receitas || 0) > 5000
        }
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 2 * 60 * 1000,
  })
}