// app/api/copilot/chat/route.ts
/**
 * 🤖 API Route - Copiloto Financeiro
 * 
 * Endpoint de chat que:
 * 1. Recebe mensagens do usuário
 * 2. Constrói contexto financeiro
 * 3. Chama LLM com function calling
 * 4. Executa tools quando necessário
 * 5. Retorna resposta em streaming
 */

import { openai } from '@ai-sdk/openai'
import { streamText, tool } from 'ai'
import { 
  queryLancamentos, 
  queryLancamentosSchema,
  queryDRE,
  queryDRESchema,
  queryVencimentos,
  queryVencimentosSchema
} from '@/lib/ai/tools'
import { buildFinancialContext, formatContextForLLM } from '@/lib/ai/financial-context'

export const runtime = 'edge'

export async function POST(req: Request) {
  const { messages, context } = await req.json()

  // Construir contexto financeiro
  const financialContext = await buildFinancialContext(
    context?.loja_id,
    context?.periodo
  )

  const systemPrompt = formatContextForLLM(financialContext)

  // Chamar LLM com streaming e tools
  const result = await streamText({
    model: openai('gpt-4o-mini'), // Modelo mais rápido e barato
    system: systemPrompt,
    messages,
    tools: {
      // Tool: Buscar lançamentos
      query_lancamentos: tool({
        description: 'Busca lançamentos financeiros com filtros. Use para perguntas sobre receitas, despesas, fornecedores específicos.',
        parameters: queryLancamentosSchema,
        execute: async (params: any) => {
          console.log('🔧 Executando query_lancamentos:', params)
          return await queryLancamentos({
            ...params,
            loja_id: params.loja_id || context?.loja_id
          })
        }
      }),

      // Tool: Buscar DRE
      query_dre: tool({
        description: 'Busca Demonstração de Resultado do Exercício (DRE) de um mês específico. Use para análises mensais, margens, comparativos.',
        parameters: queryDRESchema,
        execute: async (params: any) => {
          console.log('🔧 Executando query_dre:', params)
          return await queryDRE({
            ...params,
            loja_id: params.loja_id || context?.loja_id
          })
        }
      }),

      // Tool: Vencimentos próximos
      query_vencimentos: tool({
        description: 'Busca parcelas com vencimento próximo (próximos 7 dias por padrão). Use para perguntas sobre "o que vence", "agenda", "próximos pagamentos".',
        parameters: queryVencimentosSchema,
        execute: async (params: any) => {
          console.log('🔧 Executando query_vencimentos:', params)
          return await queryVencimentos({
            ...params,
            loja_id: params.loja_id || context?.loja_id
          })
        }
      }),
    },
  })

  return result.toTextStreamResponse()
}
