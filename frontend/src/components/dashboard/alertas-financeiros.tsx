'use client'

import { useFluxoCaixa, getCorDiasCaixa, formatCurrency } from '@/hooks/use-fluxo-caixa'
import { Card } from '@/components/ui/card'
import { 
  ExclamationTriangleIcon,
  InformationCircleIcon,
  CheckCircleIcon
} from '@heroicons/react/24/outline'

interface AlertasFinanceirosProps {
  fluxoCaixaData?: any
  vencimentosData?: any
}

interface AlertaFinanceiro {
  id: string
  tipo: 'critico' | 'atencao' | 'info'
  titulo: string
  descricao: string
  valor?: number
  acao?: string
}

export function AlertasFinanceiros({ fluxoCaixaData, vencimentosData }: AlertasFinanceirosProps) {
  if (!fluxoCaixaData) return null

  const alertas: AlertaFinanceiro[] = []

  // Alerta de dias de caixa
  const diasCaixa = fluxoCaixaData.dias_caixa_disponivel
  const corDias = getCorDiasCaixa(diasCaixa)

  if (corDias === 'red') {
    alertas.push({
      id: 'caixa-critico',
      tipo: 'critico',
      titulo: 'Caixa Crítico',
      descricao: `Apenas ${diasCaixa} dias de caixa disponível. Atenção urgente necessária.`,
      acao: 'Revisar fluxo de caixa e acelerar recebimentos'
    })
  } else if (corDias === 'yellow') {
    alertas.push({
      id: 'caixa-atencao',
      tipo: 'atencao',
      titulo: 'Caixa em Atenção',
      descricao: `${diasCaixa} dias de caixa disponível. Monitorar de perto.`,
      acao: 'Planejar entradas para as próximas semanas'
    })
  }

  // Alerta de saldo baixo
  if (fluxoCaixaData.saldo_total_atual < 10000) {
    alertas.push({
      id: 'saldo-baixo',
      tipo: 'atencao',
      titulo: 'Saldo Baixo',
      descricao: 'Saldo atual das contas está abaixo do recomendado.',
      valor: fluxoCaixaData.saldo_total_atual,
      acao: 'Considerar aporte ou acelerar recebimentos'
    })
  }

  // Alerta de resultado negativo
  if (fluxoCaixaData.resultado_periodo < 0) {
    alertas.push({
      id: 'resultado-negativo',
      tipo: 'atencao',
      titulo: 'Resultado Negativo',
      descricao: 'Saídas superiores às entradas neste período.',
      valor: fluxoCaixaData.resultado_periodo,
      acao: 'Revisar despesas e estratégias de receita'
    })
  }

  // Alerta de vencimentos próximos
  if (vencimentosData?.totalPagar > vencimentosData?.totalReceber) {
    alertas.push({
      id: 'vencimentos-negativos',
      tipo: 'atencao',
      titulo: 'Vencimentos Desfavoráveis',
      descricao: 'Mais contas a pagar que a receber nos próximos 7 dias.',
      valor: vencimentosData.totalPagar - vencimentosData.totalReceber,
      acao: 'Negociar prazos ou antecipar recebimentos'
    })
  }

  // Alertas positivos
  if (fluxoCaixaData.resultado_periodo > 0 && corDias === 'green') {
    alertas.push({
      id: 'situacao-boa',
      tipo: 'info',
      titulo: 'Situação Financeira Saudável',
      descricao: 'Resultado positivo e caixa com boa margem de segurança.',
      acao: 'Considerar investimentos ou expansão'
    })
  }

  if (alertas.length === 0) {
    alertas.push({
      id: 'nenhum-alerta',
      tipo: 'info',
      titulo: 'Situação Normal',
      descricao: 'Nenhum alerta financeiro no momento.',
      acao: 'Continue monitorando regularmente'
    })
  }

  return (
    <Card className="p-6">
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-lg font-semibold text-gray-900">Alertas Financeiros</h3>
        <ExclamationTriangleIcon className="w-5 h-5 text-yellow-600" />
      </div>
      
      <div className="space-y-3">
        {alertas.map((alerta) => {
          const Icon = alerta.tipo === 'critico' ? ExclamationTriangleIcon :
                      alerta.tipo === 'atencao' ? InformationCircleIcon :
                      CheckCircleIcon

          const cores = {
            critico: 'border-red-200 bg-red-50',
            atencao: 'border-yellow-200 bg-yellow-50',
            info: 'border-green-200 bg-green-50'
          }

          const coresIcon = {
            critico: 'text-red-600',
            atencao: 'text-yellow-600', 
            info: 'text-green-600'
          }

          const coresTitulo = {
            critico: 'text-red-800',
            atencao: 'text-yellow-800',
            info: 'text-green-800'
          }

          return (
            <div 
              key={alerta.id}
              className={`border rounded-lg p-4 ${cores[alerta.tipo]}`}
            >
              <div className="flex items-start space-x-3">
                <Icon className={`w-5 h-5 mt-0.5 ${coresIcon[alerta.tipo]}`} />
                <div className="flex-1">
                  <h4 className={`font-medium ${coresTitulo[alerta.tipo]}`}>
                    {alerta.titulo}
                  </h4>
                  <p className="text-sm text-gray-700 mt-1">
                    {alerta.descricao}
                  </p>
                  {alerta.valor !== undefined && (
                    <p className="text-sm font-medium text-gray-800 mt-1">
                      Valor: {formatCurrency(Math.abs(alerta.valor))}
                    </p>
                  )}
                  {alerta.acao && (
                    <p className="text-xs text-gray-600 mt-2 italic">
                      💡 {alerta.acao}
                    </p>
                  )}
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </Card>
  )
}