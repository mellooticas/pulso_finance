// app/dashboard/previsoes/page.tsx
'use client'

/**
 * 🔮 Página de Previsões Financeiras
 * 
 * Features:
 * - Previsão de receitas/despesas com Prophet
 * - Gráficos com intervalos de confiança
 * - Análise de tendências
 * - Detecção de anomalias
 * - Projeção de fluxo de caixa
 */

import { useState, useEffect } from 'react'
import { Card } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Alert, AlertDescription } from '@/components/ui/alert'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { ForecastLineChart } from '@/components/charts/ForecastLineChart'
import { FluxoCaixaChart } from '@/components/charts/FluxoCaixaChart'
import { PrevisõesEmptyState } from '@/components/dashboard/PrevisõesEmptyState'
import { useLojasComDados } from '@/hooks/useLojasComDados'
import { useExportData } from '@/hooks/useExportData'
import {
  TrendingUp,
  TrendingDown,
  DollarSign,
  Calendar,
  AlertTriangle,
  Loader2,
  RefreshCw,
  Download
} from 'lucide-react'

interface ForecastData {
  success: boolean
  serie_type: string
  historical_days: number
  forecast_days: number
  forecast: {
    dates: string[]
    predicted: number[]
    lower_bound: number[]
    upper_bound: number[]
    trend: number[]
  }
  trend: {
    trend_direction: string
    trend_change_percent: number
    avg_next_30_days: number
    min_predicted: number
    max_predicted: number
  }
  anomalies: Array<{
    date: string
    actual: number
    expected: number
    deviation: number
    severity: string
  }>
}

interface FluxoCaixaData {
  success: boolean
  dates: string[]
  receitas_previstas: number[]
  despesas_previstas: number[]
  fluxo_caixa_diario: number[]
  saldo_acumulado: number[]
  periodos_criticos: Array<{
    date: string
    saldo: number
    deficit: number
  }>
  resumo: {
    total_receitas: number
    total_despesas: number
    saldo_final: number
    dias_negativos: number
    maior_deficit: number
  }
}

export default function PrevisoesPage() {
  const { lojas, loading: lojasLoading } = useLojasComDados()
  const { exportForecastToCSV, exportFluxoCaixaToCSV, exportAnomaliesToCSV } = useExportData()
  const [lojaId, setLojaId] = useState<string>('')
  const [periods, setPeriods] = useState(30)
  const [activeTab, setActiveTab] = useState('receitas')
  
  const [receitasForecast, setReceitasForecast] = useState<ForecastData | null>(null)
  const [despesasForecast, setDespesasForecast] = useState<ForecastData | null>(null)
  const [fluxoCaixa, setFluxoCaixa] = useState<FluxoCaixaData | null>(null)
  
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  // Carregar loja do localStorage ou usar a primeira disponível
  useEffect(() => {
    const savedLojaId = localStorage.getItem('selectedLojaId')
    if (savedLojaId) {
      setLojaId(savedLojaId)
    } else if (lojas.length > 0) {
      setLojaId(lojas[0].id)
    }
  }, [lojas])

  // Buscar previsões quando loja mudar
  useEffect(() => {
    if (lojaId) {
      fetchForecast()
    }
  }, [lojaId])

  const handleLojaChange = (newLojaId: string) => {
    setLojaId(newLojaId)
    localStorage.setItem('selectedLojaId', newLojaId)
  }

  const fetchForecast = async () => {
    setLoading(true)
    setError(null)

    try {
      // Buscar previsão de receitas
      const receitasRes = await fetch('http://localhost:8000/api/ml/forecast/receitas', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          loja_id: lojaId,
          periods: periods,
          tipo: 'receitas'
        })
      })

      if (!receitasRes.ok) {
        const errorData = await receitasRes.json().catch(() => ({ detail: receitasRes.statusText }))
        const message = typeof errorData.detail === 'object' 
          ? errorData.detail.message 
          : errorData.detail
        throw new Error(message || 'Erro ao buscar previsão de receitas')
      }

      const receitasData = await receitasRes.json()
      setReceitasForecast(receitasData)

      // Buscar previsão de despesas
      const despesasRes = await fetch('http://localhost:8000/api/ml/forecast/despesas', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          loja_id: lojaId,
          periods: periods,
          tipo: 'despesas'
        })
      })

      if (!despesasRes.ok) {
        const errorData = await despesasRes.json().catch(() => ({ detail: despesasRes.statusText }))
        const message = typeof errorData.detail === 'object' 
          ? errorData.detail.message 
          : errorData.detail
        throw new Error(message || 'Erro ao buscar previsão de despesas')
      }

      const despesasData = await despesasRes.json()
      setDespesasForecast(despesasData)

      // Buscar fluxo de caixa
      const fluxoRes = await fetch('http://localhost:8000/api/ml/forecast/fluxo-caixa', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          loja_id: lojaId,
          periods: periods,
          tipo: 'lucro'
        })
      })

      if (!fluxoRes.ok) {
        const errorData = await fluxoRes.json().catch(() => ({ detail: fluxoRes.statusText }))
        const message = typeof errorData.detail === 'object' 
          ? errorData.detail.message 
          : errorData.detail
        throw new Error(message || 'Erro ao buscar previsão de fluxo de caixa')
      }

      const fluxoData = await fluxoRes.json()
      setFluxoCaixa(fluxoData)

    } catch (err: any) {
      console.error('Erro ao buscar previsões:', err)
      
      // Mensagem mais amigável para erro de conexão
      if (err.message.includes('Failed to fetch') || err.message.includes('NetworkError')) {
        setError('Não foi possível conectar à API de ML. Verifique se o servidor está rodando em http://localhost:8000')
      } else {
        setError(err.message || 'Erro desconhecido ao buscar previsões')
      }
    } finally {
      setLoading(false)
    }
  }

  useEffect(() => {
    fetchForecast()
  }, [])

  const formatCurrency = (value: number) => {
    return new Intl.NumberFormat('pt-BR', {
      style: 'currency',
      currency: 'BRL'
    }).format(value)
  }

  const formatDate = (dateStr: string) => {
    const date = new Date(dateStr)
    return new Intl.DateTimeFormat('pt-BR', {
      day: '2-digit',
      month: 'short'
    }).format(date)
  }

  if (error) {
    const isDataInsufficient = error.includes('insuficiente') || error.includes('insufficient') || error.includes('Dados insuficientes')
    
    if (isDataInsufficient) {
      return <PrevisõesEmptyState onRetry={fetchForecast} />
    }
    
    return (
      <div className="p-8 space-y-4">
        <Alert variant="destructive">
          <AlertTriangle className="h-4 w-4" />
          <AlertDescription>
            <div className="space-y-3">
              <p className="font-medium">{error}</p>
              
              <div className="text-sm space-y-2 mt-3">
                <p><strong>Possíveis causas:</strong></p>
                <ul className="list-disc ml-5 space-y-1">
                  <li>A API ML não está rodando: <code className="bg-muted px-1 py-0.5 rounded">cd apps/ml && python main.py</code></li>
                  <li>Problema de conexão com o Supabase</li>
                  <li>Configuração incorreta no <code className="bg-muted px-1 py-0.5 rounded">apps/ml/.env</code></li>
                </ul>
              </div>
            </div>
          </AlertDescription>
        </Alert>
        
        <Button onClick={fetchForecast}>
          <RefreshCw className="h-4 w-4 mr-2" />
          Tentar Novamente
        </Button>
      </div>
    )
  }

  return (
    <div className="p-8 space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div>
          <h1 className="text-3xl font-bold">🔮 Previsões Financeiras</h1>
          <p className="text-muted-foreground mt-1">
            Análise preditiva com Machine Learning (Prophet)
          </p>
        </div>
        <div className="flex flex-col sm:flex-row gap-2">
          {/* Seletor de Loja */}
          <Select value={lojaId} onValueChange={handleLojaChange} disabled={lojasLoading || lojas.length === 0}>
            <SelectTrigger className="w-full sm:w-[240px]">
              <SelectValue placeholder="Selecione a loja" />
            </SelectTrigger>
            <SelectContent>
              {lojas.map((loja) => (
                <SelectItem key={loja.id} value={loja.id}>
                  <div className="flex items-center justify-between gap-2 w-full">
                    <span>{loja.nome}</span>
                    {loja.parcelas_pagas > 0 ? (
                      <Badge variant="outline" className="ml-2 text-xs">
                        {loja.parcelas_pagas.toLocaleString('pt-BR')}
                      </Badge>
                    ) : (
                      <Badge variant="secondary" className="ml-2 text-xs">
                        Sem dados
                      </Badge>
                    )}
                  </div>
                </SelectItem>
              ))}
            </SelectContent>
          </Select>

          {/* Seletor de Período */}
          <Select value={periods.toString()} onValueChange={(v) => setPeriods(Number(v))}>
            <SelectTrigger className="w-full sm:w-[140px]">
              <SelectValue />
            </SelectTrigger>
            <SelectContent>
              <SelectItem value="7">7 dias</SelectItem>
              <SelectItem value="15">15 dias</SelectItem>
              <SelectItem value="30">30 dias</SelectItem>
              <SelectItem value="60">60 dias</SelectItem>
              <SelectItem value="90">90 dias</SelectItem>
            </SelectContent>
          </Select>

          <Button onClick={fetchForecast} disabled={loading || !lojaId}>
            {loading ? (
              <>
                <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                Carregando...
              </>
            ) : (
              <>
                <RefreshCw className="h-4 w-4 mr-2" />
                Atualizar
              </>
            )}
          </Button>
        </div>
      </div>

      {/* Aviso para lojas sem dados */}
      {lojaId && lojas.find(l => l.id === lojaId)?.parcelas_pagas === 0 && (
        <Alert variant="destructive">
          <AlertTriangle className="h-4 w-4" />
          <AlertDescription>
            <strong>Loja sem dados:</strong> A loja selecionada não possui lançamentos pagos registrados.
            <br />
            <span className="text-sm mt-1 block">
              💡 <strong>Dica:</strong> Selecione <strong>{lojas.find(l => l.parcelas_pagas > 0)?.nome}</strong> que possui {lojas.find(l => l.parcelas_pagas > 0)?.parcelas_pagas.toLocaleString('pt-BR')} parcelas pagas.
            </span>
          </AlertDescription>
        </Alert>
      )}

      {/* Cards de Métricas */}
      {loading ? (
        <div className="flex items-center justify-center h-96">
          <Loader2 className="h-12 w-12 animate-spin text-primary" />
        </div>
      ) : (
        <>
          {/* Cards de Resumo */}
          <div className="grid gap-4 md:grid-cols-4">
            {receitasForecast && (
              <Card className="p-6">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-sm text-muted-foreground">Receitas Previstas</p>
                    <h3 className="text-2xl font-bold mt-1">
                      {formatCurrency(receitasForecast.trend.avg_next_30_days * 30)}
                    </h3>
                  </div>
                  <DollarSign className="h-8 w-8 text-green-500" />
                </div>
                <div className="mt-4 flex items-center gap-2">
                  {receitasForecast.trend.trend_direction === 'crescente' ? (
                    <TrendingUp className="h-4 w-4 text-green-500" />
                  ) : (
                    <TrendingDown className="h-4 w-4 text-red-500" />
                  )}
                  <span className={`text-sm ${
                    receitasForecast.trend.trend_direction === 'crescente' 
                      ? 'text-green-500' 
                      : 'text-red-500'
                  }`}>
                    {receitasForecast.trend.trend_change_percent.toFixed(1)}%
                  </span>
                </div>
              </Card>
            )}

            {despesasForecast && (
              <Card className="p-6">
                <div className="flex items-center justify-between">
                  <div>
                    <p className="text-sm text-muted-foreground">Despesas Previstas</p>
                    <h3 className="text-2xl font-bold mt-1">
                      {formatCurrency(despesasForecast.trend.avg_next_30_days * 30)}
                    </h3>
                  </div>
                  <DollarSign className="h-8 w-8 text-red-500" />
                </div>
                <div className="mt-4 flex items-center gap-2">
                  {despesasForecast.trend.trend_direction === 'crescente' ? (
                    <TrendingUp className="h-4 w-4 text-red-500" />
                  ) : (
                    <TrendingDown className="h-4 w-4 text-green-500" />
                  )}
                  <span className={`text-sm ${
                    despesasForecast.trend.trend_direction === 'crescente' 
                      ? 'text-red-500' 
                      : 'text-green-500'
                  }`}>
                    {despesasForecast.trend.trend_change_percent.toFixed(1)}%
                  </span>
                </div>
              </Card>
            )}

            {fluxoCaixa && (
              <>
                <Card className="p-6">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-muted-foreground">Saldo Final Previsto</p>
                      <h3 className="text-2xl font-bold mt-1">
                        {formatCurrency(fluxoCaixa.resumo.saldo_final)}
                      </h3>
                    </div>
                    <Calendar className="h-8 w-8 text-blue-500" />
                  </div>
                  <div className="mt-4">
                    <Badge variant={fluxoCaixa.resumo.saldo_final > 0 ? 'default' : 'destructive'}>
                      {fluxoCaixa.resumo.saldo_final > 0 ? 'Positivo' : 'Negativo'}
                    </Badge>
                  </div>
                </Card>

                <Card className="p-6">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-muted-foreground">Períodos Críticos</p>
                      <h3 className="text-2xl font-bold mt-1">
                        {fluxoCaixa.resumo.dias_negativos}
                      </h3>
                    </div>
                    <AlertTriangle className="h-8 w-8 text-yellow-500" />
                  </div>
                  <div className="mt-4">
                    <p className="text-xs text-muted-foreground">
                      Maior déficit: {formatCurrency(fluxoCaixa.resumo.maior_deficit)}
                    </p>
                  </div>
                </Card>
              </>
            )}
          </div>

          {/* Tabs de Visualização */}
          <Tabs value={activeTab} onValueChange={setActiveTab} className="space-y-4">
            <TabsList>
              <TabsTrigger value="receitas">Receitas</TabsTrigger>
              <TabsTrigger value="despesas">Despesas</TabsTrigger>
              <TabsTrigger value="fluxo">Fluxo de Caixa</TabsTrigger>
              <TabsTrigger value="anomalias">Anomalias</TabsTrigger>
            </TabsList>

            <TabsContent value="receitas" className="space-y-4">
              {receitasForecast && (
                <ForecastChart
                  data={receitasForecast}
                  title="Previsão de Receitas"
                  color="rgb(34, 197, 94)"
                  formatCurrency={formatCurrency}
                  formatDate={formatDate}
                  onExport={() => exportForecastToCSV(receitasForecast, 'receitas')}
                />
              )}
            </TabsContent>

            <TabsContent value="despesas" className="space-y-4">
              {despesasForecast && (
                <ForecastChart
                  data={despesasForecast}
                  title="Previsão de Despesas"
                  color="rgb(239, 68, 68)"
                  formatCurrency={formatCurrency}
                  formatDate={formatDate}
                  onExport={() => exportForecastToCSV(despesasForecast, 'despesas')}
                />
              )}
            </TabsContent>

            <TabsContent value="fluxo" className="space-y-4">
              {fluxoCaixa && (
                <FluxoCaixaView
                  data={fluxoCaixa}
                  formatCurrency={formatCurrency}
                  formatDate={formatDate}
                  onExport={() => exportFluxoCaixaToCSV(fluxoCaixa)}
                />
              )}
            </TabsContent>

            <TabsContent value="anomalias" className="space-y-4">
              <AnomaliesView
                receitasAnomalies={receitasForecast?.anomalies || []}
                despesasAnomalies={despesasForecast?.anomalies || []}
                formatCurrency={formatCurrency}
              />
            </TabsContent>
          </Tabs>
        </>
      )}
    </div>
  )
}

// Componente de gráfico simples (substitua por Chart.js depois)
function ForecastChart({
  data,
  title,
  color,
  formatCurrency,
  formatDate,
  onExport
}: {
  data: ForecastData
  title: string
  color: string
  formatCurrency: (n: number) => string
  formatDate: (s: string) => string
  onExport?: () => void
}) {
  // Filtrar apenas dados futuros
  const futureIndexStart = data.historical_days
  const futureDates = data.forecast.dates.slice(futureIndexStart)
  const futurePredicted = data.forecast.predicted.slice(futureIndexStart)
  const futureLower = data.forecast.lower_bound.slice(futureIndexStart)
  const futureUpper = data.forecast.upper_bound.slice(futureIndexStart)

  return (
    <Card className="p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-xl font-semibold">{title}</h3>
        {onExport && (
          <Button variant="outline" size="sm" onClick={onExport}>
            <Download className="h-4 w-4 mr-2" />
            Exportar CSV
          </Button>
        )}
      </div>
      
      {/* Stats */}
      <div className="grid grid-cols-3 gap-4 mb-6">
        <div>
          <p className="text-sm text-muted-foreground">Média Prevista</p>
          <p className="text-lg font-bold">
            {formatCurrency(data.trend.avg_next_30_days)}
          </p>
        </div>
        <div>
          <p className="text-sm text-muted-foreground">Mínimo</p>
          <p className="text-lg font-bold text-orange-600">
            {formatCurrency(data.trend.min_predicted)}
          </p>
        </div>
        <div>
          <p className="text-sm text-muted-foreground">Máximo</p>
          <p className="text-lg font-bold text-green-600">
            {formatCurrency(data.trend.max_predicted)}
          </p>
        </div>
      </div>

      {/* Gráfico Interativo */}
      <ForecastLineChart
        dates={futureDates}
        predicted={futurePredicted}
        lowerBound={futureLower}
        upperBound={futureUpper}
        title={title}
        color={color}
        currency={true}
      />

      {/* Tendência */}
      <div className="mt-6 p-4 bg-muted/50 rounded-lg">
        <div className="flex items-center gap-2">
          {data.trend.trend_direction === 'alta' ? (
            <TrendingUp className="h-5 w-5 text-green-600" />
          ) : data.trend.trend_direction === 'baixa' ? (
            <TrendingDown className="h-5 w-5 text-red-600" />
          ) : (
            <span className="text-muted-foreground">→</span>
          )}
          <span className="font-semibold">
            Tendência: {data.trend.trend_direction.toUpperCase()}
          </span>
          <span className="text-sm text-muted-foreground">
            ({data.trend.trend_change_percent > 0 ? '+' : ''}
            {data.trend.trend_change_percent.toFixed(1)}%)
          </span>
        </div>
      </div>
    </Card>
  )
}

function FluxoCaixaView({
  data,
  formatCurrency,
  formatDate,
  onExport
}: {
  data: FluxoCaixaData
  formatCurrency: (n: number) => string
  formatDate: (s: string) => string
  onExport?: () => void
}) {
  return (
    <Card className="p-6">
      <div className="flex items-center justify-between mb-6">
        <h3 className="text-xl font-semibold">Projeção de Fluxo de Caixa</h3>
        {onExport && (
          <Button variant="outline" size="sm" onClick={onExport}>
            <Download className="h-4 w-4 mr-2" />
            Exportar CSV
          </Button>
        )}
      </div>

      {/* Resumo */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
        <div>
          <p className="text-sm text-muted-foreground">Total Receitas</p>
          <p className="text-lg font-bold text-green-600">
            {formatCurrency(data.resumo.total_receitas)}
          </p>
        </div>
        <div>
          <p className="text-sm text-muted-foreground">Total Despesas</p>
          <p className="text-lg font-bold text-red-600">
            {formatCurrency(data.resumo.total_despesas)}
          </p>
        </div>
        <div>
          <p className="text-sm text-muted-foreground">Saldo Final</p>
          <p className={`text-lg font-bold ${
            data.resumo.saldo_final > 0 ? 'text-green-600' : 'text-red-600'
          }`}>
            {formatCurrency(data.resumo.saldo_final)}
          </p>
        </div>
        <div>
          <p className="text-sm text-muted-foreground">Dias Negativos</p>
          <p className="text-lg font-bold text-yellow-600">
            {data.resumo.dias_negativos}
          </p>
        </div>
      </div>

      {/* Alertas */}
      {data.periodos_criticos.length > 0 && (
        <Alert className="mb-6">
          <AlertTriangle className="h-4 w-4" />
          <AlertDescription>
            <strong>Atenção!</strong> {data.resumo.dias_negativos} dia(s) com saldo negativo previsto.
            Maior déficit: {formatCurrency(data.resumo.maior_deficit)}
          </AlertDescription>
        </Alert>
      )}

      {/* Gráfico Interativo */}
      <FluxoCaixaChart
        dates={data.dates}
        receitas={data.receitas_previstas}
        despesas={data.despesas_previstas}
        saldo={data.saldo_acumulado}
      />

      {/* Períodos Críticos */}
      {data.periodos_criticos.length > 0 && (
        <div className="mt-6">
          <h4 className="font-semibold mb-3">Períodos Críticos</h4>
          <div className="space-y-2">
            {data.periodos_criticos.slice(0, 5).map((periodo, i) => (
              <div key={i} className="flex items-center justify-between p-3 bg-red-50 dark:bg-red-950/20 rounded-lg">
                <div className="flex items-center gap-2">
                  <AlertTriangle className="h-4 w-4 text-red-600" />
                  <span className="text-sm font-medium">{formatDate(periodo.date)}</span>
                </div>
                <div className="text-right">
                  <p className="text-sm text-red-600 font-bold">
                    {formatCurrency(periodo.saldo)}
                  </p>
                  <p className="text-xs text-muted-foreground">
                    Déficit: {formatCurrency(periodo.deficit)}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}
    </Card>
  )
}

function AnomaliesView({
  receitasAnomalies,
  despesasAnomalies,
  formatCurrency
}: {
  receitasAnomalies: any[]
  despesasAnomalies: any[]
  formatCurrency: (n: number) => string
}) {
  return (
    <div className="grid gap-4 md:grid-cols-2">
      <Card className="p-6">
        <h3 className="text-xl font-semibold mb-4">Anomalias em Receitas</h3>
        {receitasAnomalies.length === 0 ? (
          <p className="text-muted-foreground">Nenhuma anomalia detectada</p>
        ) : (
          <div className="space-y-3">
            {receitasAnomalies.map((anomaly, i) => (
              <div key={i} className="p-3 border rounded-lg">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold">{anomaly.date}</span>
                  <Badge variant={anomaly.severity === 'alta' ? 'destructive' : 'default'}>
                    {anomaly.severity}
                  </Badge>
                </div>
                <div className="text-sm space-y-1">
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Valor Real:</span>
                    <span className="font-semibold">{formatCurrency(anomaly.actual)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Valor Esperado:</span>
                    <span>{formatCurrency(anomaly.expected)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Desvio:</span>
                    <span className={anomaly.deviation > 0 ? 'text-green-600' : 'text-red-600'}>
                      {formatCurrency(anomaly.deviation)}
                    </span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </Card>

      <Card className="p-6">
        <h3 className="text-xl font-semibold mb-4">Anomalias em Despesas</h3>
        {despesasAnomalies.length === 0 ? (
          <p className="text-muted-foreground">Nenhuma anomalia detectada</p>
        ) : (
          <div className="space-y-3">
            {despesasAnomalies.map((anomaly, i) => (
              <div key={i} className="p-3 border rounded-lg">
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold">{anomaly.date}</span>
                  <Badge variant={anomaly.severity === 'alta' ? 'destructive' : 'default'}>
                    {anomaly.severity}
                  </Badge>
                </div>
                <div className="text-sm space-y-1">
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Valor Real:</span>
                    <span className="font-semibold">{formatCurrency(anomaly.actual)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Valor Esperado:</span>
                    <span>{formatCurrency(anomaly.expected)}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-muted-foreground">Desvio:</span>
                    <span className={anomaly.deviation > 0 ? 'text-red-600' : 'text-green-600'}>
                      {formatCurrency(anomaly.deviation)}
                    </span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </Card>
    </div>
  )
}
