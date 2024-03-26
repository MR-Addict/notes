# 使用 Transmission

本教程介绍如何在 **Ubuntu** 系统上安装和使用 **Transmission** 客户端。

## 一、安装 Transmission

更新源：

```sh
sudo apt update
```

使用下面的命令安装 Transmission：

```sh
sudo apt install transmission-daemon -y
```

## 二、配置 Transmission

修改配置前我们需要先停止 Transmission 服务：

```sh
sudo systemctl stop transmission-daemon
```

然后打开配置文件：

```sh
sudo vim /etc/transmission-daemon/settings.json
```

我们可以修改下面几个配置：

- `rpc-username`：用户名
- `rpc-password`：密码，当 Transmission 重新启动时会将其加密
- `rpc-whitelist-enabled`：是否启用白名单，我建议直接关闭

修改缓存大小：

```sh
sudo vim /etc/sysctl.conf
```

在文件末尾添加：

```sh
net.core.rmem_max = 16777216
net.core.wmem_max = 4194304
```

然后重新启动 Transmission 服务：

```sh
sudo systemctl start transmission-daemon
```

## 三、使用 Transmission

默认 Transmission 的 Web 界面端口是 **9091**，我们可以通过浏览器访问 `http://localhost:9091` 来使用。
