FROM nginx:alpine

# Copia el sitio estático al directorio público de Nginx
COPY src/ /usr/share/nginx/html/

EXPOSE 80

# Comprobación de salud básica del servicio
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1
