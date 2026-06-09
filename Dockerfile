FROM node:20-alpine AS builder
RUN apk add --no-cache python3 make g++ sqlite-dev
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

FROM node:20-alpine
RUN apk add --no-cache sqlite-libs tini
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY package.json ./
COPY server.js ./
COPY src/ ./src/
COPY public/ ./public/
COPY briefing.db ./
RUN mkdir -p /app/data
EXPOSE 80
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "server.js"]
