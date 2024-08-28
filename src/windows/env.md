# 设置环境变量

## 一、 查看环境变量

```sh
set
```

## 二、设置临时环境变量

设置临时环境变量只在当前会话中有效，关闭当前会话后失效：

```sh
set ENV_NAME "value"
```

删除临时环境变量：

```sh
set ENV_NAME=
```

## 三、设置全局环境变量

设置全局环境变量需要管理员权限：

```sh
setx /M ENV_NAME "value"
```

删除全局环境变量：

```sh
setx /M ENV_NAME=
```
