Classic = require("Classic")


Character = Classic:extend()
Friendly  = Character:extend()
Neutral   = Character:extend()
Ennemy    = Character:extend()

Nitcha    = Character:extend()

function Nitcha:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

local _nitcha = Nitcha(10, 20)

print("Hello World")
print(_nitcha.x, _nitcha.y)