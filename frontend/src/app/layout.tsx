import type { Metadata, Viewport } from "next";
import { Inter } from "next/font/google";
import "./globals.css";
import { AuthProvider } from "@/contexts/auth-context";
import { QueryProvider } from "@/contexts/query-provider";
import { Toaster } from "sonner";

const inter = Inter({ subsets: ["latin"] });

export const metadata: Metadata = {
  title: "PULSO Finance - Gestão Financeira Inteligente",
  description: "Sistema completo de gestão financeira para óticas com BI avançado, DRE, fluxo de caixa e conciliação bancária automática.",
  keywords: ["gestão financeira", "óticas", "DRE", "fluxo de caixa", "BI", "conciliação bancária"],
  authors: [{ name: "PULSO Finance Team" }],
};

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  themeColor: '#2563eb',
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pt-BR" suppressHydrationWarning>
      <body className={inter.className}>
        <QueryProvider>
          <AuthProvider>
            {children}
            <Toaster 
              position="top-right"
              toastOptions={{
                duration: 4000,
                style: {
                  background: 'white',
                  color: 'black',
                  border: '1px solid #e5e7eb',
                }
              }}
            />
          </AuthProvider>
        </QueryProvider>
      </body>
    </html>
  );
}
