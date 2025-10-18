'use client'

import { Card } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { DataStatusMonitor } from '@/components/dashboard/data-status-monitor'
import { 
  CheckCircleIcon, 
  ExclamationTriangleIcon,
  InformationCircleIcon 
} from '@heroicons/react/24/outline'

export default function StatusPage() {
  const hasSupabaseConfig = 
    process.env.NEXT_PUBLIC_SUPABASE_URL !== 'https://your-project.supabase.co' &&
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY !== 'your-anon-key'

  return (
    <div className="min-h-screen bg-slate-50 flex items-center justify-center p-4">
      <div className="max-w-2xl w-full space-y-6">
        <div className="text-center">
          <h1 className="text-3xl font-bold text-slate-900 mb-2">
            PULSO Finance
          </h1>
          <p className="text-slate-600">
            Sistema de Gestão Financeira para Óticas
          </p>
        </div>

        <Card className="p-6">
          <h2 className="text-xl font-semibold text-slate-900 mb-4">
            Status da Configuração
          </h2>
          
          <div className="space-y-4">
            {/* Next.js Status */}
            <div className="flex items-center space-x-3">
              <CheckCircleIcon className="h-6 w-6 text-green-500" />
              <span className="text-slate-900">Next.js 15 configurado</span>
            </div>

            {/* TypeScript Status */}
            <div className="flex items-center space-x-3">
              <CheckCircleIcon className="h-6 w-6 text-green-500" />
              <span className="text-slate-900">TypeScript configurado</span>
            </div>

            {/* Tailwind Status */}
            <div className="flex items-center space-x-3">
              <CheckCircleIcon className="h-6 w-6 text-green-500" />
              <span className="text-slate-900">Tailwind CSS configurado</span>
            </div>

            {/* Components Status */}
            <div className="flex items-center space-x-3">
              <CheckCircleIcon className="h-6 w-6 text-green-500" />
              <span className="text-slate-900">Componentes UI criados</span>
            </div>

            {/* Dashboard Status */}
            <div className="flex items-center space-x-3">
              <CheckCircleIcon className="h-6 w-6 text-green-500" />
              <span className="text-slate-900">Layout do dashboard implementado</span>
            </div>

            {/* Supabase Status */}
            <div className="flex items-center space-x-3">
              {hasSupabaseConfig ? (
                <>
                  <CheckCircleIcon className="h-6 w-6 text-green-500" />
                  <span className="text-slate-900">Supabase configurado</span>
                </>
              ) : (
                <>
                  <ExclamationTriangleIcon className="h-6 w-6 text-yellow-500" />
                  <span className="text-slate-900">Supabase precisa ser configurado</span>
                </>
              )}
            </div>
          </div>
        </Card>

        {/* Monitor de Dados em Tempo Real */}
        {hasSupabaseConfig && <DataStatusMonitor />}

        {!hasSupabaseConfig && (
          <Card className="p-6 border-yellow-200 bg-yellow-50">
            <div className="flex items-start space-x-3">
              <InformationCircleIcon className="h-6 w-6 text-yellow-600 mt-0.5" />
              <div>
                <h3 className="text-lg font-medium text-yellow-900 mb-2">
                  Configuração Necessária
                </h3>
                <p className="text-yellow-800 mb-4">
                  Para testar a aplicação completa, configure suas credenciais do Supabase no arquivo <code>.env.local</code>.
                </p>
                <p className="text-yellow-800 text-sm">
                  Consulte o arquivo <code>CONFIGURACAO_SUPABASE.md</code> para instruções detalhadas.
                </p>
              </div>
            </div>
          </Card>
        )}

        <Card className="p-6">
          <h3 className="text-lg font-semibold text-slate-900 mb-4">
            Funcionalidades Implementadas
          </h3>
          
          <ul className="space-y-2 text-slate-700">
            <li>• Sistema de autenticação completo</li>
            <li>• Dashboard responsivo com sidebar</li>
            <li>• Controle de acesso por perfis (Admin/Gerencial/Financeiro)</li>
            <li>• Middleware de proteção de rotas</li>
            <li>• Componentes UI padronizados</li>
            <li>• Estrutura para módulos financeiros</li>
            <li>• Integração com Supabase</li>
          </ul>
        </Card>

        <div className="text-center">
          {hasSupabaseConfig ? (
            <Button 
              onClick={() => window.location.href = '/login'}
              className="w-full sm:w-auto"
            >
              Acessar Sistema
            </Button>
          ) : (
            <p className="text-slate-600 text-sm">
              Configure o Supabase para acessar o sistema completo
            </p>
          )}
        </div>
      </div>
    </div>
  )
}