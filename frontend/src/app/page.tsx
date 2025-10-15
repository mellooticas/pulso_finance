'use client'

import { useEffect } from 'react'
import { useRouter } from 'next/navigation'

export default function HomePage() {
  const router = useRouter()

  useEffect(() => {
    // Check if Supabase is configured
    const hasSupabaseConfig = 
      process.env.NEXT_PUBLIC_SUPABASE_URL !== 'https://your-project.supabase.co' &&
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY !== 'your-anon-key'

    if (hasSupabaseConfig) {
      // If configured, redirect to login (middleware will handle further redirects)
      router.push('/login')
    } else {
      // If not configured, show status page
      router.push('/status')
    }
  }, [router])

  return (
    <div className="min-h-screen bg-slate-50 flex items-center justify-center">
      <div className="text-center">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-slate-900 mx-auto mb-4"></div>
        <p className="text-slate-600">Carregando...</p>
      </div>
    </div>
  )
}
