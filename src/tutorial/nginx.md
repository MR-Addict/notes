# 使用nginx

## 一、安装nginx

更新apt源：

```bash
sudo apt-get update
```

安装nginx：

```bash
sudo apt-get install nginx
```

使能nginx：

```bash
sudo systemctl enable nginx
```

启动nginx：

```bash
sudo systemctl start nginx
```

查看nginx状态：

```bash
sudo systemctl status nginx
```


## 二、使用nginx

### 准备网站资源

首先我们需要准备一个可用的静态网站，这里我就使用我GitHub上基于mdbook的项目，你也可以使用自己的网站：

```bash
git clone https://github.com/mr-addict/Doc-Share.git
cd Doc-Share
mdbook build
```

运行`mdbook build`后会在当前文件夹自动编译出一个book文件夹，也即是我的网页内容，然后我们需要把这个网页放到ngixn默认的网页目录下`/var/www/`

```bash
sudo cp -r /home/ubuntu/Doc-Share/book /var/www/
```

### 配置网站

然后我们需要配置一下nginx的配置文件，nginx将配置文件放在了两个文件夹下，分别是：

- sites-available
- sites-enabled

sites-available文件夹用于放置所有的网站配置，sites-enabled文件夹用于放置所有正在使用的网站配置。

首先我们在sites-available中新建一个文件：

```bash
sudo vim /etc/nginx/sites-availale/notes.conf
```

然后添加以下内容：

```bash
server {
    listen 80;
    location / {
        root /var/www/book;
        index index.html;
    }
}
```

完成配置后我们可以通过链接的命令，将sites-available中的配置文件链接到sites-enabled文件夹中：

```bash
sudo ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/
```

最后我们重新启动一下nginx就可以在本地80端口[http://localhost](http://localhost)正常访问我们的网页内容了：

```bash
sudo systemctl restart nginx
```

## 三、nginx模板

nginx基本配置模板：

```
server{
  listen 80;
  server_name mraddict.top;
  location / {
    root /var/www/book;
    index index.html;
  }
}
```

nginx基于SSL签证模板：

```
server{
  listen 80;
  server_name mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  server_name mraddict.top;

  client_max_body_size 0;
  underscores_in_headers on;

  ssl_certificate  /etc/nginx/certs/mraddict.top/mraddict.top_bundle.crt;
  ssl_certificate_key /etc/nginx/certs/mraddict.top/mraddict.top.key;
  ssl_session_timeout 5m;
  ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    add_header Front-End-Https on;
    proxy_headers_hash_max_size 512;
    proxy_headers_hash_bucket_size 64;
    proxy_buffering off;
    proxy_redirect off;
    proxy_max_temp_file_size 0;

    root /var/www/book;
    index index.html;
  }
}
```

nginx基于SSL签证的反向代理：

```
server{
  listen 80;
  server_name cloud.mraddict.top;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl;
  server_name cloud.mraddict.top;

  client_max_body_size 0;
  underscores_in_headers on;

  ssl_certificate  /etc/nginx/certs/cloud.mraddict.top/cloud.mraddict.top_bundle.crt;
  ssl_certificate_key /etc/nginx/certs/cloud.mraddict.top/cloud.mraddict.top.key;
  ssl_session_timeout 5m;
  ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
  ssl_protocols TLSv1.2 TLSv1.3;
  ssl_prefer_server_ciphers on;

  location / {
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    add_header Front-End-Https on;
    proxy_headers_hash_max_size 512;
    proxy_headers_hash_bucket_size 64;
    proxy_buffering off;
    proxy_redirect off;
    proxy_max_temp_file_size 0;
    proxy_pass http://localhost:8080;
  }
}
```