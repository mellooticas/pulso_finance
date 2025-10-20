const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://gsgnkkfazulxqihhyyjp.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdzZ25ra2ZhenVseHFpaGh5eWpwIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNTY2MDY4MCwiZXhwIjoyMDUxMjM2NjgwfQ.qibt-JZQIdGfEJWpKNe5E2qFo_KSkup4qzOtJO9BXZ8'
);

async function investigarContasPagar() {
  console.log('🔍 INVESTIGAÇÃO: Por que não aparecem contas a pagar?\n');
  console.log('='.repeat(70));
  
  // 1. Verificar estrutura de lançamentos
  console.log('\n📋 1. ESTRUTURA DA TABELA LANÇAMENTOS:');
  const { data: sample, error: e1 } = await supabase
    .from('lancamentos')
    .select('*')
    .limit(3);
  
  if (e1) {
    console.error('❌ Erro:', e1.message);
    return;
  }
  
  console.log('Colunas disponíveis:', Object.keys(sample[0]));
  console.log('\nSample de 3 lançamentos:');
  sample.forEach(l => {
    console.log(`  - ID: ${l.id}`);
    console.log(`    Tipo: ${l.tipo}`);
    console.log(`    Valor: ${l.valor}`);
    console.log(`    Competência: ${l.competencia}`);
    console.log(`    Descrição: ${l.descricao}`);
    console.log(`    Status: ${l.status_aprovacao || 'N/A'}`);
    console.log(`    Data Vencimento: ${l.data_vencimento || 'N/A'}`);
    console.log('');
  });
  
  // 2. Contar lançamentos por tipo
  console.log('\n📊 2. LANÇAMENTOS POR TIPO:');
  const { data: tipos } = await supabase
    .from('lancamentos')
    .select('tipo');
  
  const tipoCount = tipos.reduce((acc, l) => {
    acc[l.tipo] = (acc[l.tipo] || 0) + 1;
    return acc;
  }, {});
  
  console.log(JSON.stringify(tipoCount, null, 2));
  
  // 3. Verificar lançamentos em outubro de 2025
  console.log('\n📅 3. LANÇAMENTOS EM OUTUBRO/2025:');
  const { data: outubro, count: countOut } = await supabase
    .from('lancamentos')
    .select('*', { count: 'exact' })
    .gte('competencia', '2025-10-01')
    .lte('competencia', '2025-10-31');
  
  console.log(`Total em outubro/2025: ${countOut} lançamentos`);
  
  if (countOut > 0) {
    const porTipo = outubro.reduce((acc, l) => {
      acc[l.tipo] = (acc[l.tipo] || 0) + 1;
      return acc;
    }, {});
    console.log('Por tipo:', porTipo);
    
    // Mostrar alguns exemplos
    console.log('\nExemplos:');
    outubro.slice(0, 5).forEach(l => {
      console.log(`  ${l.competencia} - ${l.tipo} - R$ ${l.valor} - ${l.descricao}`);
    });
  }
  
  // 4. Verificar range de datas disponíveis
  console.log('\n📆 4. RANGE DE DATAS NO BANCO:');
  const { data: minMax } = await supabase
    .from('lancamentos')
    .select('competencia')
    .order('competencia', { ascending: true })
    .limit(1);
  
  const { data: minMax2 } = await supabase
    .from('lancamentos')
    .select('competencia')
    .order('competencia', { ascending: false })
    .limit(1);
  
  console.log(`Data mais antiga: ${minMax[0]?.competencia || 'N/A'}`);
  console.log(`Data mais recente: ${minMax2[0]?.competencia || 'N/A'}`);
  
  // 5. Verificar se existem parcelas ou tabela de contas a pagar separada
  console.log('\n💰 5. VERIFICANDO PARCELAS:');
  const { data: parcelas, error: e5 } = await supabase
    .from('parcelas')
    .select('*')
    .limit(3);
  
  if (!e5 && parcelas) {
    console.log(`✅ Tabela "parcelas" existe com ${parcelas.length > 0 ? parcelas.length + '+' : '0'} registros`);
    if (parcelas.length > 0) {
      console.log('Estrutura de parcelas:', Object.keys(parcelas[0]));
      console.log('\nSample:');
      parcelas.forEach(p => {
        console.log(`  - Vencimento: ${p.vencimento} | Valor: ${p.valor} | Status: ${p.status}`);
      });
    }
  } else {
    console.log('❌ Tabela "parcelas" não encontrada ou vazia');
  }
  
  // 6. Verificar lançamentos com vencimento em outubro
  console.log('\n🗓️  6. LANÇAMENTOS COM VENCIMENTO EM OUTUBRO/2025:');
  const { data: vencOut, count: countVenc } = await supabase
    .from('lancamentos')
    .select('*', { count: 'exact' })
    .not('data_vencimento', 'is', null)
    .gte('data_vencimento', '2025-10-01')
    .lte('data_vencimento', '2025-10-31');
  
  console.log(`Lançamentos com vencimento em out/2025: ${countVenc || 0}`);
  
  if (vencOut && vencOut.length > 0) {
    console.log('Exemplos:');
    vencOut.slice(0, 5).forEach(l => {
      console.log(`  ${l.data_vencimento} - ${l.tipo} - R$ ${l.valor} - ${l.descricao}`);
    });
  }
  
  // 7. Conclusão e sugestões
  console.log('\n' + '='.repeat(70));
  console.log('\n💡 ANÁLISE:');
  console.log(`
    1. Se lançamentos.tipo só tem 'receita' e 'despesa', não existe 'pagar'/'receber'
    2. Se não há lançamentos em out/2025, sistema pode estar com dados antigos
    3. Possíveis causas:
       - Dados são de períodos anteriores (2024 ou antes)
       - Campo 'competencia' não reflete datas futuras
       - Sistema usa 'data_vencimento' para contas a pagar futuras
       - Parcelas estão em tabela separada
  `);
  
  console.log('\n✅ Investigação completa!\n');
}

investigarContasPagar().catch(err => console.error('Erro:', err));
