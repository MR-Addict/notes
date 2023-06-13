# 搭建 VSCode 服务器

配置 Dcocker 容器：

```yaml
version: "2.1"
services:
  ide:
    image: lscr.io/linuxserver/code-server:latest
    container_name: ide
    environment:
      - PUID=1538
      - PGID=1538
      - TZ=Asia/Shanghai
      - PASSWORD=password
      - SUDO_PASSWORD=password
      - DEFAULT_WORKSPACE=/config/workspace
    volumes:
      - ./config:/config
    ports:
      - 8443:8443
    restart: unless-stopped
  http:
    image: nginx:latest
    container_name: http
    restart: unless-stopped
    ports:
      - 5555:80
    volumes:
      - ./config/workspace:/usr/share/nginx/html
```

启动容器：

```sh
docker-compose up -d
```
