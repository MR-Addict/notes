# Object

## 一、示例

```ts
let employee: {
  readonly id: number;
  name: string;
  retire: (date: Date) => void;
} = {
  id: 1,
  name: "cael",
  retire: (date: Date) => {
    console.log(date);
  },
};
```

## 二、知识点

- 对象的参数可以使用 **readonly** 设置为默认
- 对象可以传入函数
