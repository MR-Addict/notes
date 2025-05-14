# 使用 GO

## 一、安装 GO

前往 [Golang 官网](https://golang.org/dl/) 下载最新版本的 Golang 安装包。

## 二、设置代理

使用 go env 命令设置代理：

```sh
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
```

使用管理员打开设置全局的环境变量：

```sh
setx /M HTTP_PROXY "http://127.0.0.1:7890"
setx /M HTTPS_PROXY "http://127.0.0.1:7890"
```
