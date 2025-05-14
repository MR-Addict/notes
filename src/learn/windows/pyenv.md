# 使用 Pyenv

## 一、安装 Pyenv

使用 Powershell 安装：

```sh
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
```

## 二、使用 Pyenv

**查看可用的 Python**

```sh
# 查看已安装的Python
pyenv global
# 查看可用的Python
pyenv install --list
```

**安装 Python**

```sh
pyenv install 3.12.0
```

**切换 Python 版本**

```sh
pyenv global 3.12.0
```

**卸载 Python**

```sh
pyenv uninstall 3.12.0
```
