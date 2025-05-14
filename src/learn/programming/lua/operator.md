# 运算符

## 一、四则运算符

```lua
io.write("5 + 3 = ", 5 + 3, "\n")
io.write("5 - 3 = ", 5 - 3, "\n")
io.write("5 * 3 = ", 5 * 3, "\n")
io.write("5 / 3 = ", 5 / 3, "\n")
io.write("5.2 % 3 = ", 5 % 3, "\n")
```

## 二、关系运算符

```lua
local age = 13
if age < 16 then
  io.write("You can go to school", "\n")
elseif (age >= 16) and (age < 18) then
  io.write("You can drive", "\n")
else
  io.write("You can vote", "\n")
end
```

## 三、逻辑运算符

或运算符：

```lua
local age = 13
if (age < 14) or (age > 67) then io.write("You shouldn't work\n") end
```

且运算符：

```lua
local canVote = age > 18 and true or false
io.write("Can I Vote : ", tostring(canVote), "\n")
```
