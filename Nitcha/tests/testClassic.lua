-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")


CCharacter = Classic:extend()
function CCharacter:new(_argt)
  self.sprite = 1
  self.x = 2
  self.y = 3
  self:argt(_argt)
end

CPlayer = CCharacter:extend()
function CPlayer:new(_argt)
  self.super.new(self, _argt)
  self:argt(_argt)
end



-- CGolith = CPlayer:extend()
-- function CGolith:new(_argt)
--   self.super.new(self, _argt)
-- end
-- Golith = CGolith()
Golith = CPlayer{name = "Golith"}

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

print(":Jeandu 1:")
Jeandu = CPlayer({
  age = 42,
  prenom = "jean",
  nom = "du",
})
print(Jeandu:_size())
print(table.unpack(Jeandu:_keys()))
print(table.unpack(Jeandu:_vals()))

print(":Jeandu 2:")
Jeandu:argt({
  y = 300,
  x = 200,
  sprite = 100,
  age = 24,
  race = "Human",
})
print(Jeandu:_size())
print(table.unpack(Jeandu:_keys()))
print(table.unpack(Jeandu:_vals()))

print(Golith:is(Golith))
print(Golith.name)
