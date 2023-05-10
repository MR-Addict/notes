# 其他配置及常用命令

查看系统 CPU：

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

更新树莓派 eeprom：

```bash
sudo rpi-eeprom-update -a
```

查看树莓派温度：

```bash
vcgencmd measure_temp
```

使用 pip-review 更新 pip

```bash
pip-review --interactive
```

安静启动 Telegram

```bash
Telegram --startintray
```

解压 tar 压缩包：

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

配置 WiFi：

```bash
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
```

设置用户默认 shell：

```bash
sudo usermod --shell /bin/bash $USER
```

bash 脚本出现^M 错误：

```bash
sed -i 's/\r//' $yourfile
```

使用 python 运行 http 服务：

```bash
python -m http.server 8080 --directory public
```
