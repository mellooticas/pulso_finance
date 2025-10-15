#!/usr/bin/env python3
"""
Script de inicialização do Pulso Finance
Executa o servidor backend FastAPI
"""

import sys
import os
from pathlib import Path

# Adicionar o diretório src ao path
current_dir = Path(__file__).parent
src_dir = current_dir / "src"
sys.path.append(str(src_dir))

# Importar e executar a aplicação
if __name__ == "__main__":
    import uvicorn
    from main import app
    
    print("🚀 Iniciando Pulso Finance Backend...")
    print("📊 API estará disponível em: http://localhost:8000")
    print("📚 Documentação em: http://localhost:8000/docs")
    print("💡 Para parar o servidor: Ctrl+C")
    print("-" * 50)
    
    uvicorn.run(
        app, 
        host="0.0.0.0", 
        port=8000, 
        reload=True,
        reload_dirs=["src"]
    )