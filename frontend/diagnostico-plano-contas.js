const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://gsgnkkfazulxqihhyyjp.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdzZ25ra2ZhenVseHFpaGh5eWpwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNTY2MDY4MCwiZXhwIjoyMDUxMjM2NjgwfQ.qibt-JZQIdGfEJWpKNe5E2qFo_KSkup4qzOtJO9BXZ8'
);

async function diagnosticar() {
  console.log('🔍 DIAGNÓSTICO: Tabela plano_contas\n');
  console.log('='.repeat(60));
  
  // 1. Ver estrutura
  const { data: sample, error: e1 } = await supabase
    .from('plano_contas')
    .select('*')
    .limit(5);
  
  if (e1) {
    console.error('❌ Erro ao buscar plano_contas:', e1.message);
    return;
  }
  
  if (!sample || sample.length === 0) {
    console.log('⚠️  Tabela plano_contas está VAZIA!');
    return;
  }
  
  console.log(`\n✅ Encontradas ${sample.length} contas (sample)\n`);
  console.log('📋 Estrutura das colunas:');
  console.log(Object.keys(sample[0]));
  
  console.log('\n📊 Sample de dados:');
  sample.forEach(c => {
    console.log(`   ${c.codigo} - ${c.nome}`);
    console.log(`      Tipo: ${c.tipo} | Categoria: ${c.categoria}`);
  });
  
  // 2. Contar total
  const { count } = await supabase
    .from('plano_contas')
    .select('*', { count: 'exact', head: true });
  
  console.log(`\n📈 Total de contas: ${count}`);
  
  // 3. Ver tipos distintos
  const { data: allData } = await supabase
    .from('plano_contas')
    .select('tipo');
  
  const tiposUnicos = [...new Set(allData.map(t => t.tipo))];
  console.log('\n🏷️  Tipos encontrados:', tiposUnicos);
  
  // 4. Contar por tipo
  console.log('\n📊 Distribuição por tipo:');
  for (const tipo of tiposUnicos) {
    const { count: c } = await supabase
      .from('plano_contas')
      .select('*', { count: 'exact', head: true })
      .eq('tipo', tipo);
    console.log(`   ${tipo}: ${c} contas`);
  }
  
  // 5. Ver lançamentos e seus tipos
  console.log('\n🔗 Verificando lançamentos por tipo:');
  const { data: lancamentosTipos } = await supabase
    .from('lancamentos')
    .select('tipo')
    .limit(1000);
  
  const tiposLancamentos = [...new Set(lancamentosTipos.map(l => l.tipo))];
  console.log('   Tipos nos lançamentos:', tiposLancamentos);
  
  for (const tipo of tiposLancamentos) {
    const { count: c } = await supabase
      .from('lancamentos')
      .select('*', { count: 'exact', head: true })
      .eq('tipo', tipo);
    console.log(`   ${tipo}: ${c} lançamentos`);
  }
  
  console.log('\n' + '='.repeat(60));
  console.log('✅ Diagnóstico completo!\n');
}

diagnosticar().catch(err => console.error('Erro:', err));
