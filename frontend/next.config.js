/** @type {import('next').NextConfig} */
const nextConfig = {
  typescript: {
    ignoreBuildErrors: false,
  },
  eslint: {
    ignoreDuringBuilds: false,
  },
  experimental: {
    turbo: {
      rules: {
        '*.svg': {
          loaders: ['@svgr/webpack'],
          as: '*.js',
        },
      },
    },
  },
  async headers() {
    return [
      {
        source: '/(.*)',
        headers: [
          {
            key: 'Content-Security-Policy',
            value: `
              default-src 'self';
              script-src 'self' 'unsafe-eval' 'unsafe-inline' https://*.supabase.co https://*.supabase.com blob:;
              style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://use.typekit.net;
              img-src 'self' data: https: blob:;
              font-src 'self' data: https://fonts.gstatic.com https://use.typekit.net;
              connect-src 'self' https://*.supabase.co https://*.supabase.com https://fonts.googleapis.com https://fonts.gstatic.com https://use.typekit.net ws://localhost:* wss://localhost:*;
              frame-ancestors 'none';
              object-src 'none';
              base-uri 'self';
            `.replace(/\s+/g, ' ').trim()
          },
        ],
      },
    ]
  },
}

module.exports = nextConfig