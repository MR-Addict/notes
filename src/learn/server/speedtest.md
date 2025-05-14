# 使用 Speedtest 服务器

Speedtest 是一个测量网络速度的工具，它可以帮助你测试你的网络连接速度。你可以使用 Speedtest 客户端来测试你的网络连接速度，也可以使用 Speedtest 服务器来测试你的网络连接速度。

本服务器主要用于测量本地的网络连接速度。

配置容器：

```yaml
version: "3"
services:
  speedtest:
    restart: unless-stopped
    ports:
      - 3000:3000
    image: openspeedtest/latest
```

最后启动容器：

```sh
docker-compose up -d
```
