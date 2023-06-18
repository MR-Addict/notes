# 使用 Uhttp

```admonish info
官方文档：[uhttp](https://openwrt.org/docs/guide-user/services/webserver/uhttpd)
```

## 一、安装 uhttpd

```sh
opkg update
opkg install uhttpd
```

## 二、基本配置模板

进入配置文件：

```sh
vim /etc/config/uhttpd
```

在已有模板后添加以下内容：

```
config uhttpd 'profile'
    option listen_http '8080'
    option home '/root/profile'
```

## 三、重启 uhttpd

```sh
/etc/init.d/uhttpd restart
```
