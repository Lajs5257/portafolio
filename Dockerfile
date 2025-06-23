FROM node:22-alpine AS base

WORKDIR /app

# Install Bun
RUN apk add --no-cache bash curl \
  && curl -fsSL https://bun.sh/install | bash

# Set up Bun environment
ENV BUN_INSTALL="/root/.bun"
ENV PATH="${BUN_INSTALL}/bin:$PATH"

# Install dependencies
COPY package.json bun.lockb* ./
RUN bun install

# Copy application files
COPY . .

# Build the application
RUN bun run build \
    && bun add -g serve

# Create a production image
EXPOSE 4321

# Use the serve command to serve the built application
CMD ["serve", "-s", "dist", "-l", "4321"]