# 使用Docker

```admonish info
官方文档：[docker](https://docs.docker.com/engine/install/ubuntu/)
```

## 一、安装Docker

安装前建议先卸载旧版本的Docker：

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

### 方法一：偷懒式安装Docker

```bash
sudo apt install docker.io
```

### 方法二：将Docker添加到apt源中再安装

更新apt并且安装相关依赖：

```bash
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release
```

添加Docker的GPG密钥：

```bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

添加Docker源地址：

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

安装Docker：

```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

添加当前用户到docker用户组：

```bash
sudo usermod -aG docker $(whoami)
```

## 二、安装Docker-Compose

前往GitHub下载对应的[Docker-Compose](https://github.com/docker/compose/releases)

```bash
wget https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo chmod u+x /usr/local/bin/docker-compose
```

## 三、配置Docker

### 配置log

进入Docker配置文件：

```bash
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

```bash
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

```bash
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

## 四、Docker-Compose模板

### nginx容器模板

```yml
version: '3'
services:
  notes:
    image: nginx:latest
    container_name: notes
    restart: unless-stopped
    ports:
      - 80:80
    volumes:
      - /home/ubuntu/Projects/Notes/book:/usr/share/nginx/html
      - /home/ubuntu/Projects/Notes/docker/certs:/etc/nginx/certs
      - /home/ubuntu/Projects/Notes/docker/conf.d:/etc/nginx/conf.d
```

### wg-easy模板

```yml
version: "3"
services:
  wg-easy:
    environment:
      - WG_HOST=[change-this]
      - PASSWORD=[change-this]
      - WG_DEFAULT_DNS=1.1.1.1
      - WG_MTU=1420

    image: weejewel/wg-easy
    container_name: wg-easy
    volumes:
      - ./data:/etc/wireguard
    ports:
      - 51820:51820/udp
      - 51821:51821/tcp
    restart: unless-stopped
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    sysctls:
      - net.ipv4.ip_forward=1
      - net.ipv4.conf.all.src_valid_mark=1
```

### Nextcloud模板

```yml
version: "3"

services:
  nextcloud:
    container_name: nextcloud-app
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
    container_name: nextcloud-db
    restart: unless-stopped
    environment:
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=nextcloud
      - MYSQL_ROOT_PASSWORD=nextcloud
    volumes:
      - ./db:/var/lib/mysql
```

### Adguard模板

```yml
version: '2'
services:
  adguard:
    image: adguard/adguardhome
    container_name: adguard
    restart: unless-stopped
    ports:
      - 53:53/tcp
      - 53:53/udp
      - 3000:3000/tcp
    volumes:
      - /home/cael/projects/adguard/data/work:/opt/adguardhome/work
      - /home/cael/projects/adguard/data/conf:/opt/adguardhome/conf
```

### VSCode模板

```yml
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

### Home Assistant

```yml
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

## 五、编译推送镜像

登录dockerhub，输入token：

```bash
docker login -u <dockrhub_username>
```

### 初次编译

编译镜像：

```bash
docker build -t <dockerhub_username>/<dockerhub_repo_name> .
```

推送镜像：

```bash
docker push <dockerhub_username>/<dockerhub_repo_name>
```

### 推送已有镜像

提交变更：

```bash
docker commit <existing_image> <dockerhub_username>/<dockerhub_repo_name>
```

推送镜像：

```bash
docker push <dockerhub_username>/<dockerhub_repo_name>
```

## 六、Docker的镜像操作

拉取镜像：

```bash
docker pull ubuntu
```

显示已有镜像：

```bash
docker images
```

删除镜像：

```bash
docker rmi ubuntu
```

删除无用镜像：

```bash
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
```

删除所有无用的镜像、容器、网络和存储器：

```bash
docker system prune -a
```

## 七、Docker的容器操作

显示正在运行的容器：

```bash
docker ps
```

显示所有容器：

```bash
docker ps -a
```

停止正在运行的容器：

```bash
docker stop ubuntu
```

重启某个容器：

```bash
docker restart ubuntu
```

从镜像运行容器：

```bash
docker run ubuntu
```

后台运行某个容器：

```bash
docker run -d ubuntu
```

运行某个版本的容器：

```bash
docker run -d ubuntu:18
```

运行结束后自动删除容器：

```bash
docker run -d -rm ubuntu
```

运行可交互容器：

```bash
docker run -it ubuntu
```

端口映射：

```bash
docker run -d -p 80:8080 ubuntu
```

文件映射：

```bash
docker run -d -v /opt/mydata:/var/lib/mysql ubuntu
```

docker-compose运行容器：

```bash
docker-compose up -d
```

docker-compose删除容器：

```bash
docker-compose down
```

删除容器：

```bash
docker rm $container-name-or-id
```

删除所有容器：

```bash
docker rm $(docker ps --filter status=exited -q)
```
