'use client'

import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'
import { TrendingUp, Database, FileSpreadsheet, RefreshCw } from 'lucide-react'

interface EmptyStateProps {
  onRetry: () => void
}

export function PrevisõesEmptyState({ onRetry }: EmptyStateProps) {
  return (
    <div className="flex items-center justify-center min-h-[600px] p-8">
      <Card className="max-w-2xl w-full p-12 text-center">
        <div className="flex justify-center mb-6">
          <div className="relative">
            <div className="absolute inset-0 bg-blue-500/20 blur-3xl rounded-full" />
            <TrendingUp className="h-24 w-24 text-blue-500 relative" />
          </div>
        </div>

        <h2 className="text-3xl font-bold mb-4">
          Previsões Financeiras com IA
        </h2>
        
        <p className="text-lg text-muted-foreground mb-8">
          Para gerar previsões precisas, precisamos de pelo menos{' '}
          <span className="font-semibold text-foreground">30 dias de histórico</span> de lançamentos pagos.
        </p>

        <div className="grid md:grid-cols-3 gap-6 mb-10 text-left">
          <div className="space-y-2">
            <div className="flex items-center gap-2 text-blue-600 dark:text-blue-400">
              <Database className="h-5 w-5" />
              <h3 className="font-semibold">1. Acumule Dados</h3>
            </div>
            <p className="text-sm text-muted-foreground">
              Continue cadastrando e pagando lançamentos normalmente
            </p>
          </div>

          <div className="space-y-2">
            <div className="flex items-center gap-2 text-green-600 dark:text-green-400">
              <FileSpreadsheet className="h-5 w-5" />
              <h3 className="font-semibold">2. Importe Histórico</h3>
            </div>
            <p className="text-sm text-muted-foreground">
              Ou importe dados históricos do seu sistema anterior
            </p>
          </div>

          <div className="space-y-2">
            <div className="flex items-center gap-2 text-purple-600 dark:text-purple-400">
              <TrendingUp className="h-5 w-5" />
              <h3 className="font-semibold">3. Visualize Previsões</h3>
            </div>
            <p className="text-sm text-muted-foreground">
              Volte aqui para ver gráficos e insights preditivos
            </p>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row gap-3 justify-center">
          <Button size="lg" asChild>
            <a href="/dashboard/lancamentos">
              Ver Lançamentos
            </a>
          </Button>
          <Button size="lg" variant="outline" onClick={onRetry}>
            <RefreshCw className="h-4 w-4 mr-2" />
            Verificar Novamente
          </Button>
        </div>

        <div className="mt-10 p-4 bg-muted/50 rounded-lg">
          <h4 className="font-semibold mb-2">O que você verá com dados suficientes:</h4>
          <ul className="text-sm text-muted-foreground space-y-1">
            <li>📈 Gráficos interativos de receitas e despesas futuras</li>
            <li>💰 Projeção de fluxo de caixa com alertas de períodos críticos</li>
            <li>⚠️ Detecção automática de anomalias e padrões incomuns</li>
            <li>📊 Análise de tendências com intervalos de confiança</li>
          </ul>
        </div>
      </Card>
    </div>
  )
}
