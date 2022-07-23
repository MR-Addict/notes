# 配置vim

## 一、安装vim

```bash
sudo apt-get install vim -y
```

## 二、配置vim

进入vim配置文件：

```bash
vim ~/.vimrc
```

添加以下内容：

```
syntax on

set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
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

```admonish warning
注意：本配置只在pi用户下有效，如果你想在root也有效需要重新配置
```

## 三、使用vim

### 命令类

---

强制退出：

```
q!
```

退出并保存：

```
qw
```

执行命令：

```
!echo hello
```

### 编辑类

---

在前方插入：

```
i
```

在最前端插入：

```
[shift]+i
```

在后方插入：

```
a
```

在最后端插入：

```
[shift]+a
```

在下方插入：

```
o
```

在上方插入：

```
[shift]+o
```

### 快捷键类

----

删除：

```
v+d
```

复制：

```
v+y
```

粘贴：

```
p
```
