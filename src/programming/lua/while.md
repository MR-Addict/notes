# 循环

## 一、while 循环

```lua
local i = 1
while (i <= 10) do
  io.write(i)
  i = i + 1
  if i == 8 then break end
end
```

## 二、repeat 循环

```lua
repeat
  io.write("Enter your guess : ")
  local guess = io.read()
until tonumber(guess) == 15
```

## 三、for 循环

简单循环：

```lua
for i = 1, 10, 1 do
  io.write(i)
end
print()
```

遍历循环：

```lua
local months = {
  "January", "February", "March", "April", "May", "June",
  "July", "August", "September", "October", "November", "December"
}
for key, value in pairs(months) do
  io.write(key, ":", value, "\n")
end
```
