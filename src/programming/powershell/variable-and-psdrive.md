# Powershell 变量和PSDrive

## 一、变量

创建变量：

```ps1
$true
$false
$null
$Hello="Hello World"
$Hello.Length
$Hello | Get-Member
$Hello.GetType()
```

查看变量的类型：

```ps1
Get-TypeData *IP*
```

定义变量类型：

```ps1
[IPAddress]"192.168.4.1"
$myIP = [IPAddress]"192.168.4.1"
```

## 二、PSDrive

PSDrive：

```ps1
Get-PSDrive
```

操作PSDrive：

```ps1
cd Variable:
cd Env:
echo $Env:Windir
cd C:
```
