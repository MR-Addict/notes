# PowerShell 基础

获取命令帮助：

```ps1
Get-Help Select-Object
```

查找命令：

```ps1
Get-command *printer*
```

清空终端输出：

- clear
- cls
- Ctrl + L

查看命令的别名原始内容：

```ps1
Get-Alias gal
```

终端输出：

```ps1
Write-Host "Hello world"
echo "Hello world"
```

格式化输出：

```ps1
Get-ChildItem | Format-Wide
Get-ChildItem | Format-List *
```

控制输出：

```ps1
Get-ChildItem | Out-String
Get-ChildItem | Out-Default
Get-ChildItem | Out-Null
Get-ChildItem | Out-File
```

处理元素：

```ps1
Remove-Item
Copy-Item
Get-Content
New-Item
Move-Item
```

获取PW执行权限：

```ps1
Get-ExecutionPolicy --list
Set-Executionpolicy RemoteSigned
```