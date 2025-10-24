@echo off
REM 🔮 Setup ML API - PULSO Finance (Windows)

echo 🚀 Iniciando setup da API ML...
echo.

REM Verificar Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python não encontrado!
    echo    Instale Python 3.9+ em: https://www.python.org/downloads/
    pause
    exit /b 1
)

echo ✅ Python encontrado
python --version
echo.

REM Navegar para apps/ml
cd apps\ml

REM Criar ambiente virtual
echo 📦 Criando ambiente virtual...
python -m venv venv

REM Ativar ambiente virtual
call venv\Scripts\activate.bat

echo ✅ Ambiente virtual ativado
echo.

REM Instalar dependências
echo 📥 Instalando dependências...
python -m pip install --upgrade pip
pip install -r requirements.txt

if %errorlevel% equ 0 (
    echo ✅ Dependências instaladas com sucesso!
) else (
    echo ❌ Erro ao instalar dependências
    pause
    exit /b 1
)

echo.

REM Configurar .env
if not exist .env (
    echo ⚙️  Configurando variáveis de ambiente...
    
    if exist ..\..\frontend\.env.local (
        copy ..\..\frontend\.env.local .env
        echo ✅ .env criado a partir do frontend\.env.local
    ) else (
        echo ⚠️  frontend\.env.local não encontrado
        echo    Crie manualmente apps\ml\.env com:
        echo.
        echo    NEXT_PUBLIC_SUPABASE_URL=sua-url
        echo    NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-key
        echo    SUPABASE_SERVICE_ROLE_KEY=sua-service-role-key
        echo.
    )
) else (
    echo ✅ .env já existe
)

echo.
echo 🎉 Setup concluído!
echo.
echo 📝 Próximos passos:
echo    1. Verifique apps\ml\.env (adicione SUPABASE_SERVICE_ROLE_KEY)
echo    2. Execute: cd apps\ml ^&^& python main.py
echo    3. Acesse: http://localhost:8000/docs
echo.
pause
