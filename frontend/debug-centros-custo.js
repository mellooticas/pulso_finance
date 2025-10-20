// Verificar centros de custo e distribuição

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

async function investigarCentrosCusto() {
  console.log('🔍 Investigando Centros de Custo...\n')
  
  // 1. Verificar TODOS os centros de custo (ativos E inativos)
  const { data: centros, error: errCentros } = await supabase
    .from('centros_custo')
    .select('*')
    .order('codigo')
  
  if (errCentros) {
    console.error('❌ Erro ao buscar centros:', errCentros.message)
    return
  }
  
  console.log(`✅ Total de centros cadastrados: ${centros?.length || 0}`)
  console.log(`   Ativos: ${centros?.filter(c => c.ativo).length || 0}`)
  console.log(`   Inativos: ${centros?.filter(c => !c.ativo).length || 0}\n`)
  
  if (centros && centros.length > 0) {
    console.log('📋 Centros de Custo cadastrados:')
    centros.forEach(centro => {
      console.log(`   ${centro.codigo.padEnd(10)} ${centro.nome.padEnd(40)} [${centro.ativo ? 'ATIVO' : 'inativo'}]`)
    })
  }
  
  // 2. Verificar quantos lançamentos TÊM centro_custo_id
  const { data: comCentro } = await supabase
    .from('lancamentos')
    .select('id')
    .not('centro_custo_id', 'is', null)
  
  const { data: semCentro } = await supabase
    .from('lancamentos')
    .select('id')
    .is('centro_custo_id', null)
  
  console.log(`\n✅ Lançamentos COM centro_custo_id: ${comCentro?.length || 0}`)
  console.log(`⚠️  Lançamentos SEM centro_custo_id (NULL): ${semCentro?.length || 0}`)
  
  // 3. Distribuição por centro de custo
  if (centros && centros.length > 0 && comCentro && comCentro.length > 0) {
    console.log('\n📊 Distribuição de lançamentos por Centro de Custo:')
    
    for (const centro of centros) {
      const { data: lancs } = await supabase
        .from('lancamentos')
        .select('id, tipo, valor_total')
        .eq('centro_custo_id', centro.id)
      
      if (lancs && lancs.length > 0) {
        const receitas = lancs.filter(l => l.tipo === 'receber').reduce((acc, l) => acc + l.valor_total, 0)
        const despesas = lancs.filter(l => l.tipo === 'pagar').reduce((acc, l) => acc + l.valor_total, 0)
        
        console.log(`\n   ${centro.codigo} - ${centro.nome}:`)
        console.log(`      Lançamentos: ${lancs.length}`)
        console.log(`      Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`      Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`      Resultado: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      }
    }
  }
  
  // 4. Testar query DRE COM filtro de centro de custo
  if (centros && centros.length > 0) {
    const primeiroCentro = centros[0]
    
    console.log(`\n🧪 Testando query DRE COM filtro de Centro de Custo:`)
    console.log(`   Filtro: ${primeiroCentro.codigo} - ${primeiroCentro.nome}`)
    
    const { data: dreComFiltro, error } = await supabase
      .from('lancamentos')
      .select(`
        tipo,
        valor_total,
        competencia,
        plano_conta:plano_contas(id, codigo, nome, categoria)
      `)
      .eq('centro_custo_id', primeiroCentro.id)
      .gte('competencia', '2024-01-01')
      .lte('competencia', '2024-12-31')
    
    if (error) {
      console.error('   ❌ Erro:', error.message)
    } else {
      console.log(`   ✅ Retornou ${dreComFiltro?.length || 0} lançamentos em 2024`)
      
      if (dreComFiltro && dreComFiltro.length > 0) {
        const receitas = dreComFiltro.filter(l => l.tipo === 'receber').reduce((acc, l) => acc + l.valor_total, 0)
        const despesas = dreComFiltro.filter(l => l.tipo === 'pagar').reduce((acc, l) => acc + l.valor_total, 0)
        
        console.log(`   💰 Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`   💸 Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`   📊 Resultado: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      }
    }
  }
  
  // CONCLUSÃO
  console.log('\n' + '='.repeat(70))
  console.log('📋 DIAGNÓSTICO FINAL:\n')
  
  if (!centros || centros.length === 0) {
    console.log('❌ PROBLEMA: Sem centros de custo cadastrados!')
    console.log('   → Precisa criar centros de custo para representar lojas/divisões')
  } else if (!comCentro || comCentro.length === 0) {
    console.log('⚠️  PROBLEMA: Centros existem mas lançamentos não têm centro_custo_id!')
    console.log('   → Os 42k lançamentos precisam ser atualizados com centro_custo_id')
    console.log('   → Filtro de Centro de Custo NÃO VAI FUNCIONAR até isso ser corrigido')
  } else {
    console.log('✅ ÓTIMO: Centros de custo existem E lançamentos têm centro_custo_id!')
    console.log(`   → ${centros.length} centros cadastrados`)
    console.log(`   → ${comCentro.length} lançamentos com centro definido`)
    console.log('   → Filtro de Centro de Custo PODE FUNCIONAR!')
    console.log('\n💡 RECOMENDAÇÃO: Use CENTRO DE CUSTO em vez de Loja para filtrar')
    console.log('   Parece que vocês consolidaram tudo na Loja Suzano mas')
    console.log('   mantiveram a separação por Centro de Custo (que representa as lojas reais)')
  }
  
  console.log('='.repeat(70))
}

investigarCentrosCusto().then(() => process.exit(0)).catch(err => { console.error(err); process.exit(1) })
