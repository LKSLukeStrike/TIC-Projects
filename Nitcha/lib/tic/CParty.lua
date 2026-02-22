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
    self.statphymax   = 0 -- max stats -- 0-Tic.STATMAX
    self.statmenmax   = 0
    self.statpsymax   = 0
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self.leader       = nil
    self.members      = {}
    --
    self:argt(_argt)
end

function CParty:argt(_argt)
    CParty.super.argt(self, _argt)
    if not self.leader then -- ensure a leader
        if self.members[1] then self.leader = self.members[1] else return end -- pick a leader in members or exit
    end

    Tables:valInsert(self.members, self.leader, Tables.ONE) -- ensure that leader is part of members
    for _, _member in ipairs(self.members) do -- set the members party
        _member.party = self
        if not (_member == self.leader) then -- remove members from the world except leader
            _member:remove()
        end
    end

    self:adjustStats()
end

function CParty:hasMembers()
    return Tables:size(self.members) > 0
end

function CParty:hasMember(_member)
    return Tables:valFind(self.members, _member)
end

function CParty:adjustStats() -- adjust stats to the members max
    if not self:hasMembers() then return end -- no members

    for _, _stat in ipairs(Tic.STATS) do
        self[_stat] = 0
        for _, _member in ipairs(self.members) do
            self[_stat] = Nums:max(self[_stat], _member[_stat])
        end
    end
end

function CParty:leadMember(_member, _showmessage)
    if (not _member) or (self.leader == _member) or (not self:hasMember(_member)) then return end

    self:applyLeaderToMember(_member)
    self.leader:remove()
    self.leader = _member
    self.leader:append()

    if _showmessage then
        Tic:messageAppend(_member:nameGet().." "..Tic.TEXTLEAD..": ".._member:nameGet().." ".._member:kindGet())
    end
    return self
end

function CParty:joinMember(_member, _showmessage)
    if not _member then return end
    if _member:isParty() then return self:joinParty(_member.party, _showmessage) end
    Tables:valInsert(self.members, _member, Tables.ONE)
    _member.party = self
    _member:remove()
    self:adjustStats()
    if _showmessage then
        Tic:messageAppend(_member:nameGet().." "..Tic.TEXTJOIN..": "..self.leader:nameGet().." "..self.leader:kindGet())
    end
    return self
end

function CParty:joinParty(_party, _showmessage)
    if not _party then return end -- mandatory

    for _, _member in ipairs(_party.members) do
        _member.party = nil
        self:joinMember(_member, _showmessage)
    end
    _party = nil -- useless ?
    return self
end

function CParty:applyLeaderToMember(_member)
    if not _member or not self.leader then return end -- mandatory

    _member.world     = self.leader.world
    _member.worldx    = self.leader.worldx
    _member.worldy    = self.leader.worldy
    _member.frame     = self.leader.frame
    _member.dirx      = self.leader.dirx
    _member.diry      = self.leader.diry
    _member.direction = self.leader.direction
    _member.state     = self.leader.state
end
