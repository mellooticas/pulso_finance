// Teste para verificar políticas RLS e acesso aos dados
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.KCFWKVm-LmbXr6R_f4XPW76CKiJGFcOQ8vNBmVIgMdI'

// Cliente com service role para bypasser RLS
const supabaseAdmin = createClient(supabaseUrl, supabaseServiceKey)

async function testarRLS() {
  console.log('🔍 Testando acesso aos dados com service role...')
  
  try {
    // Verificar dados com service role (bypass RLS)
    const { data: lancamentos, error: errorLancamentos } = await supabaseAdmin
      .from('lancamentos')
      .select('*')
      .limit(5)
    
    if (errorLancamentos) {
      console.error('❌ Erro ao buscar lançamentos (service role):', errorLancamentos)
    } else {
      console.log(`✅ Service role encontrou ${lancamentos?.length || 0} lançamentos`)
      if (lancamentos && lancamentos.length > 0) {
        console.log('Primeira linha:', lancamentos[0])
      }
    }

    // Contar total
    const { count: totalLancamentos } = await supabaseAdmin
      .from('lancamentos')
      .select('*', { count: 'exact', head: true })
    
    console.log(`📊 Total de lançamentos (service role): ${totalLancamentos}`)

    const { count: totalParcelas } = await supabaseAdmin
      .from('parcelas')
      .select('*', { count: 'exact', head: true })
    
    console.log(`📋 Total de parcelas (service role): ${totalParcelas}`)

    // Verificar lojas
    const { data: lojas, error: errorLojas } = await supabaseAdmin
      .from('lojas')
      .select('*')
    
    if (errorLojas) {
      console.error('❌ Erro ao buscar lojas:', errorLojas)
    } else {
      console.log(`🏪 Lojas encontradas: ${lojas?.length || 0}`)
      if (lojas && lojas.length > 0) {
        console.log('Primeira loja:', lojas[0])
      }
    }

    // Verificar políticas RLS
    console.log('\n🔒 Verificando status RLS...')
    const { data: rlsStatus, error: rlsError } = await supabaseAdmin
      .rpc('check_rls_status')
      .single()
    
    if (rlsError) {
      console.log('ℹ️ Não foi possível verificar RLS automaticamente')
    } else {
      console.log('Status RLS:', rlsStatus)
    }

  } catch (error) {
    console.error('💥 Erro geral:', error)
  }
}

testarRLS()