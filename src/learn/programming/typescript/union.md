# Union Type

## 一、示例

```ts
function KgToLbs(weight: number | string): number {
  if (typeof weight === "number") return weight * 2.2;
  else return parseInt(weight) * 2.2;
}
console.log(KgToLbs(20));
```

## 二、知识点

- 使用 **|** 给变量两个范围
- 使用 **typeof** 判断变量类型
