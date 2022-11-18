# Class

## 一、Class基础

```lua
Animal = { height = 0, weight = 0, name = "No Name", sound = "No Sound" }
function Animal:new(height, weight, name, sound)
  setmetatable({}, Animal)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  return self
end

function Animal:toString()
  local animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s",
    self.name, self.weight, self.height, self.sound)
  return animalStr
end

local spot = Animal:new(10, 15, "Spot", "Roof")
print(spot:toString())
```

## 二、Class继承

```lua
Animal = { height = 0, weight = 0, name = "No Name", sound = "No Sound" }
function Animal:new(height, weight, name, sound)
  setmetatable({}, Animal)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  return self
end

function Animal:toString()
  local animalStr = string.format("%s weighs %.1f lbs, is %.1f in tall and says %s",
    self.name, self.weight, self.height, self.sound)
  return animalStr
end

local spot = Animal:new(10, 15, "Spot", "Roof")
print(spot:toString())

Cat = Animal:new()
function Cat:new(height, weight, name, sound, favFood)
  setmetatable({}, Cat)
  self.height = height
  self.weight = weight
  self.name = name
  self.sound = sound
  self.favFood = favFood
  return self
end

function Cat:toString()
  local catStr = string.format("%s weighs %.1f lbs, is %.1f in tall, says %s and loves %s",
    self.name, self.weight, self.height, self.sound, self.favFood)
  return catStr
end

local fluffy = Cat:new(10, 15, "Fluffy", "Meow", "Tuna")
print(fluffy:toString())
```