require("lib/tic/CPlace")
--
-- CPlaceTrees
--
CPlaceTrees = CPlace:extend() -- trees
Classic.KINDPLACETREES = "Trees"
CPlaceTrees.PALETTEIDLE   = {
    [CPlace.NEST]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.BARK,
    [CPlace.FLOOR02] = CPlace.BARK,
    [CPlace.LEAFSFG] = CPlace.LEAFSBG,
    [CPlace.LEAFSBG] = CPlace.BARK,
}
CPlaceTrees.PALETTEFADE   = {
    [CPlace.NEST]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.BARK,
    [CPlace.FLOOR02] = CPlace.BARK,
    [CPlace.LEAFSFG] = CPlace.TRUNK,
    [CPlace.LEAFSBG] = CPlace.BARK,
}
function CPlaceTrees:new(_argt)
    CPlaceTrees.super.new(self, _argt)
    self.kind = Classic.KINDPLACETREES
    self.name = Classic.NAMELIVING
    self.hitbox       = CHitbox{entity = self, lf = 2, rg = 4, up = 6, dw = 7}
    self.palettefade = CPlaceTrees.PALETTEFADE
    self:argt(_argt)
end

CPlaceTreesAnim = CPlaceTrees:extend() -- generic anim trees
function CPlaceTreesAnim:new(_argt)
    CPlaceTreesAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- nest
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.NEST] = CPlace.TRUNK,},
            palette1  = {[CPlace.NEST] = CPlace.COLORNEST,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.5,
            palette0  = {[CPlace.FLOOR01] = CPlace.TRUNK,},
            palette1  = {[CPlace.FLOOR01] = CPlace.COLORFLOOR01,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.BARK,},
            palette1  = {[CPlace.FLOOR02] = CPlace.COLORFLOOR02,},
        },
    }
    self:argt(_argt)
end

CPlaceTreesIdle = CPlaceTrees:extend() -- generic idle trees
function CPlaceTreesIdle:new(_argt)
    CPlaceTreesIdle.super.new(self, _argt)
    self.name = Classic.NAMEDYING
    self.palette = CPlaceTrees.PALETTEIDLE
    self:argt(_argt)
end

CPlaceTree0Anim = CPlaceTreesAnim:extend() -- anim tree0
function CPlaceTree0Anim:new(_argt)
    CPlaceTree0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt)
end

CPlaceTree0Idle = CPlaceTreesIdle:extend() -- idle tree0
function CPlaceTree0Idle:new(_argt)
    CPlaceTree0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt)
end

CPlaceTree1Anim = CPlaceTreesAnim:extend() -- anim tree1
function CPlaceTree1Anim:new(_argt)
    CPlaceTree1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt)
end

CPlaceTree1Idle = CPlaceTreesIdle:extend() -- idle tree1
function CPlaceTree1Idle:new(_argt)
    CPlaceTree1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt)
end

