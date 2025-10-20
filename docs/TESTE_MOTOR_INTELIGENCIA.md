# 🚀 Guia Rápido - Testar Motor de Inteligência Financeira

## Opção 1: Teste Rápido (SEM Supabase)

### Testar apenas os cálculos e lógica

```bash
cd backend
python test_intelligence_engine.py
```

**O que vai acontecer:**
- ✅ Testa cálculo de juros (R$ 5.000 com 30 dias de atraso)
- ✅ Testa classificação de contas (vencidas, hoje, próximos dias)
- ✅ Testa análise por loja e fornecedor
- ✅ Testa geração de decisões
- ✅ Salva resultado em `test_decisoes_mock.json`

**Exemplo de output:**
```
🧪 TESTE DO MOTOR DE INTELIGÊNCIA FINANCEIRA
====================================================================

1️⃣ Testando cálculo de juros...
Valor original: R$ 5000.00
Dias de atraso: 30
Multa (2%): R$ 100.00
Juros (1% a.m.): R$ 50.00
Total com acréscimos: R$ 5150.00
Acréscimo: 3.00%

2️⃣ Testando processamento de contas a pagar...
📊 RESUMO:
   Contas vencidas: 2
   Total vencido: R$ 8796.50
   Juros acumulados: R$ 196.50
   Vence hoje: 1
   Total vence hoje: R$ 2000.00

🚨 CONTAS VENCIDAS (top prioridades):
   • Fornecedor Carl Zeiss - Lentes
     Valor original: R$ 5000.00 | Total: R$ 5150.00
     PAGAR URGENTE! Evitar mais R$ 50.00 de juros
```

---

## Opção 2: Teste Completo (COM Supabase)

### 1. Configure as credenciais

Edite `backend/src/financial_intelligence_engine.py`:

```python
if __name__ == "__main__":
    # Suas credenciais do Supabase
    SUPABASE_URL = "https://seu-projeto.supabase.co"
    SUPABASE_KEY = "sua-chave-service"
    
    executar_analise_enterprise(SUPABASE_URL, SUPABASE_KEY)
```

Ou crie um `.env`:
```env
SUPABASE_URL=https://seu-projeto.supabase.co
SUPABASE_SERVICE_KEY=sua-chave-service
```

### 2. Execute a análise

```bash
cd backend
python -m src.financial_intelligence_engine
```

**Resultado salvo em**: `data/analysis/decisoes_hoje.json`

### 3. Veja o resultado no terminal

```
📋 RESUMO EXECUTIVO
====================================================================

🚨 ALERTAS CRÍTICOS:
   🚨 15 contas VENCIDAS com R$ 3.452,80 de JUROS acumulados!

💼 AÇÕES PARA HOJE:
   💰 8 contas vencem HOJE - Total: R$ 12.340,00
   💵 Cobrar R$ 5.800,00 de clientes inadimplentes

💡 INSIGHTS:
   ⭐ Matriz - Centro é a loja MAIS RENTÁVEL com R$ 45.230,00 de lucro no mês
   ⚠️ Ciclo de caixa de 4 dias está NEGATIVO para a empresa!
```

---

## Opção 3: Teste no Frontend (Interface Completa)

### 1. Configure o Supabase no frontend

Edite `frontend/.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://seu-projeto.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-chave-anon
```

### 2. Inicie o servidor

```bash
cd frontend
npm run dev
```

### 3. Acesse o Dashboard

Abra: http://localhost:3001/dashboard/decisoes

**O que você verá:**
- 🚨 Alertas Críticos em vermelho
- 💼 Ações para Hoje em laranja
- 📊 Resumo Financeiro (4 cards)
- 💡 Insights do Negócio
- ⚡ Indicadores Enterprise (DSO, DPO, Ciclo)
- 👥 Ranking de Lojas
- 💰 Top 10 Fornecedores

---

## 🔍 Estrutura dos Dados

### Exemplo de Decisão Gerada

```json
{
  "data_analise": "2025-01-15",
  "alertas_criticos": [
    {
      "tipo": "CONTAS_VENCIDAS",
      "severidade": "CRÍTICA",
      "mensagem": "🚨 15 contas VENCIDAS com R$ 3.452,80 de JUROS acumulados!",
      "valor": 47250.50,
      "acao": "Pagar URGENTEMENTE as top 10 maiores"
    }
  ],
  "acoes_hoje": [
    {
      "tipo": "PAGAMENTOS_HOJE",
      "mensagem": "💰 8 contas vencem HOJE - Total: R$ 12.340,00",
      "detalhes": [
        {
          "id": "uuid",
          "descricao": "Aluguel Loja Matriz",
          "fornecedor": "Imobiliária XYZ",
          "loja": "Matriz - Centro",
          "valor_original": 5000.00,
          "vencimento": "2025-01-15",
          "prioridade": "ALTA",
          "acao": "Pagar HOJE para evitar juros"
        }
      ]
    }
  ],
  "insights": [
    {
      "tipo": "PERFORMANCE_LOJA",
      "mensagem": "⭐ Matriz - Centro é a loja MAIS RENTÁVEL com R$ 45.230,00 de lucro no mês"
    }
  ],
  "dados_completos": {
    "contas_a_pagar": { ... },
    "contas_a_receber": { ... },
    "analise_centros_custo": { ... },
    "indicadores_enterprise": {
      "dso": 12.5,
      "dpo": 8.2,
      "ciclo_caixa": 4.3,
      "interpretacao": { ... }
    }
  }
}
```

---

## 🐛 Troubleshooting

### Erro: "ModuleNotFoundError: No module named 'supabase'"

```bash
cd backend
pip install -r requirements.txt
```

### Erro: "Cannot find module '@/hooks/useFinancialIntelligence'"

```bash
cd frontend
npm install
```

### Dados não aparecem no frontend

**Verifique:**
1. ✅ Credenciais do Supabase em `frontend/.env.local`
2. ✅ Dados importados no banco (executar import scripts)
3. ✅ RLS (Row Level Security) configurado corretamente
4. ✅ Console do navegador para erros

---

## 📊 Próximos Passos

Após testar e validar:

1. **Popular banco com dados reais**
   ```bash
   cd backend
   python import_to_supabase.py
   ```

2. **Criar API endpoint** para integrar Python + Next.js

3. **Configurar atualização automática** (cron jobs)

4. **Expandir dashboards** (detalhamento de contas a pagar/receber)

---

## ✅ Checklist de Validação

- [ ] Teste rápido executou sem erros
- [ ] Cálculo de juros está correto (2% multa + 1% a.m.)
- [ ] Classificação por urgência funcionando
- [ ] Análise por loja mostra ranking correto
- [ ] DSO/DPO/Ciclo de Caixa calculando
- [ ] Frontend carrega sem erros
- [ ] Dashboard de Decisões aparece no menu
- [ ] Cards mostram dados (mesmo que mockados)
- [ ] Alertas críticos destacados em vermelho
- [ ] Performance é aceitável (<2s para carregar)

---

**Última atualização**: Janeiro 2025  
**Versão**: 1.0 - Motor de Inteligência Financeira  
**Status**: Pronto para testes 🚀