'use client'

import React from 'react'
import { useFilters } from '@/contexts/filters-context'
import { useLojas } from '@/hooks/use-lojas'
import { useCentrosCusto } from '@/hooks/use-centros-custo'

export function FiltersBar() {
  const { filters, setFilters, resetFilters } = useFilters()
  const { data: lojas } = useLojas()
  const { data: centros } = useCentrosCusto({ status: 'ativo' })

  return (
    <div className="w-full bg-white border border-slate-200 rounded-lg p-3 md:p-4 shadow-sm">
      <div className="flex flex-col gap-3 md:grid md:grid-cols-6 md:items-end md:gap-4">
        {/* Período: Início */}
        <div className="flex flex-col">
          <label className="text-xs font-medium text-slate-600 mb-1">Início</label>
          <input
            type="date"
            value={filters.data_inicio}
            onChange={(e) => setFilters({ data_inicio: e.target.value })}
            className="h-9 rounded-md border border-slate-300 px-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        {/* Período: Fim */}
        <div className="flex flex-col">
          <label className="text-xs font-medium text-slate-600 mb-1">Fim</label>
          <input
            type="date"
            value={filters.data_fim}
            onChange={(e) => setFilters({ data_fim: e.target.value })}
            className="h-9 rounded-md border border-slate-300 px-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          />
        </div>

        {/* Loja */}
        <div className="flex flex-col">
          <label className="text-xs font-medium text-slate-600 mb-1">Loja</label>
          <select
            value={filters.loja_id || ''}
            onChange={(e) => setFilters({ loja_id: e.target.value || null })}
            className="h-9 rounded-md border border-slate-300 px-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Todas</option>
            {lojas?.map((loja) => (
              <option key={loja.id} value={loja.id}>{loja.codigo} — {loja.nome}</option>
            ))}
          </select>
        </div>

        {/* Centro de Custo */}
        <div className="flex flex-col">
          <label className="text-xs font-medium text-slate-600 mb-1">Centro de Custo</label>
          <select
            value={filters.centro_custo_id || ''}
            onChange={(e) => setFilters({ centro_custo_id: e.target.value || null })}
            className="h-9 rounded-md border border-slate-300 px-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="">Todos</option>
            {centros?.map((c) => (
              <option key={c.id} value={c.id}>{c.codigo} — {c.nome}</option>
            ))}
          </select>
        </div>

        {/* Tipo */}
        <div className="flex flex-col">
          <label className="text-xs font-medium text-slate-600 mb-1">Tipo</label>
          <select
            value={filters.tipo || 'todos'}
            onChange={(e) => setFilters({ tipo: e.target.value as any })}
            className="h-9 rounded-md border border-slate-300 px-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          >
            <option value="todos">Todos</option>
            <option value="receita">Receitas</option>
            <option value="despesa">Despesas</option>
          </select>
        </div>

        {/* Ações */}
        <div className="flex gap-2 md:justify-end">
          <button
            onClick={resetFilters}
            className="h-9 rounded-md border border-slate-300 px-3 text-sm text-slate-700 hover:bg-slate-50"
          >
            Limpar
          </button>
          <button
            onClick={() => { /* setFilters já aplica automaticamente */ }}
            className="h-9 rounded-md bg-blue-600 px-3 text-sm text-white hover:bg-blue-700"
          >
            Aplicar
          </button>
        </div>
      </div>
    </div>
  )
}
