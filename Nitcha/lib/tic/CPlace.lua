require("lib/tic/CEntityDrawable")
--
-- CPlace
--
CPlace = CEntityDrawable:extend() -- places
Classic.KINDPLACE = "Place"
Classic.NAMEPLACE = "Place"
CPlace.EMPTY    = Tic.COLORKEY -- anims
CPlace.ANIM01   = Tic.COLORWHITE
CPlace.ANIM02   = Tic.COLORYELLOW
CPlace.ANIM03   = Tic.COLORORANGE
CPlace.ANIM04   = Tic.COLORCYAN
CPlace.ANIM05   = Tic.COLORBLUEL
CPlace.ANIM06   = Tic.COLORBLUEM
CPlace.ANIM07   = Tic.COLORBLUED
CPlace.SMOKE    = CPlace.ANIM01 -- builds
CPlace.WINDOW01 = CPlace.ANIM02
CPlace.WINDOW02 = CPlace.ANIM03
CPlace.ROOF     = Tic.COLORRED
CPlace.DOOR     = Tic.COLORGREYL
CPlace.FACADE   = Tic.COLORGREYM
CPlace.WALLS    = Tic.COLORGREYD
CPlace.FOAM     = Tic.COLORGREEND
CPlace.OWNER    = CPlace.ANIM01 -- stalls
CPlace.WATER01  = CPlace.ANIM02
CPlace.WATER02  = CPlace.ANIM03
CPlace.GOODS01  = CPlace.ANIM02
CPlace.GOODS02  = CPlace.ANIM03
CPlace.NEST     = CPlace.ANIM01 -- trees
CPlace.FLOOR01  = CPlace.ANIM02
CPlace.FLOOR02  = CPlace.ANIM03
CPlace.LEAFSFG  = Tic.COLORGREENM
CPlace.LEAFSBG  = Tic.COLORGREEND
CPlace.TRUNK    = Tic.COLORGREYM
CPlace.BARK     = Tic.COLORGREYD
CPlace.MOON     = CPlace.ANIM01 -- stones
CPlace.STONEFG  = Tic.COLORGREYM
CPlace.STONEBG  = Tic.COLORGREYD
CPlace.MAGIC01  = CPlace.ANIM04 -- magic
CPlace.MAGIC02  = CPlace.ANIM05
CPlace.MAGIC03  = CPlace.ANIM06
CPlace.MAGIC04  = CPlace.ANIM07
CPlace.COLORLIGHT   = Tic.COLORORANGE -- colors
CPlace.COLORGLASS01 = Tic.COLORCYAN
CPlace.COLORGLASS02 = Tic.COLORBLUEL
CPlace.COLORWATER01 = Tic.COLORBLUEL
CPlace.COLORWATER02 = Tic.COLORBLUEM
CPlace.COLORGOODS01 = Tic.COLORGREENM
CPlace.COLORGOODS02 = Tic.COLORGREEND
CPlace.COLORNEST    = Tic.COLORGREYL
CPlace.COLORFLOOR01 = CPlace.LEAFSFG
CPlace.COLORFLOOR02 = CPlace.LEAFSBG
CPlace.COLORMOON    = Tic.COLORGREYL
function CPlace:new(_argt)
    CPlace.super.new(self, _argt)
    self.classic = CPlace
    self.kind = Classic.KINDPLACE
    self.name = Classic.NAMEPLACE
    self:argt(_argt) -- override if any
end
