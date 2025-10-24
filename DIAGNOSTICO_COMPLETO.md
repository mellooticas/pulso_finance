# 🔧 DIAGNÓSTICO COMPLETO DO SISTEMA

## Status Atual (Verificado)

### ✅ API ML (Porta 8000)
- **Status:** FUNCIONANDO
- **Health:** 200 OK
- **Supabase:** Conectado
- **CORS:** Configurado para http://localhost:3000
- **Endpoint:** http://localhost:8000/api/ml/health

### ✅ Frontend Next.js (Porta 3000)
- **Status:** FUNCIONANDO (redirecionando para /login)
- **Processos Node:** 5 processos ativos
- **Porta:** 3000 LISTENING

### ✅ Integração
- **Teste Python → API:** 200 OK ✅
- **Previsão ML:** 358 dias históricos → 30 dias previsão ✅
- **CORS:** Access-Control-Allow-Origin: http://localhost:3000 ✅

---

## 🧪 Como Testar no Navegador

### Opção 1: Página de Teste HTML

1. **Abra o arquivo de teste:**
   ```
   d:\projetos\pulso_finance\teste_api_ml.html
   ```

2. **Abra no navegador** (duplo clique ou File → Open)

3. **Execute os 4 testes:**
   - ✅ Health Check
   - ✅ Listar Lojas
   - ✅ Previsão ML (Mauá)
   - ✅ CORS

4. **Abra DevTools (F12):**
   - Console: veja logs de requisição
   - Network: veja detalhes das chamadas
   - Se houver erro CORS, aparecerá em vermelho

---

### Opção 2: Console do Navegador

1. **Acesse:** http://localhost:3000/dashboard/previsoes

2. **Abra DevTools (F12) → Console**

3. **Cole e execute:**

```javascript
// Teste 1: Health Check
fetch('http://localhost:8000/api/ml/health')
  .then(r => r.json())
  .then(d => console.log('✅ Health:', d))
  .catch(e => console.error('❌ Erro:', e))

// Teste 2: Previsão ML
fetch('http://localhost:8000/api/ml/forecast/receitas', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    loja_id: 'bde8c647-89f8-4a02-8c19-77bc47ee7aaf',
    periods: 30,
    tipo: 'receitas'
  })
})
  .then(r => r.json())
  .then(d => console.log('✅ Previsão:', d))
  .catch(e => console.error('❌ Erro:', e))
```

---

## 🐛 Problemas Comuns e Soluções

### Problema 1: "Failed to fetch" ou "CORS error"

**Sintoma:** Erro no console do navegador
```
Access to fetch at 'http://localhost:8000' from origin 'http://localhost:3000' 
has been blocked by CORS policy
```

**Solução:**
```bash
# Reiniciar API ML com CORS correto
cd apps/ml
taskkill //F //IM python.exe
python main.py
```

**Verificar:** O arquivo `apps/ml/main.py` deve ter:
```python
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000", "http://localhost:3001"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
```

---

### Problema 2: "Connection refused" ou "ERR_CONNECTION_REFUSED"

**Sintoma:** Não consegue conectar na porta 8000

**Solução:**
```bash
# Verificar se API está rodando
netstat -ano | grep 8000

# Se NÃO aparecer nada, iniciar API:
cd apps/ml
python main.py
```

---

### Problema 3: "404 Not Found" nas rotas

**Sintoma:** API responde mas rota não existe

**Verificação:**
```bash
# Testar rotas disponíveis
curl http://localhost:8000/docs  # Swagger UI
curl http://localhost:8000/api/ml/health
```

**Rotas corretas:**
- `GET  /api/ml/health`
- `POST /api/ml/forecast/receitas`
- `POST /api/ml/forecast/despesas`
- `POST /api/ml/forecast/fluxo-caixa`

---

### Problema 4: Frontend carrega mas não mostra dados

**Sintoma:** Página abre, mas sem previsões

**Checklist:**
1. ✅ API rodando? → `curl http://localhost:8000/api/ml/health`
2. ✅ Loja selecionada? → DevTools → localStorage → `selectedLojaId`
3. ✅ Dados suficientes? → Selecionar "Mauá" (12.042 parcelas)
4. ✅ Erros no console? → F12 → Console (procurar vermelho)

**Solução:**
```javascript
// No console do navegador:
localStorage.setItem('selectedLojaId', 'bde8c647-89f8-4a02-8c19-77bc47ee7aaf')
location.reload()
```

---

### Problema 5: "Dados insuficientes" para Mauá

**Sintoma:** Erro 400 mesmo na loja Mauá

**Verificação:**
```bash
cd apps/ml
python -c "
from supabase import create_client
supabase = create_client(
    'https://fxsgphqzazcbjcyfqeyg.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4c2dwaHF6YXpjYmpjeWZxZXlnIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc2MDQ2OTU0OCwiZXhwIjoyMDc2MDQ1NTQ4fQ.tfb9GKEBsrNo1ll3acE9ZZgqwmi_LiPnZY2N9-AF8u0'
)
result = supabase.table('parcelas') \
    .select('id, lancamentos!inner(loja_id)', count='exact') \
    .eq('status', 'pago') \
    .eq('lancamentos.loja_id', 'bde8c647-89f8-4a02-8c19-77bc47ee7aaf') \
    .execute()
print(f'Parcelas pagas na Mauá: {result.count}')
"
```

**Esperado:** `Parcelas pagas na Mauá: 12042`

---

## 📊 Comandos Úteis

### Verificar Serviços
```bash
# Portas abertas
netstat -ano | grep -E ":(3000|8000)" | grep LISTENING

# Processos Node
tasklist | grep node

# Processos Python
tasklist | grep python
```

### Reiniciar Serviços
```bash
# Frontend
cd frontend
npm run dev

# API ML
cd apps/ml
python main.py
```

### Logs em Tempo Real
```bash
# API ML já mostra logs no terminal onde foi executada

# Frontend
cd frontend
npm run dev
# Logs aparecem no terminal E no navegador (DevTools)
```

---

## ✅ Checklist Final

Execute este checklist para garantir que tudo está funcionando:

- [ ] API ML rodando na porta 8000
- [ ] Frontend rodando na porta 3000
- [ ] Health check retorna 200 OK
- [ ] CORS header presente
- [ ] Loja Mauá tem 12.042 parcelas
- [ ] Previsão ML retorna 200 OK
- [ ] Frontend carrega sem erros no console
- [ ] Seletor de lojas mostra badges com contagem
- [ ] Mauá aparece primeiro na lista
- [ ] Clicar "Atualizar" gera previsões

---

## 🎯 Teste Rápido de 30 Segundos

```bash
# 1. API funcionando?
curl http://localhost:8000/api/ml/health

# 2. Previsão funciona?
curl -X POST http://localhost:8000/api/ml/forecast/receitas \
  -H "Content-Type: application/json" \
  -d '{"loja_id":"bde8c647-89f8-4a02-8c19-77bc47ee7aaf","periods":30,"tipo":"receitas"}'

# 3. Frontend acessível?
curl http://localhost:3000
```

**Se todos retornarem 200 OK → Sistema funcionando! 🎉**

---

## 🆘 Ainda com Problemas?

1. **Abra:** `teste_api_ml.html` no navegador
2. **Execute todos os 4 testes**
3. **Tire screenshot dos resultados**
4. **Abra DevTools (F12) → Console → tire screenshot de erros**
5. **Compartilhe os screenshots**

Isso nos dará visibilidade total do que está acontecendo!
