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

安装字体：

```bash
sudo fc-cache -fv
```

更新树莓派eeprom：

```bash
sudo rpi-eeprom-update -a
```

查看树莓派温度：

```bash
vcgencmd measure_temp
```

使用pip-review更新pip

```bash
pip-review --interactive
```

安静启动Telegram

```bash
Telegram --startintray
```

解压tar压缩包：

```bash
tar -xvf your/tar/gz/file
```

设置默认编辑器：

```bash
sudo update-alternatives --config editor
```

查看系统内部端口使用情况：

```bash
netstat --tcp --listening --programs --numeric
```

配置WiFi：

```bash
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
```

设置用户默认shell：

```bash
sudo usermod --shell /bin/bash $USER
```

bash脚本出现^M错误：

```bash
sed -i 's/\r//' $yourfile
cat -e $yourfile
```
