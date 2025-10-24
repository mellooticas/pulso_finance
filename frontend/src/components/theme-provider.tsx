// components/theme-provider.tsx
'use client'

/**
 * 🎨 Provider de Tema (Light/Dark Mode)
 * 
 * Wrapper do next-themes para controlar tema do sistema
 */

import * as React from 'react'
import { ThemeProvider as NextThemesProvider } from 'next-themes'
import { type ThemeProviderProps } from 'next-themes'

export function ThemeProvider({ children, ...props }: ThemeProviderProps) {
  return <NextThemesProvider {...props}>{children}</NextThemesProvider>
}
