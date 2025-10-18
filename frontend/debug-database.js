const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://fxsgphqzazcbjcyfqeyg.supabase.co', 
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0Njk1NDgsImV4cCI6MjA3NjA0NTU0OH0.G8iU9l5o4myYEPAFD4XB_fjDJYiIwYRXHifsDdwSFK4'
);

async function diagnosticarProblema() {
  console.log('🔍 DIAGNÓSTICO COMPLETO DO BANCO DE DADOS\n');

  try {
    // 1. Verificar autenticação
    console.log('1️⃣ Testando autenticação...');
    const { data: auth, error: authError } = await supabase.auth.getUser();
    console.log('   Usuário autenticado:', auth?.user ? 'SIM' : 'NÃO');
    if (authError) console.log('   Erro auth:', authError.message);

    // 2. Testar acesso direto às tabelas (sem filtros)
    console.log('\n2️⃣ Testando acesso às tabelas...');
    
    const tabelas = ['usuarios', 'lojas', 'plano_contas', 'lancamentos', 'parcelas'];
    
    for (const tabela of tabelas) {
      try {
        const { count, error } = await supabase
          .from(tabela)
          .select('*', { count: 'exact', head: true });
          
        if (error) {
          console.log(`   ❌ ${tabela}: ERRO - ${error.message}`);
        } else {
          console.log(`   ✅ ${tabela}: ${count} registros`);
        }
      } catch (err) {
        console.log(`   ❌ ${tabela}: EXCEÇÃO - ${err.message}`);
      }
    }

    // 3. Testar inserção simples (para verificar RLS)
    console.log('\n3️⃣ Testando inserção (RLS)...');
    
    try {
      // Tentar inserir um registro de teste
      const { data, error } = await supabase
        .from('lojas')
        .insert([{
          codigo: 'TESTE001',
          nome: 'Loja Teste Diagnóstico',
          cidade: 'Cidade Teste',
          endereco: 'Rua Teste, 123',
          telefone: '11999999999',
          ativa: true
        }]);
        
      if (error) {
        console.log(`   ❌ Inserção falhou: ${error.message}`);
      } else {
        console.log('   ✅ Inserção funcionou! RLS permite inserções.');
        
        // Limpar o registro de teste
        await supabase.from('lojas').delete().eq('codigo', 'TESTE001');
      }
    } catch (err) {
      console.log(`   ❌ Erro na inserção: ${err.message}`);
    }

    // 4. Verificar se existem dados "escondidos" pelo RLS
    console.log('\n4️⃣ Verificando dados com diferentes usuários...');
    
    // Fazer login como usuário específico se possível
    try {
      const { data: loginData, error: loginError } = await supabase.auth.signInWithPassword({
        email: 'admin@pulsofinance.com.br',
        password: 'admin123'
      });
      
      if (loginData?.user) {
        console.log('   ✅ Login como admin realizado');
        
        // Testar novamente as consultas
        const { count: lojasComLogin } = await supabase
          .from('lojas')
          .select('*', { count: 'exact', head: true });
          
        console.log(`   📊 Lojas após login: ${lojasComLogin}`);
        
        const { count: lancComLogin } = await supabase
          .from('lancamentos')
          .select('*', { count: 'exact', head: true });
          
        console.log(`   📊 Lançamentos após login: ${lancComLogin}`);
        
      } else {
        console.log('   ❌ Login falhou:', loginError?.message);
      }
    } catch (err) {
      console.log(`   ❌ Erro no login: ${err.message}`);
    }

  } catch (error) {
    console.log('❌ Erro geral no diagnóstico:', error.message);
  }
}

diagnosticarProblema();