/**
 * 🔍 DEBUG: Testar Filtros DRE
 * Verifica se os filtros estão funcionando corretamente
 */

const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4';

const supabase = createClient(supabaseUrl, supabaseKey);

async function testarFiltrosDRE() {
    console.log('=' .repeat(80));
    console.log('🔍 TESTANDO FILTROS DO DRE');
    console.log('=' .repeat(80));
    console.log('');

    // 1. Buscar primeira loja
    console.log('📋 1. Buscando lojas...');
    const { data: lojas, error: erroLojas } = await supabase
        .from('lojas')
        .select('id, codigo, nome')
        .limit(3);

    if (erroLojas) {
        console.error('❌ Erro:', erroLojas.message);
        return;
    }

    console.log(`   ✅ Encontradas ${lojas.length} lojas:`);
    lojas.forEach(l => console.log(`      - ${l.codigo}: ${l.nome} (${l.id})`));
    console.log('');

    // 2. Buscar centros de custo
    console.log('📋 2. Buscando centros de custo...');
    const { data: centros, error: erroCentros } = await supabase
        .from('centros_custo')
        .select('id, codigo, nome')
        .eq('ativo', true)
        .limit(5);

    if (erroCentros) {
        console.error('❌ Erro:', erroCentros.message);
        return;
    }

    console.log(`   ✅ Encontrados ${centros.length} centros:`);
    centros.forEach(c => console.log(`      - ${c.codigo}: ${c.nome} (${c.id})`));
    console.log('');

    // 3. Testar query SEM FILTROS
    console.log('🧪 3. Testando query SEM FILTROS...');
    const { data: semFiltro, error: erroSemFiltro } = await supabase
        .from('lancamentos')
        .select('tipo, valor_total, competencia, plano_conta:plano_contas(id, codigo, nome, categoria)')
        .limit(5);

    if (erroSemFiltro) {
        console.error('❌ Erro:', erroSemFiltro.message);
        return;
    }

    console.log(`   ✅ Encontrados lançamentos (amostra de 5):`);
    semFiltro.forEach(l => {
        const conta = Array.isArray(l.plano_conta) ? l.plano_conta[0] : l.plano_conta;
        console.log(`      - ${l.competencia} | ${l.tipo} | R$ ${l.valor_total.toFixed(2)} | ${conta?.nome || 'Sem conta'}`);
    });
    console.log('');

    // 4. Testar query COM FILTRO DE LOJA
    if (lojas.length > 0) {
        const primeiraLoja = lojas[0];
        console.log(`🎯 4. Testando filtro por LOJA: ${primeiraLoja.codigo} - ${primeiraLoja.nome}`);
        
        const { data: comLojaData, count: countLoja } = await supabase
            .from('lancamentos')
            .select('*', { count: 'exact', head: false })
            .eq('loja_id', primeiraLoja.id);

        console.log(`   ✅ Lançamentos encontrados: ${countLoja || comLojaData?.length || 0}`);
        console.log('');
    }

    // 5. Testar query COM FILTRO DE CENTRO DE CUSTO
    if (centros.length > 0) {
        const primeiroCentro = centros[0];
        console.log(`🎯 5. Testando filtro por CENTRO DE CUSTO: ${primeiroCentro.codigo} - ${primeiroCentro.nome}`);
        
        const { data: comCentroData, count: countCentro } = await supabase
            .from('lancamentos')
            .select('*', { count: 'exact', head: false })
            .eq('centro_custo_id', primeiroCentro.id);

        console.log(`   ✅ Lançamentos encontrados: ${countCentro || comCentroData?.length || 0}`);
        console.log('');
    }

    // 6. Testar query COM FILTRO COMBINADO
    if (lojas.length > 0 && centros.length > 0) {
        const loja = lojas[0];
        const centro = centros[0];
        console.log(`🎯 6. Testando filtros COMBINADOS:`);
        console.log(`   Loja: ${loja.codigo} - ${loja.nome}`);
        console.log(`   Centro: ${centro.codigo} - ${centro.nome}`);
        
        const { data: combinadoData, count: countCombinado } = await supabase
            .from('lancamentos')
            .select('*', { count: 'exact', head: false })
            .eq('loja_id', loja.id)
            .eq('centro_custo_id', centro.id);

        console.log(`   ✅ Lançamentos encontrados: ${countCombinado || combinadoData?.length || 0}`);
        console.log('');
    }

    // 7. Testar cálculo DRE
    console.log('📊 7. Testando cálculo DRE (sem filtros)...');
    const { data: todosLancamentos } = await supabase
        .from('lancamentos')
        .select('tipo, valor_total')
        .limit(1000);

    if (todosLancamentos) {
        let receitas = 0;
        let despesas = 0;
        
        todosLancamentos.forEach(l => {
            if (l.tipo === 'receber') {
                receitas += l.valor_total;
            } else {
                despesas += l.valor_total;
            }
        });

        console.log(`   📈 Receitas: R$ ${receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`);
        console.log(`   📉 Despesas: R$ ${despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`);
        console.log(`   💰 Resultado: R$ ${(receitas - despesas).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}`);
        console.log('');
    }

    // 8. Resumo
    console.log('=' .repeat(80));
    console.log('✅ TESTE CONCLUÍDO!');
    console.log('=' .repeat(80));
    console.log('');
    console.log('📝 VERIFICAR:');
    console.log('   1. Os filtros retornam valores DIFERENTES?');
    console.log('   2. A query com loja_id funciona?');
    console.log('   3. A query com centro_custo_id funciona?');
    console.log('   4. Os valores de receitas/despesas estão corretos?');
    console.log('');
    console.log('🚀 Se tudo estiver OK, o problema pode estar no React Query cache!');
    console.log('   Solução: Adicionar {refetchOnMount: true} no hook useDRE');
    console.log('');
}

testarFiltrosDRE().catch(console.error);
