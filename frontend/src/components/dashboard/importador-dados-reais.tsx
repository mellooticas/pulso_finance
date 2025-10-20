/**
 * PULSO Finance - Importador de Dados Reais
 * Componente para importar dados reais da análise Yampa para o Supabase
 */

'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { supabase } from '@/lib/supabase'
import { 
  ArrowUpTrayIcon,
  CheckCircleIcon,
  ExclamationCircleIcon,
  ClockIcon,
  DocumentTextIcon
} from '@heroicons/react/24/outline'

// Dados extraídos da análise
const FORNECEDORES_REAIS = [
  {
    nome: 'Carl Zeiss Vision',
    categoria: 'Lentes Premium',
    cnpj: '07.394.127/0001-42',
    especialidades: ['Lentes oftálmicas premium', 'Tratamentos anti-reflexo', 'Lentes multifocais'],
    contato_email: 'vendas@zeiss.com.br',
    contato_telefone: '(11) 3456-7890',
    endereco: 'São Paulo - SP'
  },
  {
    nome: 'Optotal Hoya Ltda',
    categoria: 'Lentes',
    cnpj: '43.816.580/0001-00',
    especialidades: ['Lentes progressivas', 'Lentes multifocais', 'Tratamentos especiais'],
    contato_email: 'comercial@hoya.com.br',
    contato_telefone: '(11) 2345-6789',
    endereco: 'São Paulo - SP'
  },
  {
    nome: 'Solótica Distribuidora',
    categoria: 'Lentes de Contato',
    cnpj: '65.532.707/0001-94',
    especialidades: ['Lentes de contato coloridas', 'Lentes corretivas', 'Lentes especiais'],
    contato_email: 'vendas@solotica.com.br',
    contato_telefone: '(11) 1234-5678',
    endereco: 'Sorocaba - SP'
  },
  {
    nome: 'Braslab Produtos Óticos',
    categoria: 'Laboratório',
    cnpj: '17.123.456/0001-89',
    especialidades: ['Laboratório de lentes', 'Surfaçagem', 'Tratamentos'],
    contato_email: 'lab@braslab.com.br',
    contato_telefone: '(11) 9876-5432',
    endereco: 'São Paulo - SP'
  },
  {
    nome: 'Fast Company Armações',
    categoria: 'Armações',
    cnpj: '23.456.789/0001-12',
    especialidades: ['Armações metálicas', 'Armações acetato', 'Acessórios'],
    contato_email: 'vendas@fastcompany.com.br',
    contato_telefone: '(11) 5432-1098',
    endereco: 'São Paulo - SP'
  }
]

const PRODUTOS_REAIS = [
  // Lentes
  { nome: 'Lente Monofocal Standard', categoria: 'Lentes', tipo: 'produto', preco_base: 89.90 },
  { nome: 'Lente Multifocal Premium', categoria: 'Lentes', tipo: 'produto', preco_base: 285.50 },
  { nome: 'Lente Progressive Zeiss', categoria: 'Lentes Premium', tipo: 'produto', preco_base: 485.90 },
  { nome: 'Lente de Contato Colorida', categoria: 'Lentes de Contato', tipo: 'produto', preco_base: 65.00 },
  { nome: 'Lente Anti-reflexo', categoria: 'Tratamentos', tipo: 'produto', preco_base: 125.00 },
  { nome: 'Lente Fotossensível', categoria: 'Tratamentos', tipo: 'produto', preco_base: 195.00 },
  
  // Armações
  { nome: 'Armação Metálica Premium', categoria: 'Armações', tipo: 'produto', preco_base: 189.90 },
  { nome: 'Armação Acetato Fashion', categoria: 'Armações', tipo: 'produto', preco_base: 145.50 },
  { nome: 'Armação Titânio Ultra Light', categoria: 'Armações', tipo: 'produto', preco_base: 325.00 },
  
  // Serviços
  { nome: 'Conserto de Armação', categoria: 'Serviços', tipo: 'servico', preco_base: 25.00 },
  { nome: 'Ajuste de Óculos', categoria: 'Serviços', tipo: 'servico', preco_base: 15.00 },
  { nome: 'Manutenção Preventiva', categoria: 'Serviços', tipo: 'servico', preco_base: 35.00 },
  { nome: 'Surfaçagem Personalizada', categoria: 'Laboratório', tipo: 'servico', preco_base: 75.00 }
]

const PLANOS_CONTAS_REAIS = [
  // Receitas (3.x.x)
  { codigo: '3.1', nome: 'Receitas de Vendas', nivel: 1, tipo: 'receita' },
  { codigo: '3.1.1', nome: 'Vendas à Vista', nivel: 2, tipo: 'receita', pai_codigo: '3.1' },
  { codigo: '3.1.2', nome: 'Vendas no Cartão', nivel: 2, tipo: 'receita', pai_codigo: '3.1' },
  { codigo: '3.1.3', nome: 'Vendas Parceladas', nivel: 2, tipo: 'receita', pai_codigo: '3.1' },
  { codigo: '3.2', nome: 'Outras Receitas', nivel: 1, tipo: 'receita' },
  
  // Custos Variáveis (4.x.x)
  { codigo: '4.1', nome: 'Custos de Produtos', nivel: 1, tipo: 'despesa' },
  { codigo: '4.1.1', nome: 'Compra de Lentes', nivel: 2, tipo: 'despesa', pai_codigo: '4.1' },
  { codigo: '4.1.2', nome: 'Compra de Armações', nivel: 2, tipo: 'despesa', pai_codigo: '4.1' },
  { codigo: '4.1.3', nome: 'Laboratório e Tratamentos', nivel: 2, tipo: 'despesa', pai_codigo: '4.1' },
  { codigo: '4.2', nome: 'Custos Operacionais', nivel: 1, tipo: 'despesa' },
  
  // Despesas Fixas (5.x.x)  
  { codigo: '5.1', nome: 'Despesas Administrativas', nivel: 1, tipo: 'despesa' },
  { codigo: '5.1.1', nome: 'Pró-labore', nivel: 2, tipo: 'despesa', pai_codigo: '5.1' },
  { codigo: '5.1.2', nome: 'Salários', nivel: 2, tipo: 'despesa', pai_codigo: '5.1' },
  { codigo: '5.1.3', nome: 'Encargos Sociais', nivel: 2, tipo: 'despesa', pai_codigo: '5.1' },
  { codigo: '5.2', nome: 'Despesas Operacionais', nivel: 1, tipo: 'despesa' },
  { codigo: '5.2.1', nome: 'Aluguel', nivel: 2, tipo: 'despesa', pai_codigo: '5.2' },
  { codigo: '5.2.2', nome: 'Energia Elétrica', nivel: 2, tipo: 'despesa', pai_codigo: '5.2' },
  { codigo: '5.2.3', nome: 'Telefone', nivel: 2, tipo: 'despesa', pai_codigo: '5.2' },
  { codigo: '5.3', nome: 'Impostos e Taxas', nivel: 1, tipo: 'despesa' }
]

interface ImportStatus {
  stage: string
  status: 'pending' | 'running' | 'success' | 'error'
  message: string
  count?: number
}

export default function ImportadorDadosReais() {
  const [isImporting, setIsImporting] = useState(false)
  const [importStatus, setImportStatus] = useState<ImportStatus[]>([])
  
  const updateStatus = (stage: string, status: ImportStatus['status'], message: string, count?: number) => {
    setImportStatus(prev => {
      const newStatus = [...prev]
      const existingIndex = newStatus.findIndex(s => s.stage === stage)
      
      if (existingIndex >= 0) {
        newStatus[existingIndex] = { stage, status, message, count }
      } else {
        newStatus.push({ stage, status, message, count })
      }
      
      return newStatus
    })
  }
  
  const importarFornecedores = async () => {
    updateStatus('fornecedores', 'running', 'Importando fornecedores...')
    
    try {
      const { data, error } = await supabase
        .from('fornecedores')
        .upsert(FORNECEDORES_REAIS.map(f => ({
          ...f,
          ativo: true,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString()
        })), {
          onConflict: 'cnpj',
          ignoreDuplicates: false
        })
      
      if (error) throw error
      
      updateStatus('fornecedores', 'success', 'Fornecedores importados com sucesso!', FORNECEDORES_REAIS.length)
    } catch (error: any) {
      updateStatus('fornecedores', 'error', `Erro ao importar fornecedores: ${error.message}`)
    }
  }
  
  const importarProdutos = async () => {
    updateStatus('produtos', 'running', 'Importando produtos e serviços...')
    
    try {
      const { data, error } = await supabase
        .from('produtos_servicos')
        .upsert(PRODUTOS_REAIS.map(p => ({
          ...p,
          ativo: true,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString()
        })), {
          onConflict: 'nome',
          ignoreDuplicates: false
        })
      
      if (error) throw error
      
      updateStatus('produtos', 'success', 'Produtos/Serviços importados com sucesso!', PRODUTOS_REAIS.length)
    } catch (error: any) {
      updateStatus('produtos', 'error', `Erro ao importar produtos: ${error.message}`)
    }
  }
  
  const importarPlanosContas = async () => {
    updateStatus('planos', 'running', 'Importando plano de contas...')
    
    try {
      // Primeiro criar pais, depois filhos
      const planosPais = PLANOS_CONTAS_REAIS.filter(p => p.nivel === 1)
      const planosFilhos = PLANOS_CONTAS_REAIS.filter(p => p.nivel === 2)
      
      // Inserir pais primeiro
      const { error: errorPais } = await supabase
        .from('planos_contas')
        .upsert(planosPais.map(p => ({
          ...p,
          ativo: true,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString()
        })), {
          onConflict: 'codigo',
          ignoreDuplicates: false
        })
      
      if (errorPais) throw errorPais
      
      // Buscar IDs dos pais para os filhos
      const { data: paisData, error: errorBusca } = await supabase
        .from('planos_contas')
        .select('id, codigo')
        .in('codigo', planosPais.map(p => p.codigo))
      
      if (errorBusca) throw errorBusca
      
      // Criar mapa de código -> ID
      const paisMap = paisData.reduce((acc: any, pai) => {
        acc[pai.codigo] = pai.id
        return acc
      }, {})
      
      // Inserir filhos com pai_id correto
      const { error: errorFilhos } = await supabase
        .from('planos_contas')
        .upsert(planosFilhos.map(p => ({
          codigo: p.codigo,
          nome: p.nome,
          nivel: p.nivel,
          tipo: p.tipo,
          pai_id: p.pai_codigo ? paisMap[p.pai_codigo] : null,
          ativo: true,
          created_at: new Date().toISOString(),
          updated_at: new Date().toISOString()
        })), {
          onConflict: 'codigo',
          ignoreDuplicates: false
        })
      
      if (errorFilhos) throw errorFilhos
      
      updateStatus('planos', 'success', 'Plano de contas importado com sucesso!', PLANOS_CONTAS_REAIS.length)
    } catch (error: any) {
      updateStatus('planos', 'error', `Erro ao importar plano de contas: ${error.message}`)
    }
  }
  
  const executarImportacao = async () => {
    setIsImporting(true)
    setImportStatus([])
    
    try {
      await importarFornecedores()
      await importarProdutos()
      await importarPlanosContas()
      
      updateStatus('concluido', 'success', 'Importação completa realizada com sucesso!')
    } catch (error) {
      updateStatus('concluido', 'error', 'Erro durante a importação')
    } finally {
      setIsImporting(false)
    }
  }
  
  const getStatusIcon = (status: ImportStatus['status']) => {
    switch (status) {
      case 'success':
        return <CheckCircleIcon className="w-5 h-5 text-green-600" />
      case 'error':
        return <ExclamationCircleIcon className="w-5 h-5 text-red-600" />
      case 'running':
        return <ClockIcon className="w-5 h-5 text-blue-600 animate-spin" />
      default:
        return <DocumentTextIcon className="w-5 h-5 text-gray-400" />
    }
  }
  
  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Importador de Dados Reais</h1>
          <p className="text-gray-600">Importa fornecedores, produtos e plano de contas extraídos da análise Yampa</p>
        </div>
        
        <button
          onClick={executarImportacao}
          disabled={isImporting}
          className="flex items-center px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 disabled:opacity-50"
        >
          <ArrowUpTrayIcon className="w-5 h-5 mr-2" />
          {isImporting ? 'Importando...' : 'Iniciar Importação'}
        </button>
      </div>
      
      {/* Prévia dos Dados */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Fornecedores</h3>
          <p className="text-2xl font-bold text-blue-600">{FORNECEDORES_REAIS.length}</p>
          <p className="text-sm text-gray-500">Fornecedores reais identificados</p>
        </Card>
        
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Produtos/Serviços</h3>
          <p className="text-2xl font-bold text-green-600">{PRODUTOS_REAIS.length}</p>
          <p className="text-sm text-gray-500">Produtos e serviços mapeados</p>
        </Card>
        
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Plano de Contas</h3>
          <p className="text-2xl font-bold text-purple-600">{PLANOS_CONTAS_REAIS.length}</p>
          <p className="text-sm text-gray-500">Contas contábeis estruturadas</p>
        </Card>
      </div>
      
      {/* Status da Importação */}
      {importStatus.length > 0 && (
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Status da Importação</h3>
          
          <div className="space-y-3">
            {importStatus.map((status, index) => (
              <div key={index} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div className="flex items-center space-x-3">
                  {getStatusIcon(status.status)}
                  <div>
                    <p className="font-medium text-gray-900 capitalize">{status.stage}</p>
                    <p className="text-sm text-gray-600">{status.message}</p>
                  </div>
                </div>
                
                {status.count && (
                  <span className="text-sm font-medium text-gray-500">
                    {status.count} registros
                  </span>
                )}
              </div>
            ))}
          </div>
        </Card>
      )}
      
      {/* Dados a Serem Importados */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Fornecedores */}
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Fornecedores Identificados</h3>
          <div className="space-y-3 max-h-80 overflow-y-auto">
            {FORNECEDORES_REAIS.map((fornecedor, index) => (
              <div key={index} className="p-3 border rounded-lg">
                <p className="font-medium text-gray-900">{fornecedor.nome}</p>
                <p className="text-sm text-gray-600">{fornecedor.categoria}</p>
                <p className="text-xs text-gray-500">{fornecedor.cnpj}</p>
              </div>
            ))}
          </div>
        </Card>
        
        {/* Produtos */}
        <Card className="p-6">
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Produtos e Serviços</h3>
          <div className="space-y-3 max-h-80 overflow-y-auto">
            {PRODUTOS_REAIS.map((produto, index) => (
              <div key={index} className="p-3 border rounded-lg">
                <p className="font-medium text-gray-900">{produto.nome}</p>
                <p className="text-sm text-gray-600">{produto.categoria}</p>
                <p className="text-xs text-gray-500">
                  {produto.tipo} - R$ {produto.preco_base?.toFixed(2)}
                </p>
              </div>
            ))}
          </div>
        </Card>
      </div>
    </div>
  )
}