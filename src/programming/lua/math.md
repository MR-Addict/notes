# Math

## 一、常用函数

示例：

```lua
io.write("floor(2.345) : ", math.floor(2.345), "\n")
io.write("ceil(2.345) : ", math.ceil(2.345), "\n")
io.write("max(2, 3) : ", math.max(2, 3), "\n")
io.write("min(2, 3) : ", math.min(2, 3), "\n")
io.write("sqrt(64) : ", math.sqrt(64), "\n")
```

输出：

```
floor(2.345) : 2
ceil(2.345) : 3
max(2, 3) : 3
min(2, 3) : 2
sqrt(64) : 8
```

## 二、Random函数

随机生成0-1的随机数：

```lua
io.write("math.random() : ", math.random(), "\n")
```

随机生成1-10的随机数：

```lua
io.write("math.random(10) : ", math.random(10), "\n")
```

浮点数格式化：

```lua
print(string.format("Pi = %.5f", math.pi))
```
