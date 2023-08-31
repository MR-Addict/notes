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
      - TZ=Asia/Shanghai
      - DRONE_CRON_INTERVAL=1m
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

## 三、Drone CI 样例

```yaml
kind: pipeline
type: docker
name: default

clone:
  disable: true

steps:
  - name: ssh
    image: appleboy/drone-ssh
    settings:
      host:
        from_secret: ssh_host
      username:
        from_secret: ssh_username
      key:
        from_secret: ssh_key
      script:
        - cd /home/ubuntu/projects/punch
        - git pull
        - docker-compose down
        - docker rmi mraddict063/punch-next
        - docker build -t mraddict063/punch-next .
        - docker image prune -f --filter label=stage=builder
        - docker-compose up -d

trigger:
  branch:
    - main
  event:
    - push
    - cron
```

> 注意：
> 请谨慎允许 pull request 使用 CI，这样会容易暴露自己设置的 secret

## 四、如何使用 cron

用 drone 提供的 UI 设置定时任务只能设置几个基本的时段，非常不方便，更加灵活的方式是用直接调用 API。

下面是 curl 的示例，**DRONE_TOKEN** 可以在个人中心找到，把 **USER** 和 **REPO** 换成你自己的项目：

```sh
curl -X POST https://drone.example.com/api/repos/USER/REPO/cron \
-H "Authorization: Bearer DRONE_TOKEN" \
-H "Content-Type: application/json" \
--data '{"name": "default", "expr": "0 0 */10 * * *", "branch": "main" }'
```

> 注意：
>
> - 你需要修改时区保证时间的一致性，环境变量是 **TZ=Asia/Shanghai**
> - drone 默认的 cron 检查间隔是一小时，非常不准确，环境变量是 **DRONE_CRON_INTERVAL=1m**
> - drone 使用的 cron 表达式是 **6 位**的，包含秒，和常规 5 位的 linux 系统 cron 不太一样
