'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { 
  ArrowDownTrayIcon,
  ArrowUpTrayIcon,
  DocumentDuplicateIcon,
  CloudArrowDownIcon,
  CloudArrowUpIcon,
  ServerIcon,
  CalendarIcon,
  ClockIcon,
  CheckCircleIcon,
  ExclamationCircleIcon,
  PlayIcon,
  PauseIcon,
  DocumentTextIcon,
  TableCellsIcon,
  ChartBarIcon
} from '@heroicons/react/24/outline'

interface BackupTask {
  id: string
  nome: string
  tipo: 'completo' | 'incremental' | 'dados'
  status: 'sucesso' | 'erro' | 'executando' | 'agendado'
  data_execucao: string
  tamanho?: string
  tempo_execucao?: string
  proximo_backup?: string
}

interface ExportOption {
  id: string
  nome: string
  descricao: string
  formato: string[]
  icone: any
  dados_inclusos: string[]
}

export default function BackupExportPage() {
  const [activeTab, setActiveTab] = useState('backup')
  const [selectedExport, setSelectedExport] = useState('')
  const [exportFormat, setExportFormat] = useState('xlsx')
  const [periodo, setPeriodo] = useState(() => {
    const now = new Date()
    const currentYear = now.getFullYear()
    const currentMonth = now.getMonth() + 1
    
    return {
      inicio: `${currentYear}-${currentMonth.toString().padStart(2, '0')}-01`,
      fim: new Date(currentYear, currentMonth, 0).toISOString().split('T')[0]
    }
  })

  // ✅ DADOS REAIS: Backups serão implementados via Supabase Storage
  // Por enquanto, mostramos configuração manual
  const backups: BackupTask[] = [
    {
      id: '1',
      nome: 'Download Manual de Dados',
      tipo: 'completo',
      status: 'agendado',
      data_execucao: new Date().toISOString(),
      proximo_backup: new Date(Date.now() + 24*60*60*1000).toISOString()
    }
  ]

  // Opções de exportação
  const exportOptions: ExportOption[] = [
    {
      id: 'lancamentos',
      nome: 'Lançamentos Financeiros',
      descricao: 'Todos os lançamentos do período selecionado',
      formato: ['xlsx', 'csv', 'pdf'],
      icone: DocumentTextIcon,
      dados_inclusos: ['Data', 'Descrição', 'Valor', 'Tipo', 'Loja', 'Plano de Contas']
    },
    {
      id: 'dre',
      nome: 'DRE - Demonstração do Resultado',
      descricao: 'Relatório completo da DRE por período',
      formato: ['xlsx', 'pdf'],
      icone: ChartBarIcon,
      dados_inclusos: ['Receitas', 'Despesas', 'Resultado', 'Comparativo']
    },
    {
      id: 'fluxo-caixa',
      nome: 'Fluxo de Caixa',
      descricao: 'Relatório de fluxo de caixa detalhado',
      formato: ['xlsx', 'pdf'],
      icone: ArrowDownTrayIcon,
      dados_inclusos: ['Entradas', 'Saídas', 'Saldo', 'Projeções']
    },
    {
      id: 'balancete',
      nome: 'Balancete',
      descricao: 'Balancete contábil com saldos por conta',
      formato: ['xlsx', 'pdf'],
      icone: TableCellsIcon,
      dados_inclusos: ['Código da Conta', 'Nome', 'Saldo Anterior', 'Débitos', 'Créditos', 'Saldo Atual']
    },
    {
      id: 'completo',
      nome: 'Exportação Completa',
      descricao: 'Todos os dados do sistema',
      formato: ['json', 'sql'],
      icone: DocumentDuplicateIcon,
      dados_inclusos: ['Lançamentos', 'Lojas', 'Usuários', 'Plano de Contas', 'Configurações']
    }
  ]

  const getStatusColor = (status: string) => {
    const colors = {
      sucesso: 'text-green-600 bg-green-100',
      erro: 'text-red-600 bg-red-100',
      executando: 'text-blue-600 bg-blue-100',
      agendado: 'text-yellow-600 bg-yellow-100'
    }
    return colors[status as keyof typeof colors] || 'text-gray-600 bg-gray-100'
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'sucesso':
        return CheckCircleIcon
      case 'erro':
        return ExclamationCircleIcon
      case 'executando':
        return PlayIcon
      default:
        return ClockIcon
    }
  }

  const formatDateTime = (dateString: string) => {
    return new Date(dateString).toLocaleString('pt-BR')
  }

  const exportar = () => {
    if (!selectedExport) {
      alert('Selecione um tipo de exportação')
      return
    }
    
    // Simular exportação
    alert(`Exportando ${selectedExport} em formato ${exportFormat.toUpperCase()}...`)
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Backup & Exportação</h1>
          <p className="text-gray-600">Gerenciar backups automáticos e exportar dados</p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
            <PlayIcon className="w-4 h-4 mr-2" />
            Executar Backup Manual
          </button>
        </div>
      </div>

      {/* Tabs */}
      <div className="border-b border-gray-200">
        <nav className="-mb-px flex space-x-8">
          <button
            onClick={() => setActiveTab('backup')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'backup'
                ? 'border-blue-500 text-blue-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            <ServerIcon className="w-4 h-4 mr-2 inline" />
            Backups
          </button>
          <button
            onClick={() => setActiveTab('export')}
            className={`py-2 px-1 border-b-2 font-medium text-sm ${
              activeTab === 'export'
                ? 'border-blue-500 text-blue-600'
                : 'border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300'
            }`}
          >
            <ArrowDownTrayIcon className="w-4 h-4 mr-2 inline" />
            Exportar Dados
          </button>
        </nav>
      </div>

      {/* Conteúdo Backup */}
      {activeTab === 'backup' && (
        <div className="space-y-6">
          {/* Status dos Backups */}
          <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
            <Card className="p-4">
              <div className="text-center">
                <div className="text-2xl font-bold text-green-600">
                  {backups.filter(b => b.status === 'sucesso').length}
                </div>
                <div className="text-sm text-gray-600">Backups Bem-sucedidos</div>
              </div>
            </Card>
            
            <Card className="p-4">
              <div className="text-center">
                <div className="text-2xl font-bold text-red-600">
                  {backups.filter(b => b.status === 'erro').length}
                </div>
                <div className="text-sm text-gray-600">Falhas</div>
              </div>
            </Card>
            
            <Card className="p-4">
              <div className="text-center">
                <div className="text-2xl font-bold text-blue-600">
                  {backups.filter(b => b.status === 'executando').length}
                </div>
                <div className="text-sm text-gray-600">Em Execução</div>
              </div>
            </Card>
            
            <Card className="p-4">
              <div className="text-center">
                <div className="text-2xl font-bold text-yellow-600">
                  {backups.filter(b => b.status === 'agendado').length}
                </div>
                <div className="text-sm text-gray-600">Agendados</div>
              </div>
            </Card>
          </div>

          {/* Lista de Backups */}
          <Card className="overflow-hidden">
            <div className="bg-gray-50 px-6 py-3 border-b border-gray-200">
              <h3 className="text-lg font-semibold text-gray-900">Histórico de Backups</h3>
            </div>
            
            <div className="divide-y divide-gray-200">
              {backups.map((backup) => {
                const StatusIcon = getStatusIcon(backup.status)
                
                return (
                  <div key={backup.id} className="px-6 py-4 hover:bg-gray-50">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center space-x-4">
                        <StatusIcon className="w-5 h-5 text-gray-400" />
                        <div>
                          <h4 className="font-medium text-gray-900">{backup.nome}</h4>
                          <p className="text-sm text-gray-500">
                            Tipo: {backup.tipo} • Executado em: {formatDateTime(backup.data_execucao)}
                          </p>
                        </div>
                      </div>
                      
                      <div className="flex items-center space-x-4">
                        <div className="text-right text-sm">
                          {backup.tamanho && (
                            <p className="text-gray-900">Tamanho: {backup.tamanho}</p>
                          )}
                          {backup.tempo_execucao && (
                            <p className="text-gray-500">Tempo: {backup.tempo_execucao}</p>
                          )}
                          {backup.proximo_backup && (
                            <p className="text-gray-500">
                              Próximo: {formatDateTime(backup.proximo_backup)}
                            </p>
                          )}
                        </div>
                        
                        <span className={`inline-flex px-2 py-1 text-xs font-medium rounded-full ${getStatusColor(backup.status)}`}>
                          {backup.status.charAt(0).toUpperCase() + backup.status.slice(1)}
                        </span>
                        
                        <div className="flex gap-1">
                          <button className="p-1 text-gray-400 hover:text-blue-600">
                            <ArrowDownTrayIcon className="w-4 h-4" />
                          </button>
                          <button className="p-1 text-gray-400 hover:text-green-600">
                            <PlayIcon className="w-4 h-4" />
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>
          </Card>
        </div>
      )}

      {/* Conteúdo Exportação */}
      {activeTab === 'export' && (
        <div className="space-y-6">
          {/* Configuração de Período */}
          <Card className="p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Período para Exportação</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Data Início</label>
                <input
                  type="date"
                  value={periodo.inicio}
                  onChange={(e) => setPeriodo(prev => ({ ...prev, inicio: e.target.value }))}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Data Fim</label>
                <input
                  type="date"
                  value={periodo.fim}
                  onChange={(e) => setPeriodo(prev => ({ ...prev, fim: e.target.value }))}
                  className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                />
              </div>
            </div>
          </Card>

          {/* Opções de Exportação */}
          <Card className="p-6">
            <h3 className="text-lg font-semibold text-gray-900 mb-4">Selecionar Dados para Exportação</h3>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {exportOptions.map((option) => {
                const IconComponent = option.icone
                
                return (
                  <div
                    key={option.id}
                    className={`p-4 border-2 rounded-lg cursor-pointer transition-colors ${
                      selectedExport === option.id
                        ? 'border-blue-500 bg-blue-50'
                        : 'border-gray-200 hover:border-gray-300'
                    }`}
                    onClick={() => setSelectedExport(option.id)}
                  >
                    <div className="flex items-start space-x-3">
                      <input
                        type="radio"
                        name="export"
                        checked={selectedExport === option.id}
                        onChange={() => setSelectedExport(option.id)}
                        className="mt-1"
                      />
                      <IconComponent className="w-5 h-5 mt-1 text-blue-600" />
                      <div className="flex-1">
                        <h4 className="font-medium text-gray-900">{option.nome}</h4>
                        <p className="text-sm text-gray-500 mb-2">{option.descricao}</p>
                        <div className="text-xs text-gray-400">
                          <p className="mb-1">Formatos: {option.formato.join(', ').toUpperCase()}</p>
                          <p>Inclui: {option.dados_inclusos.join(', ')}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>
          </Card>

          {/* Formato e Ação */}
          {selectedExport && (
            <Card className="p-6">
              <div className="flex items-center justify-between">
                <div className="flex items-center space-x-4">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Formato de Exportação</label>
                    <select
                      value={exportFormat}
                      onChange={(e) => setExportFormat(e.target.value)}
                      className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                    >
                      {exportOptions.find(opt => opt.id === selectedExport)?.formato.map(format => (
                        <option key={format} value={format}>
                          {format.toUpperCase()}
                        </option>
                      ))}
                    </select>
                  </div>
                </div>
                
                <button
                  onClick={exportar}
                  className="flex items-center px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700"
                >
                  <ArrowDownTrayIcon className="w-4 h-4 mr-2" />
                  Exportar Dados
                </button>
              </div>
            </Card>
          )}
        </div>
      )}
    </div>
  )
}