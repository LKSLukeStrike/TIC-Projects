-- CShape classic
-- Instance only once
-- Contains constants, globals and general functions
-- 


--
-- Packages
local Classic = require("libraries/ext/Classic")                
local Nums = require("libraries/lks/Nums")
            

--
-- CShape
--
CShape = Classic:extend() -- general shape
CShape.ORIGX = 0 -- initial screen x and y
CShape.ORIGY = 0
CShape.COLORWHITE = 12 -- default color
CShape.SCALE01 = 01 -- default scale
function CShape:new(_argt)
    CShape.super.new(self, _argt)
    self.origx  = CShape.ORIGX
    self.origy  = CShape.ORIGY
    self.color  = CShape.COLORWHITE
    self.scalex = CShape.SCALE01
    self.scaley = CShape.SCALE01
    self:_argt(_argt) -- override if any
end

function CShape:draw()
    rect(self.origx, self.origy, self.scale, self.scale, self.color)
end
