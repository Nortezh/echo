FROM oven/bun:1.2-alpine AS build

WORKDIR /app

# Copy package files
COPY package.json bun.lock ./

# Install dependencies
RUN bun install

# Copy the rest of the application
COPY . .

# Build the application
RUN bun run build

FROM oven/bun:1.2-alpine AS production

WORKDIR /app

COPY --from=build /app/dist ./dist
COPY --from=build /app/package.json ./
COPY --from=build /app/bun.lock ./

# Install only production dependencies and clean up in one layer
RUN bun install --production && \
    rm -rf ~/.bun/install/cache

# Expose application port
EXPOSE 3000

# Run the application
CMD ["bun", "run", "dist/main"]