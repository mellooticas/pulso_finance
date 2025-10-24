// app/conciliacao/page.tsx
'use client'

/**
 * 🏦 Página de Conciliação Bancária
 * 
 * Funcionalidades:
 * - Upload de extrato bancário (CSV)
 * - Matching automático com IA
 * - Visualização side-by-side
 * - Confirmação/rejeição manual
 */

import { useState, useCallback } from 'react'
import { useDropzone } from 'react-dropzone'
import { Card } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { 
  Upload, 
  FileText, 
  CheckCircle2, 
  XCircle, 
  AlertCircle,
  Loader2,
  Download,
  ChevronDown,
  ChevronUp
} from 'lucide-react'
import { 
  BankName,
  ReconciliationResult,
  ReconciliationMatch 
} from '@/lib/reconciliation'

export default function ConciliacaoPage() {
  const [file, setFile] = useState<File | null>(null)
  const [result, setResult] = useState<ReconciliationResult | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)
  const [detectedBank, setDetectedBank] = useState<BankName | null>(null)

  const onDrop = useCallback((acceptedFiles: File[]) => {
    if (acceptedFiles.length > 0) {
      setFile(acceptedFiles[0])
      setResult(null)
      setError(null)
    }
  }, [])

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'text/csv': ['.csv'],
      'text/plain': ['.txt']
    },
    maxFiles: 1
  })

  const handleUpload = async () => {
    if (!file) return

    setLoading(true)
    setError(null)

    try {
      const formData = new FormData()
      formData.append('file', file)
      // TODO: pegar loja_id do contexto de filtros
      formData.append('loja_id', '')

      const response = await fetch('/api/conciliacao', {
        method: 'POST',
        body: formData
      })

      const data = await response.json()

      if (!response.ok) {
        throw new Error(data.error || 'Erro ao processar arquivo')
      }

      setDetectedBank(data.bank)
      setResult(data.result)
    } catch (err: any) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-bold">Conciliação Bancária</h1>
        <p className="text-muted-foreground mt-2">
          Faça upload do extrato bancário para reconciliar automaticamente com seus lançamentos
        </p>
      </div>

      {/* Upload Area */}
      <Card className="p-8">
        <div
          {...getRootProps()}
          className={`
            border-2 border-dashed rounded-lg p-12 text-center cursor-pointer
            transition-colors duration-200
            ${isDragActive 
              ? 'border-primary bg-primary/5' 
              : 'border-border hover:border-primary/50 hover:bg-accent/50'
            }
          `}
        >
          <input {...getInputProps()} />
          <Upload className="h-12 w-12 mx-auto mb-4 text-muted-foreground" />
          {isDragActive ? (
            <p className="text-lg">Solte o arquivo aqui...</p>
          ) : (
            <>
              <p className="text-lg font-medium mb-2">
                Arraste o extrato bancário ou clique para selecionar
              </p>
              <p className="text-sm text-muted-foreground">
                Suporta: CSV (.csv, .txt)
              </p>
              <p className="text-xs text-muted-foreground mt-2">
                Bancos: Banco do Brasil, Itaú, Nubank, Santander, Bradesco
              </p>
            </>
          )}
        </div>

        {/* Arquivo selecionado */}
        {file && (
          <div className="mt-4 flex items-center justify-between p-4 bg-accent rounded-lg">
            <div className="flex items-center gap-3">
              <FileText className="h-5 w-5 text-primary" />
              <div>
                <p className="font-medium">{file.name}</p>
                <p className="text-sm text-muted-foreground">
                  {(file.size / 1024).toFixed(1)} KB
                </p>
              </div>
            </div>
            <div className="flex gap-2">
              <Button
                onClick={handleUpload}
                disabled={loading}
              >
                {loading ? (
                  <>
                    <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                    Processando...
                  </>
                ) : (
                  'Processar'
                )}
              </Button>
              <Button
                variant="outline"
                onClick={() => {
                  setFile(null)
                  setResult(null)
                  setError(null)
                }}
                disabled={loading}
              >
                Limpar
              </Button>
            </div>
          </div>
        )}

        {/* Erro */}
        {error && (
          <div className="mt-4 p-4 bg-destructive/10 border border-destructive/20 rounded-lg">
            <div className="flex items-start gap-3">
              <AlertCircle className="h-5 w-5 text-destructive mt-0.5" />
              <div>
                <p className="font-medium text-destructive">Erro</p>
                <p className="text-sm text-destructive/80 mt-1">{error}</p>
              </div>
            </div>
          </div>
        )}
      </Card>

      {/* Resultado */}
      {result && (
        <div className="space-y-4">
          {/* Estatísticas */}
          <div className="grid grid-cols-4 gap-4">
            <StatCard
              title="Total Processado"
              value={result.totalBankTransactions}
              icon={FileText}
              color="blue"
            />
            <StatCard
              title="Auto-Matchados"
              value={result.stats.autoMatched}
              icon={CheckCircle2}
              color="green"
            />
            <StatCard
              title="Sugestões"
              value={result.stats.suggested}
              icon={AlertCircle}
              color="yellow"
            />
            <StatCard
              title="Não Encontrados"
              value={result.stats.notFound}
              icon={XCircle}
              color="red"
            />
          </div>

          {/* Info do banco */}
          {detectedBank && (
            <Card className="p-4">
              <p className="text-sm">
                <span className="font-medium">Banco detectado:</span>{' '}
                <span className="text-primary">{getBankName(detectedBank)}</span>
                {' • '}
                <span className="font-medium">Confiança média:</span>{' '}
                <span className={getConfidenceColor(result.stats.avgConfidence)}>
                  {result.stats.avgConfidence}%
                </span>
              </p>
            </Card>
          )}

          {/* Lista de matches */}
          <Card className="p-6">
            <h2 className="text-xl font-bold mb-4">Transações Processadas</h2>
            <div className="space-y-3">
              {result.matches.map((match) => (
                <MatchCard key={match.id} match={match} />
              ))}
            </div>
          </Card>

          {/* Não matchados */}
          {result.unmatchedBank.length > 0 && (
            <Card className="p-6">
              <h2 className="text-xl font-bold mb-4 text-destructive">
                Transações Bancárias Sem Match ({result.unmatchedBank.length})
              </h2>
              <div className="space-y-2">
                {result.unmatchedBank.map((tx) => (
                  <div key={tx.id} className="p-3 bg-destructive/5 border border-destructive/20 rounded">
                    <div className="flex justify-between">
                      <span className="font-medium">{tx.description}</span>
                      <span className={tx.amount >= 0 ? 'text-green-600' : 'text-red-600'}>
                        R$ {Math.abs(tx.amount).toFixed(2)}
                      </span>
                    </div>
                    <p className="text-sm text-muted-foreground mt-1">
                      {tx.date.toLocaleDateString()} • {tx.bank}
                    </p>
                  </div>
                ))}
              </div>
            </Card>
          )}
        </div>
      )}
    </div>
  )
}

// Componente auxiliar: Card de estatística
function StatCard({ 
  title, 
  value, 
  icon: Icon, 
  color 
}: { 
  title: string
  value: number
  icon: any
  color: 'blue' | 'green' | 'yellow' | 'red'
}) {
  const colorClasses = {
    blue: 'text-blue-600 bg-blue-50',
    green: 'text-green-600 bg-green-50',
    yellow: 'text-yellow-600 bg-yellow-50',
    red: 'text-red-600 bg-red-50'
  }

  return (
    <Card className="p-4">
      <div className="flex items-center gap-3">
        <div className={`p-2 rounded-lg ${colorClasses[color]}`}>
          <Icon className="h-5 w-5" />
        </div>
        <div>
          <p className="text-sm text-muted-foreground">{title}</p>
          <p className="text-2xl font-bold">{value}</p>
        </div>
      </div>
    </Card>
  )
}

// Componente: Card de match individual
function MatchCard({ match }: { match: ReconciliationMatch }) {
  const [expanded, setExpanded] = useState(false)

  const statusConfig = {
    AUTO_MATCHED: { label: 'Auto-Match', color: 'text-green-600 bg-green-50 border-green-200' },
    SUGGESTED: { label: 'Sugestão', color: 'text-yellow-600 bg-yellow-50 border-yellow-200' },
    NOT_FOUND: { label: 'Não Encontrado', color: 'text-red-600 bg-red-50 border-red-200' },
    CONFIRMED: { label: 'Confirmado', color: 'text-blue-600 bg-blue-50 border-blue-200' },
    REJECTED: { label: 'Rejeitado', color: 'text-gray-600 bg-gray-50 border-gray-200' },
    MANUAL: { label: 'Manual', color: 'text-purple-600 bg-purple-50 border-purple-200' }
  }

  const config = statusConfig[match.status]

  return (
    <Card className={`p-4 border ${config.color}`}>
      {/* Header */}
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <div className="flex items-center gap-3 mb-2">
            <span className={`text-xs font-medium px-2 py-1 rounded ${config.color}`}>
              {config.label}
            </span>
            <span className={`text-sm font-medium ${getConfidenceColor(match.confidence)}`}>
              {match.confidence}% confiança
            </span>
          </div>
          
          {/* Transação bancária */}
          <div className="mb-2">
            <p className="font-medium">{match.bankTransaction.description}</p>
            <p className="text-sm text-muted-foreground">
              {match.bankTransaction.date.toLocaleDateString()} •{' '}
              <span className={match.bankTransaction.amount >= 0 ? 'text-green-600' : 'text-red-600'}>
                R$ {Math.abs(match.bankTransaction.amount).toFixed(2)}
              </span>
            </p>
          </div>

          {/* Lançamento do sistema */}
          {match.systemLancamento && (
            <div className="pl-4 border-l-2 border-primary/30">
              <p className="text-sm font-medium text-primary">↔ {match.systemLancamento.descricao}</p>
              <p className="text-xs text-muted-foreground">
                R$ {match.systemLancamento.valor.toFixed(2)} •{' '}
                {(match.systemLancamento.data_pagamento || match.systemLancamento.data_vencimento).toLocaleDateString()}
              </p>
            </div>
          )}
        </div>

        {/* Botão expandir */}
        <Button
          variant="ghost"
          size="icon"
          onClick={() => setExpanded(!expanded)}
        >
          {expanded ? <ChevronUp className="h-4 w-4" /> : <ChevronDown className="h-4 w-4" />}
        </Button>
      </div>

      {/* Detalhes expandidos */}
      {expanded && (
        <div className="mt-4 pt-4 border-t space-y-2">
          <p className="text-sm font-medium">Razões do Match:</p>
          {match.reasons.map((reason, idx) => (
            <div key={idx} className="text-xs p-2 bg-accent rounded">
              <span className="font-medium">{reason.description}</span>
              <span className="text-muted-foreground"> (peso: {reason.weight.toFixed(2)}, score: {reason.score})</span>
            </div>
          ))}
          
          {/* Alternativas */}
          {match.alternatives && match.alternatives.length > 0 && (
            <div className="mt-3">
              <p className="text-sm font-medium mb-2">Alternativas:</p>
              {match.alternatives.map((alt, idx) => (
                <div key={idx} className="text-xs p-2 bg-muted rounded mb-1">
                  {alt.lancamento.descricao} ({alt.confidence}%)
                </div>
              ))}
            </div>
          )}
        </div>
      )}
    </Card>
  )
}

// Helpers
function getBankName(bank: BankName): string {
  const names: Record<BankName, string> = {
    banco_do_brasil: 'Banco do Brasil',
    itau: 'Itaú',
    nubank: 'Nubank',
    santander: 'Santander',
    bradesco: 'Bradesco',
    caixa: 'Caixa Econômica',
    sicoob: 'Sicoob',
    sicredi: 'Sicredi',
    inter: 'Banco Inter',
    c6: 'C6 Bank',
    generic: 'Genérico'
  }
  return names[bank] || bank
}

function getConfidenceColor(confidence: number): string {
  if (confidence >= 85) return 'text-green-600'
  if (confidence >= 60) return 'text-yellow-600'
  return 'text-red-600'
}
