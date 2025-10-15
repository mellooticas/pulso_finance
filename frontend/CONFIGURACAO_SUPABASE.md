# CONFIGURAÇÃO DO SUPABASE

Para configurar sua aplicação, você precisa:

1. Acessar seu projeto no Supabase (https://supabase.com)
2. Ir para Settings > API
3. Copiar os valores:
   - Project URL: sua URL do projeto
   - Anon public: sua chave pública

4. Editar o arquivo `.env.local` substituindo:
   - NEXT_PUBLIC_SUPABASE_URL=sua-url-aqui
   - NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-aqui

## Exemplo de configuração:

```
NEXT_PUBLIC_SUPABASE_URL=https://xyzabc123.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

## Testando a configuração:

1. Após configurar as credenciais, reinicie o servidor: `npm run dev`
2. Acesse http://localhost:3000
3. A aplicação deve redirecionar para /login
4. Use as credenciais dos usuários criados no banco de dados

## Usuários de teste disponíveis:

- admin@pulsofinance.com (senha: admin123)
- gerente@pulsofinance.com (senha: gerente123)
- financeiro@pulsofinance.com (senha: financeiro123)

## Funcionalidades implementadas:

✅ Estrutura completa do Next.js 15 com TypeScript
✅ Sistema de autenticação com Supabase
✅ Layout do dashboard com sidebar responsiva
✅ Página principal do dashboard com KPIs
✅ Sistema de rotas protegidas
✅ Controle de acesso baseado em perfis (admin/gerencial/financeiro)
✅ Componentes UI padronizados (Card, Button, Input)
✅ Middleware para proteção de rotas
✅ Context para gerenciamento de estado de autenticação

## Próximos passos:

1. Configurar credenciais do Supabase
2. Testar login e navegação
3. Implementar módulos específicos:
   - Lançamentos financeiros
   - DRE (Demonstração do Resultado do Exercício)
   - Fluxo de caixa
   - Relatórios e gráficos
   - Gestão de usuários e lojas