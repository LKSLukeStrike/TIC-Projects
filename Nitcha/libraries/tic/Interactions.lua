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
    self.interactiflf = function(self, _by, _to) return true end
    self.interactdolf = function() Tic:characterFunction(nil, "sayMessage", {message = "Hi"}) end
    self:argt(_argt) -- override if any
end
