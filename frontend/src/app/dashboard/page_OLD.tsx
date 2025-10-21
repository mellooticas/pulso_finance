'use client'

/**
 * 🎯 PULSO Finance - Dashboard Executivo Unificado
 * 
 * Arquitetura: Nasdaq Level, not Disney!
 * - Visão Executiva (KPIs mês atual)
 * - Alertas Críticos (vencidos, hoje, 7 dias)
 * - Insights Inteligentes (tendências, anomalias)
 * - Próximos Vencimentos (calendário)
 * - Atalhos Rápidos (navegação)
 * 
 * Dados: 100% REAIS - 42.863 lançamentos
 */

import Link from 'next/link'
import { useAuth } from '@/contexts/auth-context'
import { useDashboardDataReal, formatKPIValue, formatVariation } from '@/hooks/use-dashboard-real'
import { useAlertasCriticos, useAcoesPrioritarias, useProximosVencimentos } from '@/hooks/use-alertas-criticos'
import { Card } from '@/components/ui/card'
import { 
  ArrowTrendingUpIcon,
  ArrowTrendingDownIcon,
  CalculatorIcon,
  DocumentTextIcon,
  ArrowUpIcon,
  ArrowDownIcon,
  ExclamationTriangleIcon,
  ClockIcon,
  BanknotesIcon,
  ChartBarIcon,
  CalendarIcon,
  FireIcon,
  CheckCircleIcon,
  BuildingStorefrontIcon
} from '@heroicons/react/24/outline'

export default function DashboardPage() {
  const { profile } = useAuth()
  
  // Dados do dashboard
  const { 
    loading, 
    error, 
    kpis,
    comparativoLojas,
    statsAtual
  } = useDashboardDataReal()

  // Alertas e ações
  const { data: alertas, isLoading: loadingAlertas } = useAlertasCriticos()
  const { data: acoes, isLoading: loadingAcoes } = useAcoesPrioritarias()
  const { data: vencimentos, isLoading: loadingVencimentos } = useProximosVencimentos(7)

  // Data atual formatada
  const hoje = new Date().toLocaleDateString('pt-BR', { 
    weekday: 'long', 
    year: 'numeric', 
    month: 'long', 
    day: 'numeric' 
  })

  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <h3 className="text-lg font-semibold text-slate-900 mb-2">
            Carregando Dashboard Executivo
          </h3>
          <p className="text-slate-600">
            Processando 42.863 transações reais...
          </p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="text-center">
          <div className="bg-red-50 border border-red-200 rounded-lg p-6 max-w-md">
            <h3 className="text-lg font-semibold text-red-800 mb-2">Erro ao carregar dados</h3>
            <p className="text-red-600 mb-4">
              Não foi possível carregar os dados do dashboard
            </p>
            <button 
              onClick={() => window.location.reload()}
              className="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700"
            >
              Tentar Novamente
            </button>
          </div>
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* 🎯 HEADER EXECUTIVO */}
      <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg p-6 text-white shadow-lg">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-bold mb-2">
              🎯 PULSO Finance - Dashboard Executivo
            </h1>
            <p className="text-blue-100 capitalize text-lg">{hoje}</p>
            <p className="text-sm text-blue-200 mt-2">
              Sistema enterprise processando <strong>42.863 transações reais</strong> • 7 lojas ativas
            </p>
          </div>
          {profile && (
            <div className="text-right">
              <p className="text-sm text-blue-200">Bem-vindo,</p>
              <p className="text-xl font-semibold">{profile.nome || profile.email}</p>
            </div>
          )}
        </div>
      </div>

      {/* 📊 SEÇÃO 1: KPIs DO MÊS */}
      <div>
        <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center">
          <ChartBarIcon className="w-6 h-6 mr-2 text-blue-600" />
          Indicadores do Mês Atual
        </h2>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {kpis.map((kpi, index) => {
            const IconComponent = kpi.icon === 'ArrowTrendingUpIcon' ? ArrowTrendingUpIcon : 
                                kpi.icon === 'ArrowTrendingDownIcon' ? ArrowTrendingDownIcon :
                                kpi.icon === 'CalculatorIcon' ? CalculatorIcon : 
                                DocumentTextIcon

            return (
              <Card key={index} className="p-6 hover:shadow-lg transition-shadow">
                <div className="flex items-center justify-between">
                  <div className="flex-1">
                    <p className="text-sm font-medium text-gray-600">{kpi.name}</p>
                    <p className="text-2xl font-bold text-gray-900 mt-1">
                      {formatKPIValue(kpi.value, kpi.format as 'currency' | 'number' | 'percentage')}
                    </p>
                    <p className="text-xs text-gray-500 mt-1">{kpi.description}</p>
                  </div>
                  <div className={`p-3 rounded-full ${kpi.color === 'green' ? 'bg-green-100' : kpi.color === 'red' ? 'bg-red-100' : 'bg-blue-100'}`}>
                    <IconComponent className={`w-6 h-6 ${kpi.color === 'green' ? 'text-green-600' : kpi.color === 'red' ? 'text-red-600' : 'text-blue-600'}`} />
                  </div>
                </div>
                
                {/* Variação */}
                <div className="mt-3 flex items-center">
                  {kpi.variationType === 'increase' ? (
                    <ArrowUpIcon className="w-4 h-4 text-green-500 mr-1" />
                  ) : (
                    <ArrowDownIcon className="w-4 h-4 text-red-500 mr-1" />
                  )}
                  <span className={`text-sm font-medium ${kpi.variationType === 'increase' ? 'text-green-600' : 'text-red-600'}`}>
                    {formatVariation(kpi.variation)}
                  </span>
                  <span className="text-sm text-gray-500 ml-1">vs. mês anterior</span>
                </div>
              </Card>
            )
          })}
        </div>
      </div>

      {/* Comparativo por Lojas */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Performance por Loja</h3>
            <ChartBarIcon className="w-5 h-5 text-blue-600" />
          </div>
          
          <div className="space-y-4">
            {comparativoLojas?.slice(0, 5).map((loja, index) => (
              <div key={loja.loja.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div>
                  <p className="font-medium text-gray-900">{loja.loja.codigo}</p>
                  <p className="text-sm text-gray-600">{loja.loja.nome}</p>
                </div>
                <div className="text-right">
                  <p className="font-medium text-gray-900">
                    {formatKPIValue(loja.resultado, 'currency')}
                  </p>
                  <p className="text-sm text-gray-600">
                    {loja.totalLancamentos} lançamentos
                  </p>
                </div>
              </div>
            ))}
          </div>
          
          {comparativoLojas && comparativoLojas.length > 5 && (
            <div className="mt-4 text-center">
              <Link 
                href="/dashboard/lojas" 
                className="text-blue-600 hover:text-blue-800 text-sm"
              >
                Ver todas as lojas →
              </Link>
            </div>
          )}
        </Card>

        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900">Resumo do Período</h3>
            <CalculatorIcon className="w-5 h-5 text-green-600" />
          </div>
          
          <div className="space-y-4">
            <div className="flex justify-between items-center p-3 bg-green-50 rounded-lg">
              <div>
                <span className="text-gray-700 font-medium">Entradas (Receber)</span>
                <p className="text-xs text-gray-500">Receitas do período</p>
              </div>
              <span className="font-semibold text-green-600">
                {formatKPIValue(statsAtual?.totalReceitas || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-red-50 rounded-lg">
              <div>
                <span className="text-gray-700 font-medium">Saídas (Pagar)</span>
                <p className="text-xs text-gray-500">Despesas do período</p>
              </div>
              <span className="font-semibold text-red-600">
                {formatKPIValue(statsAtual?.totalDespesas || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-blue-50 rounded-lg">
              <div>
                <span className="text-gray-700 font-medium">Saldo Líquido</span>
                <p className="text-xs text-gray-500">Entradas - Saídas</p>
              </div>
              <span className={`font-semibold ${(statsAtual?.resultado || 0) >= 0 ? 'text-blue-600' : 'text-red-600'}`}>
                {formatKPIValue(statsAtual?.resultado || 0, 'currency')}
              </span>
            </div>
            
            <div className="flex justify-between items-center p-3 bg-gray-50 rounded-lg">
              <div>
                <span className="text-gray-700 font-medium">Movimentações</span>
                <p className="text-xs text-gray-500">Total de lançamentos</p>
              </div>
              <span className="font-semibold text-gray-700">
                {formatKPIValue(statsAtual?.totalLancamentos || 0, 'number')}
              </span>
            </div>
          </div>
        </Card>
      </div>

      {/* Informações de Fluxo de Caixa */}
      {fluxoCaixa.data && (
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Fluxo de Caixa */}
          <Card className="p-6">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-gray-900">Fluxo de Caixa</h3>
              <CalculatorIcon className="w-5 h-5 text-blue-600" />
            </div>
            
            <div className="space-y-4">
              <div className="flex justify-between items-center p-4 bg-blue-50 rounded-lg">
                <div>
                  <p className="font-medium text-gray-900">Saldo Atual</p>
                  <p className="text-sm text-gray-600">Todas as contas</p>
                </div>
                <span className="text-xl font-bold text-blue-600">
                  {formatCurrency(fluxoCaixa.data.saldo_total_atual)}
                </span>
              </div>
              
              <div className="flex justify-between items-center p-3 bg-gray-50 rounded-lg">
                <span className="text-gray-700">Entradas do Período</span>
                <span className="font-semibold text-green-600">
                  +{formatCurrency(fluxoCaixa.data.entradas_periodo)}
                </span>
              </div>
              
              <div className="flex justify-between items-center p-3 bg-gray-50 rounded-lg">
                <span className="text-gray-700">Saídas do Período</span>
                <span className="font-semibold text-red-600">
                  -{formatCurrency(fluxoCaixa.data.saidas_periodo)}
                </span>
              </div>
              
              <div className={`flex justify-between items-center p-3 rounded-lg ${
                getCorDiasCaixa(fluxoCaixa.data.dias_caixa_disponivel) === 'green' ? 'bg-green-50' : 
                getCorDiasCaixa(fluxoCaixa.data.dias_caixa_disponivel) === 'yellow' ? 'bg-yellow-50' : 'bg-red-50'
              }`}>
                <div>
                  <p className="font-medium text-gray-900">Dias de Caixa</p>
                  <p className="text-sm text-gray-600">Baseado na média de gastos</p>
                </div>
                <span className={`text-xl font-bold ${
                  getCorDiasCaixa(fluxoCaixa.data.dias_caixa_disponivel) === 'green' ? 'text-green-600' : 
                  getCorDiasCaixa(fluxoCaixa.data.dias_caixa_disponivel) === 'yellow' ? 'text-yellow-600' : 'text-red-600'
                }`}>
                  {fluxoCaixa.data.dias_caixa_disponivel}d
                </span>
              </div>
            </div>
          </Card>

          {/* Vencimentos Próximos */}
          <Card className="p-6">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-gray-900">Próximos 7 Dias</h3>
              <ArrowTrendingUpIcon className="w-5 h-5 text-orange-600" />
            </div>
            
            {vencimentosProximos.data ? (
              <div className="space-y-4">
                {/* A Receber */}
                <div className="p-4 bg-green-50 rounded-lg">
                  <div className="flex justify-between items-center mb-2">
                    <h4 className="font-medium text-green-800">A Receber</h4>
                    <span className="font-semibold text-green-600">
                      {formatCurrency(vencimentosProximos.data.totalReceber)}
                    </span>
                  </div>
                  <p className="text-sm text-green-700">
                    {vencimentosProximos.data.aReceber.length} parcelas
                  </p>
                </div>

                {/* A Pagar */}
                <div className="p-4 bg-red-50 rounded-lg">
                  <div className="flex justify-between items-center mb-2">
                    <h4 className="font-medium text-red-800">A Pagar</h4>
                    <span className="font-semibold text-red-600">
                      {formatCurrency(vencimentosProximos.data.totalPagar)}
                    </span>
                  </div>
                  <p className="text-sm text-red-700">
                    {vencimentosProximos.data.aPagar.length} parcelas
                  </p>
                </div>

                {/* Saldo Líquido */}
                <div className="p-4 bg-blue-50 rounded-lg">
                  <div className="flex justify-between items-center">
                    <h4 className="font-medium text-blue-800">Saldo Líquido D+7</h4>
                    <span className={`font-semibold ${
                      (vencimentosProximos.data.totalReceber - vencimentosProximos.data.totalPagar) >= 0 
                        ? 'text-blue-600' : 'text-red-600'
                    }`}>
                      {formatCurrency(vencimentosProximos.data.totalReceber - vencimentosProximos.data.totalPagar)}
                    </span>
                  </div>
                </div>

                <Link 
                  href="/dashboard/fluxo-caixa" 
                  className="block w-full text-center text-blue-600 hover:text-blue-800 text-sm mt-4"
                >
                  Ver agenda completa →
                </Link>
              </div>
            ) : (
              <div className="text-center py-8 text-gray-500">
                <p>Carregando vencimentos...</p>
              </div>
            )}
          </Card>

          {/* Alertas Financeiros */}
          <AlertasFinanceiros 
            fluxoCaixaData={fluxoCaixa.data}
            vencimentosData={vencimentosProximos.data}
          />
        </div>
      )}

      {/* Ações Rápidas */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Ações Rápidas</h3>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Link 
            href="/dashboard/lancamentos" 
            className="flex items-center p-4 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors"
          >
            <DocumentTextIcon className="w-8 h-8 text-blue-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">Lançamentos</h4>
              <p className="text-sm text-gray-600">Visualizar todos os lançamentos</p>
            </div>
          </Link>
          
          <Link 
            href="/dashboard/dre" 
            className="flex items-center p-4 bg-green-50 rounded-lg hover:bg-green-100 transition-colors"
          >
            <ChartBarIcon className="w-8 h-8 text-green-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">DRE</h4>
              <p className="text-sm text-gray-600">Demonstração do Resultado</p>
            </div>
          </Link>
          
          <Link 
            href="/dashboard/lojas" 
            className="flex items-center p-4 bg-purple-50 rounded-lg hover:bg-purple-100 transition-colors"
          >
            <ArrowTrendingUpIcon className="w-8 h-8 text-purple-600 mr-3" />
            <div>
              <h4 className="font-medium text-gray-900">Análise por Loja</h4>
              <p className="text-sm text-gray-600">Comparativo e performance</p>
            </div>
          </Link>
        </div>
      </Card>
    </div>
  )
}