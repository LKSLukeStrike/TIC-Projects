require("lib/ext/Classic")
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

function CBoard:appendDirectives(_directives, _region, _palette)
    _directives = _directives or {}
    _region     = _region or CRegion{}
    _palette    = _palette or {}
    for _, _directive in ipairs(_directives) do
        local _boardx = _directive.boardx
        local _boardy = _directive.boardy
        local _color  = (_palette[_directive.color])
            and _palette[_directive.color]
            or  _directive.color
        if not self.board[_boardx] then self.board[_boardx] = {} end
    end
end

