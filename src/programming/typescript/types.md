# Types

##  一、Built-In Types

内置的一些数据类型，包括数字型，字符型，布尔型和任意型：

```ts
let sales: number = 123_456_789;
let course: string = "Typescript";
let is_published: boolean = true;
let level: any;
level = 1;
level = "One";
```

## 二、Array

数组：

```ts
let numbers: number[] = [1, 2, 3];
numbers.forEach((item) => console.log(item.toString()))
```

## 三、Tuples

用于自定义一个数组，具有给定的数据类型：

```ts
let user: [number, string] = [1, 'Cael'];
user.forEach((item) => console.log(item))
```

## 四、Enum

Enum用于将相关联的变量组合成一个数据**自定义的**类型：

```ts
const enum Size { Small = 1, Medium, Large }
let mySize: Size = Size.Medium;
console.log(mySize)
```
