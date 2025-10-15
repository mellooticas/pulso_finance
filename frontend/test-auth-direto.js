// Teste direto do Auth Supabase
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

async function testarAuth() {
  console.log('🔐 === TESTE DIRETO SUPABASE AUTH ===\n')
  
  const credenciais = [
    { email: 'junior@oticastatymello.com.br', senha: '123456', nome: 'Junior' },
    { email: 'financeiroesc@hotmail.com', senha: '123456', nome: 'Financeiro' },
    { email: 'tgjphotos@gmail.com', senha: '123456', nome: 'Admin' }
  ]

  for (const cred of credenciais) {
    console.log(`\n🧪 Testando: ${cred.nome} (${cred.email})`)
    
    try {
      const { data, error } = await supabase.auth.signInWithPassword({
        email: cred.email,
        password: cred.senha
      })
      
      if (error) {
        console.log(`❌ Falhou: ${error.message}`)
      } else if (data.user) {
        console.log(`✅ Sucesso!`)
        console.log(`   👤 ID: ${data.user.id}`)
        console.log(`   📧 Email: ${data.user.email}`)
        console.log(`   ✅ Confirmado: ${data.user.email_confirmed_at ? 'Sim' : 'Não'}`)
        console.log(`   🕐 Criado: ${data.user.created_at}`)
        
        // Fazer logout para próximo teste
        await supabase.auth.signOut()
      } else {
        console.log(`❌ Sem erro, mas sem usuário retornado`)
      }
    } catch (err) {
      console.log(`❌ Erro de conexão: ${err.message}`)
    }
  }
}

async function testarTabela() {
  console.log('\n\n📊 === TESTE TABELA USUARIOS ===\n')
  
  try {
    const { data, error } = await supabase
      .from('usuarios')
      .select('*')
    
    if (error) {
      console.log(`❌ Erro ao consultar tabela: ${error.message}`)
    } else {
      console.log(`✅ Tabela acessível, encontrados: ${data.length} usuários`)
      
      if (data.length > 0) {
        data.forEach((user, index) => {
          console.log(`\n${index + 1}. ${user.nome}`)
          console.log(`   📧 Email: ${user.email}`)
          console.log(`   🏢 Papel: ${user.papel}`)
          console.log(`   ✅ Ativo: ${user.ativo}`)
          console.log(`   🆔 ID: ${user.id}`)
        })
      }
    }
  } catch (err) {
    console.log(`❌ Erro de conexão: ${err.message}`)
  }
}

// Executar testes
testarAuth().then(() => testarTabela()).catch(console.error)