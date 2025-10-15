require("lib/tic/CCharacter")
--
-- CCharacterParty
--
CCharacterParty = CCharacter:extend() -- generic characterparty
Classic.KINDCHARACTERPARTY = "Party"
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

function CCharacterParty:draw() -- draw leader and party effect
    self:drawLeader()
    self:drawParty()
end

function CCharacterParty:drawLeader()
    self.leader:argt{
        world  = self.world,
        worldx = self.worldx,
        worldy = self.worldy,
    }
    self.leader:draw()
end

function CCharacterParty:drawParty()
    local _posture = self:postureGet()
    local _offsety = 3
    if _posture == Tic.POSTUREFLOOR then
        _offsety = _offsety + 3
    else
        _offsety = _offsety + self.size + self.frame
    end

    local _coloreyesfg = Tic.COLORSKIN
    local _coloreyesbu = Tic.COLORSKIN
    local _coloreyesbm = Tic.COLORSKIN
    local _coloreyesbd = Tic.COLORSKIN

    if _posture == Tic.POSTUREFLOOR then
        _coloreyesbm = self.coloreyesbg
    else
        _coloreyesfg = self.coloreyesfg
        if self.diry == Tic.DIRYUP then -- up
            _coloreyesbu = self.coloreyesbg
        elseif self.diry == Tic.DIRYMD then -- md
            _coloreyesbm = self.coloreyesbg
        else -- dw
            _coloreyesbd = self.coloreyesbg
        end
    end
   
    self.musprite:init()
    self.musprite.sprite  = CSpriteFG.EFFECTPARTY
    self.musprite.screenx = self.screenx
    self.musprite.screeny = self.screeny
    self.musprite.offsety = _offsety
    self.musprite.flip    = self.dirx
    self.musprite.scale   = self.scale
    self.musprite.palette = {
        -- [Tic.COLORGREYM]  = self.colorhairsbg,
        [Tic.COLORPURPLE] = _coloreyesbu,
        [Tic.COLORRED]    = _coloreyesbm,
        [Tic.COLORORANGE] = _coloreyesbd,
        [Tic.COLORYELLOW] = _coloreyesfg,
    }
    self.musprite:draw()
end

function CCharacterParty:leadCharacter(_character)
    if not _character then return end -- mandatory
    _character:delete()
    self.leader.world = _character
    self.leader:draw()
end
