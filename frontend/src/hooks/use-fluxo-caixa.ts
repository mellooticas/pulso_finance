'use client'

import { useQuery } from '@tanstack/react-query'
import { supabase } from '@/lib/supabase/client'
import { useAuth } from '@/contexts/auth-context'

export interface FluxoCaixaPeriodo {
  inicio: string
  fim: string
}

export interface FluxoCaixaFilters {
  periodo: FluxoCaixaPeriodo
  lojaId?: string
  centroCustoId?: string
}

export interface SaldoConta {
  conta_id: string
  conta_nome: string
  saldo_inicial: number
  saldo_atual: number
  entradas_periodo: number
  saidas_periodo: number
}

export interface FluxoCaixaData {
  saldo_total_inicial: number
  saldo_total_atual: number
  entradas_periodo: number
  saidas_periodo: number
  resultado_periodo: number
  contas: SaldoConta[]
  dias_caixa_disponivel: number
  media_saidas_diaria: number
  dias_anteriores?: Array<{
    data: string
    entradas: number
    saidas: number
    saldo_acumulado: number
  }>
}

// Hook para dados de fluxo de caixa
export function useFluxoCaixa(filters: FluxoCaixaFilters) {
  const { user } = useAuth()
  const { periodo, lojaId, centroCustoId } = filters

  return useQuery({
    queryKey: ['fluxo-caixa', filters],
    queryFn: async () => {
      // 1. Buscar saldos das contas financeiras
      const { data: contas, error: contasError } = await supabase
        .from('contas_financeiras')
        .select('id, apelido, saldo_inicial, saldo_atual, ativa')
        .eq('ativa', true)

      if (contasError) throw contasError

      // 2. Buscar lançamentos do período com filtros
      let query = supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          competencia,
          parcelas!inner(
            valor_pago,
            status,
            data_pagamento
          )
        `)
        .gte('competencia', periodo.inicio)
        .lte('competencia', periodo.fim)
      
      // Aplicar filtros opcionais
      if (lojaId) {
        query = query.eq('loja_id', lojaId)
      }
      if (centroCustoId) {
        query = query.eq('centro_custo_id', centroCustoId)
      }

      const { data: lancamentos, error: lancamentosError } = await query

      if (lancamentosError) throw lancamentosError

      // 3. Calcular entradas e saídas do período (apenas parcelas pagas)
      let entradasPeriodo = 0
      let saidasPeriodo = 0

      lancamentos.forEach(lancamento => {
        lancamento.parcelas?.forEach(parcela => {
          if (parcela.status === 'pago' && parcela.valor_pago) {
            if (lancamento.tipo === 'receber') {
              entradasPeriodo += parcela.valor_pago
            } else {
              saidasPeriodo += parcela.valor_pago
            }
          }
        })
      })

      // 4. Calcular saldo total das contas
      const saldoTotalInicial = contas.reduce((sum, conta) => sum + (conta.saldo_inicial || 0), 0)
      const saldoTotalAtual = contas.reduce((sum, conta) => sum + (conta.saldo_atual || 0), 0)

      // 5. Calcular média de saídas diárias (últimos 30 dias)
      const dataLimite = new Date()
      dataLimite.setDate(dataLimite.getDate() - 30)
      
      let querySaidas = supabase
        .from('lancamentos')
        .select(`
          valor_total,
          parcelas!inner(
            valor_pago,
            status,
            data_pagamento
          )
        `)
        .eq('tipo', 'pagar')
        .gte('competencia', dataLimite.toISOString().split('T')[0])
      
      // Aplicar mesmos filtros
      if (lojaId) {
        querySaidas = querySaidas.eq('loja_id', lojaId)
      }
      if (centroCustoId) {
        querySaidas = querySaidas.eq('centro_custo_id', centroCustoId)
      }

      const { data: saidasRecentes, error: saidasError } = await querySaidas

      if (saidasError) throw saidasError

      let totalSaidasRecentes = 0
      saidasRecentes.forEach(lancamento => {
        lancamento.parcelas?.forEach(parcela => {
          if (parcela.status === 'pago' && parcela.valor_pago) {
            totalSaidasRecentes += parcela.valor_pago
          }
        })
      })

      const mediaSaidasDiaria = totalSaidasRecentes / 30
      const diasCaixaDisponivel = mediaSaidasDiaria > 0 ? saldoTotalAtual / mediaSaidasDiaria : 999

      // 6. Preparar dados das contas individuais
      const contasComSaldo = contas.map(conta => ({
        conta_id: conta.id,
        conta_nome: conta.apelido,
        saldo_inicial: conta.saldo_inicial || 0,
        saldo_atual: conta.saldo_atual || 0,
        entradas_periodo: 0, // TODO: Implementar por conta se necessário
        saidas_periodo: 0    // TODO: Implementar por conta se necessário
      }))

      // 7. Calcular evolução dos últimos 7 dias para gráficos
      const diasAnteriores = []
      let saldoAcumulado = saldoTotalAtual
      
      for (let i = 0; i < 7; i++) {
        const data = new Date()
        data.setDate(data.getDate() - i)
        const dataStr = data.toISOString().split('T')[0]
        
        // Buscar entradas e saídas desse dia
        const { data: lancamentoDia } = await supabase
          .from('lancamentos')
          .select(`
            tipo,
            valor_total,
            parcelas!inner(valor_pago, status, data_pagamento)
          `)
          .eq('competencia', dataStr)
          .eq('parcelas.status', 'pago')
        
        let entradasDia = 0
        let saidasDia = 0
        
        lancamentoDia?.forEach(lanc => {
          lanc.parcelas?.forEach(p => {
            if (p.valor_pago) {
              if (lanc.tipo === 'receber') entradasDia += p.valor_pago
              else saidasDia += p.valor_pago
            }
          })
        })
        
        diasAnteriores.unshift({
          data: dataStr,
          entradas: entradasDia,
          saidas: saidasDia,
          saldo_acumulado: saldoAcumulado
        })
        
        saldoAcumulado -= (entradasDia - saidasDia)
      }

      const fluxoCaixa: FluxoCaixaData = {
        saldo_total_inicial: saldoTotalInicial,
        saldo_total_atual: saldoTotalAtual,
        entradas_periodo: entradasPeriodo,
        saidas_periodo: saidasPeriodo,
        resultado_periodo: entradasPeriodo - saidasPeriodo,
        contas: contasComSaldo,
        dias_caixa_disponivel: Math.round(diasCaixaDisponivel),
        media_saidas_diaria: mediaSaidasDiaria,
        dias_anteriores: diasAnteriores
      }

      return fluxoCaixa
    },
    enabled: true,
    staleTime: 1000 * 60 * 5, // 5 minutos
  })
}

// Hook para agendar vencimentos próximos (D+7)
export function useVencimentosProximos() {
  const { user } = useAuth()

  return useQuery({
    queryKey: ['vencimentos-proximos'],
    queryFn: async () => {
      const hoje = new Date()
      const seteDias = new Date(hoje)
      seteDias.setDate(hoje.getDate() + 7)

      const { data, error } = await supabase
        .from('parcelas')
        .select(`
          id,
          parcela,
          vencimento,
          valor,
          status,
          lancamento:lancamentos!inner(
            id,
            tipo,
            descricao,
            loja:lojas!inner(codigo, nome)
          )
        `)
        .in('status', ['pendente', 'atrasado'])
        .gte('vencimento', hoje.toISOString().split('T')[0])
        .lte('vencimento', seteDias.toISOString().split('T')[0])
        .order('vencimento')

      if (error) throw error

      // Separar por tipo
      const aReceber = data.filter((p: any) => p.lancamento.tipo === 'receber')
      const aPagar = data.filter((p: any) => p.lancamento.tipo === 'pagar')

      return {
        aReceber,
        aPagar,
        totalReceber: aReceber.reduce((sum, p) => sum + p.valor, 0),
        totalPagar: aPagar.reduce((sum, p) => sum + p.valor, 0)
      }
    },
    enabled: true,
    staleTime: 1000 * 60 * 15, // 15 minutos
  })
}

// Função utilitária para determinar a cor do indicador de dias de caixa
export function getCorDiasCaixa(dias: number) {
  if (dias > 15) return 'green'
  if (dias >= 8) return 'yellow' 
  return 'red'
}

// Função para formatar valores monetários
export function formatCurrency(value: number) {
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL'
  }).format(value)
}