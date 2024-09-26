# 用户输入

例子：

```bash
echo -n "Input your favourite fruit:"
read fruit
echo "Your favourite fruit is $fruit"
```

将读取到的内容放在变量中：

```bash
read -p "Input your name:" name
echo "Your name is $name"
```

**-s** 参数用于隐藏输入：

```bash
read -s -p "Input your passwrod:" password
echo "Your password is $password"
```

**-a** 参数用于将输入保存到数组中：

```bash
echo -n "Input your hobbies:"
read -a hobbies
echo "Your hoddies are $hobbies"
```

在不指定变量的情况下，read 会将输入保存到 **REPLY** 变量中：

```bash
read -p "Input your age:"
echo "Your age is $REPLY"
```