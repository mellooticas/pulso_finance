'use client'

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { 
  Cog6ToothIcon,
  ShieldCheckIcon,
  BellIcon,
  CurrencyDollarIcon,
  ChartBarIcon,
  DocumentTextIcon,
  UserCircleIcon,
  ServerIcon,
  ClockIcon,
  LanguageIcon,
  DevicePhoneMobileIcon,
  ComputerDesktopIcon
} from '@heroicons/react/24/outline'

interface ConfigSection {
  id: string
  title: string
  description: string
  icon: any
  settings: ConfigSetting[]
}

interface ConfigSetting {
  key: string
  label: string
  type: 'toggle' | 'select' | 'input' | 'number'
  value: any
  options?: { value: string; label: string }[]
  description?: string
}

export default function ConfiguracoesPage() {
  const [configs, setConfigs] = useState<ConfigSection[]>([
    {
      id: 'geral',
      title: 'Configurações Gerais',
      description: 'Configurações básicas do sistema',
      icon: Cog6ToothIcon,
      settings: [
        {
          key: 'empresa_nome',
          label: 'Nome da Empresa',
          type: 'input',
          value: 'PULSO Finance',
          description: 'Nome da empresa exibido no sistema'
        },
        {
          key: 'moeda_padrao',
          label: 'Moeda Padrão',
          type: 'select',
          value: 'BRL',
          options: [
            { value: 'BRL', label: 'Real (R$)' },
            { value: 'USD', label: 'Dólar (US$)' },
            { value: 'EUR', label: 'Euro (€)' }
          ]
        },
        {
          key: 'fuso_horario',
          label: 'Fuso Horário',
          type: 'select',
          value: 'America/Sao_Paulo',
          options: [
            { value: 'America/Sao_Paulo', label: 'Brasília (UTC-3)' },
            { value: 'America/New_York', label: 'Nova York (UTC-5)' },
            { value: 'Europe/London', label: 'Londres (UTC+0)' }
          ]
        },
        {
          key: 'decimal_places',
          label: 'Casas Decimais',
          type: 'number',
          value: 2,
          description: 'Número de casas decimais para valores monetários'
        }
      ]
    },
    {
      id: 'financeiro',
      title: 'Configurações Financeiras',
      description: 'Parâmetros para controle financeiro',
      icon: CurrencyDollarIcon,
      settings: [
        {
          key: 'dias_vencimento_alerta',
          label: 'Dias para Alerta de Vencimento',
          type: 'number',
          value: 7,
          description: 'Quantos dias antes do vencimento exibir alertas'
        },
        {
          key: 'limite_credito_padrao',
          label: 'Limite de Crédito Padrão',
          type: 'number',
          value: 10000,
          description: 'Limite padrão para novos fornecedores'
        },
        {
          key: 'juros_atraso',
          label: 'Juros por Atraso (%)',
          type: 'number',
          value: 1.0,
          description: 'Percentual de juros aplicado em atrasos'
        },
        {
          key: 'aprovacao_automatica',
          label: 'Aprovação Automática',
          type: 'toggle',
          value: false,
          description: 'Aprovar automaticamente lançamentos até determinado valor'
        }
      ]
    },
    {
      id: 'notificacoes',
      title: 'Notificações',
      description: 'Configurar alertas e notificações',
      icon: BellIcon,
      settings: [
        {
          key: 'email_vencimentos',
          label: 'Email para Vencimentos',
          type: 'toggle',
          value: true,
          description: 'Receber emails sobre vencimentos próximos'
        },
        {
          key: 'email_novos_lancamentos',
          label: 'Email para Novos Lançamentos',
          type: 'toggle',
          value: false,
          description: 'Receber emails quando novos lançamentos forem criados'
        },
        {
          key: 'notif_dashboard',
          label: 'Notificações no Dashboard',
          type: 'toggle',
          value: true,
          description: 'Exibir notificações na tela inicial'
        },
        {
          key: 'frequencia_relatorios',
          label: 'Frequência de Relatórios',
          type: 'select',
          value: 'semanal',
          options: [
            { value: 'diario', label: 'Diário' },
            { value: 'semanal', label: 'Semanal' },
            { value: 'mensal', label: 'Mensal' },
            { value: 'nunca', label: 'Nunca' }
          ]
        }
      ]
    },
    {
      id: 'seguranca',
      title: 'Segurança',
      description: 'Configurações de segurança e acesso',
      icon: ShieldCheckIcon,
      settings: [
        {
          key: 'sessao_timeout',
          label: 'Timeout de Sessão (minutos)',
          type: 'number',
          value: 60,
          description: 'Tempo em minutos para expirar sessões inativas'
        },
        {
          key: 'senha_complexa',
          label: 'Exigir Senha Complexa',
          type: 'toggle',
          value: true,
          description: 'Requerer senhas com letras, números e símbolos'
        },
        {
          key: 'duplo_fator',
          label: 'Autenticação 2FA',
          type: 'toggle',
          value: false,
          description: 'Habilitar autenticação de dois fatores'
        },
        {
          key: 'log_atividades',
          label: 'Log de Atividades',
          type: 'toggle',
          value: true,
          description: 'Registrar todas as ações dos usuários'
        }
      ]
    },
    {
      id: 'interface',
      title: 'Interface',
      description: 'Personalização da interface do usuário',
      icon: ComputerDesktopIcon,
      settings: [
        {
          key: 'tema',
          label: 'Tema',
          type: 'select',
          value: 'claro',
          options: [
            { value: 'claro', label: 'Claro' },
            { value: 'escuro', label: 'Escuro' },
            { value: 'auto', label: 'Automático' }
          ]
        },
        {
          key: 'idioma',
          label: 'Idioma',
          type: 'select',
          value: 'pt-BR',
          options: [
            { value: 'pt-BR', label: 'Português (Brasil)' },
            { value: 'en-US', label: 'English (US)' },
            { value: 'es-ES', label: 'Español' }
          ]
        },
        {
          key: 'itens_por_pagina',
          label: 'Itens por Página',
          type: 'select',
          value: '20',
          options: [
            { value: '10', label: '10 itens' },
            { value: '20', label: '20 itens' },
            { value: '50', label: '50 itens' },
            { value: '100', label: '100 itens' }
          ]
        },
        {
          key: 'sidebar_collapsed',
          label: 'Sidebar Recolhida',
          type: 'toggle',
          value: false,
          description: 'Manter sidebar recolhida por padrão'
        }
      ]
    }
  ])

  const updateSetting = (sectionId: string, settingKey: string, newValue: any) => {
    setConfigs(prev => prev.map(section => 
      section.id === sectionId 
        ? {
            ...section,
            settings: section.settings.map(setting =>
              setting.key === settingKey 
                ? { ...setting, value: newValue }
                : setting
            )
          }
        : section
    ))
  }

  const renderSetting = (sectionId: string, setting: ConfigSetting) => {
    switch (setting.type) {
      case 'toggle':
        return (
          <label className="flex items-center cursor-pointer">
            <input
              type="checkbox"
              checked={setting.value}
              onChange={(e) => updateSetting(sectionId, setting.key, e.target.checked)}
              className="sr-only"
            />
            <div className={`relative inline-flex h-6 w-11 items-center rounded-full transition-colors ${
              setting.value ? 'bg-blue-600' : 'bg-gray-200'
            }`}>
              <span className={`inline-block h-4 w-4 transform rounded-full bg-white transition-transform ${
                setting.value ? 'translate-x-6' : 'translate-x-1'
              }`} />
            </div>
          </label>
        )
      
      case 'select':
        return (
          <select
            value={setting.value}
            onChange={(e) => updateSetting(sectionId, setting.key, e.target.value)}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            {setting.options?.map(option => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        )
      
      case 'number':
        return (
          <input
            type="number"
            value={setting.value}
            onChange={(e) => updateSetting(sectionId, setting.key, Number(e.target.value))}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
        )
      
      default: // input
        return (
          <input
            type="text"
            value={setting.value}
            onChange={(e) => updateSetting(sectionId, setting.key, e.target.value)}
            className="px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
        )
    }
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Configurações do Sistema</h1>
          <p className="text-gray-600">Personalize o comportamento e aparência do PULSO Finance</p>
        </div>
        
        <div className="flex gap-3">
          <button className="flex items-center px-4 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700">
            <DocumentTextIcon className="w-4 h-4 mr-2" />
            Exportar Configs
          </button>
          <button className="flex items-center px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
            <ServerIcon className="w-4 h-4 mr-2" />
            Salvar Todas
          </button>
        </div>
      </div>

      {/* Seções de Configuração */}
      <div className="space-y-6">
        {configs.map((section) => {
          const IconComponent = section.icon
          
          return (
            <Card key={section.id} className="overflow-hidden">
              <div className="bg-gray-50 px-6 py-4 border-b border-gray-200">
                <div className="flex items-center">
                  <IconComponent className="w-5 h-5 mr-3 text-blue-600" />
                  <div>
                    <h3 className="text-lg font-semibold text-gray-900">{section.title}</h3>
                    <p className="text-sm text-gray-600">{section.description}</p>
                  </div>
                </div>
              </div>
              
              <div className="p-6">
                <div className="space-y-6">
                  {section.settings.map((setting) => (
                    <div key={setting.key} className="flex items-center justify-between">
                      <div className="flex-1">
                        <div className="flex items-center">
                          <label className="text-sm font-medium text-gray-900">
                            {setting.label}
                          </label>
                        </div>
                        {setting.description && (
                          <p className="text-sm text-gray-500 mt-1">
                            {setting.description}
                          </p>
                        )}
                      </div>
                      
                      <div className="ml-6">
                        {renderSetting(section.id, setting)}
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </Card>
          )
        })}
      </div>

      {/* Informações do Sistema */}
      <Card className="p-6">
        <div className="flex items-center mb-4">
          <ServerIcon className="w-5 h-5 mr-3 text-gray-600" />
          <h3 className="text-lg font-semibold text-gray-900">Informações do Sistema</h3>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6 text-sm">
          <div>
            <span className="text-gray-600">Versão do Sistema:</span>
            <span className="ml-2 font-medium">2.0.1</span>
          </div>
          <div>
            <span className="text-gray-600">Última Atualização:</span>
            <span className="ml-2 font-medium">2024-01-20</span>
          </div>
          <div>
            <span className="text-gray-600">Banco de Dados:</span>
            <span className="ml-2 font-medium">PostgreSQL 15.0</span>
          </div>
          <div>
            <span className="text-gray-600">Uptime:</span>
            <span className="ml-2 font-medium">15 dias, 3 horas</span>
          </div>
          <div>
            <span className="text-gray-600">Usuários Conectados:</span>
            <span className="ml-2 font-medium">3 usuários</span>
          </div>
          <div>
            <span className="text-gray-600">Backup Automático:</span>
            <span className="ml-2 font-medium text-green-600">Ativo</span>
          </div>
        </div>
      </Card>
    </div>
  )
}