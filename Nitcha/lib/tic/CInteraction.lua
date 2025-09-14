--
-- CInteraction
--
CInteraction = Classic:extend() -- generic interaction for entities
Classic.KINDINTERACTION = "Interaction"
Classic.NAMEINTERACTION = "Interaction"
CInteraction.INTERACTIFDEFAULT = function(self, _by, _to) return true end
CInteraction.INTERACTDODEFAULT = function() return end
function CInteraction:new(_argt)
    CInteraction.super.new(self, _argt)
    self.kind = Classic.KINDINTERACTION
    self.name = Classic.NAMEINTERACTION
    self.text = Tic.TEXTDEFAULT
    self.interactiflf = CInteraction.INTERACTIFDEFAULT
    self.interactdolf = CInteraction.INTERACTDODEFAULT
    self:argt(_argt) -- override if any
end

CInteractionSayMessage = CInteraction:extend() -- SayMessage interaction
CInteraction.INTERACTDOSAYMESSAGE = function() return Tic:characterFunction(nil, "doSayMessage", {message = "Hi"}) end
function CInteractionSayMessage:new(_argt)
    CInteractionSayMessage.super.new(self, _argt)
    self.text = Tic.TEXTSAY
    self.interactdolf = CInteraction.INTERACTDOSAYMESSAGE
    self:argt(_argt) -- override if any
end

CInteractionPickObject = CInteraction:extend() -- PickObject interaction
CInteraction.INTERACTIFPICKOBJECT = function() return Tic:characterFunction(nil, "ifPickObject") end
CInteraction.INTERACTDOPICKOBJECT = function() return Tic:characterFunction(nil, "doPickObject") end
function CInteractionPickObject:new(_argt)
    CInteractionPickObject.super.new(self, _argt)
    self.text = Tic.TEXTPICK
    self.interactiflf = CInteraction.INTERACTIFPICKOBJECT
    self.interactdolf = CInteraction.INTERACTDOPICKOBJECT
    self:argt(_argt) -- override if any
end

CInteractionJoinTroop = CInteraction:extend() -- JoinTroop interaction
CInteraction.INTERACTIFJOINTROOP = function() return Tic:characterFunction(nil, "ifJoinTroop") end
CInteraction.INTERACTDOJOINTROOP = function() return Tic:characterFunction(nil, "doJoinTroop") end
function CInteractionJoinTroop:new(_argt)
    CInteractionJoinTroop.super.new(self, _argt)
    self.text = Tic.TEXTJOIN
    -- self.interactiflf = CInteraction.INTERACTIFJOINTROOP
    self.interactdolf = CInteraction.INTERACTDOJOINTROOP
    self:argt(_argt) -- override if any
end
