--
-- CParty
--
CParty = Classic:extend() -- generic party
Classic.KINDPARTY = "Party"
Classic.NAMEPARTY = "Party"
function CParty:new(_argt)
    CParty.super.new(self, _argt)
    self.classic = CParty
    self.kind    = Classic.KINDPARTY
    self.name    = Classic.NAMEPARTY
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

function CParty:lead(_)
    if not _ then return end -- mandatory
    _:remove()
    self.leader.world = _
    self.leader:draw()
end
