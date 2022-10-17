# Tailwind

```admonish info
官方文档：[tailwind](https://tailwindcss.com/docs/installation)
```

## 一、安装配置Tailwind

### 安装Tailwind

```bash
npm install -D tailwindcss
```

### 初始化配置文件

```bash
npx tailwindcss init
```

### 将tailwind.config.js中替换成以下配置

```js
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}", "./index.html"],
  theme: {
    extend: {},
  },
  plugins: [],
}
```

### 在index.css中添加以下内容

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```