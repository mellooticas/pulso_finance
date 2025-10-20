// Ver estrutura real da tabela plano_contas

const { createClient } = require('@supabase/supabase-js')
const fs = require('fs')
const path = require('path')

// Ler .env.local manualmente
function loadEnv() {
  try {
    const envPath = path.join(__dirname, '.env.local')
    const envContent = fs.readFileSync(envPath, 'utf8')
    const env = {}
    
    envContent.split('\n').forEach(line => {
      const match = line.match(/^([^#=]+)=(.*)$/)
      if (match) {
        const key = match[1].trim()
        const value = match[2].trim()
        env[key] = value
      }
    })
    
    return env
  } catch (error) {
    console.error('❌ Erro ao ler .env.local:', error.message)
    return {}
  }
}

const env = loadEnv()
const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.NEXT_PUBLIC_SUPABASE_ANON_KEY)

async function verEstrutura() {
  console.log('🔍 Verificando estrutura de plano_contas...\n')
  
  // Pegar apenas 1 registro para ver campos
  const { data, error } = await supabase
    .from('plano_contas')
    .select('*')
    .limit(1)
  
  if (error) {
    console.error('❌ Erro:', error.message)
  } else if (data && data.length > 0) {
    console.log('✅ Campos disponíveis na tabela plano_contas:')
    console.log(JSON.stringify(data[0], null, 2))
    console.log('\n📋 Colunas:', Object.keys(data[0]).join(', '))
  } else {
    console.log('⚠️  Tabela vazia!')
  }
  
  // Ver também os lançamentos
  console.log('\n🔍 Verificando estrutura de lancamentos...\n')
  
  const { data: lanc, error: errLanc } = await supabase
    .from('lancamentos')
    .select('*')
    .limit(1)
  
  if (errLanc) {
    console.error('❌ Erro:', errLanc.message)
  } else if (lanc && lanc.length > 0) {
    console.log('✅ Campos disponíveis na tabela lancamentos:')
    console.log(JSON.stringify(lanc[0], null, 2))
    console.log('\n📋 Colunas:', Object.keys(lanc[0]).join(', '))
  }
}

verEstrutura().then(() => process.exit(0)).catch(err => { console.error(err); process.exit(1) })
