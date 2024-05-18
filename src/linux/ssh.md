# 使用 SSH

## 一、通过 Puttygen 使用 SSH

直接参考以下文章即可，这里不做详细介绍了：

> 参考文章：🎉
>
> [How to generate public and private ssh key using putty](https://docs.oracle.com/en/cloud/paas/goldengate-cloud/tutorial-change-private-key-format/)

## 二、使用 ssh-keygen 配置 SSH 密钥

生成密钥，一路回车选择默认选项就好了：

```sh
ssh-keygen -t rsa -b 2048 -f piserver -C "piserver"
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

```sh
Host piserver
     HostName 192.168.10.30
     Port 22
     User cael
     IdentityFile ~/Documents/cael/ssh/piserver/piserver
```

## 三、使用 scp 复制文件

从服务器复制文件，服务器路径为`/home/cael/projects/hello.py`，客户端路径为当前路径：

```sh
scp cael@192.168.10.30:projects/hello.py .
```

向客户端传输文件，服务器路径为`/home/cael/projects`，客户端路径为当前路径：

```sh
scp hello.py cael@192.168.10.30:projects
```

复制整个文件夹到服务器，服务器路径为`/home/cael/pictures`，客户端路径为当前路径：

```sh
scp -r Images cael@192.168.10.30:pictures
```
