// Teste com credenciais corretas
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

const supabase = createClient(supabaseUrl, supabaseKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
})

async function testarCredenciaisCorretas() {
  console.log('🔐 === TESTE COM CREDENCIAIS CORRETAS ===\n')
  
  const credenciais = [
    { email: 'junior@oticastatymello.com.br', senha: 'Kt12jyh2815t@', nome: 'Junior Admin' },
    { email: 'financeiroesc@hotmail.com', senha: '123456789', nome: 'Financeiro ESC' }
  ]

  for (const cred of credenciais) {
    console.log(`🧪 Testando: ${cred.nome} (${cred.email})`)
    
    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email: cred.email,
        password: cred.senha
      })
      
      if (error) {
        console.log(`❌ Falhou: ${error.message}`)
      } else if (data.user) {
        console.log(`✅ SUCESSO!`)
        console.log(`   👤 ID: ${data.user.id}`)
        console.log(`   📧 Email: ${data.user.email}`)
        console.log(`   ✅ Confirmado: ${data.user.email_confirmed_at ? 'Sim' : 'Não'}`)
        console.log(`   🕐 Criado: ${data.user.created_at}`)
        
        // Buscar perfil do usuário
        const { data: profile, error: profileError } = await supabase
          .from('usuarios')
          .select('*')
          .eq('email', cred.email)
          .single()
        
        if (profileError) {
          console.log(`   ⚠️ Erro ao buscar perfil: ${profileError.message}`)
        } else {
          console.log(`   ✅ Perfil encontrado!`)
          console.log(`   👤 Nome: ${profile.nome}`)
          console.log(`   🏢 Papel: ${profile.papel}`)
          console.log(`   ✅ Ativo: ${profile.ativo}`)
          console.log(`   🏪 Lojas: ${profile.loja_ids?.length || 0} lojas`)
        }
        
        // Fazer logout para próximo teste
        await supabase.auth.signOut()
        console.log(`   🚪 Logout realizado`)
        
      } else {
        console.log(`❌ Sem erro, mas sem usuário retornado`)
      }
    } catch (err) {
      console.log(`❌ Erro de conexão: ${err.message}`)
    }
    
    console.log('') // Linha em branco
  }
}

// Executar teste
testarCredenciaisCorretas().then(() => {
  console.log('🎯 === TESTE COMPLETO ===')
  console.log('✅ Se ambos funcionaram, agora teste no frontend:')
  console.log('🌐 http://localhost:3000')
  console.log('📧 junior@oticastatymello.com.br / Kt12jyh2815t@')
  console.log('📧 financeiroesc@hotmail.com / 123456789')
}).catch(console.error)