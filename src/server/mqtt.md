# 搭建 MQTT 服务器

## 一、配置 Docker 容器

```yaml
version: "3"
services:
  mosquitto:
    image: eclipse-mosquitto
    container_name: mosquitto
    restart: unless-stopped
    volumes:
      - ./data/config:/mosquitto/config
      - ./data/log:/mosquitto/log
    ports:
      - 1883:1883
```

## 二、添加配置文件

注意，先不要启动 docker 容器，在当前文件夹下创建映射的文件夹：

```sh
mkdir -p data/config
```

然后添加配置文件：

```sh
sudo vim mosquitto.conf
```

然后添加以下内容：

```
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
listener 1883

#allow_anonymous false
#password_file /mosquitto/config/password.txt
```

然后启动 Docker 容器：

```sh
docker-compose up -d
```

## 三、添加用户

进入正在运行的容器：

```sh
docker exec -it mosquitto sh
```

创建一个用户：

```sh
mosquitto_passwd -c /mosquitto/config/password.txt cael
```

退出 Docker 容器：

```sh
exit
```

修改配置文件，将配置文件的最后两行取消注释：

```
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
listener 1883

allow_anonymous false
password_file /mosquitto/config/password.txt
```

最后重启容器：

```sh
docker-compose restart
```
