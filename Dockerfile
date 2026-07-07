# Build stage
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Serve stage
FROM caddy:2-alpine

COPY --from=builder /app/dist /usr/share/caddy

EXPOSE 80
