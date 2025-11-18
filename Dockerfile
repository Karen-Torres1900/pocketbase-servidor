# Imagen base de Linux
FROM alpine:latest

# Instala certificados para HTTPS
RUN apk add --no-cache ca-certificates

# Copia el binario de PocketBase
COPY pocketbase /app/pocketbase

# Directorio de trabajo
WORKDIR /app

# Expone el puerto que usa PocketBase
EXPOSE 8090

# Comando para iniciar PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]

