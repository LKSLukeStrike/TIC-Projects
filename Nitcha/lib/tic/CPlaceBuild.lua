require("lib/tic/CPlace")
--
-- CPlaceBuild
--
CPlaceBuild = CPlace:extend() -- builds
Classic.KINDPLACEBUILD = "Build"
CPlaceBuild.PALETTEIDLE  = {
    [CPlace.SMOKE]    = CPlace.EMPTY,
    [CPlace.WINDOW01] = CPlace.WALLS,
    [CPlace.WINDOW02] = CPlace.WALLS,
    [CPlace.DOOR]     = CPlace.FACADE,
    [CPlace.ROOF]     = CPlace.FOAM,
    [CPlace.FOAM]     = CPlace.FOAM,
}
CPlaceBuild.PALETTEFADE  = {
    [CPlace.SMOKE]    = CPlace.EMPTY,
    [CPlace.WINDOW01] = CPlace.WALLS,
    [CPlace.WINDOW02] = CPlace.WALLS,
    [CPlace.DOOR]     = CPlace.FACADE,
    [CPlace.ROOF]     = CPlace.WALLS,
    [CPlace.FOAM]     = CPlace.WALLS,
}
function CPlaceBuild:new(_argt)
    CPlaceBuild.super.new(self, _argt)
    self.classic = CPlaceBuild
    self.kind = Classic.KINDPLACEBUILD
    self.name = Classic.NAMEANIMED
    self.hitbox      = CHitbox{entity = self, lf = 2, rg = 4, up = 5, dw = 7}
    self.palettefade = CPlaceBuild.PALETTEFADE
    self:argt(_argt)
end


--
-- CPlaceHouse
--
CPlaceHouse = CPlaceBuild:extend() -- houses
Classic.KINDPLACEHOUSE = "House"
function CPlaceHouse:new(_argt)
    CPlaceHouse.super.new(self, _argt)
    self.classic = CPlaceHouse
    self.kind = Classic.KINDPLACEHOUSE
    self.sprite      = CSpriteBG.PLACEHOUSE
    self:argt(_argt)
end

CPlaceHouseAnim = CPlaceHouse:extend() -- anim houses
function CPlaceHouseAnim:new(_argt)
    CPlaceHouseAnim.super.new(self, _argt)
    self.classic = CPlaceHouseAnim
    self.animations = {
        CAnimation{ -- smoke
            frequence = Tic.FREQUENCE0300,
            percent0  = 0.9,
            palette0  = {[CPlace.SMOKE] = CPlace.SMOKE,},
            palette1  = {[CPlace.SMOKE] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt)
end

CPlaceHouseIdle = CPlaceHouse:extend() -- idle houses
function CPlaceHouseIdle:new(_argt)
    CPlaceHouseIdle.super.new(self, _argt)
    self.classic = CPlaceHouseIdle
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end


--
-- CPlaceTower
--
CPlaceTower = CPlaceBuild:extend() -- towers
Classic.KINDPLACETOWER = "Tower"
function CPlaceTower:new(_argt)
    CPlaceTower.super.new(self, _argt)
    self.kind = Classic.KINDPLACETOWER
    self.sprite  = CSpriteBG.PLACETOWER
    self:argt(_argt)
end

CPlaceTowerAnim = CPlaceTower:extend() -- anim towers
function CPlaceTowerAnim:new(_argt)
    CPlaceTowerAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt)
end

CPlaceTowerIdle = CPlaceTower:extend() -- idle towers
function CPlaceTowerIdle:new(_argt)
    CPlaceTowerIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end


--
-- CPlaceManor
--
CPlaceManor = CPlaceBuild:extend() -- manors
Classic.KINDPLACEMANOR = "Manor"
function CPlaceManor:new(_argt)
    CPlaceManor.super.new(self, _argt)
    self.kind = Classic.KINDPLACEMANOR
    self.sprite  = CSpriteBG.PLACEMANOR
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt)
end

CPlaceManorAnim = CPlaceManor:extend() -- anim manors
function CPlaceManorAnim:new(_argt)
    CPlaceManorAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- smoke
            frequence = Tic.FREQUENCE0300,
            percent0  = 0.9,
            palette0  = {[CPlace.SMOKE] = CPlace.SMOKE,},
            palette1  = {[CPlace.SMOKE] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.9,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.5,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt)
end

CPlaceManorIdle = CPlaceManor:extend() -- idle manors
function CPlaceManorIdle:new(_argt)
    CPlaceManorIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end


--
-- CPlaceKirke
--
CPlaceKirke = CPlaceBuild:extend() -- kirkes
Classic.KINDPLACEKIRKE = "Kirke"
function CPlaceKirke:new(_argt)
    CPlaceKirke.super.new(self, _argt)
    self.kind = Classic.KINDPLACEKIRKE
    self.sprite  = CSpriteBG.PLACEKIRKE
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt)
end

CPlaceKirkeAnim = CPlaceKirke:extend() -- anim kirkes
function CPlaceKirkeAnim:new(_argt)
    CPlaceKirkeAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS,},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORGLASS01,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS,},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORGLASS02,},
        },
    }
    self:argt(_argt)
end

CPlaceKirkeIdle = CPlaceKirke:extend() -- idle kirkes
function CPlaceKirkeIdle:new(_argt)
    CPlaceKirkeIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end


--
-- CPlaceWater
--
CPlaceWater = CPlaceBuild:extend() -- waters
Classic.KINDPLACEWATER = "Water"
function CPlaceWater:new(_argt)
    CPlaceWater.super.new(self, _argt)
    self.kind = Classic.KINDPLACEWATER
    self.sprite  = CSpriteBG.PLACEWATER
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt)
end

CPlaceWaterAnim = CPlaceWater:extend() -- anim waters
function CPlaceWaterAnim:new(_argt)
    CPlaceWaterAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- water 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.WATER01] = CPlace.COLORWATER01,},
            palette1  = {[CPlace.WATER01] = CPlace.COLORWATER02,},
        },
        CAnimation{ -- water 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.WATER02] = CPlace.COLORWATER01,},
            palette1  = {[CPlace.WATER02] = CPlace.COLORWATER02,},
        },
    }
    self:argt(_argt)
end

CPlaceWaterIdle = CPlaceWater:extend() -- idle waters
function CPlaceWaterIdle:new(_argt)
    CPlaceWaterIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end


--
-- CPlaceStall
--
CPlaceStall = CPlaceBuild:extend() -- stalls
Classic.KINDPLACESTALL = "Stall"
function CPlaceStall:new(_argt)
    CPlaceStall.super.new(self, _argt)
    self.kind = Classic.KINDPLACESTALL
    self.sprite  = CSpriteBG.PLACESTALL
    self.hitbox  = CHitbox{entity = self, lf = 0, rg = 3, up = 5, dw = 7}
    self:argt(_argt)
end

CPlaceStallAnim = CPlaceStall:extend() -- anim stalls
function CPlaceStallAnim:new(_argt)
    CPlaceStallAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- owner
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.OWNER] = Tic.COLORWHITE,},
            palette1  = {[CPlace.OWNER] = Tic.COLORKEY,},
        },
        CAnimation{ -- goods 1
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.GOODS01] = CPlace.COLORGOODS01,},
            palette1  = {[CPlace.GOODS01] = CPlace.COLORGOODS02,},
        },
        CAnimation{ -- goods 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.GOODS02] = CPlace.COLORGOODS01,},
            palette1  = {[CPlace.GOODS02] = CPlace.COLORGOODS02,},
        },
    }
    self:argt(_argt)
end

CPlaceStallIdle = CPlaceStall:extend() -- idle stalls
function CPlaceStallIdle:new(_argt)
    CPlaceStallIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt)
end
