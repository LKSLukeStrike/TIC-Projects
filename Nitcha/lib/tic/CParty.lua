--
-- CParty
--
CParty = Classic:extend() -- generic party
Classic.KINDPARTY = "Party"
Classic.NAMEPARTY = "Party"
CParty.STATS      = {statphymax, statmenmax, statpsymax, Tic.STATPHYACT, statmenact, statpsyact}
function CParty:new(_argt)
    CParty.super.new(self, _argt)
    self.classic = CParty
    self.kind    = Classic.KINDPARTY
    self.name    = Classic.NAMEPARTY
    --
    self.statphymax   = 0 -- max stats -- 0-Tic.STATMAX
    self.statmenmax   = 0
    self.statpsymax   = 0
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self.leader       = nil
    self.members      = {}
    --
    self:argt(_argt) -- override if any
end

function CParty:adjustStats()
    for _, _stat in ipairs(Tic.STATS) do -- reset stats
        self[_stat] = 0
        for _, _member in ipairs(self.members) do
            self[_stat] = Nums:max(self[_stat], _member[_stat])
        end
    end
end
