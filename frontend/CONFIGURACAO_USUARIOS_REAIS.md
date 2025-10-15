# 🔐 CONFIGURAÇÃO DE USUÁRIOS REAIS - PULSO FINANCE

## 📋 Passo a Passo para Criar Usuários

### Etapa 1: Executar SQL no Supabase
1. Acesse seu projeto no Supabase Dashboard
2. Vá para **SQL Editor**
3. Execute o arquivo `CRIAR_USUARIOS_REAIS.sql`
4. Isso criará os perfis na tabela `usuarios`

### Etapa 2: Criar Contas de Autenticação
1. No Supabase Dashboard, vá para **Authentication > Users**
2. Clique em **"Add user"** para cada usuário:

#### Usuário 1 - Administrador
- **Email**: `junior@oticastatymello.com.br`
- **Password**: `Kt12jyh2815t@`
- **Confirm password**: `Kt12jyh2815t@`
- ✅ **Auto Confirm User** (marcar)

#### Usuário 2 - Financeiro
- **Email**: `financeiroesc@hotmail.com`
- **Password**: `123456789`
- **Confirm password**: `123456789`
- ✅ **Auto Confirm User** (marcar)

#### Usuário 3 - Gerencial
- **Email**: `tgjphotos@gmail.com`
- **Password**: `123456789`
- **Confirm password**: `123456789`
- ✅ **Auto Confirm User** (marcar)

### Etapa 3: Sincronizar IDs (Opcional)
Se necessário, você pode sincronizar os IDs dos usuários:

```sql
-- Ver IDs criados no Auth
SELECT id, email FROM auth.users WHERE email IN (
  'junior@oticastatymello.com.br',
  'financeiroesc@hotmail.com',
  'tgjphotos@gmail.com'
);

-- Atualizar na tabela usuarios se necessário
-- (O sistema tentará fazer isso automaticamente no primeiro login)
```

## ✅ Validação dos Usuários

Após criar, teste cada usuário:

### 1. Teste Administrador
- Acesse http://localhost:3000
- Login: `junior@oticastatymello.com.br`
- Senha: `Kt12jyh2815t@`
- **Esperado**: Acesso total, ver todos os menus

### 2. Teste Financeiro
- Logout e faça novo login
- Login: `financeiroesc@hotmail.com`
- Senha: `123456789`
- **Esperado**: Ver menus de lançamentos, DRE, fluxo de caixa

### 3. Teste Gerencial
- Logout e faça novo login
- Login: `tgjphotos@gmail.com`
- Senha: `123456789`
- **Esperado**: Ver dashboards e relatórios, sem acesso a configurações

## 🎯 Perfis de Acesso

### Admin (junior@oticastatymello.com.br)
- ✅ Dashboard
- ✅ Lançamentos
- ✅ DRE
- ✅ Fluxo de Caixa
- ✅ Análise Financeira
- ✅ Relatórios
- ✅ Lojas
- ✅ Usuários
- ✅ Configurações
- **Lojas**: Todas (7 lojas)

### Financeiro (financeiroesc@hotmail.com)
- ✅ Dashboard
- ✅ Lançamentos
- ✅ DRE
- ✅ Fluxo de Caixa
- ❌ Análise Financeira
- ❌ Relatórios
- ❌ Lojas
- ❌ Usuários
- ❌ Configurações
- **Lojas**: Primeiras 4 lojas

### Gerencial (tgjphotos@gmail.com)
- ✅ Dashboard
- ✅ Lançamentos
- ✅ DRE
- ✅ Fluxo de Caixa
- ✅ Análise Financeira
- ✅ Relatórios
- ❌ Lojas
- ❌ Usuários
- ❌ Configurações
- **Lojas**: Primeiras 2 lojas

## 🚨 Problemas Comuns

### "Usuário não encontrado no sistema"
- Execute o SQL para criar os perfis
- Verifique se o email está correto

### "Email ou senha incorretos"
- Verifique se criou a conta no Auth do Supabase
- Confirme a senha digitada

### "Usuário inativo"
- Verifique se `ativo = true` na tabela usuarios

### Menus não aparecem corretamente
- Verifique o campo `papel` na tabela usuarios
- Valores válidos: 'admin', 'gerencial', 'financeiro'

## 🎉 Próximos Passos

Com os usuários reais configurados, agora você pode:

1. **Testar autenticação real** com emails e senhas corretas
2. **Validar controle de acesso** por perfil
3. **Desenvolver módulos específicos** com dados reais
4. **Implementar dashboard BI** com KPIs dinâmicos

O sistema está pronto para desenvolvimento completo! 🚀