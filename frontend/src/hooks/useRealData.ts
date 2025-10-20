/**
 * PULSO Finance - Hooks de Dados Reais
 * Hooks para consumir dados reais do Supabase baseados na análise do Yampa
 */

import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase'

// =============================================
// HOOK: Fornecedores Reais
// =============================================
export function useFornecedores() {
  return useQuery({
    queryKey: ['fornecedores'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('fornecedores')
        .select(`
          *,
          lancamentos(count),
          lancamentos!inner(
            valor_total
          )
        `)
        .order('nome')
      
      if (error) throw error
      
      // Calcular estatísticas
      return data?.map(fornecedor => ({
        ...fornecedor,
        total_compras: fornecedor.lancamentos?.reduce(
          (sum: number, l: any) => sum + (l.valor_total || 0), 0
        ) || 0,
        num_transacoes: fornecedor.lancamentos?.length || 0
      })) || []
    },
    staleTime: 5 * 60 * 1000, // 5 minutos
  })
}

// =============================================
// HOOK: Produtos/Serviços Reais
// =============================================
export function useProdutos() {
  return useQuery({
    queryKey: ['produtos'],
    queryFn: async () => {
      const { data, error } = await supabase
        .from('produtos_servicos')
        .select(`
          *,
          lancamentos(
            valor_total,
            created_at
          )
        `)
        .order('categoria', { ascending: true })
        .order('nome')
      
      if (error) throw error
      
      // Agrupar por categoria e calcular estatísticas
      const categorias = data?.reduce((acc: any, produto) => {
        if (!acc[produto.categoria]) {
          acc[produto.categoria] = {
            nome: produto.categoria,
            produtos: [],
            total_vendido: 0,
            quantidade_vendas: 0
          }
        }
        
        const totalVendido = produto.lancamentos?.reduce(
          (sum: number, l: any) => sum + (l.valor_total || 0), 0
        ) || 0
        
        acc[produto.categoria].produtos.push({
          ...produto,
          total_vendido: totalVendido,
          quantidade_vendas: produto.lancamentos?.length || 0
        })
        
        acc[produto.categoria].total_vendido += totalVendido
        acc[produto.categoria].quantidade_vendas += produto.lancamentos?.length || 0
        
        return acc
      }, {}) || {}
      
      return Object.values(categorias)
    },
    staleTime: 10 * 60 * 1000, // 10 minutos
  })
}

// =============================================
// HOOK: Lançamentos com Filtros Avançados
// =============================================
export function useLancamentosAvancados({
  periodo,
  loja_id,
  fornecedor_id,
  categoria,
  tipo,
  status,
  limit = 50,
  offset = 0
}: {
  periodo?: { inicio: string; fim: string }
  loja_id?: string
  fornecedor_id?: string
  categoria?: string
  tipo?: 'receber' | 'pagar'
  status?: string
  limit?: number
  offset?: number
} = {}) {
  return useQuery({
    queryKey: ['lancamentos-avancados', { periodo, loja_id, fornecedor_id, categoria, tipo, status, limit, offset }],
    queryFn: async () => {
      let query = supabase
        .from('lancamentos')
        .select(`
          *,
          loja:lojas(nome, codigo),
          fornecedor:fornecedores(nome, categoria),
          produto:produtos_servicos(nome, categoria),
          plano_conta:planos_contas(codigo, nome),
          parcelas(
            numero_parcela,
            valor_parcela,
            data_vencimento,
            data_pagamento,
            status
          )
        `)
        .order('competencia', { ascending: false })
        .range(offset, offset + limit - 1)
      
      // Aplicar filtros
      if (periodo) {
        query = query
          .gte('competencia', periodo.inicio)
          .lte('competencia', periodo.fim)
      }
      
      if (loja_id) {
        query = query.eq('loja_id', loja_id)
      }
      
      if (fornecedor_id) {
        query = query.eq('fornecedor_id', fornecedor_id)
      }
      
      if (tipo) {
        query = query.eq('tipo', tipo)
      }
      
      if (status) {
        query = query.eq('status_aprovacao', status)
      }
      
      const { data, error } = await query
      
      if (error) throw error
      
      return data || []
    },
    enabled: true,
    staleTime: 2 * 60 * 1000, // 2 minutos
  })
}

// =============================================
// HOOK: DRE Real com Cálculos Automáticos
// =============================================
export function useDRE({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['dre', { periodo, loja_id }],
    queryFn: async () => {
      // Buscar receitas
      let receitasQuery = supabase
        .from('lancamentos')
        .select(`
          valor_total,
          plano_conta:planos_contas!inner(codigo, nome),
          loja:lojas!inner(nome)
        `)
        .eq('tipo', 'receber')
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)
        .like('planos_contas.codigo', '3%') // Receitas começam com 3
      
      if (loja_id) {
        receitasQuery = receitasQuery.eq('loja_id', loja_id)
      }
      
      // Buscar custos
      let custosQuery = supabase
        .from('lancamentos')
        .select(`
          valor_total,
          plano_conta:planos_contas!inner(codigo, nome),
          loja:lojas!inner(nome)
        `)
        .eq('tipo', 'pagar')
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)
        .like('planos_contas.codigo', '4%') // Custos começam com 4
      
      if (loja_id) {
        custosQuery = custosQuery.eq('loja_id', loja_id)
      }
      
      // Buscar despesas
      let despesasQuery = supabase
        .from('lancamentos')
        .select(`
          valor_total,
          plano_conta:planos_contas!inner(codigo, nome),
          loja:lojas!inner(nome)
        `)
        .eq('tipo', 'pagar')
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)
        .like('planos_contas.codigo', '5%') // Despesas começam com 5
      
      if (loja_id) {
        despesasQuery = despesasQuery.eq('loja_id', loja_id)
      }
      
      const [
        { data: receitas, error: errorReceitas },
        { data: custos, error: errorCustos },
        { data: despesas, error: errorDespesas }
      ] = await Promise.all([
        receitasQuery,
        custosQuery,
        despesasQuery
      ])
      
      if (errorReceitas || errorCustos || errorDespesas) {
        throw new Error('Erro ao buscar dados da DRE')
      }
      
      // Calcular totais
      const totalReceitas = receitas?.reduce((sum, r) => sum + (r.valor_total || 0), 0) || 0
      const totalCustos = custos?.reduce((sum, c) => sum + (c.valor_total || 0), 0) || 0
      const totalDespesas = despesas?.reduce((sum, d) => sum + (d.valor_total || 0), 0) || 0
      
      // Agrupar por plano de contas
      const receitasPorPlano = receitas?.reduce((acc: any, r) => {
        const plano = r.plano_conta?.nome || 'Outros'
        acc[plano] = (acc[plano] || 0) + (r.valor_total || 0)
        return acc
      }, {}) || {}
      
      const custosPorPlano = custos?.reduce((acc: any, c) => {
        const plano = c.plano_conta?.nome || 'Outros'
        acc[plano] = (acc[plano] || 0) + (c.valor_total || 0)
        return acc
      }, {}) || {}
      
      const despesasPorPlano = despesas?.reduce((acc: any, d) => {
        const plano = d.plano_conta?.nome || 'Outros'
        acc[plano] = (acc[plano] || 0) + (d.valor_total || 0)
        return acc
      }, {}) || {}
      
      // Calcular indicadores
      const lucroOperacional = totalReceitas - totalCustos - totalDespesas
      const margemOperacional = totalReceitas > 0 ? (lucroOperacional / totalReceitas) * 100 : 0
      const margemBruta = totalReceitas > 0 ? ((totalReceitas - totalCustos) / totalReceitas) * 100 : 0
      
      return {
        periodo,
        resumo: {
          total_receitas: totalReceitas,
          total_custos: totalCustos,
          total_despesas: totalDespesas,
          lucro_bruto: totalReceitas - totalCustos,
          lucro_operacional: lucroOperacional,
          margem_bruta: margemBruta,
          margem_operacional: margemOperacional
        },
        detalhes: {
          receitas: receitasPorPlano,
          custos: custosPorPlano,
          despesas: despesasPorPlano
        },
        dados_raw: {
          receitas: receitas || [],
          custos: custos || [],
          despesas: despesas || []
        }
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 5 * 60 * 1000, // 5 minutos
  })
}

// =============================================
// HOOK: Fluxo de Caixa Real
// =============================================
export function useFluxoCaixaReal({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['fluxo-caixa-real', { periodo, loja_id }],
    queryFn: async () => {
      // Buscar movimentações realizadas (parcelas pagas)
      let queryMovimentacoes = supabase
        .from('parcelas')
        .select(`
          valor_parcela,
          data_pagamento,
          tipo,
          lancamento:lancamentos!inner(
            descricao,
            loja_id,
            plano_conta:planos_contas(nome)
          )
        `)
        .not('data_pagamento', 'is', null)
        .gte('data_pagamento', periodo.inicio)
        .lte('data_pagamento', periodo.fim)
        .order('data_pagamento')
      
      if (loja_id) {
        queryMovimentacoes = queryMovimentacoes.eq('lancamentos.loja_id', loja_id)
      }
      
      // Buscar saldo inicial
      let queryAnterior = supabase
        .from('parcelas')
        .select('valor_parcela, tipo')
        .not('data_pagamento', 'is', null)
        .lt('data_pagamento', periodo.inicio)
      
      if (loja_id) {
        queryAnterior = queryAnterior.eq('lancamentos.loja_id', loja_id)
      }
      
      const [
        { data: movimentacoes, error: errorMov },
        { data: anterior, error: errorAnt }
      ] = await Promise.all([
        queryMovimentacoes,
        queryAnterior
      ])
      
      if (errorMov || errorAnt) throw new Error('Erro ao buscar fluxo de caixa')
      
      // Calcular saldo inicial
      const saldoInicialEntradas = anterior?.filter(a => a.tipo === 'receber')
        .reduce((sum, a) => sum + (a.valor_parcela || 0), 0) || 0
      const saldoInicialSaidas = anterior?.filter(a => a.tipo === 'pagar')
        .reduce((sum, a) => sum + (a.valor_parcela || 0), 0) || 0
      const saldoInicial = saldoInicialEntradas - saldoInicialSaidas
      
      // Processar movimentações por dia
      const fluxoPorDia: any[] = []
      let saldoAcumulado = saldoInicial
      
      const movimentacoesPorData = movimentacoes?.reduce((acc: any, mov) => {
        const data = mov.data_pagamento
        if (!acc[data]) {
          acc[data] = { entradas: 0, saidas: 0, movimentacoes: [] }
        }
        
        const valor = mov.valor_parcela || 0
        if (mov.tipo === 'receber') {
          acc[data].entradas += valor
        } else {
          acc[data].saidas += valor
        }
        
        acc[data].movimentacoes.push(mov)
        return acc
      }, {}) || {}
      
      // Ordenar por data e calcular saldo acumulado
      Object.keys(movimentacoesPorData)
        .sort()
        .forEach(data => {
          const mov = movimentacoesPorData[data]
          saldoAcumulado += mov.entradas - mov.saidas
          
          fluxoPorDia.push({
            data,
            entradas: mov.entradas,
            saidas: mov.saidas,
            saldo_dia: mov.entradas - mov.saidas,
            saldo_acumulado: saldoAcumulado,
            movimentacoes: mov.movimentacoes
          })
        })
      
      // Calcular totais do período
      const totalEntradas = movimentacoes?.filter(m => m.tipo === 'receber')
        .reduce((sum, m) => sum + (m.valor_parcela || 0), 0) || 0
      const totalSaidas = movimentacoes?.filter(m => m.tipo === 'pagar')
        .reduce((sum, m) => sum + (m.valor_parcela || 0), 0) || 0
      
      return {
        periodo,
        saldo_inicial: saldoInicial,
        saldo_final: saldoAcumulado,
        total_entradas: totalEntradas,
        total_saidas: totalSaidas,
        resultado_periodo: totalEntradas - totalSaidas,
        fluxo_diario: fluxoPorDia,
        resumo_mensal: fluxoPorDia.reduce((acc: any, dia) => {
          const mes = dia.data.substring(0, 7) // YYYY-MM
          if (!acc[mes]) {
            acc[mes] = {
              entradas: 0,
              saidas: 0,
              resultado: 0,
              dias: 0
            }
          }
          acc[mes].entradas += dia.entradas
          acc[mes].saidas += dia.saidas
          acc[mes].resultado += dia.saldo_dia
          acc[mes].dias += 1
          return acc
        }, {})
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 3 * 60 * 1000, // 3 minutos
  })
}

// =============================================
// HOOK: KPIs do Dashboard
// =============================================
export function useDashboardKPIs({
  periodo,
  loja_id
}: {
  periodo: { inicio: string; fim: string }
  loja_id?: string
}) {
  return useQuery({
    queryKey: ['dashboard-kpis', { periodo, loja_id }],
    queryFn: async () => {
      // Query para dados básicos
      let baseQuery = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          competencia,
          loja:lojas(nome),
          fornecedor:fornecedores(categoria),
          plano_conta:planos_contas(codigo, nome)
        `)
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)
      
      if (loja_id) {
        baseQuery = baseQuery.eq('loja_id', loja_id)
      }
      
      const { data: lancamentos, error } = await baseQuery
      
      if (error) throw error
      
      const receitas = lancamentos?.filter(l => l.tipo === 'receber') || []
      const despesas = lancamentos?.filter(l => l.tipo === 'pagar') || []
      
      // Calcular KPIs principais
      const totalReceitas = receitas.reduce((sum, r) => sum + (r.valor_total || 0), 0)
      const totalDespesas = despesas.reduce((sum, d) => sum + (d.valor_total || 0), 0)
      const resultado = totalReceitas - totalDespesas
      const margemLiquida = totalReceitas > 0 ? (resultado / totalReceitas) * 100 : 0
      
      // Receitas por categoria de fornecedor
      const receitasPorCategoria = receitas.reduce((acc: any, r) => {
        const categoria = r.fornecedor?.categoria || 'Outros'
        acc[categoria] = (acc[categoria] || 0) + (r.valor_total || 0)
        return acc
      }, {})
      
      // Top fornecedores
      const topFornecedores = Object.entries(receitasPorCategoria)
        .sort(([,a], [,b]) => (b as number) - (a as number))
        .slice(0, 5)
        .map(([categoria, valor]) => ({ categoria, valor }))
      
      // Evolução mensal
      const evolucaoMensal = lancamentos?.reduce((acc: any, l) => {
        const mes = l.competencia.substring(0, 7) // YYYY-MM
        if (!acc[mes]) {
          acc[mes] = { receitas: 0, despesas: 0, resultado: 0 }
        }
        
        if (l.tipo === 'receber') {
          acc[mes].receitas += l.valor_total || 0
        } else {
          acc[mes].despesas += l.valor_total || 0
        }
        acc[mes].resultado = acc[mes].receitas - acc[mes].despesas
        
        return acc
      }, {}) || {}
      
      return {
        periodo,
        kpis_principais: {
          total_receitas: totalReceitas,
          total_despesas: totalDespesas,
          resultado: resultado,
          margem_liquida: margemLiquida,
          num_transacoes: lancamentos?.length || 0,
          ticket_medio: receitas.length > 0 ? totalReceitas / receitas.length : 0
        },
        distribuicao: {
          receitas_por_categoria: receitasPorCategoria,
          top_fornecedores: topFornecedores
        },
        evolucao_mensal: evolucaoMensal,
        comparativo_anterior: {
          // TODO: implementar comparação com período anterior
          crescimento_receitas: 0,
          crescimento_resultado: 0
        }
      }
    },
    enabled: !!periodo.inicio && !!periodo.fim,
    staleTime: 5 * 60 * 1000,
  })
}

// =============================================
// MUTATIONS para CRUD
// =============================================
export function useCreateLancamento() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async (lancamento: any) => {
      const { data, error } = await supabase
        .from('lancamentos')
        .insert(lancamento)
        .select()
        .single()
      
      if (error) throw error
      return data
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['lancamentos-avancados'] })
      queryClient.invalidateQueries({ queryKey: ['dre'] })
      queryClient.invalidateQueries({ queryKey: ['fluxo-caixa-real'] })
      queryClient.invalidateQueries({ queryKey: ['dashboard-kpis'] })
    },
  })
}

export function useUpdateLancamento() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async ({ id, updates }: { id: string; updates: any }) => {
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
      queryClient.invalidateQueries({ queryKey: ['lancamentos-avancados'] })
      queryClient.invalidateQueries({ queryKey: ['dre'] })
      queryClient.invalidateQueries({ queryKey: ['fluxo-caixa-real'] })
      queryClient.invalidateQueries({ queryKey: ['dashboard-kpis'] })
    },
  })
}