# 搭建 NextCloud 服务器

## 一、配置 Docker 容器

```yaml
version: "3"

services:
  nextcloud:
    container_name: nextcloud-app
    image: nextcloud:latest
    restart: unless-stopped
    ports:
      - 8080:80
    environment:
      - MYSQL_HOST=mysql
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=nextcloud
    volumes:
      - ./data:/var/www/html

  mysql:
    image: mysql:8.0
    container_name: nextcloud-db
    restart: unless-stopped
    environment:
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=nextcloud
      - MYSQL_ROOT_PASSWORD=nextcloud
    volumes:
      - ./db:/var/lib/mysql
```

启动容器：

```sh
docker-compose up -d
```

## 二、修改配置文件

```sh
sudo vim data/config/config.php
```

在 secret 下添加信任域名**trusted_domains**：

```php
<?php
$CONFIG = array (
  # some config
  'secret' => '......................',
  'trusted_domains' =>
  array (
    0 => 'cloud.mraddict.one'
    1 => 'localhost',
  ),
  # some other config
);
```

最后重启容器：

```sh
docker-compose restart
```

## 三、配置 Nginx

如果你是使用 Nginx 的反向代理，下面是参考配置：

```
server{
  listen 80;
  server_name cloud.mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name cloud.mraddict.one;

  client_max_body_size 0;
  underscores_in_headers on;

  ssl_certificate  /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.cert.pem;
  ssl_certificate_key /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.key.pem;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_headers_hash_max_size 512;
    proxy_headers_hash_bucket_size 64;
    proxy_buffering off;
    proxy_redirect off;
    proxy_max_temp_file_size 0;
    add_header Strict-Transport-Security "max-age=15552000; includeSubdomains;";
    add_header Front-End-Https on;
    proxy_pass http://localhost:8080;
  }

  location /.well-known/carddav {
    return 301 $scheme://$host/remote.php/dav;
  }

  location /.well-known/caldav {
    return 301 $scheme://$host/remote.php/dav;
  }
}
```
