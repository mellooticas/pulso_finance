// hooks/useLojasComDados.ts
import { useState, useEffect } from 'react'
import { supabase } from '@/lib/supabase/client'

interface LojaBase {
  id: string
  nome: string
  razao_social?: string | null
  cnpj?: string | null
  ativa: boolean
}

interface Loja extends LojaBase {
  parcelas_pagas: number
}

export function useLojasComDados() {
  const [lojas, setLojas] = useState<Loja[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    fetchLojasComDados()
  }, [])

  const fetchLojasComDados = async () => {
    try {
      // Buscar todas as lojas ativas
      const { data: lojasData, error: lojasError } = await supabase
        .from('lojas')
        .select('id, nome, razao_social, cnpj, ativa')
        .eq('ativa', true)
        .order('nome')

      if (lojasError) throw lojasError

      // Para cada loja, contar parcelas pagas
      const lojasComContagem = await Promise.all(
        (lojasData || []).map(async (loja: LojaBase) => {
          const { count } = await supabase
            .from('parcelas')
            .select('id, lancamentos!inner(loja_id)', { count: 'exact', head: true })
            .eq('status', 'pago')
            .eq('lancamentos.loja_id', loja.id)

          return {
            ...loja,
            parcelas_pagas: count || 0
          }
        })
      )

      // Ordenar: lojas com dados primeiro (descendente por quantidade)
      const lojasOrdenadas = lojasComContagem.sort((a: Loja, b: Loja) => {
        if (b.parcelas_pagas === a.parcelas_pagas) {
          return a.nome.localeCompare(b.nome)
        }
        return b.parcelas_pagas - a.parcelas_pagas
      })

      setLojas(lojasOrdenadas)
    } catch (err: any) {
      console.error('Erro ao buscar lojas:', err)
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  return { lojas, loading, error, refresh: fetchLojasComDados }
}
