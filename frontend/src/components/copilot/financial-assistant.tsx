// components/copilot/financial-assistant.tsx
'use client'

/**
 * 🤖 Assistente Financeiro IA
 * 
 * Componente de chat com IA que:
 * - Responde perguntas financeiras
 * - Busca dados em tempo real
 * - Sugere ações
 * - Analisa tendências
 */

import { useState } from 'react'
import { Card } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { 
  Sparkles, 
  Send, 
  Loader2,
  X,
  MinusIcon,
  MaximizeIcon
} from 'lucide-react'

interface Message {
  id: string
  role: 'user' | 'assistant'
  content: string
}

interface FinancialAssistantProps {
  lojaId?: string
  periodo?: {
    inicio: string
    fim: string
  }
  className?: string
}

export function FinancialAssistant({ 
  lojaId, 
  periodo,
  className 
}: FinancialAssistantProps) {
  const [isMinimized, setIsMinimized] = useState(false)
  const [isOpen, setIsOpen] = useState(true)
  const [inputValue, setInputValue] = useState('')
  const [messages, setMessages] = useState<Message[]>([
    {
      id: 'welcome',
      role: 'assistant',
      content: `👋 Olá! Sou o Copiloto Financeiro do PULSO.\n\nPosso ajudar com:\n• Análise de receitas e despesas\n• DRE e margens\n• Vencimentos próximos\n• Comparativos de períodos\n• Recomendações personalizadas\n\nO que você gostaria de saber?`
    }
  ])
  const [isLoading, setIsLoading] = useState(false)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!inputValue.trim() || isLoading) return
    
    const userMessage: Message = {
      id: Date.now().toString(),
      role: 'user',
      content: inputValue
    }

    setMessages(prev => [...prev, userMessage])
    setInputValue('')
    setIsLoading(true)
    
    try {
      const response = await fetch('/api/copilot/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          messages: [...messages, userMessage],
          context: {
            loja_id: lojaId,
            periodo: periodo
          }
        })
      })

      if (!response.ok) throw new Error('Erro na API')

      const data = await response.json()
      
      const assistantMessage: Message = {
        id: (Date.now() + 1).toString(),
        role: 'assistant',
        content: data.message || 'Desculpe, ocorreu um erro.'
      }

      setMessages(prev => [...prev, assistantMessage])
    } catch (error) {
      console.error('Erro ao enviar mensagem:', error)
      
      const errorMessage: Message = {
        id: (Date.now() + 1).toString(),
        role: 'assistant',
        content: 'Desculpe, ocorreu um erro ao processar sua mensagem. Verifique se a API Key está configurada.'
      }

      setMessages(prev => [...prev, errorMessage])
    } finally {
      setIsLoading(false)
    }
  }

  if (!isOpen) {
    return (
      <Button
        onClick={() => setIsOpen(true)}
        className="fixed bottom-6 right-6 h-14 w-14 rounded-full shadow-lg"
        size="icon"
      >
        <Sparkles className="h-6 w-6" />
      </Button>
    )
  }

  if (isMinimized) {
    return (
      <Card className="fixed bottom-6 right-6 w-80 shadow-xl">
        <div className="flex items-center justify-between p-4 border-b">
          <div className="flex items-center gap-2">
            <Sparkles className="h-5 w-5 text-primary" />
            <h3 className="font-semibold">Copiloto Financeiro</h3>
          </div>
          <div className="flex gap-1">
            <Button
              variant="ghost"
              size="icon"
              onClick={() => setIsMinimized(false)}
            >
              <MaximizeIcon className="h-4 w-4" />
            </Button>
            <Button
              variant="ghost"
              size="icon"
              onClick={() => setIsOpen(false)}
            >
              <X className="h-4 w-4" />
            </Button>
          </div>
        </div>
      </Card>
    )
  }

  return (
    <Card className={`fixed bottom-6 right-6 w-96 h-[600px] shadow-xl flex flex-col ${className}`}>
      {/* Header */}
      <div className="flex items-center justify-between p-4 border-b">
        <div className="flex items-center gap-2">
          <div className="relative">
            <Sparkles className="h-5 w-5 text-primary" />
            {isLoading && (
              <Loader2 className="h-3 w-3 text-primary absolute -top-1 -right-1 animate-spin" />
            )}
          </div>
          <div>
            <h3 className="font-semibold text-sm">Copiloto Financeiro</h3>
            <p className="text-xs text-muted-foreground">
              {isLoading ? 'Pensando...' : 'Online'}
            </p>
          </div>
        </div>
        <div className="flex gap-1">
          <Button
            variant="ghost"
            size="icon"
            onClick={() => setIsMinimized(true)}
          >
            <MinusIcon className="h-4 w-4" />
          </Button>
          <Button
            variant="ghost"
            size="icon"
            onClick={() => setIsOpen(false)}
          >
            <X className="h-4 w-4" />
          </Button>
        </div>
      </div>

      {/* Messages */}
      <div className="flex-1 overflow-y-auto p-4 space-y-4">
        {messages.map((message) => (
          <div
            key={message.id}
            className={`flex ${
              message.role === 'user' ? 'justify-end' : 'justify-start'
            }`}
          >
            <div
              className={`max-w-[85%] rounded-lg px-4 py-2 ${
                message.role === 'user'
                  ? 'bg-primary text-primary-foreground'
                  : 'bg-muted'
              }`}
            >
              <p className="text-sm whitespace-pre-wrap">{message.content}</p>
            </div>
          </div>
        ))}
        
        {isLoading && (
          <div className="flex justify-start">
            <div className="bg-muted rounded-lg px-4 py-2">
              <div className="flex items-center gap-2">
                <Loader2 className="h-4 w-4 animate-spin" />
                <span className="text-sm text-muted-foreground">
                  Analisando...
                </span>
              </div>
            </div>
          </div>
        )}
      </div>

      {/* Quick Actions */}
      <div className="px-4 py-2 border-t border-b bg-muted/30">
        <div className="flex gap-2 flex-wrap">
          <QuickActionButton
            onClick={() => setInputValue('Qual meu resultado financeiro do mês?')}
          >
            💰 Resultado do mês
          </QuickActionButton>
          <QuickActionButton
            onClick={() => setInputValue('Quais contas vencem nos próximos 7 dias?')}
          >
            📅 Vencimentos
          </QuickActionButton>
          <QuickActionButton
            onClick={() => setInputValue('Analise minhas despesas este mês')}
          >
            📊 Análise despesas
          </QuickActionButton>
        </div>
      </div>

      {/* Input */}
      <form onSubmit={handleSubmit} className="p-4 border-t">
        <div className="flex gap-2">
          <Input
            value={inputValue}
            onChange={(e) => setInputValue(e.target.value)}
            placeholder="Pergunte sobre suas finanças..."
            className="flex-1"
            disabled={isLoading}
          />
          <Button 
            type="submit" 
            size="icon"
            disabled={isLoading || !inputValue.trim()}
          >
            <Send className="h-4 w-4" />
          </Button>
        </div>
      </form>
    </Card>
  )
}

function QuickActionButton({ 
  children, 
  onClick 
}: { 
  children: React.ReactNode
  onClick: () => void 
}) {
  return (
    <button
      onClick={onClick}
      className="text-xs px-2 py-1 rounded-md bg-background hover:bg-accent transition-colors border"
    >
      {children}
    </button>
  )
}
