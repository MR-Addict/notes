# 使用 Powershell

## 一、安装 Powershell

前往 Github 下载最新版本的[Powershell](https://github.com/PowerShell/PowerShell)。

也可以通过 Winget 安装 Powershell：

```sh
winget install --id Microsoft.PowerShell
```

## 二、配置 Powershell

### 1. 允许运行脚本

使用管理员权限打开 Powershell，输入以下命令：

```sh
Set-ExecutionPolicy RemoteSigned
```

### 2. 添加 Powershell 配置文件

进入配置文件：

```sh
vim $PROFILE
```

添加以下内容：

```ps1
# Function
function la_fun { Get-ChildItem -Force }
function git_clean_fun { git restore . ; git clean -f }
function docker_clean_fun { docker system prune -a -f }

# Set Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name la -Value la_fun
Set-Alias -Name htop -Value ntop
Set-Alias -Name ifconfig -Value ipconfig
Set-Alias -Name git-clean -Value git_clean_fun
Set-Alias -Name docker-clean -Value docker_clean_fun

# Oh-My-Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression

# Enviroments
$env:TF_ENABLE_ONEDNN_OPTS=0
$env:TF_CPP_MIN_LOG_LEVEL=1
```

## 三、使用 Powershell：

在终端中输入以下命令启动 powershell：

```sh
pwsh
```
