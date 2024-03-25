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
