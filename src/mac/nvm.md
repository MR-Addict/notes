# 使用 NVM

## 一、安装 NVM

使用 homebrew 安装 nvm：

```sh
brew install nvm
```

## 二、配置 NVM

在 `~/.zshrc` 或 `~/.bashrc` 中添加以下内容：

```sh
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
```

## 三、使用 NVM

关于如何使用 nvm，请参考 [Windows/使用 NVM](../windows/nvm.md)。
