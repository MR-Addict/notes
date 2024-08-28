# 使用 git

## 一、配置 git

进入 git 配置文件：

```sh
vim ~/.gitconfig
```

然后添加以下内容：

```
[user]
    name=Cael
    email=MR-Addict@qq.com
[http]
    proxy=http://127.0.0.1:7890
[https]
    proxy=http://127.0.0.1:7890
```

## 二、首次提交模板

添加基本内容：

```sh
git init
echo "# Test" > README.md
git add README.md
git commit -m "First commit"
```

添加远程仓库链接：

```sh
git remote add github https://github.com/MR-Addict/Doc-Share.git
```

更改默认分支名为 main：

```sh
git branch -M main
```

推送提交到远程仓库：

```sh
git push -u github main
```

## 三、常用命令

查看提交记录：

```sh
git log
```

查看当前状态：

```sh
git status
```

设置全局用户名：

```sh
git config --global user.name Cael
```

配置全局用户邮箱：

```sh
git config --global user.email MR-Addict@qq.com
```

回退版本：

```sh
git reset --hard $hash_value_of_last_commit
```

查看本地配置：

```sh
git config --list
```

查看全局配置：

```sh
git config --global --list
```

编辑全局配置：

```sh
git config --global --edit
```

保存系统登录验证：

```sh
git config --system credential.helper store
```

重置系统登录验证：

```sh
git config --system --unset credential.helper
```

只拉取不提交：

```sh
git config --global pull.ff only
```

设置本地默认分支：

```sh
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/$branch_name
```

删除本地和远程分支：

```sh
git branch -D $branch_name
```

```sh
git push --delete $branch_name
```

重置所有内容，并且删除新文件：

```sh
git restore . && git clean -f
```
