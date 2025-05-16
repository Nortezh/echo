FROM oven/bun:1.2-alpine

WORKDIR /app

# Copy package files
COPY package.json bun.lock ./

# Install dependencies
RUN bun install

# Copy the rest of the application
COPY . .

# Build the application
RUN bun run build

# Expose application port
EXPOSE 3000

# Run the application
CMD ["bun", "run", "dist/main"] 