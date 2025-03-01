-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")
local Tables  = require("libraries/lks/Tables")


CCharacter = Classic:extend()
function CCharacter:new(_argt)
  CCharacter.super.new(self, _argt)
  self.sprite = 1
  self.x = 2
  self.y = 3
  self:_argt(_argt)
end

function CCharacter:print(_title)
  print()
  if _title then print(_title) end
  print("Size:", self:_size())
  print(table.unpack(self:_keys()))
  print(table.unpack(self:_vals()))
end


CPlayer = CCharacter:extend()
function CPlayer:new(_argt)
  CPlayer.super.new(self, _argt)
  self:_argt(_argt)
end



-- Golith = CPlayer{name = "Golith"}
-- Golith:print(":Golith 1:")

-- Golith:_argt{
--   x = 20,
--   y = 30,
--   age = 180,
--   sprite = 10,
-- }
-- Golith:print(":Golith 2:")

-- Golith:_argt{
--   y = 300,
--   x = 200,
--   sprite = 100,
--   age = 1800,
--   race = "Gogol",
-- }
-- Golith:print(":Golith 3:")


Jeandu = CPlayer{
  age = 42,
  prenom = "jean",
  nom = "du",
}
-- Jeandu:print(":Jeandu 1:")

Jeandu:_argt{
  y = 300,
  x = 200,
  sprite = 100,
  age = 24,
  race = "Human",
}
-- Jeandu:print(":Jeandu 2:")

Jeandu:_save{"age", "race"}
Jeandu:_argt{
  age = 1234,
  race = "Thing",
}
Jeandu:print(":Jeandu 3:")
-- Tables:print(Jeandu._savestack, " ")

Jeandu:_load()
Jeandu:print(":Jeandu 4:")

print("Classic", Jeandu:is(Classic))
print("CCharacter", Jeandu:is(CCharacter))
print("CPlayer", Jeandu:is(CPlayer))
