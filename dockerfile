# Stage 1 - Builder
FROM node:18-alpine AS builder
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

COPY . .
RUN yarn build

# Stage 2 - Runner
FROM node:18-alpine
WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --production

COPY server.js ./
COPY --from=builder /app/build ./build

EXPOSE 80
CMD ["node", "server.js"]

