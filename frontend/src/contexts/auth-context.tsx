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
      // Tentar buscar perfil por ID primeiro
      const { data, error } = await supabase
        .from('usuarios')
        .select('*')
        .eq('id', userId)
        .single()

      if (error) {
        console.error('Error fetching profile by ID:', error)
        
        // Se erro 406 ou PGRST116, tentar buscar por email do usuário autenticado
        if (error.code === 'PGRST116' || error.message.includes('406')) {
          const { data: { user } } = await supabase.auth.getUser()
          if (user?.email) {
            const { data: profileByEmail, error: emailError } = await supabase
              .from('usuarios')
              .select('*')
              .eq('email', user.email)
              .single()
            
            if (emailError) {
              console.error('Error fetching profile by email:', emailError)
              return null
            }
            
            return profileByEmail as UserProfile
          }
        }
        return null
      }

      return data as UserProfile
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
        const profileData = await fetchProfile(data.user.id)
        console.log('Profile data:', profileData)
        
        if (!profileData) {
          console.log('Perfil não encontrado, buscando por email...')
          // Se não encontrar perfil, tentar buscar por email
          const { data: userByEmail, error: emailError } = await supabase
            .from('usuarios')
            .select('*')
            .eq('email', email)
            .single()

          if (emailError || !userByEmail) {
            await supabase.auth.signOut()
            return { error: 'Usuário não encontrado no sistema. Contate o administrador.' }
          }

          // Atualizar o ID do usuário com o ID do Auth
          const { error: updateError } = await supabase
            .from('usuarios')
            .update({ id: data.user.id })
            .eq('email', email)

          if (updateError) {
            console.error('Erro ao atualizar ID do usuário:', updateError)
          }

          setProfile(userByEmail)
        } else {
          if (!profileData.ativo) {
            await supabase.auth.signOut()
            return { error: 'Usuário inativo. Contate o administrador.' }
          }
          setProfile(profileData)
        }

        // Update last access
        await supabase
          .from('usuarios')
          .update({ ultimo_acesso: new Date().toISOString() })
          .eq('id', data.user.id)

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