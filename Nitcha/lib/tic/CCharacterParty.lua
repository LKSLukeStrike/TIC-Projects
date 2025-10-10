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
    self.statphymax   = 10 -- max stats -- 0-Tic.STATSMAX
    self.statmenmax   = 10
    self.statpsymax   = 10
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self.leader       = nil
    self.members      = {}
    --
    self:argt(_argt) -- override if any
end

