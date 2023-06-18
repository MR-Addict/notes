# 使用 SSH

## 一、通过 Puttygen 使用 SSH

直接参考以下文章即可，这里不做详细介绍了：

```admonish info
参考文章：[How to generate public and private ssh key using putty](https://docs.oracle.com/en/cloud/paas/goldengate-cloud/tutorial-change-private-key-format/)
```

## 二、使用 ssh-keygen 配置 SSH 密钥

生成密钥，一路回车选择默认选项就好了：

```sh
ssh-keygen -t rsa -b 2048 -f piserver -C "piserver-ssh-key"
```

配置服务器，将公钥放到服务器上：

```sh
cat piserver.pub >> ~/.ssh/authorized_keys
```

配置连接端：

```sh
vim ~/.ssh/config
```

添加以下内容：

```
Host piserver
     HostName 192.168.137.120
     Port 22
     User pi
     IdentityFile ~/ssh-private-key/piserver
```

## 三、使用 scp 复制文件

从服务器复制文件，服务器路径为`/home/pi/Projects/hello.py`，客户端路径为当前路径：

```sh
scp pi@192.168.1.1:Projects/hello.py .
```

向客户端传输文件，服务器路径为`/home/pi/Projects`，客户端路径为当前路径：

```sh
scp hello.py pi@192.168.1.1:Projects
```

复制整个文件夹到服务器，服务器路径为`/home/pi/Pictures`，客户端路径为当前路径：

```sh
scp -r Images pi@192.168.1.3:Pictures
```
