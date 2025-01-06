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
Goliath = CPlayer(123)
Goliath.y = 200

print("Hello World")
print(Nitcha.sprite, Nitcha.x, Nitcha.y)
print(Goliath.sprite, Goliath.x, Goliath.y)
