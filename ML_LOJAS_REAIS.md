# 🎯 ML FOCADO EM LOJAS REAIS

## Problema Identificado

O sistema estava tratando todas as 10 lojas igualmente, mas apenas **1 loja** possui dados reais:
- **Mauá**: 12.042 parcelas pagas ✅ REAL
- **Outras 9 lojas**: 0 parcelas ❌ VAZIAS

## Soluções Implementadas

### 1. ✅ Hook Inteligente `useLojasComDados`

**Arquivo:** `frontend/src/hooks/useLojasComDados.ts`

**Funcionalidades:**
- ✅ Busca lojas ativas do Supabase
- ✅ Conta parcelas pagas para cada loja
- ✅ **Ordena automaticamente**: lojas com dados primeiro
- ✅ Retorna `parcelas_pagas` junto com os dados da loja

**Código:**
```typescript
interface Loja {
  id: string
  nome: string
  parcelas_pagas: number  // ← NOVO!
}

// Ordenação automática: Mauá (12k) aparece primeiro
lojasOrdenadas.sort((a, b) => 
  b.parcelas_pagas - a.parcelas_pagas
)
```

---

### 2. ✅ Seletor de Lojas Melhorado

**Arquivo:** `frontend/src/app/dashboard/previsoes/page.tsx`

**Mudanças:**

#### Antes:
```tsx
<Select>
  <SelectItem value={loja.id}>
    {loja.nome}  // Só o nome
  </SelectItem>
</Select>
```

#### Depois:
```tsx
<Select>
  <SelectItem value={loja.id}>
    <div className="flex items-center justify-between">
      <span>{loja.nome}</span>
      {loja.parcelas_pagas > 0 ? (
        <Badge variant="outline">
          {loja.parcelas_pagas.toLocaleString('pt-BR')}
        </Badge>
      ) : (
        <Badge variant="secondary">
          Sem dados
        </Badge>
      )}
    </div>
  </SelectItem>
</Select>
```

**Visual:**
```
┌─────────────────────────────────────┐
│ ▼ Mauá                    [12.042] │  ← REAL
│   Perdizes            [Sem dados]  │  ← VAZIA
│   Rio Claro          [Sem dados]  │  ← VAZIA
│   ...                              │
└─────────────────────────────────────┘
```

---

### 3. ✅ Aviso Inteligente para Lojas Vazias

**Quando usuário seleciona loja SEM dados:**

```tsx
┌─────────────────────────────────────────────────────────┐
│ ⚠️ Loja sem dados: A loja selecionada não possui       │
│    lançamentos pagos registrados.                       │
│                                                         │
│ 💡 Dica: Selecione Mauá que possui 12.042 parcelas     │
│         pagas.                                          │
└─────────────────────────────────────────────────────────┘
```

---

## Benefícios

### 🚀 **Para o Usuário:**
1. **Clareza Imediata**: Vê quantas parcelas cada loja tem
2. **Menos Frustração**: Não tenta gerar previsão para loja vazia
3. **Orientação Inteligente**: Sistema sugere automaticamente Mauá

### 🤖 **Para o ML:**
1. **Foco em Dados Reais**: Prioriza lojas com histórico suficiente
2. **Menos Erros**: Evita tentar treinar Prophet com dados insuficientes
3. **Performance**: Não desperdiça tempo processando lojas vazias

### 📊 **Para o Sistema:**
1. **Escalável**: Quando mais lojas tiverem dados, aparecerão automaticamente no topo
2. **Transparente**: Usuário entende o estado dos dados
3. **Educativo**: Ensina qual loja usar para ML

---

## Comportamento Atual

### 🎯 **Ao Abrir a Página:**
1. Hook busca lojas + contagem de parcelas
2. Lista ordenada: **Mauá (12k) → outras 9 (0)**
3. Seleção automática: **Mauá** (primeira com dados)
4. Usuário vê badges mostrando contagem

### ⚠️ **Se Trocar para Loja Vazia:**
1. Alert vermelho aparece
2. Sugere voltar para Mauá
3. Botão "Atualizar" continua funcionando (retorna erro 400 do backend)

### ✅ **Se Manter em Mauá:**
1. Nenhum aviso
2. Previsões funcionam perfeitamente
3. 358 dias históricos → 30 dias de forecast

---

## Testes Realizados

```bash
# Verificação das lojas
✓ Mauá: 12.042 parcelas pagas
✓ Outras 9: 0 parcelas

# ML API
✓ POST /api/ml/forecast/receitas → 200 OK (Mauá)
✓ POST /api/ml/forecast/receitas → 400 Bad Request (Perdizes/Rio Claro)

# Frontend
✓ Hook useLojasComDados: ordena corretamente
✓ Badges mostram contagem
✓ Aviso aparece para lojas vazias
✓ 0 erros de compilação
```

---

## Próximos Passos (Quando Houver Mais Dados)

Quando outras lojas forem povoadas:
1. ✅ Aparecerão automaticamente no topo (se tiverem > 12k parcelas)
2. ✅ Badges atualizarão com as contagens
3. ✅ ML funcionará para múltiplas lojas
4. ✅ Usuário poderá comparar previsões

**Sistema pronto para escalar! 🚀**

---

## Arquivos Modificados

```
📁 frontend/
  📁 src/
    📁 hooks/
      ✨ useLojasComDados.ts  (NOVO - 70 linhas)
    📁 app/
      📁 dashboard/
        📁 previsoes/
          ✏️ page.tsx  (MODIFICADO - +35 linhas)
```

---

## Comandos para Verificar

```bash
# Ver lojas e contagem de dados
cd apps/ml && python check_lojas_reais.py

# Testar ML com múltiplas lojas
python -c "
import requests
lojas = [
  ('bde8c647-89f8-4a02-8c19-77bc47ee7aaf', 'Mauá'),
  ('ef0c9c63-5395-4ba6-8eec-f6d182f41210', 'Perdizes')
]
for loja_id, nome in lojas:
  r = requests.post('http://localhost:8000/api/ml/forecast/receitas',
    json={'loja_id': loja_id, 'periods': 30})
  print(f'{nome}: {r.status_code}')
"

# Ver frontend
# Abrir http://localhost:3000/dashboard/previsoes
# Trocar entre lojas e ver badges + avisos
```

---

**Status:** ✅ **IMPLEMENTADO E TESTADO**
**Data:** 23/10/2025
**Resultado:** Sistema agora foca inteligentemente na loja Mauá (única com dados reais)
