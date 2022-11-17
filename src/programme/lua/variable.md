# 变量

## 一、数字型Number

Lua数值的最大值：

```lua
print(9223372036854775807 + 1)
```

Lua数值的精度为13位：

```lua
print(1.9999999999999 + 0.00000000000001)
```

## 二、字符型String

字符拼接：

```lua
age = 15
name = "cael"
print('Hello ' .. name .. ", you are're " .. age .. " now.")
```

多行字符：

```lua
longString = [[
This is a multi line string,
which you can print as many as lines you want.
]]
print(longString)
```

## 三、布尔型Boolean

```lua
isLogin = true
print(type(isLogin))
```

## 四、空型Nil

```lua
print(type(madeupvar))
```
