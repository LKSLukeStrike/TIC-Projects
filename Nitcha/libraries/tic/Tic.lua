-- Tic object
-- Instance only once
-- Contains constants, globals and general functions
-- 
local Tic = {}


--
-- Packages
local Classic = require("libraries/ext/Classic")                
local Nums = require("libraries/lks/Nums")
local Tables = require("libraries/lks/Tables")
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
Tic.COLOREYESFG   = Tic.COLOR15 -- 4 colors for the eyes
Tic.COLOREYESBGUP = Tic.COLOR14
Tic.COLOREYESBGMD = Tic.COLOR13
Tic.COLOREYESBGDW = Tic.COLOR12
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

Tic.FREQUENCE240 = 240 -- frequences -- each 4 second
Tic.FREQUENCE120 = 120 -- each 2 second
Tic.FREQUENCE090 = 090 -- each 1.5 second
Tic.FREQUENCE060 = 060 -- each 1 second
Tic.FREQUENCE030 = 030 -- each 0.5 second


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


-- Tick System
Tic.Tick00 = 0 -- tick counter from 0
Tic.Tick60 = CCyclerInt{ -- tick cycler from 0-59
    maxindex = 59,
}
function Tic:tick() -- increment the timers
    Tic.Tick00 = Tic.Tick00 + 1
    Tic.Tick60:next()
end


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
        _val = (type(_val) == "table" or type(_val) == "function") -- TODO add more ?
        and type(_val)
        or  _val -- for concat
        _output = _output.._val.." "
    end
    trace(_output)
end

function Tic:traceTable(_table, _indent) -- trace a table  -- SORTED -- RECURSIVE -- INDENT
    Tic:trace(Tables:dump(_table, _indent))
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
CSprite.ROTATE000 = 0 -- sprite rotations
CSprite.ROTATE090 = 1
CSprite.ROTATE180 = 2
CSprite.ROTATE270 = 3
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


local CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
function CSpriteBG:new(_argt)
    CSpriteBG.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


local CSpriteFG = CSprite:extend() -- fg sprites aka tic sprites
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEEMPTY = CSpriteFG.SPRITEBANK + 0 -- empty sprite
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK + 1 -- pixel sprite
CSpriteFG.SPRITEBOARD = CSpriteFG.SPRITEBANK + 2 -- board sprite -- for creating a sprite by code
CSpriteFG.HEADBANK    = 272 -- characters heads
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADDROWE   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADGOGOL   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 6
CSpriteFG.HEADGNOLL   = CSpriteFG.HEADBANK + 7
CSpriteFG.BODYBANK    = 288 -- characters bodies
CSpriteFG.BODYHUMAN   = CSpriteFG.BODYBANK + 0 -- humanoid bodies
CSpriteFG.EYESBANK    = 320 -- characters eyes
CSpriteFG.EYESHUMAN   = CSpriteFG.EYESBANK + 0 -- humanoid eyes
CSpriteFG.STATUSBANK  = 352 -- status types
CSpriteFG.STATUSEMPTY = CSpriteFG.SPRITEEMPTY
CSpriteFG.STATUSSLEEP = CSpriteFG.STATUSBANK + 0
CSpriteFG.STATUSOTHER = CSpriteFG.STATUSBANK + 1
CSpriteFG.STATUSDEATH = CSpriteFG.STATUSBANK + 2
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:argt(_argt) -- override if any
end

local CSpriteFGEmpty = CSpriteFG:extend() -- empty sprites
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEEMPTY
    self:argt(_argt) -- override if any
end

local CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
function CSpriteFGPixel:new(_argt)
    CSpriteFGPixel.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEPIXEL
    self:argt(_argt) -- override if any
end

local CSpriteFGBoard = CSpriteFG:extend() -- board sprites
function CSpriteFGBoard:new(_argt)
    CSpriteFGBoard.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEBOARD
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
CCharacter.STATUSSTAND = "stand" -- character status -- will force the posture if any
CCharacter.STATUSBLOCK = "block"
CCharacter.STATUSSHIFT = "shift"
CCharacter.STATUSKNEEL = "kneel"
CCharacter.STATUSSLEEP = "sleep"
CCharacter.STATUSWOUND = "wound"
CCharacter.STATUSMAGIC = "magic"
CCharacter.STATUSALCHE = "alche"
CCharacter.STATUSKNOCK = "knock"
CCharacter.STATUSFLAME = "flame"
CCharacter.STATUSWATER = "water"
CCharacter.STATUSSTONE = "stone"
CCharacter.STATUSBREEZ = "breez"
CCharacter.STATUSDEATH = "death"
CCharacter.POSTURESTAND = "stand" -- character postures -- for the sprites selections and offsets
CCharacter.POSTUREBLOCK = "block"
CCharacter.POSTURESHIFT = "shift"
CCharacter.POSTUREKNEEL = "kneel"
CCharacter.POSTURESLEEP = "sleep"
CCharacter.STATUSSETTINGS = { -- statuses settings
    [CCharacter.STATUSSTAND] = {
        posture = CCharacter.POSTURESTAND,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [CCharacter.STATUSBLOCK] = {
        posture = CCharacter.POSTUREBLOCK,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [CCharacter.STATUSSHIFT] = {
        posture = CCharacter.POSTURESHIFT,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [CCharacter.STATUSKNEEL] = {
        posture = CCharacter.POSTUREKNEEL,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [CCharacter.STATUSSLEEP] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSSLEEP,
        frequence = Tic.FREQUENCE090,
    },
    [CCharacter.STATUSWOUND] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSMAGIC] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSALCHE] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSKNOCK] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSFLAME] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSWATER] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSSTONE] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSBREEZ] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [CCharacter.STATUSDEATH] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSDEATH,
        frequence = Tic.FREQUENCE120,
    },
}
CCharacter.POSTURESETTINGS = { -- postures settings
    [CCharacter.POSTURESTAND] = {
        bodyspriteoffset = 0,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 0,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [CCharacter.POSTUREBLOCK] = {
        bodyspriteoffset = 1,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 0,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [CCharacter.POSTURESHIFT] = {
        bodyspriteoffset = 2,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 0,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [CCharacter.POSTUREKNEEL] = {
        bodyspriteoffset = 3,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 1,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [CCharacter.POSTURESLEEP] = {
        bodyspriteoffset = 0,
        bodyxoffset = nil, -- nil use size
        bodyyoffset = 2,
        headxoffset = 0,
        headyoffset = 2,
        headusesize = false,
        rotate = CSprite.ROTATE090,
        frame = CSprite.FRAME01, -- fix frame
    },
}
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
    self.status       = CCharacter.STATUSSTAND -- status
    self.posture      = CCharacter.POSTURESTAND -- posture -- depends of the status
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
    self.bodysprite   = CSpriteFG.BODYHUMAN -- body
    self.headsprite   = CSpriteFG.HEADDROWE -- head
    self.eyessprite   = CSpriteFG.EYESHUMAN -- eyes
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
        self.posture = CCharacter.POSTURESTAND
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
    self.posture = CCharacter.STATUSSETTINGS[self.status].posture -- force the posture
    self:_drawStatus()
    -- self:_drawWeapon()
    -- self:_drawShield()
    self:_drawBody()
    self:_drawHead()
end

function CCharacter:_drawStatus()
    if self.status == CCharacter.STATUSSTAND then return self:_drawStatusStand() end
    if self.status == CCharacter.STATUSBLOCK then return self:_drawStatusBlock() end
    if self.status == CCharacter.STATUSSHIFT then return self:_drawStatusShift() end
    if self.status == CCharacter.STATUSKNEEL then return self:_drawStatusKneel() end
    if self.status == CCharacter.STATUSSLEEP then return self:_drawStatusSleep() end
    if self.status == CCharacter.STATUSWOUND then return self:_drawStatusWound() end
    if self.status == CCharacter.STATUSMAGIC then return self:_drawStatusMagic() end
    if self.status == CCharacter.STATUSALCHE then return self:_drawStatusAlche() end
    if self.status == CCharacter.STATUSKNOCK then return self:_drawStatusKnock() end
    if self.status == CCharacter.STATUSFLAME then return self:_drawStatusFlame() end
    if self.status == CCharacter.STATUSWATER then return self:_drawStatusWater() end
    if self.status == CCharacter.STATUSSTONE then return self:_drawStatusStone() end
    if self.status == CCharacter.STATUSBREEZ then return self:_drawStatusBreez() end
    if self.status == CCharacter.STATUSDEATH then return self:_drawStatusDeath() end
end

function CCharacter:_drawStatusStand()
    -- nothing to do -- TODO stress
end

function CCharacter:_drawStatusBlock()
    -- nothing to do -- TODO stress
end

function CCharacter:_drawStatusShift()
    -- nothing to do
end

function CCharacter:_drawStatusKneel()
    -- nothing to do -- TODO stress
end

function CCharacter:_drawStatusSleep()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = self.colorskin, [Tic.COLORGREYL] = self.coloreyesbg,},
        {[Tic.COLORWHITE] = self.coloreyesbg, [Tic.COLORGREYL] = self.colorskin,}
    )
end

function CCharacter:_drawStatusWound()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORRED, [Tic.COLORGREYL] = Tic.COLORPURPLE,},
        {[Tic.COLORWHITE] = Tic.COLORPURPLE, [Tic.COLORGREYL] = Tic.COLORRED,}
    )
end

function CCharacter:_drawStatusMagic()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORCYAN, [Tic.COLORGREYL] = Tic.COLORBLUEM,},
        {[Tic.COLORWHITE] = Tic.COLORBLUEM, [Tic.COLORGREYL] = Tic.COLORCYAN,}
    )
end

function CCharacter:_drawStatusAlche()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORGREENL, [Tic.COLORGREYL] = Tic.COLORGREENM,},
        {[Tic.COLORWHITE] = Tic.COLORGREENM, [Tic.COLORGREYL] = Tic.COLORGREENL,}
    )
end

function CCharacter:_drawStatusKnock()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = self.colorskin, [Tic.COLORGREYL] = self.coloreyesbg,},
        {[Tic.COLORWHITE] = self.coloreyesbg, [Tic.COLORGREYL] = self.colorskin,}
    )
end

function CCharacter:_drawStatusFlame()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORORANGE, [Tic.COLORGREYL] = Tic.COLORRED, [Tic.COLORGREYM] = Tic.COLORPURPLE,},
        {[Tic.COLORWHITE] = Tic.COLORRED, [Tic.COLORGREYL] = Tic.COLORORANGE, [Tic.COLORGREYM] = Tic.COLORPURPLE,}
    )
end

function CCharacter:_drawStatusWater()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORCYAN,},
        {[Tic.COLORWHITE] = Tic.COLORCYAN, [Tic.COLORGREYL] = Tic.COLORWHITE,}
    )
end

function CCharacter:_drawStatusStone()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORGREYM, [Tic.COLORGREYL] = Tic.COLORGREYD,},
        {[Tic.COLORWHITE] = Tic.COLORGREYD, [Tic.COLORGREYL] = Tic.COLORGREYM,}
    )
end

function CCharacter:_drawStatusBreez()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,}
    )
end

function CCharacter:_drawStatusDeath()
    CCharacter._drawStatusSprite(self,
        {[Tic.COLORRED] = Tic.COLORRED, [Tic.COLORPURPLE] = Tic.COLORPURPLE,},
        {[Tic.COLORRED] = Tic.COLORPURPLE, [Tic.COLORPURPLE] = Tic.COLORRED,}
    )
end

function CCharacter:_drawStatusSprite(_palette0, _palette1)
    local _tick00 = Tic.Tick00
    local _statussprite = CCharacter.STATUSSETTINGS[self.status].statussprite -- status sprite
    local _frequence    = CCharacter.STATUSSETTINGS[self.status].frequence -- status frequence
    local _palette = (Nums:frequence01(_tick00, _frequence) == 0)
    and _palette0
    or  _palette1

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite = _statussprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip = self.dirx
    _musprite.scale = self.scale
    _musprite:palettize(_palette)
    _musprite:draw()
end

function CCharacter:_drawWeapon()
end

function CCharacter:_drawShield()
end


local CCharacterHumanoid = CCharacter:extend() -- humanoid characters
-- CCharacterHumanoid.EYESFGXOFFSET = 3
-- CCharacterHumanoid.EYESFGYOFFSET = 2
-- CCharacterHumanoid.EYEXBGLF = 2 -- x eyes offsets
-- CCharacterHumanoid.EYEXFGRG = 4
-- CCharacterHumanoid.EYEXBGRG = 5
-- CCharacterHumanoid.EYEXDWLF = 5 -- down left
-- CCharacterHumanoid.EYEXDWRG = 2 -- down right
-- CCharacterHumanoid.EYEYIDLE = 2 -- y eyes offsets
-- CCharacterHumanoid.EYEYDWBG = 4
-- CCharacterHumanoid.EYEYDWFG = 5
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
    local _posture          = CCharacter.POSTURESETTINGS[self.posture]
    local _bodyspriteoffset = _posture.bodyspriteoffset
    local _bodyxoffset      = _posture.bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXLF)
    and 0 + self.size -- nil use size
    or  _bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXRG)
    and 0 - self.size -- nil use size
    or  _bodyxoffset
    local _bodyyoffset      = _posture.bodyyoffset
    local _bodyrotate       = _posture.rotate
    local _bodyframe        = _posture.frame
    _bodyframe = (_bodyframe)
    and _bodyframe -- fix frame
    or  self.frame

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = self.bodysprite + _bodyspriteoffset -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_bodyxoffset * self.scale)
    _musprite.screeny = self.screeny + (_bodyyoffset * self.scale)
    _musprite.rotate  = _bodyrotate
    _musprite.frame   = _bodyframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx -- flip x if any
    _musprite:palettize{ -- apply body palette
        [Tic.COLORARMOR] = self.colorarmor,
        [Tic.COLORSHIRT] = self.colorshirt,
        [Tic.COLORPANTS] = self.colorpants,
        [Tic.COLORHANDS] = self.colorhands,
    }
    _musprite:draw()
end

function CCharacterHumanoid:_drawHead()
    local _posture     = CCharacter.POSTURESETTINGS[self.posture]
    local _headxoffset = _posture.headxoffset
    local _headyoffset = _posture.headyoffset
    _headyoffset = (_posture.headusesize)
    and _headyoffset + self.size
    or  _headyoffset
    local _headrotate  = _posture.rotate
    local _headframe   = CSprite.FRAME00 -- heads have only one frame

    local _musprite = CSpriteFG() -- multi usage unique sprite
    -- draw head
    _musprite.sprite  = self.headsprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_headxoffset * self.scale)
    _musprite.screeny = self.screeny + (_headyoffset * self.scale)
    _musprite.rotate  = _headrotate
    _musprite.frame   = _headframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx -- flip x if any
    _musprite:palettize{ -- apply head palette
        [Tic.COLORHAIRSFG] = self.colorhairsfg,
        [Tic.COLORHAIRSBG] = self.colorhairsbg,
        [Tic.COLOREXTRA]   = self.colorextra,
        [Tic.COLORSKIN]    = self.colorskin,
    }
    _musprite:draw()

    -- draw eyes
    local _eyescolorfg   = (self.posture ~= CCharacter.POSTURESLEEP)
    and self.coloreyesfg
    or  Tic.COLORGREENL --Tic.COLORKEY
    local _eyescolorbgup = (self.posture ~= CCharacter.POSTURESLEEP and self.diry == Tic.DIRYUP)
    and self.coloreyesbg
    or  Tic.COLORGREENL --Tic.COLORKEY
    local _eyescolorbgmd = (self.posture == CCharacter.POSTURESLEEP or  self.diry == Tic.DIRYMD)
    and self.coloreyesbg
    or  Tic.COLORGREENL --Tic.COLORKEY
    local _eyescolorbgdw = (self.posture ~= CCharacter.POSTURESLEEP and self.diry == Tic.DIRYDW)
    and self.coloreyesbg
    or  Tic.COLORGREENL --Tic.COLORKEY
    _musprite.sprite  = self.eyessprite -- apply the corresponding attributes
    _musprite.palette = {} -- fresh palette
    _musprite:palettize{ -- apply eyes palette
        [Tic.COLOREYESFG]   = _eyescolorfg,
        [Tic.COLOREYESBGUP] = _eyescolorbgup,
        [Tic.COLOREYESBGMD] = _eyescolorbgmd,
        [Tic.COLOREYESBGDW] = _eyescolorbgdw,
    }
    _musprite:draw()
    -- self:_drawEyes()
end

function CCharacterHumanoid:_drawEyes()
    -- self:_drawEyesFG()
    -- self:_drawEyesBG()
end

function CCharacterHumanoid:_drawEyesFG() -- draw fg eyes depending on dir x y
    local _posture     = CCharacter.POSTURESETTINGS[self.posture]
    local _eyesxoffset = (self.dirx == Tic.DIRXLF)
    and _posture.headxoffset + CCharacterHumanoid.EYESFGXOFFSET
    or  _posture.headxoffset - CCharacterHumanoid.EYESFGXOFFSET
    local _eyesyoffset = _posture.headyoffset + CCharacterHumanoid.EYESFGYOFFSET + self.size

    local _eyesrotate  = _posture.rotate
    local _eyesframe   = CSprite.FRAME00 -- eyes have only one frame
    local _eyescolor = self.coloreyesfg -- TODO

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteFG.SPRITEPIXEL -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_eyesxoffset * self.scale)
    _musprite.screeny = self.screeny + (_eyesyoffset * self.scale)
    _musprite.rotate  = _eyesrotate
    _musprite.frame   = _eyesframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx -- flip x if any
    _musprite:palettize{ -- apply eyes palette
        [Tic.COLORWHITE] = _eyescolor,
    }
    _musprite:draw()
end

function CCharacterHumanoid:_drawEyesBG() -- draw bg eyes depending on dir x y
    local _eyesxoffset = (self.dirx == Tic.DIRXLF)
    and CCharacterHumanoid.EYEXBGLF
    or  CCharacterHumanoid.EYEXBGRG
    local _eyesyoffset = (self.posture == CCharacter.POSTUREKNEEL) 
    and CCharacterHumanoid.EYEYIDLE + self.size + self.diry + 1
    or  CCharacterHumanoid.EYEYIDLE + self.size + self.diry
    local _color = self.coloreyesbg
    if self.posture == CCharacter.POSTURESLEEP then
        _eyesxoffset = (self.dirx == Tic.DIRXLF)
        and CCharacterHumanoid.EYEXDWLF
        or  CCharacterHumanoid.EYEXDWRG
        _eyesyoffset = CCharacterHumanoid.EYEYDWBG
        _color = self.coloreyesbg
    end

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite = CSpriteFG.SPRITEPIXEL -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_eyesxoffset * self.scale)
    _musprite.screeny = self.screeny + (_eyesyoffset * self.scale)
    _musprite.scale = self.scale
    _musprite:palettize{ -- apply eyes palette
        [Tic.COLORWHITE] = _color,
    }
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
    self.headsprite   = CSpriteFG.HEADDWARF -- head
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
    self.headsprite   = CSpriteFG.HEADGNOME -- head
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
    self.headsprite   = CSpriteFG.HEADDROWE -- head
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
    self.headsprite   = CSpriteFG.HEADANGEL -- head
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
    self.headsprite   = CSpriteFG.HEADGOGOL -- head
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
    self.headsprite   = CSpriteFG.HEADHORNE -- head
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
    self.headsprite   = CSpriteFG.HEADMEDUZ -- head
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
    self.headsprite   = CSpriteFG.HEADGNOLL -- head
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
local Prinnn = CPlayerGnome{name = "Prinnn",
    coloreyesbg  = Tic.COLORRED,
    coloreyesfg  = Tic.COLORORANGE,
}
local Kaptan = CPlayerMeduz{name = "Kaptan",}
local Kaptin = CPlayerMeduz{name = "Kaptin",
    colorhairsbg = Tic.COLORBLUEL,
    colorhairsfg = Tic.COLORBLUEM,
    coloreyesbg  = Tic.COLORBLUEM,
    coloreyesfg  = Tic.COLORBLUEL,
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
local Sprite = CSpriteFGBoard{
    screenx = 100,
    screeny = 50,
    scale = CSprite.SCALE02,
}


local Statuses = CCyclerTable{acttable = {
    -- CCharacter.STATUSSTAND,
    -- CCharacter.STATUSBLOCK,
    -- CCharacter.STATUSSHIFT,
    -- CCharacter.STATUSKNEEL,
    -- CCharacter.STATUSSLEEP,
    -- CCharacter.STATUSWOUND,
    -- CCharacter.STATUSMAGIC,
    -- CCharacter.STATUSALCHE,
    -- CCharacter.STATUSKNOCK,
    -- CCharacter.STATUSFLAME,
    -- CCharacter.STATUSWATER,
    -- CCharacter.STATUSSTONE,
    -- CCharacter.STATUSBREEZ,
    -- CCharacter.STATUSDEATH,
}}
-- local Statuses = CCyclerTable{acttable = Tables:keys(CCharacter.STATUSSETTINGS)}
local _statustick01 = 0
-- Drawing
function Tic:draw()
    local _tick00 = Tic.Tick00
    local _tick60 = Tic.Tick60.actvalue

    local _frame = _tick60 // 30

    if Nums:frequence01(_tick00, Tic.FREQUENCE240) ~= _statustick01 then
        _statustick01 = Nums:frequence01(_tick00, Tic.FREQUENCE240)
        Statuses:next()
    end
    local _status  = Statuses.actvalue or CCharacter.STATUSSTAND
    local _posture = CCharacter.STATUSSETTINGS[_status].posture

    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("T60:", _tick60)
    Tic:logStack("FRM:", _frame)
    Tic:logStack("STA:", _status)
    Tic:logStack("POS:", _posture)
    Tic:logStack("T00:", _tick00)

    cls()

    -- local _scale = CSprite.SCALE01
    local _scale = CSprite.SCALE02
    local _screenx = 40
    local _screeny = 0
    for _, _character in ipairs({}) do
        -- for _, _character in ipairs({Truduk, Nitcha, Golith,}) do
            -- for _, _character in ipairs(Tic.Players.acttable) do
        _character.status = _status
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
        -- end
    end
    -- Tic.Players.actvalue:portrait(true, true)
    Sprite:draw()

    Tic:logPrint()

    Tic:tick() -- /!\ required in the draw function 
end



-- END
return Tic
