"""
Teste simples da API Pulso Finance
Execute este script para verificar se a API está funcionando
"""

import requests
import json
from pathlib import Path

def test_api():
    print("🧪 TESTANDO API PULSO FINANCE")
    print("=" * 40)
    
    base_url = "http://localhost:8000"
    
    # Teste 1: Health Check
    try:
        response = requests.get(f"{base_url}/health", timeout=5)
        if response.status_code == 200:
            print("✅ Health Check: OK")
            print(f"   Response: {response.json()}")
        else:
            print(f"❌ Health Check: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro de conexão: {e}")
        print("💡 Verifique se o servidor está rodando: python backend/main.py")
        return
    
    # Teste 2: Endpoint principal
    try:
        response = requests.get(f"{base_url}/", timeout=5)
        if response.status_code == 200:
            print("✅ Endpoint raiz: OK")
            print(f"   Response: {response.json()}")
        else:
            print(f"❌ Endpoint raiz: {response.status_code}")
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro no endpoint raiz: {e}")
    
    # Teste 3: Upload de arquivo (se existir)
    csv_file = Path("data/exemplo_financeiro.csv")
    if csv_file.exists():
        try:
            with open(csv_file, 'rb') as f:
                files = {'file': f}
                response = requests.post(f"{base_url}/upload/csv", files=files, timeout=10)
                if response.status_code == 200:
                    print("✅ Upload CSV: OK")
                    data = response.json()
                    print(f"   Arquivo: {data.get('filename')}")
                    print(f"   Linhas: {data.get('shape', [0])[0]}")
                    print(f"   Colunas: {len(data.get('columns', []))}")
                else:
                    print(f"❌ Upload CSV: {response.status_code}")
        except requests.exceptions.RequestException as e:
            print(f"❌ Erro no upload: {e}")
    else:
        print("⚠️  Arquivo de exemplo não encontrado")
    
    print("\n🎉 Teste concluído!")
    print(f"🌐 Acesse a documentação: {base_url}/docs")

if __name__ == "__main__":
    test_api()