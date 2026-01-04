// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  site: 'https://lajs5257.dev',
  output: 'static',
  build: {
    format: 'directory'
  },
  image: {
    domains: ['avatars.githubusercontent.com']
  },
  vite: {
    plugins: [tailwindcss()]
  },
  integrations: [sitemap()]
});