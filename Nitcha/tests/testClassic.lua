-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Classic = require("libraries/ext/Classic")
local Tables  = require("libraries/lks/Tables")
trace = print


IHello = Classic:extend()
function IHello:sayHello()
  print("Hello", self.firstname)
end
IHello.message = "My Message"

CCharacter = Classic:extend()
CCharacter:implementnew(IHello)
function CCharacter:new(_argt)
  CCharacter.super.new(self, _argt)
  self.kind = "CCharacter"
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
  self.kind = "CPlayer"
  self:argt(_argt)
end


CPlayerExtra = CPlayer:extend()
function CPlayerExtra:new(_argt)
  CPlayerExtra.super.new(self, _argt)
  self.kind = "CPlayerExtra"
  self.inv = {phy = 1000, men = 2000, psy = {h = "hello", w = "world"}}
  self:argt(_argt)
end
function CPlayerExtra:argt(_argt)
  CPlayerExtra.super.argt(self, _argt)
  self.fullname = (self.firstname or "").."_"..(self.lastname or "")
end


if false then
Jeandu = CPlayer{
  age = 42,
  firstname = "jean",
  lastname = "du",
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
print(Jeandu:string())
print(Jeandu)
end

print()
AlainDucon = CPlayerExtra{
  x = 1000,
  firstname = "Alain",
  lastname = "Ducon",
  ["inv.phy"] = -100,
  ["inv.psy.h"] = "coucou",
  ["inv.men.h"] = "coucou",
  ["inv.any.h"] = "coucou",
}
AlainDucon["inv"]["men"] = -200,

print("-- BASE --")
Tables:print(AlainDucon, {indent = "\t"})

print("-- SAVE --")
AlainDucon:save()
AlainDucon.x = -10000
Tables:print(AlainDucon, {indent = "\t"})
AlainDucon:load()

print("-- LOAD --")
Tables:print(AlainDucon, {indent = "\t"})
