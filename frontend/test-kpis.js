// Teste final para verificar se os KPIs estão funcionando
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function testarKPIs() {
  console.log('🎯 Testando dados para KPIs do dashboard...')
  
  try {
    // Período atual (outubro 2025)
    const currentMonth = 10
    const currentYear = 2025
    const filtroAtual = {
      data_inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
      data_fim: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-31`
    }

    console.log(`📅 Buscando dados para: ${filtroAtual.data_inicio} até ${filtroAtual.data_fim}`)

    // Buscar estatísticas do mês atual
    const { data: lancamentosAtual, error } = await supabase
      .from('lancamentos')
      .select('tipo, valor_total, competencia')
      .gte('competencia', filtroAtual.data_inicio)
      .lte('competencia', filtroAtual.data_fim)

    if (error) {
      console.error('❌ Erro:', error)
      return
    }

    console.log(`📊 Lançamentos encontrados no período: ${lancamentosAtual?.length || 0}`)

    if (lancamentosAtual && lancamentosAtual.length > 0) {
      const stats = lancamentosAtual.reduce((acc, lancamento) => {
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
        totalLancamentos: 0
      })

      stats.resultado = stats.totalReceitas - stats.totalDespesas

      console.log('\n💰 KPIs do mês atual:')
      console.log(`🟢 Receitas: R$ ${stats.totalReceitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`🔴 Despesas: R$ ${stats.totalDespesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`💼 Resultado: R$ ${stats.resultado.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`📈 Total de lançamentos: ${stats.totalLancamentos}`)
    } else {
      console.log('⚠️ Nenhum lançamento encontrado no período atual')
      
      // Testar um período mais amplo
      console.log('\n🔍 Testando período mais amplo (últimos 3 meses)...')
      const { data: lancamentosAmplo } = await supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia')
        .gte('competencia', '2025-08-01')
        .lte('competencia', '2025-10-31')
        .limit(10)

      console.log(`📊 Últimos lançamentos encontrados: ${lancamentosAmplo?.length || 0}`)
      if (lancamentosAmplo && lancamentosAmplo.length > 0) {
        console.log('Amostra:', lancamentosAmplo.slice(0, 3))
      }
    }

    // Testar evolução mensal para 2025
    console.log('\n📈 Testando evolução mensal 2025...')
    const { data: evolucao2025, error: errorEvolucao } = await supabase
      .from('lancamentos')
      .select('tipo, valor_total, competencia')
      .gte('competencia', '2025-01-01')
      .lte('competencia', '2025-12-31')

    if (errorEvolucao) {
      console.error('❌ Erro ao buscar evolução:', errorEvolucao)
    } else {
      console.log(`📊 Lançamentos de 2025: ${evolucao2025?.length || 0}`)
      
      if (evolucao2025 && evolucao2025.length > 0) {
        // Agrupar por mês
        const porMes = evolucao2025.reduce((acc, lancamento) => {
          const mes = new Date(lancamento.competencia).getMonth() + 1
          if (!acc[mes]) {
            acc[mes] = { receitas: 0, despesas: 0, count: 0 }
          }
          
          if (lancamento.tipo === 'receber') {
            acc[mes].receitas += lancamento.valor_total
          } else {
            acc[mes].despesas += lancamento.valor_total
          }
          acc[mes].count++
          return acc
        }, {})

        console.log('📊 Resumo por mês em 2025:')
        Object.entries(porMes).forEach(([mes, dados]) => {
          console.log(`  Mês ${mes}: ${dados.count} lançamentos, R$ ${dados.receitas.toFixed(2)} receitas, R$ ${dados.despesas.toFixed(2)} despesas`)
        })
      }
    }

  } catch (error) {
    console.error('💥 Erro geral:', error)
  }
}

testarKPIs()