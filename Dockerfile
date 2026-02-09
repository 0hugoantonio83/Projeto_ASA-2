# Usar a imagem oficial como base
FROM nginx:latest

# Copiar a configuração personalizada para substituir a padrão
COPY nginx.conf /etc/nginx/nginx.conf

# Expõe a porta para documentação
EXPOSE 8080
