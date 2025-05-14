# Terminal

## 一、Oh My Posh

> 官方文档 📝
>
> [oh-my-posh](https://ohmyposh.dev/docs/installation/macos)

在 `.zprofile` 中添加以下内容：

```sh
# Oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/amro.omp.json)"
```

更改 cache 位置，新建一个 `~/.cache` 目录，oh-my-ppsh 会在这个目录下缓存一些文件：

```sh
mkdir ~/.cache
```

## 二、ZSH 自动补全

> 官方文档 📝
>
> [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

安装 zsh-autosuggestions：

```bash
brew install zsh-autosuggestions
```

然后在`~/.zprofile`或`~/.zshrc`中添加以下内容：

```bash
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
```

## 三、ZSH 高亮

> 官方文档 📝
>
> [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

安装 zsh-syntax-highlighting：

```bash
brew install zsh-syntax-highlighting
```

然后在`~/.zprofile`或`~/.zshrc`中添加以下内容：

```bash
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```
