'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Card } from '@/components/ui/card'
import { supabase } from '@/lib/supabase/client'

interface UserData {
  email: string
  password: string
  nome: string
  papel: 'admin' | 'gerencial' | 'financeiro'
}

const usuariosReais: UserData[] = [
  {
    email: 'junior@oticastatymello.com.br',
    password: 'Kt12jyh2815t@',
    nome: 'Junior Mello',
    papel: 'admin'
  },
  {
    email: 'financeiroesc@hotmail.com',
    password: '123456789',
    nome: 'Financeiro ESC',
    papel: 'financeiro'
  },
  {
    email: 'tgjphotos@gmail.com',
    password: '123456789',
    nome: 'TGJ Photos',
    papel: 'gerencial'
  }
]

export default function CriarUsuariosPage() {
  const [loading, setLoading] = useState(false)
  const [results, setResults] = useState<string[]>([])

  const criarUsuario = async (userData: UserData) => {
    try {
      // 1. Criar usuário no Auth
      const { data: authData, error: authError } = await supabase.auth.signUp({
        email: userData.email,
        password: userData.password,
        options: {
          data: {
            nome: userData.nome,
            papel: userData.papel
          }
        }
      })

      if (authError) {
        throw authError
      }

      if (!authData.user) {
        throw new Error('Usuário não foi criado')
      }

      // 2. Buscar todas as lojas para definir acesso
      const { data: lojas, error: lojasError } = await supabase
        .from('lojas')
        .select('id')

      if (lojasError) {
        throw lojasError
      }

      // 3. Definir lojas de acesso baseado no papel
      let lojaIds: string[] = []
      if (userData.papel === 'admin') {
        lojaIds = lojas?.map(loja => loja.id) || []
      } else if (userData.papel === 'gerencial') {
        // Acesso à loja matriz (primeira loja)
        lojaIds = lojas?.slice(0, 1).map(loja => loja.id) || []
      } else {
        // Financeiro: acesso a 3 primeiras lojas
        lojaIds = lojas?.slice(0, 3).map(loja => loja.id) || []
      }

      // 4. Criar perfil na tabela usuarios
      const { error: profileError } = await supabase
        .from('usuarios')
        .insert({
          id: authData.user.id,
          email: userData.email,
          nome: userData.nome,
          papel: userData.papel,
          loja_ids: lojaIds,
          ativo: true,
          configuracoes: {
            tema: 'light',
            notificacoes: true,
            idioma: 'pt-BR',
            dashboard_layout: 'grid'
          }
        })

      if (profileError) {
        throw profileError
      }

      return `✅ ${userData.nome} (${userData.email}) criado com sucesso!`
    } catch (error: any) {
      return `❌ Erro ao criar ${userData.nome}: ${error.message}`
    }
  }

  const criarTodosUsuarios = async () => {
    setLoading(true)
    setResults([])
    
    for (const userData of usuariosReais) {
      const result = await criarUsuario(userData)
      setResults(prev => [...prev, result])
    }
    
    setLoading(false)
  }

  return (
    <div className="min-h-screen bg-slate-50 p-8">
      <div className="max-w-4xl mx-auto">
        <Card className="p-8">
          <h1 className="text-2xl font-bold text-slate-900 mb-6">
            Criar Usuários Reais - PULSO Finance
          </h1>
          
          <div className="mb-6">
            <h2 className="text-lg font-semibold text-slate-800 mb-4">
              Usuários a serem criados:
            </h2>
            
            <div className="space-y-3">
              {usuariosReais.map((user, index) => (
                <div key={index} className="bg-slate-100 p-4 rounded-lg">
                  <div className="font-medium text-slate-900">{user.nome}</div>
                  <div className="text-sm text-slate-600">{user.email}</div>
                  <div className="text-sm text-slate-500">Papel: {user.papel}</div>
                </div>
              ))}
            </div>
          </div>

          <Button 
            onClick={criarTodosUsuarios} 
            disabled={loading}
            className="w-full mb-6"
          >
            {loading ? 'Criando usuários...' : 'Criar Todos os Usuários'}
          </Button>

          {results.length > 0 && (
            <div className="space-y-2">
              <h3 className="font-semibold text-slate-800">Resultados:</h3>
              {results.map((result, index) => (
                <div 
                  key={index} 
                  className={`p-3 rounded ${
                    result.startsWith('✅') 
                      ? 'bg-green-100 text-green-800' 
                      : 'bg-red-100 text-red-800'
                  }`}
                >
                  {result}
                </div>
              ))}
            </div>
          )}

          <div className="mt-8 p-4 bg-blue-50 border border-blue-200 rounded-lg">
            <h3 className="font-semibold text-blue-900 mb-2">Instruções:</h3>
            <ol className="text-sm text-blue-800 space-y-1">
              <li>1. Esta página cria os usuários reais no sistema</li>
              <li>2. Após criação, você poderá fazer login com as credenciais reais</li>
              <li>3. Cada usuário terá acesso baseado em seu papel</li>
              <li>4. Os usuários receberão email de confirmação (se configurado)</li>
            </ol>
          </div>
        </Card>
      </div>
    </div>
  )
}