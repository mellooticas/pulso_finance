// Debug das queries do Supabase para identificar o problema
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

async function debugQueries() {
  console.log('🔍 === DEBUG DAS QUERIES SUPABASE ===\n')
  
  console.log('1. Verificando estrutura da tabela lancamentos...')
  try {
    const { data, error } = await supabase
      .from('lancamentos')
      .select('*')
      .limit(1)
    
    if (error) {
      console.log('❌ Erro na query lancamentos:', error.message)
      console.log('   Code:', error.code)
      console.log('   Details:', error.details)
    } else {
      console.log('✅ Estrutura lancamentos:', Object.keys(data[0] || {}))
    }
  } catch (err) {
    console.log('❌ Erro de conexão lancamentos:', err.message)
  }
  
  console.log('\n2. Verificando relacionamentos...')
  try {
    const { data, error } = await supabase
      .from('lancamentos')
      .select(`
        id,
        valor,
        tipo,
        data,
        categoria_id,
        loja_id
      `)
      .limit(2)
    
    if (error) {
      console.log('❌ Erro na query básica:', error.message)
    } else {
      console.log('✅ Query básica OK, registros:', data?.length || 0)
      if (data && data.length > 0) {
        console.log('   Exemplo:', data[0])
      }
    }
  } catch (err) {
    console.log('❌ Erro na query básica:', err.message)
  }
  
  console.log('\n3. Testando relacionamento com categorias...')
  try {
    const { data, error } = await supabase
      .from('categorias')
      .select('*')
      .limit(1)
    
    if (error) {
      console.log('❌ Erro na tabela categorias:', error.message)
    } else {
      console.log('✅ Categorias estrutura:', Object.keys(data[0] || {}))
    }
  } catch (err) {
    console.log('❌ Erro de conexão categorias:', err.message)
  }
  
  console.log('\n4. Testando relacionamento com plano_contas...')
  try {
    const { data, error } = await supabase
      .from('plano_contas')
      .select('*')
      .limit(1)
    
    if (error) {
      console.log('❌ Erro na tabela plano_contas:', error.message)
    } else {
      console.log('✅ Plano_contas estrutura:', Object.keys(data[0] || {}))
    }
  } catch (err) {
    console.log('❌ Erro de conexão plano_contas:', err.message)
  }
  
  console.log('\n5. Testando relacionamento com lojas...')
  try {
    const { data, error } = await supabase
      .from('lojas')
      .select('*')
      .limit(1)
    
    if (error) {
      console.log('❌ Erro na tabela lojas:', error.message)
    } else {
      console.log('✅ Lojas estrutura:', Object.keys(data[0] || {}))
    }
  } catch (err) {
    console.log('❌ Erro de conexão lojas:', err.message)
  }
  
  console.log('\n6. Testando JOIN simples...')
  try {
    const { data, error } = await supabase
      .from('lancamentos')
      .select(`
        id,
        valor,
        tipo,
        categorias(nome)
      `)
      .limit(1)
    
    if (error) {
      console.log('❌ Erro no JOIN categorias:', error.message)
      console.log('   Code:', error.code)
      console.log('   Hint:', error.hint)
    } else {
      console.log('✅ JOIN categorias OK:', data)
    }
  } catch (err) {
    console.log('❌ Erro no JOIN categorias:', err.message)
  }
  
  console.log('\n7. Verificando usuário autenticado...')
  try {
    const { data: { user }, error } = await supabase.auth.getUser()
    
    if (error) {
      console.log('❌ Erro de autenticação:', error.message)
    } else if (user) {
      console.log('✅ Usuário autenticado:', user.email)
      
      // Buscar perfil
      const { data: profile, error: profileError } = await supabase
        .from('usuarios')
        .select('*')
        .eq('email', user.email)
        .single()
      
      if (profileError) {
        console.log('❌ Erro ao buscar perfil:', profileError.message)
      } else {
        console.log('✅ Perfil encontrado:', profile.nome)
        console.log('   Lojas:', profile.loja_ids)
      }
    } else {
      console.log('❌ Usuário não autenticado')
    }
  } catch (err) {
    console.log('❌ Erro de autenticação:', err.message)
  }
}

// Executar debug
debugQueries().catch(console.error)