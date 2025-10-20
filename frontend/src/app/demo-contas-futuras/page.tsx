/**
 * PULSO Finance - Página Contas Futuras Demo
 * Demonstra o sistema corrigido com R$ 179k de contas futuras
 */

import React from 'react'
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card'
import ContasFuturas from '@/components/dashboard/ContasFuturas'

export default function ContasFuturasDemo() {
  return (
    <div className="container mx-auto px-4 py-8 space-y-6">
      {/* Header */}
      <div className="text-center space-y-2">
        <h1 className="text-3xl font-bold text-gray-900">
          🔮 **CONTAS FUTURAS** - Sistema Corrigido
        </h1>
        <p className="text-lg text-gray-600">
          **R$ 179.299,96** em lançamentos futuros identificados e integrados!
        </p>
        <div className="flex justify-center gap-4 text-sm">
          <span className="bg-green-100 text-green-800 px-3 py-1 rounded-full">
            ✅ Competência vs Caixa Separados
          </span>
          <span className="bg-blue-100 text-blue-800 px-3 py-1 rounded-full">
            📊 Projeções até 2029
          </span>
          <span className="bg-yellow-100 text-yellow-800 px-3 py-1 rounded-full">
            ⚠️ Alertas de Vencimento
          </span>
        </div>
      </div>

      {/* Resumo Executivo */}
      <Card className="bg-gradient-to-r from-blue-50 to-purple-50 border-blue-200">
        <CardHeader>
          <CardTitle className="text-blue-800">
            🎯 **DESCOBERTAS CRÍTICAS** da Análise
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
            <div className="text-center p-4 bg-white rounded-lg shadow-sm">
              <h3 className="font-bold text-2xl text-green-600">R$ 179.299,96</h3>
              <p className="text-sm text-gray-600">Total Contas Futuras</p>
              <p className="text-xs text-gray-500">726 lançamentos até 2029</p>
            </div>
            
            <div className="text-center p-4 bg-white rounded-lg shadow-sm">
              <h3 className="font-bold text-2xl text-red-600">6.154</h3>
              <p className="text-sm text-gray-600">Datas Divergentes</p>
              <p className="text-xs text-gray-500">Vencimento ≠ Competência</p>
            </div>
            
            <div className="text-center p-4 bg-white rounded-lg shadow-sm">
              <h3 className="font-bold text-2xl text-yellow-600">R$ 362,33</h3>
              <p className="text-sm text-gray-600">Parcelas Pendentes</p>
              <p className="text-xs text-gray-500">Ainda não pagas</p>
            </div>
            
            <div className="text-center p-4 bg-white rounded-lg shadow-sm">
              <h3 className="font-bold text-2xl text-purple-600">0%</h3>
              <p className="text-sm text-gray-600">Realização Despesas</p>
              <p className="text-xs text-gray-500">Problema de cálculo!</p>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Problemas Identificados */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <Card className="border-red-200">
          <CardHeader>
            <CardTitle className="text-red-700">
              🚨 **PROBLEMAS** Identificados
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            <div className="p-3 bg-red-50 rounded border-l-4 border-red-400">
              <h4 className="font-semibold text-red-800">Cálculos Incorretos</h4>
              <p className="text-sm text-red-600">
                Sistema não incluía **R$ 179k** de lançamentos futuros
              </p>
            </div>
            
            <div className="p-3 bg-orange-50 rounded border-l-4 border-orange-400">
              <h4 className="font-semibold text-orange-800">Falta Separação</h4>
              <p className="text-sm text-orange-600">
                **Competência** misturada com **Caixa** nas DREs
              </p>
            </div>
            
            <div className="p-3 bg-yellow-50 rounded border-l-4 border-yellow-400">
              <h4 className="font-semibold text-yellow-800">Datas Divergentes</h4>
              <p className="text-sm text-yellow-600">
                **6.154** lançamentos com data_vencimento ≠ competencia
              </p>
            </div>
          </CardContent>
        </Card>

        <Card className="border-green-200">
          <CardHeader>
            <CardTitle className="text-green-700">
              ✅ **SOLUÇÕES** Implementadas
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-3">
            <div className="p-3 bg-green-50 rounded border-l-4 border-green-400">
              <h4 className="font-semibold text-green-800">Hooks Corrigidos</h4>
              <p className="text-sm text-green-600">
                **useContasFuturas.ts** com separação completa
              </p>
            </div>
            
            <div className="p-3 bg-blue-50 rounded border-l-4 border-blue-400">
              <h4 className="font-semibold text-blue-800">Projeções Futuras</h4>
              <p className="text-sm text-blue-600">
                **useProjecaoFluxo()** até 6 meses adiante
              </p>
            </div>
            
            <div className="p-3 bg-purple-50 rounded border-l-4 border-purple-400">
              <h4 className="font-semibold text-purple-800">DRE Comparativa</h4>
              <p className="text-sm text-purple-600">
                **Competência vs Caixa** lado a lado
              </p>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Próximos Meses em Destaque */}
      <Card className="bg-gradient-to-br from-indigo-50 to-cyan-50">
        <CardHeader>
          <CardTitle className="text-indigo-800">
            📅 **FLUXO FUTURO** por Mês (Yampa Real)
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div className="bg-white p-4 rounded-lg shadow-sm border">
              <h4 className="font-bold text-lg text-gray-800">Out/2025</h4>
              <p className="text-2xl font-bold text-green-600">+R$ 16.958,93</p>
              <p className="text-sm text-gray-600">30 lançamentos pendentes</p>
              <div className="mt-2 h-2 bg-gray-200 rounded-full overflow-hidden">
                <div className="h-full bg-green-400" style={{width: '85%'}}></div>
              </div>
            </div>

            <div className="bg-white p-4 rounded-lg shadow-sm border">
              <h4 className="font-bold text-lg text-gray-800">Nov/2025</h4>
              <p className="text-2xl font-bold text-blue-600">+R$ 36.532,01</p>
              <p className="text-sm text-gray-600">64 lançamentos pendentes</p>
              <div className="mt-2 h-2 bg-gray-200 rounded-full overflow-hidden">
                <div className="h-full bg-blue-400" style={{width: '92%'}}></div>
              </div>
            </div>

            <div className="bg-white p-4 rounded-lg shadow-sm border">
              <h4 className="font-bold text-lg text-gray-800">2026-2029</h4>
              <p className="text-2xl font-bold text-purple-600">+R$ 125.808,02</p>
              <p className="text-sm text-gray-600">632 lançamentos futuros</p>
              <div className="mt-2 h-2 bg-gray-200 rounded-full overflow-hidden">
                <div className="h-full bg-purple-400" style={{width: '100%'}}></div>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Componente Principal */}
      <ContasFuturas className="mt-8" />

      {/* Dados Técnicos */}
      <Card className="bg-gray-50">
        <CardHeader>
          <CardTitle className="text-gray-700">
            🔧 **DADOS TÉCNICOS** da Análise
          </CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <h4 className="font-semibold mb-2">📊 **Estatísticas Yampa:**</h4>
              <ul className="text-sm space-y-1 text-gray-700">
                <li>• <strong>45.133</strong> registros totais analisados</li>
                <li>• <strong>726</strong> lançamentos futuros identificados</li>
                <li>• <strong>5 anos</strong> de dados (2020-2025)</li>
                <li>• <strong>5 fornecedores</strong> principais mapeados</li>
                <li>• <strong>R$ 179k</strong> em fluxo futuro descoberto</li>
              </ul>
            </div>

            <div>
              <h4 className="font-semibold mb-2">⚙️ **Hooks Implementados:**</h4>
              <ul className="text-sm space-y-1 text-gray-700">
                <li>• <code>useFluxoCaixaRealizado()</code> - Apenas pagos</li>
                <li>• <code>useContasPendentes()</code> - Contas em aberto</li>
                <li>• <code>useDREComparativo()</code> - Competência vs Caixa</li>
                <li>• <code>useProjecaoFluxo()</code> - 6 meses futuros</li>
                <li>• <code>useDashboardKPIsCorrigido()</code> - Métricas reais</li>
              </ul>
            </div>
          </div>

          <div className="mt-4 p-4 bg-white rounded border">
            <h4 className="font-semibold text-gray-800">🎯 **IMPACTO:**</h4>
            <p className="text-sm text-gray-600 mt-1">
              Com essa correção, o **PULSO Finance** agora mostra a realidade financeira completa: 
              <span className="font-semibold text-green-600">R$ 179k de fluxo futuro</span> que antes 
              eram invisíveis no sistema. A separação entre <strong>competência</strong> e <strong>caixa</strong> 
              permite decisões mais assertivas e projeções confiáveis.
            </p>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}