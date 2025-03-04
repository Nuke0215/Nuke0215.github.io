# ==============================
# Development Stage: Hugo Server
# ==============================
FROM klakegg/hugo:latest AS dev
WORKDIR /app
COPY . .
ENTRYPOINT ["hugo"]
CMD ["server", "--bind", "0.0.0.0", "--baseURL", "http://localhost", "--buildDrafts"]
# ==============================
# Build Stage: Génération du site
# ==============================
FROM klakegg/hugo:latest AS build
WORKDIR /app
COPY . .
RUN hugo --minify

# ==============================
# Production Stage: Serveur Nginx
# ==============================
FROM nginx:latest AS prod
COPY --from=builder /app/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]