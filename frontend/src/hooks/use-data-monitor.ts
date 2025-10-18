// Teste de conectividade com dados reais - executa automaticamente
'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase/client'

interface DataStatus {
  lojas: { count: number; loaded: boolean; error?: string }
  planoContas: { count: number; loaded: boolean; error?: string }
  lancamentos: { count: number; loaded: boolean; error?: string }
  usuarios: { count: number; loaded: boolean; error?: string }
}

export function useDataMonitor() {
  const [status, setStatus] = useState<DataStatus>({
    lojas: { count: 0, loaded: false },
    planoContas: { count: 0, loaded: false },
    lancamentos: { count: 0, loaded: false },
    usuarios: { count: 0, loaded: false }
  })
  
  const [isChecking, setIsChecking] = useState(true)
  const [lastCheck, setLastCheck] = useState<Date>(new Date())

  const checkDataAvailability = async () => {
    console.log('🔍 Verificando disponibilidade dos dados...')
    
    try {
      // Verificar lojas
      const { data: lojas, error: lojasError } = await supabase
        .from('lojas')
        .select('id', { count: 'exact' })
        .limit(1)
      
      // Verificar plano de contas
      const { data: planoContas, error: planoError } = await supabase
        .from('plano_contas')
        .select('id', { count: 'exact' })
        .limit(1)
      
      // Verificar lançamentos (dados migrados)
      const { data: lancamentos, error: lancamentosError } = await supabase
        .from('lancamentos')
        .select('id', { count: 'exact' })
        .eq('origem', 'migracao_yampa')
        .limit(1)
      
      // Verificar usuários
      const { data: usuarios, error: usuariosError } = await supabase
        .from('usuarios')
        .select('id', { count: 'exact' })
        .limit(1)

      setStatus({
        lojas: {
          count: lojas?.length || 0,
          loaded: !lojasError && (lojas?.length || 0) > 0,
          error: lojasError?.message
        },
        planoContas: {
          count: planoContas?.length || 0,
          loaded: !planoError && (planoContas?.length || 0) > 0,
          error: planoError?.message
        },
        lancamentos: {
          count: lancamentos?.length || 0,
          loaded: !lancamentosError && (lancamentos?.length || 0) > 0,
          error: lancamentosError?.message
        },
        usuarios: {
          count: usuarios?.length || 0,
          loaded: !usuariosError && (usuarios?.length || 0) > 0,
          error: usuariosError?.message
        }
      })

      setLastCheck(new Date())

      // Log do progresso
      const totalLoaded = [lojas, planoContas, lancamentos, usuarios].filter(d => d && d.length > 0).length
      console.log(`📊 Dados carregados: ${totalLoaded}/4 tabelas`)
      
      if (totalLoaded === 4) {
        console.log('✅ Todos os dados estão disponíveis!')
        setIsChecking(false)
      } else {
        console.log(`⏳ Aguardando dados... (${totalLoaded}/4 prontas)`)
      }
      
    } catch (error) {
      console.error('❌ Erro ao verificar dados:', error)
    }
  }

  useEffect(() => {
    // Verificação inicial
    checkDataAvailability()

    // Se ainda não carregou todos os dados, continua verificando
    const interval = setInterval(() => {
      if (isChecking) {
        checkDataAvailability()
      }
    }, 5000) // Verifica a cada 5 segundos

    return () => clearInterval(interval)
  }, [isChecking])

  const allDataLoaded = Object.values(status).every(s => s.loaded)
  const totalErrors = Object.values(status).filter(s => s.error).length

  return {
    status,
    allDataLoaded,
    isChecking,
    lastCheck,
    totalErrors,
    recheckNow: checkDataAvailability
  }
}