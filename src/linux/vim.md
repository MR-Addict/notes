# 使用 Vim

## 一、安装 Vim

```sh
sudo apt-get install vim -y
```

## 二、配置 Vim

进入 vim 配置文件：

```sh
vim ~/.vimrc
```

添加以下内容：

```sh
syntax on

set number
set relativenumber
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartcase
set incsearch
set nobackup
set undodir=~/.vim/undodir
set undofile
set backspace=indent,eol,start
set smartindent

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
```

> 注意 💥
>
> 本配置只在当前用户下有效，如果你想在 root 也有效需要重新配置

## 三、使用 vim

### 命令类

---

强制退出：

```sh
q!
```

退出并保存：

```sh
qw
```

执行命令：

```sh
!echo hello
```

### 编辑类

---

在前方插入：

```sh
i
```

在最前端插入：

```sh
[shift]+i
```

在后方插入：

```sh
a
```

在最后端插入：

```sh
[shift]+a
```

在下方插入：

```sh
o
```

在上方插入：

```sh
[shift]+o
```

### 快捷键类

---

删除：

```sh
v+d
```

复制：

```sh
v+y
```

粘贴：

```sh
p
```

搜索：

```sh
/[keyword]
# 搜索下一个
n
# 搜索上一个
N
```

替换：

```sh
:%s/name_1/name_2/g
```

清空整个文件：

```sh
:%d
```
