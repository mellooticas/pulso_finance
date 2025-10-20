'use client'

import { useState } from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { 
  ChartBarIcon,
  DocumentTextIcon,
  CurrencyDollarIcon,
  BuildingStorefrontIcon,
  UserGroupIcon,
  Cog6ToothIcon,
  HomeIcon,
  ChartPieIcon,
  BanknotesIcon,
  CalculatorIcon,
  PresentationChartLineIcon,
  DocumentChartBarIcon,
  CreditCardIcon,
  TagIcon,
  ClipboardDocumentListIcon,
  ArrowTrendingUpIcon,
  FolderIcon,
  DocumentDuplicateIcon
} from '@heroicons/react/24/outline'
import { UserRole } from '@/lib/constants'
import { useAuth } from '@/contexts/auth-context'

const navigation = [
  { name: 'Dashboard', href: '/dashboard', icon: HomeIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  { name: '🎯 Central de Decisões', href: '/dashboard/decisoes', icon: ChartBarIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  
  // Módulo Financeiro
  { 
    name: 'Financeiro', 
    href: '#', 
    icon: CurrencyDollarIcon, 
    roles: ['admin', 'gerencial', 'financeiro'],
    children: [
      { name: 'Lançamentos', href: '/dashboard/lancamentos', icon: DocumentTextIcon },
      { name: 'Contas a Pagar', href: '/dashboard/contas-pagar', icon: CreditCardIcon },
      { name: 'Contas a Receber', href: '/dashboard/contas-receber', icon: BanknotesIcon },
      { name: 'Plano de Contas', href: '/dashboard/plano-contas', icon: FolderIcon },
      { name: 'Centros de Custo', href: '/dashboard/centros-custo', icon: TagIcon },
    ]
  },
  
  // Módulo Relatórios
  { 
    name: 'Relatórios', 
    href: '#', 
    icon: DocumentChartBarIcon, 
    roles: ['admin', 'gerencial', 'financeiro'],
    children: [
      { name: 'DRE', href: '/dashboard/dre', icon: ChartBarIcon },
      { name: 'Fluxo de Caixa', href: '/dashboard/fluxo-caixa', icon: PresentationChartLineIcon },
      { name: 'Análise Financeira', href: '/dashboard/analise', icon: ChartPieIcon },
      { name: 'Balancete', href: '/dashboard/balancete', icon: CalculatorIcon },
      { name: 'Comparativos', href: '/dashboard/comparativos', icon: ArrowTrendingUpIcon },
    ]
  },
  
  // Módulo Gestão
  { 
    name: 'Gestão', 
    href: '#', 
    icon: BuildingStorefrontIcon, 
    roles: ['admin', 'gerencial'],
    children: [
      { name: 'Lojas', href: '/dashboard/lojas', icon: BuildingStorefrontIcon },
      { name: 'Fornecedores', href: '/dashboard/fornecedores', icon: UserGroupIcon },
      { name: 'Produtos/Serviços', href: '/dashboard/produtos', icon: ClipboardDocumentListIcon },
    ]
  },
  
  // Módulo Admin
  { 
    name: 'Administração', 
    href: '#', 
    icon: Cog6ToothIcon, 
    roles: ['admin'],
    children: [
      { name: 'Usuários', href: '/dashboard/usuarios', icon: UserGroupIcon },
      { name: 'Configurações', href: '/dashboard/configuracoes', icon: Cog6ToothIcon },
      { name: 'Backup & Export', href: '/dashboard/backup', icon: DocumentDuplicateIcon },
    ]
  },
]

function classNames(...classes: string[]) {
  return classes.filter(Boolean).join(' ')
}

export function DashboardSidebar() {
  const pathname = usePathname()
  const { profile } = useAuth()
  const [expandedItems, setExpandedItems] = useState<string[]>([])

  // Filter navigation based on user role
  const filteredNavigation = navigation.filter(item => 
    item.roles.includes('admin') // Temporariamente admin para ver tudo
  )

  const toggleExpanded = (itemName: string) => {
    setExpandedItems(prev => 
      prev.includes(itemName) 
        ? prev.filter(name => name !== itemName)
        : [...prev, itemName]
    )
  }

  const isExpanded = (itemName: string) => expandedItems.includes(itemName)
  const isActive = (href: string) => pathname === href
  const isParentActive = (children: any[]) => 
    children?.some(child => pathname === child.href)

  return (
    <>
      {/* Static sidebar for desktop */}
      <div className="hidden lg:fixed lg:inset-y-0 lg:z-50 lg:flex lg:w-72 lg:flex-col">
        <div className="flex grow flex-col gap-y-5 overflow-y-auto bg-slate-900 px-6 pb-4">
          <div className="flex h-16 shrink-0 items-center">
            <span className="text-white text-xl font-bold">PULSO Finance</span>
          </div>
          <nav className="flex flex-1 flex-col">
            <ul role="list" className="flex flex-1 flex-col gap-y-7">
              <li>
                <ul role="list" className="-mx-2 space-y-1">
                  {filteredNavigation.map((item) => (
                    <li key={item.name}>
                      {item.children ? (
                        // Item com submenu
                        <div>
                          <button
                            onClick={() => toggleExpanded(item.name)}
                            className={classNames(
                              isParentActive(item.children)
                                ? 'bg-slate-800 text-white'
                                : 'text-slate-300 hover:text-white hover:bg-slate-800',
                              'group flex w-full items-center gap-x-3 rounded-md p-2 text-left text-sm leading-6 font-semibold'
                            )}
                          >
                            <item.icon
                              className={classNames(
                                isParentActive(item.children) ? 'text-white' : 'text-slate-400 group-hover:text-white',
                                'h-6 w-6 shrink-0'
                              )}
                              aria-hidden="true"
                            />
                            {item.name}
                            <svg
                              className={classNames(
                                isExpanded(item.name) ? 'rotate-90' : '',
                                'ml-auto h-4 w-4 transition-transform'
                              )}
                              fill="none"
                              viewBox="0 0 24 24"
                              stroke="currentColor"
                            >
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                            </svg>
                          </button>
                          {(isExpanded(item.name) || isParentActive(item.children)) && (
                            <ul className="mt-1 px-2">
                              {item.children.map((child: any) => (
                                <li key={child.name}>
                                  <Link
                                    href={child.href}
                                    className={classNames(
                                      isActive(child.href)
                                        ? 'bg-slate-700 text-white'
                                        : 'text-slate-400 hover:text-white hover:bg-slate-700',
                                      'group flex gap-x-3 rounded-md py-2 pl-8 pr-2 text-sm leading-6'
                                    )}
                                  >
                                    <child.icon
                                      className="h-4 w-4 shrink-0"
                                      aria-hidden="true"
                                    />
                                    {child.name}
                                  </Link>
                                </li>
                              ))}
                            </ul>
                          )}
                        </div>
                      ) : (
                        // Item simples
                        <Link
                          href={item.href}
                          className={classNames(
                            isActive(item.href)
                              ? 'bg-slate-800 text-white'
                              : 'text-slate-300 hover:text-white hover:bg-slate-800',
                            'group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold'
                          )}
                        >
                          <item.icon
                            className={classNames(
                              isActive(item.href) ? 'text-white' : 'text-slate-400 group-hover:text-white',
                              'h-6 w-6 shrink-0'
                            )}
                            aria-hidden="true"
                          />
                          {item.name}
                        </Link>
                      )}
                    </li>
                  ))}
                </ul>
              </li>
              <li className="mt-auto">
                <div className="border-t border-slate-700 pt-4">
                  <div className="flex items-center gap-x-3 px-2 py-3">
                    <div className="flex h-8 w-8 items-center justify-center rounded-full bg-slate-700">
                      <span className="text-sm font-medium text-white">
                        {'Admin'?.charAt(0).toUpperCase()}
                      </span>
                    </div>
                    <div className="text-sm">
                      <div className="font-medium text-white">Administrador</div>
                      <div className="text-slate-400">admin@pulsofinance.com</div>
                    </div>
                  </div>
                  <div className="mt-2 text-xs text-slate-400 px-2">
                    PULSO Finance v2.0 • {new Date().getFullYear()}
                  </div>
                </div>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </>
  )
}