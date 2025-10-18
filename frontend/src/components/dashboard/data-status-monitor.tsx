'use client'

import { useDataMonitor } from '@/hooks/use-data-monitor'
import { Card } from '@/components/ui/card'
import { 
  CheckCircleIcon, 
  XCircleIcon, 
  ClockIcon,
  ArrowPathIcon
} from '@heroicons/react/24/outline'

export function DataStatusMonitor() {
  const { 
    status, 
    allDataLoaded, 
    isChecking, 
    lastCheck, 
    totalErrors, 
    recheckNow 
  } = useDataMonitor()

  const getStatusIcon = (loaded: boolean, error?: string) => {
    if (error) return <XCircleIcon className="w-5 h-5 text-red-500" />
    if (loaded) return <CheckCircleIcon className="w-5 h-5 text-green-500" />
    return <ClockIcon className="w-5 h-5 text-yellow-500" />
  }

  const getStatusColor = (loaded: boolean, error?: string) => {
    if (error) return 'border-red-200 bg-red-50'
    if (loaded) return 'border-green-200 bg-green-50'
    return 'border-yellow-200 bg-yellow-50'
  }

  return (
    <Card className="p-6 mb-6">
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-lg font-semibold text-gray-900">Status dos Dados</h3>
          <p className="text-sm text-gray-600">
            Monitoramento em tempo real da migração | 
            Última verificação: {lastCheck.toLocaleTimeString('pt-BR')}
          </p>
        </div>
        
        <button
          onClick={recheckNow}
          className="flex items-center px-3 py-2 text-sm bg-blue-100 text-blue-700 rounded-lg hover:bg-blue-200"
        >
          <ArrowPathIcon className="w-4 h-4 mr-1" />
          Verificar Agora
        </button>
      </div>

      {/* Status Geral */}
      <div className={`p-4 rounded-lg mb-4 ${allDataLoaded ? 'bg-green-50 border border-green-200' : 'bg-yellow-50 border border-yellow-200'}`}>
        {allDataLoaded ? (
          <div className="flex items-center">
            <CheckCircleIcon className="w-6 h-6 text-green-600 mr-2" />
            <div>
              <p className="font-medium text-green-800">Sistema Pronto!</p>
              <p className="text-sm text-green-600">Todos os dados foram carregados e o sistema está operacional.</p>
            </div>
          </div>
        ) : (
          <div className="flex items-center">
            <ClockIcon className="w-6 h-6 text-yellow-600 mr-2" />
            <div>
              <p className="font-medium text-yellow-800">Aguardando Migração...</p>
              <p className="text-sm text-yellow-600">
                {isChecking ? 'Monitorando dados em tempo real' : 'Verificação pausada'}
                {totalErrors > 0 && ` | ${totalErrors} erro(s) detectado(s)`}
              </p>
            </div>
          </div>
        )}
      </div>

      {/* Status Detalhado */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <div className={`p-3 rounded-lg border ${getStatusColor(status.lojas.loaded, status.lojas.error)}`}>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Lojas</p>
              <p className="text-xs text-gray-600">
                {status.lojas.count > 0 ? `${status.lojas.count} encontradas` : 'Aguardando...'}
              </p>
            </div>
            {getStatusIcon(status.lojas.loaded, status.lojas.error)}
          </div>
          {status.lojas.error && (
            <p className="text-xs text-red-600 mt-1">{status.lojas.error}</p>
          )}
        </div>

        <div className={`p-3 rounded-lg border ${getStatusColor(status.planoContas.loaded, status.planoContas.error)}`}>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Plano de Contas</p>
              <p className="text-xs text-gray-600">
                {status.planoContas.count > 0 ? `${status.planoContas.count} encontradas` : 'Aguardando...'}
              </p>
            </div>
            {getStatusIcon(status.planoContas.loaded, status.planoContas.error)}
          </div>
          {status.planoContas.error && (
            <p className="text-xs text-red-600 mt-1">{status.planoContas.error}</p>
          )}
        </div>

        <div className={`p-3 rounded-lg border ${getStatusColor(status.lancamentos.loaded, status.lancamentos.error)}`}>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Lançamentos Yampa</p>
              <p className="text-xs text-gray-600">
                {status.lancamentos.count > 0 ? `${status.lancamentos.count}+ migrados` : 'Aguardando migração...'}
              </p>
            </div>
            {getStatusIcon(status.lancamentos.loaded, status.lancamentos.error)}
          </div>
          {status.lancamentos.error && (
            <p className="text-xs text-red-600 mt-1">{status.lancamentos.error}</p>
          )}
        </div>

        <div className={`p-3 rounded-lg border ${getStatusColor(status.usuarios.loaded, status.usuarios.error)}`}>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium">Usuários</p>
              <p className="text-xs text-gray-600">
                {status.usuarios.count > 0 ? `${status.usuarios.count} encontrados` : 'Aguardando...'}
              </p>
            </div>
            {getStatusIcon(status.usuarios.loaded, status.usuarios.error)}
          </div>
          {status.usuarios.error && (
            <p className="text-xs text-red-600 mt-1">{status.usuarios.error}</p>
          )}
        </div>
      </div>

      {/* Instruções */}
      {!allDataLoaded && (
        <div className="mt-4 p-3 bg-blue-50 border border-blue-200 rounded-lg">
          <p className="text-sm text-blue-800">
            <strong>Próximos passos:</strong>
          </p>
          <ul className="text-sm text-blue-700 mt-1 ml-4">
            <li>• Execute os arquivos SQL na ordem: 00_EXECUTAR_MIGRACAO.sql, 01_, 02_, etc.</li>
            <li>• O sistema detectará os dados automaticamente conforme forem inseridos</li>
            <li>• Quando todos estiverem prontos, o dashboard será liberado</li>
          </ul>
        </div>
      )}
    </Card>
  )
}