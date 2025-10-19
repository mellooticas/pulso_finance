// Verificar estrutura real das tabelas no Supabase
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function verificarEstrutura() {
  console.log('🔍 Verificando estrutura real das tabelas...')
  
  try {
    // Verificar todas as tabelas disponíveis
    console.log('\n📋 Testando acesso às tabelas:')
    
    // Testar lancamentos com select *
    const { data: lancamentosTest, error: errorLancamentos } = await supabase
      .from('lancamentos')
      .select('*')
      .limit(1)
    
    if (errorLancamentos) {
      console.error('❌ Erro tabela lancamentos:', errorLancamentos)
    } else {
      console.log('✅ Tabela lancamentos acessível')
      if (lancamentosTest && lancamentosTest.length > 0) {
        console.log('Colunas disponíveis:', Object.keys(lancamentosTest[0]))
      }
    }

    // Testar parcelas
    const { data: parcelasTest, error: errorParcelas } = await supabase
      .from('parcelas')
      .select('*')
      .limit(1)
    
    if (errorParcelas) {
      console.error('❌ Erro tabela parcelas:', errorParcelas)
    } else {
      console.log('✅ Tabela parcelas acessível')
      if (parcelasTest && parcelasTest.length > 0) {
        console.log('Colunas disponíveis:', Object.keys(parcelasTest[0]))
      }
    }

    // Testar lojas sem especificar colunas
    const { data: lojasTest, error: errorLojas } = await supabase
      .from('lojas')
      .select('*')
      .limit(1)
    
    if (errorLojas) {
      console.error('❌ Erro tabela lojas:', errorLojas)
    } else {
      console.log('✅ Tabela lojas acessível')
      if (lojasTest && lojasTest.length > 0) {
        console.log('Colunas disponíveis:', Object.keys(lojasTest[0]))
      }
    }

    // Testar plano_contas
    const { data: planosTest, error: errorPlanos } = await supabase
      .from('plano_contas')
      .select('*')
      .limit(1)
    
    if (errorPlanos) {
      console.error('❌ Erro tabela plano_contas:', errorPlanos)
    } else {
      console.log('✅ Tabela plano_contas acessível')
      if (planosTest && planosTest.length > 0) {
        console.log('Colunas disponíveis:', Object.keys(planosTest[0]))
      }
    }

    // Verificar se há dados nas tabelas principais
    console.log('\n📊 Verificando se há dados nas tabelas:')
    
    const { count: countLancamentos } = await supabase
      .from('lancamentos')
      .select('*', { count: 'exact', head: true })
    
    console.log(`📈 Lançamentos no banco: ${countLancamentos || 0}`)

    const { count: countParcelas } = await supabase
      .from('parcelas') 
      .select('*', { count: 'exact', head: true })
    
    console.log(`📋 Parcelas no banco: ${countParcelas || 0}`)

    const { count: countLojas } = await supabase
      .from('lojas')
      .select('*', { count: 'exact', head: true })
    
    console.log(`🏪 Lojas no banco: ${countLojas || 0}`)

    const { count: countPlanos } = await supabase
      .from('plano_contas')
      .select('*', { count: 'exact', head: true })
    
    console.log(`📋 Planos de conta no banco: ${countPlanos || 0}`)

    // Se há lançamentos, mostrar uma amostra
    if (countLancamentos && countLancamentos > 0) {
      console.log('\n💡 Amostra de lançamentos:')
      const { data: amostra } = await supabase
        .from('lancamentos')
        .select('*')
        .limit(3)
      
      console.log(JSON.stringify(amostra, null, 2))
    }

  } catch (error) {
    console.error('💥 Erro geral:', error)
  }
}

verificarEstrutura()