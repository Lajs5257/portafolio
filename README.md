# Portafolio Personal

Sitio personal de Luis Alberto Jiménez Soto — Full Stack Developer. Generado estáticamente con Astro, cero JavaScript en el navegador.

![Astro](https://img.shields.io/badge/Astro_6-2C2952?logo=astro&logoColor=FF5D01) ![TailwindCSS](https://img.shields.io/badge/TailwindCSS_4-0f172a?logo=tailwindcss&logoColor=38BDF8) ![TypeScript](https://img.shields.io/badge/TypeScript-1f2937?logo=typescript&logoColor=3178C6) ![Bun](https://img.shields.io/badge/Bun-000?logo=bun&logoColor=fff)

**Sitio en vivo:** [lajs5257.dev](https://lajs5257.dev)

## Qué es

Portafolio profesional con secciones de experiencia, habilidades, proyectos y contacto. Pensado para ser rápido, accesible y fácil de mantener.

- Cero JavaScript enviado al navegador (salvo un botón de volver arriba)
- Diseño oscuro con glassmorphism y gradientes sutiles
- Responsive, mobile-first
- SEO optimizado (sitemap, meta tags, robots.txt)
- Imágenes optimizadas con astro:assets + Sharp (conversión automática a WebP)
- Sitio estático pre-renderizado en build time

## Stack tecnológico

| Tecnología | Versión | Propósito |
|------------|---------|-----------|
| Astro | 6.0.8 | Static site generator |
| TailwindCSS | 4.2.2 | Utility-first CSS |
| TypeScript | strict | Type safety |
| Bun | latest | Package manager & runtime |
| Sharp | 0.34.5 | Image optimization |
| Nginx | alpine | Static file server (Docker) |

## Inicio rápido

```bash
bun install
bun run dev        # http://localhost:4321
```

## Docker

```bash
docker build -t portafolio .
docker run -p 8080:4321 portafolio
```

Multi-stage build: Bun compila, nginx sirve los estáticos.

## Infraestructura

Oracle Cloud VPS + Coolify + Traefik + Cloudflare. Push a `main` dispara un webhook que construye la imagen Docker y despliega automáticamente con zero downtime. Los assets se cachean en el edge de Cloudflare.

## Contacto

- **GitHub:** [github.com/Lajs5257](https://github.com/Lajs5257)
- **LinkedIn:** [linkedin.com/in/luis-alberto-jimenez-soto](https://www.linkedin.com/in/luis-alberto-jimenez-soto/)
- **Email:** lajs5257@gmail.com
