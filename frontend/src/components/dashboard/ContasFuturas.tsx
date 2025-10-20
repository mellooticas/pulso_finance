/**
 * PULSO Finance - Painel de Contas Futuras
 * Mostra contas a receber/pagar e projeções de fluxo
 */

import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
// Tabs simples (substituir depois com radix-ui)
const Tabs = ({ children, defaultValue, ...props }: any) => {
  const [activeTab, setActiveTab] = React.useState(defaultValue)
  return (
    <div {...props}>
      {React.Children.map(children, child => 
        React.cloneElement(child, { activeTab, setActiveTab })
      )}
    </div>
  )
}
const TabsList = ({ children, activeTab, setActiveTab }: any) => (
  <div className="flex border-b mb-4">
    {React.Children.map(children, (child, i) => 
      React.cloneElement(child, { activeTab, setActiveTab, index: i })
    )}
  </div>
)
const TabsTrigger = ({ children, value, activeTab, setActiveTab }: any) => (
  <button 
    onClick={() => setActiveTab(value)}
    className={`px-4 py-2 ${activeTab === value ? 'border-b-2 border-blue-500' : ''}`}
  >
    {children}
  </button>
)
const TabsContent = ({ children, value, activeTab }: any) => 
  activeTab === value ? <div>{children}</div> : null
import { Progress } from '@/components/ui/progress'
import { 
  useContasPendentes, 
  useProjecaoFluxo, 
  useDREComparativo 
} from '@/hooks/useContasFuturas'
import { 
  Calendar,
  TrendingUp,
  TrendingDown,
  AlertTriangle,
  DollarSign,
  Clock,
  BarChart3
} from 'lucide-react'

interface ContasFuturasProps {
  loja_id?: string
  className?: string
}

export default function ContasFuturas({ loja_id, className }: ContasFuturasProps) {
  // Data hooks
  const { data: contasPendentes, isLoading: loadingContas } = useContasPendentes({ loja_id })
  const { data: projecaoFluxo, isLoading: loadingProjecao } = useProjecaoFluxo({ 
    meses_adiante: 6,
    loja_id 
  })

  // DRE comparativo para período atual
  const periodoAtual = {
    inicio: new Date(new Date().getFullYear(), new Date().getMonth(), 1).toISOString().split('T')[0],
    fim: new Date().toISOString().split('T')[0]
  }
  
  const { data: dreComparativo, isLoading: loadingDRE } = useDREComparativo({
    periodo: periodoAtual,
    loja_id
  })

  // Formatadores
  const formatCurrency = (value: number) => 
    new Intl.NumberFormat('pt-BR', { 
      style: 'currency', 
      currency: 'BRL' 
    }).format(value)

  const formatDate = (dateStr: string) =>
    new Date(dateStr + 'T00:00:00').toLocaleDateString('pt-BR')

  if (loadingContas || loadingProjecao || loadingDRE) {
    return (
      <div className={`animate-pulse ${className}`}>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {[1,2,3].map(i => (
            <div key={i} className="h-32 bg-gray-200 rounded-lg" />
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className={`space-y-6 ${className}`}>
      {/* KPIs Resumo */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card className="bg-gradient-to-br from-green-50 to-green-100">
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium flex items-center gap-2">
              <TrendingUp className="h-4 w-4 text-green-600" />
              A Receber
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-green-700">
              {formatCurrency(contasPendentes?.totais?.total_geral || 0)}
            </div>
            <p className="text-xs text-green-600">
              {contasPendentes?.resumo?.total_contas || 0} contas pendentes
            </p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-red-50 to-red-100">
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium flex items-center gap-2">
              <TrendingDown className="h-4 w-4 text-red-600" />
              Vencidas
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-red-700">
              {formatCurrency(contasPendentes?.totais?.vencidas || 0)}
            </div>
            <p className="text-xs text-red-600">
              {contasPendentes?.contas_por_status?.vencidas?.length || 0} contas
            </p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-blue-50 to-blue-100">
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium flex items-center gap-2">
              <BarChart3 className="h-4 w-4 text-blue-600" />
              Projeção 6M
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-blue-700">
              {formatCurrency(projecaoFluxo?.totais?.saldo_previsto || 0)}
            </div>
            <p className="text-xs text-blue-600">
              Fluxo líquido futuro
            </p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-yellow-50 to-yellow-100">
          <CardHeader className="pb-2">
            <CardTitle className="text-sm font-medium flex items-center gap-2">
              <AlertTriangle className="h-4 w-4 text-yellow-600" />
              Gap Realização
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-yellow-700">
              {formatCurrency(Math.abs(dreComparativo?.diferencas?.resultado || 0))}
            </div>
            <p className="text-xs text-yellow-600">
              Competência vs Caixa
            </p>
          </CardContent>
        </Card>
      </div>

      {/* Tabs Principais */}
      <Tabs defaultValue="pendentes" className="w-full">
        <TabsList className="grid w-full grid-cols-3">
          <TabsTrigger value="pendentes">Contas Pendentes</TabsTrigger>
          <TabsTrigger value="projecao">Projeção Fluxo</TabsTrigger>
          <TabsTrigger value="comparativo">Competência vs Caixa</TabsTrigger>
        </TabsList>

        {/* Contas Pendentes */}
        <TabsContent value="pendentes" className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Vencidas */}
            <Card className="border-red-200">
              <CardHeader>
                <CardTitle className="text-red-700 flex items-center gap-2">
                  <AlertTriangle className="h-5 w-5" />
                  Contas Vencidas
                </CardTitle>
              </CardHeader>
              <CardContent className="max-h-64 overflow-y-auto">
                {contasPendentes?.contas_por_status?.vencidas?.map((conta: any, idx: number) => (
                  <div key={idx} className="flex justify-between items-center py-2 border-b last:border-b-0">
                    <div>
                      <p className="font-medium text-sm">
                        {conta.lancamento?.descricao || 'Sem descrição'}
                      </p>
                      <p className="text-xs text-gray-500">
                        Venc: {formatDate(conta.data_vencimento)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-red-600">
                        {formatCurrency(conta.valor_parcela)}
                      </p>
                      <Badge variant="destructive" className="text-xs">
                        {Math.floor((new Date().getTime() - new Date(conta.data_vencimento).getTime()) / (1000 * 3600 * 24))} dias
                      </Badge>
                    </div>
                  </div>
                )) || (
                  <p className="text-center text-gray-500 py-4">
                    🎉 Nenhuma conta vencida!
                  </p>
                )}
              </CardContent>
            </Card>

            {/* Vencendo em 7 dias */}
            <Card className="border-yellow-200">
              <CardHeader>
                <CardTitle className="text-yellow-700 flex items-center gap-2">
                  <Clock className="h-5 w-5" />
                  Vencendo em 7 Dias
                </CardTitle>
              </CardHeader>
              <CardContent className="max-h-64 overflow-y-auto">
                {contasPendentes?.contas_por_status?.vencendo_7_dias?.map((conta: any, idx: number) => (
                  <div key={idx} className="flex justify-between items-center py-2 border-b last:border-b-0">
                    <div>
                      <p className="font-medium text-sm">
                        {conta.lancamento?.descricao || 'Sem descrição'}
                      </p>
                      <p className="text-xs text-gray-500">
                        Venc: {formatDate(conta.data_vencimento)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-bold text-yellow-600">
                        {formatCurrency(conta.valor_parcela)}
                      </p>
                    </div>
                  </div>
                )) || (
                  <p className="text-center text-gray-500 py-4">
                    Nenhuma conta vencendo em breve
                  </p>
                )}
              </CardContent>
            </Card>
          </div>
        </TabsContent>

        {/* Projeção Fluxo */}
        <TabsContent value="projecao" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Projeção de Fluxo de Caixa - Próximos 6 Meses</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {Object.entries(projecaoFluxo?.projecao_mensal || {}).map(([mes, dados]: any) => {
                  const saldoPositivo = dados.saldo_previsto >= 0
                  const progressValue = Math.min(Math.abs(dados.saldo_previsto) / 10000 * 100, 100)
                  
                  return (
                    <div key={mes} className="space-y-2">
                      <div className="flex justify-between items-center">
                        <span className="font-medium">
                          {new Date(mes + '-01').toLocaleDateString('pt-BR', { 
                            month: 'long', 
                            year: 'numeric' 
                          })}
                        </span>
                        <div className="text-right">
                          <p className={`font-bold ${saldoPositivo ? 'text-green-600' : 'text-red-600'}`}>
                            {formatCurrency(dados.saldo_previsto)}
                          </p>
                          <p className="text-xs text-gray-500">
                            +{formatCurrency(dados.entradas_previstas)} | 
                            -{formatCurrency(dados.saidas_previstas)}
                          </p>
                        </div>
                      </div>
                      
                      <Progress 
                        value={progressValue} 
                        className={`h-2 ${saldoPositivo ? 'bg-green-100' : 'bg-red-100'}`}
                      />
                      
                      <p className="text-xs text-gray-600">
                        {dados.transacoes.length} transações previstas
                      </p>
                    </div>
                  )
                })}
              </div>

              {/* Alertas */}
              {projecaoFluxo?.alertas && (
                <div className="mt-6 p-4 bg-yellow-50 rounded-lg">
                  <h4 className="font-medium text-yellow-800 mb-2">⚠️ Alertas:</h4>
                  <ul className="text-sm text-yellow-700 space-y-1">
                    {projecaoFluxo.alertas.meses_negativos > 0 && (
                      <li>• {projecaoFluxo.alertas.meses_negativos} meses com fluxo negativo</li>
                    )}
                    {projecaoFluxo.alertas.mês_crítico && (
                      <li>• Mês mais crítico: {projecaoFluxo.alertas.mês_crítico.mes}</li>
                    )}
                  </ul>
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>

        {/* Competência vs Caixa */}
        <TabsContent value="comparativo" className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <Card>
              <CardHeader>
                <CardTitle className="text-blue-700">Por Competência</CardTitle>
                <p className="text-sm text-gray-600">Lançamentos do período</p>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span>Receitas:</span>
                    <span className="font-bold text-green-600">
                      {formatCurrency(dreComparativo?.competencia?.total_receitas || 0)}
                    </span>
                  </div>
                  <div className="flex justify-between">
                    <span>Despesas:</span>
                    <span className="font-bold text-red-600">
                      {formatCurrency(dreComparativo?.competencia?.total_despesas || 0)}
                    </span>
                  </div>
                  <hr />
                  <div className="flex justify-between text-lg">
                    <span className="font-bold">Resultado:</span>
                    <span className={`font-bold ${
                      (dreComparativo?.competencia?.resultado || 0) >= 0 ? 'text-green-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(dreComparativo?.competencia?.resultado || 0)}
                    </span>
                  </div>
                </div>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-purple-700">Por Caixa</CardTitle>
                <p className="text-sm text-gray-600">Apenas valores realizados</p>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  <div className="flex justify-between">
                    <span>Receitas:</span>
                    <span className="font-bold text-green-600">
                      {formatCurrency(dreComparativo?.caixa?.total_receitas || 0)}
                    </span>
                  </div>
                  <div className="flex justify-between">
                    <span>Despesas:</span>
                    <span className="font-bold text-red-600">
                      {formatCurrency(dreComparativo?.caixa?.total_despesas || 0)}
                    </span>
                  </div>
                  <hr />
                  <div className="flex justify-between text-lg">
                    <span className="font-bold">Resultado:</span>
                    <span className={`font-bold ${
                      (dreComparativo?.caixa?.resultado || 0) >= 0 ? 'text-green-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(dreComparativo?.caixa?.resultado || 0)}
                    </span>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* Gap Analysis */}
          <Card className="bg-gradient-to-r from-orange-50 to-yellow-50">
            <CardHeader>
              <CardTitle className="text-orange-700">📊 Análise do Gap</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div className="text-center">
                  <p className="text-sm text-gray-600">Contas a Receber</p>
                  <p className="text-xl font-bold text-blue-600">
                    {formatCurrency(dreComparativo?.analise?.contas_a_receber || 0)}
                  </p>
                </div>
                <div className="text-center">
                  <p className="text-sm text-gray-600">Contas a Pagar</p>
                  <p className="text-xl font-bold text-red-600">
                    {formatCurrency(dreComparativo?.analise?.contas_a_pagar || 0)}
                  </p>
                </div>
                <div className="text-center">
                  <p className="text-sm text-gray-600">Gap Total</p>
                  <p className="text-xl font-bold text-orange-600">
                    {formatCurrency(dreComparativo?.analise?.gap_fluxo || 0)}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}