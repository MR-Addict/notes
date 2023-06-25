# 其他常用命令

更新包：

```sh
opkg update
```

查看系统信息：

```sh
cat /proc/cpuinfo
```

查看已连接的 WiFi 设备：

```sh
cat /tmp/dhcp.leases
```

查看主机 ip 地址：

```sh
ip r|grep 'default' | awk '{print $7}'
```

查看主机网关地址：

```sh
ip r|grep 'default' | awk '{print $3}'
```

删除某个进程：

```sh
kill $(ps|awk '/[m]qtt/{print $1}')
```
