# Liunx 的 Swap 空间

```admonish info
参考视频：[swap](https://www.youtube.com/watch?v=HSbBl31ohjE)
```

## 一、基本操作

查看运行内存和交换空间：

```bash
free
```

查看 swap 所在分区：

```bash
swapon
```

卸载 swap 分区：

```bash
swapoff $swap_location
```

删除 swap 分区：

```bash
sudo rm $swap_location
```

## 二、创建和挂载 swap 分区

创建空文件：

```bash
sudo dd if=/dev/zero of=/swap bs=1M count=2048 status=progress
```

给予权限：

```bash
sudo chmod 600 /swap
```

格式化 swap 分区：

```bash
sudo mkswap /swap
```

挂载 swap 分区：

```bash
sudo swapon /swap
```

持久化分区：

```bash
sudo vim /etc/fstab
```

末尾添加以下内容：

```
/swap none swap sw 0 0
```
