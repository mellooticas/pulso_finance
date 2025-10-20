/**
 * 🔍 VALIDAR REDISTRIBUIÇÃO DOS CENTROS DE CUSTO
 * Verifica se os lançamentos foram distribuídos corretamente
 */

const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://fxsgphqzazcbjcyfqeyg.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4';

const supabase = createClient(supabaseUrl, supabaseKey);

async function validarRedistribuicao() {
    console.log('=' .repeat(70));
    console.log('🔍 VALIDANDO REDISTRIBUIÇÃO DE CENTROS DE CUSTO');
    console.log('=' .repeat(70));
    console.log('');

    // 1. Contar lançamentos por centro de custo
    console.log('📊 DISTRIBUIÇÃO POR CENTRO DE CUSTO:');
    console.log('-'.repeat(70));
    
    const { data: distribuicao, error: erroDist } = await supabase
        .from('lancamentos')
        .select('centro_custo_id, centros_custo(codigo, nome)')
        .not('centro_custo_id', 'is', null);

    if (erroDist) {
        console.error('❌ Erro ao buscar distribuição:', erroDist.message);
        return;
    }

    // Agrupar por centro
    const centros = {};
    distribuicao.forEach(lanc => {
        const centro = lanc.centros_custo;
        if (centro) {
            const key = `${centro.codigo} - ${centro.nome}`;
            centros[key] = (centros[key] || 0) + 1;
        }
    });

    // Ordenar por quantidade
    const centrosOrdenados = Object.entries(centros)
        .sort((a, b) => b[1] - a[1]);

    const total = distribuicao.length;
    centrosOrdenados.forEach(([nome, count]) => {
        const percentual = ((count / total) * 100).toFixed(2);
        console.log(`   ${nome.padEnd(40)} ${count.toString().padStart(6)} (${percentual}%)`);
    });

    console.log('-'.repeat(70));
    console.log(`   TOTAL: ${total.toLocaleString('pt-BR')} lançamentos`);
    console.log('');

    // 2. Verificar lançamentos sem centro
    const { count: semCentro, error: erroSem } = await supabase
        .from('lancamentos')
        .select('*', { count: 'exact', head: true })
        .is('centro_custo_id', null);

    if (erroSem) {
        console.error('❌ Erro ao verificar sem centro:', erroSem.message);
        return;
    }

    console.log('⚠️  LANÇAMENTOS SEM CENTRO:');
    console.log('-'.repeat(70));
    if (semCentro === 0) {
        console.log('   ✅ Todos os lançamentos têm centro de custo atribuído!');
    } else {
        console.log(`   ❌ Ainda há ${semCentro} lançamentos sem centro de custo!`);
    }
    console.log('');

    // 3. Testar filtro por centro de custo
    console.log('🧪 TESTANDO FILTROS POR CENTRO DE CUSTO:');
    console.log('-'.repeat(70));

    // Pegar os 3 primeiros centros
    const top3Centros = centrosOrdenados.slice(0, 3);

    for (const [nomeCentro, countEsperado] of top3Centros) {
        const codigo = nomeCentro.split(' - ')[0];
        
        // Buscar ID do centro
        const { data: centroDados } = await supabase
            .from('centros_custo')
            .select('id')
            .eq('codigo', codigo)
            .single();

        if (centroDados) {
            const { count: countFiltrado } = await supabase
                .from('lancamentos')
                .select('*', { count: 'exact', head: true })
                .eq('centro_custo_id', centroDados.id);

            const status = countFiltrado === countEsperado ? '✅' : '❌';
            console.log(`   ${status} ${nomeCentro}: ${countFiltrado} lançamentos (esperado: ${countEsperado})`);
        }
    }
    console.log('');

    // 4. Testar filtro combinado (loja + centro)
    console.log('🔄 TESTANDO FILTROS COMBINADOS (Loja + Centro):');
    console.log('-'.repeat(70));

    // Buscar primeira loja
    const { data: primeiraLoja } = await supabase
        .from('lojas')
        .select('id, codigo, nome')
        .limit(1)
        .single();

    if (primeiraLoja) {
        // Buscar centro da mesma loja
        const { data: centroLoja } = await supabase
            .from('centros_custo')
            .select('id, codigo, nome')
            .eq('loja_id', primeiraLoja.id)
            .limit(1)
            .single();

        if (centroLoja) {
            const { count: lancamentosFiltrados } = await supabase
                .from('lancamentos')
                .select('*', { count: 'exact', head: true })
                .eq('loja_id', primeiraLoja.id)
                .eq('centro_custo_id', centroLoja.id);

            console.log(`   Loja: ${primeiraLoja.codigo} - ${primeiraLoja.nome}`);
            console.log(`   Centro: ${centroLoja.codigo} - ${centroLoja.nome}`);
            console.log(`   ✅ Lançamentos encontrados: ${lancamentosFiltrados}`);
        }
    }
    console.log('');

    // 5. Resumo final
    console.log('=' .repeat(70));
    console.log('🎉 VALIDAÇÃO CONCLUÍDA!');
    console.log('=' .repeat(70));
    console.log('');
    console.log('📋 PRÓXIMOS PASSOS:');
    console.log('   1. Abra o frontend: npm run dev (na pasta frontend)');
    console.log('   2. Acesse a página DRE: http://localhost:3000/dre');
    console.log('   3. Teste os filtros:');
    console.log('      - Período (data início/fim)');
    console.log('      - Loja');
    console.log('      - Centro de Custo');
    console.log('   4. Verifique se os valores mudam ao filtrar!');
    console.log('');
    console.log('🚀 Meta: "Nasdaq level, not Disney!" 💪');
    console.log('');
}

validarRedistribuicao().catch(console.error);
