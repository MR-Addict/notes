# 搭建 Mongodb 数据库

## 一、配置 Docker 容器

配置容器：

```yaml
version: "3"

services:
  mongo:
    image: mongo
    restart: unless-stopped
    ports:
      - 27017:27017
    volumes:
      - ./data:/data/db
    environment:
      MONGO_INITDB_ROOT_USERNAME: your_username
      MONGO_INITDB_ROOT_PASSWORD: your_password
```

启动容器：

```sh
docker-compose up -d
```

## 二、如何使用

mongodb 的数据库地址一般如下：

```
mongodb://your_username:your_password@your_server_ip_or_domain:27017/
```

将对应内容的修改一下即可：

- your_username
- your_password
- your_server_ip_or_domain
