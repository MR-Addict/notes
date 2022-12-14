# Function

## 一、示例

```ts
function calculateTax(income: number, taxYear: number = 2022): number {
  if (taxYear < 2024) return income * 1.05;
  return income;
}
console.log(calculateTax(10_000, 2022));
```

## 二、知识点

- 函数需要返回值
- 函数参数可以指定类型
- 函数参数可设置默认值
