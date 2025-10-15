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
  CalculatorIcon
} from '@heroicons/react/24/outline'
import { UserRole } from '@/lib/constants'
import { useAuth } from '@/contexts/auth-context'

const navigation = [
  { name: 'Dashboard', href: '/dashboard', icon: HomeIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  { name: 'Lançamentos', href: '/dashboard/lancamentos', icon: DocumentTextIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  { name: 'DRE', href: '/dashboard/dre', icon: ChartBarIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  { name: 'Fluxo de Caixa', href: '/dashboard/fluxo-caixa', icon: BanknotesIcon, roles: ['admin', 'gerencial', 'financeiro'] },
  { name: 'Análise Financeira', href: '/dashboard/analise', icon: ChartPieIcon, roles: ['admin', 'gerencial'] },
  { name: 'Relatórios', href: '/dashboard/relatorios', icon: CalculatorIcon, roles: ['admin', 'gerencial'] },
  { name: 'Lojas', href: '/dashboard/lojas', icon: BuildingStorefrontIcon, roles: ['admin'] },
  { name: 'Usuários', href: '/dashboard/usuarios', icon: UserGroupIcon, roles: ['admin'] },
  { name: 'Configurações', href: '/dashboard/configuracoes', icon: Cog6ToothIcon, roles: ['admin'] },
]

function classNames(...classes: string[]) {
  return classes.filter(Boolean).join(' ')
}

export function DashboardSidebar() {
  const pathname = usePathname()
  const { profile } = useAuth()

  // Filter navigation based on user role
  const filteredNavigation = navigation.filter(item => 
    profile?.papel && item.roles.includes(profile.papel)
  )

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
                      <Link
                        href={item.href}
                        className={classNames(
                          pathname === item.href
                            ? 'bg-slate-800 text-white'
                            : 'text-slate-300 hover:text-white hover:bg-slate-800',
                          'group flex gap-x-3 rounded-md p-2 text-sm leading-6 font-semibold'
                        )}
                      >
                        <item.icon
                          className={classNames(
                            pathname === item.href ? 'text-white' : 'text-slate-400 group-hover:text-white',
                            'h-6 w-6 shrink-0'
                          )}
                          aria-hidden="true"
                        />
                        {item.name}
                      </Link>
                    </li>
                  ))}
                </ul>
              </li>
              <li className="mt-auto">
                <div className="text-xs font-semibold leading-6 text-slate-400">
                  {profile?.papel?.toUpperCase()} • {profile?.nome}
                </div>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </>
  )
}