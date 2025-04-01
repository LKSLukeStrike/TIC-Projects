-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Classic = require("libraries/ext/Classic")
local Tables  = require("libraries/lks/Tables")


XHello = Classic:extend()
function XHello:sayHello()
  print"Hello"
end
XHello.message = "My Message"

CCharacter = Classic:extend()
CCharacter:implementNew(XHello)
function CCharacter:new(_argt)
  CCharacter.super.new(self, _argt)
  self.x = 1
  self.y = 2
  self.z = 3
  self:argt(_argt)
end

function CCharacter:printMe(_title)
  print()
  if _title then print(_title) end
  print("Size:", self:_size())
  print(table.unpack(self:_keys()))
  print(table.unpack(self:_vals()))
end


CPlayer = CCharacter:extend()
function CPlayer:new(_argt)
  CPlayer.super.new(self, _argt)
  self:argt(_argt)
end


Jeandu = CPlayer{
  age = 42,
  prenom = "jean",
  nom = "du",
}

Jeandu:argt{
  y = 200,
  x = 100,
  z = 300,
  age = 24,
  race = "Human",
}

Jeandu:save{"age", "race"}
Jeandu:argt{
  age = 1234,
  race = "Thing",
}
Jeandu:printMe(":Jeandu 3:")

Jeandu:load()
Jeandu:printMe(":Jeandu 4:")

print()
print("Classic", Jeandu:is(Classic))
print("CCharacter", Jeandu:is(CCharacter))
print("CPlayer", Jeandu:is(CPlayer))
print("CPlayer", Jeandu:is(CVoid))

print()
Jeandu:sayHello()
print("message:", Jeandu.message)

-- print()
-- print("XHello")
-- Tables:print(XHello)
-- print("CCharacter")
-- Tables:print(CCharacter)
-- print("CPlayer")
-- Tables:print(CPlayer)
-- print("Jeandu")
-- Tables:print(Jeandu)
