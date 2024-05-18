# 使用 Oh-my-posh

> 官方文档 📝：
>
> [oh-my-posh](https://ohmyposh.dev/docs)

## 一、安装字体

首先你需要安装一个[Nerd 字体](https://github.com/ryanoasis/nerd-fonts/releases)才能正常显示 oh-my-posh，推荐安装[Hack 字体](https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/Hack.zip)。

树莓派需要先安装一个 font-manager，然后选择需要安装的字体就好了。

```sh
sudo apt install font-manager
```

## 二、安装 oh-my-posh

首先前往[oh-my-posh 官方](https://github.com/JanDeDobbeleer/oh-my-posh/releases)地址下载对应的版本，如果是 64 位机器就下载[posh-linux-amd64](https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64)。

```sh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
```

安装主题：

```sh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
sudo chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
```

## 三、配置终端

进入配置文件：

```sh
sudo vim ~/.vimrc
```

在最后添加以下内容：

```sh
eval "$(oh-my-posh --init --shell sh --config /home/cael/.poshthemes/paradox.omp.json)"
```

如果是 powershell，应该进入`$PROFILE`，然后添加以下内容：

```sh
oh-my-posh --init --shell pwsh --config /home/cael/.poshthemes/paradox.omp.json | Invoke-Expression
```

最后重新启动终端就可以正常使用了。
