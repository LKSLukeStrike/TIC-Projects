local Classic = require("lib/ext/Classic")
require("lib/tic/CDirective")
require("lib/tic/CRegion")
--
-- CBoard
--
CBoard = Classic:extend() -- generic board -- {boardx {boardy color}}
Classic.KINDBOARD = "CBoard"
Classic.NAMEBOARD = "CBoard"
function CBoard:new(_argt)
    CBoard.super.new(self, _argt)
    self.kind = Classic.KINDBOARD
    self.name = Classic.NAMEBOARD
    self.screenx   = 0
    self.screeny   = 0
    self.board     = {}
    self.palette   = {} -- palette if any
    self.colorkeys = {} -- colorkeys if any
    self:argt(_argt) -- override if any
end

function CBoard:isEmpty(_boardx, _boardy) -- check if a point on board is empty
    return not self.board[_boardx] or not self.board[_boardx][_boardy]
end

function CBoard:clear() -- clear the board
    self.board = {}
end

function CBoard:appendDirective(_directive, _region, _palette, _colorkeys, _offsetx, _offsety, _flip, _rotate)
    if not Classic:thatis(_directive, CDirective) then return end -- mandatory
    _region    = (Classic:thatis(_region, CRegion)) and _region or CRegion{}
    _palette   = Utils:defaultOneTwo(_palette, self.palette, {})
    _colorkeys = Utils:defaultOneTwo(_colorkeys, self.colorkeys, {})
    _offsetx   = _offsetx or 0
    _offsety   = _offsety or 0
    _flip      = _flip or Tic.FLIPNONE
    _rotate    = _rotate or Tic.ROTATE000

    _directive:applyPalette(_palette):applyOffsetXY(_offsetx, _offsety):applyFlip(_flip):applyRotate(_rotate)

    local _boardx = _directive.boardx
    local _boardy = _directive.boardy
    local _color  = _directive.color

    if  Nums:isBW(_boardx, _region.lf, _region.rg)
    and Nums:isBW(_boardy, _region.up, _region.dw)
    and not Tables:valFind(_colorkeys, _color)
    then
        if not self.board[_boardx] then self.board[_boardx] = {} end
        self.board[_boardx][_boardy] = _color
        Tic:logAppend(Y.._boardy, X.._boardx, C..Tic.COLORNAMES[_color])
    end
end

function CBoard:appendDirectives(_directives, _region, _palette, _colorkeys, _offsetx, _offsety, _flip, _rotate)
    for _, _directive in ipairs(_directives) do
        self:appendDirective(_directive, _region, _palette, _colorkeys, _offsetx, _offsety, _flip, _rotate)
    end
end

function CBoard:directives(_region, _palette, _colorkeys)
    _region    = (Classic:thatis(_region, CRegion)) and _region or CRegion{}
    _palette   = Utils:defaultOneTwo(_palette, self.palette, {})
    _colorkeys = Utils:defaultOneTwo(_colorkeys, self.colorkeys, {})
    local _result = {}

    for _boardx, _boardys in pairs(self.board) do
        if  Nums:isBW(_boardx, _region.lf, _region.rg) then
            for _boardy, _color in pairs(_boardys) do
                if Nums:isBW(_boardy, _region.up, _region.dw) then
                    _color  = Utils:defaultOne(_palette[_color], _color)
                    if not Tables:valFind(_colorkeys, _color)
                    then
                        Tables:valInsert(_result, CDirective{boardx = _boardx, boardy = _boardy, color = _color}, true)
                    end
                end
            end
        end
    end

    return _result
end

function CBoard:drawScreen(_screenx, _screeny)
    _screenx = _screenx or self.screenx
    _screeny = _screeny or self.screeny

    for _boardx, _boardys in pairs(self.board) do
        for _boardy, _color in pairs(_boardys) do
            pix(_screenx + _boardx, _screeny + _boardy, _color)
        end
    end
end
