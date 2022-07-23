# 使用apache2

## 一、安装apache2

```bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
```

打开apache2默认地址查看默认的网页内容[http://localhost](http://localhost)。


## 二、配置apache2

首先准备好一个网页，然后我们需要对网页进行一些配置。这里我已我的笔记网页为例`/home/pi/Projects/Notes/book`。

新建配置文件：

```bash
sudo vim /etc/apache2/sites-available/note.conf
```

添加以下内容：

```
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /home/pi/Projects/Notes/book
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

然后进入apache的配置文件给该目录以权限：

```bash
sudo vim /etc/apache2/apache2.conf
```

添加以下内容：

```
<Directory "/home/pi/Projects/Notes/book">
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
</Directory>
```

## 三、使用apache2

首先我们需要关闭默认的apache网页：

```bash
sudo a2dissite 000-default.conf
```

然后激活我们的网页：

```bash
sudo a2ensite notes.conf
```

最后重新启动apache：

```bash
sudo systemctl reload apache2
```

然后我们就可以通过默认网址访问我们的网页了[http://localhost](http://localhost)。

查看apche2服务：

```bash
sudo systemctl status apache2
```

停止apache2服务：

```bash
sudo systemctl stop apache2
```

注销apache2服务：

```bash
sudo systemctl disable apache2
```

注册apache2服务：

```bash
sudo systemctl enable apache2
```
