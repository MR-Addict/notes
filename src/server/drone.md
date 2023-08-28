# 使用 Drone CI 服务器

Drone CI 是一个基于 go 的 CI 工具，配合 Github 或者 Gitlab 等可以实现方便的持续部署。

## 一、配置 Docker 容器

### 部署 Server

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
      - DRONE_GITHUB_CLIENT_ID=github_client_id
      - DRONE_GITHUB_CLIENT_SECRET=github_client_secret
    volumes:
      - ./data:/data
```

启动容器：

```sh
docker-compose up -d
```

### 部署 Runner

#### 1. Docker Runner

```yaml
version: "3"
services:
  drone-runner-docker:
    image: drone/drone-runner-docker
    restart: unless-stopped
    environment:
      - DRONE_RPC_PROTO=https
      - DRONE_RPC_HOST=drone.mraddict.top
      - DRONE_RPC_SECRET=e0c4fab16337ae0c7faa3706379ccac9
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

启动容器：

```sh
docker-compose up -d
```

#### 2. SSH Runner

```yaml
version: "3"
services:
  drone-runner-ssh:
    image: drone/drone-runner-ssh
    restart: unless-stopped
    environment:
      - DRONE_RPC_PROTO=https
      - DRONE_RPC_HOST=drone.mraddict.top
      - DRONE_RPC_SECRET=e0c4fab16337ae0c7faa3706379ccac9
```

启动容器：

```sh
docker-compose up -d
```

#### 3. Exec Runner

安装 runner：

```sh
curl -L https://github.com/drone-runners/drone-runner-exec/releases/latest/download/drone_runner_exec_linux_amd64.tar.gz | tar zx
sudo install -t /usr/local/bin drone-runner-exec
```

添加配置文件：

```sh
sudo vim /etc/drone-runner-exec/config
```

配置文件内容：

```
DRONE_RPC_PROTO=https
DRONE_RPC_HOST=drone.mraddict.top
DRONE_RPC_SECRET=e0c4fab16337ae0c7faa3706379ccac9
```

安装自启服务：

```sh
sudo drone-runner-exec service install --config="/home/ubuntu/projects/drone/client/config"
```

启动服务：

```sh
sudo drone-runner-exec service start
```

关闭服务：

```sh
sudo drone-runner-exec service stop
```

卸载自启服务：

```sh
sudo drone-runner-exec service uninstall
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
