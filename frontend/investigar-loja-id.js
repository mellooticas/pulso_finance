// Verificar por que filtro por loja retorna 0

const { createClient } = require('@supabase/supabase-js')
const fs = require('fs')
const path = require('path')

function loadEnv() {
  try {
    const envPath = path.join(__dirname, '.env.local')
    const envContent = fs.readFileSync(envPath, 'utf8')
    const env = {}
    envContent.split('\n').forEach(line => {
      const match = line.match(/^([^#=]+)=(.*)$/)
      if (match) {
        env[match[1].trim()] = match[2].trim()
      }
    })
    return env
  } catch (error) {
    return {}
  }
}

const env = loadEnv()
const supabase = createClient(env.NEXT_PUBLIC_SUPABASE_URL, env.NEXT_PUBLIC_SUPABASE_ANON_KEY)

async function investigar() {
  console.log('🔍 Investigando por que filtro de loja retorna 0...\n')
  
  // 1. Verificar quantos lançamentos TÊM loja_id
  const { data: comLoja } = await supabase
    .from('lancamentos')
    .select('id')
    .not('loja_id', 'is', null)
  
  const { data: semLoja } = await supabase
    .from('lancamentos')
    .select('id')
    .is('loja_id', null)
  
  console.log(`✅ Lançamentos COM loja_id: ${comLoja?.length || 0}`)
  console.log(`⚠️  Lançamentos SEM loja_id (NULL): ${semLoja?.length || 0}`)
  
  // 2. Ver um lançamento de exemplo
  const { data: exemplo } = await supabase
    .from('lancamentos')
    .select('*')
    .limit(5)
  
  console.log('\n📄 Exemplo de 5 lançamentos:')
  exemplo?.forEach((lanc, i) => {
    console.log(`\n${i+1}. ${lanc.descricao}`)
    console.log(`   loja_id: ${lanc.loja_id || 'NULL'}`)
    console.log(`   competencia: ${lanc.competencia}`)
    console.log(`   valor: R$ ${lanc.valor_total}`)
    console.log(`   tipo: ${lanc.tipo}`)
  })
  
  // 3. Contar lançamentos por loja
  console.log('\n📊 Distribuição de lançamentos por loja:')
  const { data: lojas } = await supabase.from('lojas').select('*')
  
  for (const loja of lojas || []) {
    const { data: lancs } = await supabase
      .from('lancamentos')
      .select('id')
      .eq('loja_id', loja.id)
    
    console.log(`   ${loja.codigo} (${loja.nome}): ${lancs?.length || 0} lançamentos`)
  }
  
  // 4. Verificar se query DRE funcionaria SEM filtro de loja
  console.log('\n🧪 Testando query DRE SEM filtro de loja:')
  const { data: dreSemFiltro, error } = await supabase
    .from('lancamentos')
    .select(`
      tipo,
      valor_total,
      competencia,
      plano_conta:plano_contas(id, codigo, nome, categoria)
    `)
    .gte('competencia', '2024-01-01')
    .lte('competencia', '2024-12-31')
  
  if (error) {
    console.error('❌ Erro:', error.message)
  } else {
    console.log(`✅ Retornou ${dreSemFiltro?.length || 0} lançamentos em 2024`)
    
    if (dreSemFiltro && dreSemFiltro.length > 0) {
      const receitas = dreSemFiltro.filter(l => l.tipo === 'receber').reduce((acc, l) => acc + l.valor_total, 0)
      const despesas = dreSemFiltro.filter(l => l.tipo === 'pagar').reduce((acc, l) => acc + l.valor_total, 0)
      
      console.log(`   💰 Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`   💸 Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      console.log(`   📊 Resultado: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
    }
  }
}

investigar().then(() => process.exit(0)).catch(err => { console.error(err); process.exit(1) })
