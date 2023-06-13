# Liunx 的 Swap 空间

```admonish info
参考视频：[swap](https://www.youtube.com/watch?v=HSbBl31ohjE)
```

## 一、基本操作

查看运行内存和交换空间：

```sh
free
```

查看 swap 所在分区：

```sh
swapon
```

卸载 swap 分区：

```sh
swapoff $swap_location
```

删除 swap 分区：

```sh
sudo rm $swap_location
```

## 二、创建和挂载 swap 分区

创建空文件：

```sh
sudo dd if=/dev/zero of=/swap bs=1M count=2048 status=progress
```

给予权限：

```sh
sudo chmod 600 /swap
```

格式化 swap 分区：

```sh
sudo mkswap /swap
```

挂载 swap 分区：

```sh
sudo swapon /swap
```

持久化分区：

```sh
sudo vim /etc/fstab
```

末尾添加以下内容：

```
/swap none swap sw 0 0
```
