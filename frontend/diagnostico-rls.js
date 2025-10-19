// Teste de autenticação e RLS 
const { createClient } = require('@supabase/supabase-js')

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'

const supabase = createClient(supabaseUrl, supabaseAnonKey)

async function diagnosticarProblema() {
  console.log('🔍 Diagnosticando problemas de acesso...')
  
  try {
    // 1. Verificar se o usuário está autenticado
    const { data: { user }, error: authError } = await supabase.auth.getUser()
    
    if (authError) {
      console.error('❌ Erro de autenticação:', authError)
    } else if (user) {
      console.log('✅ Usuário autenticado:', user.email)
    } else {
      console.log('⚠️ Nenhum usuário autenticado')
    }

    // 2. Testar acesso direto às tabelas sem RLS
    console.log('\n📊 Testando acesso às tabelas...')
    
    // SQL direto para contar registros
    const { data: countResult, error: countError } = await supabase
      .rpc('sql_count_lancamentos')
    
    if (countError) {
      console.log('ℹ️ RPC não disponível, tentando query direta...')
      
      // Tentar query básica
      const { data: basicTest, error: basicError } = await supabase
        .from('lancamentos')
        .select('id')
        .limit(1)
      
      if (basicError) {
        console.error('❌ Erro ao acessar lancamentos:', basicError)
        
        if (basicError.code === 'PGRST116') {
          console.log('🔒 Problema: RLS está bloqueando acesso sem autenticação')
        }
      } else {
        console.log('✅ Acesso básico funcionando, dados:', basicTest?.length || 0)
      }
    }

    // 3. Verificar se as tabelas estão acessíveis publicamente
    console.log('\n🔓 Verificando configurações de acesso...')
    
    // Tentar diferentes abordagens
    const queries = [
      { name: 'lancamentos básico', table: 'lancamentos', select: 'id' },
      { name: 'parcelas básico', table: 'parcelas', select: 'id' },
      { name: 'lojas básico', table: 'lojas', select: 'id' },
      { name: 'plano_contas básico', table: 'plano_contas', select: 'id' }
    ]

    for (const query of queries) {
      try {
        const { data, error } = await supabase
          .from(query.table)
          .select(query.select)
          .limit(1)
        
        if (error) {
          console.log(`❌ ${query.name}: ${error.message}`)
        } else {
          console.log(`✅ ${query.name}: ${data?.length || 0} registros`)
        }
      } catch (err) {
        console.log(`💥 ${query.name}: ${err.message}`)
      }
    }

  } catch (error) {
    console.error('💥 Erro geral:', error)
  }
}

diagnosticarProblema()