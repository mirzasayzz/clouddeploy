# Multi-stage build for optimized image size

# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /usr/src/app
COPY app/package*.json ./
RUN npm install
COPY app/ .

# Stage 2: Production
FROM node:18-alpine
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
EXPOSE 3000
CMD ["node", "server.js"]
