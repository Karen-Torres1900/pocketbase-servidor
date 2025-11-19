# Imagen base
FROM alpine:latest

# Instalar dependencias necesarias
RUN apk add --no-cache ca-certificates bash

# Copiar PocketBase
COPY pocketbase /app/pocketbase

# Copiar script de inicialización
COPY init_admin.sh /app/init_admin.sh

# Dar permisos de ejecución
RUN chmod +x /app/pocketbase && chmod +x /app/init_admin.sh

# Directorio de trabajo
WORKDIR /app

# Exponer puerto
EXPOSE 8090

# Comando de arranque
CMD [ "sh", "-c", "./init_admin.sh && ./pocketbase serve --http=0.0.0.0:8090" ]
