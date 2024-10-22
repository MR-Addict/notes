# 使用 Oh My Posh

> 官方文档 📝
>
> [oh-my-posh](https://ohmyposh.dev/docs/installation/windows)

## 一、安装 Oh My Posh

使用 Winget 安装 Oh My Posh：

```sh
winget install --id JanDeDobbeleer.OhMyPosh
```

也可以使用 PowerShell 脚本安装：

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```

## 二、配置 Oh My Posh

在 PowerShell 配置文件中添加以下内容：

```ps1
# Oh-My-Posh
oh-my-posh init --config "$env:POSH_THEMES_PATH/amro.omp.json" | Invoke-Expression
```
