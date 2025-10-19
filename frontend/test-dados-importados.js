// Teste rápido para verificar se os dados importados estão acessíveis
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function testarDadosImportados() {
  console.log('🔍 Testando acesso aos dados importados...')
  
  try {
    // Testar contagem de lançamentos
    console.log('\n📊 Verificando LANÇAMENTOS:')
    const { data: lancamentos, error: errorLancamentos } = await supabase
      .from('lancamentos')
      .select('id, tipo, valor_total, competencia')
      .limit(5)
    
    if (errorLancamentos) {
      console.error('❌ Erro ao buscar lançamentos:', errorLancamentos)
    } else {
      console.log(`✅ Encontrados ${lancamentos?.length || 0} lançamentos (amostra)`)
      console.log('Primeiros registros:', lancamentos)
    }

    // Testar contagem total
    const { count: totalLancamentos, error: errorCount } = await supabase
      .from('lancamentos')
      .select('*', { count: 'exact', head: true })
    
    if (errorCount) {
      console.error('❌ Erro ao contar lançamentos:', errorCount)
    } else {
      console.log(`📈 Total de lançamentos no banco: ${totalLancamentos}`)
    }

    // Testar parcelas
    console.log('\n📋 Verificando PARCELAS:')
    const { data: parcelas, error: errorParcelas } = await supabase
      .from('parcelas')
      .select('id, valor, status, vencimento')
      .limit(5)
    
    if (errorParcelas) {
      console.error('❌ Erro ao buscar parcelas:', errorParcelas)
    } else {
      console.log(`✅ Encontradas ${parcelas?.length || 0} parcelas (amostra)`)
      console.log('Primeiros registros:', parcelas)
    }

    // Testar contagem de parcelas
    const { count: totalParcelas, error: errorCountParcelas } = await supabase
      .from('parcelas')
      .select('*', { count: 'exact', head: true })
    
    if (errorCountParcelas) {
      console.error('❌ Erro ao contar parcelas:', errorCountParcelas)
    } else {
      console.log(`📈 Total de parcelas no banco: ${totalParcelas}`)
    }

    // Testar estatísticas por tipo
    console.log('\n💰 Verificando ESTATÍSTICAS:')
    const { data: stats, error: errorStats } = await supabase
      .from('lancamentos')
      .select('tipo, valor_total')
    
    if (errorStats) {
      console.error('❌ Erro ao buscar estatísticas:', errorStats)
    } else {
      const receitas = stats?.filter(l => l.tipo === 'receber').reduce((sum, l) => sum + l.valor_total, 0) || 0
      const despesas = stats?.filter(l => l.tipo === 'pagar').reduce((sum, l) => sum + l.valor_total, 0) || 0
      
      console.log(`🟢 Total Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`🔴 Total Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`💼 Saldo: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
    }

    // Testar lojas
    console.log('\n🏪 Verificando LOJAS:')
    const { data: lojas, error: errorLojas } = await supabase
      .from('lojas')
      .select('id, codigo, nome, cidade')
    
    if (errorLojas) {
      console.error('❌ Erro ao buscar lojas:', errorLojas)
    } else {
      console.log(`✅ Encontradas ${lojas?.length || 0} lojas:`)
      lojas?.forEach(loja => console.log(`  - ${loja.codigo}: ${loja.nome} (${loja.cidade})`))
    }

    // Testar planos de conta
    console.log('\n📋 Verificando PLANOS DE CONTA:')
    const { data: planos, error: errorPlanos } = await supabase
      .from('plano_contas')
      .select('id, codigo, nome, tipo')
      .limit(10)
    
    if (errorPlanos) {
      console.error('❌ Erro ao buscar planos de conta:', errorPlanos)
    } else {
      console.log(`✅ Encontrados ${planos?.length || 0} planos de conta (amostra):`)
      planos?.forEach(plano => console.log(`  - ${plano.codigo}: ${plano.nome} (${plano.tipo})`))
    }

  } catch (error) {
    console.error('💥 Erro geral:', error)
  }
}

testarDadosImportados()