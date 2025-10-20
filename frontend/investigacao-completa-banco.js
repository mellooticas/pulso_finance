// 🔍 INVESTIGAÇÃO COMPLETA - Verificar TODAS as informações de lojas e centros

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

async function investigacaoCompleta() {
  console.log('🔍 INVESTIGAÇÃO COMPLETA DO BANCO DE DADOS')
  console.log('='.repeat(70))
  
  // ============================================================
  // 1. LOJAS
  // ============================================================
  console.log('\n📍 1. LOJAS CADASTRADAS:')
  const { data: lojas } = await supabase
    .from('lojas')
    .select('*')
    .order('codigo')
  
  console.log(`   Total: ${lojas?.length || 0} lojas\n`)
  lojas?.forEach(loja => {
    console.log(`   ${loja.codigo.padEnd(5)} | ${loja.nome.padEnd(30)} | Ativa: ${loja.ativa ? 'SIM' : 'não'}`)
    if (loja.cidade) console.log(`        └─ Cidade: ${loja.cidade}`)
  })
  
  // ============================================================
  // 2. CENTROS DE CUSTO
  // ============================================================
  console.log('\n💼 2. CENTROS DE CUSTO CADASTRADOS:')
  const { data: centros } = await supabase
    .from('centros_custo')
    .select('*')
    .order('codigo')
  
  console.log(`   Total: ${centros?.length || 0} centros\n`)
  
  if (centros && centros.length > 0) {
    centros.forEach(centro => {
      console.log(`   ${centro.codigo.padEnd(10)} | ${centro.nome.padEnd(35)} | Ativo: ${centro.ativo ? 'SIM' : 'não'}`)
      if (centro.descricao) console.log(`        └─ ${centro.descricao}`)
      if (centro.loja_id) {
        const loja = lojas?.find(l => l.id === centro.loja_id)
        console.log(`        └─ Loja: ${loja?.nome || centro.loja_id}`)
      }
    })
  } else {
    console.log('   ❌ NENHUM centro de custo cadastrado!')
  }
  
  // ============================================================
  // 3. LANÇAMENTOS - Verificar campos loja_id e centro_custo_id
  // ============================================================
  console.log('\n📊 3. ANÁLISE DOS LANÇAMENTOS:')
  
  const { data: todosLancs } = await supabase
    .from('lancamentos')
    .select('id, loja_id, centro_custo_id, descricao, competencia, valor_total, tipo')
    .limit(10)
  
  console.log(`   Amostra de 10 lançamentos:\n`)
  
  todosLancs?.forEach((lanc, i) => {
    console.log(`   ${i+1}. ${lanc.descricao.substring(0, 50)}`)
    console.log(`      └─ loja_id: ${lanc.loja_id ? lanc.loja_id.substring(0, 8) + '...' : 'NULL'}`)
    console.log(`      └─ centro_custo_id: ${lanc.centro_custo_id ? lanc.centro_custo_id.substring(0, 8) + '...' : 'NULL'}`)
    console.log(`      └─ ${lanc.tipo} | R$ ${lanc.valor_total} | ${lanc.competencia}`)
    console.log('')
  })
  
  // ============================================================
  // 4. ESTATÍSTICAS DE DISTRIBUIÇÃO
  // ============================================================
  console.log('\n📈 4. ESTATÍSTICAS DE DISTRIBUIÇÃO:')
  
  // Total de lançamentos
  const { count: totalLancs } = await supabase
    .from('lancamentos')
    .select('*', { count: 'exact', head: true })
  
  console.log(`   Total de lançamentos: ${totalLancs || 0}`)
  
  // Com loja_id
  const { count: comLoja } = await supabase
    .from('lancamentos')
    .select('*', { count: 'exact', head: true })
    .not('loja_id', 'is', null)
  
  console.log(`   Com loja_id preenchido: ${comLoja || 0} (${((comLoja || 0) / (totalLancs || 1) * 100).toFixed(1)}%)`)
  
  // Com centro_custo_id
  const { count: comCentro } = await supabase
    .from('lancamentos')
    .select('*', { count: 'exact', head: true })
    .not('centro_custo_id', 'is', null)
  
  console.log(`   Com centro_custo_id preenchido: ${comCentro || 0} (${((comCentro || 0) / (totalLancs || 1) * 100).toFixed(1)}%)`)
  
  // ============================================================
  // 5. DISTRIBUIÇÃO POR LOJA
  // ============================================================
  console.log('\n🏪 5. DISTRIBUIÇÃO DE LANÇAMENTOS POR LOJA:')
  
  if (lojas && lojas.length > 0) {
    for (const loja of lojas) {
      const { count: lancsPorLoja } = await supabase
        .from('lancamentos')
        .select('*', { count: 'exact', head: true })
        .eq('loja_id', loja.id)
      
      if (lancsPorLoja && lancsPorLoja > 0) {
        // Pegar valores
        const { data: valores } = await supabase
          .from('lancamentos')
          .select('tipo, valor_total')
          .eq('loja_id', loja.id)
        
        const receitas = valores?.filter(v => v.tipo === 'receber').reduce((acc, v) => acc + v.valor_total, 0) || 0
        const despesas = valores?.filter(v => v.tipo === 'pagar').reduce((acc, v) => acc + v.valor_total, 0) || 0
        
        console.log(`\n   ${loja.codigo} - ${loja.nome}:`)
        console.log(`      Lançamentos: ${lancsPorLoja}`)
        console.log(`      Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`      Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      }
    }
  }
  
  // ============================================================
  // 6. DISTRIBUIÇÃO POR CENTRO DE CUSTO (se houver)
  // ============================================================
  if (centros && centros.length > 0) {
    console.log('\n💼 6. DISTRIBUIÇÃO DE LANÇAMENTOS POR CENTRO DE CUSTO:')
    
    for (const centro of centros) {
      const { count: lancsPorCentro } = await supabase
        .from('lancamentos')
        .select('*', { count: 'exact', head: true })
        .eq('centro_custo_id', centro.id)
      
      if (lancsPorCentro && lancsPorCentro > 0) {
        const { data: valores } = await supabase
          .from('lancamentos')
          .select('tipo, valor_total')
          .eq('centro_custo_id', centro.id)
        
        const receitas = valores?.filter(v => v.tipo === 'receber').reduce((acc, v) => acc + v.valor_total, 0) || 0
        const despesas = valores?.filter(v => v.tipo === 'pagar').reduce((acc, v) => acc + v.valor_total, 0) || 0
        
        console.log(`\n   ${centro.codigo} - ${centro.nome}:`)
        console.log(`      Lançamentos: ${lancsPorCentro}`)
        console.log(`      Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
        console.log(`      Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`)
      }
    }
  }
  
  // ============================================================
  // 7. VERIFICAR SE HÁ INFORMAÇÃO DE LOJA/CENTRO NOS METADADOS
  // ============================================================
  console.log('\n🔬 7. VERIFICANDO METADADOS DOS LANÇAMENTOS:')
  
  const { data: lancMetadata } = await supabase
    .from('lancamentos')
    .select('metadata, descricao')
    .not('metadata', 'is', null)
    .limit(5)
  
  if (lancMetadata && lancMetadata.length > 0) {
    console.log('   Exemplos de metadados encontrados:\n')
    lancMetadata.forEach((lanc, i) => {
      console.log(`   ${i+1}. ${lanc.descricao.substring(0, 40)}`)
      console.log(`      Metadata: ${JSON.stringify(lanc.metadata)}`)
    })
  } else {
    console.log('   ⚠️  Nenhum lançamento com metadata ou todos vazios')
  }
  
  // ============================================================
  // 8. VERIFICAR SE DESCRIÇÃO TEM INFO DE LOJA
  // ============================================================
  console.log('\n📝 8. ANALISANDO DESCRIÇÕES DOS LANÇAMENTOS:')
  console.log('   (procurando padrões que indiquem loja/filial)')
  
  const { data: lancDescricoes } = await supabase
    .from('lancamentos')
    .select('descricao')
    .limit(100)
  
  const padroes = {
    'LOJA': 0,
    'FILIAL': 0,
    'CENTRO': 0,
    'UNIDADE': 0,
    'SUZANO': 0,
    'MAUA': 0,
    'PERUS': 0,
    'RIO': 0,
    'SAO MATEUS': 0
  }
  
  lancDescricoes?.forEach(lanc => {
    const desc = lanc.descricao.toUpperCase()
    Object.keys(padroes).forEach(padrao => {
      if (desc.includes(padrao)) padroes[padrao]++
    })
  })
  
  console.log('   Padrões encontrados em 100 descrições:\n')
  Object.entries(padroes).forEach(([padrao, count]) => {
    if (count > 0) {
      console.log(`      "${padrao}": ${count} ocorrências`)
    }
  })
  
  // ============================================================
  // CONCLUSÃO FINAL
  // ============================================================
  console.log('\n' + '='.repeat(70))
  console.log('🎯 CONCLUSÃO FINAL:\n')
  
  if ((lojas?.length || 0) > 0 && (comLoja || 0) > 0) {
    console.log('✅ LOJAS: Cadastradas e sendo usadas nos lançamentos')
    console.log(`   ${lojas?.length} lojas cadastradas`)
    console.log(`   ${comLoja} lançamentos com loja_id (${((comLoja || 0) / (totalLancs || 1) * 100).toFixed(1)}%)`)
  } else {
    console.log('❌ LOJAS: Problema detectado')
  }
  
  if ((centros?.length || 0) > 0 && (comCentro || 0) > 0) {
    console.log('\n✅ CENTROS DE CUSTO: Cadastrados e sendo usados nos lançamentos')
    console.log(`   ${centros?.length} centros cadastrados`)
    console.log(`   ${comCentro} lançamentos com centro_custo_id (${((comCentro || 0) / (totalLancs || 1) * 100).toFixed(1)}%)`)
  } else if ((centros?.length || 0) > 0) {
    console.log('\n⚠️  CENTROS DE CUSTO: Cadastrados MAS não usados nos lançamentos')
    console.log(`   ${centros?.length} centros existem mas centro_custo_id está NULL em todos`)
  } else {
    console.log('\n❌ CENTROS DE CUSTO: Não cadastrados')
  }
  
  console.log('\n💡 RECOMENDAÇÃO:')
  if ((centros?.length || 0) === 0 && (lojas?.length || 0) > 1) {
    console.log('   Usar filtro de LOJA (já funciona, dados existem)')
  } else if ((comCentro || 0) > 0) {
    console.log('   Usar filtro de CENTRO DE CUSTO (dados existem)')
  } else {
    console.log('   Criar centros de custo OU redistribuir lançamentos entre lojas')
  }
  
  console.log('='.repeat(70))
}

investigacaoCompleta()
  .then(() => process.exit(0))
  .catch(err => { 
    console.error('\n❌ Erro na investigação:', err.message)
    process.exit(1) 
  })
