# Type Aliases

## 一、示例

```ts
type Employee = {
  readonly id: number;
  name: string;
  retire: (date: Date) => void;
};

let employee: Employee = {
  id: 1,
  name: "cael",
  retire: (date: Date) => {
    console.log(date);
  },
};

employee.retire(new Date());
```

## 二、知识点

- 使用 **type** 声明对象的别名
