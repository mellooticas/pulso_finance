'use client';

/**
 * PULSO Finance - Dashboard de Decisões Enterprise
 * 
 * Não mostra números bonitos - mostra O QUE FAZER AGORA
 */

import { 
  useContasAPagarInteligente, 
  useContasAReceberInteligente,
  useAnaliseCentroCusto,
  useIndicadoresEnterprise,
  useDecisoesHoje
} from '@/hooks/useFinancialIntelligence';
import { 
  AlertTriangle, 
  TrendingUp, 
  TrendingDown, 
  Clock, 
  DollarSign,
  CheckCircle2,
  XCircle,
  AlertCircle,
  BarChart3,
  Calendar,
  Users
} from 'lucide-react';

export default function DashboardDecisoesPage() {
  const decisoes = useDecisoesHoje();
  const contasPagar = useContasAPagarInteligente();
  const contasReceber = useContasAReceberInteligente();
  const centroCusto = useAnaliseCentroCusto();
  const indicadores = useIndicadoresEnterprise();

  if (decisoes.isLoading || contasPagar.isLoading || contasReceber.isLoading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Processando inteligência financeira...</p>
        </div>
      </div>
    );
  }

  const hoje = new Date().toLocaleDateString('pt-BR', { 
    weekday: 'long', 
    year: 'numeric', 
    month: 'long', 
    day: 'numeric' 
  });

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg p-6 text-white">
        <h1 className="text-3xl font-bold mb-2">🎯 Central de Decisões</h1>
        <p className="text-blue-100 capitalize">{hoje}</p>
        <p className="text-sm text-blue-200 mt-2">
          Sistema enterprise processando 45.133 transações reais
        </p>
      </div>

      {/* ALERTAS CRÍTICOS */}
      {decisoes.data && decisoes.data.alertas_criticos.length > 0 && (
        <div className="bg-red-50 border-l-4 border-red-500 rounded-lg p-6">
          <div className="flex items-start gap-3">
            <AlertTriangle className="w-6 h-6 text-red-600 flex-shrink-0 mt-1" />
            <div className="flex-1">
              <h2 className="text-xl font-bold text-red-900 mb-4">
                🚨 ALERTAS CRÍTICOS - AÇÃO IMEDIATA NECESSÁRIA
              </h2>
              <div className="space-y-3">
                {decisoes.data.alertas_criticos.map((alerta: any, idx: number) => (
                  <div key={idx} className="bg-white rounded-lg p-4 border border-red-200">
                    <p className="font-semibold text-red-900">{alerta.mensagem}</p>
                    <p className="text-sm text-red-700 mt-1">
                      <strong>Ação:</strong> {alerta.acao}
                    </p>
                    {alerta.valor && (
                      <p className="text-2xl font-bold text-red-600 mt-2">
                        R$ {alerta.valor.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                      </p>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* AÇÕES PARA HOJE */}
      {decisoes.data && decisoes.data.acoes_hoje.length > 0 && (
        <div className="bg-orange-50 border-l-4 border-orange-500 rounded-lg p-6">
          <div className="flex items-start gap-3">
            <Clock className="w-6 h-6 text-orange-600 flex-shrink-0 mt-1" />
            <div className="flex-1">
              <h2 className="text-xl font-bold text-orange-900 mb-4">
                💼 AÇÕES PARA HOJE
              </h2>
              <div className="space-y-3">
                {decisoes.data.acoes_hoje.map((acao: any, idx: number) => (
                  <div key={idx} className="bg-white rounded-lg p-4 border border-orange-200">
                    <p className="font-semibold text-orange-900">{acao.mensagem}</p>
                    {acao.detalhes && acao.detalhes.length > 0 && (
                      <div className="mt-3">
                        <p className="text-sm text-gray-600 mb-2">Top prioridades:</p>
                        <ul className="space-y-2">
                          {acao.detalhes.slice(0, 5).map((item: any, i: number) => (
                            <li key={i} className="text-sm bg-gray-50 p-2 rounded">
                              <div className="flex justify-between">
                                <span>{item.descricao} - {item.fornecedor || item.loja}</span>
                                <span className="font-bold">
                                  R$ {(item.total || item.valor || item.valor_original).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                                </span>
                              </div>
                            </li>
                          ))}
                        </ul>
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* RESUMO FINANCEIRO */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        {/* Contas Vencidas */}
        <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-red-500">
          <div className="flex items-center justify-between mb-2">
            <h3 className="text-sm font-medium text-gray-600">Contas Vencidas</h3>
            <XCircle className="w-5 h-5 text-red-500" />
          </div>
          <p className="text-2xl font-bold text-red-600">
            R$ {contasPagar.data?.resumo.total_vencido.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
          </p>
          <p className="text-xs text-gray-500 mt-1">
            {contasPagar.data?.resumo.num_vencidas || 0} contas • R$ {contasPagar.data?.resumo.total_juros_acumulado.toFixed(2) || '0,00'} em juros
          </p>
        </div>

        {/* Vence Hoje */}
        <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-orange-500">
          <div className="flex items-center justify-between mb-2">
            <h3 className="text-sm font-medium text-gray-600">Vence Hoje</h3>
            <AlertCircle className="w-5 h-5 text-orange-500" />
          </div>
          <p className="text-2xl font-bold text-orange-600">
            R$ {contasPagar.data?.resumo.total_vence_hoje.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
          </p>
          <p className="text-xs text-gray-500 mt-1">
            {contasPagar.data?.resumo.num_vence_hoje || 0} contas a pagar
          </p>
        </div>

        {/* Próximos 7 Dias */}
        <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-yellow-500">
          <div className="flex items-center justify-between mb-2">
            <h3 className="text-sm font-medium text-gray-600">Próximos 7 Dias</h3>
            <Calendar className="w-5 h-5 text-yellow-500" />
          </div>
          <p className="text-2xl font-bold text-yellow-600">
            R$ {contasPagar.data?.resumo.total_vence_7_dias.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
          </p>
          <p className="text-xs text-gray-500 mt-1">
            {contasPagar.data?.resumo.num_vence_7_dias || 0} contas
          </p>
        </div>

        {/* A Receber Vencido */}
        <div className="bg-white rounded-lg shadow-md p-6 border-l-4 border-purple-500">
          <div className="flex items-center justify-between mb-2">
            <h3 className="text-sm font-medium text-gray-600">A Receber Vencido</h3>
            <DollarSign className="w-5 h-5 text-purple-500" />
          </div>
          <p className="text-2xl font-bold text-purple-600">
            R$ {contasReceber.data?.resumo.total_vencido.toLocaleString('pt-BR', { minimumFractionDigits: 2 }) || '0,00'}
          </p>
          <p className="text-xs text-gray-500 mt-1">
            {contasReceber.data?.resumo.num_vencidas || 0} clientes inadimplentes
          </p>
        </div>
      </div>

      {/* INSIGHTS ENTERPRISE */}
      {decisoes.data && decisoes.data.insights.length > 0 && (
        <div className="bg-blue-50 border-l-4 border-blue-500 rounded-lg p-6">
          <div className="flex items-start gap-3">
            <BarChart3 className="w-6 h-6 text-blue-600 flex-shrink-0 mt-1" />
            <div className="flex-1">
              <h2 className="text-xl font-bold text-blue-900 mb-4">
                💡 INSIGHTS DO NEGÓCIO
              </h2>
              <div className="space-y-3">
                {decisoes.data.insights.map((insight: any, idx: number) => (
                  <div key={idx} className="bg-white rounded-lg p-4 border border-blue-200">
                    <p className="font-semibold text-blue-900">{insight.mensagem}</p>
                    {insight.acao && (
                      <p className="text-sm text-blue-700 mt-2">
                        <strong>Recomendação:</strong> {insight.acao}
                      </p>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* INDICADORES ENTERPRISE */}
      {indicadores.data && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          {/* DSO */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h3 className="text-sm font-medium text-gray-600 mb-2">DSO - Days Sales Outstanding</h3>
            <p className="text-3xl font-bold text-blue-600">{indicadores.data.dso} dias</p>
            <p className="text-xs text-gray-500 mt-2">{indicadores.data.interpretacao.dso}</p>
          </div>

          {/* DPO */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h3 className="text-sm font-medium text-gray-600 mb-2">DPO - Days Payable Outstanding</h3>
            <p className="text-3xl font-bold text-green-600">{indicadores.data.dpo} dias</p>
            <p className="text-xs text-gray-500 mt-2">{indicadores.data.interpretacao.dpo}</p>
          </div>

          {/* Ciclo de Caixa */}
          <div className="bg-white rounded-lg shadow-md p-6">
            <h3 className="text-sm font-medium text-gray-600 mb-2">Ciclo de Caixa</h3>
            <p className={`text-3xl font-bold ${indicadores.data.ciclo_caixa < 0 ? 'text-green-600' : 'text-red-600'}`}>
              {indicadores.data.ciclo_caixa} dias
            </p>
            <p className="text-xs text-gray-500 mt-2">{indicadores.data.interpretacao.ciclo_caixa}</p>
          </div>
        </div>
      )}

      {/* PERFORMANCE POR LOJA */}
      {centroCusto.data && centroCusto.data.por_loja.ranking.length > 0 && (
        <div className="bg-white rounded-lg shadow-md p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
            <Users className="w-6 h-6 text-blue-600" />
            Performance por Loja (Mês Atual)
          </h2>
          <div className="space-y-3">
            {centroCusto.data.por_loja.ranking.slice(0, 5).map((loja: any, idx: number) => (
              <div key={idx} className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
                <div className="flex items-center gap-3">
                  {idx === 0 && <TrendingUp className="w-5 h-5 text-green-600" />}
                  {idx === centroCusto.data.por_loja.ranking.length - 1 && <TrendingDown className="w-5 h-5 text-red-600" />}
                  <div>
                    <p className="font-semibold text-gray-900">{loja.loja}</p>
                    <p className="text-xs text-gray-500">
                      Receitas: R$ {loja.receitas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })} | 
                      Despesas: R$ {loja.despesas.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                    </p>
                  </div>
                </div>
                <div className="text-right">
                  <p className={`text-xl font-bold ${loja.resultado >= 0 ? 'text-green-600' : 'text-red-600'}`}>
                    {loja.resultado >= 0 ? '+' : ''}R$ {Math.abs(loja.resultado).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                  </p>
                  <p className="text-xs text-gray-500">
                    {loja.resultado >= 0 ? 'Lucro' : 'Prejuízo'}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* TOP FORNECEDORES */}
      {centroCusto.data && centroCusto.data.por_fornecedor.top_10_gastos.length > 0 && (
        <div className="bg-white rounded-lg shadow-md p-6">
          <h2 className="text-xl font-bold text-gray-900 mb-4 flex items-center gap-2">
            <DollarSign className="w-6 h-6 text-orange-600" />
            Top 10 Fornecedores (Gastos Mês Atual)
          </h2>
          <div className="space-y-2">
            {centroCusto.data.por_fornecedor.top_10_gastos.map((fornecedor: any, idx: number) => (
              <div key={idx} className="flex items-center justify-between p-3 bg-gray-50 rounded">
                <div>
                  <p className="font-medium text-gray-900">{fornecedor.fornecedor}</p>
                  <p className="text-xs text-gray-500">{fornecedor.categoria}</p>
                </div>
                <p className="text-lg font-bold text-gray-900">
                  R$ {fornecedor.total_gasto.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                </p>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Footer com timestamp */}
      <div className="text-center text-xs text-gray-500 pt-4">
        Última atualização: {new Date().toLocaleString('pt-BR')}
      </div>
    </div>
  );
}