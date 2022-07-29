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

## 四、示例

运行nginx容器：

```bash
docker run --name notes -d --restart unless-stopped -p 80:80 -v /home/cael/Documents/Projects/Notes/book:/usr/share/nginx/html nginx
```

运行adguradhome容器：

```bash
docker run --name adguardhome -d --restart unless-stopped -p 5050:53 -p 3000:3000 -v /home/cael/Documents/Adguardhome/workdir:/opt/adguardhome/work -v /home/cael/Documents/Adguardhome/confdir:/opt/adguardhome/conf adguard/adguardhome
```

## 五、常用命令

下载镜像：

```bash
docker pull ubuntu
```

显示所有镜像：

```bash
docker images
```

显示正在运行的容器：

```bash
docker ps
```

显示所有容器：

```bash
docker ps -a
```

运行某容器：

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

停止正在运行的容器：

```bash
docker stop ubuntu
```

重启某个容器：

```bash
docker restart ubuntu
```

删除镜像：

```bash
docker rmi --force ubuntu
```

删除容器：

```bash
docker rm $container-name-or-id
```

删除所有容器：

```bash
docker rm $(docker ps --filter status=exited -q)
```
