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
    self:argt(_argt)
end

CInteractionSayMessage = CInteraction:extend() -- SayMessage interaction
CInteraction.INTERACTDOSAYMESSAGE = function() return Tic:characterFunction(nil, "doSayMessage", {message = "Hi"}) end
function CInteractionSayMessage:new(_argt)
    CInteractionSayMessage.super.new(self, _argt)
    self.text = Tic.TEXTSAY
    self.interactdolf = CInteraction.INTERACTDOSAYMESSAGE
    self:argt(_argt)
end

CInteractionPickObject = CInteraction:extend() -- PickObject interaction
CInteraction.INTERACTIFPICKOBJECT = function() return Tic:characterFunction(nil, "ifPickObject") end
CInteraction.INTERACTDOPICKOBJECT = function() return Tic:characterFunction(nil, "doPickObject") end
function CInteractionPickObject:new(_argt)
    CInteractionPickObject.super.new(self, _argt)
    self.text = Tic.TEXTPICK
    self.interactiflf = CInteraction.INTERACTIFPICKOBJECT
    self.interactdolf = CInteraction.INTERACTDOPICKOBJECT
    self:argt(_argt)
end

CInteractionJoinParty = CInteraction:extend() -- JoinParty interaction
CInteraction.INTERACTIFJOINPARTY = function() return Tic:characterFunction(nil, "ifJoinParty") end
CInteraction.INTERACTDOJOINPARTY = function() return Tic:characterFunction(nil, "doJoinParty") end
function CInteractionJoinParty:new(_argt)
    CInteractionJoinParty.super.new(self, _argt)
    self.text = Tic.TEXTJOIN
    -- self.interactiflf = CInteraction.INTERACTIFJOINPARTY
    self.interactdolf = CInteraction.INTERACTDOJOINPARTY
    self:argt(_argt)
end
