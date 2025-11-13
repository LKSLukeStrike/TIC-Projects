require("lib/tic/CPlace")
--
-- CPlaceStone
--
CPlaceStone = CPlace:extend() -- stones
Classic.KINDPLACESTONE = "Stone"
CPlaceStone.PALETTEIDLE   = {
    [CPlace.MOON]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.STONEBG,
    [CPlace.FLOOR02] = CPlace.FOAM,
    [CPlace.DOOR]    = CPlace.STONEFG,
    [CPlace.FOAM]    = CPlace.FOAM,
}
CPlaceStone.PALETTEFADE   = {
    [CPlace.MOON]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.STONEBG,
    [CPlace.FLOOR02] = CPlace.STONEBG,
    [CPlace.DOOR]    = CPlace.STONEFG,
    [CPlace.FOAM]    = CPlace.STONEBG,
}
function CPlaceStone:new(_argt)
    CPlaceStone.super.new(self, _argt)
    self.kind = Classic.KINDPLACESTONE
    self.name = Classic.NAMEFITFUL
    self.hitbox      = CHitbox{entity = self, lf = 2, rg = 4, up = 6, dw = 7}
    self.palettefade = CPlaceStone.PALETTEFADE
    self:argt(_argt)
end


--
-- CPlaceMenhr
--
CPlaceMenhr = CPlaceStone:extend() -- menhrs
Classic.KINDPLACEMENHR = "Menhr"
function CPlaceMenhr:new(_argt)
    CPlaceMenhr.super.new(self, _argt)
    self.kind = Classic.KINDPLACEMENHR
    self.sprite      = CSpriteBG.PLACEMENHR
    self:argt(_argt)
end

CPlaceMenhrAnim = CPlaceMenhr:extend() -- anim menhrs
function CPlaceMenhrAnim:new(_argt)
    CPlaceMenhrAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt)
end

CPlaceMenhrIdle = CPlaceMenhr:extend() -- idle menhrs
function CPlaceMenhrIdle:new(_argt)
    CPlaceMenhrIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt)
end

CPlaceMenh0Anim = CPlaceMenhrAnim:extend() -- anim menh0
function CPlaceMenh0Anim:new(_argt)
    CPlaceMenh0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt)
end

CPlaceMenh0Idle = CPlaceMenhrIdle:extend() -- idle menh0
function CPlaceMenh0Idle:new(_argt)
    CPlaceMenh0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt)
end

CPlaceMenh1Anim = CPlaceMenhrAnim:extend() -- anim menh1
function CPlaceMenh1Anim:new(_argt)
    CPlaceMenh1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt)
end

CPlaceMenh1Idle = CPlaceMenhrIdle:extend() -- idle menh1
function CPlaceMenh1Idle:new(_argt)
    CPlaceMenh1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt)
end


--
-- CPlaceDolmn
--
CPlaceDolmn = CPlaceStone:extend() -- dolmns
Classic.KINDPLACEDOLMN = "Dolmn"
function CPlaceDolmn:new(_argt)
    CPlaceDolmn.super.new(self, _argt)
    self.kind = Classic.KINDPLACEDOLMN
    self.sprite = CSpriteBG.PLACEDOLMN
    self.hitbox = CHitbox{entity = self, lf = 1, rg = 4, up = 6, dw = 7}
    self:argt(_argt)
end

CPlaceDolmnAnim = CPlaceDolmn:extend() -- anim dolmns
function CPlaceDolmnAnim:new(_argt)
    CPlaceDolmnAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt)
end

CPlaceDolmnIdle = CPlaceDolmn:extend() -- idle dolmns
function CPlaceDolmnIdle:new(_argt)
    CPlaceDolmnIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt)
end

CPlaceDolm0Anim = CPlaceDolmnAnim:extend() -- anim dolm0
function CPlaceDolm0Anim:new(_argt)
    CPlaceDolm0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt)
end

CPlaceDolm0Idle = CPlaceDolmnIdle:extend() -- idle dolm0
function CPlaceDolm0Idle:new(_argt)
    CPlaceDolm0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt)
end

CPlaceDolm1Anim = CPlaceDolmnAnim:extend() -- anim dolm1
function CPlaceDolm1Anim:new(_argt)
    CPlaceDolm1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt)
end

CPlaceDolm1Idle = CPlaceDolmnIdle:extend() -- idle dolm1
function CPlaceDolm1Idle:new(_argt)
    CPlaceDolm1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt)
end


--
-- CPlaceCirkl
--
CPlaceCirkl = CPlaceStone:extend() -- cirkls
Classic.KINDPLACECIRKL = "Cirkl"
function CPlaceCirkl:new(_argt)
    CPlaceCirkl.super.new(self, _argt)
    self.kind = Classic.KINDPLACECIRKL
    self.sprite = CSpriteBG.PLACECIRKL
    self.hitbox = CHitbox{entity = self, lf = 3, rg = 4, up = 6, dw = 7}
    self:argt(_argt)
end

CPlaceCirklAnim = CPlaceCirkl:extend() -- anim cirkls
function CPlaceCirklAnim:new(_argt)
    CPlaceCirklAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt)
end

CPlaceCirklIdle = CPlaceCirkl:extend() -- idle cirkls
function CPlaceCirklIdle:new(_argt)
    CPlaceCirklIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt)
end

CPlaceCirk0Anim = CPlaceCirklAnim:extend() -- anim cirk0
function CPlaceCirk0Anim:new(_argt)
    CPlaceCirk0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt)
end

CPlaceCirk0Idle = CPlaceCirklIdle:extend() -- idle cirk0
function CPlaceCirk0Idle:new(_argt)
    CPlaceCirk0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt)
end

CPlaceCirk1Anim = CPlaceCirklAnim:extend() -- anim cirk1
function CPlaceCirk1Anim:new(_argt)
    CPlaceCirk1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt)
end

CPlaceCirk1Idle = CPlaceCirklIdle:extend() -- idle cirk1
function CPlaceCirk1Idle:new(_argt)
    CPlaceCirk1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt)
end


--
-- CPlaceRoads
--
CPlaceRoads = CPlaceStone:extend() -- roads
Classic.KINDPLACEROADS = "Roads"
function CPlaceRoads:new(_argt)
    CPlaceRoads.super.new(self, _argt)
    self.kind = Classic.KINDPLACEROADS
    self.sprite      = CSpriteBG.PLACEROADS
    self.hitbox = nil
    self:argt(_argt)
end

CPlaceRoadsAnim = CPlaceRoads:extend() -- anim roads
function CPlaceRoadsAnim:new(_argt)
    CPlaceRoadsAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt)
end

CPlaceRoadsIdle = CPlaceRoads:extend() -- idle roads
function CPlaceRoadsIdle:new(_argt)
    CPlaceRoadsIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt)
end

CPlaceRoad0Anim = CPlaceRoadsAnim:extend() -- anim road0
function CPlaceRoad0Anim:new(_argt)
    CPlaceRoad0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt)
end

CPlaceRoad0Idle = CPlaceRoadsIdle:extend() -- idle road0
function CPlaceRoad0Idle:new(_argt)
    CPlaceRoad0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt)
end

CPlaceRoad1Anim = CPlaceRoadsAnim:extend() -- anim road1
function CPlaceRoad1Anim:new(_argt)
    CPlaceRoad1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt)
end

CPlaceRoad1Idle = CPlaceRoadsIdle:extend() -- idle road1
function CPlaceRoad1Idle:new(_argt)
    CPlaceRoad1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt)
end

