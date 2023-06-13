# 使用 Linux 用户和用户组

## 一、管理用户

查看当前用户：

```sh
whoami
```

查看所有用户：

```sh
cat /etc/passwd
```

添加新用户：

```sh
sudo useradd -m -s /bin/sh -c "test-user" test
```

更改用户密码：

```sh
sudo passwd test
```

更改文件或者文件夹所有者：

```sh
sudo chown $user:$user $filename_or_folder
```

登录其他用户：

```sh
su test
```

删除用户：

```sh
sudo userdel test
```

## 二、管理用户组

查看所有用户组：

```sh
cat /etc/group
```

添加用户到其他用户组：

```sh
sudo usermod -aG sudo test
```

添加新用户组：

```sh
sudo groupadd test
```

删除用户组：

```sh
sudo groupdel test
```
