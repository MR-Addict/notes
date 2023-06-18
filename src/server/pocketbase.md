# 使用 Pocketbase

## 1. 配置 Docker 服务器

配置容器：

```yaml
version: "3"
services:
  pocketbase:
    image: ghcr.io/muchobien/pocketbase:latest
    container_name: pocketbase
    restart: unless-stopped
    ports:
      - 8090:8090
    volumes:
      - ./data/db:/pb_data
      - ./data/public:/pb_public
    healthcheck:
      test: wget --no-verbose --tries=1 --spider http://localhost:8090/api/health || exit 1
      interval: 5s
      timeout: 5s
      retries: 5
```

启动容器：

```sh
docker-compose up -d
```

## 二、配置 Nginx 反向代理

```
server{
  listen 80;
  listen [::]:80;
  server_name pocketbase.mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name pocketbase.mraddict.top;

  ssl_certificate  /etc/nginx/certs/cloudflare/mraddict.top/mraddict.top.cert.pem;
  ssl_certificate_key /etc/nginx/certs/cloudflare/mraddict.top/mraddict.top.key.pem;

  location / {
    proxy_pass http://localhost:8090;

    proxy_redirect off;
    proxy_buffering off;
    proxy_max_temp_file_size 0;
    proxy_headers_hash_max_size 512;
    proxy_headers_hash_bucket_size 64;

    proxy_redirect off;
    proxy_set_header Host $host;
    proxy_set_header Connection "";
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

## 三、如何使用

打开类似如下链接即可：

- [https://your_domain.com/\_/](https://your_domain.com/_/)
