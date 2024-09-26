# 文件检测

检测文件是否存在：

```bash
echo -e "Enter the name of the file: \c"
read file_name

if [ -f $file_name ]
then
    echo "$file_name exists"
else
    echo "$file_name not exists"
fi
```

检测目录是否存在：

```bash
read -p "Enter a directory name:" dir_name

if [ -d $dir_name ]
then
    echo "Directory exists"
else
    echo "Directory not exists"
fi
```

检测文件是否为空：

```bash
read -p "Entry the name of an existing file:" file_name
if [ -s $file_name ]
then
    echo "File is not empty"
else
    echo "File is empty"
fi
```

检测文件是否可执行：

```bash
read -p "Entry the name of an existing file:" file_name
if [ -x $file_name ]
then
    echo "$file_name is executable"
else
    echo "$file_name is not executable"
fi
```
