# 函数

## 一、基本用法

```lua
local function getSum(num1, num2)
  return num1 + num2
end
print(string.format("5 + 2 = %d", getSum(5, 2)))
```

## 二、多个返回值

```lua
local function splitStr(theString)

  local stringTable = {}
  local i = 1
  for str in string.gmatch(theString, "[^%s]+") do
    stringTable[i] = str
    i = i + 1
  end
  return stringTable, i
end

local splitStrTable, numOfStr = splitStr("The Turtle")
for j = 1, numOfStr do
  print(string.format("%d : %s", j, splitStrTable[j]))
end
```

## 三、参数数目未知

```lua
local function getSumMore(...)
  local sum = 0
  for key, value in pairs { ... } do
    sum = sum + value
  end
  return sum
end

io.write("Sum : ", getSumMore(1, 2, 3, 4, 5, 6), "\n")
```

## 四、函数变量

```lua
local doubleIt = function(x) return x * 2 end
print(doubleIt(4))
```

## 五、函数闭包

```lua
local function outerFunc()
  local i = 0
  return function()
    i = i + 1
    return i
  end
end

local getI = outerFunc()
print(getI())
print(getI())
```
