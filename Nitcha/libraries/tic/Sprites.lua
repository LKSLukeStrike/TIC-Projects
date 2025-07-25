--
-- CSprite
--
CSprite = Classic:extend() -- generic sprite
Classic.KINDSPRITE = "Sprite" -- Sprite kind
Classic.NAMESPRITE = "Sprite" -- Sprite name
CSprite.SPRITEBANK = 0
CSprite.FRAMEOF    = 16 -- sprites frames offset multiplier
CSprite.FRAME00    = 00 -- sprites frames -- [!] start at 0, used to compute the offset
CSprite.FRAME01    = 01
CSprite.ROTATE000  = 0 -- sprite rotations
CSprite.ROTATE090  = 1
CSprite.ROTATE180  = 2
CSprite.ROTATE270  = 3
CSprite.SPRITEBOARD = 256
function CSprite:new(_argt)
    CSprite.super.new(self, _argt)
    self.kind = Classic.KINDSPRITE
    self.name = Classic.NAMESPRITE
    self.spritebank = CSprite.SPRITEBANK
    self.sprite    = self.spritebank -- initial sprite number
    self.screenx   = 0 -- screen positions
    self.screeny   = 0
    self.frame     = CSprite.FRAME00
    self.colorkey  = Tic.COLORKEY -- default colorkey
    self.scale     = Tic.SCALE01 -- default scale
    self.flip      = Tic.DIRXLF -- all sprites are dir x left by default
    self.rotate    = CSprite.ROTATE000 -- no rotation by default
    self.width     = 1 -- sprite 1x1 by default
    self.height    = 1
    self.palette   = {} -- empty by default, can be filled later
    self:argt(_argt) -- override if any
end

function CSprite:draw() -- draw a sprite -- SCREEN -- DEFAULT
    local _sprite = self.sprite + (self.frame *  CSprite.FRAMEOF)
    local _directives = Tic:boardDirectives(_sprite, self.palette, self.colorkey)
    Tic:boardPaint(CSprite.SPRITEBOARD, _directives)
    spr(
        CSprite.SPRITEBOARD,
        self.screenx,
        self.screeny,
        self.colorkey,
        self.scale,
        self.flip,
        self.rotate,
        self.width,
        self.height
    )
end


--
-- CSpriteBG
--
CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
Classic.KINDSPRITEBG = "SpriteBG" -- SpriteBG kind
Classic.NAMESPRITEBG = "SpriteBG" -- SpriteBG name
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SPRISMALLMPTY = CSpriteBG.SPRITEBANK + 0 -- empty sprite
CSpriteBG.SIGNBANK1   = 1  -- signs
CSpriteBG.SIGNQSTMRK  = CSpriteBG.SIGNBANK1 + 00 -- question mark
CSpriteBG.SIGNINTMRK  = CSpriteBG.SIGNBANK1 + 01 -- interact mark
CSpriteBG.SIGNBORDSQ  = CSpriteBG.SIGNBANK1 + 02 -- borders square
CSpriteBG.SIGNSPOTSQ  = CSpriteBG.SIGNBANK1 + 03 -- spotting square
CSpriteBG.SIGNCROSQU  = CSpriteBG.SIGNBANK1 + 04 -- crossed square
CSpriteBG.SIGNDOTSQU  = CSpriteBG.SIGNBANK1 + 05 -- dot square
CSpriteBG.SIGNBANK2   = 16 -- signs
CSpriteBG.SIGNARROWD  = CSpriteBG.SIGNBANK2 + 00 -- diag arrow
CSpriteBG.SIGNARROWL  = CSpriteBG.SIGNBANK2 + 01 -- line arrow
CSpriteBG.SIGNCENTER  = CSpriteBG.SIGNBANK2 + 02 -- center dot
CSpriteBG.SIGNPLAYER  = CSpriteBG.SIGNBANK2 + 03 -- player sprite
CSpriteBG.SIGNSPOTIT  = CSpriteBG.SIGNBANK2 + 04 -- spotit sprite
CSpriteBG.SIGNLOCKIT  = CSpriteBG.SIGNBANK2 + 05 -- lockit sprite
CSpriteBG.SIGNPICKIT  = CSpriteBG.SIGNBANK2 + 06 -- pickit sprite
CSpriteBG.SIGNSTAIDL  = CSpriteBG.SIGNBANK2 + 07 -- stand idle
CSpriteBG.SIGNKNEIDL  = CSpriteBG.SIGNBANK2 + 08 -- kneel idle
CSpriteBG.SIGNSTAMOV  = CSpriteBG.SIGNBANK2 + 09 -- stand move
CSpriteBG.SIGNKNEMOV  = CSpriteBG.SIGNBANK2 + 10 -- kneel move
CSpriteBG.SIGNDOWORK  = CSpriteBG.SIGNBANK2 + 11 -- work
CSpriteBG.SIGNDOSLEE  = CSpriteBG.SIGNBANK2 + 12 -- sleep
CSpriteBG.SIGNACTPHY  = CSpriteBG.SIGNBANK2 + 13 -- actual phy
CSpriteBG.SIGNACTMEN  = CSpriteBG.SIGNBANK2 + 14 -- actual men
CSpriteBG.SIGNACTPSY  = CSpriteBG.SIGNBANK2 + 15 -- actual psy
CSpriteBG.BUILDBANK   = 32 -- buildings
CSpriteBG.PLACEHOUSE  = CSpriteBG.BUILDBANK + 0
CSpriteBG.PLACETOWER  = CSpriteBG.BUILDBANK + 1
CSpriteBG.PLACEMANOR  = CSpriteBG.BUILDBANK + 2
CSpriteBG.PLACEKIRKE  = CSpriteBG.BUILDBANK + 3
CSpriteBG.STANDBANK   = 48 -- stands
CSpriteBG.PLACEWATER  = CSpriteBG.STANDBANK + 0
CSpriteBG.PLACESTALL  = CSpriteBG.STANDBANK + 1
CSpriteBG.TREESBANK   = 64 -- trees
CSpriteBG.PLACETREE0  = CSpriteBG.TREESBANK + 0
CSpriteBG.PLACETREE1  = CSpriteBG.TREESBANK + 1
CSpriteBG.MENHRBANK   = 80 -- menhirs
CSpriteBG.PLACEMENH0  = CSpriteBG.MENHRBANK + 0
CSpriteBG.PLACEMENH1  = CSpriteBG.MENHRBANK + 1
CSpriteBG.DOLMNBANK   = 96 -- dolmens
CSpriteBG.PLACEDOLM0  = CSpriteBG.DOLMNBANK + 0
CSpriteBG.PLACEDOLM1  = CSpriteBG.DOLMNBANK + 1
CSpriteBG.CIRKLBANK   = 112 -- circles
CSpriteBG.PLACECIRK0  = CSpriteBG.CIRKLBANK + 0
CSpriteBG.PLACECIRK1  = CSpriteBG.CIRKLBANK + 1
CSpriteBG.ROADSBANK   = 128 -- roads
CSpriteBG.PLACEROAD0  = CSpriteBG.ROADSBANK + 0
CSpriteBG.PLACEROAD1  = CSpriteBG.ROADSBANK + 1
function CSpriteBG:new(_argt) -- FIXME can be removed ?
    CSpriteBG.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEBG
    self.name = Classic.NAMESPRITEBG
    self:argt(_argt) -- override if any
end


--
-- CSpriteFG
--
CSpriteFG = CSprite:extend() -- fg sprites aka tic sprites
Classic.KINDSPRITEFG = "SpriteFG" -- SpriteFG kind
Classic.NAMESPRITEFG = "SpriteFG" -- SpriteFG name
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEBOARD = CSpriteFG.SPRITEBANK + 0 -- board sprite -- for creating a sprite by code
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK + 1 -- pixel sprite
CSpriteFG.HEADBANK    = 272 -- characters heads
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADELVWE   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADGOLTH   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 6
CSpriteFG.HEADGNOLL   = CSpriteFG.HEADBANK + 7
CSpriteFG.HEADGHOST   = CSpriteFG.HEADBANK + 8
CSpriteFG.BODYBANK    = 288 -- characters bodies
CSpriteFG.BODYHUMAN   = CSpriteFG.BODYBANK + 0 -- humanoid bodies
CSpriteFG.EYESBANK    = 320 -- characters eyes
CSpriteFG.EYESHUMAN   = CSpriteFG.EYESBANK + 0 -- humanoid eyes
CSpriteFG.EFFECTBANK  = 336 -- effects types
CSpriteFG.EFFECTEMPTY = CSpriteBG.SPRISMALLMPTY
CSpriteFG.EFFECTSLEEP = CSpriteFG.EFFECTBANK + 0
CSpriteFG.EFFECTWOUND = CSpriteFG.EFFECTBANK + 1
CSpriteFG.EFFECTDEATH = CSpriteFG.EFFECTBANK + 2
CSpriteFG.OBJECTBANK  = 352 -- objects types
CSpriteFG.WEAPONMELEE = CSpriteFG.OBJECTBANK + 0 -- melee bank
CSpriteFG.WEAPONMSWRD = CSpriteFG.WEAPONMELEE + 0
CSpriteFG.WEAPONMHAMR = CSpriteFG.WEAPONMELEE + 16
CSpriteFG.WEAPONMLNCE = CSpriteFG.WEAPONMELEE + 32
CSpriteFG.WEAPONRANGE = CSpriteFG.OBJECTBANK + 1 -- range bank
CSpriteFG.WEAPONRBOWS = CSpriteFG.WEAPONRANGE + 0
CSpriteFG.WEAPONRBOWM = CSpriteFG.WEAPONRANGE + 16
CSpriteFG.WEAPONRBOWL = CSpriteFG.WEAPONRANGE + 32
CSpriteFG.WEAPONMAGIC = CSpriteFG.OBJECTBANK + 2 -- magic bank
CSpriteFG.WEAPONMWNDS = CSpriteFG.WEAPONMAGIC + 0
CSpriteFG.WEAPONMWNDM = CSpriteFG.WEAPONMAGIC + 16
CSpriteFG.WEAPONMWNDL = CSpriteFG.WEAPONMAGIC + 32
CSpriteFG.CLOTHESHLMB = CSpriteFG.OBJECTBANK + 3 -- helmets bank
CSpriteFG.CLOTHESHLMS = CSpriteFG.CLOTHESHLMB + 0
CSpriteFG.CLOTHESHLMM = CSpriteFG.CLOTHESHLMB + 16
CSpriteFG.CLOTHESHLML = CSpriteFG.CLOTHESHLMB + 32
CSpriteFG.CLOTHESHATB = CSpriteFG.OBJECTBANK + 4 -- hats bank
CSpriteFG.CLOTHESHATS = CSpriteFG.CLOTHESHATB + 0
CSpriteFG.CLOTHESHATM = CSpriteFG.CLOTHESHATB + 16
CSpriteFG.CLOTHESHATL = CSpriteFG.CLOTHESHATB + 32
CSpriteFG.CLOTHESCAPB = CSpriteFG.OBJECTBANK + 5 -- caps bank
CSpriteFG.CLOTHESCAPS = CSpriteFG.CLOTHESCAPB + 0
CSpriteFG.CLOTHESCAPM = CSpriteFG.CLOTHESCAPB + 16
CSpriteFG.CLOTHESCAPL = CSpriteFG.CLOTHESCAPB + 32
CSpriteFG.WEAPONSHLDB = CSpriteFG.OBJECTBANK + 6 -- shields bank
CSpriteFG.WEAPONSHLDS = CSpriteFG.WEAPONSHLDB + 0
CSpriteFG.WEAPONSHLDM = CSpriteFG.WEAPONSHLDB + 16
CSpriteFG.WEAPONSHLDL = CSpriteFG.WEAPONSHLDB + 32
CSpriteFG.CLOTHESBKPB = CSpriteFG.OBJECTBANK + 7 -- backpacks bank
CSpriteFG.CLOTHESBKPS = CSpriteFG.CLOTHESBKPB + 0
CSpriteFG.CLOTHESBKPM = CSpriteFG.CLOTHESBKPB + 16
CSpriteFG.CLOTHESBKPL = CSpriteFG.CLOTHESBKPB + 32
CSpriteFG.OBJECTFLASB = CSpriteFG.OBJECTBANK + 48 -- flasks bank
CSpriteFG.OBJECTFLASS = CSpriteFG.OBJECTFLASB + 0
CSpriteFG.OBJECTFLASM = CSpriteFG.OBJECTFLASB + 16
CSpriteFG.OBJECTFLASL = CSpriteFG.OBJECTFLASB + 32
CSpriteFG.OBJECTBOOKB = CSpriteFG.OBJECTBANK + 49 -- books bank
CSpriteFG.OBJECTBOOKS = CSpriteFG.OBJECTBOOKB + 0
CSpriteFG.OBJECTBOOKM = CSpriteFG.OBJECTBOOKB + 16
CSpriteFG.OBJECTBOOKL = CSpriteFG.OBJECTBOOKB + 32
CSpriteFG.OBJECTSPELB = CSpriteFG.OBJECTBANK + 96 -- spells bank
CSpriteFG.OBJECTSPELS = CSpriteFG.OBJECTSPELB + 0
CSpriteFG.OBJECTSPELM = CSpriteFG.OBJECTSPELB + 16
CSpriteFG.OBJECTSPELL = CSpriteFG.OBJECTSPELB + 32
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFG
    self.name = Classic.NAMESPRITEFG
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGEmpty
--
CSpriteFGEmpty = CSpriteFG:extend() -- empty sprites
Classic.KINDSPRITEFGEMPTY = "SpriteFGEmpty" -- SpriteFGEmpty kind
Classic.NAMESPRITEFGEMPTY = "SpriteFGEmpty" -- SpriteFGEmpty name
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFGEMPTY
    self.name = Classic.NAMESPRITEFGEMPTY
    self.sprite = CSpriteBG.SPRISMALLMPTY
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGPixel
--
CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
Classic.KINDSPRITEFGPIXEL = "SpriteFGPixel" -- SpriteFGPixel kind
Classic.NAMESPRITEFGPIXEL = "SpriteFGPixel" -- SpriteFGPixel name
function CSpriteFGPixel:new(_argt)
    CSpriteFGPixel.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFGPIXEL
    self.name = Classic.NAMESPRITEFGPIXEL
    self.sprite = CSpriteFG.SPRITEPIXEL
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGBoard
--
CSpriteFGBoard = CSpriteFG:extend() -- board sprites
Classic.KINDSPRITEFGBOARD = "SpriteFGBoard" -- SpriteFGBoard kind
Classic.NAMESPRITEFGBOARD = "SpriteFGBoard" -- SpriteFGBoard name
function CSpriteFGBoard:new(_argt)
    CSpriteFGBoard.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFGBOARD
    self.name = Classic.NAMESPRITEFGBOARD
    self.sprite = CSpriteFG.SPRITEBOARD
    self.directives = {} -- table of painting directives {{x = 0-7, y = 0-7, color = 0-15,}, ...}
    self:argt(_argt) -- override if any
end

function CSpriteFGBoard:draw()
    Tic:boardPaint(self.sprite, self.directives) -- FIXME ? only here not in tic
    CSpriteFGBoard.super.draw(self)
end
