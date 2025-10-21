'use client'

import React, { createContext, useContext, useMemo, useState } from 'react'

export type TipoLancamentoFiltro = 'todos' | 'receita' | 'despesa'

export interface GlobalFilters {
  data_inicio: string
  data_fim: string
  loja_id?: string | null
  centro_custo_id?: string | null
  tipo?: TipoLancamentoFiltro
}

interface FiltersContextType {
  filters: GlobalFilters
  setFilters: (next: Partial<GlobalFilters>) => void
  resetFilters: () => void
  periodo: { inicio: string; fim: string }
}

const FiltersContext = createContext<FiltersContextType | undefined>(undefined)

function getMesAtual(): { inicio: string; fim: string } {
  const now = new Date()
  const month = now.getMonth() + 1
  const year = now.getFullYear()
  const inicio = `${year}-${String(month).padStart(2, '0')}-01`
  const fim = new Date(year, month, 0).toISOString().split('T')[0]
  return { inicio, fim }
}

export function FiltersProvider({ children }: { children: React.ReactNode }) {
  const mesAtual = getMesAtual()
  const [filters, setFiltersState] = useState<GlobalFilters>({
    data_inicio: mesAtual.inicio,
    data_fim: mesAtual.fim,
    loja_id: null,
    centro_custo_id: null,
    tipo: 'todos'
  })

  const setFilters = (next: Partial<GlobalFilters>) => {
    setFiltersState((prev) => ({ ...prev, ...next }))
  }

  const resetFilters = () => setFiltersState({
    data_inicio: mesAtual.inicio,
    data_fim: mesAtual.fim,
    loja_id: null,
    centro_custo_id: null,
    tipo: 'todos'
  })

  const value = useMemo<FiltersContextType>(() => ({
    filters,
    setFilters,
    resetFilters,
    periodo: { inicio: filters.data_inicio, fim: filters.data_fim }
  }), [filters])

  return (
    <FiltersContext.Provider value={value}>{children}</FiltersContext.Provider>
  )
}

export function useFilters() {
  const ctx = useContext(FiltersContext)
  if (!ctx) throw new Error('useFilters deve ser usado dentro de FiltersProvider')
  return ctx
}
