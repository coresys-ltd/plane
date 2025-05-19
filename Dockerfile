FROM node:18 AS base
WORKDIR /app
COPY . .

FROM base AS deps
RUN npm install -g turbo
RUN npm install --legacy-peer-deps

FROM deps AS build

ENV NEXT_DISABLE_ESLINT 1
ENV NEXT_DISABLE_TYPECHECK 1

RUN turbo run build --filter=web...

FROM node:18-slim AS runner
WORKDIR /app
COPY --from=build /app/apps/web ./
ENV NODE_ENV=production
EXPOSE 3000
CMD ["npm", "start"]
