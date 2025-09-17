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
    self.colorkey = nil -- colorkey if any
    self.board    = {}
    self:argt(_argt) -- override if any
end

function CBoard:isEmpty(_boardx, _boardy) -- check if a point on board is empty
    return not self.board[_boardx] or not self.board[_boardx][_boardy]
end

function CBoard:clear() -- clear the board
    self.board = {}
end

function CBoard:appendDirective(_directive, _region, _palette, _colorkey)
    if not Classic:thatis(_directive, CDirective) then return end -- mandatory
    _region       = (Classic:thatis(_region, CRegion)) and _region or CRegion{}
    _palette      = _palette  or {}
    _colorkey     = _colorkey or self.colorkey
    local _boardx = _directive.boardx
    local _boardy = _directive.boardy
    local _color  = (_palette[_directive.color])
        and _palette[_directive.color]
        or  _directive.color

    if  Nums:isBW(_boardx, _region.lf, _region.rg)
    and Nums:isBW(_boardy, _region.up, _region.dw)
    and (((not self.colorkey) and (not _colorkey)) or (not (_color == _colorkey)))
    then
        if not self.board[_boardx] then self.board[_boardx] = {} end
        self.board[_boardx][_boardy] = _color
    end
end

function CBoard:appendDirectives(_directives, _region, _palette, _colorkey)
    for _, _directive in ipairs(_directives) do
        self:appendDirective(_directive, _region, _palette, _colorkey)
    end
end

function CBoard:directives(_region, _palette, _colorkey)
    _region       = (Classic:thatis(_region, CRegion)) and _region or CRegion{}
    _palette      = _palette  or {}
    _colorkey     = _colorkey or self.colorkey
    local _result = {}

    for _boardx, _boardys in pairs(self.board) do
        if  Nums:isBW(_boardx, _region.lf, _region.rg) then
            for _boardy, _color in pairs(_boardys) do
                if Nums:isBW(_boardy, _region.up, _region.dw) then
                    _color  = (_palette[_color])
                        and _palette[_color]
                        or  _color
                    if (((not self.colorkey) and (not _colorkey)) or (not (_color == _colorkey)))
                    then
                        Tables:valInsert(_result, CDirective{boardx = _boardx, boardy = _boardy, color = _color}, true)
                    end
                end
            end
        end
    end

    return _result
end
