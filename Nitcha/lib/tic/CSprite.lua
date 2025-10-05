local Classic = require("lib/ext/Classic")
require("lib/tic/CBoard")
require("lib/tic/CDirective")
--
-- CSprite
--
CSprite = Classic:extend() -- generic sprite
Classic.KINDSPRITE = "Sprite"
Classic.NAMESPRITE = "Sprite"
CSprite.SPRITEBANK   = 0
CSprite.FRAMEOFFSET  = 16 -- sprites frames offset multiplier
CSprite.FRAME00      = 00 -- sprites frames -- [!] start at 0, used to compute the offset
CSprite.FRAME01      = 01
CSprite.SPRITEBOARD  = 256
CSprite.COLORKEYS    = {Tic.COLORKEY}
CSprite.BOARD        = CBoard{}
CSprite.TARGETSCREEN = "screen"
CSprite.TARGETSPRITE = "sprite"
CSprite.TARGETBOARD  = "board"
CSprite.SPRITESRC    = CSprite.TARGETSPRITE -- sprite source
CSprite.SPRITEDST    = CSprite.TARGETSCREEN -- sprite destination
function CSprite:new(_argt)
    CSprite.super.new(self, _argt)
    self.kind = Classic.KINDSPRITE
    self.name = Classic.NAMESPRITE
    self.spritebank  = CSprite.SPRITEBANK
    self.sprite      = self.spritebank -- initial sprite number -- set to nil to act as a spriteboard
    self.screenx     = 0 -- screen positions
    self.screeny     = 0
    self.offsetx     = 0 -- screen/board positions offsets
    self.offsety     = 0
    self.frame       = CSprite.FRAME00
    self.frameoffset = CSprite.FRAMEOFFSET
    self.scale       = Tic.SCALE01 -- default scale
    self.flip        = Tic.FLIPNONE -- all sprites are dir x left by default
    self.rotate      = Tic.ROTATE000 -- no rotation by default
    self.width       = 1 -- sprite 1x1 by default
    self.height      = 1
    self.palette     = {} -- used to palettize if any
    self.colorkeys   = CSprite.COLORKEYS -- default colorkeys
    self.directives  = {} -- painting directives {{boardx = 0-Tic.SPRITESIZE - 1, boardy = 0-Tic.SPRITESIZE - 1, color = 0-15}, ...}
    self:argt(_argt) -- override if any
end

function Tic:logSprite(_pfx, _sprite)
    if Tic.LOGSPRITE then
        Tic:logAppend(_pfx, _sprite.sprite, _sprite.name, _sprite.screenx, _sprite.screeny, _sprite.flip, _sprite.rotate)
    end
end

function CSprite:boardClear() -- clear the board
    CSprite.BOARD:clear()
end

function CSprite:srcScreen() -- screen source -- not used
    CSprite.SPRITESRC = CSprite.TARGETSCREEN
end

function CSprite:srcSprite() -- sprite source
    CSprite.SPRITESRC = CSprite.TARGETSPRITE
end

function CSprite:srcBoard() -- board source
    CSprite.SPRITESRC = CSprite.TARGETBOARD
end

function CSprite:dstScreen() -- screen destination
    CSprite.SPRITEDST = CSprite.TARGETSCREEN
end

function CSprite:dstSprite() -- sprite destination -- not used
    CSprite.SPRITEDST = CSprite.TARGETSPRITE
end

function CSprite:dstBoard() -- board destination
    CSprite.SPRITEDST = CSprite.TARGETBOARD
end

function CSprite:modeSpriteScreen() -- sprite source -- screen destination
    CSprite:srcSprite()
    CSprite:dstScreen()
end

function CSprite:modeSpriteBoard() -- sprite source -- board destination
    CSprite:srcSprite()
    CSprite:dstBoard()
end

function CSprite:modeBoardScreen() -- board source -- screen destination
    CSprite:srcBoard()
    CSprite:dstScreen()
end

function CSprite:directivesSrc() -- directives from sprite or board
    if CSprite.SPRITESRC == CSprite.TARGETSPRITE then
        return self:directivesSrcSprite()
    else
        return self:directivesSrcBoard()
    end
end

function CSprite:directivesSrcSprite() -- directives from its sprite/frame -- apply palette, flip, rotate and filter colorkeys
    local _directives = {}

    if self.sprite then -- CSpriteBoard has no sprite
        Tic:logSprite("sprite", self)
        local _sprite = self.sprite + (self.frame * self.frameoffset)
        for _y = 0, Tic.SPRITESIZE - 1 do
            for _x = 0, Tic.SPRITESIZE - 1 do
                local _color = peek4(((Tic.SPRITESVRAM + (32 * _sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x))
                _color = self.palette[_color] or _color --palette
                if not Tables:valFind(self.colorkeys, _color) then -- colorkeys
                    Tables:valInsert(_directives,
                        CDirective{
                            boardx = _x,
                            boardy = _y,
                            color  = _color,
                        }:applyRotate(self.rotate):applyFlip(self.flip),
                        true
                    )
                end
            end
        end
    else
        for _, _directive in ipairs(self.directives) do
            local _color = _directive.color
            _color = self.palette[_color] or _color -- palette
            if not Tables:valFind(self.colorkeys, _color) then -- colorkeys
                Tables:valInsert(_directives,
                    CDirective{
                        boardx = _directive.boardx,
                        boardy = _directive.boardy,
                        color  = _color,
                    }:applyRotate(self.rotate):applyFlip(self.flip),
                    true
                )
            end
        end
    end

    return _directives
end

function CSprite:directivesSrcBoard() -- directives from the board
    local _directives = CSprite.BOARD:directives(CRegion{lf = 0, rg = Tic.SPRITESIZE - 1, up = 0, dw = Tic.SPRITESIZE - 1})

    return _directives
end


function CSprite:drawPixel(_x, _y, _color) -- draw a sprite pixel
    if not self.sprite then return end -- mandatory
    _x = _x or 0
    if not Nums:isBW(_x, 0, Tic.SPRITESIZE - 1) then return end -- mandatory
    _y = _y or 0
    if not Nums:isBW(_y, 0, Tic.SPRITESIZE - 1) then return end -- mandatory
    _color = _color or Tic.COLORKEY -- transparent by default
    if not Nums:isBW(_color, 0, Tic.PALETTESIZE - 1) then return end -- mandatory
    poke4(((Tic.SPRITESVRAM + (32 * self.sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x), _color)
end

function CSprite:drawClear() -- clear a sprite
    if not self.sprite then return end -- mandatory
    for _y = 0, Tic.SPRITESIZE - 1 do
        for _x = 0, Tic.SPRITESIZE - 1 do
            self:drawPixel(_x, _y, nil) -- all transparent
        end
    end
end

function CSprite:drawDst() -- draw a sprite to screen or board
    if CSprite.SPRITEDST == CSprite.TARGETSCREEN then
        return self:drawDstScreen()
    else
        return self:drawDstBoard()
    end
end

function CSprite:drawDstScreen() -- draw a sprite to screen
    if not self.sprite then return end -- mandatory

    self:drawClear()
    for _, _directive in ipairs(self.directives) do
        self:drawPixel(_directive.boardx, _directive.boardy, _directive.color)
    end

    spr(
        self.sprite  + (self.frame * self.frameoffset),
        self.screenx + (self.offsetx * self.scale),
        self.screeny + (self.offsety * self.scale),
        self.colorkeys,
        self.scale,
        Tic.FLIPNONE,
        Tic.ROTATE000,
        self.width,
        self.height
    )
end

function CSprite:drawDstBoard() -- draw a sprite to board
    Tic:logSprite("board ", self)
    CSprite.BOARD:appendDirectives(self.directives, nil, nil, nil, self.offsetx, self.offsety, nil, nil)
end


function CSprite:drawDirectives() -- draw a sprite -- from directives
    local _spriteboard = CSprite{ -- FIXME find a way to clone -- in Classic ? here ?
        sprite      = CSprite.SPRITEBOARD,
        name        = self.name,
        screenx     = self.screenx,
        screeny     = self.screeny,
        offsetx     = self.offsetx,
        offsety     = self.offsety,
        frame       = self.frame,
        frameoffset = self.frameoffset,
        scale       = self.scale,
        flip        = self.flip,
        rotate      = self.rotate,
        width       = self.width,
        height      = self.height,
        palette     = self.palette,
        colorkeys   = self.colorkeys,
        directives  = self:directivesSrc(),
    }

    _spriteboard:drawDst()
end

function CSprite:draw() -- draw a sprite -- direct to screen
    self:paletteApply()
    spr(
        self.sprite  + (self.frame * self.frameoffset),
        self.screenx + (self.offsetx * self.scale),
        self.screeny + (self.offsety * self.scale),
        self.colorkeys,
        self.scale,
        self.flip,
        self.rotate,
        self.width,
        self.height
    )
    self:paletteReset()
end

function CSprite:paletteApply() -- apply palette colors
    for _key, _val in pairs(self.palette or {}) do
        poke4(Tic.PALETTEVRAM + _key, _val)
    end
end

function CSprite:paletteReset() -- reset palette colors
    for _key = 0, 15 do
        poke4(Tic.PALETTEVRAM + _key, _key)
    end
end

--
-- CSpriteBG
--
CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
Classic.KINDSPRITEBG = "SpriteBG"
Classic.NAMESPRITEBG = "SpriteBG"
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SIGNBANK1   = 0  -- signs
CSpriteBG.SIGNEMPTYS  = CSpriteBG.SIGNBANK1 + 00 -- empty sprite -- FIXME move sprites
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
CSpriteFG.EFFECTPARTY = CSpriteFG.EFFECTBANK + 3
CSpriteFG.EFFECTINTMK = CSpriteFG.EFFECTBANK + 4 -- interact mark
CSpriteFG.EFFECTQSTMK = CSpriteFG.EFFECTBANK + 5 -- question mark
CSpriteFG.EFFECTEXCMK = CSpriteFG.EFFECTBANK + 6 -- exclamation mark

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
    self.sprite     = self.spritebank
    self:argt(_argt) -- override if any
end


--
-- CSpriteBoard
--
CSpriteBoard = CSpriteFG:extend() -- board sprites
Classic.KINDSPRITEBOARD = "SpriteBoard"
Classic.NAMESPRITEBOARD = "SpriteBoard"
function CSpriteBoard:new(_argt)
    CSpriteBoard.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEBOARD
    self.name = Classic.NAMESPRITEBOARD
    self.sprite = nil
    self:argt(_argt) -- override if any
end
