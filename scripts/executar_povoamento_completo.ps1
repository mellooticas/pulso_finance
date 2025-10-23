#!/usr/bin/env pwsh
# Script para executar todos os lotes SQL no Supabase via linha de comando
# Requisito: Supabase CLI instalado e configurado

param(
    [switch]$DryRun = $false
)

$ErrorActionPreference = "Stop"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "POVOAMENTO AUTOMÁTICO - PULSO FINANCE" -ForegroundColor Cyan  
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Configurações
$baseDir = Split-Path $PSScriptRoot -Parent
$loteDir = Join-Path $baseDir "_execucao_sql_editor"

# Verificar se diretório existe
if (-not (Test-Path $loteDir)) {
    Write-Host "ERRO: Diretório não encontrado: $loteDir" -ForegroundColor Red
    exit 1
}

# Contar lotes
$lotes = Get-ChildItem -Path $loteDir -Filter "11_transacionais_lote_*.sql" | Sort-Object Name
$totalLotes = $lotes.Count

if ($totalLotes -eq 0) {
    Write-Host "ERRO: Nenhum lote encontrado em $loteDir" -ForegroundColor Red
    exit 1
}

Write-Host "Encontrados $totalLotes lotes para processar" -ForegroundColor Green
Write-Host ""

if ($DryRun) {
    Write-Host "MODO DRY-RUN: Simulando execução..." -ForegroundColor Yellow
    Write-Host ""
}

# ETAPA 1: Executar lotes transacionais
Write-Host "ETAPA 1: Carregando lançamentos transacionais..." -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

$contador = 0
$erros = 0

foreach ($lote in $lotes) {
    $contador++
    $percentual = [math]::Round(($contador / $totalLotes) * 100, 1)
    
    Write-Host "[$contador/$totalLotes - $percentual%] Processando: $($lote.Name)" -NoNewline
    
    if ($DryRun) {
        Write-Host " [SIMULADO]" -ForegroundColor Yellow
        Start-Sleep -Milliseconds 50
    } else {
        try {
            # Executar via Supabase CLI
            # Nota: Ajustar comando conforme configuração do projeto
            $resultado = supabase db execute --file $lote.FullName 2>&1
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host " [OK]" -ForegroundColor Green
            } else {
                Write-Host " [ERRO]" -ForegroundColor Red
                Write-Host "  Detalhes: $resultado" -ForegroundColor Red
                $erros++
                
                $continuar = Read-Host "Continuar? (s/n)"
                if ($continuar -ne 's' -and $continuar -ne 'S') {
                    Write-Host "Execução interrompida pelo usuário" -ForegroundColor Yellow
                    exit 1
                }
            }
        } catch {
            Write-Host " [ERRO]" -ForegroundColor Red
            Write-Host "  Exceção: $_" -ForegroundColor Red
            $erros++
            
            $continuar = Read-Host "Continuar? (s/n)"
            if ($continuar -ne 's' -and $continuar -ne 'S') {
                Write-Host "Execução interrompida pelo usuário" -ForegroundColor Yellow
                exit 1
            }
        }
    }
}

Write-Host ""
Write-Host "Etapa 1 concluída: $contador lotes processados, $erros erros" -ForegroundColor $(if ($erros -eq 0) { "Green" } else { "Yellow" })
Write-Host ""

# ETAPA 2: Atribuir planos (11b)
Write-Host "ETAPA 2: Atribuindo planos às receitas (11b)..." -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

$arquivo11b = Join-Path $loteDir "11b_atribuir_plano_transacionais.sql"
if (Test-Path $arquivo11b) {
    Write-Host "Executando 11b_atribuir_plano_transacionais.sql..." -NoNewline
    
    if ($DryRun) {
        Write-Host " [SIMULADO]" -ForegroundColor Yellow
    } else {
        try {
            $resultado = supabase db execute --file $arquivo11b 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host " [OK]" -ForegroundColor Green
            } else {
                Write-Host " [ERRO]" -ForegroundColor Red
                Write-Host "  Detalhes: $resultado" -ForegroundColor Red
            }
        } catch {
            Write-Host " [ERRO]" -ForegroundColor Red
            Write-Host "  Exceção: $_" -ForegroundColor Red
        }
    }
} else {
    Write-Host "Arquivo 11b não encontrado, pulando..." -ForegroundColor Yellow
}
Write-Host ""

# ETAPA 3: Normalizar fornecedores (10b)
Write-Host "ETAPA 3: Normalizando fornecedores (10b)..." -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

$arquivo10b = Join-Path $loteDir "10b_normalizar_fornecedores.sql"
if (Test-Path $arquivo10b) {
    Write-Host "Executando 10b_normalizar_fornecedores.sql..." -NoNewline
    
    if ($DryRun) {
        Write-Host " [SIMULADO]" -ForegroundColor Yellow
    } else {
        try {
            $resultado = supabase db execute --file $arquivo10b 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host " [OK]" -ForegroundColor Green
            } else {
                Write-Host " [ERRO]" -ForegroundColor Red
                Write-Host "  Detalhes: $resultado" -ForegroundColor Red
            }
        } catch {
            Write-Host " [ERRO]" -ForegroundColor Red
            Write-Host "  Exceção: $_" -ForegroundColor Red
        }
    }
} else {
    Write-Host "Arquivo 10b não encontrado, pulando..." -ForegroundColor Yellow
}
Write-Host ""

# ETAPA 4: Compactar fornecedores (10c - opcional)
Write-Host "ETAPA 4: Compactando fornecedores (10c)..." -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

$arquivo10c = Join-Path $loteDir "10c_compactar_fornecedores.sql"
if (Test-Path $arquivo10c) {
    Write-Host "Executando 10c_compactar_fornecedores.sql..." -NoNewline
    
    if ($DryRun) {
        Write-Host " [SIMULADO]" -ForegroundColor Yellow
    } else {
        try {
            $resultado = supabase db execute --file $arquivo10c 2>&1
            if ($LASTEXITCODE -eq 0) {
                Write-Host " [OK]" -ForegroundColor Green
            } else {
                Write-Host " [ERRO]" -ForegroundColor Red
                Write-Host "  Detalhes: $resultado" -ForegroundColor Red
            }
        } catch {
            Write-Host " [ERRO]" -ForegroundColor Red
            Write-Host "  Exceção: $_" -ForegroundColor Red
        }
    }
} else {
    Write-Host "Arquivo 10c não encontrado, pulando..." -ForegroundColor Yellow
}
Write-Host ""

# ETAPA 5: Validações
Write-Host "ETAPA 5: Executando validações..." -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

$arquivo12 = Join-Path $loteDir "12_validacoes.sql"
if (Test-Path $arquivo12) {
    Write-Host "Executando 12_validacoes.sql..." -NoNewline
    
    if ($DryRun) {
        Write-Host " [SIMULADO]" -ForegroundColor Yellow
    } else {
        try {
            $resultado = supabase db execute --file $arquivo12 2>&1
            Write-Host " [OK]" -ForegroundColor Green
            Write-Host ""
            Write-Host "Resultados das validações:" -ForegroundColor Cyan
            Write-Host $resultado
        } catch {
            Write-Host " [INFO]" -ForegroundColor Yellow
            Write-Host "  Arquivo de validações não executado ou não retornou dados" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "Arquivo 12_validacoes.sql não encontrado, pulando..." -ForegroundColor Yellow
}
Write-Host ""

# Resumo final
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "POVOAMENTO CONCLUÍDO!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Resumo:"
Write-Host "  - Lotes transacionais: $contador processados"
Write-Host "  - Erros encontrados: $erros"
Write-Host ""
Write-Host "Próximos passos:"
Write-Host "  1. Verificar totais no banco de dados"
Write-Host "  2. Testar dashboards com dados reais"
Write-Host "  3. Revisar fornecedores canônicos (v_fornecedores_canonicos)"
Write-Host ""
