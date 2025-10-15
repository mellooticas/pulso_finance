# 🗺️ PULSO Finance — Roadmap de Execução

> Planejamento detalhado de implementação do MVP (Sprints 1-6) e Extensões v2.0 (Sprints 7-10). Inclui timeline, recursos, custos, riscos e checklists de go-live.

**Status**: Aprovado para Execução  
**Período**: Janeiro 2025 - Junho 2025  
**Versão**: 2.0

---

## 📑 Índice

1. [Visão Geral do Roadmap](#1-visão-geral-do-roadmap)
2. [MVP - Sprints 1-6 (12 semanas)](#2-mvp---sprints-1-6)
3. [Extensões v2.0 - Sprints 7-10 (8 semanas)](#3-extensões-v20---sprints-7-10)
4. [Critérios de Aceite](#4-critérios-de-aceite)
5. [Riscos e Mitigações](#5-riscos-e-mitigações)
6. [Recursos e Custos](#6-recursos-e-custos)
7. [Métricas e SLOs](#7-métricas-e-slos)
8. [Checklists](#8-checklists)
9. [Timeline Visual](#9-timeline-visual)

---

## 1) Visão Geral do Roadmap

### 1.1 Fases do Projeto

```
┌─────────────────────────────────────────────────────────┐
│ FASE 1: MVP (12 semanas)                                │
│ └─ Sprints 1-6: Core financeiro + Conciliação          │
├─────────────────────────────────────────────────────────┤
│ FASE 2: Extensões v2.0 (8 semanas)                     │
│ └─ Sprints 7-10: Open Finance + Pix Out + Score        │
├─────────────────────────────────────────────────────────┤
│ FASE 3: Go-Live & Hardening (2 semanas)                │
│ └─ Testes de carga + Migração piloto + Treinamento     │
└─────────────────────────────────────────────────────────┘

Total: 22 semanas (~5,5 meses)
```

### 1.2 Entregas por Sprint

| Sprint | Duração | Tema | Entregas Principais |
|--------|---------|------|---------------------|
| **01** | 2 sem | Fundação | DDL + RLS + CRUD + Dashboard v0 |
| **02** | 2 sem | AP/AR | Parcelador + Grid + Views + Auditoria |
| **03** | 2 sem | Conciliação | Motor regras + UI pendências + Contratos |
| **04** | 2 sem | Meios Pgto | Cartões + Pix In + Forecast v1 |
| **05** | 2 sem | IA + DRE | Conciliação IA + DRE completo + Export |
| **06** | 2 sem | Copiloto | Q&A LLM + Comissões + Hardening |
| **07** | 2 sem | Open Finance | Conexões + Sync automático |
| **08** | 2 sem | Pix Out | Pagamentos + Dupla aprovação |
| **09** | 2 sem | Score + BI | PULSO Score + Ranking + Narrativas |
| **10** | 2 sem | Finalização | OCR + Export contábil + Planejamento |

---

## 2) MVP - Sprints 1-6

### Sprint 01 (Semanas 1-2): Fundação

**Meta**: Ambiente funcional + CRUD básico

#### Backend
- [x] DDL completo (tabelas, enums, índices)
- [x] RLS básico (lojas, usuarios, lancamentos, parcelas)
- [x] Seeds: 1 loja, plano de contas padrão, 2 usuários
- [x] Seeds: 20 lançamentos históricos para testes
- [x] Triggers de auditoria básica

#### Frontend
- [x] Setup Next.js 15 + Supabase client
- [x] Autenticação (Supabase Auth: login, logout, perfil)
- [x] Layout base (sidebar, header, breadcrumbs)
- [x] Página de Lojas (CRUD simples)
- [x] Página de Lançamentos (grid + filtros + modal de criação)

#### Critérios de Aceite
- [ ] Criar lançamento com 3 parcelas em < 1min
- [ ] Ver lista de parcelas por status
- [ ] RLS impede acesso a lojas de outro usuário
- [ ] Auditoria registra criação de lançamento

**Estimativa de Esforço**: 80 horas  
**Riscos**: Setup inicial pode levar mais tempo (mitigado com template)

---

### Sprint 02 (Semanas 3-4): Fluxo & Dashboard v0

**Meta**: Visão geral funcional

#### Backend
- [x] Views: `vw_fluxo_caixa`, `vw_dre_mensal` (simplificada)
- [x] RPC: `rpc_prever_caixa` (média móvel)
- [x] Triggers: atualização de `updated_at`
- [x] Materialized view: `mv_saldos_contas`

#### Frontend
- [x] Dashboard (4 cards KPI + gráfico fluxo 30 dias)
- [x] Página de Contas Financeiras (CRUD)
- [x] Upload de anexos (Supabase Storage)
- [x] Parcelador inteligente (modal com preview)
- [x] Export CSV de lançamentos

#### Critérios de Aceite
- [ ] Dashboard carrega em < 2s (com dados de 1 ano)
- [ ] Upload de NF (PDF até 5MB) com sucesso
- [ ] Prever caixa 30 dias com MAPE < 30%
- [ ] Parcelador calcula vencimentos corretamente

**Estimativa de Esforço**: 80 horas  
**Riscos**: Performance do dashboard com muitos dados (mitigado com paginação)

---

### Sprint 03 (Semanas 5-6): Conciliação Fase 1

**Meta**: Regras determinísticas + UI de pendências

#### Backend
- [x] Parser CSV: Banco do Brasil e Itaú
- [x] Tabelas: `extratos`, `conciliacoes`
- [x] Regras: DOC_REF_MATCH, VALUE_DATE_NEAR
- [x] RPC: `rpc_conciliar_por_ref`, `rpc_aprovar_conciliacao`
- [x] Trigger: marcar parcela como paga ao conciliar

#### Frontend
- [x] Upload de extrato CSV (drag & drop)
- [x] Página de Conciliação (lista extratos não processados)
- [x] Painel de Pendências (sugestões lado a lado)
- [x] Ações: Aprovar / Rejeitar / Criar lançamento ad-hoc

#### Contratos
- [x] Tabela `contratos`
- [x] RPC: `rpc_gerar_lancamento_contrato`
- [x] Job: geração automática mensal (pg_cron)
- [x] UI: CRUD de contratos + modal de reajuste

#### Critérios de Aceite
- [ ] Importar 100 linhas de extrato em < 10s
- [ ] Auto-match ≥ 40% (meta conservadora)
- [ ] Aprovar conciliação marca parcela como paga
- [ ] Contrato gera lançamento automaticamente no dia 1

**Estimativa de Esforço**: 100 horas  
**Riscos**: Qualidade de extratos pode ser ruim (mitigado com validador)

---

### Sprint 04 (Semanas 7-8): Meios de Pagamento

**Meta**: Cartões + Pix In + Forecast v1

#### Backend
- [x] Tabelas: `pix_transacoes`, `cartao_transacoes`
- [x] Parser CSV: adquirentes (Stone, Cielo)
- [x] Webhook Pix (Edge Function - stub Stripe/OpenPix)
- [x] RPC: `rpc_prever_caixa` v1.1 (ajuste sazonal)

#### Frontend
- [x] Configuração de Integrações (tokens API)
- [x] Página Pix Transações (monitoramento)
- [x] Página Cartões (agenda de recebíveis)
- [x] Gráficos de forecast (Recharts)

#### Critérios de Aceite
- [ ] Receber webhook Pix e criar parcela automaticamente
- [ ] Importar CSV Stone (30 dias) sem erro
- [ ] Forecast 30 dias exibido no dashboard
- [ ] Agenda de cartões mostra previsões

**Estimativa de Esforço**: 90 horas  
**Riscos**: Webhook pode falhar (mitigado com retry + fila)

---

### Sprint 05 (Semanas 9-10): IA + DRE Completo

**Meta**: Conciliação IA + DRE gerencial + Exports

#### Backend
- [x] Edge Function: IA de pareamento (score simples)
- [x] View `vw_dre_mensal` completa (receita, CMV, despesas, EBITDA)
- [x] RPC: export Excel/CSV

#### Frontend
- [x] Conciliação: exibir score IA junto com sugestões
- [x] Página DRE (tabela + gráficos + comparativos)
- [x] Fluxo: cenários what-if (sliders)
- [x] Export: Excel formatado, PDF com logo

#### Critérios de Aceite
- [ ] IA sugere pareamento com score > 70% em 10% dos casos difíceis
- [ ] Auto-match geral ≥ 60%
- [ ] DRE mensal consolidado + por loja
- [ ] Comparar mês vs. mês anterior (variação %)
- [ ] Export Excel com fórmulas preservadas

**Estimativa de Esforço**: 100 horas  
**Riscos**: IA pode precisar mais dados (mitigado com fallback de regras)

---

### Sprint 06 (Semanas 11-12): Copiloto + Comissões + Hardening

**Meta**: Inteligência acionável + preparação Go-Live

#### Backend
- [x] Tabela: `parametros_sistema`
- [x] RPC: detecção de anomalias (Z-score)
- [x] Edge Function: Q&A LLM (whitelist views)
- [x] Tabelas comissões: `vendedores`, `comissoes_regras`, `vendas_resumo`

#### Frontend
- [x] Chat Copiloto (barra lateral)
- [x] Alertas inteligentes (cards no dashboard)
- [x] Página de Auditoria (filtros avançados)
- [x] Onboarding (tour guiado)
- [x] Página Comissões (CRUD regras + apuração)

#### Hardening
- [x] Testes E2E (Playwright: 10 casos críticos)
- [x] Performance: otimizar queries lentas
- [x] Segurança: pen test básico (OWASP Top 10)
- [x] Backup/restore testado

#### Critérios de Aceite
- [ ] Copiloto responde "Qual foi o EBITDA de agosto?" corretamente
- [ ] Detectar despesa 2× acima da média e notificar
- [ ] 100% das telas responsivas (mobile/tablet)
- [ ] Documentação de usuário (help inline + vídeos)
- [ ] Testes E2E passando em staging

**Estimativa de Esforço**: 120 horas  
**Riscos**: Comissões pode ser complexo (simplificar se necessário)

---

## 3) Extensões v2.0 - Sprints 7-10

### Sprint 07 (Semanas 13-14): Open Finance

**Meta**: Agregação automática de contas

#### Backend
- [x] Tabelas: `openfinance_connections`, `bank_accounts_external`
- [x] Edge Function: integração com Pluggy/Belvo
- [x] RPC: `rpc_sync_openfinance`
- [x] Job: pull a cada 15min

#### Frontend
- [x] Wizard de conexão Open Finance
- [x] Healthcheck de conexões
- [x] Log de última sincronização

#### Critérios de Aceite
- [ ] Conectar conta bancária via Open Finance
- [ ] Sincronizar extratos automaticamente
- [ ] Atraso de sincronização < 15min P95

**Estimativa de Esforço**: 80 horas  
**Riscos**: Providers podem ter instabilidade (mitigado com retry)

---

### Sprint 08 (Semanas 15-16): Pix Out

**Meta**: Pagamentos automatizados

#### Backend
- [x] Tabelas: `pix_pagamentos`, `payment_approvals`
- [x] Edge Function: `/pix/out` (criar ordem no provider)
- [x] Workflow: dupla aprovação
- [x] Trigger: marcar parcela paga ao confirmar

#### Frontend
- [x] Página Pix Pagamentos (fila de aprovações)
- [x] Agendamento de pagamentos
- [x] Histórico de pagamentos

#### Critérios de Aceite
- [ ] Criar pagamento Pix com aprovação
- [ ] Dupla aprovação funcional
- [ ] Taxa de sucesso > 99,5%
- [ ] Tempo envio-confirmação < 60s P95

**Estimativa de Esforço**: 90 horas  
**Riscos**: Provider pode falhar (mitigado com fallback)

---

### Sprint 09 (Semanas 17-18): Score + BI Avançado

**Meta**: PULSO Score + Narrativas IA

#### Backend
- [x] View: `vw_pulso_score_mensal`
- [x] View: `vw_ranking_adquirentes`
- [x] RPC: `rpc_gerar_relatorio_mensal` (LLM)
- [x] Tabela: `reports_mensais`

#### Frontend
- [x] Card PULSO Score (0-100 com cor)
- [x] Playbooks "Como melhorar?"
- [x] Ranking de adquirentes (gráfico)
- [x] Relatórios narrativos (markdown)

#### Critérios de Aceite
- [ ] PULSO Score ≥ 75 em 60% das lojas (após 90 dias)
- [ ] Narrativa mensal gerada em < 45s
- [ ] Recomendação de migração de adquirente

**Estimativa de Esforço**: 100 horas  
**Riscos**: LLM pode ter custo alto (mitigado com cache)

---

### Sprint 10 (Semanas 19-20): Finalização v2.0

**Meta**: OCR + Export contábil + Planejamento

#### Backend
- [x] Tabela: `anexos_processados`
- [x] Edge Function: OCR (Tesseract/Azure)
- [x] Tabela: `plano_contas_mapeamento`
- [x] RPC: `rpc_export_contabilidade`
- [x] Tabela: `planejamento_semanal`

#### Frontend
- [x] Upload com OCR (assistente lateral)
- [x] Configuração de mapeamento contábil
- [x] Download de exports contábeis
- [x] Widget "Plano da Semana"

#### Critérios de Aceite
- [ ] OCR extrai valor/vencimento com 90% acurácia
- [ ] Export contábil no formato SPED
- [ ] Plano semanal gerado automaticamente

**Estimativa de Esforço**: 110 horas  
**Riscos**: OCR pode ter baixa acurácia (mitigado com validação manual)

---

## 4) Critérios de Aceite

### 4.1 MVP (Go-Live)

**Funcionalidades**:
- [x] Importar 12 meses de histórico em ≤ 2h
- [x] Conciliar ≥ 75% automaticamente em 30 dias
- [x] Previsão 30 dias com MAPE ≤ 20% (v1) — meta 15% pós 60d
- [x] Geração automática de aluguel e franquia %/mês
- [x] RLS auditado; vendedor não vê custo

**Performance**:
- [x] Dashboard carrega em < 2s P95
- [x] Queries principais < 500ms P95
- [x] Upload CSV 100 linhas < 10s

**Segurança**:
- [x] MFA habilitado para admins
- [x] RLS testado em todas as tabelas
- [x] Auditoria registra todas as ações críticas

### 4.2 v2.0 (Extensões)

**Funcionalidades**:
- [x] 80% das contas sincronizadas via Open Finance
- [x] 70% das saídas > R$ 500 pagas por Pix Out
- [x] PULSO Score ≥ 75 em 60% das lojas
- [x] Redução ≥ 10% em custo de adquirência

**Performance**:
- [x] Sincronização Open Finance < 15min
- [x] Pix Out confirmação < 60s P95
- [x] OCR processamento < 30s

---

## 5) Riscos e Mitigações

### Risco 1: Qualidade dos Dados Históricos ⚠️ ALTO

**Impacto**: Pode inviabilizar importação automática

**Mitigação**:
- Validador de CSV com relatório de erros (linha a linha)
- Assistente manual para correções (UI de limpeza)
- Aceitar importação parcial (registrar falhas em log)
- Documentar requisitos de formato por banco

**Contingência**:
- Se CSV muito ruim: digitação manual assistida
- Contratar consultoria de limpeza (3-5 dias)

---

### Risco 2: Performance de RLS com Escala ⚠️ MÉDIO

**Impacto**: Queries >5s em redes com 50+ lojas

**Mitigação**:
- Views materializadas para KPIs (refresh 30min)
- Índices parciais (where status in (...))
- Cache no frontend (TanStack Query staleTime: 5min)
- Paginação agressiva (20 itens/página)

**Contingência**:
- Se RLS for gargalo: migrar para RPC com security definer
- Considerar sharding por loja (particionamento)

---

### Risco 3: Complexidade de Contratos ⚠️ MÉDIO

**Impacto**: Regras de franquia % variam muito

**Mitigação**:
- Começar apenas com aluguel fixo (Sprint 4)
- Franquia % só se houver integração com vendas (Sprint 5+)
- Permitir lançamento manual como fallback

**Contingência**:
- Se regras muito customizadas: campo `metadata` JSONB
- Considerar motor de regras (jsonlogic)

---

### Risco 4: Conciliação - Expectativa vs. Realidade ⚠️ MÉDIO

**Impacto**: 70% auto-match é ambicioso

**Mitigação**:
- Comunicar expectativa realista: 40-60% em 30 dias
- Feedback loop: usuário confirma → sistema aprende
- Priorizar regras determinísticas (mais confiáveis)

**Contingência**:
- Se auto-match < 30%: investigar qualidade de doc_ref
- Adicionar mais bancos ao dicionário
- Oferecer serviço de conciliação assistida

---

### Risco 5: Latência de APIs Externas ⚠️ BAIXO

**Impacto**: Webhooks falharem ou atrasarem

**Mitigação**:
- Fila de eventos (event_bus) com retry
- Retry exponencial (3 tentativas: 1min, 5min, 15min)
- Polling de fallback (consultar API a cada 30min)
- Alertas quando fila > 100 eventos

**Contingência**:
- Se provider instável: trocar provider
- Importação manual de CSV como backup

---

### Risco 6: Adoção pelo Usuário ⚠️ MÉDIO

**Impacto**: Resistência a migrar de Excel

**Mitigação**:
- Onboarding guiado (tour interativo)
- Vídeos curtos (< 3min) por funcionalidade
- Help inline (tooltips contextuais)
- Suporte dedicado nos primeiros 30 dias
- Gamificação leve (badges)

**Contingência**:
- Se adoção < 50% em 30 dias: sessões 1-on-1
- Incentivos (descontos, features exclusivas)

---

## 6) Recursos e Custos

### 6.1 Time Necessário

| Papel | Dedicação | Responsabilidades |
|-------|-----------|-------------------|
| **Tech Lead** | 100% | Arquitetura, code review, decisões técnicas |
| **Backend Dev** | 100% | SQL, RPCs, Edge Functions, integrações |
| **Frontend Dev** | 100% | Next.js, UI/UX, componentes |
| **Designer UX** | 50% | Wireframes, protótipos, testes |
| **QA** | 50% | Testes manuais, E2E, relatórios de bug |
| **Product Owner** | 30% | Requisitos, priorização, aceite |

**Total**: 4.3 FTE (Full-Time Equivalents)

### 6.2 Custos Mensais (Infraestrutura)

| Item | Volume | Custo/mês |
|------|--------|-----------|
| **Supabase Pro** | 1 projeto | $25 |
| **Vercel Pro** | 100k req | $20 |
| **Storage** | 10GB anexos | $2 |
| **Anthropic API** | 500k tokens | $15 |
| **Twilio** | 1k SMS | $10 |
| **SendGrid** | 10k emails | $15 |
| **Sentry** | 10k events | $0 (free) |
| **Domínio** | .finance | $5 |
| **TOTAL** | - | **$92/mês** |

### 6.3 Custos de Desenvolvimento (MVP)

| Fase | Duração | Custo (estimado) |
|------|---------|------------------|
| Sprints 1-6 | 12 semanas | $60k - $80k |
| Sprints 7-10 | 8 semanas | $40k - $50k |
| Go-Live | 2 semanas | $10k - $15k |
| **TOTAL** | 22 semanas | **$110k - $145k** |

*Estimativa considerando time sênior em modelo remoto*

### 6.4 Receita Estimada (SaaS)

| Plano | Lojas | Preço/mês | Break-even |
|-------|-------|-----------|------------|
| **Light** | 1-3 | $99 | 3 clientes |
| **Pro** | 4-10 | $299 | 1 cliente |
| **Enterprise** | 10+ | $699 | 1 cliente |

**Break-even infraestrutura**: 1 cliente Pro ou 3 clientes Light

---

## 7) Métricas e SLOs

### 7.1 SLOs de Aplicação

| Métrica | SLO | Medição |
|---------|-----|---------|
| **Disponibilidade** | 99.5% (uptime) | UptimeRobot |
| **Latência P95** | < 2s (páginas principais) | Vercel Analytics |
| **Latência P99** | < 5s | Web Vitals |
| **Taxa de Erro** | < 1% (requests) | Sentry |
| **Auto-match** | > 70% (em 90 dias) | Query em conciliacoes |
| **MAPE Previsão 30d** | < 20% | Cálculo semanal |
| **Ingestão CSV** | < 10 min | Log de jobs |

### 7.2 KPIs de Produto

| KPI | Meta | Prazo |
|-----|------|-------|
| Tempo de fechamento mensal | -60% (10h → 4h) | 90 dias |
| Erros de conciliação | -80% | 60 dias |
| Visibilidade de caixa | Tempo real (antes: D+3) | Imediato |
| Usuários ativos semanais | >80% | 30 dias |
| NPS (Net Promoter Score) | >50 | 90 dias |
| Taxa de retenção (3 meses) | >90% | 90 dias |

### 7.3 KPIs Técnicos

| KPI | Meta | Ferramenta |
|-----|------|-----------|
| Cobertura de testes | Unit 70%, E2E 90% | Vitest + Playwright |
| Bugs críticos em produção | 0 | Sentry |
| Tempo médio de deploy | < 15min | GitHub Actions |
| Tempo médio de resolução (bug) | < 24h | Linear |

---

## 8) Checklists

### 8.1 Checklist de Dados Iniciais

#### Organizacional
- [ ] Nome das lojas (lista completa)
- [ ] CNPJ de cada loja
- [ ] Endereços completos
- [ ] Lojas ativas vs. inativas

#### Usuários
- [ ] Lista de usuários (nome, email, papel)
- [ ] Quem tem acesso a quais lojas
- [ ] Hierarquia (quem aprova o quê)

#### Contas Financeiras
- [ ] Banco, agência, conta de cada loja
- [ ] Saldo inicial de cada conta (data de referência)
- [ ] Contas ativas vs. fechadas

#### Plano de Contas
- [ ] Usar padrão sugerido OU
- [ ] Fornecer plano atual (Excel/CSV)
- [ ] Mapeamento: código → descrição → classe

#### Centros de Custo
- [ ] Lista por loja (ex: Vendas, ADM, Marketing)
- [ ] Departamentos específicos (se houver)

#### Fornecedores
- [ ] Top 20 fornecedores (nome, CNPJ, tipo)
- [ ] Dados de contato (email, telefone)

#### Contratos Vigentes
- [ ] Aluguéis (valor, dia, índice de reajuste)
- [ ] Franquias (%, faturamento base)
- [ ] Serviços recorrentes (contador, limpeza)

---

### 8.2 Checklist de Segurança (Go-Live)

#### Autenticação
- [ ] MFA habilitado para admins
- [ ] Política de senha forte (min 12 caracteres)
- [ ] Rotação de token JWT (1h expiração)
- [ ] Logout automático após 4h inatividade

#### Autorização
- [ ] RLS testado em todas as tabelas
- [ ] Matriz de permissões validada
- [ ] Vendedor não acessa custo (validado)

#### Dados Sensíveis
- [ ] Tokens API em Vault (não em .env)
- [ ] Chaves rotacionadas após setup
- [ ] Anexos em Storage privado (policy por loja)
- [ ] Logs não contêm PII

#### Rede
- [ ] HTTPS obrigatório (HSTS)
- [ ] CORS configurado (domínios confiáveis)
- [ ] Rate limiting ativo (100 req/min por IP)

#### Monitoramento
- [ ] Sentry configurado (erros → Slack)
- [ ] Alertas de segurança (SQL injection)
- [ ] Dashboard de anomalias

#### Compliance
- [ ] Termos de uso + Política de Privacidade
- [ ] Aceite registrado em auditoria
- [ ] Export de dados funcionando
- [ ] Processo de exclusão (LGPD) documentado

---

### 8.3 Checklist de Performance

#### Banco de Dados
- [ ] Todos os índices críticos criados
- [ ] Views materializadas para KPIs
- [ ] `EXPLAIN ANALYZE` em queries principais (< 50ms)
- [ ] pg_stat_statements habilitado

#### Frontend
- [ ] Lighthouse score > 90 (Performance)
- [ ] LCP < 2.5s (P75)
- [ ] FID < 100ms (P75)
- [ ] CLS < 0.1
- [ ] Images otimizadas (WebP, lazy loading)
- [ ] Code splitting (rotas dinâmicas)

#### Cache
- [ ] TanStack Query staleTime configurado (5min)
- [ ] CDN para assets estáticos (Vercel Edge)

#### Escalabilidade
- [ ] Teste de carga: 100 usuários simultâneos
- [ ] Paginação em todas as listagens (max 50 itens)
- [ ] Lazy loading de componentes pesados

---

### 8.4 Checklist de Go-Live

#### Semana -2 (Pré-produção)
- [ ] Todas as migrações aplicadas em produção
- [ ] Seeds de dados piloto (1-2 lojas reais)
- [ ] Backup manual criado e testado (restore)
- [ ] RLS validado em produção
- [ ] Jobs pg_cron agendados

#### Semana -1 (Treinamento)
- [ ] Manual do usuário escrito
- [ ] Vídeos gravados (< 3min cada)
- [ ] FAQ respondido (10+ perguntas)
- [ ] 3 sessões de treinamento agendadas
- [ ] Grupo de suporte criado (WhatsApp)

#### Dia 0 (Go-Live)
- [ ] Deploy final em produção
- [ ] Smoke tests (login, criar lançamento, dashboard)
- [ ] Liberar acesso para usuários piloto
- [ ] Monitor em tempo real (Sentry + logs)
- [ ] Primeira importação de extratos (assistida)

#### Semana +1 (Estabilização)
- [ ] Corrigir bugs reportados (prioridade: bloqueantes)
- [ ] Ajustar regras de conciliação
- [ ] Coletar NPS dos primeiros usuários
- [ ] Documentar lições aprendidas

---

## 9) Timeline Visual

### 9.1 Gantt Simplificado (MVP)

```
Semanas │ 1  2  3  4  5  6  7  8  9 10 11 12
────────┼─────────────────────────────────────
Sprint1 │██                                   Fundação
Sprint2 │  ██                                 AP/AR
Sprint3 │    ██                               Conciliação
Sprint4 │      ██                             Meios Pgto
Sprint5 │        ██                           IA + DRE
Sprint6 │          ██                         Copiloto
────────┼─────────────────────────────────────
Go-Live │            ▓▓                       Hardening
```

### 9.2 Gantt Simplificado (v2.0)

```
Semanas │13 14 15 16 17 18 19 20
────────┼─────────────────────────
Sprint7 │██                       Open Finance
Sprint8 │  ██                     Pix Out
Sprint9 │    ██                   Score + BI
Sprint10│      ██                 Finalização
────────┼─────────────────────────
Launch  │        ▓▓               v2.0 Live
```

### 9.3 Marcos (Milestones)

| Data | Marco | Entrega |
|------|-------|---------|
| **Semana 2** | Sprint 1 Done | Dashboard v0 funcional |
| **Semana 6** | Sprint 3 Done | Conciliação básica operando |
| **Semana 10** | Sprint 5 Done | DRE completo + IA |
| **Semana 12** | MVP Go-Live | Primeiros clientes em produção |
| **Semana 14** | Sprint 7 Done | Open Finance conectado |
| **Semana 20** | v2.0 Launch | Produto completo no mercado |

---

## 10) Contrato de Manutenção (Pós Go-Live)

### Primeira Semana
- **Suporte**: Segunda a Sexta, 8h-20h (WhatsApp + Email)
- **SLA de resposta**: 2h para bugs críticos, 24h para demais
- **Hotfixes**: Deploy imediato se bug bloqueia operação

### Primeiro Mês
- **Suporte**: Segunda a Sexta, 9h-18h
- **SLA de resposta**: 4h para bugs críticos, 48h para demais
- **Releases**: Semanal (sexta-feira à noite)

### Regime Permanente (após 3 meses)
- **Suporte**: Segunda a Sexta, 9h-18h
- **SLA de resposta**: 24h para bugs, 7 dias para melhorias
- **Releases**: Quinzenal (ou sob demanda para hotfix)
- **Manutenção programada**: 1º domingo de cada mês (2h-6h)

---

## 11) Próximas Ações Imediatas

### Fase 0: Preparação (Semana 1)
- [ ] Definir loja piloto (nome, CNPJ, contas bancárias)
- [ ] Coletar CSVs reais (1 extrato de cada banco usado)
- [ ] Mapear plano de contas atual (se existe)
- [ ] Listar fornecedores principais (top 20)
- [ ] Definir centros de custo

### Fase 1: Setup (Semana 2)
- [ ] Criar repositório GitHub (monorepo)
- [ ] Setup Next.js 15 + TypeScript + Tailwind
- [ ] Criar projeto Supabase (staging + prod)
- [ ] Configurar Vercel (preview + production)
- [ ] Rodar primeira migração (DDL completo)
- [ ] Seed de dados sintéticos (1 loja, 50 lançamentos)

### Sprint 01: Fundação (Semanas 3-4)
- [ ] Implementar RLS completo
- [ ] Criar RPCs básicos (CRUD)
- [ ] Seeds: plano de contas padrão ótica
- [ ] Layout base (sidebar, header)
- [ ] Autenticação (login, logout)
- [ ] Página Lançamentos (grid + modal)

---

**Versão**: 2.0  
**Última Atualização**: Janeiro 2025  
**Autoria**: Equipe PULSO Finance  
**Status**: Aprovado para Execução 🚀