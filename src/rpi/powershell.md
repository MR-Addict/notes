# 使用 Powershell

> 官方文档 📝
>
> [Install PowerShell on Raspbian](https://docs.microsoft.com/en-us/powershell/scripting/install/install-raspbian?view=powershell-7.2)

## 一、安装 Powershell

32 位和 64 位系统的唯一的区别就是 32 位需要安装依赖，而 64 位不需要。

### 32 位操作系统

安装依赖：

```sh
sudo apt-get update
sudo apt-get install '^libssl1.0.[0-9]$' libunwind8 -y
```

下载解压文件，在我写此文档时 powershell 最新版本是 7.2.5，你可以前往官网下载更新的[版本](https://github.com/PowerShell/PowerShell/releases)：

```sh
wget https://github.com/PowerShell/PowerShell/releases/download/v7.2.5/powershell-7.2.5-linux-arm32.tar.gz
mkdir ~/Powershell
tar -xvf ./powershell-7.2.5-linux-arm32.tar.gz -C ~/Powershell
```

### 64 位操作系统

直接下载解压文件：

```sh
wget https://github.com/PowerShell/PowerShell/releases/download/v7.2.5/powershell-7.2.5-linux-arm64.tar.gz
mkdir ~/Powershell
tar -xvf ./powershell-7.2.5-linux-arm64.tar.gz -C ~/Powershell
```

## 二、配置 Powershell：

添加快捷设置：

```sh
sudo ~/Powershell/pwsh -command 'New-Item -ItemType SymbolicLink -Path "/usr/bin/pwsh" -Target "$PSHOME/pwsh" -Force'
```

进入配置文件：

```sh
sudo vim $PROFILE
```

添加以下内容：

```
# Function
function la_fun { Get-ChildItem -Force }
function git_clean_fun { git restore . && git clean -f }

# Set Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value Get-ChildItem
Set-Alias -Name la -Value la_fun
Set-Alias -Name htop -Value ntop
Set-Alias -Name git-clean -Value git_clean_fun

# Oh-My-Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/paradox.omp.json" | Invoke-Expression
```

## 三、使用 Powershell：

在终端中输入以下命令启动 powershell：

```sh
pwsh
```
