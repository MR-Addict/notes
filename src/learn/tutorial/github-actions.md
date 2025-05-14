# 使用 GitHub Actions

## 一、基本模板

新建配置文件：

```sh
vim .github/workflows/demo.yml
```

然后添加以下内容：

```yml
name: build
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  Check-Python-Version:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout current branch
        uses: actions/checkout@v3

      - name: Setup python
        uses: actions/setup-python@v4
        with:
          python-version: 3.9

      - name: Check python version
        run: python --version

  Check-Windows-Powershell-Version:
    runs-on: windows-latest
    steps:
      - name: Check-Windows-Powershell-Version
        shell: powershell
        run: echo $PSVersionTable
```

Github Action 状态 API：

```
https://github.com/mr-addict/notes/actions/workflows/gh-pages.yml/badge.svg?branch=main
```

## 二、部署模板

### mdbook 模板

```yml
name: pages

on:
  push:
    branches:
      - main
  pull_request:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    concurrency:
      group: ${{ github.workflow }}-${{ github.ref }}
    steps:
      - name: checkout current branch
        uses: actions/checkout@v3
      - name: setup mdBook
        uses: peaceiris/actions-mdbook@v1
        with:
          mdbook-version: "latest"
      - name: build book
        run: mdbook build
      - name: push to gh-pages
        uses: peaceiris/actions-gh-pages@v3
        if: ${{ github.ref == 'refs/heads/main' }}
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./book
```

### hexo 模板

```yml
name: build

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  Deploy-Github-Pages:
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout current branch
        uses: actions/checkout@v2

      - name: Setup nodejs
        uses: actions/setup-node@v3
        with:
          node-version: "16"

      - name: Cache npm dependencies
        uses: actions/cache@v3.0.4
        with:
          path: node_modules
          key: ${{ runner.OS }}-npm-cache
          restore-keys: ${{ runner.OS }}-npm-cache

      - name: Install npm dependencies
        run: npm install

      - name: Build project
        run: npm run build

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./public
```

### docker 容器模板

```yaml
name: docker

on:
  push:
    branches:
      - main
  pull_request:

jobs:
  docker:
    runs-on: ubuntu-latest
    steps:
      - name: Set up QEMU
        uses: docker/setup-qemu-action@v2
      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2
      - name: Login to DockerHub
        uses: docker/login-action@v2
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      - name: Build and push
        uses: docker/build-push-action@v3
        with:
          push: true
          tags: mraddict063/punch:latest
```

## 三、创建个人 Actions-Runner

### 部署 Runner

可以参照 Github，这边跳过。

运行 Runner：

```sh
./run.sh
```

### 将 Actions Runner 注册为开机自启任务

注册任务：

```sh
sudo ./svc.sh install
```

启动任务：

```sh
sudo ./svc.sh start
```

查看状态：

```sh
sudo ./svc.sh status
```

停止任务：

```sh
sudo ./svc.sh stop
```

注销任务：

```sh
sudo ./svc.sh uninstall
```
