# 使用 Clash 内核

## 一、下载 Clash

在这里我们使用 Clash 作为科学上网的代理框架，为什么使用 Clash 呢，那是因为 Clash 内核支持各种 Unix 平台的各个架构；还支持各种代理协议，像 Trojan、Vmess、Shadowsocks 等等；以及强大的分流规则，可以非常方便地自定义各种规则。

你可以到 GitHub 下载[Clash 内核](https://github.com/Dreamacro/clash/releases)。如果你是**树莓派 4B 32 位操作系统**，那么你应该下载对应 armv7 版本的[clash-linux-armv7-v1.11.0.gz](https://github.com/Dreamacro/clash/releases/download/v1.11.0/clash-linux-armv7-v1.11.0.gz)，如果是**树莓派 4B 64 位操作系统**，那么你应该下载对应 armv7 版本的[clash-linux-armv8-v1.11.0.gz](https://github.com/Dreamacro/clash/releases/download/v1.11.0/clash-linux-armv8-v1.11.0.gz)。

下载完成后解压文件，建议把文件名改为`clash`， 然后移动到`/usr/local/bin/clash`位置，同时给该文件以执行的权限：

```sh
wget https://github.com/Dreamacro/clash/releases/download/v1.10.6/clash-linux-armv7-v1.10.6.gz
gunzip clash-linux-armv7-v1.10.6.gz
rm -rf clash-linux-armv7-v1.10.6.gz
mv clash-linux-armv7 clash
sudo mv clash /usr/local/bin
sudo chmod a+x /usr/local/bin/clash
```

## 二、配置 Clash

Clash 配置文件的默认路径是`~/.config/clash`，如果你的 Home 目录不存在相应文件夹就需要你自己创建，然后把你机场提供的配置文件放到该文件下就可以了，Clash 配置文件的默认名称应该是`config.yaml`。

```sh
mkdir ~/.config/clash
mv your/clash/config/file config.yaml
mv config.yaml ~/.config/clash
```

另外 Clash 还需要一个[Country.mmdb 文件](data/Country.mmdb)，Country.mmdb 是全球 IP 库，可以实现各个国家的 IP 信息解析和地理定位，没有这个文件 clash 无法正常启动，你可以前往[GitHub 下载](https://github.com/SukkaW/Koolshare-Clash/blob/master/koolclash/koolclash/config/Country.mmdb)。下载完成后同样放在默认路径下就可以了`~/.config/clash`。

## 三、配置终端代理

首先我们需要添加几个环境变量：

```sh
sudo vim /etc/environment
```

然后添加以下配置内容：

```
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export no_proxy="localhost, 127.0.0.1, *edu.cn"
```

> 注意 💥
>
> 系统变量的 https_proxy 的代理地址和 http_proxy 的代理地址是一样的，因为 Clash 使用一个地址同时代理 http 和 https。另外，no_proxy 表示其中的地址不需要代理，这一点很重要，比如我们不需要代理我们的校园网地址，因此加入要`*edu.cn`。

然后再对相应的终端应用配置代理：

### 为 sudo 配置代理

进入 sudo 配置文件：

```sh
sudo visudo
```

然后添加以下内容：

```
Defaults env_keep+="http_proxy https_proxy no_proxy"
```

### 为 apt 配置代理

进入 apt 配置文件：

```sh
sudo vim /etc/apt/apt.conf.d/10proxy
```

然后添加以下内容：

```
Acquire::http::Proxy "http://127.0.0.1:7890/";
```

### 为 git 配置代理

进入 git 配置文件：

```sh
vim ~/.gitconfig
```

然后添加以下内容：

```sh
[http]
  proxy=http://127.0.0.1:7890
[https]
  proxy=http://127.0.0.1:7890
```

### 为 pip 配置代理

进入 pip 配置文件：

```sh
vim ~/.config/pip/pip.conf
```

然后添加以下内容：

```
[global]
  proxy = http://127.0.0.1:7890
  http-proxy = http://127.0.0.1:7890
  https-proxy = http://127.0.0.1:7890
  trusted-host = pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org
```

### 为 npm 配置代理

进入 npm 配置文件：

```sh
vim ~/.npmrc
```

然后添加以下内容：

```
proxy=http://127.0.0.1:7890
http-proxy=http://127.0.0.1:7890
https-proxy=http://127.0.0.1:7890
```

### 为 cargo 配置代理

进入 cargo 配置文件：

```sh
vim ~/.cargo/config
```

然后添加以下内容：

```
[http]
  proxy=http://127.0.0.1:7890
[https]
  proxy=http://127.0.0.1:7890
```

### 为 docker 配置代理

新建 docker 配置文件夹：

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
```

新建 docker 代理配置文件：

```sh
sudo vim /etc/systemd/system/docker.service.d/proxy.conf
```

添加以下配置：

```sh
[Service]
Environment="NO_PROXY="localhost,127.0.0.1"
Environment="HTTP_PROXY=http://127.0.0.1:7890"
Environment="HTTPS_PROXY=http://127.0.0.1:7890"
```

重启 serive 配置文件：

```sh
sudo systemctl daemon-reload
```

重启 docker：

```sh
sudo systemctl restart docker.service
```

## 四、使用 Clash

配置完成后需要重启树莓派让配置生效，这样配置才能生效。理论上这样一波配置后，大部分终端应用都可以正常使用了，如果你有其他的终端应用可自行参考相关文档进行配置。

重启之后在终端中输入 clash，如果输出类似以下内容那么就说明 Clash 启动成功了。

```
INFO[0000] Start initial compatible provider 手动选择
INFO[0000] Start initial compatible provider 节点选择
INFO[0000] Start initial compatible provider 故障切换
INFO[0000] Start initial compatible provider 自动选择
INFO[0000] HTTP proxy listening at: [::]:7890
INFO[0000] RESTful API listening at: 127.0.0.1:9090
INFO[0000] SOCKS proxy listening at: [::]:7891
```

你可以更新一下系统或者打开浏览器测试一下 Google，如果可以访问你就可以愉快地玩耍了！

> 注意 💥
>
> 在终端请不要使用`ping google.com`来测试，因为 ping 使用不同的协议无法被 Clash 代理，但是可以使用`curl google.com`。

## 五、开机自启

既然我们都已经可以使用 Clash 了，当然要让树莓派能够开机自启 Clash 对吧。在树莓派推荐使用 crontab 作为自动任务管理器。

输入以下命令可以打开 crontab：

```sh
crontab -e
```

第一次使用可能需要你选择默认的编辑器，看个人喜好选择就好，然后在打开的文件末尾添加以下内容：

```
@reboot /usr/local/bin/clash
```

你也可以使用 systemd 来管理 Clash 的开机自启，首先创建一个服务文件：

```sh
sudo vim /etc/systemd/system/clash.service
```

然后添加以下内容：

```sh
[Unit]
After=network.target
Description=clash
StartLimitBurst=5
StartLimitIntervalSec=100

[Service]
Type=simple
User=ubuntu
Restart=always
RestartSec=1
ExecStart=/usr/local/bin/clash

[Install]
WantedBy=multi-user.target
```

然后开机自启：

```sh
sudo systemctl enable clash
```

然后启动服务：

```sh
sudo systemctl start clash
```

## 六、控制面板

GitHub 上有很多优秀的有关 Clash Dashboard 的项目，这些项目可以非常方便地帮助你查看、设置和管理你的 Clash。

从 GitHub 上克隆[Clash Dashbaord](https://github.com/Dreamacro/clash-dashboard.git)到 Clash 的默认配置文件夹下。

```sh
cd ~/.config/clash
git clone https://github.com/Dreamacro/clash-dashboard.git
cd ~/.config/clash/clash-dashboard
git checkout -b gh-pages origin/gh-pages
```

下载完成后你需要对 Clash 的配置文件稍作修改，在 config.yaml 的头部添加或者修改以下两项：

```config.yaml
external-ui: clash-dashboard
external-controller: 127.0.0.1:9090
```

然后在浏览器中输入[http://127.0.0.1:9090/ui](http://127.0.0.1:9090/ui)就可以看到 Clash 的控制面板了。
