# 使用Adguard

## 一、释放服务器53端口

```admonish info
参考文档：[adguard](https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html)
```

查看端口是否开放：

```bash
sudo lsof -i :53
```

进入配置DNS文件：

```bash
sudo vim /etc/systemd/resolved.conf
```

添加默认DNS为1.1.1.1，同时弃用DNS监听端口：

```
[Resolve]
DNS=1.1.1.1
#FallbackDNS=
#Domains=
#LLMNR=no
#MulticastDNS=no
#DNSSEC=no
#DNSOverTLS=no
#Cache=no-negative
DNSStubListener=no
#ReadEtcHosts=yes
```

创建链接：

```bash
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

## 二、搭建Adguard

配置docker-compose：

```
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

启动docker：

```bash
sudo docker-compose up -d
```
