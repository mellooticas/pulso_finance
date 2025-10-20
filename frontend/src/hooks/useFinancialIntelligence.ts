/**
 * PULSO Finance - Hooks de Inteligência Financeira Enterprise
 * 
 * Hooks que MASTIGAM dados e retornam DECISÕES, não números decorativos
 */

import { useQuery } from '@tanstack/react-query';
import { supabase } from '@/lib/supabase';

// ==================== TIPOS ====================

interface ContaComJuros {
  id: string;
  descricao: string;
  fornecedor: string;
  loja: string;
  valor_original: number;
  vencimento: string;
  dias_atraso?: number;
  dias_para_vencer?: number;
  multa?: number;
  juros?: number;
  total?: number;
  percentual_acrescimo?: number;
  prioridade: 'CRÍTICA' | 'ALTA' | 'MÉDIA' | 'BAIXA' | 'PLANEJAMENTO';
  acao: string;
  categoria: string;
}

interface ResumoContasPagar {
  total_vencido: number;
  total_juros_acumulado: number;
  total_vence_hoje: number;
  total_vence_7_dias: number;
  total_vence_30_dias: number;
  num_vencidas: number;
  num_vence_hoje: number;
  num_vence_7_dias: number;
}

interface ContasAPagar {
  resumo: ResumoContasPagar;
  acoes_urgentes: {
    vencidas: ContaComJuros[];
    vence_hoje: ContaComJuros[];
  };
  planejamento: {
    proximos_7_dias: ContaComJuros[];
    proximos_30_dias: ContaComJuros[];
    proximos_90_dias: ContaComJuros[];
  };
}

interface CentroCustoAnalise {
  por_loja: {
    detalhes: Record<string, { receitas: number; despesas: number; resultado: number }>;
    ranking: Array<{ loja: string; receitas: number; despesas: number; resultado: number }>;
    melhor: { loja: string; receitas: number; despesas: number; resultado: number } | null;
    pior: { loja: string; receitas: number; despesas: number; resultado: number } | null;
  };
  por_fornecedor: {
    detalhes: Record<string, { total_gasto: number; categoria: string }>;
    top_10_gastos: Array<{ fornecedor: string; total_gasto: number; categoria: string }>;
  };
}

interface IndicadoresEnterprise {
  dso: number;
  dpo: number;
  ciclo_caixa: number;
  interpretacao: {
    dso: string;
    dpo: string;
    ciclo_caixa: string;
  };
}

// ==================== FUNÇÕES DE CÁLCULO ====================

function calcularJurosAtraso(
  valor: number,
  diasAtraso: number,
  taxaJurosMes: number = 0.01
): {
  valor_original: number;
  dias_atraso: number;
  multa: number;
  juros: number;
  total: number;
  percentual_acrescimo: number;
} {
  if (diasAtraso <= 0) {
    return {
      valor_original: valor,
      dias_atraso: 0,
      multa: 0,
      juros: 0,
      total: valor,
      percentual_acrescimo: 0
    };
  }

  // Multa de 2% sobre o valor
  const multa = valor * 0.02;

  // Juros de 1% ao mês proporcional aos dias
  const juros = valor * taxaJurosMes * (diasAtraso / 30);

  const total = valor + multa + juros;

  return {
    valor_original: valor,
    dias_atraso: diasAtraso,
    multa,
    juros,
    total,
    percentual_acrescimo: ((total - valor) / valor) * 100
  };
}

// ==================== HOOK: CONTAS A PAGAR INTELIGENTE ====================

export function useContasAPagarInteligente() {
  return useQuery<ContasAPagar>({
    queryKey: ['contas-a-pagar-inteligente'],
    queryFn: async () => {
      const hoje = new Date();
      hoje.setHours(0, 0, 0, 0);

      // Buscar TODAS as parcelas a pagar pendentes
      const { data: parcelas, error } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            descricao,
            fornecedor:fornecedores(nome),
            loja:lojas(nome),
            plano_conta:planos_contas(nome)
          )
        `)
        .eq('tipo', 'pagar')
        .in('status', ['pendente', 'vencido']);

      if (error) throw error;

      // Classificar por urgência
      const vencidas: ContaComJuros[] = [];
      const venceHoje: ContaComJuros[] = [];
      const vence7Dias: ContaComJuros[] = [];
      const vence30Dias: ContaComJuros[] = [];
      const vence90Dias: ContaComJuros[] = [];

      let totalVencido = 0;
      let totalJurosAcumulado = 0;

      parcelas?.forEach((parcela: any) => {
        const vencimento = new Date(parcela.data_vencimento);
        vencimento.setHours(0, 0, 0, 0);
        const diasParaVencer = Math.floor((vencimento.getTime() - hoje.getTime()) / (1000 * 60 * 60 * 24));
        const valor = parcela.valor_parcela;

        const info: ContaComJuros = {
          id: parcela.id,
          descricao: parcela.lancamento?.descricao || 'N/A',
          fornecedor: parcela.lancamento?.fornecedor?.nome || 'N/A',
          loja: parcela.lancamento?.loja?.nome || 'N/A',
          valor_original: valor,
          vencimento: parcela.data_vencimento,
          dias_para_vencer: diasParaVencer,
          categoria: parcela.lancamento?.plano_conta?.nome || 'N/A',
          prioridade: 'PLANEJAMENTO',
          acao: 'Monitorar'
        };

        // VENCIDAS - CALCULAR JUROS REAL
        if (diasParaVencer < 0) {
          const diasAtraso = Math.abs(diasParaVencer);
          const calculoJuros = calcularJurosAtraso(valor, diasAtraso);
          
          Object.assign(info, calculoJuros);
          info.prioridade = 'CRÍTICA';
          info.acao = `PAGAR URGENTE! Evitar mais R$ ${calculoJuros.juros.toFixed(2)} de juros`;
          
          vencidas.push(info);
          totalVencido += calculoJuros.total;
          totalJurosAcumulado += calculoJuros.juros;
        }
        // VENCE HOJE
        else if (diasParaVencer === 0) {
          info.prioridade = 'ALTA';
          info.acao = 'Pagar HOJE para evitar juros';
          venceHoje.push(info);
        }
        // PRÓXIMOS 7 DIAS
        else if (diasParaVencer > 0 && diasParaVencer <= 7) {
          info.prioridade = 'MÉDIA';
          info.acao = `Programar pagamento (${diasParaVencer} dias)`;
          vence7Dias.push(info);
        }
        // PRÓXIMOS 30 DIAS
        else if (diasParaVencer > 7 && diasParaVencer <= 30) {
          info.prioridade = 'BAIXA';
          info.acao = 'Monitorar';
          vence30Dias.push(info);
        }
        // PRÓXIMOS 90 DIAS
        else if (diasParaVencer > 30 && diasParaVencer <= 90) {
          info.prioridade = 'PLANEJAMENTO';
          info.acao = 'Reservar recursos';
          vence90Dias.push(info);
        }
      });

      // ORDENAR por valor (maior primeiro = mais crítico)
      vencidas.sort((a, b) => (b.total || 0) - (a.total || 0));
      venceHoje.sort((a, b) => b.valor_original - a.valor_original);

      return {
        resumo: {
          total_vencido: totalVencido,
          total_juros_acumulado: totalJurosAcumulado,
          total_vence_hoje: venceHoje.reduce((sum, p) => sum + p.valor_original, 0),
          total_vence_7_dias: vence7Dias.reduce((sum, p) => sum + p.valor_original, 0),
          total_vence_30_dias: vence30Dias.reduce((sum, p) => sum + p.valor_original, 0),
          num_vencidas: vencidas.length,
          num_vence_hoje: venceHoje.length,
          num_vence_7_dias: vence7Dias.length
        },
        acoes_urgentes: {
          vencidas: vencidas.slice(0, 10), // Top 10 mais críticas
          vence_hoje: venceHoje.slice(0, 10)
        },
        planejamento: {
          proximos_7_dias: vence7Dias,
          proximos_30_dias: vence30Dias,
          proximos_90_dias: vence90Dias
        }
      };
    },
    refetchInterval: 5 * 60 * 1000, // Atualizar a cada 5 minutos
    staleTime: 2 * 60 * 1000 // Considerar stale após 2 minutos
  });
}

// ==================== HOOK: CONTAS A RECEBER INTELIGENTE ====================

export function useContasAReceberInteligente() {
  return useQuery({
    queryKey: ['contas-a-receber-inteligente'],
    queryFn: async () => {
      const hoje = new Date();
      hoje.setHours(0, 0, 0, 0);

      const { data: parcelas, error } = await supabase
        .from('parcelas')
        .select(`
          *,
          lancamento:lancamentos!inner(
            descricao,
            loja:lojas(nome)
          )
        `)
        .eq('tipo', 'receber')
        .in('status', ['pendente', 'vencido']);

      if (error) throw error;

      const vencidas: any[] = [];
      const venceHoje: any[] = [];
      const proximos: any[] = [];

      parcelas?.forEach((parcela: any) => {
        const vencimento = new Date(parcela.data_vencimento);
        vencimento.setHours(0, 0, 0, 0);
        const diasAtraso = Math.floor((hoje.getTime() - vencimento.getTime()) / (1000 * 60 * 60 * 24));

        const info: any = {
          id: parcela.id,
          descricao: parcela.lancamento?.descricao || 'N/A',
          loja: parcela.lancamento?.loja?.nome || 'N/A',
          valor: parcela.valor_parcela,
          vencimento: parcela.data_vencimento,
          dias_atraso: diasAtraso > 0 ? diasAtraso : 0
        };

        if (diasAtraso > 0) {
          info.acao = `COBRAR! ${diasAtraso} dias atrasado`;
          vencidas.push(info);
        } else if (diasAtraso === 0) {
          info.acao = 'Confirmar recebimento hoje';
          venceHoje.push(info);
        } else {
          proximos.push(info);
        }
      });

      return {
        resumo: {
          total_vencido: vencidas.reduce((sum, p) => sum + p.valor, 0),
          total_vence_hoje: venceHoje.reduce((sum, p) => sum + p.valor, 0),
          num_vencidas: vencidas.length
        },
        acoes: {
          cobrar_urgente: vencidas.slice(0, 10),
          receber_hoje: venceHoje,
          proximos: proximos.slice(0, 20)
        }
      };
    },
    refetchInterval: 5 * 60 * 1000
  });
}

// ==================== HOOK: ANÁLISE POR CENTRO DE CUSTO ====================

export function useAnaliseCentroCusto() {
  return useQuery<CentroCustoAnalise>({
    queryKey: ['analise-centro-custo'],
    queryFn: async () => {
      const hoje = new Date();
      const mesAtual = `${hoje.getFullYear()}-${String(hoje.getMonth() + 1).padStart(2, '0')}`;

      const { data: lancamentos, error } = await supabase
        .from('lancamentos')
        .select(`
          tipo,
          valor_total,
          loja:lojas(id, nome),
          fornecedor:fornecedores(id, nome, categoria),
          plano_conta:planos_contas(codigo, nome)
        `)
        .gte('competencia', `${mesAtual}-01`)
        .lte('competencia', `${mesAtual}-31`);

      if (error) throw error;

      // Análise por LOJA
      const porLoja: Record<string, { receitas: number; despesas: number; resultado: number }> = {};
      
      lancamentos?.forEach((lanc: any) => {
        const loja = lanc.loja?.nome || 'N/A';
        if (!porLoja[loja]) {
          porLoja[loja] = { receitas: 0, despesas: 0, resultado: 0 };
        }

        if (lanc.tipo === 'receber') {
          porLoja[loja].receitas += lanc.valor_total;
        } else {
          porLoja[loja].despesas += lanc.valor_total;
        }

        porLoja[loja].resultado = porLoja[loja].receitas - porLoja[loja].despesas;
      });

      // Análise por FORNECEDOR
      const porFornecedor: Record<string, { total_gasto: number; categoria: string }> = {};
      
      lancamentos?.forEach((lanc: any) => {
        if (lanc.fornecedor && lanc.tipo === 'pagar') {
          const forn = lanc.fornecedor.nome;
          if (!porFornecedor[forn]) {
            porFornecedor[forn] = {
              total_gasto: 0,
              categoria: lanc.fornecedor.categoria || 'N/A'
            };
          }
          porFornecedor[forn].total_gasto += lanc.valor_total;
        }
      });

      // Ordenar por resultado
      const lojasRanking = Object.entries(porLoja)
        .sort(([, a], [, b]) => b.resultado - a.resultado)
        .map(([loja, dados]) => ({ loja, ...dados }));

      const fornecedoresRanking = Object.entries(porFornecedor)
        .sort(([, a], [, b]) => b.total_gasto - a.total_gasto)
        .map(([fornecedor, dados]) => ({ fornecedor, ...dados }));

      return {
        por_loja: {
          detalhes: porLoja,
          ranking: lojasRanking,
          melhor: lojasRanking[0] || null,
          pior: lojasRanking[lojasRanking.length - 1] || null
        },
        por_fornecedor: {
          detalhes: porFornecedor,
          top_10_gastos: fornecedoresRanking.slice(0, 10)
        }
      };
    },
    refetchInterval: 10 * 60 * 1000 // Atualizar a cada 10 minutos
  });
}

// ==================== HOOK: INDICADORES ENTERPRISE ====================

export function useIndicadoresEnterprise() {
  return useQuery<IndicadoresEnterprise>({
    queryKey: ['indicadores-enterprise'],
    queryFn: async () => {
      const hoje = new Date();
      const data90Dias = new Date(hoje.getTime() - 90 * 24 * 60 * 60 * 1000);

      // Recebimentos
      const { data: recebidas } = await supabase
        .from('parcelas')
        .select('data_vencimento, data_pagamento, valor_parcela')
        .eq('tipo', 'receber')
        .not('data_pagamento', 'is', null)
        .gte('data_pagamento', data90Dias.toISOString().split('T')[0]);

      // Pagamentos
      const { data: pagas } = await supabase
        .from('parcelas')
        .select('data_vencimento, data_pagamento, valor_parcela')
        .eq('tipo', 'pagar')
        .not('data_pagamento', 'is', null)
        .gte('data_pagamento', data90Dias.toISOString().split('T')[0]);

      // Calcular DSO
      const diasRecebimento: number[] = [];
      recebidas?.forEach((r: any) => {
        const venc = new Date(r.data_vencimento);
        const pag = new Date(r.data_pagamento);
        diasRecebimento.push(Math.floor((pag.getTime() - venc.getTime()) / (1000 * 60 * 60 * 24)));
      });

      const dso = diasRecebimento.length > 0
        ? diasRecebimento.reduce((a, b) => a + b, 0) / diasRecebimento.length
        : 0;

      // Calcular DPO
      const diasPagamento: number[] = [];
      pagas?.forEach((p: any) => {
        const venc = new Date(p.data_vencimento);
        const pag = new Date(p.data_pagamento);
        diasPagamento.push(Math.floor((pag.getTime() - venc.getTime()) / (1000 * 60 * 60 * 24)));
      });

      const dpo = diasPagamento.length > 0
        ? diasPagamento.reduce((a, b) => a + b, 0) / diasPagamento.length
        : 0;

      const cicloCaixa = dso - dpo;

      return {
        dso: Math.round(dso * 10) / 10,
        dpo: Math.round(dpo * 10) / 10,
        ciclo_caixa: Math.round(cicloCaixa * 10) / 10,
        interpretacao: {
          dso: `Recebemos em média ${Math.round(dso)} dias após o vencimento`,
          dpo: `Pagamos em média ${Math.round(dpo)} dias após o vencimento`,
          ciclo_caixa: `Ciclo de caixa de ${Math.round(cicloCaixa)} dias${
            cicloCaixa < 0 
              ? ' (BOM - pagamos antes de receber)' 
              : ' (RUIM - recebemos antes de pagar)'
          }`
        }
      };
    },
    refetchInterval: 30 * 60 * 1000 // Atualizar a cada 30 minutos
  });
}

// ==================== HOOK: DECISÕES DE HOJE ====================

export function useDecisoesHoje() {
  const contasPagar = useContasAPagarInteligente();
  const contasReceber = useContasAReceberInteligente();
  const centroCusto = useAnaliseCentroCusto();
  const indicadores = useIndicadoresEnterprise();

  return useQuery({
    queryKey: ['decisoes-hoje'],
    queryFn: () => {
      const hoje = new Date().toISOString().split('T')[0];

      const alertasCriticos: any[] = [];
      const acoesHoje: any[] = [];
      const insights: any[] = [];

      // ALERTAS CRÍTICOS
      if (contasPagar.data && contasPagar.data.resumo.num_vencidas > 0) {
        alertasCriticos.push({
          tipo: 'CONTAS_VENCIDAS',
          severidade: 'CRÍTICA',
          mensagem: `🚨 ${contasPagar.data.resumo.num_vencidas} contas VENCIDAS com R$ ${contasPagar.data.resumo.total_juros_acumulado.toFixed(2)} de JUROS acumulados!`,
          valor: contasPagar.data.resumo.total_vencido,
          acao: 'Pagar URGENTEMENTE as top 10 maiores'
        });
      }

      // AÇÕES DE HOJE
      if (contasPagar.data && contasPagar.data.resumo.num_vence_hoje > 0) {
        acoesHoje.push({
          tipo: 'PAGAMENTOS_HOJE',
          mensagem: `💰 ${contasPagar.data.resumo.num_vence_hoje} contas vencem HOJE - Total: R$ ${contasPagar.data.resumo.total_vence_hoje.toFixed(2)}`,
          detalhes: contasPagar.data.acoes_urgentes.vence_hoje
        });
      }

      if (contasReceber.data && contasReceber.data.resumo.num_vencidas > 0) {
        acoesHoje.push({
          tipo: 'COBRANCAS_VENCIDAS',
          mensagem: `💵 Cobrar R$ ${contasReceber.data.resumo.total_vencido.toFixed(2)} de clientes inadimplentes`,
          detalhes: contasReceber.data.acoes.cobrar_urgente
        });
      }

      // INSIGHTS
      if (centroCusto.data?.por_loja.melhor) {
        const melhor = centroCusto.data.por_loja.melhor;
        insights.push({
          tipo: 'PERFORMANCE_LOJA',
          mensagem: `⭐ ${melhor.loja} é a loja MAIS RENTÁVEL com R$ ${melhor.resultado.toFixed(2)} de lucro no mês`
        });
      }

      if (indicadores.data && indicadores.data.ciclo_caixa > 0) {
        insights.push({
          tipo: 'CICLO_CAIXA',
          mensagem: `⚠️ Ciclo de caixa de ${indicadores.data.ciclo_caixa} dias está NEGATIVO para a empresa!`,
          acao: 'Negociar prazos maiores com fornecedores ou reduzir prazos de clientes'
        });
      }

      return {
        data_analise: hoje,
        alertas_criticos: alertasCriticos,
        acoes_hoje: acoesHoje,
        insights,
        carregando: contasPagar.isLoading || contasReceber.isLoading || centroCusto.isLoading || indicadores.isLoading,
        erro: contasPagar.error || contasReceber.error || centroCusto.error || indicadores.error
      };
    },
    enabled: !!(contasPagar.data && contasReceber.data && centroCusto.data && indicadores.data)
  });
}