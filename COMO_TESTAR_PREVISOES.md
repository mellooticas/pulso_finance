# 🧪 GUIA DE TESTE - PREVISÕES ML

## ✅ PASSO A PASSO PARA TESTAR AGORA

---

## 📋 PRÉ-REQUISITOS

Antes de começar, verifique:
- [ ] Python 3.9+ instalado
- [ ] Node.js 18+ instalado
- [ ] Frontend já rodando em `localhost:3000`
- [ ] Dados no Supabase (mínimo 30 dias)

---

## 🚀 PASSO 1: INSTALAR DEPENDÊNCIAS PYTHON

### Windows (PowerShell):
```powershell
# Navegar para o diretório
cd D:\projetos\pulso_finance\apps\ml

# Criar ambiente virtual
python -m venv venv

# Ativar ambiente virtual
.\venv\Scripts\Activate.ps1

# Instalar dependências
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Alternativa rápida:
```powershell
cd D:\projetos\pulso_finance
.\setup_ml.bat
```

---

## 🔧 PASSO 2: CONFIGURAR VARIÁVEIS DE AMBIENTE

### 2.1. Copiar .env do frontend:
```powershell
cd D:\projetos\pulso_finance\apps\ml
copy ..\..\frontend\.env.local .env
```

### 2.2. Editar .env e adicionar Service Role Key:
```bash
# Abra apps/ml/.env no editor

# Adicione esta linha (obtenha a key no Supabase Dashboard):
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**🔑 Como obter Service Role Key:**
1. Acesse: https://supabase.com/dashboard/project/xocjltqzaojqzdpnajfo/settings/api
2. Copie: **"service_role"** key (⚠️ secreta, não exponha)
3. Cole no `.env`

---

## 🏃 PASSO 3: INICIAR API ML

```powershell
cd D:\projetos\pulso_finance\apps\ml

# Ativar ambiente virtual (se ainda não ativou)
.\venv\Scripts\Activate.ps1

# Iniciar servidor
python main.py
```

**Saída esperada:**
```
INFO:     Uvicorn running on http://0.0.0.0:8000 (Press CTRL+C to quit)
INFO:     Started reloader process [xxxxx]
INFO:     Started server process [xxxxx]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

✅ **API rodando em:** `http://localhost:8000`

**Deixe este terminal aberto!**

---

## 🧪 PASSO 4: TESTAR A API (OPCIONAL)

### 4.1. Health Check:
```powershell
# Em um NOVO terminal PowerShell
curl http://localhost:8000/api/ml/health
```

**Resposta esperada:**
```json
{
  "status": "healthy",
  "supabase": "connected",
  "timestamp": "2025-10-23T..."
}
```

### 4.2. Documentação Swagger:
Abra no navegador: `http://localhost:8000/docs`

Você verá:
- Interface interativa da API
- Todos os 4 endpoints
- Botão "Try it out" para testar

### 4.3. Testar Endpoint de Receitas:
```powershell
# Criar arquivo test-request.json
@"
{
  "loja_id": "7bc97a80-8f17-4f76-94ce-5a1eb2da5b8e",
  "periods": 30,
  "tipo": "receitas"
}
"@ | Out-File -Encoding utf8 test-request.json

# Fazer request
curl -X POST http://localhost:8000/api/ml/forecast/receitas `
  -H "Content-Type: application/json" `
  -d "@test-request.json"
```

**Se retornar erro "Dados insuficientes":**
- Significa que não há 30 dias de dados no banco
- Veja "SOLUÇÃO" abaixo

---

## 🌐 PASSO 5: TESTAR NO FRONTEND

### 5.1. Certifique-se que o frontend está rodando:
```powershell
# Em outro terminal
cd D:\projetos\pulso_finance\frontend
npm run dev
```

### 5.2. Acessar a página de previsões:

**Opção 1 - Via Menu:**
1. Abra: `http://localhost:3000/dashboard`
2. Clique no menu lateral: **Relatórios**
3. Clique: **🔮 Previsões ML**

**Opção 2 - Direto:**
1. Abra: `http://localhost:3000/dashboard/previsoes`

### 5.3. O que você deve ver:

✅ **Se tudo funcionar:**
- 4 cards de resumo com valores
- Seletor de período (7, 15, 30, 60, 90 dias)
- 4 tabs: Receitas / Despesas / Fluxo / Anomalias
- Tabelas com previsões
- Sem erros no console (F12)

❌ **Se aparecer erro:**
- Mensagem vermelha com instruções
- Verifique se API está rodando (localhost:8000)
- Verifique console do navegador (F12)

---

## 🐛 TROUBLESHOOTING

### Erro 1: "Dados insuficientes. Mínimo: 30 dias"

**Problema:** Não há lançamentos suficientes no banco

**Solução:** Verificar dados disponíveis:
```sql
-- Execute no Supabase SQL Editor
SELECT 
  tipo,
  COUNT(*) as total_lancamentos,
  MIN(data_competencia) as data_inicial,
  MAX(data_competencia) as data_final,
  COUNT(DISTINCT DATE(data_competencia)) as dias_unicos
FROM lancamentos
WHERE loja_id = '7bc97a80-8f17-4f76-94ce-5a1eb2da5b8e'
  AND status IN ('PAGO', 'RECEBIDO')
  AND data_competencia IS NOT NULL
GROUP BY tipo;
```

**Se < 30 dias:**
- Adicione mais lançamentos históricos
- Ou use outra loja_id com mais dados

### Erro 2: "Can't connect to Supabase"

**Problema:** Service Role Key inválida

**Solução:**
1. Verifique `apps/ml/.env`
2. Confirme que SUPABASE_SERVICE_ROLE_KEY está presente
3. Teste health check: `curl http://localhost:8000/api/ml/health`

### Erro 3: "ModuleNotFoundError: No module named 'prophet'"

**Problema:** Dependências não instaladas

**Solução:**
```powershell
cd D:\projetos\pulso_finance\apps\ml
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

### Erro 4: Frontend não conecta com API

**Problema:** CORS ou API não está rodando

**Solução:**
1. Verifique se API está em `localhost:8000`
2. Verifique console do navegador (F12)
3. Teste health check
4. Reinicie API se necessário

### Erro 5: "Address already in use (port 8000)"

**Problema:** Porta 8000 já está ocupada

**Solução:**
```powershell
# Encontrar processo na porta 8000
netstat -ano | findstr :8000

# Matar processo (substitua PID)
taskkill /PID <numero-do-pid> /F

# Ou usar outra porta
uvicorn main:app --reload --port 8001
```

---

## 📊 VALIDAÇÃO COMPLETA

### Checklist de Teste:

#### Backend (API ML)
- [ ] `python main.py` inicia sem erros
- [ ] `http://localhost:8000` responde
- [ ] `http://localhost:8000/docs` abre Swagger
- [ ] `http://localhost:8000/api/ml/health` retorna "healthy"
- [ ] POST /api/ml/forecast/receitas retorna JSON
- [ ] POST /api/ml/forecast/despesas retorna JSON
- [ ] POST /api/ml/forecast/fluxo-caixa retorna JSON

#### Frontend (React)
- [ ] `http://localhost:3000/dashboard/previsoes` carrega
- [ ] 4 cards de resumo aparecem
- [ ] Valores nos cards são números reais (não 0)
- [ ] Seletor de período funciona
- [ ] Tab "Receitas" mostra tabela
- [ ] Tab "Despesas" mostra tabela
- [ ] Tab "Fluxo de Caixa" mostra resumo
- [ ] Tab "Anomalias" mostra detecção (se houver)
- [ ] Botão "Atualizar" funciona
- [ ] Sem erros no console (F12)

#### Dados
- [ ] Previsões têm valores > 0
- [ ] Datas futuras (após hoje)
- [ ] Intervalos de confiança (lower < predicted < upper)
- [ ] Tendência mostra direção e %
- [ ] Anomalias detectadas (se houver outliers)

---

## 📸 SCREENSHOTS ESPERADOS

### 1. API Swagger (localhost:8000/docs)
```
PULSO Finance ML API
Version: 1.0.0

Endpoints:
  GET  /
  GET  /api/ml/health
  POST /api/ml/forecast/receitas
  POST /api/ml/forecast/despesas
  POST /api/ml/forecast/fluxo-caixa
```

### 2. Frontend - Cards de Resumo
```
┌─────────────────────┬─────────────────────┐
│ Receitas Previstas  │ Despesas Previstas  │
│ R$ 375.000,00       │ R$ 240.000,00       │
│ ↗ +5.2%             │ ↗ +2.1%             │
└─────────────────────┴─────────────────────┘
┌─────────────────────┬─────────────────────┐
│ Saldo Final Previsto│ Períodos Críticos   │
│ R$ 135.000,00       │ 3 dias              │
│ [Positivo]          │ ⚠️                  │
└─────────────────────┴─────────────────────┘
```

### 3. Tabela de Previsões
```
Data        Previsto      Limite Inferior  Limite Superior
24/out      R$ 12.500,50  R$ 10.000,00    R$ 15.000,00
25/out      R$ 13.200,30  R$ 10.500,00    R$ 15.900,00
...
```

---

## 🎯 TESTE RÁPIDO (5 MINUTOS)

**Se você só quer confirmar que funciona:**

```powershell
# 1. Instalar (1 min)
cd D:\projetos\pulso_finance
.\setup_ml.bat

# 2. Configurar .env (30 seg)
# Edite apps/ml/.env e adicione SUPABASE_SERVICE_ROLE_KEY

# 3. Iniciar API (30 seg)
cd apps\ml
.\venv\Scripts\Activate.ps1
python main.py

# 4. Abrir navegador (30 seg)
# http://localhost:3000/dashboard/previsoes

# 5. Verificar (2 min)
# - Cards com valores
# - Tabelas populadas
# - Sem erros
```

**Total: 5 minutos** ⏱️

---

## 💡 DICAS PRO

### 1. Usar dados de exemplo
Se não tiver dados reais, modifique `prophet_engine.py` para usar dados sintéticos:
```python
# No final do arquivo, descomentar seção __main__
if __name__ == '__main__':
    # Dados de exemplo estão lá
```

### 2. Ajustar período
Comece com períodos curtos (7 dias) para testes rápidos:
```
Seletor: 7 dias → Atualizar
```

### 3. Ver logs detalhados
```python
# Em apps/ml/main.py, adicione:
import logging
logging.basicConfig(level=logging.DEBUG)
```

### 4. Testar com Postman
Importe esta collection: `http://localhost:8000/openapi.json`

### 5. Monitor em tempo real
```powershell
# Terminal 1: API
python main.py

# Terminal 2: Logs
Get-Content -Path "api.log" -Wait  # Se configurar logging
```

---

## 📞 SUPORTE

### Se nada funcionar:

**1. Verifique versões:**
```powershell
python --version  # Deve ser 3.9+
node --version    # Deve ser 18+
npm --version
```

**2. Reinstale do zero:**
```powershell
# Remover ambiente virtual
cd D:\projetos\pulso_finance\apps\ml
Remove-Item -Recurse -Force venv

# Reinstalar
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
```

**3. Logs de erro:**
- API: Ver terminal onde rodou `python main.py`
- Frontend: F12 → Console (navegador)
- Supabase: Dashboard → Logs

---

## ✅ TESTE BEM-SUCEDIDO!

**Se você viu:**
- ✅ API rodando sem erros
- ✅ Cards com valores reais
- ✅ Tabelas populadas
- ✅ Previsões fazem sentido
- ✅ Sem erros no console

**🎉 PARABÉNS! Tudo funcionando!**

---

## 📝 PRÓXIMOS PASSOS APÓS TESTE

1. **Validar previsões:**
   - Compare com dados reais do mês anterior
   - Ajuste thresholds se necessário

2. **Coletar feedback:**
   - Usuários acham útil?
   - Previsões são confiáveis?

3. **Implementar melhorias:**
   - Gráficos interativos
   - Alertas automáticos
   - Exportação de relatórios

---

**Autor:** GitHub Copilot  
**Data:** 23/10/2025  
**Versão:** 1.0.0  

**Boa sorte com os testes! 🚀**
