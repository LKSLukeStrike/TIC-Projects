require("libraries/tic/CElement")
--
-- CScreen
--
CScreen = CElement:extend() -- generic screen -- use it as an empty box
Classic.KINDSCREEN = "Screen"
Classic.NAMESCREEN = "Screen"
function CScreen:new(_argt)
    CScreen.super.new(self, _argt)
    self.kind = Classic.KINDSCREEN
    self.name = Classic.NAMESCREEN
    self.drawground  = false  -- draw beheviors
    self.drawguides  = false
    self.drawinside  = false
    self.drawcaches  = false
    self.drawborder  = false
    self.drawframes  = false
    self:argt(_argt) -- override if any
end
