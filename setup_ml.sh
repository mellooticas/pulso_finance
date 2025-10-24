#!/bin/bash

# 🔮 Setup ML API - PULSO Finance
# Script de instalação automática

echo "🚀 Iniciando setup da API ML..."
echo ""

# Verificar se Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 não encontrado!"
    echo "   Instale Python 3.9+ em: https://www.python.org/downloads/"
    exit 1
fi

echo "✅ Python encontrado: $(python3 --version)"
echo ""

# Criar diretório se não existir
cd "$(dirname "$0")"
cd apps/ml

# Criar ambiente virtual
echo "📦 Criando ambiente virtual..."
python3 -m venv venv

# Ativar ambiente virtual
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    source venv/Scripts/activate
else
    source venv/bin/activate
fi

echo "✅ Ambiente virtual ativado"
echo ""

# Instalar dependências
echo "📥 Instalando dependências..."
pip install --upgrade pip
pip install -r requirements.txt

if [ $? -eq 0 ]; then
    echo "✅ Dependências instaladas com sucesso!"
else
    echo "❌ Erro ao instalar dependências"
    exit 1
fi

echo ""

# Configurar .env
if [ ! -f .env ]; then
    echo "⚙️  Configurando variáveis de ambiente..."
    
    if [ -f ../../frontend/.env.local ]; then
        cp ../../frontend/.env.local .env
        echo "✅ .env criado a partir do frontend/.env.local"
    else
        echo "⚠️  frontend/.env.local não encontrado"
        echo "   Crie manualmente apps/ml/.env com:"
        echo ""
        echo "   NEXT_PUBLIC_SUPABASE_URL=sua-url"
        echo "   NEXT_PUBLIC_SUPABASE_ANON_KEY=sua-key"
        echo "   SUPABASE_SERVICE_ROLE_KEY=sua-service-role-key"
        echo ""
    fi
else
    echo "✅ .env já existe"
fi

echo ""
echo "🎉 Setup concluído!"
echo ""
echo "📝 Próximos passos:"
echo "   1. Verifique apps/ml/.env (adicione SUPABASE_SERVICE_ROLE_KEY)"
echo "   2. Execute: cd apps/ml && python main.py"
echo "   3. Acesse: http://localhost:8000/docs"
echo ""
