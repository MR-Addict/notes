# Pyenv

## 一、安装 pyenv

首先你需要安装 [brew](./homebrew.md)，然后执行以下命令安装 pyenv：

```sh
brew install pyenv
```

## 二、配置环境变量

在`~/.zprofile`或`~/.zshrc`中添加以下内容：

```sh
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
```

## 三、使用 pyenv

关于如何使用 pyenv，请参考[Windows/使用 Pyenv](../windows/pyenv.md) 。
