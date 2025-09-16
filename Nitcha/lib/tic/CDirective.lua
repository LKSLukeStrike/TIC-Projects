local Classic = require("lib/ext/Classic")
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
