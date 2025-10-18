'use client'

import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'
import { formatKPIValue } from '@/hooks/use-dashboard-real'
import { Card } from '@/components/ui/card'
import { 
  CurrencyDollarIcon,
  BuildingStorefrontIcon,
  DocumentTextIcon,
  CalendarDaysIcon
} from '@heroicons/react/24/outline'

interface MigrationProgress {
  totalLancamentos: number
  valorTotal: number
  lojas: string[]
  ultimaAtualizacao: Date
}

export function MigrationProgressTracker() {
  const [progress, setProgress] = useState<MigrationProgress>({
    totalLancamentos: 0,
    valorTotal: 0,
    lojas: [],
    ultimaAtualizacao: new Date()
  })
  
  const [isMonitoring, setIsMonitoring] = useState(true)

  const checkMigrationProgress = async () => {
    try {
      // Contar lançamentos migrados
      const { data: lancamentos, error: lancamentosError } = await supabase
        .from('lancamentos')
        .select(`
          valor_total,
          loja:lojas!inner(codigo)
        `)
        .eq('origem', 'migracao_yampa')

      if (lancamentosError) {
        console.error('Erro ao verificar progresso:', lancamentosError)
        return
      }

      const totalLancamentos = lancamentos?.length || 0
      const valorTotal = lancamentos?.reduce((sum, l) => sum + l.valor_total, 0) || 0
      
      // Lojas com dados
      const lojasComDados = Array.from(
        new Set(lancamentos?.map(l => (l.loja as any).codigo) || [])
      ).sort()

      setProgress({
        totalLancamentos,
        valorTotal,
        lojas: lojasComDados,
        ultimaAtualizacao: new Date()
      })

      console.log(`📊 Progresso da migração: ${totalLancamentos} lançamentos, ${lojasComDados.length} lojas`)

      // Para de monitorar se chegou próximo do esperado (21.351)
      if (totalLancamentos >= 20000) {
        setIsMonitoring(false)
        console.log('✅ Migração quase completa!')
      }

    } catch (error) {
      console.error('❌ Erro ao verificar progresso da migração:', error)
    }
  }

  useEffect(() => {
    // Verificação inicial
    checkMigrationProgress()

    // Continua monitorando se necessário
    const interval = setInterval(() => {
      if (isMonitoring) {
        checkMigrationProgress()
      }
    }, 3000) // Verifica a cada 3 segundos

    return () => clearInterval(interval)
  }, [isMonitoring])

  // Se não há dados ainda, não mostra nada
  if (progress.totalLancamentos === 0) {
    return null
  }

  const progressPercentage = Math.min((progress.totalLancamentos / 21351) * 100, 100)

  return (
    <Card className="p-6 border-blue-200 bg-gradient-to-r from-blue-50 to-indigo-50">
      <div className="flex items-center justify-between mb-4">
        <div>
          <h3 className="text-lg font-semibold text-blue-900">Progresso da Migração Yampa</h3>
          <p className="text-sm text-blue-700">
            Dados sendo carregados em tempo real | 
            Atualizado: {progress.ultimaAtualizacao.toLocaleTimeString('pt-BR')}
          </p>
        </div>
        
        <div className="text-right">
          <p className="text-2xl font-bold text-blue-900">{progressPercentage.toFixed(1)}%</p>
          <p className="text-sm text-blue-600">Completo</p>
        </div>
      </div>

      {/* Barra de Progresso */}
      <div className="w-full bg-blue-200 rounded-full h-3 mb-4">
        <div 
          className="bg-gradient-to-r from-blue-500 to-indigo-600 h-3 rounded-full transition-all duration-500"
          style={{ width: `${progressPercentage}%` }}
        ></div>
      </div>

      {/* Estatísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <div className="flex items-center p-3 bg-white/60 rounded-lg">
          <DocumentTextIcon className="w-6 h-6 text-blue-600 mr-3" />
          <div>
            <p className="text-sm text-blue-700">Lançamentos</p>
            <p className="font-bold text-blue-900">
              {progress.totalLancamentos.toLocaleString('pt-BR')}
            </p>
          </div>
        </div>

        <div className="flex items-center p-3 bg-white/60 rounded-lg">
          <CurrencyDollarIcon className="w-6 h-6 text-green-600 mr-3" />
          <div>
            <p className="text-sm text-blue-700">Valor Total</p>
            <p className="font-bold text-blue-900">
              {formatKPIValue(progress.valorTotal, 'currency')}
            </p>
          </div>
        </div>

        <div className="flex items-center p-3 bg-white/60 rounded-lg">
          <BuildingStorefrontIcon className="w-6 h-6 text-purple-600 mr-3" />
          <div>
            <p className="text-sm text-blue-700">Lojas</p>
            <p className="font-bold text-blue-900">
              {progress.lojas.length} de 7
            </p>
          </div>
        </div>

        <div className="flex items-center p-3 bg-white/60 rounded-lg">
          <CalendarDaysIcon className="w-6 h-6 text-orange-600 mr-3" />
          <div>
            <p className="text-sm text-blue-700">Status</p>
            <p className="font-bold text-blue-900">
              {isMonitoring ? 'Carregando...' : 'Completo!'}
            </p>
          </div>
        </div>
      </div>

      {/* Lojas com Dados */}
      {progress.lojas.length > 0 && (
        <div className="mt-4 p-3 bg-white/40 rounded-lg">
          <p className="text-sm font-medium text-blue-800 mb-2">Lojas com dados:</p>
          <div className="flex flex-wrap gap-2">
            {progress.lojas.map(loja => (
              <span 
                key={loja} 
                className="px-2 py-1 bg-blue-100 text-blue-800 text-xs font-medium rounded-full"
              >
                {loja}
              </span>
            ))}
          </div>
        </div>
      )}

      {/* Próximos Passos */}
      {progressPercentage < 100 && (
        <div className="mt-4 p-3 bg-yellow-50 border border-yellow-200 rounded-lg">
          <p className="text-sm text-yellow-800">
            <strong>Continue executando os arquivos SQL:</strong> 
            Faltam aproximadamente {Math.ceil((21351 - progress.totalLancamentos) / 150)} arquivos
          </p>
        </div>
      )}

      {progressPercentage >= 100 && (
        <div className="mt-4 p-3 bg-green-50 border border-green-200 rounded-lg">
          <p className="text-sm text-green-800">
            <strong>🎉 Migração Concluída!</strong> 
            Todos os dados foram carregados com sucesso. O dashboard já está funcionando com dados reais!
          </p>
        </div>
      )}
    </Card>
  )
}