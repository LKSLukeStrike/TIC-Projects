require("libraries/ext/Classic")
--
-- CAnimation
--
CAnimation = Classic:extend() -- generic palette animation for entities
Classic.KINDANIMATION = "Animation"
Classic.NAMEANIMATION = "Animation"
function CAnimation:new(_argt)
    CAnimation.super.new(self, _argt)
    self.kind = Classic.KINDANIMATION
    self.name = Classic.NAMEANIMATION
    self.frequence = Tic.FREQUENCE0060
    self.percent0  = 0.5
    self.palette0  = {}
    self.palette1  = {}
    self:argt(_argt) -- override if any
end
