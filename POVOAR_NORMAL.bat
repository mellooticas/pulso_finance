@echo off
REM 🚀 Povoamento PULSO Finance - Modo Normal (Seguro)
REM Execute este arquivo no prompt de comando do Windows

echo ======================================================================
echo 🚀 POVOAMENTO PULSO FINANCE - MODO NORMAL (SEGURO)
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

echo ✅ Executando em MODO NORMAL (seguro)...
echo ⏱️  Tempo estimado: 10-15 minutos
echo.

REM Executar orquestrador
python scripts\orquestrar_povoamento_local.py

echo.
echo ======================================================================
echo ✅ CONCLUÍDO!
echo ======================================================================
pause
