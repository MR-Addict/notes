FROM ubuntu AS builder
COPY assets/mdbook /usr/local/bin
COPY assets/mdbook-admonish /usr/local/bin
WORKDIR /app
COPY . .
RUN chmod u+x /usr/local/bin/mdbook*
RUN mdbook build

FROM nginx:stable-alpine
COPY --from=builder /app/book /usr/share/nginx/html
