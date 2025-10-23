require("lib/tic/CCharacter")
require("lib/tic/ICharacterHumanoid")
--
-- CPlayer
--
CPlayer = CCharacter:extend() -- player characters
function CPlayer:new(_argt)
    CPlayer.super.new(self, _argt)
    self.classic = CPlayer
    --
    self.hoverbutton  = CButtonEntityHoverLockPick{entity = self, colorborder = Tic.COLORGREEND} -- hover lock pick button
    --
    self:argt(_argt) -- override if any
    self:append()
end

function CPlayer:append()
    CPlayer.super.append(self)
    Tic:playerAppend(self) -- record the new player on tic
end

function CPlayer:remove()
    CPlayer.super.remove(self)
    Tic:playerRemove(self) -- remove player from tic
end


--
-- CPlayerHumanoid
--
CPlayerHumanoid = CPlayer:extend() -- humanoid player characters
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self.classic = CPlayerHumanoid
    --
    --
    self:argt(_argt) -- override if any
    self:implementall(ICharacterHumanoid)
end


CPlayerHuman = CPlayerHumanoid:extend() -- Human player characters
Classic.KINDHUMAN = "Human"
function CPlayerHuman:new(_argt)
    CPlayerHuman.super.new(self, _argt)
    self.classic = CPlayerHuman
    self.kind    = Classic.KINDHUMAN
    --
    self.size         = Tic.SIZEM -- size
    self.colorhairsfg = Tic.COLORORANGE -- colors
    self.colorhairsbg = Tic.COLORRED
    self.headsprite   = CSpriteFG.HEADHUMAN -- head
    self.statphymax   = 5
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
Classic.KINDDWARF = "Dwarf"
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.classic = CPlayerDwarf
    self.kind    = Classic.KINDDWARF
    --
    self.size         = Tic.SIZES -- size
    self.colorhairsfg = Tic.COLORRED -- colors
    self.colorhairsbg = Tic.COLORORANGE
    self.headsprite   = CSpriteFG.HEADDWARF -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
Classic.KINDGNOME = "Gnome"
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.classic = CPlayerGnome
    self.kind    = Classic.KINDGNOME
    --
    self.size         = Tic.SIZES -- size
    self.colorhairsfg = Tic.COLORORANGE -- colors
    self.colorhairsbg = Tic.COLORYELLOW
    self.colorpants   = self.colorskin
    self.headsprite   = CSpriteFG.HEADGNOME -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerElvwe = CPlayerHumanoid:extend() -- Elvwe player characters
Classic.KINDELVWE = "Elvwe"
function CPlayerElvwe:new(_argt)
    CPlayerElvwe.super.new(self, _argt)
    self.classic = CPlayerElvwe
    self.kind    = Classic.KINDELVWE
    --
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORGREENM -- colors
    self.coloreyesbg  = Tic.COLORGREEND
    self.colorhairsfg = Tic.COLORORANGE
    self.colorhairsbg = Tic.COLORYELLOW
    self.headsprite   = CSpriteFG.HEADELVWE -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerDrowe = CPlayerElvwe:extend() -- Drowe player characters
Classic.KINDDROWE = "Drowe"
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.classic = CPlayerDrowe
    self.kind    = Classic.KINDDROWE
    --
    self.size         = Tic.SIZEM -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.colorhairsfg = Tic.COLORGREYD
    self.colorhairsbg = Tic.COLORGREYM
    self.statphymax   = 5
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 4
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
Classic.KINDANGEL = "Angel"
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.classic = CPlayerAngel
    self.kind    = Classic.KINDANGEL
    --
    self.size         = Tic.SIZEM -- size
    self.colorhairsfg = Tic.COLORGREYM -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = Tic.COLORYELLOW
    self.headsprite   = CSpriteFG.HEADANGEL -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerGolth = CPlayerHumanoid:extend() -- Golth player characters
Classic.KINDGOLTH = "Golth"
function CPlayerGolth:new(_argt)
    CPlayerGolth.super.new(self, _argt)
    self.classic = CPlayerGolth
    self.kind    = Classic.KINDGOLTH
    --
    self.size         = Tic.SIZEL -- size
    self.colorhairsfg = Tic.COLORWHITE -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = self.colorshirt
    self.coloreyesfg  = Tic.COLORBLUEL
    self.coloreyesbg  = Tic.COLORBLUEM
    self.headsprite   = CSpriteFG.HEADGOLTH -- head
    self.statphymax   = 8
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 1
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
Classic.KINDHORNE = "Horne"
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.classic = CPlayerHorne
    self.kind    = Classic.KINDHORNE
    --
    self.size         = Tic.SIZEL -- size
    self.colorhairsfg = Tic.COLORPURPLE -- colors
    self.colorhairsbg = Tic.COLORRED
    self.colorextra   = Tic.COLORGREYD
    self.headsprite   = CSpriteFG.HEADHORNE -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
Classic.KINDDEMON = "Demon"
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.classic = CPlayerDemon
    self.kind    = Classic.KINDDEMON
    --
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
Classic.KINDTIFEL = "Tifel"
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.classic = CPlayerTifel
    self.kind    = Classic.KINDTIFEL
    --
    self.size         = Tic.SIZEM -- size
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
Classic.KINDMEDUZ = "Meduz"
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.classic = CPlayerMeduz
    self.kind    = Classic.KINDMEDUZ
    --
    self.size         = Tic.SIZES -- size
    self.colorhairsfg = Tic.COLORGREEND -- colors
    self.colorhairsbg = Tic.COLORGREENM
    self.headsprite   = CSpriteFG.HEADMEDUZ -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerGnoll = CPlayerHumanoid:extend() -- Gnoll player characters
Classic.KINDGNOLL = "Gnoll"
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.classic = CPlayerGnoll
    self.kind    = Classic.KINDGNOLL
    --
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADGNOLL -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end


CPlayerWolfe = CPlayerGnoll:extend() -- Wolfe player characters
Classic.KINDWOLFE = "Wolfe"
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.classic = CPlayerWolfe
    self.kind    = Classic.KINDWOLFE
    --
    --
    self:argt(_argt) -- override if any
end


CPlayerGhost = CPlayerHumanoid:extend() -- Ghost player characters
Classic.KINDGHOST = "Ghost"
function CPlayerGhost:new(_argt)
    CPlayerGhost.super.new(self, _argt)
    self.classic = CPlayerGhost
    self.kind    = Classic.KINDGHOST
    --
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.colorhands   = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADGHOST -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    --
    self:argt(_argt) -- override if any
end
