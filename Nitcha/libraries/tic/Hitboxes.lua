require("libraries/tic/Regions")                


--
-- CHitbox
--
CHitbox = CRegion:extend() -- generic hitbox region
Classic.KINDHITBOX = "Hitbox" -- Hitbox kind
Classic.NAMEHITBOX = "Hitbox" -- Hitbox name
CHitbox.LF = 0 -- hitbox region sizes
CHitbox.RG = Tic.SPRITESIZE - 1
CHitbox.UP = 0
CHitbox.DW = Tic.SPRITESIZE - 1
function CHitbox:new(_argt)
    CHitbox.super.new(self, _argt)
    self.kind = Classic.KINDHITBOX
    self.name = Classic.NAMEHITBOX
    self.lf     = CHitbox.LF
    self.rg     = CHitbox.RG
    self.up     = CHitbox.UP
    self.dw     = CHitbox.DW
    self.entity = nil -- parent entity -- override if any
    self.hitto  = {}  -- entities hitto -- table
    self.hitby  = {}  -- entities hitby -- table
    self:argt(_argt) -- override if any
end

function CHitbox:hittoAppend(_entity) -- append an entity hitto
    if not _entity then return end -- mandatory
    Tables:keyAppend(self.hitto, _entity)
end

function CHitbox:hittoDelete(_entity) -- delete an entity hitto
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.hitto, _entity)
end

function CHitbox:hitbyAppend(_entity) -- append an entity hitby
    if not _entity then return end -- mandatory
    Tables:keyAppend(self.hitby, _entity)
end

function CHitbox:hitbyDelete(_entity) -- delete an entity hitby
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.hitby, _entity)
end

function CHitbox:hasHitTo() -- has hitto ?
    return Tables:size(self.hitto) > 0
end

function CHitbox:hasHitBy() -- has hitby ?
    return Tables:size(self.hitby) > 0
end

function CHitbox:draw()
    if not self.entity then return end -- no entity no draw
	local _drawcolor = Tic.COLORYELLOW
    _drawcolor = (self:hasHitTo()) and Tic.COLORORANGE or _drawcolor
    _drawcolor = (self:hasHitBy()) and Tic.COLORRED    or _drawcolor

    local _regionadjusted = self:regionAdjusted():offsetXY(self.entity.screenx, self.entity.screeny)

    rectb(
		_regionadjusted.lf,
		_regionadjusted.up,
		_regionadjusted:borderW(self.entity.scale),
		_regionadjusted:borderH(self.entity.scale),
		_drawcolor
	)
end

function CHitbox:regionAdjusted() -- hitbox offsets adjusted to its entity -- depends on dirx and scale
    local _result  = CRegion{lf = self.lf, rg = self.rg, up = self.up, dw = self.dw}
    if not self.entity then return _result end -- has no entity to adjust with

    local _widthlf = (self.lf - CHitbox.LF) -- |lf|md|rg| areas widths
    local _widthmd = (self.rg - self.lf )
    local _widthrg = (CHitbox.RG - self.rg)

    _result.lf = (self.entity.dirx == Tic.DIRXLF)
        and _widthlf * self.entity.scale
        or  _widthrg * self.entity.scale
    _result.rg = _result.lf + (_widthmd * self.entity.scale)
    _result.up = self.up * self.entity.scale
    _result.dw = self.dw * self.entity.scale

    return _result
end
