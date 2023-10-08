# 使用 Docker

```admonish info
官方文档：[docker](https://docs.docker.com/engine/install/ubuntu/)
```

## 一、安装 Docker

安装前建议先卸载旧版本的 Docker：

```sh
sudo apt-get remove docker docker-engine docker.io containerd runc
```

### 方法一：偷懒式安装 Docker

```sh
sudo apt install docker.io
```

### 方法二：将 Docker 添加到 apt 源中再安装

更新 apt 并且安装相关依赖：

```sh
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
```

添加 Docker 的 GPG 密钥：

```sh
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

添加 Docker 源地址：

```sh
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

安装 Docker：

```sh
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

添加当前用户到 docker 用户组：

```sh
sudo usermod -aG docker $(whoami)
```

## 二、安装 Docker-Compose

前往 GitHub 下载对应的[Docker-Compose](https://github.com/docker/compose/releases)

```sh
wget https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo chmod u+x /usr/local/bin/docker-compose
```

## 三、配置 Docker

### 配置 log

进入 Docker 配置文件：

```sh
sudo vim /etc/docker/daemon.json
```

添加以下内容：

```
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```

### 服务器配置代理

进入配置文件：

```sh
sudo systemctl edit docker.service
```

添加以下内容：

```
[Service]
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"
Environment="NO_PROXY=localhost,127.0.0.1"
```

### 容器配置代理

进入配置文件：

```sh
vim ~/.docker/config.json
```

添加以下内容：

```
{
 "proxies":
 {
   "default":
   {
     "httpProxy": "http://192.168.10.4:7890",
     "httpsProxy": "http://192.168.10.4:7890",
     "noProxy": "localhost,127.0.0.1"
   }
 }
}
```

## 四、编译推送镜像

登录 dockerhub，输入 token：

```sh
docker login -u <dockrhub_username>
```

### 初次编译

编译镜像：

```sh
docker build -t <dockerhub_username>/<dockerhub_repo_name> .
```

推送镜像：

```sh
docker push <dockerhub_username>/<dockerhub_repo_name>
```

### 推送已有镜像

提交变更：

```sh
docker commit <existing_image> <dockerhub_username>/<dockerhub_repo_name>
```

推送镜像：

```sh
docker push <dockerhub_username>/<dockerhub_repo_name>
```

## 五、Docker 的镜像操作

拉取镜像：

```sh
docker pull ubuntu
```

显示已有镜像：

```sh
docker images
```

删除镜像：

```sh
docker rmi ubuntu
```

删除无用镜像：

```sh
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

删除所有无用的镜像、容器、网络和存储器：

```sh
docker system prune -a
```

## 六、Docker 的容器操作

显示正在运行的容器：

```sh
docker ps
```

显示所有容器：

```sh
docker ps -a
```

停止正在运行的容器：

```sh
docker stop ubuntu
```

重启某个容器：

```sh
docker restart ubuntu
```

从镜像运行容器：

```sh
docker run ubuntu
```

后台运行某个容器：

```sh
docker run -d ubuntu
```

运行某个版本的容器：

```sh
docker run -d ubuntu:18
```

运行结束后自动删除容器：

```sh
docker run -d -rm ubuntu
```

运行可交互容器：

```sh
docker run -it ubuntu
```

端口映射：

```sh
docker run -d -p 80:8080 ubuntu
```

文件映射：

```sh
docker run -d -v /opt/mydata:/var/lib/mysql ubuntu
```

docker-compose 运行容器：

```sh
docker-compose up -d
```

docker-compose 删除容器：

```sh
docker-compose down
```

删除容器：

```sh
docker rm $container-name-or-id
```

删除所有容器：

```sh
docker rm $(docker ps --filter status=exited -q)
```

## 七、Docker-Compose 模板

### Nginx 容器模板

```yml
version: "3"
services:
  notes:
    image: nginx:latest
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - /home/ubuntu/Projects/Notes/book:/usr/share/nginx/html
      - /home/ubuntu/Projects/Notes/docker/certs:/etc/nginx/certs
      - /home/ubuntu/Projects/Notes/docker/conf.d:/etc/nginx/conf.d
```

### wg-easy 模板

```yml
version: "3"
services:
  wg-easy:
    restart: unless-stopped
    image: weejewel/wg-easy
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

### Nextcloud 模板

```yml
version: "3"

services:
  nextcloud:
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
    restart: unless-stopped
    environment:
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=nextcloud
      - MYSQL_ROOT_PASSWORD=nextcloud
    volumes:
      - ./db:/var/lib/mysql
```

### Adguard 模板

```yml
version: "3"
services:
  adguard:
    image: adguard/adguardhome
    restart: unless-stopped
    ports:
      - 53:53/tcp
      - 53:53/udp
      - 3000:3000/tcp
    volumes:
      - /home/cael/projects/adguard/data/work:/opt/adguardhome/work
      - /home/cael/projects/adguard/data/conf:/opt/adguardhome/conf
```

### VSCode 模板

```yml
version: "3"
services:
  ide:
    image: lscr.io/linuxserver/code-server:latest
    restart: unless-stopped
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

  http:
    image: nginx:latest
    restart: unless-stopped
    ports:
      - 5555:80
    volumes:
      - ./config/workspace:/usr/share/nginx/html
```

### Home Assistant

```yml
version: "3"
services:
  home:
    image: ghcr.io/home-assistant/home-assistant:stable
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - ./config:/config
    ports:
      - 8123:8123
    restart: unless-stopped
```
