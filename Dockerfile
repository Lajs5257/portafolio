FROM node:22-alpine AS base

WORKDIR /app

# Install Bun
RUN apk add --no-cache bash curl \
  && curl -fsSL https://bun.sh/install | bash

# Add bun to PATH
ENV BUN_INSTALL="/root/.bun"
ENV PATH="${BUN_INSTALL}/bin:$PATH"

# Install dependencies
COPY package.json bun.lockb* ./

# RUN bun install
FROM base AS prod-deps
RUN bun install --no-dev

# Install dev dependencies
FROM base AS build-deps
RUN bun install

# Copy source files
FROM build-deps AS build
COPY . .
RUN bun run build

# Create a runtime image
FROM base AS runtime
COPY --from=prod-deps /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist

# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=4321

# Expose port
EXPOSE 4321

# Run the app
CMD ["bun", "run", "preview"]
