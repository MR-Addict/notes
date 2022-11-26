# 搭建Home assistant服务器

## 一、配置Docker容器

使用以下**docker-compose.yaml**：

```yaml
version: "3"
services:
  home:
    image: ghcr.io/home-assistant/home-assistant:stable
    container_name: home
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - ./config:/config
    ports:
      - 8123:8123
    restart: unless-stopped
```

启动容器：

```bash
docker-compose up -d
```

## 二、修改配置文件

使用以下命令查看Gateway：

```bash
docker network inspect home_default|grep '"Gateway": '|awk -F"\"" '{print $4}'
```

然后进入配置文件：

```bash
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

```bash
docker-compose restart
```
