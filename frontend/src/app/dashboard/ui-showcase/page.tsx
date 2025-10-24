// app/dashboard/ui-showcase/page.tsx
'use client'

/**
 * 🎨 Showcase de Componentes shadcn/ui
 * 
 * Demonstração de todos os componentes UI instalados
 */

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Switch } from '@/components/ui/switch'
import { Checkbox } from '@/components/ui/checkbox'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert'
import { Separator } from '@/components/ui/separator'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { 
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import {
  Table,
  TableBody,
  TableCaption,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from '@/components/ui/tooltip'
import { Skeleton } from '@/components/ui/skeleton'
import { AlertCircle, CheckCircle2, Info, Calendar } from 'lucide-react'
import { toast } from 'sonner'
import { ThemeToggle } from '@/components/theme-toggle'

export default function UIShowcasePage() {
  const [isChecked, setIsChecked] = useState(false)
  const [isEnabled, setIsEnabled] = useState(false)

  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">UI Components Showcase</h1>
          <p className="text-muted-foreground mt-2">
            Demonstração de todos os componentes shadcn/ui instalados
          </p>
        </div>
        <ThemeToggle />
      </div>

      {/* Badges */}
      <Card>
        <CardHeader>
          <CardTitle>Badges</CardTitle>
          <CardDescription>Diferentes variantes de badges</CardDescription>
        </CardHeader>
        <CardContent className="flex flex-wrap gap-2">
          <Badge>Default</Badge>
          <Badge variant="secondary">Secondary</Badge>
          <Badge variant="destructive">Destructive</Badge>
          <Badge variant="outline">Outline</Badge>
        </CardContent>
      </Card>

      {/* Buttons */}
      <Card>
        <CardHeader>
          <CardTitle>Buttons</CardTitle>
          <CardDescription>Variantes e tamanhos de botões</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex flex-wrap gap-2">
            <Button>Default</Button>
            <Button variant="secondary">Secondary</Button>
            <Button variant="destructive">Destructive</Button>
            <Button variant="outline">Outline</Button>
            <Button variant="ghost">Ghost</Button>
            <Button variant="link">Link</Button>
          </div>
          <div className="flex flex-wrap gap-2">
            <Button size="sm">Small</Button>
            <Button size="default">Default</Button>
            <Button size="lg">Large</Button>
            <Button size="icon">
              <CheckCircle2 className="h-4 w-4" />
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Alerts */}
      <Card>
        <CardHeader>
          <CardTitle>Alerts</CardTitle>
          <CardDescription>Mensagens de alerta e notificações</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <Alert>
            <Info className="h-4 w-4" />
            <AlertTitle>Informação</AlertTitle>
            <AlertDescription>
              Esta é uma mensagem informativa padrão.
            </AlertDescription>
          </Alert>
          <Alert variant="destructive">
            <AlertCircle className="h-4 w-4" />
            <AlertTitle>Erro</AlertTitle>
            <AlertDescription>
              Ocorreu um erro ao processar sua solicitação.
            </AlertDescription>
          </Alert>
        </CardContent>
      </Card>

      {/* Forms */}
      <Card>
        <CardHeader>
          <CardTitle>Form Elements</CardTitle>
          <CardDescription>Inputs, selects, checkboxes e switches</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input id="email" type="email" placeholder="seu@email.com" />
          </div>
          
          <div className="space-y-2">
            <Label htmlFor="message">Mensagem</Label>
            <Textarea id="message" placeholder="Digite sua mensagem..." />
          </div>
          
          <div className="space-y-2">
            <Label htmlFor="category">Categoria</Label>
            <Select>
              <SelectTrigger id="category">
                <SelectValue placeholder="Selecione uma categoria" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="receita">Receita</SelectItem>
                <SelectItem value="despesa">Despesa</SelectItem>
                <SelectItem value="investimento">Investimento</SelectItem>
              </SelectContent>
            </Select>
          </div>
          
          <div className="flex items-center space-x-2">
            <Checkbox 
              id="terms" 
              checked={isChecked}
              onCheckedChange={(checked) => setIsChecked(checked as boolean)}
            />
            <Label htmlFor="terms">Aceito os termos e condições</Label>
          </div>
          
          <div className="flex items-center space-x-2">
            <Switch 
              id="notifications"
              checked={isEnabled}
              onCheckedChange={setIsEnabled}
            />
            <Label htmlFor="notifications">Ativar notificações</Label>
          </div>
        </CardContent>
      </Card>

      {/* Tabs */}
      <Card>
        <CardHeader>
          <CardTitle>Tabs</CardTitle>
          <CardDescription>Navegação por abas</CardDescription>
        </CardHeader>
        <CardContent>
          <Tabs defaultValue="overview">
            <TabsList>
              <TabsTrigger value="overview">Visão Geral</TabsTrigger>
              <TabsTrigger value="analytics">Análises</TabsTrigger>
              <TabsTrigger value="reports">Relatórios</TabsTrigger>
            </TabsList>
            <TabsContent value="overview" className="space-y-4">
              <p className="text-sm text-muted-foreground">
                Conteúdo da aba de Visão Geral.
              </p>
            </TabsContent>
            <TabsContent value="analytics" className="space-y-4">
              <p className="text-sm text-muted-foreground">
                Conteúdo da aba de Análises.
              </p>
            </TabsContent>
            <TabsContent value="reports" className="space-y-4">
              <p className="text-sm text-muted-foreground">
                Conteúdo da aba de Relatórios.
              </p>
            </TabsContent>
          </Tabs>
        </CardContent>
      </Card>

      {/* Table */}
      <Card>
        <CardHeader>
          <CardTitle>Table</CardTitle>
          <CardDescription>Tabela de dados formatada</CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableCaption>Lista de transações recentes</TableCaption>
            <TableHeader>
              <TableRow>
                <TableHead>ID</TableHead>
                <TableHead>Descrição</TableHead>
                <TableHead>Tipo</TableHead>
                <TableHead className="text-right">Valor</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              <TableRow>
                <TableCell>001</TableCell>
                <TableCell>Venda de produto</TableCell>
                <TableCell>
                  <Badge>Receita</Badge>
                </TableCell>
                <TableCell className="text-right text-green-600">R$ 1.250,00</TableCell>
              </TableRow>
              <TableRow>
                <TableCell>002</TableCell>
                <TableCell>Pagamento fornecedor</TableCell>
                <TableCell>
                  <Badge variant="destructive">Despesa</Badge>
                </TableCell>
                <TableCell className="text-right text-red-600">R$ 850,00</TableCell>
              </TableRow>
              <TableRow>
                <TableCell>003</TableCell>
                <TableCell>Recebimento cliente</TableCell>
                <TableCell>
                  <Badge>Receita</Badge>
                </TableCell>
                <TableCell className="text-right text-green-600">R$ 2.100,00</TableCell>
              </TableRow>
            </TableBody>
          </Table>
        </CardContent>
      </Card>

      {/* Dialog & Toast */}
      <Card>
        <CardHeader>
          <CardTitle>Dialog & Toast</CardTitle>
          <CardDescription>Modais e notificações toast</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex flex-wrap gap-2">
            <Dialog>
              <DialogTrigger asChild>
                <Button>Abrir Dialog</Button>
              </DialogTrigger>
              <DialogContent>
                <DialogHeader>
                  <DialogTitle>Título do Dialog</DialogTitle>
                  <DialogDescription>
                    Esta é uma descrição do dialog. Aqui você pode adicionar formulários,
                    informações ou qualquer conteúdo necessário.
                  </DialogDescription>
                </DialogHeader>
                <div className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="name">Nome</Label>
                    <Input id="name" placeholder="Seu nome" />
                  </div>
                  <Button>Salvar</Button>
                </div>
              </DialogContent>
            </Dialog>

            <Button onClick={() => toast.success('Sucesso!', {
              description: 'Operação realizada com sucesso.'
            })}>
              Toast Success
            </Button>

            <Button variant="destructive" onClick={() => toast.error('Erro!', {
              description: 'Ocorreu um erro ao processar.'
            })}>
              Toast Error
            </Button>

            <Button variant="outline" onClick={() => toast.info('Informação', {
              description: 'Esta é uma mensagem informativa.'
            })}>
              Toast Info
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Tooltip */}
      <Card>
        <CardHeader>
          <CardTitle>Tooltips</CardTitle>
          <CardDescription>Dicas contextuais</CardDescription>
        </CardHeader>
        <CardContent>
          <TooltipProvider>
            <Tooltip>
              <TooltipTrigger asChild>
                <Button variant="outline">Hover aqui</Button>
              </TooltipTrigger>
              <TooltipContent>
                <p>Esta é uma dica útil!</p>
              </TooltipContent>
            </Tooltip>
          </TooltipProvider>
        </CardContent>
      </Card>

      {/* Skeleton */}
      <Card>
        <CardHeader>
          <CardTitle>Skeleton (Loading)</CardTitle>
          <CardDescription>Estados de carregamento</CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="space-y-2">
            <Skeleton className="h-4 w-full" />
            <Skeleton className="h-4 w-3/4" />
            <Skeleton className="h-4 w-1/2" />
          </div>
          <Separator />
          <div className="flex items-center space-x-4">
            <Skeleton className="h-12 w-12 rounded-full" />
            <div className="space-y-2 flex-1">
              <Skeleton className="h-4 w-full" />
              <Skeleton className="h-4 w-2/3" />
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
