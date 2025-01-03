-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Classic = require("libraries/ext/Classic")


ClassicCharacter = Classic:extend()
function ClassicCharacter:new()
  self.sprite = 400
  self.x = 200
  self.y = 100
end

ClassicPlayer = ClassicCharacter:extend()
-- function ClassicPlayer:new()
--   ClassicCharacter.super:new()
-- end


ClassicNitcha = ClassicPlayer:extend()
function ClassicNitcha:new()
  ClassicPlayer.super:new()
  self.sprite = self.sprite + 1000
end

Nitcha = ClassicNitcha()

print("Hello World")
print(Nitcha.sprite, Nitcha.x, Nitcha.y)