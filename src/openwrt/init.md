# 使用 Init

> 官方文档 📝:
>
> [init](https://openwrt.org/docs/techref/initscripts)

## 一、配置 init 服务

进入配置文件：

```sh
vim /etc/init.d/your_service
```

添加服务内容：

```
#!/bin/sh /etc/rc.common

START=99
STOP=10

# commands to launch application
start() {
    echo start
}

# commands to kill application
stop() {
    ps | awk '/[y]our_service/{print $1}'
}

# start application after boot
boot() {
    start
}
```

给予执行权限：

```sh
chmod u+x /etc/init.d/your_service
```

## 二、使用 init 服务

运行脚本：

```sh
/etc/init.d/your_service start
```

开机自启任务：

```sh
/etc/init.d/your_service enable
```

关闭开机自启：

```sh
/etc/init.d/your_service disable
```
