-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")


CCharacter = Classic:extend()
function CCharacter:new(_sprite)
  self.sprite = _sprite or 1
  self.x = 2
  self.y = 3
end

CPlayer = CCharacter:extend()
function CPlayer:new(_sprite)
  self.super.new(self, _sprite)
end



Goliath = CPlayer()

print(":Goliath 1:")
print(Goliath:_size())
print(table.unpack(Goliath:_keys()))
print(table.unpack(Goliath:_vals()))
-- for _, _key in pairs(Goliath) do --TODO something weird with copy ... insert also values as keys ?
--   print(_key, Goliath[_key])
-- end
-- print("Copy")
-- GoliathCopy = Goliath:_copy()
-- print(table.unpack(GoliathCopy))
-- print("Copy")
-- for _, _key in pairs(GoliathCopy) do --TODO something weird with copy ... insert also values as keys ?
--   print(_key, GoliathCopy[_key])
-- end
print(":Goliath 2:")
Goliath:argt({
  x = 20,
  y = 30,
  age = 180,
  sprite = 10,
})
print(Goliath:_size())
print(table.unpack(Goliath:_keys()))
print(table.unpack(Goliath:_vals()))
print(":Goliath 3:")
Goliath:argt({
  y = 300,
  x = 200,
  sprite = 100,
  age = 1800,
  race = "Gogol",
})
print(Goliath:_size())
print(table.unpack(Goliath:_keys()))
print(table.unpack(Goliath:_vals()))
