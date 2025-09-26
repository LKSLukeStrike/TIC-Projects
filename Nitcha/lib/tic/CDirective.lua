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

function CDirective:applyPalette(_palette)
    _palette = _palette or {}

    self.color = _palette[self.color] or self.color

    return self
end

function CDirective:checkColorkeys(_colorkeys)
    _colorkeys = _colorkeys or {}

    if Tables:valFind(_colorkeys, self.color) then return end -- nil 

    return self
end

function CDirective:applyFlip(_flip)
    _flip = _flip or Tic.FLIPNONE

    if _flip == Tic.FLIPNONE then
        return self
    elseif _flip == Tic.FLIPHORI then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
    elseif _flip == Tic.FLIPVERT then
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    elseif _flip == Tic.FLIPBOTH then
        self.boardx = Tic.SPRITESIZE - 1 - self.boardx
        self.boardy = Tic.SPRITESIZE - 1 - self.boardy
    end

    return self
end

function CDirective:applyRotate090()
    local _boardx = self.boardx
    local _boardy = self.boardy
    self.boardx = Tic.SPRITESIZE - 1 - _boardy
    self.boardy = _boardx
end

function CDirective:applyRotate(_rotate)
    _rotate = _rotate or Tic.ROTATE000

    if _rotate == Tic.ROTATE000 then
        return self
    elseif _rotate == Tic.ROTATE090 then
        self:applyRotate090()
    elseif _rotate == Tic.ROTATE180 then
        self:applyRotate090()
        self:applyRotate090()
    elseif _rotate == Tic.ROTATE270 then
        self:applyRotate090()
        self:applyRotate090()
        self:applyRotate090()
    end

    return self
end

function CDirective:applyOffsetXY(_offsetx, _offsety) -- FIXME useless ?
    _offsetx = _offsetx or 0
    _offsety = _offsety or 0

    self.boardx = self.boardx + _offsetx
    self.boardy = self.boardy + _offsety

    return self
end
