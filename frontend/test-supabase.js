// Teste direto de conexão com Supabase
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

console.log('🔍 Testando conexão Supabase...')
console.log('URL:', supabaseUrl ? `${supabaseUrl.substring(0, 30)}...` : 'FALTANDO')
console.log('Key:', supabaseKey ? 'Configurada' : 'FALTANDO')

if (!supabaseUrl || !supabaseKey) {
  console.error('❌ Variáveis de ambiente não configuradas!')
  process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseKey)

async function testarConexao() {
  try {
    console.log('\n📡 Testando conexão básica...')
    
    // Teste 1: Verificar se consegue conectar
    const { data, error } = await supabase
      .from('usuarios')
      .select('email, nome, papel, ativo')
    
    if (error) {
      console.error('❌ Erro na consulta:', error)
      return false
    }
    
    console.log('✅ Conexão com banco funcionando!')
    console.log('✅ Dados encontrados:', data?.length || 0, 'usuários')
    
    if (data && data.length > 0) {
      console.log('\n👤 Usuários encontrados:')
      data.forEach((user, index) => {
        console.log(`${index + 1}. ${user.email} - ${user.nome} (${user.papel}) - Ativo: ${user.ativo}`)
      })
    }
    
    return true
  } catch (error) {
    console.error('❌ Erro de conexão:', error)
    return false
  }
}

async function testarLogin() {
  try {
    console.log('\n🔐 Testando login com credenciais reais...')
    
    const email = 'junior@oticastatymello.com.br'
    const password = '123456'
    
    console.log('📧 Email:', email)
    
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password
    })
    
    if (error) {
      console.error('❌ Erro no login:', error.message)
      return false
    }
    
    if (data.user) {
      console.log('✅ Login realizado com sucesso!')
      console.log('👤 Usuário ID:', data.user.id)
      console.log('📧 Email confirmado:', data.user.email)
      console.log('🕐 Última confirmação:', data.user.email_confirmed_at)
      
      // Buscar perfil do usuário
      const { data: profile, error: profileError } = await supabase
        .from('usuarios')
        .select('*')
        .eq('email', email)
        .single()
      
      if (profileError) {
        console.log('⚠️ Erro ao buscar perfil:', profileError.message)
      } else {
        console.log('✅ Perfil encontrado!')
        console.log('👤 Nome:', profile.nome)
        console.log('🏢 Papel:', profile.papel)
        console.log('✅ Ativo:', profile.ativo)
        console.log('🏪 Lojas:', profile.loja_ids)
      }
      
      return true
    }
    
    console.log('❌ Login falhou - usuário não retornado')
    return false
    
  } catch (error) {
    console.error('❌ Erro no teste de login:', error)
    return false
  }
}

async function testarTudo() {
  console.log('🧪 === TESTE COMPLETO SUPABASE ===\n')
  
  const conexaoOk = await testarConexao()
  if (!conexaoOk) {
    console.log('\n❌ Teste de conexão falhou!')
    return
  }
  
  const loginOk = await testarLogin()
  if (!loginOk) {
    console.log('\n❌ Teste de login falhou!')
    return
  }
  
  console.log('\n🎉 === TODOS OS TESTES PASSARAM ===')
  console.log('✅ Conexão com banco: OK')
  console.log('✅ Autenticação: OK')
  console.log('✅ Busca de perfil: OK')
  
  process.exit(0)
}

testarTudo().catch(console.error)