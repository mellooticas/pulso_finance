# 🚀 Script de Execução Rápida - Povoamento PULSO Finance
# Execute este arquivo ou copie os comandos abaixo no PowerShell

# ============================================================================
# CONFIGURAÇÃO - Defina suas credenciais do Supabase
# ============================================================================

$env:DB_HOST="db.fxsgphqzazcbjcyfqeyg.supabase.co"
$env:DB_PORT="5432"
$env:DB_NAME="postgres"
$env:DB_USER="postgres"
$env:DB_PASSWORD="Kt12jyh2815t@"  # ⚠️ ALTERE SE NECESSÁRIO

# ============================================================================
# OPÇÃO 1: MODO NORMAL (Recomendado para produção)
# ============================================================================
# ✅ Seguro e confiável
# ⏱️ Tempo: 10-15 minutos

Write-Host "🚀 Executando povoamento em modo NORMAL..." -ForegroundColor Green
python scripts/orquestrar_povoamento_local.py

# ============================================================================
# OPÇÃO 2: MODO TURBO (Mais rápido, menos seguro)
# ============================================================================
# 🔥 2-3x mais rápido
# ⚠️ Aceita risco de perda em crash do servidor
# ⏱️ Tempo: 5-8 minutos

# Write-Host "🔥 Executando povoamento em modo TURBO..." -ForegroundColor Red
# python scripts/orquestrar_povoamento_local.py --turbo

# ============================================================================
# PÓS-EXECUÇÃO: Verificar resultados
# ============================================================================
# O script já executa as validações automaticamente
# Você verá um resumo completo ao final da execução

Write-Host "`n✅ Povoamento concluído!" -ForegroundColor Green
Write-Host "📊 Verifique os logs acima para confirmar os resultados" -ForegroundColor Cyan
