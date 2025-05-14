# 使用 Homebrew

[Homebrew](https://brew.sh) 是 macOS 上的软件包管理器，可以帮助你安装和管理软件包。它是一个非常强大的工具，可以帮助你快速安装软件包，而不需要手动下载和安装。

## 一、安装 xcode-select

在安装 Homebrew 之前，你需要安装 `xcode-select`，它是 macOS 上的一个命令行工具，可以帮助你安装开发工具，如 git、make、gcc 等。

```sh
xcode-select --install
```

## 二、安装 Homebrew

安装 Homebrew 非常简单，只需要在终端中运行以下命令即可：

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 三、配置 Homebrew

安装完成后，你需要配置 Homebrew，以便它可以正常工作。首先，你需要将 Homebrew 的路径添加到你的 `PATH` 环境变量中，正常情况下，如果你是使用 `zsh`，那么你可以将以下命令添加到你的 `~/.zshrc` 文件中：

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## 四、使用 Homebrew

检查 Homebrew 是否安装成功：

```sh
brew --version
```

检查系统是否正常：

```sh
brew doctor
```

更新 Homebrew：

```sh
brew update
```

升级 Homebrew：

```sh
brew upgrade
```

## 五、常用命令

**nvm**：

```sh
brew install nvm
```

**htop**：

```sh
brew install htop
```

**wget**：

```sh
brew install wget
```
