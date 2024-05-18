# Systemd 使用方法

> 参考文档 📝
>
> [systemd](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)

## 一、常用命令

start 启动服务：

```sh
sudo systemctl start application.service
```

stop 停止服务：

```sh
sudo systemctl stop application.service
```

restart 重启服务：

```sh
sudo systemctl restart application.service
```

reload 重新加载配置文件，如果你的服务支持该操作的话，如 **nginx**：

```sh
sudo systemctl reload application.service
```

如果你不确定你的服务是否支持重加载，那么可以使用 **reload-or-restart** 命令，systemd 会首先 reload，如果该服务器不支持 reload 则 restart：

```sh
sudo systemctl reload-or-restart application.service
```

status 用于检查当前的服务状态，包括服务器日志等：

```sh
sudo systemctl status application.service
```

enable 用于在机器启动时自动启动该服务器：

```sh
sudo systemctl enable application.service
```

disable 可以让服务在开机时停止自动启动：

```sh
sudo systemctl disable application.service
```

is-active 用于查询服务器是否启动：

```sh
systemctl is-active application.service
```

is-enable 用于查询服务是否开机自启：

```sh
systemctl is-enabled application.service
```

is-failed 用于查询服务是否启动失败：

```sh
systemctl is-failed application.service
```

> 注：
> systemd 可以自动检测服务的文件地址，因此可以省略上面的`.service`后缀，下同

## 二、系统服务

显示启动的服务：

```sh
systemctl list-units
```

显示所有的服务：

```sh
systemctl list-units --all
```

服务筛选，如仅显示未启动的服务：

```sh
systemctl list-units --all --state=inactive
```

## 三、服务配置

显示某服务的配置文件内容：

```sh
systemctl cat application.service
```

显示某服务的依赖：

```sh
systemctl list-dependencies application.service
```

修改某服务：

```sh
sudo systemctl edit --full application.service
```

新建某服务：

```sh
sudo systemctl edit --full --force application.service
```

删除某服务：

```sh
sudo rm /etc/systemd/system/application.service
sudo rm -r /etc/systemd/system/application.service.d
```

重启 systemd：

```sh
sudo systemctl daemon-reload
```

## 四、新建服务

新建某服务：

```sh
sudo systemctl edit --full --force application.service
```

服务模板：

```ini
[Unit]
After=network.target
Description=description
StartLimitBurst=5
StartLimitIntervalSec=100

[Service]
Type=simple
User=user_name
Restart=always
RestartSec=1
ExecStart=/path/to/app

[Install]
WantedBy=multi-user.target
```
