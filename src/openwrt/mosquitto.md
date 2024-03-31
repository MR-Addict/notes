# 使用 Mosquitto

## 一、安装 Mosquitto

进入 OpenWrt 控制台，执行以下命令：

```bash
opkg install mosquitto-ssl
```

安装完成后我们先关闭 Mosquitto 服务，因为我们需要修改配置文件：

```bash
/etc/init.d/mosquitto stop
```

## 二、配置 Mosquitto

修改配置文件：

```bash
vim /etc/mosquitto/mosquitto.conf
```

配置文件的位置可能有所不同，你可以打开 `/etc/init.d/mosquitto` 查看配置文件的位置，如：

```conf
#!/bin/sh /etc/rc.common
# Basic init script for mosquitto
# April 2012, OpenWrt.org
# Provides support for the luci-app-mosquitto package, if installed

START=80
USE_PROCD=1
TCONF=/tmp/mosquitto.generated.conf
CONF_WATCH=/etc/mosquitto/mosquitto.conf
```

然后清空配置文件，添加以下内容：

```text
listener 1883 0.0.0.0

persistence true

log_type debug
log_dest file /etc/mosquitto/data/mosquitto.log

allow_anonymous false
password_file /etc/mosquitto/data/passwords.txt
```

可以发现，我们在配置文件中指定了密码文件和日志的位置。

我们先创建一个 **data** 目录：

```bash
mkdir -p /etc/mosquitto/data
```

使用以下命令创建密码文件，根据提示输入密码即可：

```bash
mosquitto_passwd -c /etc/mosquitto/data/passwords.txt username
```

然后再使用以下命令创建一个空的日志文件：

```bash
touch /etc/mosquitto/data/mosquitto.log
```

最后给予密码文件和日志文件写入权限：

```bash
chmod 777 /etc/mosquitto/data/passwords.txt
chmod 777 /etc/mosquitto/data/mosquitto.log
```

## 三、启动 Mosquitto

启动 Mosquitto 服务：

```bash
/etc/init.d/mosquitto start
```

## 四、测试 Mosquitto

我们可以使用 MQTT 客户端测试 Mosquitto 服务是否正常运行，这里我已 ubuntu 为例。

安装 MQTT 客户端：

```bash
sudo apt install mosquitto-clients
```

订阅主题：

```bash
mosquitto_sub -h 192.168.10.1 -t test -u username -P password
```

发布消息：

```bash
mosquitto_pub -h 192.168.10.1 -t test -u username -P password -m "Hello, World!"
```
