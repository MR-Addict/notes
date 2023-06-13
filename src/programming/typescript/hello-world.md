# Hello world

## 一、安装 typescript

```sh
npm install -g typescript
```

## 二、配置 ts 解释器

生成配置文件：

```sh
tsc --init
```

替换以下配置内容：

```json
{
  "compilerOptions": {
    "target": "es2016",
    "module": "commonjs",
    "rootDir": "./src",
    "outDir": "./dist",
    "removeComments": true,
    "noEmitOnError": true,
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "skipLibCheck": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noUnusedLocals": true
  }
}
```

## 三、Hello-world

新建`src/hello.ts`，并替换以下内容：

```ts
let message: string = "Hello world!";
console.log(message);
```

编译文件：

```sh
tsc
```
