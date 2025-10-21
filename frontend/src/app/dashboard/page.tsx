'use client'

/**
 * 🎯 PULSO Finance - Dashboard Executivo Unificado
 * 
 * Arquitetura: Nasdaq Level, not Disney!
 * - Visão Executiva (KPIs mês atual)
 * - Alertas Críticos (vencidos, hoje, 7 dias)
 * - Top 3 Lojas
 * - Ações Prioritárias
 * - Próximos Vencimentos
 * - Atalhos Rápidos
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
  BuildingStorefrontIcon,
  CurrencyDollarIcon,
  XCircleIcon
} from '@heroicons/react/24/outline'

// Função para formatar moeda
const formatCurrency = (value: number) => {
  return new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL'
  }).format(value || 0)
}

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

  const mesAtual = new Date().toLocaleDateString('pt-BR', { 
    month: 'long', 
    year: 'numeric' 
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

      {/* 🚨 SEÇÃO 2: ALERTAS CRÍTICOS */}
      {!loadingAlertas && alertas && alertas.alertas && alertas.alertas.length > 0 && (
        <div>
          <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center">
            <ExclamationTriangleIcon className="w-6 h-6 mr-2 text-red-600" />
            Alertas Críticos - Ação Imediata
          </h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {alertas.alertas.map((alerta, idx) => (
              <Card 
                key={idx}
                className={`p-6 border-l-4 ${
                  alerta.tipo === 'vencido' ? 'border-red-500 bg-red-50' :
                  alerta.tipo === 'vence_hoje' ? 'border-orange-500 bg-orange-50' :
                  'border-yellow-500 bg-yellow-50'
                }`}
              >
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    {alerta.tipo === 'vencido' && <XCircleIcon className="w-8 h-8 text-red-600 mb-2" />}
                    {alerta.tipo === 'vence_hoje' && <ClockIcon className="w-8 h-8 text-orange-600 mb-2" />}
                    {alerta.tipo === 'vence_7dias' && <CalendarIcon className="w-8 h-8 text-yellow-600 mb-2" />}
                    
                    <h3 className="font-semibold text-gray-900 mb-1">
                      {alerta.tipo === 'vencido' && '🚨 VENCIDO'}
                      {alerta.tipo === 'vence_hoje' && '⏰ VENCE HOJE'}
                      {alerta.tipo === 'vence_7dias' && '📅 PRÓXIMOS 7 DIAS'}
                    </h3>
                    <p className="text-sm text-gray-700 mb-3">{alerta.mensagem}</p>
                    <p className="text-2xl font-bold text-gray-900">
                      {formatCurrency(alerta.valor_total)}
                    </p>
                    <p className="text-xs text-gray-600 mt-1">
                      {alerta.quantidade} parcelas
                    </p>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        </div>
      )}

      {/* 📊 SEÇÃO 1: KPIs DO MÊS */}
      <div>
        <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center">
          <ChartBarIcon className="w-6 h-6 mr-2 text-blue-600" />
          Indicadores de {mesAtual}
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

      {/* 💼 SEÇÃO 3: AÇÕES PRIORITÁRIAS + TOP 3 LOJAS */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Ações Prioritárias */}
        {!loadingAcoes && acoes && acoes.acoes && acoes.acoes.length > 0 && (
          <Card className="p-6">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-lg font-semibold text-gray-900 flex items-center">
                <FireIcon className="w-5 h-5 mr-2 text-orange-600" />
                Ações Prioritárias Hoje
              </h3>
            </div>
            
            <div className="space-y-3">
              {acoes.acoes.slice(0, 5).map((acao, idx) => (
                <div key={idx} className="p-4 bg-orange-50 border border-orange-200 rounded-lg">
                  <div className="flex justify-between items-start mb-2">
                    <div className="flex-1">
                      <p className="font-semibold text-gray-900 text-sm">{acao.descricao}</p>
                      <p className="text-xs text-gray-600 mt-1">
                        {acao.loja} • {acao.quantidade} parcela{acao.quantidade > 1 ? 's' : ''}
                        {acao.dias_vencido > 0 && (
                          <span className="text-red-600 ml-2">
                            • Vencido há {acao.dias_vencido} dia{acao.dias_vencido > 1 ? 's' : ''}
                          </span>
                        )}
                      </p>
                    </div>
                    <span className="text-lg font-bold text-red-600 ml-3">
                      {formatCurrency(acao.valor)}
                    </span>
                  </div>
                </div>
              ))}
            </div>

            {acoes.total_acoes > 5 && (
              <Link 
                href="/dashboard/contas-pagar"
                className="block w-full text-center text-orange-600 hover:text-orange-800 text-sm mt-4 font-medium"
              >
                Ver todas as {acoes.total_acoes} ações →
              </Link>
            )}
          </Card>
        )}

        {/* Top 3 Lojas */}
        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900 flex items-center">
              <BuildingStorefrontIcon className="w-5 h-5 mr-2 text-blue-600" />
              Performance por Loja
            </h3>
          </div>
          
          <div className="space-y-4">
            {comparativoLojas?.slice(0, 3).map((loja, index) => (
              <div key={loja.loja.id} className="p-4 bg-gray-50 rounded-lg">
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center">
                    <span className="text-2xl mr-3">
                      {index === 0 && '🥇'}
                      {index === 1 && '🥈'}
                      {index === 2 && '🥉'}
                    </span>
                    <div>
                      <p className="font-semibold text-gray-900">{loja.loja.nome}</p>
                      <p className="text-xs text-gray-600">{loja.loja.codigo}</p>
                    </div>
                  </div>
                  <div className="text-right">
                    <p className={`text-lg font-bold ${loja.resultado >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                      {formatKPIValue(loja.resultado, 'currency')}
                    </p>
                    <p className="text-xs text-gray-600">
                      {loja.totalLancamentos} lançamentos
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
          
          {comparativoLojas && comparativoLojas.length > 3 && (
            <Link 
              href="/dashboard/lojas" 
              className="block w-full text-center text-blue-600 hover:text-blue-800 text-sm mt-4 font-medium"
            >
              Ver todas as {comparativoLojas.length} lojas →
            </Link>
          )}
        </Card>
      </div>

      {/* 📅 SEÇÃO 4: PRÓXIMOS VENCIMENTOS */}
      {!loadingVencimentos && vencimentos && vencimentos.calendario && (
        <Card className="p-6">
          <div className="flex items-center justify-between mb-4">
            <h3 className="text-lg font-semibold text-gray-900 flex items-center">
              <CalendarIcon className="w-5 h-5 mr-2 text-purple-600" />
              Próximos Vencimentos (7 dias)
            </h3>
            <div className="text-right">
              <p className="text-sm text-gray-600">{vencimentos.total_parcelas} parcelas</p>
              <p className="text-lg font-bold text-purple-600">
                {formatCurrency(vencimentos.valor_total)}
              </p>
            </div>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            {vencimentos.calendario.slice(0, 8).map((dia: any, idx: number) => {
              const dataFormatada = new Date(dia.data + 'T00:00:00').toLocaleDateString('pt-BR', {
                day: '2-digit',
                month: 'short'
              })
              
              return (
                <div key={idx} className="p-4 bg-purple-50 border border-purple-200 rounded-lg">
                  <p className="text-sm font-semibold text-purple-900 mb-1">{dataFormatada}</p>
                  <p className="text-xs text-gray-600 mb-2">
                    {dia.quantidade} parcela{dia.quantidade > 1 ? 's' : ''}
                  </p>
                  <p className="text-lg font-bold text-purple-600">
                    {formatCurrency(dia.valor_total)}
                  </p>
                </div>
              )
            })}
          </div>

          <Link 
            href="/dashboard/contas-pagar"
            className="block w-full text-center text-purple-600 hover:text-purple-800 text-sm mt-4 font-medium"
          >
            Ver calendário completo →
          </Link>
        </Card>
      )}

      {/* 🔗 SEÇÃO 5: ATALHOS RÁPIDOS */}
      <Card className="p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Navegação Rápida</h3>
        
        <div className="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-6 gap-4">
          <Link 
            href="/dashboard/dre" 
            className="p-4 bg-green-50 rounded-lg hover:bg-green-100 transition-colors text-center"
          >
            <ChartBarIcon className="w-8 h-8 text-green-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">DRE</p>
          </Link>
          
          <Link 
            href="/dashboard/fluxo-caixa" 
            className="p-4 bg-blue-50 rounded-lg hover:bg-blue-100 transition-colors text-center"
          >
            <CurrencyDollarIcon className="w-8 h-8 text-blue-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">Fluxo Caixa</p>
          </Link>
          
          <Link 
            href="/dashboard/lancamentos" 
            className="p-4 bg-purple-50 rounded-lg hover:bg-purple-100 transition-colors text-center"
          >
            <DocumentTextIcon className="w-8 h-8 text-purple-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">Lançamentos</p>
          </Link>
          
          <Link 
            href="/dashboard/contas-pagar" 
            className="p-4 bg-red-50 rounded-lg hover:bg-red-100 transition-colors text-center"
          >
            <BanknotesIcon className="w-8 h-8 text-red-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">Pagar</p>
          </Link>
          
          <Link 
            href="/dashboard/analise" 
            className="p-4 bg-orange-50 rounded-lg hover:bg-orange-100 transition-colors text-center"
          >
            <ChartBarIcon className="w-8 h-8 text-orange-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">Análise</p>
          </Link>
          
          <Link 
            href="/dashboard/lojas" 
            className="p-4 bg-indigo-50 rounded-lg hover:bg-indigo-100 transition-colors text-center"
          >
            <BuildingStorefrontIcon className="w-8 h-8 text-indigo-600 mx-auto mb-2" />
            <p className="text-sm font-medium text-gray-900">Lojas</p>
          </Link>
        </div>
      </Card>
    </div>
  )
}
