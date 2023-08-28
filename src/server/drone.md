# 使用 Drone CI 服务器

Drone CI 是一个基于 go 的 CI 工具，配合 Github 或者 Gitlab 等可以实现方便的持续部署。

## 一、配置 Docker 容器

使用以下**docker-compose.yaml**：

```yaml
version: "3"
services:
  drone-server:
    image: drone/drone
    restart: unless-stopped
    ports:
      - 8000:80
    environment:
      - DRONE_SERVER_PROTO=https
      - DRONE_SERVER_HOST=drone.mraddict.top

      - DRONE_USER_FILTER=MR-Addict
      - DRONE_USER_CREATE=username:MR-Addict,admin:true

      - DRONE_RPC_SECRET=e0c4fab16337ae0c7faa3706379ccac9
      - DRONE_GITHUB_CLIENT_ID=97b3184516ee77d0b3a7
      - DRONE_GITHUB_CLIENT_SECRET=ae9b7b2cfd2f4f0ea38d2fa1c0b2f44b60327ab5
    volumes:
      - ./data:/data

  drone-runner:
    image: drone/drone-runner-docker
    restart: unless-stopped
    environment:
      - DRONE_RPC_PROTO=https
      - DRONE_RUNNER_CAPACITY=2
      - DRONE_RPC_HOST=drone.mraddict.top
      - DRONE_RPC_SECRET=e0c4fab16337ae0c7faa3706379ccac9
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    depends_on:
      - drone-server
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
  server_name drone.mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;
  server_name drone.mraddict.top;

  ssl_certificate  /etc/nginx/certs/tencent/drone.mraddict.top/drone.mraddict.top.cert;
  ssl_certificate_key /etc/nginx/certs/tencent/drone.mraddict.top/drone.mraddict.top.key;

  location / {
    proxy_pass http://localhost:8000;
    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```
