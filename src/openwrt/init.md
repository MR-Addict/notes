# 使用init

```admonish info
官方文档：[init](https://openwrt.org/docs/techref/initscripts)
```

## 一、配置init服务

进入配置文件：

```bash
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
    echo stop
}

# start application after boot
boot() {
    start
}
```

给予执行权限：

```bash
chmod u+x /etc/init.d/your_service
```

## 二、使用init服务

运行脚本：

```bash
/etc/init.d/your_service start
```

开机自启任务：

```bash
/etc/init.d/your_service enable
```

关闭开机自启：

```bash
/etc/init.d/your_service disable
```
