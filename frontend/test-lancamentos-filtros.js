// 🧪 Teste para verificar se filtros DRE estão funcionando

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

// Configuração Supabase (carrega do .env.local)
const SUPABASE_URL = env.NEXT_PUBLIC_SUPABASE_URL
const SUPABASE_ANON_KEY = env.NEXT_PUBLIC_SUPABASE_ANON_KEY

if (!SUPABASE_URL || !SUPABASE_ANON_KEY) {
  console.error('❌ ERRO: Variáveis de ambiente não configuradas!')
  console.error('   Verifique se .env.local existe e tem:')
  console.error('   - NEXT_PUBLIC_SUPABASE_URL')
  console.error('   - NEXT_PUBLIC_SUPABASE_ANON_KEY')
  process.exit(1)
}

console.log('🔗 Conectando em:', SUPABASE_URL)

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)

async function testarFiltrosDRE() {
  console.log('🧪 TESTANDO FILTROS DO DRE\n')
  console.log('='.repeat(60))

  // 1. Contar total de lançamentos
  console.log('\n1️⃣ Total de lançamentos no banco:')
  const { data: todosLancamentos, error: errorTotal } = await supabase
    .from('lancamentos')
    .select('id', { count: 'exact', head: true })

  if (errorTotal) {
    console.error('❌ Erro:', errorTotal.message)
  } else {
    console.log(`   ✅ Total: ${todosLancamentos?.length || 0} registros`)
  }

  // 2. Contar lançamentos por tipo
  console.log('\n2️⃣ Lançamentos por tipo:')
  const { data: lancamentosTipo, error: errorTipo } = await supabase
    .from('lancamentos')
    .select('tipo')

  if (errorTipo) {
    console.error('❌ Erro:', errorTipo.message)
  } else {
    const receitas = lancamentosTipo?.filter(l => l.tipo === 'receber').length || 0
    const despesas = lancamentosTipo?.filter(l => l.tipo === 'pagar').length || 0
    console.log(`   ✅ Receitas: ${receitas}`)
    console.log(`   ✅ Despesas: ${despesas}`)
  }

  // 3. Verificar se há dados com período
  console.log('\n3️⃣ Lançamentos com competência em 2024:')
  const { data: lancamentos2024, error: error2024 } = await supabase
    .from('lancamentos')
    .select('id')
    .gte('competencia', '2024-01-01')
    .lte('competencia', '2024-12-31')

  if (error2024) {
    console.error('❌ Erro:', error2024.message)
  } else {
    console.log(`   ✅ Total em 2024: ${lancamentos2024?.length || 0}`)
  }

  // 4. Verificar lojas disponíveis
  console.log('\n4️⃣ Lojas cadastradas:')
  const { data: lojas, error: errorLojas } = await supabase
    .from('lojas')
    .select('id, codigo, nome')
    .order('codigo')

  if (errorLojas) {
    console.error('❌ Erro:', errorLojas.message)
  } else {
    console.log(`   ✅ Total: ${lojas?.length || 0} lojas`)
    lojas?.slice(0, 5).forEach(loja => {
      console.log(`      - ${loja.codigo}: ${loja.nome}`)
    })
    if (lojas && lojas.length > 5) {
      console.log(`      ... e mais ${lojas.length - 5} lojas`)
    }
  }

  // 5. Verificar centros de custo disponíveis
  console.log('\n5️⃣ Centros de Custo cadastrados:')
  const { data: centros, error: errorCentros } = await supabase
    .from('centros_custo')
    .select('id, codigo, nome, ativo')
    .eq('ativo', true)
    .order('codigo')

  if (errorCentros) {
    console.error('❌ Erro:', errorCentros.message)
  } else {
    console.log(`   ✅ Total ativos: ${centros?.length || 0}`)
    centros?.slice(0, 5).forEach(centro => {
      console.log(`      - ${centro.codigo}: ${centro.nome}`)
    })
    if (centros && centros.length > 5) {
      console.log(`      ... e mais ${centros.length - 5} centros`)
    }
  }

  // 6. Testar query DRE completa (simulando hook)
  console.log('\n6️⃣ Testando query DRE (como no hook):')
  
  const primeiraLoja = lojas?.[0]?.id
  const primeiroCentro = centros?.[0]?.id

  if (primeiraLoja || primeiroCentro) {
    let query = supabase
      .from('lancamentos')
      .select(`
        tipo,
        valor_total,
        competencia,
        plano_conta:plano_contas(id, codigo, nome, categoria)
      `)
      .gte('competencia', '2024-01-01')
      .lte('competencia', '2024-12-31')

    if (primeiraLoja) {
      query = query.eq('loja_id', primeiraLoja)
      console.log(`   🔍 Filtro: Loja = ${lojas?.find(l => l.id === primeiraLoja)?.nome}`)
    }

    if (primeiroCentro) {
      query = query.eq('centro_custo_id', primeiroCentro)
      console.log(`   🔍 Filtro: Centro = ${centros?.find(c => c.id === primeiroCentro)?.nome}`)
    }

    const { data: dreData, error: errorDRE } = await query

    if (errorDRE) {
      console.error('   ❌ Erro na query DRE:', errorDRE.message)
    } else {
      console.log(`   ✅ Registros retornados: ${dreData?.length || 0}`)
      
      if (dreData && dreData.length > 0) {
        const receitas = dreData.filter(l => l.tipo === 'receber').reduce((acc, l) => acc + l.valor_total, 0)
        const despesas = dreData.filter(l => l.tipo === 'pagar').reduce((acc, l) => acc + l.valor_total, 0)
        
        console.log(`   💰 Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`   💸 Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`   📊 Resultado: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      }
    }
  } else {
    console.log('   ⚠️  Sem lojas/centros para testar query')
  }

  // 7. Verificar plano de contas
  console.log('\n7️⃣ Plano de Contas:')
  const { data: planoContas, error: errorPlano } = await supabase
    .from('plano_contas')
    .select('id, codigo, nome, categoria')
    .order('codigo')

  if (errorPlano) {
    console.error('❌ Erro:', errorPlano.message)
  } else {
    console.log(`   ✅ Total: ${planoContas?.length || 0} contas`)
    const receitas = planoContas?.filter(c => c.categoria === 'receita').length || 0
    const despesas = planoContas?.filter(c => c.categoria === 'despesa').length || 0
    console.log(`      - Receitas: ${receitas}`)
    console.log(`      - Despesas: ${despesas}`)
  }

  // DIAGNÓSTICO FINAL
  console.log('\n' + '='.repeat(60))
  console.log('📋 DIAGNÓSTICO FINAL:\n')

  if (!todosLancamentos || todosLancamentos.length === 0) {
    console.log('❌ PROBLEMA: Banco de dados VAZIO!')
    console.log('   → Nenhum lançamento encontrado')
    console.log('   → Os filtros não têm dados para filtrar')
    console.log('   → SOLUÇÃO: Importar dados do Yampa')
    console.log('\n   Execute:')
    console.log('   1. python gerar_sql_rapido.py')
    console.log('   2. Execute o SQL gerado no Supabase SQL Editor')
  } else {
    console.log('✅ Banco com dados!')
    console.log(`   → ${todosLancamentos.length} lançamentos encontrados`)
    
    if (lojas && lojas.length > 0) {
      console.log('✅ Filtro de Loja: PODE FUNCIONAR')
    } else {
      console.log('⚠️  Filtro de Loja: SEM LOJAS cadastradas')
    }

    if (centros && centros.length > 0) {
      console.log('✅ Filtro de Centro de Custo: PODE FUNCIONAR')
    } else {
      console.log('⚠️  Filtro de Centro de Custo: SEM CENTROS cadastrados')
    }

    if (lancamentos2024 && lancamentos2024.length > 0) {
      console.log('✅ Filtro de Data: PODE FUNCIONAR')
    } else {
      console.log('⚠️  Filtro de Data: Sem dados em 2024')
    }
  }

  console.log('='.repeat(60))
}

// Executar teste
testarFiltrosDRE()
  .then(() => {
    console.log('\n✅ Teste concluído!')
    process.exit(0)
  })
  .catch(error => {
    console.error('\n❌ Erro no teste:', error)
    process.exit(1)
  })
