-- Tic object
-- Instance only once
-- Contains constants, globals and general functions
-- 
local Tic = {}


--
-- Packages
local Classic = require("libraries/ext/Classic")                
local Nums = require("libraries/lks/Nums")
--
-- Includes
require("includes/tic/CCycler")                
            

--
-- Tic
--
-- Screen sizes
Tic.SCREENW = 240 -- screen width
Tic.SCREENH = 136 -- screen height
-- Palette map
Tic.PALETTEMAP = 0x3FF0 * 2 -- vram bank 1
-- Palette colors
Tic.COLOR00 = 00 -- black
Tic.COLOR01 = 01 -- purple
Tic.COLOR02 = 02 -- red
Tic.COLOR03 = 03 -- orange
Tic.COLOR04 = 04 -- yellow
Tic.COLOR05 = 05 -- l green
Tic.COLOR06 = 06 -- m green
Tic.COLOR07 = 07 -- d green
Tic.COLOR08 = 08 -- d blue
Tic.COLOR09 = 09 -- m blue
Tic.COLOR10 = 10 -- l blue
Tic.COLOR11 = 11 -- cyan
Tic.COLOR12 = 12 -- white
Tic.COLOR13 = 13 -- l grey
Tic.COLOR14 = 14 -- m grey
Tic.COLOR15 = 15 -- d grey
-- Palette colors aliases (with the standard palette)
Tic.COLORBLACK  = Tic.COLOR00 -- black
Tic.COLORPURPLE = Tic.COLOR01 -- purple
Tic.COLORRED    = Tic.COLOR02 -- red
Tic.COLORORANGE = Tic.COLOR03 -- orange
Tic.COLORYELLOW = Tic.COLOR04 -- yellow
Tic.COLORGREENL = Tic.COLOR05 -- l green
Tic.COLORGREENM = Tic.COLOR06 -- m green
Tic.COLORGREEND = Tic.COLOR07 -- d green
Tic.COLORBLUEL  = Tic.COLOR10 -- l blue
Tic.COLORBLUEM  = Tic.COLOR09 -- m blue
Tic.COLORBLUED  = Tic.COLOR08 -- d blue
Tic.COLORCYAN   = Tic.COLOR11 -- cyan
Tic.COLORWHITE  = Tic.COLOR12 -- white
Tic.COLORGREYL  = Tic.COLOR13 -- l grey
Tic.COLORGREYM  = Tic.COLOR14 -- m grey
Tic.COLORGREYD  = Tic.COLOR15 -- d grey
-- Special palette colors that can be replaced
Tic.COLORKEY   = Tic.COLOR00 -- transparent color
Tic.COLORARMOR = Tic.COLOR15 -- 4 colors for the bodies
Tic.COLORSHIRT = Tic.COLOR14
Tic.COLORPANTS = Tic.COLOR13
Tic.COLORHANDS = Tic.COLOR12
Tic.COLORHAIRSFG = Tic.COLOR15 -- 4 colors for the heads
Tic.COLORHAIRSBG = Tic.COLOR14
Tic.COLOREXTRA   = Tic.COLOR13
Tic.COLORSKIN    = Tic.COLOR12
-- TODO weapons fg/bg + status
-- Key values
Tic.KEYUP = 26 -- move up (z)
Tic.KEYDW = 19 -- move down (s)
Tic.KEYLF = 17 -- move left (q)
Tic.KEYRG = 04 -- move right (d)
Tic.KEYCR = 03 -- hide on/off (c)

Tic.DIRXLF = 0 -- h directions -- also the sprite flip
Tic.DIRXRG = 1
Tic.DIRYMD = 0 -- v directions -- also the sprite offset
Tic.DIRYUP = Tic.DIRYMD - 1
Tic.DIRYDW = Tic.DIRYMD + 1

Tic.STRESSMIN = 0 -- stress handling
Tic.STRESSMAX = 100

Tic.WEAPONBANK = 448 -- weapons types
Tic.WEAPONEMPTY = -1
Tic.WEAPONMELEE = 0
Tic.WEAPONRANGE = 1
Tic.WEAPONMAGIC = 2
Tic.WEAPONLIGHT = 3
Tic.WEAPONALCHE = 4


-- Log System -- store logs to display each frame
Tic.Log = {}
function Tic:logClear() -- clear the log
    Tic.Log = {}
end

function Tic:logStack(...) -- add item to the log
    local _args = {...}
    local _item = ""
    for _, _val in ipairs(_args) do
        _item = _item.._val.." "
    end
    table.insert(Tic.Log, _item)
end

function Tic:logPrint() -- print the log then clear it
    for _line, _item in ipairs(Tic.Log) do
        _line = _line - 1 -- line start from 0
        print(_item, 0, _line * 8) -- one item per "line"
      end    
    Tic:logClear()
end


-- Tick System -- loop on the tick from 0-59
Tic.Tick = CCyclerInt{
    maxindex = 59,
}


-- Players System -- add new players to a players stack
Tic.Players = CCyclerTable()


-- Time
function Tic:time2seconds() -- time in seconds
    return math.tointeger(time() // 1000)
end


-- Trace
function Tic:trace(...) -- trace with multiple args
    local _args = {...}
    local _output = ""
    for _, _val in pairs(_args) do
        _val = (type(_val) == "table" or type(_val) == "function")
        and type(_val)
        or  _val -- for concat
        _output = _output.._val.." "
    end
    trace(_output)
end

-- TODO sort ?
function Tic:traceTable(_table, _recurse) -- trace a table keys, vals and vals types -- recurse by default
    if type(_table) ~= "table" then return end
    _recurse = (_recurse == false)
    and false
    or  true
    for _key, _val in pairs(_table) do
        if (type(_val) == "table") and _recurse then
            Tic:traceTable(_val, _recurse)
        else
            Tic:trace(_key, _val, type(_val))
        end
    end
end


-- Palette
function Tic:paletteChange(_palette) -- change palette colors if any
    for _key, _val in pairs(_palette or {}) do
        poke4(Tic.PALETTEMAP + _key, _val)
    end
end

function Tic:paletteReset() -- reset palette colors
    for _key = 0, 15 do
        poke4(Tic.PALETTEMAP + _key, _key)
    end
end



--
-- Sprite
--
local CSprite = Classic:extend() -- general sprites
CSprite.SPRITEBANK = 0
CSprite.SCALE01 = 01 -- sprites scales
CSprite.SCALE02 = 02
CSprite.FRAMEOF = 16 -- sprites frames offset multiplier
CSprite.FRAME00 = 00 -- sprites frames -- /!\ start at 0, used to compute the offset
CSprite.FRAME01 = 01
CSprite.ROTATE000 =  0 -- sprite rotations
CSprite.ROTATE090 =  1
CSprite.ROTATE180 =  2
CSprite.ROTATE270 =  3
function CSprite:new(_argt)
    CSprite.super.new(self, _argt)
    self.spritebank = CSprite.SPRITEBANK
    self.sprite = self.spritebank -- initial sprite number
    self.screenx = 0 -- screen positions
    self.screeny = 0
    self.frame = CSprite.FRAME00
    self.colorkey = Tic.COLORKEY -- default colorkey
    self.scale = CSprite.SCALE01 -- default scale
    self.flip = Tic.DIRXLF -- all sprites are dir h left by default
    self.rotate = CSprite.ROTATE000 -- no rotation by default
    self.width = 1 -- sprite 1x1 by default
    self.height = 1
    self.palette = {} -- empty by default, can be filled later
    self:argt(_argt) -- override if any
end

function CSprite:draw() -- draw a sprite
    Tic:paletteChange(self.palette) -- change palette colors if any
    spr(
        self.sprite + (self.frame *  CSprite.FRAMEOF),
        self.screenx,
        self.screeny,
        self.colorkey,
        self.scale,
        self.flip,
        self.rotate,
        self.width,
        self.height
    )
    Tic:paletteReset() -- restore palette colors
end

function CSprite:palettize(_palette) -- change palette colors if any
    for _key, _val in pairs(_palette or {}) do
        self.palette[_key] = _val
    end
end


local CSpriteBG = CSprite:extend() --bg sprites aka tic tiles
function CSpriteBG:new(_argt)
    CSpriteBG.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


local CSpriteFG = CSprite:extend() --fg sprites aka tic sprites
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK -- single pixel
CSpriteFG.HEADBANK    = 272 -- characters heads
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADDROWE   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADGOGOL   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 6
CSpriteFG.HEADGNOLL   = CSpriteFG.HEADBANK + 7
CSpriteFG.BODYHUMAN   = 288 -- humanoid bodies
CSpriteFG.STATUSBANK  = 352 -- status types
CSpriteFG.STATUSSLEEP = CSpriteFG.STATUSBANK + 0
CSpriteFG.STATUSOTHER = CSpriteFG.STATUSBANK + 1
CSpriteFG.STATUSDEATH = CSpriteFG.STATUSBANK + 2
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:argt(_argt) -- override if any
end


--
-- Entity
--
local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity.NAMENOBODY = "Nobody" -- default name
CEntity.KINDENTITY = "Entity" -- default kind
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.name = CEntity.NAMENOBODY
    self.kind = CEntity.KINDENTITY
    self.worldx = CEntity.WORLDX -- world positions
    self.worldy = CEntity.WORLDY
    self:argt(_argt) -- override if any
end


local CObject = CEntity:extend() -- objects


local CCharacter = CEntity:extend() -- characters
CCharacter.SIZEL = 0 -- character sizes -- for the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
CCharacter.POSTUREIDLE = 0 -- character postures -- for the head sprite y offset and the body selection
CCharacter.POSTUREMOVE = 1
CCharacter.POSTUREHIDE = 2
CCharacter.POSTUREDOWN = 3 -- special case -- same than idle with computations
CCharacter.STATUSREADY = 0 -- character status -- will force the posture if any
CCharacter.STATUSSLEEP = 1
CCharacter.STATUSWOUND = 2
CCharacter.STATUSALCHE = 3
CCharacter.STATUSKNOCK = 4
CCharacter.STATUSDEATH = 5
CEntity.KINDCHARACTER = "Character" -- Character kind
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.kind         = CEntity.KINDCHARACTER -- kind
    self.size         = CCharacter.SIZEM -- size
    self.screenx      = 100 -- screen positions
    self.screeny      = 100
    self.portraitx    = 120 -- portrait positions
    self.portraity    = 120
    self.scale        = CSprite.SCALE01 -- scale
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.posture      = CCharacter.POSTUREIDLE -- posture
    self.status       = CCharacter.STATUSREADY -- status
    self.colorhairsfg = Tic.COLORHAIRSFG -- colors
    self.colorhairsbg = Tic.COLORHAIRSBG
    self.colorextra   = Tic.COLOREXTRA
    self.colorskin    = Tic.COLORSKIN
    self.coloreyesfg  = Tic.COLORGREYL
    self.coloreyesbg  = Tic.COLORGREYM
    self.colorarmor   = Tic.COLORARMOR
    self.colorshirt   = Tic.COLORSHIRT
    self.colorpants   = Tic.COLORPANTS
    self.colorhands   = Tic.COLORHANDS
    self.spritebody   = CSpriteFG.BODYHUMAN -- body
    self.spritehead   = CSpriteFG.HEADDROWE -- head
    self:argt(_argt) -- override if any
end

function CCharacter:portrait(_still, _info) -- draw the portrait -- animated or _still
    _still = (_still == true)
    and true
    or  false
    _info = (_info == true)
    and true
    or  false
    local _screenx = self.screenx -- save character attributes
    local _screeny = self.screeny
    local _scale = self.scale
    local _dirx = self.dirx
    local _diry = self.diry
    local _posture = self.posture
    local _frame = self.frame
    self.screenx = self.portraitx -- force character attributes
    self.screeny = self.portraity
    self.scale = CSprite.SCALE02
    if _still then
        self.dirx = Tic.DIRXLF
        self.diry = Tic.DIRYMD
        self.posture = CCharacter.POSTUREIDLE
        self.frame = CSprite.FRAME00
    end
    self:draw()
    if _info then
        print(self.name, self.portraitx + (10 * self.scale), self.portraity)
        print(self.kind, self.portraitx + (10 * self.scale), self.portraity + (5 * self.scale))
    end
    self.screenx = _screenx -- restore character attributes
    self.screeny = _screeny
    self.scale = _scale
    self.dirx = _dirx
    self.diry = _diry
    self.posture = _posture
    self.frame = _frame
end

function CCharacter:draw()
    self:_drawStatus()
    -- self:_drawWeapon()
    -- self:_drawShield()
    self:_drawBody()
    self:_drawHead()
end

function CCharacter:_drawStatus()
    if self.status == CCharacter.STATUSREADY then return self:_drawStatusReady() end
    if self.status == CCharacter.STATUSSLEEP then return self:_drawStatusSleep() end
    if self.status == CCharacter.STATUSWOUND then return self:_drawStatusWound() end
end

function CCharacter:_drawStatusReady()
    -- nothing to do
end

function CCharacter:_drawStatusSleep()
    local _seconds = Tic:time2seconds()
    local _frequence = 4 -- frequence in seconds
    local _colorwhite = (Nums:frequence01(_seconds, _frequence) == 0)
    and self.coloreyesbg
    or  self.coloreyesfg
    local _colorgreyl = (Nums:frequence01(_seconds, _frequence) == 0)
    and self.coloreyesfg
    or  self.coloreyesbg
    self.posture = CCharacter.POSTUREDOWN -- force the posture
    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite = CSpriteFG.STATUSSLEEP
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip = self.dirx
    _musprite.scale = self.scale
    _musprite.palette[Tic.COLORWHITE] = _colorwhite -- apply palette
    _musprite.palette[Tic.COLORGREYL] = _colorgreyl
    _musprite:draw()
end

function CCharacter:_drawStatusWound()
    local _seconds = Tic:time2seconds()
    local _frequence = 2 -- frequence in seconds
    local _colorwhite = (Nums:frequence01(_seconds, _frequence) == 0)
    and Tic.COLORRED
    or  Tic.COLORPURPLE
    local _colorgreyl = (Nums:frequence01(_seconds, _frequence) == 0)
    and Tic.COLORPURPLE
    or  Tic.COLORRED
    self.posture = CCharacter.POSTUREDOWN -- force the posture
    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite = CSpriteFG.STATUSOTHER
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip = self.dirx
    _musprite.scale = self.scale
    _musprite.palette[Tic.COLORWHITE] = _colorwhite -- apply palette
    _musprite.palette[Tic.COLORGREYL] = _colorgreyl
    _musprite.palette[Tic.COLORGREYM] = _colorgreym
    _musprite.palette[Tic.COLORGREYD] = _colorgreyd
    _musprite:draw()
end

function CCharacter:_drawWeapon()
end

function CCharacter:_drawShield()
end


local CCharacterHumanoid = CCharacter:extend() -- humanoid characters
CCharacterHumanoid.EYEXBGLF = 2 -- x eyes offsets
CCharacterHumanoid.EYEXFGLF = 3
CCharacterHumanoid.EYEXFGRG = 4
CCharacterHumanoid.EYEXBGRG = 5
CCharacterHumanoid.EYEXDWLF = 5 -- down left
CCharacterHumanoid.EYEXDWRG = 2 -- down right
CCharacterHumanoid.EYEYIDLE = 2 -- y eyes offsets
CCharacterHumanoid.EYEYDWBG = 4
CCharacterHumanoid.EYEYDWFG = 5
CEntity.KINDHUMANOID = "Humanoid" -- Humanoid kind
function CCharacterHumanoid:new(_argt)
    CCharacterHumanoid.super.new(self, _argt)
    self.kind         = CEntity.KINDHUMANOID -- kind
    self.colorhairsfg = Tic.COLORGREYD -- head colors
    self.colorhairsbg = Tic.COLORGREYM
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = self.colorskin
    self.coloreyesfg  = Tic.COLORGREYL -- eyes colors
    self.coloreyesbg  = Tic.COLORGREYM
    self.colorarmor   = Tic.COLORGREYD -- body colors
    self.colorshirt   = Tic.COLORGREYM
    self.colorpants   = Tic.COLORGREYL
    self.colorhands   = self.colorskin
    self:argt(_argt) -- override if any
end

function CCharacterHumanoid:_drawBody()
    local _musprite = CSpriteFG() -- multi usage unique sprite
    local _sprite = self.spritebody + self.posture
    local _offsetx = 0
    local _offsety = 0
    local _rotate  = CSprite.ROTATE000
    local _frame = self.frame
    if self.posture == CCharacter.POSTUREDOWN then
        _sprite = self.spritebody + CCharacter.POSTUREIDLE
        _offsetx = (self.dirx == Tic.DIRXLF)
        and 0 + self.size
        or  0 - self.size
        _offsety = 2
        _rotate = CSprite.ROTATE090
        _frame = CSprite.FRAME01
    end

    _musprite.sprite = _sprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_offsetx * self.scale)
    _musprite.screeny = self.screeny + (_offsety * self.scale)
    _musprite.rotate = _rotate
    _musprite.frame = _frame
    _musprite.scale = self.scale
    _musprite.flip = self.dirx -- flip h if any
    _musprite.palette[Tic.COLORARMOR] = self.colorarmor -- apply body palette
    _musprite.palette[Tic.COLORSHIRT] = self.colorshirt
    _musprite.palette[Tic.COLORPANTS] = self.colorpants
    _musprite.palette[Tic.COLORHANDS] = self.colorhands
    _musprite:draw()
end

function CCharacterHumanoid:_drawHead()
    local _musprite = CSpriteFG() -- multi usage unique sprite
    local _sprite = self.spritehead
    local _offsetx = 0
    local _offsety = (self.posture == CCharacter.POSTUREHIDE)
    and self.size + 1
    or  self.size
    local _rotate  = CSprite.ROTATE000
    if self.posture == CCharacter.POSTUREDOWN then
        _offsety = 2
        _rotate = CSprite.ROTATE090
    end

    _musprite.sprite = _sprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_offsetx * self.scale)
    _musprite.screeny = self.screeny + (_offsety * self.scale)
    _musprite.rotate = _rotate
    _musprite.scale = self.scale
    _musprite.flip = self.dirx -- flip h if any
    _musprite.palette[Tic.COLORHAIRSFG] = self.colorhairsfg -- apply head palette
    _musprite.palette[Tic.COLORHAIRSBG] = self.colorhairsbg
    _musprite.palette[Tic.COLOREXTRA]   = self.colorextra
    _musprite.palette[Tic.COLORSKIN]    = self.colorskin
    _musprite:draw()
    self:_drawEyes()
end

function CCharacterHumanoid:_drawEyes()
    self:_drawEyesFG()
    self:_drawEyesBG()
end

function CCharacterHumanoid:_drawEyesFG() -- draw fg eyes depending on dir x y
    local _musprite = CSpriteFG() -- multi usage unique sprite
    local _sprite = CSpriteFG.SPRITEPIXEL
    local _offsetx = (self.dirx == Tic.DIRXLF)
    and CCharacterHumanoid.EYEXFGLF
    or  CCharacterHumanoid.EYEXFGRG
    local _offsety = (self.posture == CCharacter.POSTUREHIDE)
    and CCharacterHumanoid.EYEYIDLE + self.size + 1
    or  CCharacterHumanoid.EYEYIDLE + self.size
    local _color = self.coloreyesfg
    if self.posture == CCharacter.POSTUREDOWN then
        _offsetx = (self.dirx == Tic.DIRXLF)
        and CCharacterHumanoid.EYEXDWLF
        or  CCharacterHumanoid.EYEXDWRG
        _offsety = CCharacterHumanoid.EYEYDWFG
        _color = self.colorskin
    end

    _musprite.sprite = _sprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_offsetx * self.scale)
    _musprite.screeny = self.screeny + (_offsety * self.scale)
    _musprite.scale = self.scale
    _musprite.palette[Tic.COLORWHITE] = _color -- apply eyes palette
    _musprite:draw()
end

function CCharacterHumanoid:_drawEyesBG() -- draw bg eyes depending on dir x y
    local _musprite = CSpriteFG() -- multi usage unique sprite
    local _sprite = CSpriteFG.SPRITEPIXEL
    local _offsetx = (self.dirx == Tic.DIRXLF)
    and CCharacterHumanoid.EYEXBGLF
    or  CCharacterHumanoid.EYEXBGRG
    local _offsety = (self.posture == CCharacter.POSTUREHIDE) 
    and CCharacterHumanoid.EYEYIDLE + self.size + self.diry + 1
    or  CCharacterHumanoid.EYEYIDLE + self.size + self.diry
    local _color = self.coloreyesbg
    if self.posture == CCharacter.POSTUREDOWN then
        _offsetx = (self.dirx == Tic.DIRXLF)
        and CCharacterHumanoid.EYEXDWLF
        or  CCharacterHumanoid.EYEXDWRG
        _offsety = CCharacterHumanoid.EYEYDWBG
        _color = self.coloreyesbg -- Tic.COLORGREYM
    end

    _musprite.sprite = _sprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_offsetx * self.scale)
    _musprite.screeny = self.screeny + (_offsety * self.scale)
    _musprite.scale = self.scale
    _musprite.palette[Tic.COLORWHITE] = _color -- apply eyes palette
    _musprite:draw()
end


local IPlayer = CCharacter:extend() -- players characters interface
function IPlayer:stackPlayer()
    Tic.Players:insert(self) -- record the new player on tic
end


local CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
CPlayerHumanoid:implement(IPlayer)
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self:stackPlayer()
    self:argt(_argt) -- override if any
end


local CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
CEntity.KINDDWARF = "Dwarf" -- Dwarf kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.kind = CEntity.KINDDWARF -- kind
    self.colorhairsfg = Tic.COLORRED -- colors
    self.colorhairsbg = Tic.COLORORANGE
    self.size         = CCharacter.SIZES -- size
    self.spritehead   = CSpriteFG.HEADDWARF -- head
    self:argt(_argt) -- override if any
end


local CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
CEntity.KINDGNOME = "Gnome" -- Gnome kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOME -- kind
    self.colorhairsfg = Tic.COLORORANGE -- colors
    self.colorhairsbg = Tic.COLORYELLOW
    self.colorpants   = self.colorskin
    self.size         = CCharacter.SIZES -- size
    self.spritehead   = CSpriteFG.HEADGNOME -- head
    self:argt(_argt) -- override if any
end


local CPlayerDrowe = CPlayerHumanoid:extend() -- Drowe player characters
CEntity.KINDDROWE = "Drowe" -- Drowe kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.kind         = CEntity.KINDDROWE -- kind
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.size         = CCharacter.SIZEM -- size
    self.spritehead   = CSpriteFG.HEADDROWE -- head
    self:argt(_argt) -- override if any
end


local CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
CEntity.KINDANGEL = "Angel" -- Angel kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.kind         = CEntity.KINDANGEL -- kind
    self.colorhairsfg = Tic.COLORGREYM -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = Tic.COLORYELLOW
    self.size         = CCharacter.SIZEM -- size
    self.spritehead   = CSpriteFG.HEADANGEL -- head
    self:argt(_argt) -- override if any
end


local CPlayerGogol = CPlayerHumanoid:extend() -- Gogol player characters
CEntity.KINDGOGOL = "Gogol" -- Gogol kind
function CPlayerGogol:new(_argt)
    CPlayerGogol.super.new(self, _argt)
    self.kind         = CEntity.KINDGOGOL -- kind
    self.colorhairsfg = Tic.COLORWHITE -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = self.colorshirt
    self.coloreyesfg  = Tic.COLORBLUEL
    self.coloreyesbg  = Tic.COLORBLUEM
    self.size         = CCharacter.SIZEL -- size
    self.spritehead   = CSpriteFG.HEADGOGOL -- head
    self:argt(_argt) -- override if any
end


local CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
CEntity.KINDHORNE = "Horne" -- Horne kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.kind         = CEntity.KINDHORNE -- kind
    self.colorhairsfg = Tic.COLORPURPLE -- colors
    self.colorhairsbg = Tic.COLORRED
    self.colorextra   = Tic.COLORGREYD
    self.size         = CCharacter.SIZEM -- size
    self.spritehead   = CSpriteFG.HEADHORNE -- head
    self:argt(_argt) -- override if any
end


local CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
CEntity.KINDDEMON = "Demon" -- Demon kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.kind         = CEntity.KINDDEMON -- kind
    self.size         = CCharacter.SIZEL -- size
    self:argt(_argt) -- override if any
end


local CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
CEntity.KINDTIFEL = "Tifel" -- Tifel kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.kind         = CEntity.KINDTIFEL -- kind
    self:argt(_argt) -- override if any
end


local CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
CEntity.KINDMEDUZ = "Meduz" -- Meduz kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.kind         = CEntity.KINDMEDUZ -- kind
    self.colorhairsfg = Tic.COLORGREEND -- colors
    self.colorhairsbg = Tic.COLORGREENM
    self.size         = CCharacter.SIZES -- size
    self.spritehead   = CSpriteFG.HEADMEDUZ -- head
    self:argt(_argt) -- override if any
end


local CPlayerGnoll = CPlayerHumanoid:extend() -- Gnoll player characters
CEntity.KINDGNOLL = "Gnoll" -- Gnoll kind
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOLL -- kind
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.size         = CCharacter.SIZEL -- size
    self.spritehead   = CSpriteFG.HEADGNOLL -- head
    self:argt(_argt) -- override if any
end


local CPlayerWolfe = CPlayerGnoll:extend() -- Wolfe player characters
CEntity.KINDWOLFE = "Wolfe" -- Wolfe kind
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.kind         = CEntity.KINDWOLFE -- kind
    self:argt(_argt) -- override if any
end


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters



-- Characters
local Truduk = CPlayerDwarf{name = "Truduk",}
local Prinnn = CPlayerGnome{name = "Prinnn",}
local Kaptan = CPlayerMeduz{name = "Kaptan",}
local Kaptin = CPlayerMeduz{name = "Kaptin",
    colorhairsbg = Tic.COLORBLUEL,
    colorhairsfg = Tic.COLORBLUEM,
}
local Nitcha = CPlayerDrowe{name = "Nitcha",}
local Zariel = CPlayerAngel{name = "Zariel",}
local Zikkow = CPlayerTifel{name = "Zikkow",
    colorhairsbg = Tic.COLORGREENM,
    colorhairsfg = Tic.COLORGREEND,
    colorextra   = Tic.COLORGREYM,
    coloreyesbg  = Tic.COLORGREENM,
    coloreyesfg  = Tic.COLORGREENL,
}
local Kaainn = CPlayerDemon{name = "Kaainn",
    colorhairsbg = Tic.COLORGREYL,
    colorhairsfg = Tic.COLORWHITE,
    coloreyesbg  = Tic.COLORBLUEM,
    coloreyesfg  = Tic.COLORBLUEL,
    size         = CCharacter.SIZEM,
    colorshirt   = Tic.COLORPURPLE,
    colorpants   = Tic.COLORRED,
}
local Daemok = CPlayerDemon{name = "Daemok",}
local Golith = CPlayerGogol{name = "Golith",}
local Wulfie = CPlayerWolfe{name = "Wulfie",
    colorextra = Tic.COLORRED,
}
local Sprite = CSprite{
    screenx = 150,
    screeny = 120,
    sprite = 288,
    scale = CSprite.SCALE02,
    rotate = CSprite.ROTATE090,
}
-- Tic:trace("ok")
-- Tic:traceTable(Tic.Players.acttable)
-- exit()


local _postures = CCyclerTable()
_postures:insert(CCharacter.POSTUREIDLE)
_postures:insert(CCharacter.POSTUREMOVE)
_postures:insert(CCharacter.POSTUREHIDE)
_postures:insert(CCharacter.POSTUREDOWN)
-- Drawing
function Tic:draw()
    local _tick = Tic.Tick.actvalue
    if _tick == 0 then
        _postures:next()
        Tic.Players:next()
    end
    local _posture = _postures.actvalue
    local _frame = _tick // 30

    Tic:logStack("T:", _tick)
    Tic:logStack("F:", _frame)
    Tic:logStack("P:", _posture)
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    -- Tic:logStack("S:", Tic:time2seconds())
    -- Tic:logStack("1:", Tic:time2seconds(), 1, Nums:frequence01(Tic:time2seconds(), 1))
    -- Tic:logStack("2:", Tic:time2seconds(), 2, Nums:frequence01(Tic:time2seconds(), 2))
    -- Tic:logStack("3:", Tic:time2seconds(), 3, Nums:frequence01(Tic:time2seconds(), 3))
    -- Tic:logStack("4:", Tic:time2seconds(), 4, Nums:frequence01(Tic:time2seconds(), 4))

    cls()

    -- local _scale = CSprite.SCALE01
    local _scale = CSprite.SCALE02
    local _screenx = 30
    local _screeny = 0
    for _, _character in ipairs(Tic.Players.acttable) do
        _character.status = CCharacter.STATUSREADY
        _character.scale = _scale
        _character.screenx = _screenx
        _character.frame = _frame
        _character.posture = _posture

        _character.screeny = _screeny
        _character.dirx = Tic.DIRXLF
        _character.diry = Tic.DIRYUP
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 2
        _character.dirx = Tic.DIRXLF
        _character.diry = Tic.DIRYMD
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 2
        _character.dirx = Tic.DIRXLF
        _character.diry = Tic.DIRYDW
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 2
        _character.dirx = Tic.DIRXRG
        _character.diry = Tic.DIRYUP
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 2
        _character.dirx = Tic.DIRXRG
        _character.diry = Tic.DIRYMD
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 2
        _character.dirx = Tic.DIRXRG
        _character.diry = Tic.DIRYDW
        _character:draw()
        
        _screenx = _screenx + (8 * _scale) + 2

        -- Tic:logStack("N:", _character.name)
        -- Tic:logStack("K:", _character.kind)
    end
    Tic.Players.actvalue:portrait(true, true)
    -- Sprite:draw()

    Tic:logPrint()

    Tic.Tick:next() -- /!\ required in the draw function
end



-- END
return Tic
