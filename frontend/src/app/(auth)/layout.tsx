'use client'

import { useState } from 'react'
import { useAuth } from '@/contexts/auth-context'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { toast } from 'sonner'
import { useRouter } from 'next/navigation'
import { ROUTES } from '@/lib/constants'
import { useAuthRedirect } from '@/hooks/use-auth-redirect'

export default function AuthLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 flex items-center justify-center p-4">
      <div className="w-full max-w-md">
        {children}
      </div>
    </div>
  )
}

export function LoginForm() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [loading, setLoading] = useState(false)
  const { signIn } = useAuth()
  const router = useRouter()
  const { redirectToDashboard, isRedirecting } = useAuthRedirect()

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)

    try {
      console.log('Iniciando login...')
      const result = await signIn(email, password)
      console.log('Resultado do signIn:', result)
      
      if (result.error) {
        console.log('Erro no login:', result.error)
        toast.error(result.error)
        return
      }

      if (result.success) {
        console.log('Login bem-sucedido, iniciando redirecionamento...')
        toast.success('Login realizado com sucesso!')
        
        // Usar o hook customizado para redirecionamento
        await redirectToDashboard()
      } else {
        console.log('Login sem sucesso nem erro:', result)
        toast.error('Erro desconhecido no login')
      }
    } catch (error) {
      console.error('Erro no catch:', error)
      toast.error('Erro interno do servidor')
    } finally {
      if (!isRedirecting) {
        setLoading(false)
      }
    }
  }

  return (
    <Card>
      <CardHeader className="space-y-1">
        <div className="flex items-center justify-center mb-6">
          <div className="w-12 h-12 bg-blue-600 rounded-lg flex items-center justify-center">
            <span className="text-white font-bold text-xl">P</span>
          </div>
        </div>
        <CardTitle className="text-2xl text-center">PULSO Finance</CardTitle>
        <CardDescription className="text-center">
          Entre com suas credenciais para acessar o sistema
        </CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div className="space-y-2">
            <label htmlFor="email" className="text-sm font-medium">
              Email
            </label>
            <Input
              id="email"
              type="email"
              placeholder="seu@email.com"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>
          <div className="space-y-2">
            <label htmlFor="password" className="text-sm font-medium">
              Senha
            </label>
            <Input
              id="password"
              type="password"
              placeholder="••••••••"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
              required
            />
          </div>
          <Button 
            type="submit" 
            className="w-full" 
            disabled={loading || isRedirecting}
          >
            {isRedirecting ? 'Redirecionando...' : loading ? 'Entrando...' : 'Entrar'}
          </Button>
        </form>
        
        <div className="mt-6 text-center text-sm text-gray-600">
          Sistema de gestão financeira para óticas
        </div>
      </CardContent>
    </Card>
  )
}