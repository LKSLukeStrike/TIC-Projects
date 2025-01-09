-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")


CCharacter = Classic:extend()
function CCharacter:new(_sprite)
  self.sprite = _sprite or 400
  self.x = 200
  self.y = 100
end

CPlayer = CCharacter:extend()
function CPlayer:new(_sprite)
  self.super.new(self, _sprite)
end



Nitcha = CPlayer(2000)
Goliath = CPlayer(1000)
Goliath.x = 10
Goliath.y = 20

print("Hello World")
print(Nitcha.sprite, Nitcha.x, Nitcha.y)
print(Goliath.sprite, Goliath.x, Goliath.y)
print("Goliath")
print(Goliath:_size())
print(table.unpack(Goliath:_keys()))
print(table.unpack(Goliath:_vals()))
for _, _key in pairs(Goliath) do --TODO something weird with copy ... insert also values as keys ?
  print(_key, Goliath[_key])
end
print("Copy")
GoliathCopy = Goliath:_copy()
print(table.unpack(GoliathCopy))
print("Copy")
for _, _key in pairs(GoliathCopy) do --TODO something weird with copy ... insert also values as keys ?
  print(_key, GoliathCopy[_key])
end
