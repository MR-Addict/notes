# 使用uhttp

```admonish info
官方文档：[uhttp](https://openwrt.org/docs/guide-user/services/webserver/uhttpd)
```

## 一、安装uhttpd

```bash
opkg update
opkg install uhttpd
```

## 二、基本配置模板

进入配置文件：

```bash
vim /etc/config/uhttpd
```

添加以下内容：

```
config uhttpd 'main'
    option listen_http '8080'
    option home '/root/public'
```

## 三、重启uhttpd

```bash
/etc/init.d/uhttpd restart
```
