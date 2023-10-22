# # Instalar dependencias solo cuando sea necesario
# FROM node:16-alpine AS deps
# # Verifique https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine para entender por qué se podría necesitar libc6-compat.
# RUN apk add --no-cache libc6-compat
# WORKDIR /app
# COPY package.json package-lock.json ./
# RUN npm ci

# # Reconstruir el código fuente solo cuando sea necesario
# FROM node:16-alpine AS builder
# WORKDIR /app
# COPY --from=deps /app/node_modules ./node_modules
# COPY . .
# RUN npm run build

# # Imagen de producción, copiar todos los archivos y ejecutar next
# FROM node:16-alpine AS runner
# WORKDIR /app

# ENV NODE_ENV production

# RUN addgroup -g 1001 -S nodejs
# RUN adduser -S nextjs -u 1001

# # Solo necesita copiar next.config.js si NO está utilizando la configuración predeterminada
# # COPY --from=builder /app/next.config.js ./
# COPY --from=builder /app/public ./public
# COPY --from=builder /app/package.json ./package.json

# # Aproveche automáticamente las trazas de salida para reducir el tamaño de la imagen
# # https://nextjs.org/docs/advanced-features/output-file-tracing
# COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
# COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# USER nextjs

# EXPOSE 3000

# ENV PORT 3000

# # Next.js recopila datos de telemetría completamente anónimos sobre el uso general.
# # Aprende más aquí: https://nextjs.org/telemetry
# # Descomente la siguiente línea en caso de que quiera deshabilitar la telemetría.
# # ENV NEXT_TELEMETRY_DISABLED 1

# CMD ["node", "server.js"]


# This dockerfile config is for development mode

FROM node:16-alpine
WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

ENV PORT 3000

CMD ["npm", "run", "dev"]