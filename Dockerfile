# Base image for building
FROM node:18 AS base

# Set working directory
WORKDIR /app

# Install Turbo (monorepo build tool)
RUN npm install -g turbo

# Copy repo contents
COPY . .

# Install dependencies
RUN npm install --legacy-peer-deps

# Disable TS check
ENV NEXT_DISABLE_TYPECHECK=true

# Skip broken TypeScript build in monorepo
RUN turbo run build --filter=web --filter=!@plane/editor

# --- Runner image (for smaller final image) ---
FROM node:18-slim AS runner

WORKDIR /app

# Copy built app from previous stage
COPY --from=base /app .

# Set env to production
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Start the Next.js app
CMD ["npm", "start"]
