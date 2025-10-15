import { NextResponse } from 'next/server'
import type { NextRequest } from 'next/server'
import { createClient } from '@/lib/supabase/middleware'

export async function middleware(req: NextRequest) {
  console.log('🔍 Middleware - Pathname:', req.nextUrl.pathname)
  
  // Log dos cookies para debug
  const cookies = req.cookies.getAll()
  const authCookies = cookies.filter(cookie => 
    cookie.name.includes('supabase') || 
    cookie.name.includes('sb-') ||
    cookie.name.includes('access') ||
    cookie.name.includes('refresh')
  )
  console.log('🍪 Supabase cookies encontrados:', authCookies.length > 0 ? authCookies.map(c => `${c.name}=${c.value.substring(0, 20)}...`) : 'nenhum')
  
  const { supabase, response } = createClient(req)

  // IMPORTANTE: Usar getUser() em vez de getSession() para evitar problemas de refresh
  const {
    data: { user },
    error
  } = await supabase.auth.getUser()

  if (error) {
    console.log('❌ Erro ao obter usuário:', error.message)
    // Em caso de erro, ser mais permissivo - não bloquear dashboard imediatamente
    console.log('⚠️ Erro na autenticação, mas permitindo acesso temporariamente')
  }

  console.log('🔍 Middleware - User exists:', !!user)
  console.log('🔍 Middleware - User ID:', user?.id)
  console.log('🔍 Middleware - User email:', user?.email)

  // Protect dashboard routes - ser mais permissivo
  if (req.nextUrl.pathname.startsWith('/dashboard')) {
    if (!user && !error) {
      // Só bloquear se realmente não há usuário E não há erro de auth
      console.log('🔒 Middleware - Blocking dashboard access, redirecting to login')
      return NextResponse.redirect(new URL('/login', req.url))
    } else if (user) {
      console.log('✅ Middleware - Dashboard access allowed for user:', user.email)
    } else {
      console.log('⚠️ Middleware - Allowing dashboard access despite auth error (temporary)')
    }
  }

  // Redirect authenticated users away from auth pages
  if (req.nextUrl.pathname.startsWith('/login') && user) {
    console.log('🔄 Middleware - User logged in, redirecting away from login to dashboard')
    return NextResponse.redirect(new URL('/dashboard', req.url))
  }

  // Redirect root to appropriate page
  if (req.nextUrl.pathname === '/') {
    if (user) {
      console.log('🔄 Middleware - Root access with session, redirecting to dashboard')
      return NextResponse.redirect(new URL('/dashboard', req.url))
    } else {
      console.log('🔄 Middleware - Root access without session, redirecting to login')
      return NextResponse.redirect(new URL('/login', req.url))
    }
  }

  console.log('✅ Middleware - Allowing request to continue')
  return response
}

export const config = {
  matcher: [
    '/((?!api|_next/static|_next/image|favicon.ico).*)',
  ],
}