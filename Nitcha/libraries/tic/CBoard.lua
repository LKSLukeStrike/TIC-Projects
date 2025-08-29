require("libraries/ext/Classic")
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
    self.board = {}
    self:argt(_argt) -- override if any
end
