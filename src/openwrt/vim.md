# 使用 vim

## 一、安装 vim

```sh
opkg update
opkg install vim-full vim-runtime
```

## 二、配置 vim

进入配置文件

```sh
vim /usr/share/vim/vimrc
```

你可以覆盖添加以下内容或者自行配置已有功能：

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
