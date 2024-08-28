# 使用 NVM

## 一、安装 NVM

前往 Github 下载最新的[NVM](https://github.com/coreybutler/nvm-windows)

也可以通过 Winget 安装 NVM：

```sh
winget install --id CoreyButler.NVMforWindows
```

## 二、使用 NVM

**查看可用的 Node**

```sh
# 查看已安装的Node
nvm list installed
# 查看可用的Node
nvm list available
```

**安装 Node**

```sh
# 安装最新版本的Node
nvm install latest
# 安装指定版本的Node
nvm install 18.20.4
```

**切换 Node 版本**

```sh
# 切换到最新版本的Node
nvm use latest
# 切换到指定版本的Node
nvm use 18.20.4
```

**卸载 Node**

```sh
# 卸载指定版本的Node
nvm uninstall 18.20.4
```
