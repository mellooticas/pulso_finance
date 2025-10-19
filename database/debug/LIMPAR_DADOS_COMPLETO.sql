-- =============================================
-- SCRIPT PARA LIMPAR TODOS OS DADOS - PULSO FINANCE
-- Respeita a ordem das foreign keys
-- =============================================

-- ⚠️ ATENÇÃO: Este script apaga TODOS OS DADOS!
-- Execute apenas se tem certeza que quer limpar tudo

-- 🚨 Backup de segurança (execute antes de apagar)
SELECT 
  'BACKUP - Lançamentos: ' || COUNT(*) as "Info"
FROM lancamentos
UNION ALL
SELECT 
  'BACKUP - Parcelas: ' || COUNT(*) as "Info"  
FROM parcelas;


| Info                        |
| --------------------------- |
| BACKUP - Lançamentos: 21351 |
| BACKUP - Parcelas: 21351    |

-- 📋 STEP 1: Apagar tabelas FILHAS primeiro (que referenciam outras)
-- Ordem correta: parcelas → lancamentos → outras tabelas

-- 1.1 Apagar PARCELAS (referencia lancamentos)
DELETE FROM parcelas;

-- 1.2 Apagar LANÇAMENTOS (referencia lojas, plano_contas, etc)  
DELETE FROM lancamentos;

-- 📊 STEP 2: Apagar dados de outras tabelas filhas (se necessário)
-- DELETE FROM movimentacoes_bancarias; -- Se existir
-- DELETE FROM conciliacoes; -- Se existir

-- 🏢 STEP 3: Resetar sequências (se houver campos AUTO INCREMENT)
-- ALTER SEQUENCE IF EXISTS lancamentos_id_seq RESTART WITH 1;
-- ALTER SEQUENCE IF EXISTS parcelas_id_seq RESTART WITH 1;

-- ✅ STEP 4: Verificar que está tudo limpo
SELECT 
  'lancamentos' as "Tabela",
  COUNT(*) as "Registros Restantes"
FROM lancamentos
UNION ALL
SELECT 
  'parcelas' as "Tabela", 
  COUNT(*) as "Registros Restantes"
FROM parcelas
UNION ALL
SELECT 
  'lojas' as "Tabela",
  COUNT(*) as "Registros Restantes" 
FROM lojas
UNION ALL
SELECT 
  'plano_contas' as "Tabela",
  COUNT(*) as "Registros Restantes"
FROM plano_contas;

| Tabela       | Registros Restantes |
| ------------ | ------------------- |
| lancamentos  | 0                   |
| parcelas     | 0                   |
| lojas        | 7                   |
| plano_contas | 72                  |


-- Execute este script corrigido:

-- 🗑️ EXECUTAR LIMPEZA AGORA:
DELETE FROM parcelas;
DELETE FROM lancamentos;

-- ✅ Verificar resultado:
SELECT 
  'lancamentos' as "Tabela",
  COUNT(*) as "Registros Restantes"
FROM lancamentos
UNION ALL
SELECT 
  'parcelas' as "Tabela", 
  COUNT(*) as "Registros Restantes"
FROM parcelas;

-- 🎯 Resultado esperado:
-- lancamentos: 0
-- parcelas: 0  
-- lojas: 7 (mantidas)
-- plano_contas: X (mantidos)

-- ✅ Agora você pode importar os novos dados!