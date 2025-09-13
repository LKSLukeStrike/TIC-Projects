require("lib/ext/Classic")
--
-- CSprite
--
CSprite = Classic:extend() -- generic sprite
Classic.KINDSPRITE = "Sprite"
Classic.NAMESPRITE = "Sprite"
CSprite.SPRITEBANK = 0
CSprite.FRAMEOF    = 16 -- sprites frames offset multiplier
CSprite.FRAME00    = 00 -- sprites frames -- [!] start at 0, used to compute the offset
CSprite.FRAME01    = 01
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
    self.flip      = Tic.FLIPNONE -- all sprites are dir x left by default
    self.rotate    = Tic.ROTATE000 -- no rotation by default
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
Classic.KINDSPRITEBG = "SpriteBG"
Classic.NAMESPRITEBG = "SpriteBG"
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SIGNBANK1   = 0  -- signs
CSpriteBG.SIGNEMPTYS  = CSpriteBG.SIGNBANK1 + 00 -- empty sprite
CSpriteBG.SIGNQSTMRK  = CSpriteBG.SIGNBANK1 + 01 -- question mark
CSpriteBG.SIGNINTMRK  = CSpriteBG.SIGNBANK1 + 02 -- interact mark
CSpriteBG.SIGNBORDSQ  = CSpriteBG.SIGNBANK1 + 03 -- borders square
CSpriteBG.SIGNSPOTSQ  = CSpriteBG.SIGNBANK1 + 04 -- spotting square
CSpriteBG.SIGNCROSQU  = CSpriteBG.SIGNBANK1 + 05 -- crossed square
CSpriteBG.SIGNDOTSQU  = CSpriteBG.SIGNBANK1 + 06 -- dot square
CSpriteBG.SIGNSLHEAD  = CSpriteBG.SIGNBANK1 + 11 -- slot default head
CSpriteBG.SIGNSLBACK  = CSpriteBG.SIGNBANK1 + 12 -- slot default back
CSpriteBG.SIGNSLHAND  = CSpriteBG.SIGNBANK1 + 13 -- slot default hand
CSpriteBG.SIGNACTPHY  = CSpriteBG.SIGNBANK1 + 13 -- stat phy
CSpriteBG.SIGNACTMEN  = CSpriteBG.SIGNBANK1 + 14 -- stat men
CSpriteBG.SIGNACTPSY  = CSpriteBG.SIGNBANK1 + 15 -- stat psy
CSpriteBG.SIGNBANK2   = 16 -- signs
CSpriteBG.SIGNARROWD  = CSpriteBG.SIGNBANK2 + 00 -- diag arrow
CSpriteBG.SIGNARROWL  = CSpriteBG.SIGNBANK2 + 01 -- line arrow
CSpriteBG.SIGNCENTER  = CSpriteBG.SIGNBANK2 + 02 -- center dot
CSpriteBG.SIGNPLAYER  = CSpriteBG.SIGNBANK2 + 03 -- player sprite
CSpriteBG.SIGNDELETE  = CSpriteBG.SIGNBANK2 + 04 -- trash sprite
CSpriteBG.SIGNSPOTIT  = CSpriteBG.SIGNBANK2 + 05 -- spotit sprite
CSpriteBG.SIGNLOCKIT  = CSpriteBG.SIGNBANK2 + 06 -- lockit sprite
CSpriteBG.SIGNPICKIT  = CSpriteBG.SIGNBANK2 + 07 -- pickit sprite
CSpriteBG.SIGNSTAIDL  = CSpriteBG.SIGNBANK2 + 08 -- stand idle
CSpriteBG.SIGNKNEIDL  = CSpriteBG.SIGNBANK2 + 09 -- kneel idle
CSpriteBG.SIGNSTAMOV  = CSpriteBG.SIGNBANK2 + 10 -- stand move
CSpriteBG.SIGNKNEMOV  = CSpriteBG.SIGNBANK2 + 11 -- kneel move
CSpriteBG.SIGNDOWORK  = CSpriteBG.SIGNBANK2 + 12 -- work
CSpriteBG.SIGNDOSLEE  = CSpriteBG.SIGNBANK2 + 13 -- sleep
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
Classic.KINDSPRITEFG = "SpriteFG"
Classic.NAMESPRITEFG = "SpriteFG"
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEBOARD = CSpriteFG.SPRITEBANK + 0 -- board sprite -- for creating a sprite by code
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK + 1 -- pixel sprite
CSpriteFG.HEADBANK    = 272 -- characters heads
CSpriteFG.HEADHUMAN   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADELVWE   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADGOLTH   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 6
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 7
CSpriteFG.HEADGNOLL   = CSpriteFG.HEADBANK + 8
CSpriteFG.HEADGHOST   = CSpriteFG.HEADBANK + 9
CSpriteFG.BODYBANK    = 288 -- characters bodies
CSpriteFG.BODYHUMAN   = CSpriteFG.BODYBANK + 0 -- humanoid bodies
CSpriteFG.EYESBANK    = 320 -- characters eyes
CSpriteFG.EYESHUMAN   = CSpriteFG.EYESBANK + 0 -- humanoid eyes
CSpriteFG.EFFECTBANK  = 336 -- effects types
CSpriteFG.EFFECTEMPTY = CSpriteBG.SIGNEMPTYS
CSpriteFG.EFFECTSLEEP = CSpriteFG.EFFECTBANK + 0
CSpriteFG.EFFECTWOUND = CSpriteFG.EFFECTBANK + 1
CSpriteFG.EFFECTDEATH = CSpriteFG.EFFECTBANK + 2
CSpriteFG.OBJECTBANK  = 352 -- objects bank

CSpriteFG.OBJPHYBANK  = CSpriteFG.OBJECTBANK + 0 -- phy objects bank
CSpriteFG.WEAPONMELEE = CSpriteFG.OBJPHYBANK + 0 -- melee bank
CSpriteFG.WEAPONMSWRD = CSpriteFG.WEAPONMELEE + 0
CSpriteFG.WEAPONMHAMR = CSpriteFG.WEAPONMELEE + 16
CSpriteFG.WEAPONMLNCE = CSpriteFG.WEAPONMELEE + 32
CSpriteFG.WEAPONSHLDB = CSpriteFG.OBJPHYBANK + 1 -- shields bank
CSpriteFG.WEAPONSHLDS = CSpriteFG.WEAPONSHLDB + 0
CSpriteFG.WEAPONSHLDM = CSpriteFG.WEAPONSHLDB + 16
CSpriteFG.WEAPONSHLDL = CSpriteFG.WEAPONSHLDB + 32
CSpriteFG.CLOTHESHLMB = CSpriteFG.OBJPHYBANK + 2 -- helmets bank
CSpriteFG.CLOTHESHLMS = CSpriteFG.CLOTHESHLMB + 0
CSpriteFG.CLOTHESHLMM = CSpriteFG.CLOTHESHLMB + 16
CSpriteFG.CLOTHESHLML = CSpriteFG.CLOTHESHLMB + 32
CSpriteFG.CLOTHESBKPB = CSpriteFG.OBJPHYBANK + 3 -- backpacks bank
CSpriteFG.CLOTHESBKPS = CSpriteFG.CLOTHESBKPB + 0
CSpriteFG.CLOTHESBKPM = CSpriteFG.CLOTHESBKPB + 16
CSpriteFG.CLOTHESBKPL = CSpriteFG.CLOTHESBKPB + 32
CSpriteFG.OBJECTBOMBB = CSpriteFG.OBJPHYBANK + 4 -- bombs bank
CSpriteFG.OBJECTBOMBS = CSpriteFG.OBJECTBOMBB + 0
CSpriteFG.OBJECTBOMBM = CSpriteFG.OBJECTBOMBB + 16
CSpriteFG.OBJECTBOMBL = CSpriteFG.OBJECTBOMBB + 32

CSpriteFG.OBJMENBANK  = CSpriteFG.OBJECTBANK + 48 -- men objects bank
CSpriteFG.WEAPONRANGE = CSpriteFG.OBJMENBANK + 0 -- range bank
CSpriteFG.WEAPONRBOWS = CSpriteFG.WEAPONRANGE + 0
CSpriteFG.WEAPONRBOWM = CSpriteFG.WEAPONRANGE + 16
CSpriteFG.WEAPONRBOWL = CSpriteFG.WEAPONRANGE + 32
CSpriteFG.WEAPONBOOKB = CSpriteFG.OBJMENBANK + 1 -- books bank
CSpriteFG.WEAPONBOOKS = CSpriteFG.WEAPONBOOKB + 0
CSpriteFG.WEAPONBOOKM = CSpriteFG.WEAPONBOOKB + 16
CSpriteFG.WEAPONBOOKL = CSpriteFG.WEAPONBOOKB + 32
CSpriteFG.CLOTHESHATB = CSpriteFG.OBJMENBANK + 2 -- hats bank
CSpriteFG.CLOTHESHATS = CSpriteFG.CLOTHESHATB + 0
CSpriteFG.CLOTHESHATM = CSpriteFG.CLOTHESHATB + 16
CSpriteFG.CLOTHESHATL = CSpriteFG.CLOTHESHATB + 32
CSpriteFG.CLOTHESTBXB = CSpriteFG.OBJMENBANK + 3 -- toolboxes bank
CSpriteFG.CLOTHESTBXS = CSpriteFG.CLOTHESTBXB + 0
CSpriteFG.CLOTHESTBXM = CSpriteFG.CLOTHESTBXB + 16
CSpriteFG.CLOTHESTBXL = CSpriteFG.CLOTHESTBXB + 32
CSpriteFG.OBJECTFLASB = CSpriteFG.OBJMENBANK + 4 -- flasks bank
CSpriteFG.OBJECTFLASS = CSpriteFG.OBJECTFLASB + 0
CSpriteFG.OBJECTFLASM = CSpriteFG.OBJECTFLASB + 16
CSpriteFG.OBJECTFLASL = CSpriteFG.OBJECTFLASB + 32

CSpriteFG.OBJPSYBANK  = CSpriteFG.OBJECTBANK + 96 -- psy objects bank
CSpriteFG.WEAPONMAGIC = CSpriteFG.OBJPSYBANK + 0 -- magic bank
CSpriteFG.WEAPONMWNDS = CSpriteFG.WEAPONMAGIC + 0
CSpriteFG.WEAPONMWNDM = CSpriteFG.WEAPONMAGIC + 16
CSpriteFG.WEAPONMWNDL = CSpriteFG.WEAPONMAGIC + 32
CSpriteFG.WEAPONRUNEB = CSpriteFG.OBJPSYBANK + 1 -- runes bank
CSpriteFG.WEAPONRUNES = CSpriteFG.WEAPONRUNEB + 0
CSpriteFG.WEAPONRUNEM = CSpriteFG.WEAPONRUNEB + 16
CSpriteFG.WEAPONRUNEL = CSpriteFG.WEAPONRUNEB + 32
CSpriteFG.CLOTHESCAPB = CSpriteFG.OBJPSYBANK + 2 -- caps bank
CSpriteFG.CLOTHESCAPS = CSpriteFG.CLOTHESCAPB + 0
CSpriteFG.CLOTHESCAPM = CSpriteFG.CLOTHESCAPB + 16
CSpriteFG.CLOTHESCAPL = CSpriteFG.CLOTHESCAPB + 32
CSpriteFG.CLOTHESCASB = CSpriteFG.OBJPSYBANK + 3 -- scrollcases bank
CSpriteFG.CLOTHESCASS = CSpriteFG.CLOTHESCASB + 0
CSpriteFG.CLOTHESCASM = CSpriteFG.CLOTHESCASB + 16
CSpriteFG.CLOTHESCASL = CSpriteFG.CLOTHESCASB + 32
CSpriteFG.OBJECTSPELB = CSpriteFG.OBJPSYBANK + 4 -- spells bank
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
Classic.KINDSPRITEFGEMPTY = "SpriteFGEmpty"
Classic.NAMESPRITEFGEMPTY = "SpriteFGEmpty"
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFGEMPTY
    self.name = Classic.NAMESPRITEFGEMPTY
    self.sprite = CSpriteBG.SIGNEMPTYS
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGPixel
--
CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
Classic.KINDSPRITEFGPIXEL = "SpriteFGPixel"
Classic.NAMESPRITEFGPIXEL = "SpriteFGPixel"
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
Classic.KINDSPRITEFGBOARD = "SpriteFGBoard"
Classic.NAMESPRITEFGBOARD = "SpriteFGBoard"
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
