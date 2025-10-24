# 🚀 PULSO Finance - Plano Executivo Disruptivo v3.0

**Arquiteto:** GitHub Copilot (Senior Full-Stack + FinTech Expert)  
**Data:** 23 de outubro de 2025  
**Visão:** Sistema financeiro de classe mundial para óticas - Nasdaq Level, not Disney

---

## 🎯 VISÃO ESTRATÉGICA

### O Que Vamos Construir

**Não é mais um sistema financeiro genérico.** É uma **plataforma inteligente especializada** que:

1. **Aprende** com o comportamento financeiro da rede de óticas
2. **Prevê** problemas de caixa antes de acontecerem
3. **Recomenda** ações específicas e quantificadas
4. **Automatiza** 90% das tarefas repetitivas
5. **Conecta** com todo o ecossistema (bancos, adquirentes, fornecedores)

### Diferenciais Disruptivos

| Feature | Concorrentes | PULSO Finance v3.0 |
|---------|-------------|-------------------|
| **Conciliação** | Manual ou 40% automática | 85%+ com ML adaptive |
| **BI** | Dashboards estáticos | Copiloto IA + insights proativos |
| **Performance** | 3-5s carregar | <1s com ISR + Edge caching |
| **UX** | Desktop-first | Mobile-first + PWA offline |
| **Integrações** | CSV import | Open Banking + webhooks real-time |
| **Previsões** | Média simples | Prophet + DeepAR (AWS) |
| **Auditoria** | Logs básicos | Blockchain-ready audit trail |

---

## 🏗️ ARQUITETURA DISRUPTIVA

### Stack Tecnológico v3.0

```typescript
// FRONTEND - Híper-Performance
Next.js 15              // React Server Components + Streaming
Tailwind CSS v4         // Zero-runtime CSS
shadcn/ui v2            // Radix UI + CVA (accessibility champion)
TanStack Query v5       // Server state com suspense
Zustand v5              // Client state (minimal)
Framer Motion          // Animações fluidas
React Hook Form + Zod   // Validação type-safe
Vercel AI SDK           // LLM integration

// BACKEND - Escalável e Seguro
Supabase                // Postgres + RLS + Auth + Storage
Edge Functions (Deno)   // Serverless compute
pg_cron                 // Jobs automatizados
PostgREST               // API auto-gerada
pg_search               // Full-text search (português)
TimescaleDB extension   // Time-series (métricas)

// IA & ML
OpenAI GPT-4o          // Copiloto financeiro
Anthropic Claude 3.5    // Análise complexa
Vercel AI SDK           // Streaming responses
LangChain              // RAG para docs financeiros
AutoML Tables          // Conciliação ML

// OBSERVABILIDADE
Sentry                  // Error tracking
Vercel Analytics        // Web vitals
PostHog                 // Product analytics
Axiom                   // Structured logging
```

### Arquitetura de Dados Avançada

```sql
-- 🆕 NOVOS RECURSOS DE PERFORMANCE

-- 1. Particionamento de tabelas grandes
CREATE TABLE lancamentos (
  ...
) PARTITION BY RANGE (competencia);

CREATE TABLE lancamentos_2024 PARTITION OF lancamentos
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
  
CREATE TABLE lancamentos_2025 PARTITION OF lancamentos
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 2. Índices BRIN para séries temporais (70% menor que B-tree)
CREATE INDEX idx_lancamentos_competencia_brin 
  ON lancamentos USING BRIN (competencia);

-- 3. Full-text search otimizado (português)
CREATE EXTENSION IF NOT EXISTS unaccent;

ALTER TABLE lancamentos ADD COLUMN search_vector tsvector
  GENERATED ALWAYS AS (
    to_tsvector('portuguese', unaccent(COALESCE(descricao,'') || ' ' || COALESCE(observacoes,'')))
  ) STORED;

CREATE INDEX idx_lancamentos_fts ON lancamentos USING GIN (search_vector);

-- 4. Materialized views com refresh automático
CREATE MATERIALIZED VIEW mv_dashboard_kpis AS
SELECT 
  loja_id,
  DATE_TRUNC('month', competencia) AS mes,
  COUNT(*) FILTER (WHERE tipo='receber') AS qtd_receber,
  COUNT(*) FILTER (WHERE tipo='pagar') AS qtd_pagar,
  SUM(valor_total) FILTER (WHERE tipo='receber') AS total_receber,
  SUM(valor_total) FILTER (WHERE tipo='pagar') AS total_pagar,
  AVG(valor_total) AS ticket_medio
FROM lancamentos
GROUP BY 1, 2;

CREATE UNIQUE INDEX ON mv_dashboard_kpis (loja_id, mes);

-- Refresh automático via trigger
CREATE OR REPLACE FUNCTION refresh_dashboard_kpis()
RETURNS TRIGGER AS $$
BEGIN
  REFRESH MATERIALIZED VIEW CONCURRENTLY mv_dashboard_kpis;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_refresh_kpis
  AFTER INSERT OR UPDATE OR DELETE ON lancamentos
  FOR EACH STATEMENT
  EXECUTE FUNCTION refresh_dashboard_kpis();

-- 5. Cache adaptativo (Redis-like no Postgres)
CREATE UNLOGGED TABLE cache_queries (
  key TEXT PRIMARY KEY,
  value JSONB NOT NULL,
  expires_at TIMESTAMPTZ NOT NULL,
  hits INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_cache_expires ON cache_queries (expires_at) 
  WHERE expires_at > NOW();
```

---

## 🎨 DESIGN SYSTEM DISRUPTIVO

### Princípios de UX

1. **Velocidade Perceptível**: Skeleton loaders + optimistic updates
2. **Zero Cliques Desnecessários**: Command palette (⌘K) para tudo
3. **Mobile-First**: 70% dos gestores usam celular
4. **Dark Mode Native**: Não é afterthought
5. **Acessibilidade AA**: Radix UI garante

### Componentes Inovadores

```typescript
// 1. Command Palette (estilo Linear/Vercel)
// Acesso: Cmd+K ou Ctrl+K
<CommandPalette
  actions={[
    { icon: Plus, label: 'Novo lançamento', action: '/lancamentos/novo', shortcut: 'N' },
    { icon: Upload, label: 'Importar extrato', action: '/conciliacao/upload', shortcut: 'U' },
    { icon: Search, label: 'Buscar...', action: 'search' },
    { icon: Settings, label: 'Configurações', action: '/config' },
  ]}
  recentPages={recentPages}
  aiSuggest={true} // 🆕 IA sugere próxima ação
/>

// 2. Smart Tables com Virtual Scrolling
<DataTable
  data={lancamentos}
  columns={columns}
  virtualScroll={true}  // Renderiza apenas linhas visíveis
  rowHeight={52}
  height="calc(100vh - 200px)"
  onRowClick={(row) => router.push(`/lancamentos/${row.id}`)}
  bulkActions={[
    { label: 'Baixar em lote', icon: CheckCircle },
    { label: 'Exportar selecionados', icon: Download },
  ]}
  globalFilter={{
    placeholder: 'Buscar em 42k lançamentos...',
    debounce: 300,
    serverSide: true  // Busca no Postgres
  }}
/>

// 3. Filtros Avançados (estilo Notion)
<FilterBuilder
  schema={lancamentoSchema}
  value={filters}
  onChange={setFilters}
  operators={['eq', 'ne', 'gt', 'lt', 'contains', 'in', 'between']}
  presets={[
    { name: 'Vencidos', filters: { status: 'vencido' } },
    { name: 'Hoje', filters: { vencimento: today } },
    { name: 'Esta semana', filters: { vencimento: { between: [startOfWeek, endOfWeek] } } },
  ]}
  saveCustom={true}  // Usuário salva filtros favoritos
/>

// 4. Charts Interativos com Drill-down
<FinancialChart
  type="area"
  data={fluxoCaixa}
  onPointClick={(point) => {
    // Drill-down: clica no dia → vê lançamentos
    setFilters({ date: point.x })
    router.push('/lancamentos')
  }}
  annotations={[
    { x: '2025-10-15', label: 'Aluguel', color: 'red' },
    { x: '2025-10-25', label: 'Recebimento grande', color: 'green' },
  ]}
  forecast={true}  // 🆕 Mostra previsão
/>

// 5. Parcelador Inteligente
<ParceladorModal
  valorTotal={5000}
  onConfirm={(parcelas) => createLancamento(parcelas)}
  presets={{
    '3x': { entrada: 1000, parcelas: 3 },
    '6x': { entrada: 500, parcelas: 6 },
    '12x': { entrada: 0, parcelas: 12 },
  }}
  juros={{
    tipo: 'simples',
    taxa: 0.02  // 2% a.m.
  }}
  calendario={{
    feriados: feriados2025,
    diasUteis: true  // Ajusta vencimento para dia útil
  }}
  preview={
    <div>
      <p>Entrada: R$ 1.000,00 (20/10/2025)</p>
      <p>4x R$ 1.000,00 (venc: 20 de cada mês)</p>
      <p>Total com juros: R$ 5.120,00</p>
    </div>
  }
/>
```

---

## 🤖 IA & BI DE PRÓXIMA GERAÇÃO

### 1. Copiloto Financeiro

```typescript
// components/copilot/financial-assistant.tsx
'use client'

import { useChat } from 'ai/react' // Vercel AI SDK
import { useFinancialContext } from '@/hooks/use-financial-context'

export function FinancialAssistant() {
  const { lojaAtual, periodo } = useFinancialContext()
  
  const { messages, input, handleInputChange, handleSubmit, isLoading } = useChat({
    api: '/api/copilot/chat',
    initialMessages: [
      {
        role: 'assistant',
        content: `Olá! Sou o assistente financeiro do PULSO. Como posso ajudar com as finanças da ${lojaAtual.nome}?`
      }
    ],
    body: {
      context: {
        loja_id: lojaAtual.id,
        periodo: periodo,
        user_role: user.papel
      }
    }
  })

  return (
    <aside className="w-96 border-l bg-muted/30 flex flex-col">
      <div className="p-4 border-b">
        <h2 className="font-semibold flex items-center gap-2">
          <Sparkles className="h-5 w-5 text-primary" />
          Copiloto Financeiro
        </h2>
      </div>

      <ScrollArea className="flex-1 p-4">
        {messages.map((msg) => (
          <ChatMessage key={msg.id} message={msg} />
        ))}
        {isLoading && <TypingIndicator />}
      </ScrollArea>

      <form onSubmit={handleSubmit} className="p-4 border-t">
        <div className="flex gap-2">
          <Input
            value={input}
            onChange={handleInputChange}
            placeholder="Pergunte sobre finanças, análises, previsões..."
            className="flex-1"
          />
          <Button type="submit" size="icon">
            <Send className="h-4 w-4" />
          </Button>
        </div>
        
        {/* Quick actions */}
        <div className="flex gap-2 mt-2 flex-wrap">
          <QuickAction onClick={() => handleInputChange({ target: { value: 'Qual meu caixa projetado para os próximos 30 dias?' } })}>
            💰 Previsão de caixa
          </QuickAction>
          <QuickAction onClick={() => handleInputChange({ target: { value: 'Analise as despesas do mês' } })}>
            📊 Analisar despesas
          </QuickAction>
          <QuickAction onClick={() => handleInputChange({ target: { value: 'Quais contas vencem essa semana?' } })}>
            📅 Vencimentos
          </QuickAction>
        </div>
      </form>
    </aside>
  )
}
```

**Capacidades do Copiloto:**

1. **Query Natural → SQL**
   - "Mostre despesas com marketing no último trimestre"
   - "Qual loja teve maior lucro em setembro?"
   - "Liste fornecedores com pagamentos atrasados"

2. **Análises Contextuais**
   - Explica variações (ex: "Energia elétrica aumentou 35% porque...")
   - Compara períodos ("Set/25 vs Set/24: receita +12%, despesas +8%")
   - Identifica outliers ("Despesa X está 2.5σ acima da média")

3. **Recomendações Acionáveis**
   - "Antecipe R$ 5k de recebíveis para cobrir aluguel (taxa 2.5%)"
   - "Negocie com Fornecedor Y - 3 pagamentos atrasados"
   - "Transfira R$ 10k da conta A para B (rendimento +0.8%)"

4. **Geração de Relatórios**
   - "Crie relatório executivo do mês para o franqueador"
   - "Exporte DRE comparativo (últimos 6 meses)"
   - "Gere planilha de inadimplência por loja"

### 2. Motor de Previsão Avançado

```python
# supabase/functions/forecast-engine/prophet_model.py

from prophet import Prophet
import pandas as pd
import numpy as np

class CashFlowForecaster:
    """
    Previsão de fluxo de caixa com sazonalidade múltipla:
    - Semanal (dias úteis vs fim de semana)
    - Mensal (dias específicos: aluguel, folha, fornecedores)
    - Anual (campanhas: Dia das Mães, Black Friday, Natal)
    """
    
    def __init__(self, historical_data: pd.DataFrame):
        self.df = historical_data
        self.model = Prophet(
            yearly_seasonality=True,
            weekly_seasonality=True,
            daily_seasonality=False,
            changepoint_prior_scale=0.05  # Detecta mudanças de padrão
        )
        
        # Adiciona sazonalidades customizadas
        self.model.add_seasonality(
            name='monthly',
            period=30.5,
            fourier_order=5
        )
        
        # Feriados brasileiros
        self.model.add_country_holidays(country_name='BR')
        
        # Eventos customizados (campanhas)
        eventos = pd.DataFrame({
            'holiday': 'black_friday',
            'ds': pd.to_datetime(['2024-11-29', '2025-11-28']),
            'lower_window': 0,
            'upper_window': 1,
        })
        self.model = self.model.add_regressor('black_friday')
    
    def train(self):
        """Treina modelo com dados históricos"""
        self.model.fit(self.df)
    
    def forecast(self, days: int = 30) -> pd.DataFrame:
        """
        Gera previsão para próximos N dias
        
        Returns:
            DataFrame com colunas:
            - ds: data
            - yhat: previsão
            - yhat_lower: limite inferior (95% conf)
            - yhat_upper: limite superior
        """
        future = self.model.make_future_dataframe(periods=days)
        forecast = self.model.predict(future)
        
        return forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail(days)
    
    def explain_forecast(self, date: str) -> dict:
        """
        Explica componentes da previsão
        
        Returns:
            {
                'trend': valor,
                'seasonal': {
                    'yearly': valor,
                    'weekly': valor,
                    'monthly': valor
                },
                'holidays': valor
            }
        """
        components = self.model.predict_components(pd.DataFrame({'ds': [date]}))
        return {
            'trend': components['trend'].values[0],
            'seasonal': {
                'yearly': components['yearly'].values[0],
                'weekly': components['weekly'].values[0],
                'monthly': components['monthly'].values[0]
            },
            'holidays': components.get('holidays', pd.Series([0])).values[0]
        }
```

### 3. Detecção de Anomalias em Tempo Real

```typescript
// lib/ml/anomaly-detection.ts

import { IsolationForest } from 'isolation-forest'

interface Transaction {
  id: string
  valor: number
  categoria: string
  loja_id: string
  timestamp: Date
}

export class AnomalyDetector {
  private model: IsolationForest
  
  constructor() {
    this.model = new IsolationForest({
      contamination: 0.05,  // 5% esperado de anomalias
      nEstimators: 100,
      maxSamples: 256
    })
  }
  
  async train(transactions: Transaction[]) {
    const features = transactions.map(t => [
      t.valor,
      this.getHourOfDay(t.timestamp),
      this.getDayOfWeek(t.timestamp),
      this.getCategoryCode(t.categoria),
      this.getLojaCode(t.loja_id)
    ])
    
    await this.model.fit(features)
  }
  
  async detectAnomaly(transaction: Transaction): Promise<{
    isAnomaly: boolean
    score: number
    reason: string
  }> {
    const features = [
      transaction.valor,
      this.getHourOfDay(transaction.timestamp),
      this.getDayOfWeek(transaction.timestamp),
      this.getCategoryCode(transaction.categoria),
      this.getLojaCode(transaction.loja_id)
    ]
    
    const score = await this.model.predict([features])
    const isAnomaly = score < 0
    
    if (isAnomaly) {
      // Explica o motivo
      const avgValor = await this.getAvgValor(transaction.categoria, transaction.loja_id)
      const deviation = Math.abs((transaction.valor - avgValor) / avgValor * 100)
      
      return {
        isAnomaly: true,
        score: score,
        reason: `Valor ${deviation.toFixed(0)}% acima da média para ${transaction.categoria}`
      }
    }
    
    return { isAnomaly: false, score, reason: '' }
  }
  
  private getHourOfDay(date: Date): number {
    return date.getHours()
  }
  
  private getDayOfWeek(date: Date): number {
    return date.getDay()
  }
  
  private getCategoryCode(categoria: string): number {
    // Hash categoria para número
    return categoria.split('').reduce((acc, char) => acc + char.charCodeAt(0), 0)
  }
  
  private getLojaCode(lojaId: string): number {
    // Converte UUID para número
    return parseInt(lojaId.replace(/-/g, '').substring(0, 8), 16)
  }
  
  private async getAvgValor(categoria: string, lojaId: string): Promise<number> {
    // Busca média histórica do Supabase
    const { data } = await supabase
      .from('lancamentos')
      .select('valor_total')
      .eq('categoria', categoria)
      .eq('loja_id', lojaId)
      .gte('created_at', new Date(Date.now() - 90 * 24 * 60 * 60 * 1000).toISOString())
    
    if (!data || data.length === 0) return 0
    
    const sum = data.reduce((acc, row) => acc + row.valor_total, 0)
    return sum / data.length
  }
}

// Hook para usar no frontend
export function useAnomalyDetection() {
  const detector = useRef(new AnomalyDetector())
  
  useEffect(() => {
    // Treina modelo ao iniciar
    fetch('/api/ml/training-data')
      .then(res => res.json())
      .then(data => detector.current.train(data))
  }, [])
  
  const checkAnomaly = useCallback(async (transaction: Transaction) => {
    return await detector.current.detectAnomaly(transaction)
  }, [])
  
  return { checkAnomaly }
}
```

---

## 🔄 SISTEMA DE CONCILIAÇÃO INTELIGENTE

### Motor Híbrido com ML Adaptativo

```typescript
// lib/reconciliation/engine.ts

export interface ReconciliationRule {
  name: string
  priority: number
  confidence: number
  matcher: (extrato: Extrato, parcela: Parcela) => boolean
}

export class ReconciliationEngine {
  private rules: ReconciliationRule[] = [
    // Regra 1: Match exato por doc_ref (98% confiança)
    {
      name: 'DOC_REF_EXACT',
      priority: 1,
      confidence: 98,
      matcher: (e, p) => e.doc_ref === p.id || e.doc_ref === p.pix_e2eid
    },
    
    // Regra 2: Valor + Data próxima (85% confiança)
    {
      name: 'VALUE_DATE_NEAR',
      priority: 2,
      confidence: 85,
      matcher: (e, p) => {
        const valorMatch = Math.abs(e.valor - p.valor) / p.valor < 0.02  // 2% tolerância
        const dataMatch = Math.abs(daysBetween(e.data, p.vencimento)) <= 3
        return valorMatch && dataMatch
      }
    },
    
    // Regra 3: Similaridade textual + Valor (70% confiança)
    {
      name: 'TEXT_SIMILARITY',
      priority: 3,
      confidence: 70,
      matcher: (e, p) => {
        const similarity = stringSimilarity(e.historico, p.lancamento.descricao)
        const valorMatch = Math.abs(e.valor - p.valor) / p.valor < 0.05
        return similarity > 0.7 && valorMatch
      }
    },
  ]
  
  private mlModel?: MLModel  // Modelo treinado
  
  async reconcile(extratos: Extrato[], parcelas: Parcela[]): Promise<Conciliacao[]> {
    const conciliacoes: Conciliacao[] = []
    const extratosPendentes = [...extratos]
    const parcelasPendentes = [...parcelas]
    
    // Fase 1: Regras determinísticas
    for (const rule of this.rules.sort((a, b) => a.priority - b.priority)) {
      for (let i = extratosPendentes.length - 1; i >= 0; i--) {
        const extrato = extratosPendentes[i]
        
        for (let j = parcelasPendentes.length - 1; j >= 0; j--) {
          const parcela = parcelasPendentes[j]
          
          if (rule.matcher(extrato, parcela)) {
            conciliacoes.push({
              extrato_id: extrato.id,
              parcela_id: parcela.id,
              regra: rule.name,
              confianca: rule.confidence,
              status: rule.confidence >= 90 ? 'aprovado' : 'pendente'
            })
            
            extratosPendentes.splice(i, 1)
            parcelasPendentes.splice(j, 1)
            break
          }
        }
      }
    }
    
    // Fase 2: ML para casos difíceis
    if (this.mlModel && extratosPendentes.length > 0) {
      const mlMatches = await this.mlModel.predict(extratosPendentes, parcelasPendentes)
      
      mlMatches.forEach(match => {
        if (match.confidence > 70) {
          conciliacoes.push({
            extrato_id: match.extrato_id,
            parcela_id: match.parcela_id,
            regra: 'ML_MATCH',
            confianca: match.confidence,
            status: match.confidence >= 85 ? 'aprovado' : 'pendente'
          })
        }
      })
    }
    
    return conciliacoes
  }
  
  async trainML(historico: { extrato: Extrato, parcela: Parcela, match: boolean }[]) {
    // Treina modelo com feedback do usuário
    const features = historico.map(h => this.extractFeatures(h.extrato, h.parcela))
    const labels = historico.map(h => h.match ? 1 : 0)
    
    this.mlModel = await trainClassifier(features, labels)
  }
  
  private extractFeatures(extrato: Extrato, parcela: Parcela): number[] {
    return [
      Math.abs(extrato.valor - parcela.valor) / parcela.valor,  // diff valor
      daysBetween(extrato.data, parcela.vencimento),  // diff dias
      stringSimilarity(extrato.historico, parcela.lancamento.descricao),  // similaridade texto
      extrato.data.getHours(),  // hora do dia
      extrato.data.getDay(),  // dia da semana
    ]
  }
}

// Helper functions
function daysBetween(d1: Date, d2: Date): number {
  const diff = Math.abs(d1.getTime() - d2.getTime())
  return Math.ceil(diff / (1000 * 3600 * 24))
}

function stringSimilarity(s1: string, s2: string): number {
  // Levenshtein distance normalizado
  const longer = s1.length > s2.length ? s1 : s2
  const shorter = s1.length > s2.length ? s2 : s1
  
  if (longer.length === 0) return 1.0
  
  return (longer.length - editDistance(longer, shorter)) / longer.length
}

function editDistance(s1: string, s2: string): number {
  // Implementação Levenshtein
  const costs: number[] = []
  for (let i = 0; i <= s1.length; i++) {
    let lastValue = i
    for (let j = 0; j <= s2.length; j++) {
      if (i === 0) {
        costs[j] = j
      } else if (j > 0) {
        let newValue = costs[j - 1]
        if (s1.charAt(i - 1) !== s2.charAt(j - 1)) {
          newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1
        }
        costs[j - 1] = lastValue
        lastValue = newValue
      }
    }
    if (i > 0) costs[s2.length] = lastValue
  }
  return costs[s2.length]
}
```

---

## 📊 DASHBOARDS REAL-TIME & WEBSOCKETS

### Sincronização Multi-Usuário

```typescript
// lib/realtime/supabase-realtime.ts

import { RealtimeChannel } from '@supabase/supabase-js'
import { supabase } from './supabase/client'

export function useRealtimeSync<T>(
  table: string,
  filter?: { column: string, value: string }
) {
  const [data, setData] = useState<T[]>([])
  const channelRef = useRef<RealtimeChannel>()
  
  useEffect(() => {
    // Subscribe to real-time changes
    const channel = supabase
      .channel(`realtime:${table}`)
      .on(
        'postgres_changes',
        {
          event: '*',
          schema: 'public',
          table: table,
          filter: filter ? `${filter.column}=eq.${filter.value}` : undefined
        },
        (payload) => {
          console.log('Realtime event:', payload)
          
          switch (payload.eventType) {
            case 'INSERT':
              setData(prev => [...prev, payload.new as T])
              toast.success('Novo registro adicionado')
              break
            case 'UPDATE':
              setData(prev => prev.map(item => 
                item.id === payload.new.id ? payload.new as T : item
              ))
              toast.info('Registro atualizado')
              break
            case 'DELETE':
              setData(prev => prev.filter(item => item.id !== payload.old.id))
              toast.warning('Registro removido')
              break
          }
        }
      )
      .subscribe()
    
    channelRef.current = channel
    
    return () => {
      channel.unsubscribe()
    }
  }, [table, filter])
  
  return { data, setData }
}

// Hook para presença (quem está online)
export function usePresence(room: string) {
  const [onlineUsers, setOnlineUsers] = useState<User[]>([])
  const { user } = useAuth()
  
  useEffect(() => {
    if (!user) return
    
    const channel = supabase.channel(room, {
      config: {
        presence: {
          key: user.id,
        },
      },
    })
    
    channel
      .on('presence', { event: 'sync' }, () => {
        const state = channel.presenceState()
        const users = Object.values(state).flat() as User[]
        setOnlineUsers(users)
      })
      .on('presence', { event: 'join' }, ({ key, newPresences }) => {
        toast(`${newPresences[0].nome} entrou`, { icon: '👋' })
      })
      .on('presence', { event: 'leave' }, ({ key, leftPresences }) => {
        toast(`${leftPresences[0].nome} saiu`, { icon: '👋' })
      })
      .subscribe(async (status) => {
        if (status === 'SUBSCRIBED') {
          await channel.track({
            id: user.id,
            nome: user.nome,
            papel: user.papel,
            online_at: new Date().toISOString(),
          })
        }
      })
    
    return () => {
      channel.unsubscribe()
    }
  }, [room, user])
  
  return { onlineUsers }
}
```

---

## 🎯 ROADMAP DE IMPLEMENTAÇÃO (4 SEMANAS)

### Semana 1: Fundação Premium

**Objetivo:** Base sólida e performática

#### Dia 1-2: Setup & Design System
- [ ] Instalar shadcn/ui completo (20 componentes)
- [ ] Configurar Tailwind v4 + CVA
- [ ] Criar tokens de design (cores, spacing, typography)
- [ ] Implementar tema dark/light com persistência
- [ ] Configurar Framer Motion

#### Dia 3-4: Refatoração de Performance
- [ ] Migrar para @supabase/ssr
- [ ] Converter 5 páginas principais para Server Components
- [ ] Implementar ISR (Incremental Static Regeneration)
- [ ] Adicionar Suspense boundaries
- [ ] Otimizar bundle com dynamic imports

#### Dia 5: Validação & Forms
- [ ] Criar schemas Zod para todas as entidades
- [ ] Refatorar formulários com react-hook-form
- [ ] Implementar validação server-side
- [ ] Adicionar error handling padronizado

**Entregável:** Sistema 40% mais rápido + UI consistente

---

### Semana 2: IA & Conciliação

**Objetivo:** Diferenciadores técnicos

#### Dia 6-7: Copiloto Financeiro
- [ ] Integrar Vercel AI SDK
- [ ] Criar API route `/api/copilot/chat`
- [ ] Implementar function calling (SQL generation)
- [ ] Adicionar RAG com embeddings de docs
- [ ] UI do copiloto (sidebar flutuante)

#### Dia 8-9: Motor de Conciliação
- [ ] Implementar ReconciliationEngine
- [ ] Criar parsers de extratos (BB, Itaú, Santander, Nubank)
- [ ] UI de upload com preview
- [ ] Painel de pendências (side-by-side)
- [ ] Feedback loop para ML

#### Dia 10: Previsão Avançada
- [ ] Implementar Prophet forecaster
- [ ] API de previsão (`/api/forecast/cashflow`)
- [ ] Gráfico interativo com forecast
- [ ] Explicação de componentes

**Entregável:** 70% conciliação automática + Copiloto funcional

---

### Semana 3: Features Premium

**Objetivo:** Completude funcional

#### Dia 11-12: Contratos Recorrentes
- [ ] CRUD de contratos
- [ ] Geração automática de lançamentos (Edge Function + pg_cron)
- [ ] Reajuste com cálculo de índice
- [ ] Histórico de reajustes

#### Dia 13-14: Upload de Anexos + OCR
- [ ] Drag & drop com react-dropzone
- [ ] Integração Supabase Storage
- [ ] Preview de PDFs
- [ ] OCR básico (Tesseract.js)
- [ ] Extração de dados (valor, vencimento, fornecedor)

#### Dia 15: Real-time & WebSockets
- [ ] useRealtimeSync hook
- [ ] Presence (quem está online)
- [ ] Notificações push
- [ ] Toast sync entre usuários

**Entregável:** Automação completa + Colaboração real-time

---

### Semana 4: Excelência & Scale

**Objetivo:** Produção-ready

#### Dia 16-17: Testes
- [ ] Setup Vitest
- [ ] 20 unit tests (hooks, utils)
- [ ] 10 integration tests (API routes)
- [ ] Setup Playwright
- [ ] 5 E2E tests (happy paths)

#### Dia 18-19: Performance & Monitoring
- [ ] Lighthouse audit (score 95+)
- [ ] Sentry integration
- [ ] Vercel Analytics
- [ ] PostHog events
- [ ] Cache optimization

#### Dia 20: Polish & Documentation
- [ ] Onboarding tour (driver.js)
- [ ] Help center (docs + vídeos)
- [ ] Release notes
- [ ] Deploy produção

**Entregável:** Sistema pronto para escala

---

## 📈 MÉTRICAS DE SUCESSO

| Métrica | Atual | Meta v3.0 | Como Medir |
|---------|-------|-----------|------------|
| **Time to Interactive** | ~3s | <1s | Lighthouse |
| **Conciliação automática** | 0% | 85%+ | % matched |
| **Copiloto accuracy** | N/A | 90%+ | User feedback |
| **Forecast MAPE** | N/A | <15% | MAE vs real |
| **Mobile score** | ? | 95+ | PageSpeed |
| **Teste coverage** | 0% | 80%+ | Vitest |
| **User satisfaction** | ? | 4.5/5 | NPS |

---

## 🚀 VAMOS COMEÇAR?

**Próxima ação:** Escolha uma das opções:

**A)** Começar pela Semana 1 - Setup completo do zero  
**B)** Ir direto para IA (Copiloto + Conciliação)  
**C)** Priorizar Performance (SSR + ISR + Caching)  
**D)** Seu plano customizado

**Estou pronto para executar. Qual sua escolha?** 🎯
