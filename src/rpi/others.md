# 其他配置及常用命令

查看系统CPU：

```bash
htop
```

查看系统存储空间：

```bash
df -h
```

查看系统进程：

```bash
ps -A
```

结束某个进程：

```bash
kill $id
```

更新树莓派eeprom：

```bash
sudo rpi-eeprom-update -a
```

查看树莓派温度：

```bash
vcgencmd measure_temp
```

查看系统内部端口使用情况：

```bash
netstat --tcp --listening --programs --numeric
```

解压tar压缩包：

```bash
tar -xvf your/tar/gz/file
```

安装字体：

```bash
sudo fc-cache -fv
```

配置WiFi

```bash
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
```

使用pip-review更新pip

```bash
pip-review --interactive
```

安静启动Telegram

```bash
Telegram --startintray
```
