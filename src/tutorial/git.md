# 使用 git

## 一、配置 git

进入 git 配置文件：

```bash
vim ~/.gitconfig
```

然后添加以下内容：

```
[user]
    name=MR-Addict
    email=2750417853@qq.com
[http]
    proxy=http://127.0.0.1:7890
[https]
    proxy=http://127.0.0.1:7890
[init]
    defaultBranch=main
[pull]
    ff=only
```

## 二、首次提交模板

添加基本内容：

```bash
git init
echo "# Test" > README.md
git add README.md
git commit -m "First commit"
```

添加远程仓库链接：

```bash
git remote add github https://github.com/MR-Addict/Doc-Share.git
```

更改默认分支名为 main：

```bash
git branch -M main
```

推送提交到远程仓库：

```bash
git push -u github main
```

## 三、常用命令

查看提交记录：

```bash
git log
```

查看当前状态：

```bash
git status
```

设置全局用户名：

```bash
git config --global user.name MR-Addict
```

配置全局用户邮箱：

```bash
git config --global user.email 2750417853@qq.com
```

回退版本：

```bash
git reset --hard $hash_value_of_last_commit
```

查看本地配置：

```bash
git config --list
```

查看全局配置：

```bash
git config --global --list
```

编辑全局配置：

```bash
git config --global --edit
```

保存系统登录验证：

```bash
git config --system credential.helper store
```

重置系统登录验证：

```bash
git config --system --unset credential.helper
```

只拉取不提交：

```bash
git config --global pull.ff only
```

设置本地默认分支：

```bash
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/$branch_name
```

删除本地和远程分支：

```bash
git branch -D $branch_name
```

```bash
git push --delete $branch_name
```

重置所有内容，并且删除新文件：

```bash
git restore . && git clean -f
```
