# 🚀 PULSO Finance - Plano de Melhorias Frontend

**Data:** 23 de outubro de 2025  
**Versão:** 1.0  
**Objetivo:** Alinhar frontend com Blueprint Técnico v2.0 e implementar melhorias arquiteturais

---

## 📊 ANÁLISE DO ESTADO ATUAL

### ✅ O QUE ESTÁ BOM

1. **TanStack Query implementado** - Hooks usando `useQuery` e `useMutation` corretamente
2. **Estrutura de hooks organizada** - 14 hooks customizados separados por domínio
3. **Dados reais integrados** - 42.863 lançamentos do Yampa funcionando
4. **Dashboard funcional** - KPIs, gráficos e alertas implementados
5. **Filtros dinâmicos** - Sistema de filtros com contexto funcionando
6. **Páginas principais criadas** - DRE, Fluxo de Caixa, Lançamentos, etc.

### ⚠️ GAPS IDENTIFICADOS VS. BLUEPRINT

#### 1. **Arquitetura Next.js (ADR-002)**

**Blueprint diz:** Next.js 15 App Router + Server Components  
**Realidade atual:** 
- ✅ App Router implementado
- ❌ **TODOS os componentes são Client Components** (`'use client'`)
- ❌ Não usa Server Components para fetching de dados
- ❌ Perde SSR e otimizações de hidratação

**Impacto:**
- Performance: Dashboard poderia carregar 2-3x mais rápido com SSR
- SEO: Páginas não são indexáveis (não é crítico para app interno)
- Bundle: Cliente recebe muito mais JavaScript

#### 2. **UI Components (ADR-002)**

**Blueprint diz:** shadcn/ui completo  
**Realidade atual:**
- ✅ Tem alguns componentes: `card`, `button`, `input`, `badge`, `tabs`, `progress`
- ❌ **Faltam 80% dos componentes shadcn/ui**
- ❌ Não tem: `dialog`, `dropdown-menu`, `select`, `table`, `form`, `popover`, `command`, `calendar`, `checkbox`, `radio-group`, `switch`, `toast`, `alert`, `sheet`, `separator`, `label`, `textarea`, `skeleton`, `tooltip`, `scroll-area`, `accordion`

**Impacto:**
- Inconsistência visual
- Código duplicado de modais e formulários
- Falta de acessibilidade (shadcn usa Radix UI)

#### 3. **Supabase Client (ADR-001)**

**Blueprint diz:** `@supabase/ssr` para SSR/SSG  
**Realidade atual:**
```typescript
// frontend/src/lib/supabase.ts
import { createClient } from '@supabase/supabase-js' // ❌ Client-only
```

**Deveria ser:**
```typescript
import { createServerClient } from '@supabase/ssr' // ✅ SSR-ready
```

**Impacto:**
- Não consegue fazer fetch no servidor
- Toda autenticação acontece no cliente (mais lento)

#### 4. **Componentes Específicos Faltando**

**Comparando com Blueprint Seção 5 (Domínios Funcionais):**

| Funcionalidade | Status | Notas |
|---------------|--------|-------|
| Dashboard Executivo | ✅ | Implementado com dados reais |
| Contas a Pagar/Receber | ✅ | Páginas separadas funcionando |
| Fluxo de Caixa | ✅ | Com gráficos |
| DRE Gerencial | ✅ | Com drill-down |
| **Conciliação Bancária** | ❌ | **FALTA IMPLEMENTAR** |
| **Upload de Extratos** | ❌ | **FALTA IMPLEMENTAR** |
| **Contratos Recorrentes** | ❌ | **FALTA IMPLEMENTAR** |
| **Parcelador Inteligente** | ❌ | **FALTA UI** |
| **Upload de Anexos** | ❌ | **FALTA IMPLEMENTAR** |
| Comissões | ❌ | Fase 2 (ok não ter) |
| IA Copiloto | ❌ | Fase 2 (ok não ter) |

#### 5. **Validação de Formulários**

**Blueprint diz:** Zod + react-hook-form  
**Realidade atual:**
- ✅ `react-hook-form` instalado
- ✅ `zod` instalado
- ❌ **Não está sendo usado!** Nenhum hook com validação encontrado

#### 6. **Testes (ADR-006)**

**Blueprint diz:** Vitest + Playwright  
**Realidade atual:**
- ❌ Nenhum teste encontrado
- ❌ Vitest não configurado
- ❌ Playwright não instalado

---

## 🎯 PLANO DE MELHORIAS (PRIORIZADO)

### 🔴 PRIORIDADE CRÍTICA (Fazer AGORA)

#### 1. **Refatorar Supabase Client para SSR**

**Problema:** Cliente atual não suporta Server Components  
**Solução:**

```typescript
// lib/supabase/server.ts (NOVO)
import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function createClient() {
  const cookieStore = cookies()

  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get(name: string) {
          return cookieStore.get(name)?.value
        },
      },
    }
  )
}

// lib/supabase/client.ts (ATUALIZAR)
import { createBrowserClient } from '@supabase/ssr'

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  )
}
```

**Pacotes:**
```bash
npm install @supabase/ssr@latest
```

**Esforço:** 4 horas  
**Impacto:** Alto (performance +50%)

#### 2. **Implementar shadcn/ui Completo**

**Script de setup:**
```bash
npx shadcn@latest init
npx shadcn@latest add dialog dropdown-menu select table form
npx shadcn@latest add calendar checkbox radio-group switch alert
npx shadcn@latest add sheet separator label textarea skeleton
npx shadcn@latest add tooltip scroll-area accordion command
```

**Configurar:**
```typescript
// components.json (criar)
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "new-york",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "app/globals.css",
    "baseColor": "slate",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils"
  }
}
```

**Esforço:** 2 horas  
**Impacto:** Médio-Alto (UX consistency)

#### 3. **Converter Dashboard para Server Components**

**ANTES:**
```tsx
'use client' // ❌
export default function DashboardPage() {
  const { data } = useDashboardDataReal() // Client-side fetch
  return <div>{data?.kpis}</div>
}
```

**DEPOIS:**
```tsx
// ✅ Server Component (remove 'use client')
import { createClient } from '@/lib/supabase/server'

export default async function DashboardPage() {
  const supabase = await createClient()
  
  // Fetch no servidor
  const { data: kpis } = await supabase
    .from('lancamentos')
    .select('*')
    .gte('competencia', '2025-01-01')
  
  return <DashboardClient initialData={kpis} />
}

// components/dashboard-client.tsx
'use client'
export function DashboardClient({ initialData }) {
  const { data } = useDashboardDataReal(initialData) // Usa initial data
  return <div>{data?.kpis}</div>
}
```

**Esforço:** 8 horas (refatorar 5 páginas principais)  
**Impacto:** Alto (performance, SEO)

---

### 🟡 PRIORIDADE ALTA (Sprint atual)

#### 4. **Implementar Módulo de Conciliação**

**Componentes necessários (Blueprint Seção 6):**

```
app/dashboard/conciliacao/
  ├── page.tsx              # Lista extratos não processados
  ├── upload/
  │   └── page.tsx          # Drag & drop de CSV
  ├── pendencias/
  │   └── page.tsx          # Painel de sugestões
  └── historico/
      └── page.tsx          # Conciliações aprovadas

components/conciliacao/
  ├── upload-extrato.tsx    # Componente de upload
  ├── preview-extrato.tsx   # Preview antes de importar
  ├── painel-pendencias.tsx # Side-by-side (extrato vs parcela)
  └── regras-config.tsx     # Configurar regras de match

hooks/
  ├── use-extratos.ts       # CRUD extratos
  ├── use-conciliacoes.ts   # Aprovar/rejeitar
  └── use-parsers.ts        # Parsers BB/Itaú/Santander
```

**Esforço:** 20 horas  
**Impacto:** Crítico (funcionalidade core do blueprint)

#### 5. **Implementar Upload de Anexos**

**Componentes:**

```tsx
// components/upload-anexo.tsx
'use client'
import { useDropzone } from 'react-dropzone'
import { supabase } from '@/lib/supabase/client'

export function UploadAnexo({ lancamentoId, onUpload }) {
  const { getRootProps, getInputProps } = useDropzone({
    accept: { 'application/pdf': ['.pdf'], 'image/*': ['.jpg', '.png'] },
    maxSize: 5 * 1024 * 1024, // 5MB
    onDrop: async (files) => {
      const file = files[0]
      const path = `lancamentos/${lancamentoId}/${file.name}`
      
      const { data, error } = await supabase.storage
        .from('anexos')
        .upload(path, file)
      
      if (!error) onUpload(path)
    }
  })
  
  return (
    <div {...getRootProps()} className="border-2 border-dashed p-4">
      <input {...getInputProps()} />
      <p>Arraste PDF/imagem ou clique para selecionar</p>
    </div>
  )
}
```

**Pacotes:**
```bash
npm install react-dropzone
```

**Esforço:** 4 horas  
**Impacto:** Médio (usabilidade)

#### 6. **Parcelador Inteligente UI**

**Componente:**

```tsx
// components/lancamentos/parcelador-modal.tsx
'use client'
import { Dialog, DialogContent } from '@/components/ui/dialog'
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { z } from 'zod'

const schema = z.object({
  valor_total: z.number().positive(),
  entrada: z.number().min(0),
  num_parcelas: z.number().int().min(1).max(60),
  primeiro_vencimento: z.string(),
  periodicidade: z.enum(['mensal', 'quinzenal', 'semanal'])
})

export function ParceladorModal({ open, onClose, onConfirm }) {
  const { register, handleSubmit, watch } = useForm({
    resolver: zodResolver(schema)
  })
  
  const valores = watch()
  const valorParcela = (valores.valor_total - valores.entrada) / valores.num_parcelas
  
  return (
    <Dialog open={open} onOpenChange={onClose}>
      <DialogContent>
        <h2>Parcelar Lançamento</h2>
        <form onSubmit={handleSubmit(onConfirm)}>
          <Input label="Valor Total" {...register('valor_total')} />
          <Input label="Entrada" {...register('entrada')} />
          <Select label="Parcelas" {...register('num_parcelas')} />
          
          {/* Preview */}
          <div className="mt-4 border p-4">
            <p>Entrada: R$ {valores.entrada}</p>
            <p>{valores.num_parcelas}x de R$ {valorParcela.toFixed(2)}</p>
          </div>
          
          <Button type="submit">Confirmar</Button>
        </form>
      </DialogContent>
    </Dialog>
  )
}
```

**Esforço:** 6 horas  
**Impacto:** Alto (usabilidade core)

---

### 🟢 PRIORIDADE MÉDIA (Próximo sprint)

#### 7. **Implementar Validação Zod em Formulários**

**Exemplo:**

```typescript
// lib/validations/lancamento.ts
import { z } from 'zod'

export const lancamentoSchema = z.object({
  tipo: z.enum(['pagar', 'receber']),
  descricao: z.string().min(3, 'Mínimo 3 caracteres'),
  valor_total: z.number().positive('Valor deve ser positivo'),
  competencia: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  plano_id: z.string().uuid(),
  loja_id: z.string().uuid(),
  num_parcelas: z.number().int().min(1).max(60)
})

// app/dashboard/lancamentos/novo/page.tsx
import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'

export default function NovoLancamento() {
  const form = useForm({
    resolver: zodResolver(lancamentoSchema),
    defaultValues: { tipo: 'pagar', num_parcelas: 1 }
  })
  
  return (
    <Form {...form}>
      <FormField name="descricao" />
      {/* ... */}
    </Form>
  )
}
```

**Esforço:** 8 horas (todos os formulários)  
**Impacto:** Médio (UX, menos erros)

#### 8. **Implementar Testes com Vitest**

**Setup:**

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom jsdom
```

```typescript
// vitest.config.ts
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    setupFiles: ['./vitest.setup.ts']
  }
})

// vitest.setup.ts
import '@testing-library/jest-dom'

// __tests__/hooks/use-lancamentos.test.ts
import { renderHook, waitFor } from '@testing-library/react'
import { useLancamentos } from '@/hooks/use-lancamentos'

describe('useLancamentos', () => {
  it('deve carregar lançamentos', async () => {
    const { result } = renderHook(() => useLancamentos())
    
    await waitFor(() => expect(result.current.isSuccess).toBe(true))
    expect(result.current.data).toHaveLength(42863)
  })
})
```

**Esforço:** 12 horas (setup + 10 testes críticos)  
**Impacto:** Médio-Alto (confiabilidade)

#### 9. **Implementar Contratos Recorrentes**

**Estrutura:**

```
app/dashboard/contratos/
  ├── page.tsx              # Lista de contratos
  ├── novo/
  │   └── page.tsx          # Criar contrato
  └── [id]/
      ├── page.tsx          # Detalhes
      └── reajuste/
          └── page.tsx      # Modal de reajuste

hooks/use-contratos.ts
```

**Funcionalidades (Blueprint Seção 5.5):**
- CRUD completo
- Geração automática mensal (via pg_cron no backend)
- Reajuste com cálculo de índice
- Histórico de reajustes

**Esforço:** 16 horas  
**Impacto:** Médio (automação importante)

---

### 🔵 PRIORIDADE BAIXA (Backlog)

#### 10. **E2E com Playwright**

```bash
npm install -D @playwright/test
npx playwright install
```

```typescript
// e2e/dashboard.spec.ts
import { test, expect } from '@playwright/test'

test('deve exibir KPIs no dashboard', async ({ page }) => {
  await page.goto('/dashboard')
  await expect(page.getByText('Entradas (Receber)')).toBeVisible()
  await expect(page.getByText('R$')).toBeVisible()
})
```

**Esforço:** 8 horas  
**Impacto:** Baixo (nice to have)

---

## 📅 ROADMAP DE IMPLEMENTAÇÃO

### Sprint 1 (Semana 1-2) - Fundação
- [ ] Refatorar Supabase Client para SSR (4h)
- [ ] Instalar shadcn/ui completo (2h)
- [ ] Converter Dashboard para Server Component (8h)
- [ ] **Total: 14 horas**

### Sprint 2 (Semana 3-4) - Features Core
- [ ] Implementar módulo de Conciliação (20h)
- [ ] Upload de anexos (4h)
- [ ] Parcelador inteligente UI (6h)
- [ ] **Total: 30 horas**

### Sprint 3 (Semana 5-6) - Qualidade
- [ ] Validação Zod em formulários (8h)
- [ ] Setup Vitest + testes críticos (12h)
- [ ] Implementar Contratos (16h)
- [ ] **Total: 36 horas**

### Sprint 4 (Semana 7-8) - Polish
- [ ] E2E com Playwright (8h)
- [ ] Performance audit (4h)
- [ ] Documentação (4h)
- [ ] **Total: 16 horas**

**Total estimado: 96 horas (~12 dias úteis de 1 dev)**

---

## 🚦 DECISÕES ARQUITETURAIS

### ADR-001: Migrar para @supabase/ssr

**Status:** Aprovado  
**Razão:** Performance (SSR), alinhamento com Next.js 15  
**Trade-off:** Requer refatoração de todos os hooks (6-8h)

### ADR-002: shadcn/ui como Design System

**Status:** Aprovado  
**Razão:** Acessibilidade, customização, alinhamento com Blueprint  
**Trade-off:** Bundle +50KB (aceitável)

### ADR-003: Server Components para Páginas Principais

**Status:** Aprovado  
**Razão:** Performance crítica (dashboard deve carregar <2s)  
**Trade-off:** Complexidade aumentada (separar Server/Client)

### ADR-004: Validação Client + Server

**Status:** Aprovado  
**Razão:** UX (feedback imediato) + Segurança (validação no backend)  
**Implementação:** Zod schemas compartilhados

---

## 📊 MÉTRICAS DE SUCESSO

| Métrica | Atual | Meta | Como Medir |
|---------|-------|------|------------|
| **Time to Interactive (Dashboard)** | ~3s | <2s | Lighthouse |
| **Bundle Size** | ? | <300KB inicial | webpack-bundle-analyzer |
| **Cobertura de Testes** | 0% | 70% | Vitest coverage |
| **Componentes shadcn/ui** | 6 | 20+ | Manual |
| **Páginas com SSR** | 0 | 5 | Manual |
| **Formulários validados** | 0 | 100% | Manual |

---

## 🎯 PRÓXIMOS PASSOS IMEDIATOS

1. ✅ **Aprovar este plano**
2. 🔴 **Criar branch:** `feature/frontend-refactor-v2`
3. 🔴 **Sprint 1, Tarefa 1:** Refatorar Supabase Client
4. 🔴 **Sprint 1, Tarefa 2:** Instalar shadcn/ui
5. 🔴 **Sprint 1, Tarefa 3:** Converter Dashboard para SC

---

**Autor:** GitHub Copilot  
**Revisão necessária:** Equipe técnica  
**Data próxima revisão:** Após Sprint 1
