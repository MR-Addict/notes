FROM ubuntu AS builder
COPY assets/mdbook /usr/local/bin
COPY assets/mdbook-admonish /usr/local/bin
WORKDIR /usr/src/app
COPY . .
RUN mdbook build -d public

FROM nginx:stable-alpine
COPY --from=builder /usr/src/app/public /usr/share/nginx/html
COPY --from=builder /usr/src/app/conf.d /etc/nginx