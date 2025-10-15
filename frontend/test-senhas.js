// Teste específico com diferentes senhas
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

async function testarSenhasDiferentes() {
  console.log('🔐 === TESTE COM DIFERENTES SENHAS ===\n')
  
  const credenciais = [
    // Tentar diferentes senhas comuns
    { email: 'junior@oticastatymello.com.br', senhas: ['123456', 'admin123', 'pulso123', '123456789', 'junior123'] },
    { email: 'financeiroesc@hotmail.com', senhas: ['123456', 'financeiro123', 'pulso123', '123456789', 'escada123'] },
    { email: 'tgjphotos@gmail.com', senhas: ['123456', 'admin123', 'pulso123', '123456789', 'tgj123'] }
  ]

  for (const cred of credenciais) {
    console.log(`\n🧪 Testando: ${cred.email}`)
    
    for (const senha of cred.senhas) {
      try {
        const { data, error } = await supabase.auth.signInWithPassword({
          email: cred.email,
          password: senha
        })
        
        if (error) {
          console.log(`   ❌ Senha "${senha}": ${error.message}`)
        } else if (data.user) {
          console.log(`   ✅ SUCESSO com senha "${senha}"!`)
          console.log(`      👤 ID: ${data.user.id}`)
          console.log(`      📧 Email: ${data.user.email}`)
          console.log(`      ✅ Confirmado: ${data.user.email_confirmed_at ? 'Sim' : 'Não'}`)
          
          // Fazer logout para próximo teste
          await supabase.auth.signOut()
          return // Para quando encontrar a senha correta
        }
      } catch (err) {
        console.log(`   ❌ Senha "${senha}": Erro de conexão`)
      }
    }
  }
}

// Testar também se é problema de confirmação de email
async function verificarDetalhesAuth() {
  console.log('\n\n📋 === VERIFICAR DETALHES NO AUTH ===')
  console.log('\n💡 Se nenhuma senha funcionou, verifique no Supabase Auth:')
  console.log('1. Dashboard > Authentication > Users')
  console.log('2. Verificar se users existem e estão confirmados')
  console.log('3. Verificar se email_confirmed_at está preenchido')
  console.log('4. Tentar redefinir senha de um usuário')
  console.log('\n🔗 URL: https://supabase.com/dashboard/project/fxsgphqzazcbjcyfqeyg/auth/users')
}

// Executar testes
testarSenhasDiferentes().then(() => verificarDetalhesAuth()).catch(console.error)