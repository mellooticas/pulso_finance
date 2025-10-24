import { DashboardSidebar } from '@/components/dashboard/sidebar'
import { DashboardHeader } from '@/components/dashboard/header'
import { FiltersProvider } from '@/contexts/filters-context'
import { FiltersBar } from '@/components/dashboard/filters-bar'
import { FinancialAssistant } from '@/components/copilot/financial-assistant'

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen bg-slate-50">
      <DashboardSidebar />
      <div className="lg:pl-72">
        <FiltersProvider>
          <DashboardHeader />
          <div className="py-4">
            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
              <FiltersBar />
            </div>
          </div>
          <main className="py-4">
            <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
              {children}
            </div>
          </main>
          
          {/* 🤖 Copiloto IA - disponível em todas as páginas */}
          <FinancialAssistant />
        </FiltersProvider>
      </div>
    </div>
  )
}