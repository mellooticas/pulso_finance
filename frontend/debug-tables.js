// Verificar estrutura real das tabelas
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

// Cliente com autenticação
const supabase = createClient(supabaseUrl, supabaseKey)

async function checkTables() {
  console.log('🔍 === VERIFICANDO TABELAS REAIS ===\n')
  
  // Primeiro fazer login
  console.log('1. Fazendo login...')
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email: 'junior@oticastatymello.com.br',
    password: 'Kt12jyh2815t@'
  })
  
  if (authError) {
    console.log('❌ Erro no login:', authError.message)
    return
  }
  
  console.log('✅ Login OK:', authData.user?.email)
  
  // Verificar todas as tabelas
  const tables = [
    'lancamentos_financeiros',
    'movimento_financeiro', 
    'transacoes',
    'receitas_despesas',
    'categorias_financeiras',
    'tipos_categoria',
    'contas_financeiras'
  ]
  
  for (const table of tables) {
    console.log(`\n📋 Testando tabela: ${table}`)
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
          console.log(`   Campos: ${Object.keys(data[0]).join(', ')}`)
        }
      }
    } catch (err) {
      console.log(`❌ ${table}: ${err.message}`)
    }
  }
  
  // Verificar tabelas existentes
  console.log('\n📋 Listando todas as tabelas...')
  try {
    const { data, error } = await supabase
      .rpc('get_schema_tables')
    
    if (error) {
      console.log('❌ Erro ao listar tabelas:', error.message)
      
      // Tentar uma abordagem diferente
      console.log('\n🔍 Tentando descobrir tabelas via information_schema...')
      const { data: tables, error: tablesError } = await supabase
        .from('information_schema.tables')
        .select('table_name')
        .eq('table_schema', 'public')
      
      if (tablesError) {
        console.log('❌ Erro information_schema:', tablesError.message)
      } else {
        console.log('✅ Tabelas encontradas:', tables?.map(t => t.table_name))
      }
    } else {
      console.log('✅ Tabelas RPC:', data)
    }
  } catch (err) {
    console.log('❌ Erro ao listar tabelas:', err.message)
  }
}

// Executar verificação
checkTables().catch(console.error)