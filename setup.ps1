# =====================================================
# PULSO FINANCE - SCRIPT DE SETUP AUTOMÁTICO (Windows)
# =====================================================

param(
    [switch]$SkipPrerequisites
)

# Configurar encoding UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host "🚀 PULSO Finance - Setup Automático Iniciado" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# Funções para logs coloridos
function Log-Info($message) {
    Write-Host "ℹ️  $message" -ForegroundColor Blue
}

function Log-Success($message) {
    Write-Host "✅ $message" -ForegroundColor Green
}

function Log-Warning($message) {
    Write-Host "⚠️  $message" -ForegroundColor Yellow
}

function Log-Error($message) {
    Write-Host "❌ $message" -ForegroundColor Red
}

# =====================================================
# 1. VERIFICAR PRÉ-REQUISITOS
# =====================================================

if (-not $SkipPrerequisites) {
    Log-Info "Verificando pré-requisitos..."

    # Verificar Node.js
    try {
        $nodeVersion = node -v
        $majorVersion = [int]($nodeVersion -replace 'v(\d+)\..*', '$1')
        
        if ($majorVersion -lt 18) {
            Log-Error "Node.js versão 18+ necessária. Versão atual: $nodeVersion"
            exit 1
        }
        
        Log-Success "Node.js $nodeVersion ✓"
    }
    catch {
        Log-Error "Node.js não encontrado. Instale Node.js 18+ primeiro."
        Log-Info "Download: https://nodejs.org/en/download/"
        exit 1
    }

    # Verificar npm
    try {
        $npmVersion = npm -v
        Log-Success "npm $npmVersion ✓"
    }
    catch {
        Log-Error "npm não encontrado."
        exit 1
    }

    # Verificar Git
    try {
        $gitVersion = git --version
        Log-Success "Git $gitVersion ✓"
    }
    catch {
        Log-Error "Git não encontrado."
        Log-Info "Download: https://git-scm.com/download/win"
        exit 1
    }

    # Verificar PowerShell versão
    if ($PSVersionTable.PSVersion.Major -lt 5) {
        Log-Warning "PowerShell 5.1+ recomendado para melhor experiência"
    }
}

# =====================================================
# 2. INSTALAR SUPABASE CLI
# =====================================================

Log-Info "Verificando Supabase CLI..."

try {
    $supabaseVersion = supabase --version 2>$null
    Log-Success "Supabase CLI já instalado: $supabaseVersion"
}
catch {
    Log-Info "Instalando Supabase CLI..."
    
    try {
        npm install -g supabase@latest
        Log-Success "Supabase CLI instalado com sucesso"
    }
    catch {
        Log-Error "Erro ao instalar Supabase CLI via npm"
        Log-Info "Tente instalar manualmente: npm install -g supabase@latest"
        Log-Info "Ou use: winget install Supabase.CLI"
    }
}

# =====================================================
# 3. CONFIGURAR PROJETO LOCAL
# =====================================================

Log-Info "Configurando projeto local..."

# Criar .env.local se não existir
$envFile = ".env.local"
if (-not (Test-Path $envFile)) {
    $envContent = @"
# =====================================================
# PULSO FINANCE - VARIÁVEIS DE AMBIENTE
# =====================================================

# Supabase (preencher após criar projeto)
NEXT_PUBLIC_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=YOUR_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY=YOUR_SERVICE_ROLE_KEY

# Database (preencher após criar projeto)  
DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@db.YOUR_PROJECT.supabase.co:5432/postgres

# Aplicação
NEXT_PUBLIC_APP_URL=http://localhost:3000
NEXTAUTH_SECRET=your-nextauth-secret-here

# Environment
NODE_ENV=development
"@
    
    Set-Content -Path $envFile -Value $envContent -Encoding UTF8
    Log-Success "Arquivo .env.local criado"
}
else {
    Log-Warning ".env.local já existe"
}

# Criar .gitignore se não existir
$gitignoreFile = ".gitignore"
if (-not (Test-Path $gitignoreFile)) {
    $gitignoreContent = @"
# Dependencies
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# Next.js
.next/
out/
build/

# Vercel
.vercel

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Supabase
.branches
.temp

# Database
*.db
*.sqlite

# Windows
desktop.ini
"@
    
    Set-Content -Path $gitignoreFile -Value $gitignoreContent -Encoding UTF8
    Log-Success ".gitignore criado"
}
else {
    Log-Warning ".gitignore já existe"
}

# =====================================================
# 4. PREPARAR ESTRUTURA SUPABASE
# =====================================================

Log-Info "Preparando estrutura Supabase..."

# Criar diretórios Supabase
$directories = @("supabase\migrations", "supabase\functions", "supabase\seeds")
foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Verificar se migration existe
if (-not (Test-Path "supabase\migrations\20241014_initial_schema.sql")) {
    Log-Error "Migration inicial não encontrada em supabase\migrations\"
    Log-Info "Execute este script do diretório raiz do projeto"
    exit 1
}

Log-Success "Estrutura Supabase preparada"

# =====================================================
# 5. VALIDAR ARQUIVOS DE DADOS
# =====================================================

Log-Info "Validando arquivos de dados..."

$dataFiles = @{
    "data\base\yampa_relatorio.csv" = "yampa_relatorio.csv"
    "data\base\yampa_relatorio_antigo.csv" = "yampa_relatorio_antigo.csv"
    "data\base\plano_de_contas_correto.xlsx" = "plano_de_contas_correto.xlsx"
}

foreach ($file in $dataFiles.Keys) {
    if (-not (Test-Path $file)) {
        Log-Warning "$($dataFiles[$file]) não encontrado"
    }
    else {
        Log-Success "$($dataFiles[$file]) encontrado"
    }
}

# =====================================================
# 6. CRIAR SCRIPT DE MIGRAÇÃO WINDOWS
# =====================================================

$migrationScript = @"
# =====================================================
# SCRIPT DE MIGRAÇÃO DADOS YAMPA (Windows)
# =====================================================

# Verificar se .env.local está configurado
if (-not (Test-Path ".env.local")) {
    Write-Host "❌ Arquivo .env.local não encontrado" -ForegroundColor Red
    exit 1
}

# Carregar variáveis de ambiente
Get-Content ".env.local" | ForEach-Object {
    if (`$_ -match "^([^=]+)=(.*)$") {
        [Environment]::SetEnvironmentVariable(`$matches[1], `$matches[2], "Process")
    }
}

# Verificar se DATABASE_URL está configurado
if (-not `$env:DATABASE_URL -or `$env:DATABASE_URL -eq "postgresql://postgres:YOUR_PASSWORD@db.YOUR_PROJECT.supabase.co:5432/postgres") {
    Write-Host "❌ DATABASE_URL não configurado no .env.local" -ForegroundColor Red
    Write-Host "Configure as credenciais reais do Supabase primeiro" -ForegroundColor Yellow
    exit 1
}

Write-Host "🔄 Executando migração de dados..." -ForegroundColor Cyan

# Executar seeds
Write-Host "📊 Populando dados iniciais..." -ForegroundColor Blue
try {
    psql `$env:DATABASE_URL -f "supabase\seeds\01_initial_data.sql"
    Write-Host "✅ Dados iniciais populados" -ForegroundColor Green
}
catch {
    Write-Host "❌ Erro ao popular dados iniciais" -ForegroundColor Red
    Write-Host `$_.Exception.Message -ForegroundColor Red
}

# Executar ETL Yampa (se CSVs existirem)
if ((Test-Path "data\base\yampa_relatorio.csv") -and (Test-Path "data\base\yampa_relatorio_antigo.csv")) {
    Write-Host "🔄 Executando migração ETL Yampa..." -ForegroundColor Blue
    try {
        psql `$env:DATABASE_URL -f "etl_migracao_yampa.sql"
        Write-Host "✅ Migração ETL concluída" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Erro na migração ETL" -ForegroundColor Red
        Write-Host `$_.Exception.Message -ForegroundColor Red
    }
}
else {
    Write-Host "⚠️  Arquivos CSV não encontrados, pulando migração ETL" -ForegroundColor Yellow
}

Write-Host "🎉 Migração concluída!" -ForegroundColor Green
"@

Set-Content -Path "migrate.ps1" -Value $migrationScript -Encoding UTF8
Log-Success "Script migrate.ps1 criado"

# =====================================================
# 7. INSTRUÇÕES FINAIS
# =====================================================

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "🎉 SETUP BÁSICO CONCLUÍDO!" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host ""

Log-Info "PRÓXIMOS PASSOS MANUAIS:"
Write-Host ""

Write-Host "1️⃣  CRIAR PROJETO SUPABASE" -ForegroundColor White
Write-Host "   → Acesse: https://supabase.com/dashboard" -ForegroundColor Gray
Write-Host "   → Create new project" -ForegroundColor Gray
Write-Host "   → Nome: pulso-finance-prod" -ForegroundColor Gray
Write-Host "   → Região: South America (São Paulo)" -ForegroundColor Gray
Write-Host "   → Senha: [anote uma senha forte]" -ForegroundColor Gray
Write-Host ""

Write-Host "2️⃣  CONFIGURAR VARIÁVEIS" -ForegroundColor White
Write-Host "   → Copie a URL e Keys do projeto criado" -ForegroundColor Gray
Write-Host "   → Edite .env.local com as credenciais reais" -ForegroundColor Gray
Write-Host "   → Substitua YOUR_PROJECT, YOUR_PASSWORD, etc." -ForegroundColor Gray
Write-Host ""

Write-Host "3️⃣  APLICAR SCHEMA" -ForegroundColor White
Write-Host "   → supabase login" -ForegroundColor Gray
Write-Host "   → supabase link --project-ref [REF_DO_PROJETO]" -ForegroundColor Gray
Write-Host "   → supabase db push" -ForegroundColor Gray
Write-Host ""

Write-Host "4️⃣  EXECUTAR MIGRAÇÃO" -ForegroundColor White
Write-Host "   → .\migrate.ps1" -ForegroundColor Gray
Write-Host ""

Write-Host "5️⃣  CRIAR FRONTEND NEXT.JS" -ForegroundColor White
Write-Host "   → npx create-next-app@latest apps/web --typescript --tailwind" -ForegroundColor Gray
Write-Host "   → Instalar dependências Supabase" -ForegroundColor Gray
Write-Host ""

Log-Success "Setup automático concluído!"
Log-Info "Documentação completa em: TECH_STACK_SETUP_GUIDE.md"

Write-Host ""
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "💰 PULSO Finance - Ready to Launch! 🚀" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan