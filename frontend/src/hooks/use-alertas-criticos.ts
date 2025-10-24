/**
 * 🎯 PULSO Finance - Hook para Alertas Críticos
 * 
 * Dashboard Executivo - Alertas urgentes que precisam ação IMEDIATA
 * Baseado em dados REAIS de parcelas vencidas
 */

'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'

export interface AlertaCritico {
  tipo: 'vencido' | 'vence_hoje' | 'vence_7dias'
  prioridade: 'critica' | 'alta' | 'media'
  mensagem: string
  quantidade: number
  valor_total: number
  detalhes?: any[]
}

export function useAlertasCriticos() {
  return useQuery({
    queryKey: ['alertas-criticos'],
    queryFn: async () => {
      const hoje = new Date()
      hoje.setHours(0, 0, 0, 0)
      
      const amanha = new Date(hoje)
      amanha.setDate(amanha.getDate() + 1)
      
      const seteDias = new Date(hoje)
      seteDias.setDate(seteDias.getDate() + 7)

      const hojeStr = hoje.toISOString().split('T')[0]
      const amanhaStr = amanha.toISOString().split('T')[0]
      const seteDiasStr = seteDias.toISOString().split('T')[0]

      // 1. CONTAS VENCIDAS (CRÍTICO! ⚠️)
      const { data: vencidas, error: errorVencidas } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas(id, nome),
            plano_conta:planos_contas(id, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')
        .eq('status', 'previsto')
        .lt('vencimento', hojeStr)
        .order('vencimento', { ascending: true })

      if (errorVencidas) throw errorVencidas

      // 2. CONTAS QUE VENCEM HOJE (URGENTE! 🔴)
      const { data: hojeData, error: errorHoje } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas(id, nome),
            plano_conta:planos_contas(id, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')
        .eq('status', 'previsto')
        .gte('vencimento', hojeStr)
        .lt('vencimento', amanhaStr)
        .order('vencimento', { ascending: true })

      if (errorHoje) throw errorHoje

      // 3. CONTAS PRÓXIMOS 7 DIAS (ATENÇÃO! 🟡)
      const { data: seteDiasData, error: errorSeteDias } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas(id, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')
        .eq('status', 'previsto')
        .gte('vencimento', amanhaStr)
        .lte('vencimento', seteDiasStr)
        .order('vencimento', { ascending: true })

      if (errorSeteDias) throw errorSeteDias

      // Calcular totais
      const valorVencidas = vencidas?.reduce((acc, p) => acc + (p.valor || 0), 0) || 0
      const valorHoje = hojeData?.reduce((acc, p) => acc + (p.valor || 0), 0) || 0
      const valorSeteDias = seteDiasData?.reduce((acc, p) => acc + (p.valor || 0), 0) || 0

      const alertas: AlertaCritico[] = []

      // Alerta de vencidas
      if (vencidas && vencidas.length > 0) {
        alertas.push({
          tipo: 'vencido',
          prioridade: 'critica',
          mensagem: `${vencidas.length} contas vencidas precisam ser pagas URGENTEMENTE`,
          quantidade: vencidas.length,
          valor_total: valorVencidas,
          detalhes: vencidas.slice(0, 5) // Top 5
        })
      }

      // Alerta de hoje
      if (hojeData && hojeData.length > 0) {
        alertas.push({
          tipo: 'vence_hoje',
          prioridade: 'critica',
          mensagem: `${hojeData.length} contas vencem HOJE e precisam de atenção`,
          quantidade: hojeData.length,
          valor_total: valorHoje,
          detalhes: hojeData.slice(0, 5)
        })
      }

      // Alerta de 7 dias
      if (seteDiasData && seteDiasData.length > 0) {
        alertas.push({
          tipo: 'vence_7dias',
          prioridade: 'alta',
          mensagem: `${seteDiasData.length} contas vencem nos próximos 7 dias`,
          quantidade: seteDiasData.length,
          valor_total: valorSeteDias,
          detalhes: seteDiasData.slice(0, 3)
        })
      }

      return {
        alertas,
        vencidas: vencidas || [],
        hoje: hojeData || [],
        seteDias: seteDiasData || [],
        totais: {
          vencidas: valorVencidas,
          hoje: valorHoje,
          seteDias: valorSeteDias,
          total: valorVencidas + valorHoje + valorSeteDias
        }
      }
    },
    refetchInterval: 5 * 60 * 1000, // Atualizar a cada 5 minutos
  })
}

// Hook para ações prioritárias do dia
export function useAcoesPrioritarias() {
  return useQuery({
    queryKey: ['acoes-prioritarias'],
    queryFn: async () => {
      const hoje = new Date()
      hoje.setHours(0, 0, 0, 0)
      const hojeStr = hoje.toISOString().split('T')[0]

      // Buscar contas vencidas (prioridade MÁXIMA)
      const { data: vencidas, error } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas(id, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')
        .eq('status', 'previsto')
        .lt('vencimento', hojeStr)
        .order('valor', { ascending: false })
        .limit(10)

      if (error) throw error

      // Agrupar por fornecedor/descrição
      const acoesPorFornecedor = vencidas?.reduce((acc: any[], parcela: any) => {
        const descricao = parcela.lancamento?.descricao || 'Sem descrição'
        const existe = acc.find(a => a.descricao === descricao)
        
        if (existe) {
          existe.quantidade++
          existe.valor += parcela.valor || 0
        } else {
          acc.push({
            tipo: 'pagar_vencido',
            prioridade: 'critica',
            descricao,
            loja: parcela.lancamento?.loja?.nome || 'N/A',
            quantidade: 1,
            valor: parcela.valor || 0,
            dias_vencido: Math.floor((hoje.getTime() - new Date(parcela.vencimento).getTime()) / (1000 * 60 * 60 * 24))
          })
        }
        return acc
      }, []) || []

      // Ordenar por valor (maiores primeiro)
      acoesPorFornecedor.sort((a, b) => b.valor - a.valor)

      return {
        acoes: acoesPorFornecedor.slice(0, 5), // Top 5 ações
        total_acoes: acoesPorFornecedor.length,
        valor_total: acoesPorFornecedor.reduce((acc, a) => acc + a.valor, 0)
      }
    },
    refetchInterval: 5 * 60 * 1000,
  })
}

// Hook para próximos vencimentos (calendário 7-30 dias)
export function useProximosVencimentos(dias: number = 7) {
  return useQuery({
    queryKey: ['proximos-vencimentos', dias],
    queryFn: async () => {
      const hoje = new Date()
      hoje.setHours(0, 0, 0, 0)
      
      const amanha = new Date(hoje)
      amanha.setDate(amanha.getDate() + 1)
      
      const futuro = new Date(hoje)
      futuro.setDate(futuro.getDate() + dias)

      const amanhaStr = amanha.toISOString().split('T')[0]
      const futuroStr = futuro.toISOString().split('T')[0]

      const { data, error } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas(id, nome)
          )
        `)
        .eq('lancamento.tipo', 'pagar')
        .eq('status', 'previsto')
        .gte('vencimento', amanhaStr)
        .lte('vencimento', futuroStr)
        .order('vencimento', { ascending: true })

      if (error) throw error

      // Agrupar por data
      const porData = data?.reduce((acc: any, parcela: any) => {
        const data = parcela.vencimento
        if (!acc[data]) {
          acc[data] = {
            data,
            quantidade: 0,
            valor_total: 0,
            parcelas: []
          }
        }
        acc[data].quantidade++
        acc[data].valor_total += parcela.valor || 0
        acc[data].parcelas.push(parcela)
        return acc
      }, {}) || {}

      const calendario = Object.values(porData).sort((a: any, b: any) => 
        a.data.localeCompare(b.data)
      )

      return {
        calendario,
        total_parcelas: data?.length || 0,
        valor_total: data?.reduce((acc, p) => acc + (p.valor || 0), 0) || 0
      }
    },
    refetchInterval: 5 * 60 * 1000,
  })
}
