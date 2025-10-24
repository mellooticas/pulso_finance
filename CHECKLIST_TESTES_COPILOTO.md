# ✅ CHECKLIST DE TESTES - COPILOTO IA

## PRÉ-REQUISITOS

### Ambiente
- [ ] Node.js instalado
- [ ] Frontend `npm install` executado
- [ ] Arquivo `.env.local` criado com OPENAI_API_KEY
- [ ] Dev server rodando (`npm run dev`)

### Banco de Dados
- [ ] Supabase acessível
- [ ] Tabelas `lancamentos`, `plano_contas`, `centros_custo` populadas
- [ ] Pelo menos 1 loja ativa
- [ ] RLS configurado

---

## TESTES FUNCIONAIS

### 1. Interface Visual

#### Botão Flutuante
- [ ] Aparece no canto inferior direito
- [ ] Ícone Sparkles (✨) visível
- [ ] Ao clicar, abre o chat
- [ ] Z-index correto (acima de outros elementos)

#### Chat Aberto
- [ ] Card 400x600px visível
- [ ] Header com título "Copiloto Financeiro"
- [ ] Status "Online" aparece
- [ ] Botões minimizar/fechar funcionam
- [ ] Mensagem de boas-vindas aparece
- [ ] Input placeholder correto

#### Chat Minimizado
- [ ] Apenas header visível
- [ ] Largura reduzida (~320px)
- [ ] Botão maximizar funciona
- [ ] Mensagens preservadas ao reabrir

---

### 2. Quick Actions

- [ ] **Botão "💰 Resultado do mês":**
  - Preenche input com "Qual meu resultado financeiro do mês?"
  - Não envia automaticamente (precisa apertar Enter/Send)

- [ ] **Botão "📅 Vencimentos":**
  - Preenche input com "Quais contas vencem nos próximos 7 dias?"

- [ ] **Botão "📊 Análise despesas":**
  - Preenche input com "Analise minhas despesas este mês"

---

### 3. Envio de Mensagens

#### Input e Submit
- [ ] Digite texto no input
- [ ] Botão Send habilitado
- [ ] Ao apertar Enter, envia mensagem
- [ ] Ao clicar Send, envia mensagem
- [ ] Input limpa após enviar
- [ ] Mensagem do user aparece alinhada à direita (azul)

#### Loading State
- [ ] Status muda para "Pensando..."
- [ ] Ícone Loader2 aparece no header (spinning)
- [ ] Indicador "Analisando..." aparece nas mensagens
- [ ] Input desabilitado durante loading
- [ ] Botão Send desabilitado durante loading

---

### 4. Respostas da IA

#### Query Simples
**Pergunta:** "Qual meu resultado financeiro do mês?"

- [ ] IA chama `query_dre` tool
- [ ] Resposta aparece alinhada à esquerda (cinza)
- [ ] Texto formatado corretamente
- [ ] Valores em R$ aparecem
- [ ] Margens/porcentagens aparecem
- [ ] Resposta completa em <5s

#### Query com Filtros
**Pergunta:** "Quais despesas tive em janeiro?"

- [ ] IA chama `query_lancamentos` tool
- [ ] Filtra por tipo="DESPESA"
- [ ] Filtra por data_inicio/fim
- [ ] Retorna lista de transações
- [ ] Mostra valor total

#### Query de Vencimentos
**Pergunta:** "O que vence esta semana?"

- [ ] IA chama `query_vencimentos` tool
- [ ] Filtra próximos 7 dias
- [ ] Lista contas a pagar E a receber
- [ ] Mostra datas de vencimento
- [ ] Formata valores

---

### 5. Streaming

- [ ] Respostas aparecem progressivamente (não de uma vez)
- [ ] Texto "flui" palavra por palavra ou em chunks
- [ ] Sem travamentos na UI
- [ ] Loading desaparece quando streaming termina

---

### 6. Erros e Edge Cases

#### Sem API Key
- [ ] Remove OPENAI_API_KEY do .env.local
- [ ] Tenta enviar mensagem
- [ ] Recebe erro descritivo
- [ ] Error state aparece na UI
- [ ] Não quebra a aplicação

#### Supabase Offline
- [ ] Desconecta internet
- [ ] Tenta fazer pergunta
- [ ] Timeout ou erro de rede
- [ ] Mensagem de erro amigável

#### Input Vazio
- [ ] Tenta enviar mensagem vazia
- [ ] Botão Send desabilitado
- [ ] Nada acontece ao apertar Enter

#### Pergunta Ambígua
**Pergunta:** "Quanto?"

- [ ] IA responde pedindo esclarecimento
- [ ] Não quebra
- [ ] Sugere perguntas mais claras

---

### 7. Context Awareness

#### Com Loja Selecionada
- [ ] Seleciona loja específica no filtro
- [ ] Faz pergunta: "Qual o resultado?"
- [ ] IA filtra dados daquela loja
- [ ] Menciona nome da loja na resposta

#### Com Período Selecionado
- [ ] Seleciona período específico (ex: outubro/2024)
- [ ] Faz pergunta: "Mostre DRE"
- [ ] IA usa período selecionado
- [ ] Não precisa especificar data na pergunta

---

### 8. Múltiplas Mensagens

- [ ] Envia 3+ mensagens seguidas
- [ ] Histórico de conversação preservado
- [ ] Scroll automático para última mensagem
- [ ] IA mantém contexto da conversa anterior

---

### 9. Responsividade

#### Desktop (1920x1080)
- [ ] Chat posicionado corretamente
- [ ] Não sobrepõe sidebar
- [ ] Largura 384px (w-96)
- [ ] Altura 600px

#### Tablet (768x1024)
- [ ] Chat ainda visível
- [ ] Não quebra layout
- [ ] Pode ficar um pouco escondido (ok)

#### Mobile (<640px)
- [ ] Chat adapta largura (ou fica fixo)
- [ ] Botão flutuante visível
- [ ] Touch events funcionam

---

### 10. Performance

#### Latência
- [ ] Primeira mensagem: <3s
- [ ] Mensagens subsequentes: <2s
- [ ] Streaming inicia em <500ms

#### Memória
- [ ] Abre Chrome DevTools > Performance
- [ ] Envia 10 mensagens
- [ ] Memory leak? (memória deve estabilizar)

#### Network
- [ ] Abre Chrome DevTools > Network
- [ ] Verifica chamadas para `/api/copilot/chat`
- [ ] Status 200 OK
- [ ] Content-Type: text/event-stream (streaming)

---

## TESTES AVANÇADOS

### 11. Function Calling

#### Tool: query_lancamentos
**Pergunta:** "Mostre transações de dezembro com valor > R$ 1000"

- [ ] IA extrai filtros:
  - tipo: null (todos)
  - data_inicio: 2024-12-01
  - data_fim: 2024-12-31
- [ ] Supabase query executada corretamente
- [ ] Filtra valores > 1000
- [ ] Retorna lista formatada

#### Tool: query_dre
**Pergunta:** "DRE de outubro"

- [ ] IA extrai mes: "2024-10"
- [ ] Calcula receitas brutas
- [ ] Calcula custos
- [ ] Calcula margens
- [ ] Formata como DRE estruturado

#### Tool: query_vencimentos
**Pergunta:** "Próximos vencimentos em 14 dias"

- [ ] IA extrai dias: 14
- [ ] Filtra data_vencimento <= hoje + 14
- [ ] Lista contas a pagar E a receber
- [ ] Ordena por data
- [ ] Mostra fornecedores/clientes

---

### 12. Análise de Prompts

#### System Prompt
- [ ] Abre DevTools > Network > Payload
- [ ] Verifica se `system` contém:
  - Nome da loja ativa
  - KPIs recentes (receitas, despesas)
  - Período atual
  - Instruções de comportamento

#### User Messages
- [ ] Mensagens anteriores incluídas no `messages` array
- [ ] Role correto (user/assistant)
- [ ] Content formatado

---

### 13. Custos

#### Estimativa
- [ ] Faz 10 perguntas variadas
- [ ] Acessa OpenAI Dashboard > Usage
- [ ] Verifica tokens consumidos
- [ ] Calcula custo: ~$0.004 total (10 queries)

---

## TESTES DE REGRESSÃO

### Após Mudanças
Se você modificar o código, re-execute:

1. **Smoke Test (5 min):**
   - [ ] Chat abre
   - [ ] Envia 1 mensagem
   - [ ] Recebe resposta
   - [ ] Fecha chat

2. **Integration Test (15 min):**
   - [ ] Testa 3 tools (lancamentos, DRE, vencimentos)
   - [ ] Verifica streaming
   - [ ] Valida formatação

3. **Full Test Suite (45 min):**
   - [ ] Executa todos os testes deste checklist

---

## CRITÉRIOS DE ACEITAÇÃO

### Mínimo Viável (MVP)
- [x] Chat abre e fecha
- [x] Envia mensagens
- [x] IA responde
- [x] Pelo menos 1 tool funciona
- [x] Streaming ativo

### Produção
- [ ] Todos os 3 tools funcionam
- [ ] Context awareness funcional
- [ ] Sem erros no console
- [ ] Latência <3s
- [ ] 0 vulnerabilidades npm
- [ ] TypeScript compila sem erros
- [ ] Responsivo (desktop + tablet)

---

## BUGS CONHECIDOS

### Não Implementado (Futuro)
- [ ] Markdown rendering (negrito, listas, código)
- [ ] Histórico persistente (localStorage)
- [ ] Export conversas
- [ ] Feedback thumbs up/down
- [ ] Rate limiting
- [ ] Syntax highlighting para JSON

### Workarounds
- **Mensagens plain text:** Adicionar `react-markdown` depois
- **Sem histórico:** Refresh limpa chat (ok para MVP)

---

## COMANDOS ÚTEIS

### Dev Server
```bash
cd frontend
npm run dev
```

### Limpar Cache
```bash
rm -rf .next
npm run dev
```

### Verificar Logs
- **Frontend:** Console do navegador
- **Backend:** Terminal onde `npm run dev` está rodando
- **Supabase:** Dashboard > Logs

### Debugar Streaming
```bash
curl -X POST http://localhost:3000/api/copilot/chat \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"role":"user","content":"Olá"}]}'
```

---

## RESULTADO ESPERADO

### ✅ SUCESSO
- Todos os testes funcionais passam
- Latência <3s
- Sem erros críticos
- UX fluida

### ⚠️ PARCIAL
- 1-2 tools com problemas
- Latência 3-5s
- Erros menores não-bloqueantes

### ❌ FALHA
- Chat não abre
- Nenhuma resposta da IA
- Erros de conexão persistentes
- Custo >$0.01 por query

---

**Última Atualização:** Janeiro 2025  
**Versão:** 1.0.0  
**Autor:** GitHub Copilot
