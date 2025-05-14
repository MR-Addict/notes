# cat 命令

**cat** 命令用于连接文件并打印到标准输出设备上：

```bash
echo "Hello world" > hello.txt
read -p "Enter your current emotions:"
echo $REPLY >> hello.txt
cat -e hello.txt # put $ at ther end of line
```

从标准输入读取内容并写入文件：

```bash
echo -n "Enter current season, press CTR+D to finish input:"
cat > hello.txt
cat -e hello.txt # put $ at ther end of line
```

将两个文件合并到一个文件：

```bash
cat file1.txt file2.txt >> file3.txt
```
