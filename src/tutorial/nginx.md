# 使用 nginx

## 一、安装 nginx

更新 apt 源：

```sh
sudo apt-get update
```

安装 nginx：

```sh
sudo apt-get install nginx
```

使能 nginx：

```sh
sudo systemctl enable nginx
```

启动 nginx：

```sh
sudo systemctl start nginx
```

查看 nginx 状态：

```sh
sudo systemctl status nginx
```

## 二、使用 nginx

### 准备网站资源

首先我们需要准备一个可用的静态网站，这里我就使用我 GitHub 上基于 mdbook 的项目，你也可以使用自己的网站：

```sh
git clone https://github.com/mr-addict/Doc-Share.git
cd Doc-Share
mdbook build
```

运行`mdbook build`后会在当前文件夹自动编译出一个 book 文件夹，也即是我的网页内容，然后我们需要把这个网页放到 ngixn 默认的网页目录下`/var/www/`

```sh
sudo cp -r /home/ubuntu/Doc-Share/book /var/www/
```

### 配置网站

然后我们需要配置一下 nginx 的配置文件，nginx 将配置文件放在了两个文件夹下，分别是：

- sites-available
- sites-enabled

sites-available 文件夹用于放置所有的网站配置，sites-enabled 文件夹用于放置所有正在使用的网站配置。

首先我们在 sites-available 中新建一个文件：

```sh
sudo vim /etc/nginx/sites-availale/notes.conf
```

然后添加以下内容：

```sh
server {
    listen 80;
    listen [::]:80;
    location / {
        root /var/www/book;
        index index.html;
    }
}
```

完成配置后我们可以通过链接的命令，将 sites-available 中的配置文件链接到 sites-enabled 文件夹中：

```sh
sudo ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/
```

最后我们重新启动一下 nginx 就可以在本地 80 端口[http://localhost](http://localhost)正常访问我们的网页内容了：

```sh
sudo systemctl restart nginx
```

## 三、nginx 模板

nginx 基本配置模板：

```
server{
  listen 80;
  listen [::]:80;
  server_name mraddict.top;

  location / {
    root /var/www/book;
    index index.html;
  }
}
```

nginx 基于 SSL 签证模板：

```
server{
  listen 80;
  listen [::]:80;
  server_name mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name mraddict.top;

  ssl_certificate  /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.cert.pem;
  ssl_certificate_key /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.key.pem;

  location / {
    root /var/www/book;
    index index.html;

    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```

nginx 基于 SSL 签证的反向代理：

```
server{
  listen 80;
  listen [::]:80;
  server_name mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  listen [::]:443 ssl;
  server_name mraddict.top;

  ssl_certificate  /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.cert.pem;
  ssl_certificate_key /etc/nginx/certs/cloudflare/mraddict.one/mraddict.one.key.pem;

  location / {
    proxy_pass http://localhost:8080;

    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```
