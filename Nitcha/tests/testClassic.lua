-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")


CCharacter = Classic:extend()
function CCharacter:new()
  self.sprite = 1
  self.x = 2
  self.y = 3
end

CPlayer = CCharacter:extend()
function CPlayer:new()
  self.super.new(self)
end



Golith = CPlayer()

print(":Golith 1:")
print(Golith:_size())
print(table.unpack(Golith:_keys()))
print(table.unpack(Golith:_vals()))

print(":Golith 2:")
Golith:argt({
  x = 20,
  y = 30,
  age = 180,
  sprite = 10,
})
print(Golith:_size())
print(table.unpack(Golith:_keys()))
print(table.unpack(Golith:_vals()))

print(":Golith 3:")
Golith:argt({
  y = 300,
  x = 200,
  sprite = 100,
  age = 1800,
  race = "Gogol",
})
print(Golith:_size())
print(table.unpack(Golith:_keys()))
print(table.unpack(Golith:_vals()))
