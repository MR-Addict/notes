# 其他配置及常用命令

## 一、Git 无法提交

问题描述：在提交代码时，出现如下错误：

```sh
warning: unable to access '/Users/cael/.config/git/ignore': Permission denied
warning: unable to access '/Users/cael/.config/git/attributes': Permission denied
```

这主要是由于权限问题导致的，可以通过以下命令解决：

```sh
sudo chown -R cael:(id -gn $USER) /Users/cael/.config
```
