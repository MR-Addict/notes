# 安装vim

## 一、安装vim

```bash
opkg update
opkg install vim-full vim-runtime
```

## 二、配置vim

进入配置文件

```bash
vim /usr/share/vim/vimrc
```

添加以下内容：

```
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
