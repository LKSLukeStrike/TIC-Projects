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

function CDirective:clone()
    return CDirective{
        boardx = self.boardx,
        boardy = self.boardy,
        color  = self.color,
    }
end

function CDirective:applyFlip(_flip)
    _flip = _flip or Tic.FLIPNONE
    local _clone = self:clone()

    if _flip == Tic.FLIPHORI then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
    elseif _flip == Tic.FLIPVERT then
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    elseif _flip == Tic.FLIPBOTH then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    end

    return self
end

function CDirective:applyRotate(_rotate)
    _rotate = _rotate or Tic.ROTATE000

    if _rotate == Tic.ROTATE090 then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
    elseif _rotate == Tic.ROTATE180 then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    elseif _rotate == Tic.ROTATE270 then
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    end

    return self
end

function CDirective:applyOffsetXY(_offsetx, _offsety)
    _offsetx = _offsetx or 0
    _offsety = _offsety or 0
    local _clone = self:clone()

    _clone.boardx = _clone.boardx + _offsetx
    _clone.boardy = _clone.boardy + _offsety

    return _clone
end

function CDirective:applyPalette(_palette)
    _palette = _palette or {}
    local _clone = self:clone()

    _clone.color = _palette[_clone.color] or _clone.color

    return _clone
end
