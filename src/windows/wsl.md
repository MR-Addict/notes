# 使用 WSL

## 一、卸载和安装

查看 WSL 信息：

```sh
wsl --status
```

查看已安装的 WSL 发行版：

```sh
wsl --list --verbose
```

查看可使用的 WSL 发行版：

```sh
wsl --list --online
```

安装某个 WSL 发行版：

```sh
wsl --install Ubuntu
```

卸载某个 WSL 发行版：

```sh
wsl --unregister Ubuntu
```

启动某个 WSL 发行版：

```sh
wsl -d Ubuntu
```

停止某个 WSL 发行版：

```sh
wsl --terminate Ubuntu
```

重启某个 WSL 发行版：

```sh
wsl --shutdown Ubuntu
```

停止所有 WSL 发行版：

```sh
wsl --shutdown
```

设置默认的 WSL 发行版：

```sh
wsl --set-default Ubuntu
```

## 二、文件系统

WSL 与 Windows 共享文件系统，可以通过 `\\wsl$` 访问 WSL 文件系统。

查看 WSL 文件系统：

```sh
explorer.exe \\wsl$
```

在 WSL 中访问 Windows 文件系统：

```sh
cd /mnt/c
```

在 Windows 中访问 WSL 文件系统：

```sh
cd \\wsl$\Ubuntu
```

## 三、WSL 与 Windows 交互

在 WSL 中执行 Windows 命令：

```sh
cmd.exe /c echo hello
```

在 WSL 中启动 Windows 程序：

```sh
explorer.exe .
```

在 Windows 中执行 WSL 命令：

```sh
ls | wsl grep .md
```

## 四、WSL 配置文件

> 官方文档 📝
>
> [WSL Configuration](https://learn.microsoft.com/en-us/windows/wsl/wsl-config)

某个 WSL 发行版的配置文件：

```sh
vim /etc/wsl.conf
```

参考配置：

```conf
[boot]
systemd=true
command = service nginx start

[automount]
enabled = true
```

全局 WSL 配置文件：

```sh
notepad ~/.wslconfig
```

参考配置：

```conf
[wsl2]
memory=4GB
firewall=true
autoProxy=true
dnsTunneling=true
networkingMode=mirrored
```

## 五、备份和恢复

备份 WSL 发行版：

```sh
wsl --export Ubuntu ubuntu.tar
```

恢复 WSL 发行版：

```sh
wsl --import Ubuntu ubuntu.tar
```
