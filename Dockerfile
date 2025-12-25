FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run build

EXPOSE 3333

CMD ["sh", "-c", "npx drizzle-kit migrate && node dist/server.js"]