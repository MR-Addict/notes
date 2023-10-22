# 搭建 MC 服务器

配置 Dcocker 容器：

```yaml
version: "3"
services:
  minecraft:
    tty: true
    stdin_open: true
    image: itzg/minecraft-server
    restart: unless-stopped
    ports:
      - 25565:25565
    environment:
      EULA: "TRUE"
      MAX_PLAYERS: 10
      DIFFICULTY: "hard"
      ONLINE_MODE: "false"
      MOTD: "Welcome to Stas MC Server!"
    volumes:
      - ./data:/data
```

启动容器：

```sh
docker-compose up -d
```
