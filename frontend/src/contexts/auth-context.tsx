'use client'

import { createContext, useContext, useEffect, useState } from 'react'
import { User } from '@supabase/supabase-js'
import { supabase } from '@/lib/supabase/client'
import { UserRole } from '@/lib/constants'

interface UserProfile {
  id: string
  email: string
  nome: string
  papel: UserRole
  loja_ids: string[]
  ativo: boolean
  ultimo_acesso: string | null
  configuracoes: any
}

interface AuthContextType {
  user: User | null
  profile: UserProfile | null
  loading: boolean
  signIn: (email: string, password: string) => Promise<{ error?: string; success?: boolean }>
  signOut: () => Promise<void>
  refreshProfile: () => Promise<void>
}

const AuthContext = createContext<AuthContextType | undefined>(undefined)

export function AuthProvider({ children }: { children: React.ReactNode }) {
  const [user, setUser] = useState<User | null>(null)
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [loading, setLoading] = useState(true)

  const fetchProfile = async (userId: string) => {
    try {
      // ✅ Usar dados do Auth ao invés de tabela usuarios
      const { data: { user }, error } = await supabase.auth.getUser()
      
      if (error || !user) {
        console.error('Error fetching auth user:', error)
        return null
      }

      // Mapear user do Auth para UserProfile
      return {
        id: user.id,
        email: user.email || '',
        nome: user.user_metadata?.nome || user.email?.split('@')[0] || 'Usuário',
        papel: user.user_metadata?.papel || 'operacional',
        ativo: true,
        loja_ids: user.user_metadata?.loja_ids || [],
        ultimo_acesso: new Date().toISOString(),
        created_at: user.created_at,
        updated_at: user.updated_at || user.created_at,
        configuracoes: user.user_metadata?.configuracoes || {}
      } as UserProfile
    } catch (error) {
      console.error('Error in fetchProfile:', error)
      return null
    }
  }

  const refreshProfile = async () => {
    if (user) {
      const profileData = await fetchProfile(user.id)
      setProfile(profileData)
    }
  }

  const signIn = async (email: string, password: string) => {
    try {
      console.log('SignIn iniciado com email:', email)
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password
      })

      console.log('Resposta do Supabase Auth:', { data, error })

      if (error) {
        console.log('Erro na autenticação:', error)
        // Verificar se é erro de credenciais inválidas
        if (error.message.includes('Invalid login credentials')) {
          return { error: 'Email ou senha incorretos' }
        }
        return { error: error.message }
      }

      if (data.user) {
        console.log('Usuário autenticado, buscando perfil...')
        let profileData = await fetchProfile(data.user.id)
        console.log('Profile data:', profileData)
        
        if (!profileData) {
          console.log('Erro ao obter perfil do usuário')
          await supabase.auth.signOut()
          return { error: 'Erro ao criar perfil do usuário' }
        }

        if (!profileData.ativo) {
          await supabase.auth.signOut()
          return { error: 'Usuário inativo. Contate o administrador.' }
        }
        
        setProfile(profileData)

        console.log('Login realizado com sucesso, retornando { success: true }')
        // SUCESSO: Login realizado com sucesso
        return { success: true }
      }

      console.log('Dados de usuário não encontrados')
      return { error: 'Erro ao obter dados do usuário' }
    } catch (error) {
      console.error('Erro no signIn:', error)
      return { error: 'Erro interno do servidor' }
    }
  }

  const signOut = async () => {
    await supabase.auth.signOut()
    setUser(null)
    setProfile(null)
  }

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null)
      if (session?.user) {
        fetchProfile(session.user.id).then(setProfile)
      }
      setLoading(false)
    })

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        setUser(session?.user ?? null)
        
        if (session?.user) {
          const profileData = await fetchProfile(session.user.id)
          setProfile(profileData)
        } else {
          setProfile(null)
        }
        
        setLoading(false)
      }
    )

    return () => subscription.unsubscribe()
  }, [])

  const value = {
    user,
    profile,
    loading,
    signIn,
    signOut,
    refreshProfile
  }

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  )
}

export function useAuth() {
  const context = useContext(AuthContext)
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}