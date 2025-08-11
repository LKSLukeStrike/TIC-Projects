require("libraries/ext/Classic")
--
-- CInteraction
--
CInteraction = Classic:extend() -- generic interaction for entities
Classic.KINDINTERACTION = "Interaction"
Classic.NAMEINTERACTION = "Interaction"
CInteraction.NTERACTIFDEFAULT = function(self, _by, _to) return true end
CInteraction.NTERACTDODEFAULT = function() return end
function CInteraction:new(_argt)
    CInteraction.super.new(self, _argt)
    self.kind = Classic.KINDINTERACTION
    self.name = Classic.NAMEINTERACTION
    self.text = Tic.TEXTDEFAULT
    self.interactiflf = CInteraction.NTERACTIFDEFAULT
    self.interactdolf = CInteraction.NTERACTDODEFAULT
    self:argt(_argt) -- override if any
end

CInteractionSayMessage = CInteraction:extend() -- SayMessage interaction
CInteraction.NTERACTDOSAYMESSAGE = function() return Tic:characterFunction(nil, "doSayMessage", {message = "Hi"}) end
function CInteractionSayMessage:new(_argt)
    CInteractionSayMessage.super.new(self, _argt)
    self.text = Tic.TEXTSAY
    self.interactdolf = CInteraction.NTERACTDOSAYMESSAGE
    self:argt(_argt) -- override if any
end

CInteractionPickObject = CInteraction:extend() -- PickObject interaction
CInteraction.NTERACTIFPICKOBJECT = function() return Tic:characterFunction(nil, "ifPickObject") end
CInteraction.NTERACTDOPICKOBJECT = function() return Tic:characterFunction(nil, "doPickObject") end
function CInteractionPickObject:new(_argt)
    CInteractionPickObject.super.new(self, _argt)
    self.text = Tic.TEXTPICK
    self.interactiflf = CInteraction.NTERACTIFPICKOBJECT
    self.interactdolf = CInteraction.NTERACTDOPICKOBJECT
    self:argt(_argt) -- override if any
end
