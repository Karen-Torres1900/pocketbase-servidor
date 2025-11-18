# Base: Alpine Linux
FROM alpine:latest

# Instalar certificados
RUN apk add --no-cache ca-certificates

# Copiar binario de PocketBase
COPY pocketbase /app/pocketbase

# Definir el directorio de trabajo
WORKDIR /app

# Hacer ejecutable el binario (por si acaso)
RUN chmod +x pocketbase

# Comando para iniciar PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
