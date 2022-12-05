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

## 二、布尔型Boolean

```lua
isLogin = true
print(type(isLogin))
```

## 三、空型Nil

```lua
print(type(madeupvar))
```

## 四、字符型String

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

字符长度：

```lua
local quote = "I changed my password everywhere to 'incorrect.' That way when I forget it,it always reminds me, 'Your password is incorrect.'"
io.write("Quote Length : ", string.len(quote), "\n")
```

字符替换：

```lua
local quote = "I changed my password everywhere to 'incorrect.' That way when I forget it,it always reminds me, 'Your password is incorrect.'"
io.write("Replace I with me : ", string.gsub(quote, "I", "me"), "\n")
```

查找字符：

```lua
local quote = "I changed my password everywhere to 'incorrect.' That way when I forget it,it always reminds me, 'Your password is incorrect.'"
io.write("Index of password : ", string.find(quote, "password"), "\n")
```

字符大写或小写：

```lua
local quote = "I changed my password everywhere to 'incorrect.' That way when I forget it,it always reminds me, 'Your password is incorrect.'"
io.write("Quote Upper : ", string.upper(quote), "\n")
io.write("Quote Lower : ", string.lower(quote), "\n")
```
