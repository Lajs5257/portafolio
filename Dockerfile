# Stage 1: Build with Bun
FROM oven/bun:1-alpine AS builder

WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

# Stage 2: Serve with nginx
FROM nginx:alpine

# Copy custom nginx config (replaces the main config entirely)
COPY nginx.conf /etc/nginx/nginx.conf

# Remove default server block and welcome page, then copy built assets
RUN rm -f /etc/nginx/conf.d/default.conf \
 && rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 4321

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost:4321/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
