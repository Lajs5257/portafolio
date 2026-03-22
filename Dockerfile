# Stage 1: Build with Bun
FROM oven/bun:1-alpine AS builder

WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Remove default nginx config and welcome page
RUN rm /etc/nginx/conf.d/default.conf \
 && rm -rf /usr/share/nginx/html/*

# Copy custom config and built assets
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/dist /usr/share/nginx/html

# Ensure nginx user owns the files and can write logs/tmp
RUN chown -R nginx:nginx /usr/share/nginx/html \
 && chown -R nginx:nginx /var/cache/nginx \
 && chown -R nginx:nginx /var/log/nginx \
 && touch /tmp/nginx.pid \
 && chown nginx:nginx /tmp/nginx.pid

USER nginx

EXPOSE 4321

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:4321/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
