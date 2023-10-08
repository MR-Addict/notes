# 搭建 Wireguard 服务器

配置 Docker 容器：

```yaml
version: "3"
services:
  wg-easy:
    image: weejewel/wg-easy
    restart: unless-stopped
    volumes:
      - ./data:/etc/wireguard
    ports:
      - 51820:51820/udp
      - 51821:51821/tcp
    environment:
      - WG_HOST=[change-this]
      - PASSWORD=[change-this]
      - WG_DEFAULT_DNS=1.1.1.1
      - WG_MTU=1420
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.ip_forward=1
      - net.ipv4.conf.all.src_valid_mark=1
```

启动容器：

```sh
docker-compose up -d
```
