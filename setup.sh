#!/bin/bash

# =====================================================
# PULSO FINANCE - SCRIPT DE SETUP AUTOMÁTICO
# =====================================================

set -e  # Parar em caso de erro

echo "🚀 PULSO Finance - Setup Automático Iniciado"
echo "============================================="

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Função para logs coloridos
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# =====================================================
# 1. VERIFICAR PRÉ-REQUISITOS
# =====================================================

log_info "Verificando pré-requisitos..."

# Verificar Node.js
if ! command -v node &> /dev/null; then
    log_error "Node.js não encontrado. Instale Node.js 18+ primeiro."
    exit 1
fi

# Verificar versão Node
NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ $NODE_VERSION -lt 18 ]; then
    log_error "Node.js versão 18+ necessária. Versão atual: $(node -v)"
    exit 1
fi

log_success "Node.js $(node -v) ✓"

# Verificar npm
if ! command -v npm &> /dev/null; then
    log_error "npm não encontrado."
    exit 1
fi

log_success "npm $(npm -v) ✓"

# Verificar Git
if ! command -v git &> /dev/null; then
    log_error "Git não encontrado."
    exit 1
fi

log_success "Git $(git --version | cut -d' ' -f3) ✓"

# =====================================================
# 2. INSTALAR SUPABASE CLI
# =====================================================

log_info "Instalando Supabase CLI..."

if ! command -v supabase &> /dev/null; then
    npm install -g supabase@latest
    log_success "Supabase CLI instalado"
else
    log_success "Supabase CLI já instalado $(supabase --version)"
fi

# =====================================================
# 3. CONFIGURAR PROJETO LOCAL
# =====================================================

log_info "Configurando projeto local..."

# Criar .env.local se não existir
if [ ! -f ".env.local" ]; then
    cat > .env.local << EOF
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
EOF
    log_success "Arquivo .env.local criado"
else
    log_warning ".env.local já existe"
fi

# Criar .gitignore se não existir
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << EOF
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
EOF
    log_success ".gitignore criado"
else
    log_warning ".gitignore já existe"
fi

# =====================================================
# 4. PREPARAR ESTRUTURA SUPABASE
# =====================================================

log_info "Preparando estrutura Supabase..."

# Criar diretório supabase se não existir
mkdir -p supabase/migrations
mkdir -p supabase/functions
mkdir -p supabase/seeds

# Verificar se migration existe
if [ ! -f "supabase/migrations/20241014_initial_schema.sql" ]; then
    log_error "Migration inicial não encontrada em supabase/migrations/"
    log_info "Execute este script do diretório raiz do projeto"
    exit 1
fi

log_success "Estrutura Supabase preparada"

# =====================================================
# 5. VALIDAR ARQUIVOS DE DADOS
# =====================================================

log_info "Validando arquivos de dados..."

if [ ! -f "data/base/yampa_relatorio.csv" ]; then
    log_warning "yampa_relatorio.csv não encontrado"
    log_info "Coloque os arquivos CSV em data/base/ antes de executar a migração"
fi

if [ ! -f "data/base/yampa_relatorio_antigo.csv" ]; then
    log_warning "yampa_relatorio_antigo.csv não encontrado"
fi

if [ ! -f "data/base/plano_de_contas_correto.xlsx" ]; then
    log_warning "plano_de_contas_correto.xlsx não encontrado"
fi

# =====================================================
# 6. INSTRUÇÕES PARA PRÓXIMOS PASSOS
# =====================================================

echo ""
echo "============================================="
echo "🎉 SETUP BÁSICO CONCLUÍDO!"
echo "============================================="
echo ""

log_info "PRÓXIMOS PASSOS MANUAIS:"
echo ""

echo "1️⃣  CRIAR PROJETO SUPABASE"
echo "   → Acesse: https://supabase.com/dashboard"
echo "   → Create new project"
echo "   → Nome: pulso-finance-prod"
echo "   → Região: South America (São Paulo)"
echo "   → Senha: [anote uma senha forte]"
echo ""

echo "2️⃣  CONFIGURAR VARIÁVEIS"
echo "   → Copie a URL e Keys do projeto criado"
echo "   → Edite .env.local com as credenciais reais"
echo "   → Substitua YOUR_PROJECT, YOUR_PASSWORD, etc."
echo ""

echo "3️⃣  APLICAR SCHEMA"
echo "   → supabase login"
echo "   → supabase link --project-ref [REF_DO_PROJETO]"
echo "   → supabase db push"
echo ""

echo "4️⃣  POPULAR DADOS INICIAIS"
echo "   → psql \$DATABASE_URL -f supabase/seeds/01_initial_data.sql"
echo ""

echo "5️⃣  EXECUTAR MIGRAÇÃO YAMPA"
echo "   → Preparar CSVs em UTF-8"
echo "   → Executar: psql \$DATABASE_URL -f etl_migracao_yampa.sql"
echo ""

echo "6️⃣  CRIAR FRONTEND NEXT.JS"
echo "   → npx create-next-app@latest apps/web --typescript --tailwind"
echo "   → Instalar dependências Supabase"
echo ""

log_success "Setup automático concluído!"
log_info "Documentação completa em: TECH_STACK_SETUP_GUIDE.md"

echo ""
echo "============================================="
echo "💰 PULSO Finance - Ready to Launch! 🚀"
echo "============================================="