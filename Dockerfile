FROM node:22.16.0-alpine

WORKDIR /app

# Instalar bun (usando su instalación oficial)
RUN apk add --no-cache curl \
  && curl -fsSL https://bun.sh/install | bash

# Añadir bun al PATH
ENV BUN_INSTALL="/root/.bun"
ENV PATH="$BUN_INSTALL/bin:$PATH"

COPY package.json bun.lockb* ./

# Instalar dependencias con bun
RUN bun install

COPY . .

# Construir el proyecto con bun
RUN bun run build

EXPOSE 3000

CMD ["bun", "run", "preview"]
