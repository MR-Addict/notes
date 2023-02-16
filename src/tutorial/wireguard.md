# 使用Wireguard

```admonish info
参考视频：[wireguard](https://www.youtube.com/watch?v=bVKNSf1p1d0)
```

## 一、安装wireguard

```bash
sudo apt-get install wireguard -y
```

## 二、配置服务端

### 配置公钥和私钥

在服务器创建一对公钥和私钥：

```bash
wg genkey | tee private.key | wg pubkey > public.key
```

### 配置配置文件

进入配置文件：

```bash
sudo vim /etc/wireguard/wg0.conf
```

添加以下配置：

```
[Interface]
PrivateKey = your_private_key
Address = 10.0.0.1/24
ListenPort = 51820
SaveConfig = true
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT && iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
PublicKey = client_public_key
AllowedIPs = 10.0.0.2/32
```

```admonish warning
注意：请使用`ip route list table main default`命令将`eth0`更改为你的网卡

例如如果返回结果是：

> default via 172.18.224.1 dev `enp4s0` proto dhcp src 172.18.224.100 metric 100

则应该将eth0改为`enp4s0`
```

## 三、配置客户端

### 配置公钥和私钥

在客户端创建一对公钥和私钥：

```bash
wg genkey | tee private.key | wg pubkey > public.key
```

### 配置配置文件

进入配置文件：

```bash
sudo vim /etc/wireguard/wg0.conf
```

添加以下配置：

```
[Interface]
PrivateKey = client_private_key
Address = 10.0.0.2/24
DNS = 114.114.114.114, 223.5.5.5

[Peer]
PublicKey = server_public_key
Endpoint = server_ip:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 25
```

## 四、向服务器添加客户端的公钥

获得客户端的公钥：

```bash
cat publickey
```

添加到客户端当中：

```bash
sudo wg set wg0 peer client_public_key allowed-ips 10.0.0.2
```

你也可以直接在服务端的配置文件中添加`Peer`。

## 五、防火墙设置

### 允许端口转发

进入配置文件：

```bash
sudo vim /etc/sysctl.conf
```

取消注释以下内容：

```
net.ipv4.ip_forward=1
```

重启或者输入以下命令生效端口转发：

```bash
sudo sysctl -p
```

### 打开防火墙

输入以下命令查看防火墙是否启动：

```bash
sudo ufw status
```

如果防火墙已经启动，你可以输入以下命令开启防火墙：

```bash
ufw allow 51820/udp
```

```admonish warning
注意：如果你是在VPS上搭建wireguard，那么记得在你的服务商后台面板开启相应的`51820的UDP端口`
```

## 六、启动服务

在服务端和客户端都输入以下命令：

```bash
wg-quick up wg0
```

在客户端输入以下命令发送流量：

```bash
ping 10.0.0.1
```

然后在服务端输入以下命令查看流量：

```bash
sudo tcpdump -envi wg0
```

## 七、设置开机自启

```bash
sudo systemctl enable wg-quick@wg0
```

```bash
sudo systemctl start wg-quick@wg0
```

```bash
systemctl status wg-quick@wg0
```

```bash
sudo systemctl stop wg-quick@wg0
```

```bash
sudo systemctl disable wg-quick@wg0
```