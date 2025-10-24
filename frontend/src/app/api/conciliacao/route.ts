// app/api/conciliacao/route.ts

/**
 * 🎯 API de Conciliação Bancária
 * 
 * POST /api/conciliacao
 * - Recebe arquivo CSV de extrato bancário
 * - Processa e retorna matches
 */

import { NextRequest, NextResponse } from 'next/server'
import { createClient } from '@/lib/supabase/server'
import { 
  parseExtract,
  reconciliationEngine,
  BankName,
  SystemLancamento
} from '@/lib/reconciliation'

export async function POST(request: NextRequest) {
  try {
    const formData = await request.formData()
    const file = formData.get('file') as File
    const lojaId = formData.get('loja_id') as string
    const forcedBank = formData.get('bank') as BankName | null
    
    if (!file) {
      return NextResponse.json(
        { error: 'Arquivo não enviado' },
        { status: 400 }
      )
    }
    
    // Lê conteúdo do arquivo
    const content = await file.text()
    
    // Parse do extrato bancário
    const { bank, transactions } = await parseExtract(
      content,
      file.name,
      forcedBank || undefined
    )
    
    if (transactions.length === 0) {
      return NextResponse.json(
        { error: 'Nenhuma transação encontrada no arquivo' },
        { status: 400 }
      )
    }
    
    // Busca lançamentos do sistema para reconciliar
    const supabase = await createClient()
    
    // Query lançamentos pagos/recebidos dos últimos 90 dias
    const minDate = new Date()
    minDate.setDate(minDate.getDate() - 90)
    
    let query = supabase
      .from('lancamentos')
      .select(`
        id,
        descricao,
        valor,
        data_vencimento,
        data_pagamento,
        tipo,
        status,
        fornecedor:fornecedores(id, nome),
        centro_custo:centros_custo(id, nome),
        plano_contas:plano_contas(id, nome),
        conta_financeira:contas_financeiras(id, nome)
      `)
      .in('status', ['PAGO', 'RECEBIDO'])
      .gte('data_pagamento', minDate.toISOString().split('T')[0])
    
    if (lojaId) {
      query = query.eq('loja_id', lojaId)
    }
    
    const { data: lancamentos, error } = await query
    
    if (error) {
      console.error('Erro ao buscar lançamentos:', error)
      return NextResponse.json(
        { error: 'Erro ao buscar lançamentos do sistema' },
        { status: 500 }
      )
    }
    
    // Converte para formato esperado pelo engine
    const systemLancamentos: SystemLancamento[] = (lancamentos || []).map((l: any) => ({
      id: l.id,
      descricao: l.descricao,
      valor: l.valor,
      data_vencimento: new Date(l.data_vencimento),
      data_pagamento: l.data_pagamento ? new Date(l.data_pagamento) : undefined,
      tipo: l.tipo,
      status: l.status,
      fornecedor: l.fornecedor ? { id: l.fornecedor.id, nome: l.fornecedor.nome } : undefined,
      centro_custo: l.centro_custo ? { id: l.centro_custo.id, nome: l.centro_custo.nome } : undefined,
      plano_contas: l.plano_contas ? { id: l.plano_contas.id, nome: l.plano_contas.nome } : undefined,
      conta_financeira: l.conta_financeira ? { id: l.conta_financeira.id, nome: l.conta_financeira.nome } : undefined
    }))
    
    // Executa reconciliação
    const result = await reconciliationEngine.reconcile(
      transactions,
      systemLancamentos
    )
    
    return NextResponse.json({
      success: true,
      bank,
      fileName: file.name,
      result
    })
    
  } catch (error: any) {
    console.error('Erro na conciliação:', error)
    return NextResponse.json(
      { 
        error: 'Erro ao processar conciliação',
        details: error.message 
      },
      { status: 500 }
    )
  }
}

/**
 * GET /api/conciliacao?loja_id=xxx
 * Retorna histórico de conciliações (futuro)
 */
export async function GET(request: NextRequest) {
  return NextResponse.json({
    message: 'Histórico de conciliações (em desenvolvimento)'
  })
}
