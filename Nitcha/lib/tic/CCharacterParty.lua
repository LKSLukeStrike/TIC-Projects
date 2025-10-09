require("lib/tic/CCharacter")
--
-- CCharacterParty
--
CCharacterParty = CCharacter:extend() -- generic characterparty
Classic.KINDCHARACTERPARTY = "CharacterParty"
Classic.NAMECHARACTERPARTY = "CharacterParty"
function CCharacterParty:new(_argt)
    CCharacterParty.super.new(self, _argt)
    self.classic = CCharacterParty
    self.kind    = Classic.KINDCHARACTERPARTY
    self.name    = Classic.NAMECHARACTERPARTY
    --
    --
    self:argt(_argt) -- override if any
end

