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
wg genkey | tee privatekey | wg pubkey > publickey
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

## 三、配置客户端

### 配置公钥和私钥

在客户端创建一对公钥和私钥：

```bash
wg genkey | tee privatekey | wg pubkey > publickey
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
SaveConfig = true

[Peer]
PublicKey = server_public_key
Endpoint = server_ip:51820
AllowedIPs = 10.0.0.0/24
PersistentKeepalive = 30
```

## 四、向服务器添加客户端的公钥

获得客户端的公钥：

```bash
cat publickey
```

添加到客户端当中：

```bash
sudo wg set wg0 peer client_public_key allowed-ips 10.0.0.2
````

你也可以直接在服务端的配置文件中添加`Peer`。

## 五、允许服务端端口转发

输入以下命令查看你的ipv4是否允许转发：

```bash
cat /proc/sys/net/ipv4/ip_forward
```

如果不是1，输入以下命令允许转发：

```bash
sudo sysctl -w net.ipv4.ip_forward=1
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
