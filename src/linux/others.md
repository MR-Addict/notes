# 其他配置及常用命令

查看系统 CPU：

```sh
htop
```

查看系统存储空间：

```sh
df -h
```

查看系统进程：

```sh
ps -A
```

结束某个进程：

```sh
kill $id
```

安装字体：

```sh
sudo fc-cache -fv
```

更新树莓派 eeprom：

```sh
sudo rpi-eeprom-update -a
```

查看树莓派温度：

```sh
vcgencmd measure_temp
```

使用 pip-review 更新 pip

```sh
pip-review --interactive
```

安静启动 Telegram

```sh
Telegram --startintray
```

解压 tar 压缩包：

```sh
tar -xvf your/tar/gz/file
```

设置默认编辑器：

```sh
sudo update-alternatives --config editor
```

查看系统内部端口使用情况：

```sh
netstat --tcp --listening --programs --numeric
```

配置 WiFi：

```sh
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf
```

设置用户默认 shell：

```sh
sudo usermod --shell /bin/sh $USER
```

sh 脚本出现^M 错误：

```sh
sed -i 's/\r//' $yourfile
```

使用 python 运行 http 服务：

```sh
python -m http.server 8080 --directory public
```
