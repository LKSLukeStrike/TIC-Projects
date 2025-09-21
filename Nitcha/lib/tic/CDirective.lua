local Classic = require("lib/ext/Classic")
require("lib/tic/CRegion")
--
-- CDirective
--
CDirective = Classic:extend() -- generic board directive
Classic.KINDDIRECTIVE = "CDirective"
Classic.NAMEDIRECTIVE = "CDirective"
function CDirective:new(_argt)
    CDirective.super.new(self, _argt)
    self.kind = Classic.KINDDIRECTIVE
    self.name = Classic.NAMEDIRECTIVE
    self.boardx = 0
    self.boardy = 0
    self.color  = 0
    self:argt(_argt) -- override if any
end

function CDirective:applyOffsetsXY(_offsetx, _offsety)
    _offsetx = _offsetx or 0
    _offsety = _offsety or 0
    self.boardx = self.boardx + _offsetx
    self.boardy = self.boardy + _offsety
    return self
end

function CDirective:applyPalette(_palette)
    _palette = _palette or {}
    self.color = _palette[self.color] or self.color
    return self
end

function CDirective:checkRegion(_region)
    _region = (Classic:thatis(_region, CRegion)) and _region or CRegion{}
    if (not Nums:isBW(self.boardx, _region.lf, _region.rg))
    or (not Nums:isBW(self.boardy, _region.up, _region.dw)) then self = nil end
    return self
end

function CDirective:checkColorkeys(_colorkeys)
    _colorkeys = _colorkeys or {}
    if Tables:valFind(_colorkeys, self.color) then self = nil end
    return self
end
