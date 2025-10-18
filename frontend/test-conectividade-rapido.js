// Script de teste rápido para verificar conectividade
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

const supabase = createClient(supabaseUrl, supabaseKey)

console.log('🔍 Testando conectividade com Supabase...')

async function testarConectividade() {
  try {
    // Teste básico de conectividade
    console.log('📡 Verificando conexão...')
    
    // Teste das tabelas principais
    const tabelas = ['lojas', 'plano_contas', 'usuarios', 'lancamentos']
    
    for (const tabela of tabelas) {
      try {
        const { data, error, count } = await supabase
          .from(tabela)
          .select('*', { count: 'exact', head: true })
          .limit(1)
        
        if (error) {
          console.log(`❌ ${tabela}: ${error.message}`)
        } else {
          console.log(`✅ ${tabela}: ${count || 0} registros encontrados`)
        }
      } catch (err) {
        console.log(`❌ ${tabela}: Erro na consulta - ${err}`)
      }
    }
    
    // Teste específico dos dados migrados
    console.log('\n🔍 Verificando dados da migração Yampa...')
    
    const { data: yampaData, error: yampaError } = await supabase
      .from('lancamentos')
      .select('id', { count: 'exact' })
      .eq('origem', 'migracao_yampa')
      .limit(1)
    
    if (yampaError) {
      console.log(`❌ Dados Yampa: ${yampaError.message}`)
    } else {
      console.log(`✅ Dados Yampa: ${yampaData?.length || 0} lançamentos migrados encontrados`)
    }
    
    console.log('\n🎯 Teste de conectividade concluído!')
    
  } catch (error) {
    console.error('❌ Erro geral:', error)
  }
}

testarConectividade()