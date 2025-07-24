--
-- CInteraction
--
CInteraction = Classic:extend() -- generic interaction for entities
Classic.KINDINTERACTION = "Interaction" -- Interaction kind
Classic.NAMEINTERACTION = "Interaction" -- Interaction name
function CInteraction:new(_argt)
    CInteraction.super.new(self, _argt)
    self.kind = Classic.KINDINTERACTION
    self.name = Classic.NAMEINTERACTION
    self.text = "Hello"
    self.interactif = function(self, _by, _to) return true end
    self.interactdo = function(self, _by, _to) Tic:logAppend(_by.name..": "..self.text.." ".._to.name) end
    self:argt(_argt) -- override if any
end
