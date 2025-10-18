# 🚀 FRONTEND NEXT.JS 15 - PULSO FINANCE

## 📋 **ESTRUTURA DO PROJETO**

Vamos criar um sistema financeiro completo com:
- ⚡ **Next.js 15** (App Router)
- 🎨 **Tailwind CSS** + **Headless UI**
- 🔐 **Supabase Auth** + **RLS**
- 📊 **Recharts** para gráficos
- 🎣 **React Query** para data fetching

---

## 🛠️ **COMANDOS INICIAIS**

### **1. Criar Projeto Next.js 15**

```bash
# Navegar para pasta do projeto
cd D:/projetos/pulso_finance

# Criar frontend Next.js 15
npx create-next-app@latest frontend --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd frontend

# Instalar dependências do Supabase
npm install @supabase/supabase-js @supabase/auth-ui-react @supabase/auth-ui-shared

# Instalar componentes UI
npm install @headlessui/react @heroicons/react lucide-react clsx

# Instalar gráficos e data
npm install recharts date-fns

# Instalar forms e validação
npm install @hookform/resolvers react-hook-form zod

# Instalar notificações
npm install sonner react-hot-toast

# Instalar state management
npm install @tanstack/react-query zustand

# Instalar utilitários
npm install class-variance-authority tailwind-merge
```

### **2. Configurar Variáveis de Ambiente**

Criar `.env.local`:
```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://[seu-projeto].supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=[sua-anon-key]

# App Configuration
NEXT_PUBLIC_APP_NAME=PULSO Finance
NEXT_PUBLIC_APP_VERSION=1.0.0
```

---

## 📁 **ESTRUTURA DE PASTAS**

```
frontend/
├── public/
│   ├── logo.svg
│   └── favicon.ico
├── src/
│   ├── app/
│   │   ├── (auth)/
│   │   │   ├── login/
│   │   │   │   └── page.tsx
│   │   │   ├── register/
│   │   │   │   └── page.tsx
│   │   │   └── layout.tsx
│   │   ├── (dashboard)/
│   │   │   ├── layout.tsx
│   │   │   ├── page.tsx                 # Dashboard principal
│   │   │   ├── lancamentos/
│   │   │   │   ├── page.tsx
│   │   │   │   ├── novo/page.tsx
│   │   │   │   └── [id]/page.tsx
│   │   │   ├── fluxo-caixa/
│   │   │   │   └── page.tsx
│   │   │   ├── dre/
│   │   │   │   └── page.tsx
│   │   │   ├── conciliacao/
│   │   │   │   └── page.tsx
│   │   │   ├── relatorios/
│   │   │   │   └── page.tsx
│   │   │   └── configuracoes/
│   │   │       ├── page.tsx
│   │   │       ├── usuarios/page.tsx
│   │   │       ├── lojas/page.tsx
│   │   │       └── plano-contas/page.tsx
│   │   ├── api/
│   │   │   └── auth/
│   │   │       └── callback/route.ts
│   │   ├── globals.css
│   │   ├── layout.tsx
│   │   └── loading.tsx
│   ├── components/
│   │   ├── ui/
│   │   │   ├── button.tsx
│   │   │   ├── input.tsx
│   │   │   ├── select.tsx
│   │   │   ├── modal.tsx
│   │   │   ├── table.tsx
│   │   │   ├── card.tsx
│   │   │   └── badge.tsx
│   │   ├── forms/
│   │   │   ├── lancamento-form.tsx
│   │   │   ├── form-field.tsx
│   │   │   └── form-wrapper.tsx
│   │   ├── charts/
│   │   │   ├── dre-chart.tsx
│   │   │   ├── fluxo-chart.tsx
│   │   │   ├── kpi-card.tsx
│   │   │   └── trend-chart.tsx
│   │   ├── layout/
│   │   │   ├── sidebar.tsx
│   │   │   ├── header.tsx
│   │   │   ├── navigation.tsx
│   │   │   └── breadcrumb.tsx
│   │   └── auth/
│   │       ├── auth-form.tsx
│   │       ├── protected-route.tsx
│   │       └── role-guard.tsx
│   ├── lib/
│   │   ├── supabase/
│   │   │   ├── client.ts
│   │   │   ├── server.ts
│   │   │   └── types.ts
│   │   ├── hooks/
│   │   │   ├── use-auth.ts
│   │   │   ├── use-lancamentos.ts
│   │   │   ├── use-lojas.ts
│   │   │   └── use-plano-contas.ts
│   │   ├── utils.ts
│   │   ├── validations.ts
│   │   └── constants.ts
│   ├── contexts/
│   │   ├── auth-context.tsx
│   │   ├── loja-context.tsx
│   │   └── query-provider.tsx
│   └── types/
│       ├── database.ts
│       ├── auth.ts
│       └── components.ts
└── package.json
```

---

## 🎨 **DESIGN SYSTEM**

### **Cores Principais:**
- **Primary:** Blue-600 (financeiro profissional)
- **Secondary:** Slate-500 (neutro)
- **Success:** Green-500 (receitas)
- **Warning:** Orange-500 (alertas)
- **Error:** Red-500 (despesas)

### **Componentes Base:**
- **Cards** com shadow-sm
- **Buttons** com variantes primary/secondary
- **Tables** com hover states
- **Forms** com validação visual
- **Charts** responsivos

---

## 🔐 **AUTENTICAÇÃO**

### **Níveis de Acesso:**
1. **GERENCIAL** - Acesso uma loja específica
2. **FINANCEIRO** - Acesso todas lojas + KPIs operacionais  
3. **ADMIN** - Acesso completo + BI avançado

### **Fluxo Auth:**
1. Login via Supabase Auth
2. Buscar perfil na tabela `usuarios`
3. Validar papel e lojas permitidas
4. Redirect para dashboard apropriado

---

## 📊 **DASHBOARDS POR PERFIL**

### **GERENCIAL (Loja Específica):**
- KPIs básicos da loja
- Vendas do mês
- Contas a pagar/receber
- Fluxo de caixa simples

### **FINANCEIRO (Todas Lojas):**
- Comparativo entre lojas
- DRE consolidado
- Fluxo de caixa detalhado
- Conciliação bancária

### **ADMIN (BI Completo):**
- Analytics avançados
- Trends e projeções
- Relatórios executivos
- Configurações do sistema

---

## 🚀 **PRÓXIMAS AÇÕES**

Agora vou implementar:

1. ✅ **Setup inicial** do Next.js 15
2. 🔧 **Configuração** Supabase client
3. 🎨 **Sistema** de design base
4. 🔐 **Autenticação** completa
5. 📊 **Dashboard** inicial

**Quer que eu comece agora com a implementação?** 🎯