# 🚀 GUIA RÁPIDO DE EXECUÇÃO

## ⚡ MODO MAIS RÁPIDO (Recomendado)

### Windows CMD/PowerShell
```cmd
# Simplesmente clique duas vezes no arquivo:
POVOAR_TURBO.bat

# Ou execute no terminal:
.\POVOAR_TURBO.bat
```

**⏱️ Tempo: 5-8 minutos**  
**🔥 Modo: Turbo (synchronous_commit=OFF)**

---

## ✅ MODO SEGURO (Produção)

### Windows CMD/PowerShell
```cmd
# Clique duas vezes ou execute:
.\POVOAR_NORMAL.bat
```

**⏱️ Tempo: 10-15 minutos**  
**✅ Modo: Normal (seguro)**

---

## 📊 O QUE VAI ACONTECER

1. ✅ **Limpeza** - Trunca todas as tabelas
2. ✅ **Lojas** - 10 lojas
3. ✅ **Plano de Contas** - 120 contas (6 lotes)
4. ✅ **Centros de Custo** - 11 centros
5. ✅ **Contas Financeiras** - 16 contas
6. ✅ **Fornecedores** - 12.815 fornecedores
7. ✅ **Classificação** - Ajusta categorias
8. ✅ **Transacionais** - 42.863 lançamentos + parcelas
9. ✅ **Validações** - Verifica integridade

---

## 📈 LOGS DE PROGRESSO

Você verá algo assim:

```
🚀 ORQUESTRADOR DE POVOAMENTO - MODO TURBO SUPABASE
======================================================================

⚡ Otimizações ativas:
   • Commits em lotes grandes (2000 instruções)
   • work_mem = 256MB para operações bulk
   • Transações agressivas
   • Streaming eficiente de arquivos grandes

⏱️  Tempo estimado: 5-15 minutos (dependendo da rede)

🔌 Conectando em db.xxx.supabase.co:5432/postgres...
   🔥 synchronous_commit = OFF (modo turbo)
✅ Conexão OK + otimizações de performance ativadas

▶️  Executando: database/seeds/01_limpar_banco.sql
   📦 Tamanho: 2.3 KB
✅ Concluído: 01_limpar_banco.sql

...

▶️  Executando transacionais (streaming): database/seeds/03_povoar_transacionais.sql
   ⚡ Modo turbo: commits a cada 2000 instruções
   💾 Commit: 2,000 instruções (2000 neste lote)
   💾 Commit: 4,000 instruções (2000 neste lote)
   💾 Commit: 6,000 instruções (2000 neste lote)
   ...

✅ Transacionais concluídos: 85,726 instruções executadas

🎉 Povoamento completo com sucesso.
```

---

## ⚠️ SE DER ERRO

### Erro de Conexão
```
❌ Falha de conexão: getaddrinfo failed
```
**Solução:** Verifique sua internet e credenciais no arquivo .bat

### Erro de Senha
```
❌ authentication failed
```
**Solução:** Abra o arquivo .bat e corrija a senha na linha:
```bat
set DB_PASSWORD=SUA_SENHA_AQUI
```

### Timeout
```
❌ timeout
```
**Solução:** 
1. Verifique sua conexão de internet
2. Execute em horário de menor carga
3. Use modo TURBO para ir mais rápido

---

## 🎯 APÓS A EXECUÇÃO

O script automaticamente executa as validações no final.

**Você verá:**
- ✅ Contagens por tabela
- ✅ Distribuição de categorias
- ✅ Checagens de integridade
- ✅ DRE sintética

**Se tudo estiver OK, você verá:**
```
🎉 Povoamento completo com sucesso.
```

---

## 🔧 MELHORIAS CONTÍNUAS

Conforme executarmos, podemos:
1. ⚡ Aumentar batch size (3000, 5000)
2. 🚀 Paralelizar mestres independentes
3. 📦 Usar COPY em vez de INSERT (10x mais rápido)
4. 🎯 Comprimir dados antes de enviar

**Vamos começar e otimizar no caminho!** 🚀

---

## 📞 PRÓXIMOS PASSOS

Depois de executar:

1. ✅ Revise os logs de validação
2. 🎨 Teste o frontend
3. 📊 Valide DRE e relatórios
4. 🔧 Me avise se precisar ajustar algo

**Execute agora: `.\POVOAR_TURBO.bat`** 🔥
