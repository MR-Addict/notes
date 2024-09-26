# Wlan 操作

显示所有WiFi接口：

```batch
netsh wlan show interfaces
```

查看WiFi信息：

```batch 
netsh wlan show profiles
```

连接WiFi网络：

```batch
netsh wlan connect name=WiFiname [ssid=WiFiName]
```

断开网络连接：

```batch
netsh wlan disconnect
```

更新网络WiFi信息：

```batch
netsh wlan set profileparameter name=[WiFiName] connectionmode=manual[auto]
```