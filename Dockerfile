FROM node:20-alpine AS build

WORKDIR /app

# Copy package files
COPY package.json pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Copy the rest of the application
COPY . .

# Build the application
RUN pnpm run build

# Production stage
FROM oven/bun:1.2-alpine AS production

WORKDIR /app

# Copy built assets from build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./

# Set NODE_ENV
ENV NODE_ENV=production
ENV PORT=3000

# Expose application port
EXPOSE 3000

# Run the application with Bun
CMD ["bun", "run", "dist/main"] 