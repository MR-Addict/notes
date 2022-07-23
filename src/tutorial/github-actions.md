# 使用GitHub Actions

## 一、基本模板

新建配置文件：

```bash
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

Github Action状态API：

```
https://github.com/mr-addict/notes/actions/workflows/gh-pages.yml/badge.svg?branch=main
```

## 二、部署mdbook模板

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
    concurrency:
      group: ${{ github.workflow }}-${{ github.ref }}
    steps:
      - name: Checkout current branch
        uses: actions/checkout@v3

      - name: Setup mdBook
        uses: peaceiris/actions-mdbook@v1
        with:
          mdbook-version: 'latest'

      - name: Build book
        run: mdbook build

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        if: ${{ github.ref == 'refs/heads/main' }}
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./book
```

## 三、部署hexo模板

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
          node-version: '16'

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
