/**
 * PULSO Finance - Tipos TypeScript para Dados Reais
 */

export interface Fornecedor {
  id: string
  nome: string
  categoria: string
  cnpj?: string
  especialidades?: string[]
  contato_email?: string
  contato_telefone?: string
  endereco?: string
  ativo: boolean
  created_at: string
  updated_at: string
}

export interface ProdutoServico {
  id: string
  nome: string
  categoria: string
  tipo: 'produto' | 'servico'
  descricao?: string
  preco_base?: number
  fornecedor_id?: string
  ativo: boolean
  created_at: string
  updated_at: string
}

export interface PlanoContas {
  id: string
  codigo: string
  nome: string
  nivel: number
  pai_id?: string
  categoria: 'receita' | 'custo' | 'despesa' | 'investimento' | 'outros'
  tipo: 'receita' | 'despesa'
  grupo_dre?: string
  ativo: boolean
  created_at: string
  updated_at: string
}

export interface Loja {
  id: string
  nome: string
  codigo: string
  endereco?: string
  telefone?: string
  responsavel?: string
  ativa: boolean
  created_at: string
  updated_at: string
}

export interface Lancamento {
  id: string
  loja_id: string
  tipo: 'receber' | 'pagar'
  plano_id: string
  centro_custo_id?: string
  fornecedor_id?: string
  produto_id?: string
  descricao: string
  historico?: string
  observacoes?: string
  competencia: string
  valor_total: number
  num_parcelas: number
  origem: string
  status_aprovacao: 'pendente' | 'aprovado' | 'rejeitado'
  documento_referencia?: string
  anexos?: Record<string, any>
  user_id?: string
  aprovado_por?: string
  aprovado_em?: string
  metadata?: Record<string, any>
  created_at: string
  updated_at: string
}

export interface Parcela {
  id: string
  lancamento_id: string
  numero_parcela: number
  valor_parcela: number
  data_vencimento: string
  data_pagamento?: string
  status: 'pendente' | 'pago' | 'vencido' | 'cancelado'
  observacoes?: string
  created_at: string
  updated_at: string
}

export interface DREData {
  periodo: {
    inicio: string
    fim: string
  }
  resumo: {
    total_receitas: number
    total_custos: number
    total_despesas: number
    lucro_bruto: number
    lucro_operacional: number
    margem_bruta: number
    margem_operacional: number
  }
  detalhes: {
    receitas: Record<string, number>
    custos: Record<string, number>
    despesas: Record<string, number>
  }
}

export interface FluxoCaixaData {
  periodo: {
    inicio: string
    fim: string
  }
  saldo_inicial: number
  saldo_final: number
  total_entradas: number
  total_saidas: number
  resultado_periodo: number
  fluxo_diario: Array<{
    data: string
    entradas: number
    saidas: number
    saldo_dia: number
    saldo_acumulado: number
  }>
}

export interface DashboardKPIs {
  periodo: {
    inicio: string
    fim: string
  }
  kpis_principais: {
    total_receitas: number
    total_despesas: number
    resultado: number
    margem_liquida: number
    num_transacoes: number
    ticket_medio: number
  }
  distribuicao: {
    receitas_por_categoria: Record<string, number>
    top_fornecedores: Array<{
      categoria: string
      valor: number
    }>
  }
  evolucao_mensal: Record<string, {
    receitas: number
    despesas: number
    resultado: number
  }>
}