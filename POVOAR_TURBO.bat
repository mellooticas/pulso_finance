@echo off
REM 🚀 Povoamento PULSO Finance - Modo Turbo
REM Execute este arquivo no prompt de comando do Windows

echo ======================================================================
echo 🚀 POVOAMENTO PULSO FINANCE - MODO TURBO
echo ======================================================================
echo.

REM Configurar credenciais
set DB_HOST=db.fxsgphqzazcbjcyfqeyg.supabase.co
set DB_PORT=5432
set DB_NAME=postgres
set DB_USER=postgres
set DB_PASSWORD=Kt12jyh2815t@

echo 🔑 Credenciais configuradas
echo 📍 Host: %DB_HOST%
echo 👤 User: %DB_USER%
echo.

REM Ativar ambiente virtual
call .venv\Scripts\activate.bat

echo ⚡ Executando em MODO TURBO...
echo ⏱️  Tempo estimado: 5-8 minutos
echo.

REM Executar orquestrador em modo turbo
python scripts\orquestrar_povoamento_local.py --turbo

echo.
echo ======================================================================
echo ✅ CONCLUÍDO!
echo ======================================================================
pause
