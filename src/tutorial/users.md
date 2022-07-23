# 使用Linux用户和用户组

## 一、管理用户

查看当前用户：

```bash
whoami
```

查看所有用户：

```bash
cat /etc/passwd
```

添加新用户：

```bash
sudo useradd -m -s /bin/bash -c "test-user" test
```

更改用户密码：

```bash
sudo passwd test
```

登录其他用户：

```bash
su test
```

删除用户：

```bash
sudo userdel test
```

## 二、管理用户组

查看所有用户组：

```bash
cat /etc/group
```

添加用户到其他用户组：

```bash
sudo usermod -aG sudo test
```

添加新用户组：

```bash
sudo groupadd test
```

删除用户组：

```bash
sudo groupdel test
```
