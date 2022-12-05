# Table

## 一、基础用法

通过索引获取Table，下标从1开始：

```lua
local aTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print(aTable[1])
```

将Table转换为字符：

```lua
local aTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print(table.concat(aTable, ", "))
```

去除Table的某个元素：

```lua
local aTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print(table.concat(aTable, ", "))
table.remove(aTable, 1)
print(table.concat(aTable, ", "))
```

在Table中插入某个元素：

```lua

local aTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print(table.concat(aTable, ", "))
table.insert(aTable, 1)
print(table.concat(aTable, ", "))
```

给table排序：

```lua
local aTable = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
print(table.concat(aTable, ", "))
table.sort(aTable, function(a, b) return a > b end)
print(table.concat(aTable, ", "))
```

## 二、二维Table

```lua
local aMultiTable = {}
for i = 0, 9 do
  aMultiTable[i] = {}
  for j = 0, 9 do
    aMultiTable[i][j] = tostring(i) .. tostring(j)
  end
end
for i = 0, 9 do
  for j = 0, 9 do
    io.write(aMultiTable[i][j], " , ")
  end
  print()
end
```
