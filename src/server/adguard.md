# 使用 Adguard 服务器

```admonish info
参考文档：[adguard](https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html)
```

## 一、释放服务器 53 端口

查看端口是否开放：

```bash
sudo lsof -i :53
```

进入配置 DNS 文件：

```bash
sudo vim /etc/systemd/resolved.conf
```

添加默认 DNS 为 1.1.1.1，同时弃用 DNS 监听端口：

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

## 二、搭建 Adguard

配置 docker-compose：

```yaml
version: "2"
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

启动 docker：

```bash
sudo docker-compose up -d
```

## 三、配置 Adguard

### 1. DNS

国外常用 DNS：

```
1.1.1.1
8.8.8.8
8.26.56.26
199.85.126.10
208.67.222.222
```

国内常用 DNS：

```
223.5.5.5
119.29.29.29
180.76.76.76
114.114.114.114
```

### 2. 广告过滤黑名单

#### 2.1 国内广告过滤黑名单

Anti-Ad 黑名单：

```
https://anti-ad.net/easylist.txt
https://anti-ad.net/adguard.txt
https://anti-ad.net/domains.txt
https://anti-ad.net/anti-ad-for-dnsmasq.conf
```

通用黑名单：

```
https://cdn.jsdelivr.net/gh/o0HalfLife0o/list@master/ad-pc.txt
https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-pc.txt
https://cdn.jsdelivr.net/gh/o0HalfLife0o/list@master/ad-mo.txt
https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad-mo.txt
https://cdn.jsdelivr.net/gh/o0HalfLife0o/list@master/ad.txt
https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad.txt
https://raw.githubusercontent.com/Goooler/1024_hosts/master/hosts
https://easylist-downloads.adblockplus.org/easylistchina.txt

```

#### 2.2 国外广告过滤黑名单

Easylist 黑名单：

```
https://easylist.to/easylist/easylist.txt
https://easylist.to/easylist/easyprivacy.txt
https://secure.fanboy.co.nz/fanboy-cookiemonster.txt
```

通用黑名单：

```
https://raw.githubusercontent.com/hl2guide/All-in-One-Customized-Adblock-List/master/aio.txt
https://adaway.org/hosts.txt
https://v.firebog.net/hosts/AdguardDNS.txt
https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt
```
