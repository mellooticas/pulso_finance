'use client'

import { useEffect, useState } from 'react'
import { useRouter } from 'next/navigation'
import { supabase } from '@/lib/supabase/client'

export function useAuthRedirect() {
  const [isRedirecting, setIsRedirecting] = useState(false)
  const router = useRouter()

  const redirectToDashboard = async () => {
    setIsRedirecting(true)
    
    try {
      console.log('🔄 Iniciando processo de redirecionamento SIMPLIFICADO...')
      
      // Verificação básica da sessão
      const { data: { session }, error } = await supabase.auth.getSession()
      console.log('🔍 Session check antes do redirect:', !!session?.user)
      console.log('🔍 Session user:', session?.user?.email)
      
      if (error) {
        console.error('❌ Erro ao verificar sessão:', error)
        // Mas ainda assim tentar o redirecionamento
        console.log('⚠️ Tentando redirecionamento mesmo com erro de sessão')
      }
      
      // Redirecionamento IMEDIATO e direto
      console.log('� Redirecionamento IMEDIATO para dashboard')
      window.location.href = '/dashboard'
      
    } catch (error) {
      console.error('❌ Erro ao verificar sessão:', error)
      // Em caso de erro, ainda tentar redirecionar
      console.log('🚀 Redirecionamento de emergência para dashboard')
      window.location.href = '/dashboard'
    }
  }

  return { redirectToDashboard, isRedirecting }
}