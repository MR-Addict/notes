# 使用 Oh-My-Posh

> 官方文档 📝
>
> [oh-my-posh](https://ohmyposh.dev/docs/installation/macos)

## 一、安装

通过 `homebrew` 安装 `oh-my-posh`：

```bash
brew install romkatv/powerlevel10k/oh-my-posh
```

## 二、配置

在 `.zprofile` 中添加以下内容：

```sh
# Oh-my-posh
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/amro.omp.json)"
```

更改 cache 位置，新建一个 `~/.cache` 目录，oh-my-ppsh 会在这个目录下缓存一些文件：

```sh
mkdir ~/.cache
```
