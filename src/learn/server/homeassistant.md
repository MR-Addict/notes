# 搭建 Home Assistant 服务器

## 一、配置 Docker 容器

使用以下**docker-compose.yaml**：

```yaml
version: "3"
services:
  home:
    image: ghcr.io/home-assistant/home-assistant:stable
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - ./config:/config
    ports:
      - 8123:8123
    restart: unless-stopped
```

启动容器：

```sh
docker-compose up -d
```

## 二、修改配置文件

使用以下命令查看 Gateway：

```sh
docker network inspect home_default|grep '"Gateway": '|awk -F"\"" '{print $4}'
```

然后进入配置文件：

```sh
vim config/configuration.yaml
```

在末尾添加以下内容，注意将**trusted_proxies**修改为查询的网关：

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.24.0.1
```

最后重启容器：

```sh
docker-compose restart
```

## 三、配置 Nginx 反向代理

```
server{
  listen 80;
  listen [::]:80;
  server_name home.mraddict.one;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name home.mraddict.one;

  ssl_certificate  /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.cert.pem;
  ssl_certificate_key /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.key.pem;

  location / {
    proxy_pass http://localhost:8123;
    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
  }
}
```
