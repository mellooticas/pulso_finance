// Debug do problema de redirecionamento
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

// Cliente configurado igual ao frontend
const supabase = createClient(supabaseUrl, supabaseKey, {
  auth: {
    autoRefreshToken: true,
    persistSession: true,
    detectSessionInUrl: false
  }
})

async function debugLoginFlow() {
  console.log('🔍 === DEBUG DO FLUXO DE LOGIN ===\n')
  
  const email = 'junior@oticastatymello.com.br'
  const password = 'Kt12jyh2815t@'
  
  console.log('1. Fazendo login...')
  const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
    email,
    password
  })
  
  if (authError) {
    console.log('❌ Erro no login:', authError.message)
    return
  }
  
  console.log('✅ Login bem-sucedido!')
  console.log('   👤 User ID:', authData.user?.id)
  console.log('   📧 Email:', authData.user?.email)
  console.log('   🔑 Session:', !!authData.session)
  console.log('   🎫 Access Token:', authData.session?.access_token?.substring(0, 20) + '...')
  console.log('   🔄 Refresh Token:', authData.session?.refresh_token?.substring(0, 20) + '...')
  
  console.log('\n2. Verificando sessão atual...')
  const { data: sessionData, error: sessionError } = await supabase.auth.getSession()
  
  if (sessionError) {
    console.log('❌ Erro ao obter sessão:', sessionError.message)
  } else {
    console.log('✅ Sessão obtida:')
    console.log('   🔑 Session exists:', !!sessionData.session)
    console.log('   👤 User ID:', sessionData.session?.user?.id)
    console.log('   📧 Email:', sessionData.session?.user?.email)
  }
  
  console.log('\n3. Buscando perfil do usuário...')
  const { data: profile, error: profileError } = await supabase
    .from('usuarios')
    .select('*')
    .eq('email', email)
    .single()
  
  if (profileError) {
    console.log('❌ Erro ao buscar perfil:', profileError.message)
    console.log('   Código:', profileError.code)
    console.log('   Detalhes:', profileError.details)
  } else {
    console.log('✅ Perfil encontrado:')
    console.log('   👤 Nome:', profile.nome)
    console.log('   🏢 Papel:', profile.papel)
    console.log('   ✅ Ativo:', profile.ativo)
    console.log('   🏪 Lojas:', profile.loja_ids?.length || 0)
  }
  
  console.log('\n4. Testando queries protegidas...')
  const { data: contas, error: contasError } = await supabase
    .from('plano_contas')
    .select('*')
    .limit(5)
  
  if (contasError) {
    console.log('❌ Erro ao buscar contas:', contasError.message)
    console.log('   Isso pode indicar problema de RLS')
  } else {
    console.log('✅ Contas obtidas:', contas?.length || 0)
  }
  
  console.log('\n5. Simulando refresh da sessão...')
  const { data: refreshData, error: refreshError } = await supabase.auth.refreshSession()
  
  if (refreshError) {
    console.log('❌ Erro ao fazer refresh:', refreshError.message)
  } else {
    console.log('✅ Refresh bem-sucedido:')
    console.log('   🔑 Nova sessão:', !!refreshData.session)
    console.log('   👤 User ID:', refreshData.session?.user?.id)
  }
  
  console.log('\n=== DIAGNÓSTICO ===')
  console.log('Se todos os passos funcionaram, o problema pode ser:')
  console.log('1. Cookies não sendo persistidos no browser')
  console.log('2. Middleware não reconhecendo a sessão')
  console.log('3. Timing issue entre login e redirecionamento')
  console.log('4. Conflito entre client-side e server-side auth')
}

// Executar debug
debugLoginFlow().catch(console.error)