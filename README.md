# Portafolio – Luis Alberto Jiménez

Portafolio personal para presentar experiencia, habilidades y proyectos como Full Stack Developer (.NET, Flutter, SQL, Docker y Python).

![Stack](https://img.shields.io/badge/Astro-2C2952?logo=astro&logoColor=FF5D01) ![TailwindCSS](https://img.shields.io/badge/TailwindCSS-0f172a?logo=tailwindcss&logoColor=38BDF8) ![Bun](https://img.shields.io/badge/Bun-000?logo=bun&logoColor=fff) ![TypeScript](https://img.shields.io/badge/TypeScript-1f2937?logo=typescript&logoColor=3178C6)

## ✨ Características
- Diseño oscuro con gradientes sutiles y efecto glass
- Secciones: Hero, Experiencia, Habilidades, Proyectos, Contacto
- Animaciones ligeras (float / fade) optimizadas
- Componente para descarga de CV
- Botón “volver arriba” con aparición progresiva
- Código estructurado por componentes Astro + Tailwind utility-first
- Preparado para despliegue estático (CDN friendly)

## 🗂 Estructura del Proyecto
```
/
├── astro.config.mjs
├── package.json
├── Dockerfile
├── public/
│   ├── favicon.svg
│   └── cv-luis-alberto-jimenez.pdf
├── src/
│   ├── assets/
│   ├── components/
│   │   ├── Badge.astro
│   │   ├── DownloadCV.astro
│   │   ├── Header.astro
│   │   ├── SocialBadget.astro
│   │   └── icons/*.astro
│   ├── layouts/
│   │   └── Layout.astro
│   ├── pages/
│   │   ├── index.astro
│   │   ├── about.astro (en revisión / posible fusión)
│   │   ├── projects.astro
│   │   └── contact.astro
│   └── styles/global.css
└── tsconfig.json
```

## 🚀 Inicio Rápido
Requisitos: [Bun](https://bun.sh) (o adapta a npm/yarn/pnpm).
```bash
bun install
bun run dev   # http://localhost:4321
```
Compilar producción:
```bash
bun run build
bun run preview
```
Con npm (alternativa):
```bash
npm install
npm run dev
```

## 🧩 Scripts
| Script | Descripción |
|--------|-------------|
| bun dev | Servidor de desarrollo |
| bun build | Genera `dist/` listo para deploy |
| bun preview | Sirve la build local |

## 🔧 Personalización Rápida
- Colores: ajusta gradientes en `Layout.astro`.
- Animaciones: modifica/añade en `global.css`.
- Navegación: edita `Header.astro` (anclas vs páginas).
- Contenido: actualiza secciones dentro de `pages/`.

## 📈 Performance / Buenas Prácticas
Aplicadas o recomendadas:
- Eliminación de clases no usadas (Tailwind JIT + build)
- Animaciones solo en `transform` / `opacity`
- Scroll suave + botón de retorno (no bloquea hilo)
- Posible uso futuro de `content-visibility:auto` en secciones largas
- Imágenes optimizables (siguiente paso: incorporar `@astrojs/image`)

## 🐳 Despliegue con Docker
```
# Build de producción
bun run build
# Crear imagen
docker build -t portafolio .
# Ejecutar contenedor (ejemplo sirve en :4321 interno → mapear 8080 host)
docker run -p 8080:4321 portafolio
```
(Verifica el CMD/EXPOSE del Dockerfile y ajusta puerto si cambia.)

## ☁️ Despliegue (alternativas)
- Vercel: importar repo → framework Astro → build `bun run build` → output `dist`.
- Netlify: build `bun run build` → publish `dist/`.
- Cloudflare Pages: build command `bun run build`.

## ⚙️ Producción (Resumen)
Sitio: https://lajs5257.dev
Infra: Oracle Cloud VPS + Coolify + Caddy + Cloudflare.
Deploy: push a `main` → webhook → build (Bun) → Caddy sirve nueva versión (cero downtime).
Cache: assets versionados (immutable) + edge Cloudflare.
Detalles completos y Caddyfile en [`docs/DEPLOY.md`](./docs/DEPLOY.md).

## 🛣 Roadmap / Próximos Pasos
- [ ] Fusionar sección About dentro de Home (versión ancla)
- [ ] Optimizar imágenes (avatar WebP + `@astrojs/image`)
- [ ] Añadir sección Blog / Artículos
- [ ] Implementar modo claro (theme switch)
- [ ] Tests de accesibilidad (axe / Lighthouse)
- [ ] Integrar Analytics ligero (Plausible / Umami)

## 📬 Contacto
- LinkedIn: https://www.linkedin.com/in/luis-alberto-jimenez-soto/
- Email: lajs5257@gmail.com
- GitHub: https://github.com/Lajs5257

---
Hecho con Astro + Tailwind + Bun.
