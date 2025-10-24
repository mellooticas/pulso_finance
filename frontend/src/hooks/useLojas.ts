'use client'

import { useEffect, useState } from 'react'
import { supabase } from '@/lib/supabase'

interface Loja {
  id: string
  nome: string
  razao_social?: string
  cnpj?: string
}

export function useLojas() {
  const [lojas, setLojas] = useState<Loja[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchLojas() {
      try {
        const { data, error } = await supabase
          .from('lojas')
          .select('id, nome, razao_social, cnpj')
          .order('nome')

        if (error) throw error

        setLojas(data || [])
      } catch (err: any) {
        console.error('Erro ao buscar lojas:', err)
        setError(err.message)
      } finally {
        setLoading(false)
      }
    }

    fetchLojas()
  }, [])

  return { lojas, loading, error }
}
