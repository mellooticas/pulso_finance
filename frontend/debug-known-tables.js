// Verificar tabelas conhecidas
import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'fs'
import { fileURLToPath } from 'url'
import { dirname, join } from 'path'

// Carregar variáveis do .env.local
const __filename = fileURLToPath(import.meta.url)
const __dirname = dirname(__filename)

try {
  const envContent = readFileSync(join(__dirname, '.env.local'), 'utf8')
  const lines = envContent.split('\n')
  
  for (const line of lines) {
    if (line.trim() && !line.startsWith('#')) {
      const [key, ...valueParts] = line.split('=')
      const value = valueParts.join('=').trim()
      process.env[key.trim()] = value
    }
  }
} catch (error) {
  console.error('❌ Erro ao carregar .env.local:', error.message)
}

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY

const supabase = createClient(supabaseUrl, supabaseKey)

async function checkKnownTables() {
  console.log('🔍 === VERIFICANDO TABELAS CONHECIDAS ===\n')
  
  // Login
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: 'junior@oticastatymello.com.br',
    password: 'Kt12jyh2815t@'
  })
  
  if (authError) {
    console.log('❌ Erro no login:', authError.message)
    return
  }
  
  console.log('✅ Login OK')
  
  // Tabelas que sabemos que existem
  const knownTables = [
    'usuarios',
    'lojas', 
    'plano_contas',
    'contas_financeiras'
  ]
  
  for (const table of knownTables) {
    console.log(`\n📋 Verificando: ${table}`)
    try {
      const { data, error } = await supabase
        .from(table)
        .select('*')
        .limit(1)
      
      if (error) {
        console.log(`❌ ${table}: ${error.message}`)
      } else {
        console.log(`✅ ${table}: ${data?.length || 0} registros`)
        if (data && data.length > 0) {
          console.log(`   Estrutura: ${Object.keys(data[0]).join(', ')}`)
        }
      }
    } catch (err) {
      console.log(`❌ ${table}: ${err.message}`)
    }
  }
  
  // Verificar se há dados de exemplo
  console.log('\n💰 Verificando movimentações financeiras...')
  
  // Verificar se existe alguma tabela com movimento/lançamento
  const financialTables = [
    'movimentos',
    'lancamentos', 
    'transacoes_financeiras',
    'fluxo_caixa',
    'entradas_saidas'
  ]
  
  for (const table of financialTables) {
    try {
      const { data, error } = await supabase
        .from(table)
        .select('*')
        .limit(1)
      
      if (!error && data) {
        console.log(`\n🎯 ENCONTRADO: ${table}`)
        console.log(`   Registros: ${data.length}`)
        if (data.length > 0) {
          console.log(`   Estrutura: ${Object.keys(data[0]).join(', ')}`)
        }
      }
    } catch (err) {
      // Ignorar erro
    }
  }
  
  // Verificar plano_contas mais detalhadamente
  console.log('\n📊 Detalhes do plano_contas:')
  try {
    const { data, error } = await supabase
      .from('plano_contas')
      .select('*')
      .limit(5)
    
    if (error) {
      console.log('❌ Erro plano_contas:', error.message)
    } else {
      console.log(`✅ Plano contas: ${data?.length || 0} registros`)
      data?.forEach((conta, i) => {
        console.log(`   ${i+1}. ${conta.codigo} - ${conta.nome} (${conta.categoria})`)
      })
    }
  } catch (err) {
    console.log('❌ Erro plano_contas:', err.message)
  }
}

// Executar verificação
checkKnownTables().catch(console.error)