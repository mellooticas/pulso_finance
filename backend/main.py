from fastapi import FastAPI, File, UploadFile, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
import pandas as pd
import io
import numpy as np
from typing import List, Dict, Any
import plotly.graph_objects as go
import plotly.express as px
from datetime import datetime
import json

app = FastAPI(
    title="Pulso Finance API",
    description="API para análise financeira de dados Excel/CSV",
    version="1.0.0"
)

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"message": "Pulso Finance API - Sistema de Análise Financeira"}

@app.post("/upload/excel")
async def upload_excel(file: UploadFile = File(...)):
    """Upload e análise inicial de arquivo Excel"""
    try:
        contents = await file.read()
        df = pd.read_excel(io.BytesIO(contents))
        
        # Análise básica dos dados
        analysis = {
            "filename": file.filename,
            "shape": df.shape,
            "columns": df.columns.tolist(),
            "data_types": df.dtypes.astype(str).to_dict(),
            "missing_values": df.isnull().sum().to_dict(),
            "sample_data": df.head().to_dict(orient="records")
        }
        
        return JSONResponse(content=analysis)
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Erro ao processar arquivo: {str(e)}")

@app.post("/upload/csv")
async def upload_csv(file: UploadFile = File(...)):
    """Upload e análise inicial de arquivo CSV"""
    try:
        contents = await file.read()
        df = pd.read_csv(io.BytesIO(contents))
        
        # Análise básica dos dados
        analysis = {
            "filename": file.filename,
            "shape": df.shape,
            "columns": df.columns.tolist(),
            "data_types": df.dtypes.astype(str).to_dict(),
            "missing_values": df.isnull().sum().to_dict(),
            "sample_data": df.head().to_dict(orient="records")
        }
        
        return JSONResponse(content=analysis)
    
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Erro ao processar arquivo: {str(e)}")

@app.get("/health")
async def health_check():
    return {"status": "healthy", "timestamp": datetime.now().isoformat()}

if __name__ == "__main__":
    import uvicorn
    print("🚀 Iniciando Pulso Finance Backend...")
    print("📊 API estará disponível em: http://localhost:8000")
    print("📚 Documentação em: http://localhost:8000/docs")
    print("💡 Para parar o servidor: Ctrl+C")
    print("-" * 50)
    uvicorn.run(app, host="0.0.0.0", port=8000, reload=False)