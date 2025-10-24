#!/bin/bash
# 🚀 Script de Execução Rápida - Povoamento PULSO Finance
# Execute este arquivo ou copie os comandos abaixo

# ============================================================================
# CONFIGURAÇÃO - Defina suas credenciais do Supabase
# ============================================================================

export DB_HOST="db.fxsgphqzazcbjcyfqeyg.supabase.co"
export DB_PORT="5432"
export DB_NAME="postgres"
export DB_USER="postgres"
export DB_PASSWORD="Kt12jyh2815t@"  # ⚠️ ALTERE SE NECESSÁRIO

# ============================================================================
# OPÇÃO 1: MODO NORMAL (Recomendado para produção)
# ============================================================================
# ✅ Seguro e confiável
# ⏱️ Tempo: 10-15 minutos

echo "🚀 Executando povoamento em modo NORMAL..."
python scripts/orquestrar_povoamento_local.py

# ============================================================================
# OPÇÃO 2: MODO TURBO (Mais rápido, menos seguro)
# ============================================================================
# 🔥 2-3x mais rápido
# ⚠️ Aceita risco de perda em crash do servidor
# ⏱️ Tempo: 5-8 minutos

# echo "🔥 Executando povoamento em modo TURBO..."
# python scripts/orquestrar_povoamento_local.py --turbo

# ============================================================================
# PÓS-EXECUÇÃO: Verificar resultados
# ============================================================================
# O script já executa as validações automaticamente
# Você verá um resumo completo ao final da execução

echo "✅ Povoamento concluído!"
echo "📊 Verifique os logs acima para confirmar os resultados"
