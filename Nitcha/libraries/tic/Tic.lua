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

-- Sprites bank
Tic.SPRITEBANK = 0x4000 -- start at tiles sprites

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
Tic.COLORPORTRAITFG = Tic.COLORWHITE -- 2 colors for portrait frame
Tic.COLORPORTRAITBG = Tic.COLORGREYL
-- TODO weapons fg/bg + status

-- Directions
Tic.DIR000 = 000 -- directions in angles (8)
Tic.DIR045 = 045
Tic.DIR090 = 090
Tic.DIR135 = 135
Tic.DIR180 = 180
Tic.DIR225 = 225
Tic.DIR270 = 270
Tic.DIR315 = 315
Tic.OFFSETZERO = 00 -- offsets for moving in line or diagonal
Tic.OFFSETDIAG = 07
Tic.OFFSETLINE = 10
Tic.DIRS2OFFSETS = { -- directions to x y offsets
    [Tic.DIR000] = {offsetx = 0 + Tic.OFFSETZERO, offsety = 0 - Tic.OFFSETLINE,},
    [Tic.DIR045] = {offsetx = 0 + Tic.OFFSETDIAG, offsety = 0 - Tic.OFFSETDIAG,},
    [Tic.DIR090] = {offsetx = 0 + Tic.OFFSETLINE, offsety = 0 + Tic.OFFSETZERO,},
    [Tic.DIR135] = {offsetx = 0 + Tic.OFFSETDIAG, offsety = 0 + Tic.OFFSETDIAG,},
    [Tic.DIR180] = {offsetx = 0 + Tic.OFFSETZERO, offsety = 0 + Tic.OFFSETLINE,},
    [Tic.DIR225] = {offsetx = 0 - Tic.OFFSETDIAG, offsety = 0 + Tic.OFFSETDIAG,},
    [Tic.DIR270] = {offsetx = 0 - Tic.OFFSETLINE, offsety = 0 + Tic.OFFSETZERO,},
    [Tic.DIR315] = {offsetx = 0 - Tic.OFFSETDIAG, offsety = 0 - Tic.OFFSETDIAG,},
}
Tic.DIRXLF = 0 -- x directions -- also the sprite flip
Tic.DIRXRG = 1
Tic.DIRYMD = 0 -- y directions -- also the sprite offset
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

Tic.KEYBOARDKEYS = 0xFF88 -- keyboard state -- up to 4 pressed keys
-- Keys values
Tic.KEY_UP       = 58
Tic.KEY_DOWN     = 59
Tic.KEY_LEFT     = 60
Tic.KEY_RIGHT    = 61
Tic.KEY_NUMPAD0  = 79
Tic.KEY_NUMPAD1  = 80
Tic.KEY_NUMPAD2  = 81
Tic.KEY_NUMPAD3  = 82
Tic.KEY_NUMPAD4  = 83
Tic.KEY_NUMPAD5  = 84
Tic.KEY_NUMPAD6  = 85
Tic.KEY_NUMPAD7  = 86
Tic.KEY_NUMPAD8  = 87
Tic.KEY_NUMPAD9  = 88

-- Actions values
Tic.ACTIONPLAYERPREV  = "playerPrev"
Tic.ACTIONPLAYERNEXT  = "playerNext"
Tic.ACTIONSTATUSPREV  = "statusPrev"
Tic.ACTIONSTATUSNEXT  = "statusNext"
Tic.ACTIONSTATUSKNEEL = "statusKneel"
Tic.ACTIONSTATUSSLEEP = "statusSleep"
Tic.ACTIONSDIRYUP     = "diryUP"
Tic.ACTIONSDIRYMD     = "diryMD"
Tic.ACTIONSDIRYDW     = "diryDW"

-- Keys to Actions
Tic.KEYS2ACTIONS = {
    [Tic.KEY_LEFT]     = Tic.ACTIONPLAYERPREV,
    [Tic.KEY_RIGHT]    = Tic.ACTIONPLAYERNEXT,
    [Tic.KEY_UP]       = Tic.ACTIONSTATUSPREV,
    [Tic.KEY_DOWN]     = Tic.ACTIONSTATUSNEXT,
    [Tic.KEY_NUMPAD5]  = Tic.ACTIONSTATUSKNEEL,
    [Tic.KEY_NUMPAD0]  = Tic.ACTIONSTATUSSLEEP,
    [Tic.KEY_NUMPAD7]  = Tic.ACTIONSDIRYUP,
    [Tic.KEY_NUMPAD4]  = Tic.ACTIONSDIRYMD,
    [Tic.KEY_NUMPAD1]  = Tic.ACTIONSDIRYDW,
}

-- Actions to Functions
Tic.ACTIONS2FUNCTIONS = {
    [Tic.ACTIONPLAYERPREV]  = function() Tic:playerPrev()  end,
    [Tic.ACTIONPLAYERNEXT]  = function() Tic:playerNext()  end,
    [Tic.ACTIONSTATUSPREV]  = function() Tic:statusPrev()  end,
    [Tic.ACTIONSTATUSNEXT]  = function() Tic:statusNext()  end,
    [Tic.ACTIONSTATUSKNEEL] = function() Tic:statusKneel() end,
    [Tic.ACTIONSTATUSSLEEP] = function() Tic:statusSleep() end,
    [Tic.ACTIONSDIRYUP]     = function() Tic:diryUP()      end,
    [Tic.ACTIONSDIRYMD]     = function() Tic:diryMD()      end,
    [Tic.ACTIONSDIRYDW]     = function() Tic:diryDW()      end,
}


-- Keyboard System -- handle keys pressed to actions to functions
function Tic:keysPressed(_hold, _period) -- returns the pressed keys in a table
    local _result = {}
    for _i = 0, 3 do
        local _key = peek(Tic.KEYBOARDKEYS + _i)
        if _key > 0 and keyp(_key, _hold, _period) then table.insert(_result, _key) end
    end
    return _result
end

function Tic:keysDo(_hold, _period) -- execute functions depending on the pressed keys if any
    local _keyspressed = Tic:keysPressed(_hold, _period)
    for _, _key in ipairs(_keyspressed) do
        if not Tic.KEYS2ACTIONS[_key] then break end -- key not linked to an action -- do nothing
        if not Tic.ACTIONS2FUNCTIONS[Tic.KEYS2ACTIONS[_key]] then break end -- action not linked to a function -- do nothing
        Tic.ACTIONS2FUNCTIONS[Tic.KEYS2ACTIONS[_key]]() -- execute the associated function
    end
end


-- Players System -- handle a players stack
Tic.PLAYERS = CCyclerTable()
function Tic:playerStack(_player) -- stack a new player
    return Tic.PLAYERS:insert(_player)
end

function Tic:playerNext() -- next player in the stack
    return Tic.PLAYERS:next()
end

function Tic:playerPrev() -- prev player in the stack
    return Tic.PLAYERS:prev()
end

function Tic:playerActual() -- actual player in the stack
    return Tic.PLAYERS.actvalue
end


-- Statuses System -- switch between statuses
Tic.STATUSSTAND = "stand" -- character statuses -- will force the posture if any
Tic.STATUSBLOCK = "block"
Tic.STATUSSHIFT = "shift"
Tic.STATUSKNEEL = "kneel"
Tic.STATUSSLEEP = "sleep"
Tic.STATUSWOUND = "wound"
Tic.STATUSMAGIC = "magic"
Tic.STATUSALCHE = "alche"
Tic.STATUSKNOCK = "knock"
Tic.STATUSFLAME = "flame"
Tic.STATUSWATER = "water"
Tic.STATUSSTONE = "stone"
Tic.STATUSBREEZ = "breez"
Tic.STATUSDEATH = "death"
Tic.STATUSES    = CCyclerTable{acttable = { -- all availiable statuses
    Tic.STATUSSTAND,
    Tic.STATUSBLOCK,
    Tic.STATUSSHIFT,
    Tic.STATUSKNEEL,
    Tic.STATUSSLEEP,
    Tic.STATUSWOUND,
    Tic.STATUSMAGIC,
    Tic.STATUSALCHE,
    Tic.STATUSKNOCK,
    Tic.STATUSFLAME,
    Tic.STATUSWATER,
    Tic.STATUSSTONE,
    Tic.STATUSBREEZ,
    Tic.STATUSDEATH,
}}
function Tic:statusPrev() -- prev status in the stack
    Tic:playerActual().status = Tic.STATUSES:prev()
end

function Tic:statusNext() -- next status in the stack
    Tic:playerActual().status = Tic.STATUSES:next()
end

function Tic:statusKneel() -- toggle kneel vs stand
    Tic:playerActual().status = (Tic:playerActual().status == Tic.STATUSKNEEL)
        and Tic.STATUSSTAND
        or  Tic.STATUSKNEEL
end

function Tic:statusSleep() -- toggle sleep vs stand
    Tic:playerActual().status = (Tic:playerActual().status == Tic.STATUSSLEEP)
        and Tic.STATUSSTAND
        or  Tic.STATUSSLEEP
end


-- Directions System -- control the directions up, md, dw and so the eyes
function Tic:diryUP()
    local _diry   = Tic:playerActual().diry
    local _status = Tic:playerActual().status
    Tic:playerActual().status = (_status ~= Tic.STATUSSLEEP) -- change status ?
        and _status
        or  Tic.STATUSSTAND
    Tic:playerActual().diry = Tic.DIRYUP
end

function Tic:diryMD()
    Tic:playerActual().status = (Tic:playerActual().status ~= Tic.STATUSSLEEP)
        and Tic:playerActual().status
        or  Tic.STATUSSTAND
    Tic:playerActual().diry = Tic.DIRYMD
end

function Tic:diryDW()
    Tic:playerActual().status = (Tic:playerActual().status ~= Tic.STATUSSLEEP)
        and Tic:playerActual().status
        or  Tic.STATUSSTAND
    Tic:playerActual().diry = Tic.DIRYDW
end


-- Tick System -- handle timers
Tic.TICK00 = CCyclerInt{ -- tick cycler from 0-maxinteger
    maxindex = math.maxinteger,
}
Tic.TICK60 = CCyclerInt{ -- tick cycler from 0-59
    maxindex = 59,
}
function Tic:tick() -- increment the timers
    Tic.TICK00:next()
    Tic.TICK60:next()
end


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
        Tic:print(0, _line * 8, _item) -- one item per "line"
      end    
    Tic:logClear()
end


-- Time System -- extend functions based on time
function Tic:time2seconds() -- time in seconds
    return math.tointeger(time() // 1000)
end


-- Print System -- extend the simple print function
function Tic:val2string(_val) -- return val or it's type if any for concat
    _val = (type(_val) == "table" or type(_val) == "function" or type(_val) == "nil") -- TODO add more ?
        and type(_val)
        or  _val
    return _val
end

function Tic:print(_screenx, _screeny, ...) -- print with multiple args
    _screenx = _screenx or 0
    _screeny = _screeny or 0
    local _args = {...}
    local _output = ""
    for _, _val in ipairs(_args) do
        _val = Tic:val2string(_val)
        _output = _output.._val.." "
    end
    print( _output, _screenx, _screeny)
end


-- Trace System -- extend the simple trace function
function Tic:trace(...) -- trace with multiple args
    local _args = {...}
    local _output = ""
    for _, _val in ipairs(_args) do
        _val = Tic:val2string(_val)
        _output = _output.._val.." "
    end
    trace(_output)
end

function Tic:traceTable(_table, _indent) -- trace a table  -- SORTED -- RECURSIVE -- INDENT
    Tic:trace(Tables:dump(_table, _indent))
end


-- Palette System -- handle the palette switching
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


-- Board System -- handle the board sprite
function Tic:boardPixel(_sprite, _x, _y, _color) -- paint a pixel to a board sprite
    if not _sprite then return end
    _x = _x or 0
    _y = _y or 0
    _color = _color or Tic.COLORKEY -- transparent by default
    poke4(((Tic.SPRITEBANK + (32 * _sprite)) * 2) + ((_y * 8) + _x), _color)
end

function Tic:boardClean(_sprite) -- clean a board sprite
    if not _sprite then return end
    for _y = 0, 7 do
        for _x = 0, 7 do
            Tic:boardPixel(_sprite, _x, _y, nil) -- all transparent
        end
    end
end

function Tic:boardPaint(_sprite, _directives, _clean) -- paint a board sprite
    if not _sprite then return end
    if not _directives then return end
    _clean = (_clean == nil or _clean == true) and true or false
    if _clean then Tic:boardClean(_sprite) end -- clean by default
    for _, _directive in pairs(_directives) do
        Tic:boardPixel(_sprite, _directive.x, _directive.y, _directive.color) -- paint each pixel
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
    self:_argt(_argt) -- override if any
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

function CSprite:drawC() -- draw a sprite -- CENTERED
    self:_save{"screenx", "screeny",}
    self.screenx = self.screenx - (4 * self.scale) -- center the sprite
    self.screeny = self.screeny - (4 * self.scale)
    self:draw()
    self:_load()
end

function CSprite:palettize(_palette) -- change palette colors if any
    for _key, _val in pairs(_palette or {}) do
        self.palette[_key] = _val
    end
end


local CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
function CSpriteBG:new(_argt)
    CSpriteBG.super.new(self, _argt)
    self:_argt(_argt) -- override if any
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
    self:_argt(_argt) -- override if any
end

local CSpriteFGEmpty = CSpriteFG:extend() -- empty sprites
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEEMPTY
    self:_argt(_argt) -- override if any
end

local CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
function CSpriteFGPixel:new(_argt)
    CSpriteFGPixel.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEPIXEL
    self:_argt(_argt) -- override if any
end

local CSpriteFGBoard = CSpriteFG:extend() -- board sprites
function CSpriteFGBoard:new(_argt)
    CSpriteFGBoard.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEBOARD
    self.directives = {} -- table of painting directives {{x = 0-7, y = 0-7, color = 0-15,}, ...}
    self:_argt(_argt) -- override if any
end

function CSpriteFGBoard:draw()
    Tic:boardPaint(self.sprite, self.directives)
    CSpriteFGBoard.super.draw(self)
end



--
-- Entity
--
local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity:implement(CSprite)
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
    self:_argt(_argt) -- override if any
end


local CObject = CEntity:extend() -- objects


local CCharacter = CEntity:extend() -- characters
CCharacter.SIZEL = 0 -- character sizes -- for the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
CCharacter.POSTURESTAND = "stand" -- character postures -- for the sprites selections and offsets
CCharacter.POSTUREBLOCK = "block"
CCharacter.POSTURESHIFT = "shift"
CCharacter.POSTUREKNEEL = "kneel"
CCharacter.POSTURESLEEP = "sleep"
Tic.STATUSSETTINGS = { -- statuses settings
    [Tic.STATUSSTAND] = {
        posture = CCharacter.POSTURESTAND,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATUSBLOCK] = {
        posture = CCharacter.POSTUREBLOCK,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATUSSHIFT] = {
        posture = CCharacter.POSTURESHIFT,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATUSKNEEL] = {
        posture = CCharacter.POSTUREKNEEL,
        statussprite = CSpriteFG.STATUSEMPTY,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATUSSLEEP] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSSLEEP,
        frequence = Tic.FREQUENCE090,
    },
    [Tic.STATUSWOUND] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSMAGIC] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSALCHE] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSKNOCK] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSFLAME] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSWATER] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSSTONE] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSBREEZ] = {
        posture = CCharacter.POSTURESLEEP,
        statussprite = CSpriteFG.STATUSOTHER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATUSDEATH] = {
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
    self.screenx      = Tic.SCREENW // 2 -- screen positions
    self.screeny      = Tic.SCREENH // 2
    self.portraitx    = Tic.SCREENW // 2 -- portrait positions
    self.portraity    = Tic.SCREENH - (8 * CSprite.SCALE02) + 4
    self.statsx       = self.portraitx - 21 -- stats positions
    self.statsy       = self.portraity
    self.scale        = CSprite.SCALE01 -- scale
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.status       = Tic.STATUSSTAND -- status
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
    self.statphymax   = 5 -- max stats -- 0-10
    self.statmenmax   = 5
    self.statpsymax   = 5
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end

function CCharacter:drawPortrait(_still, _border, _infos) -- draw the portrait -- _still ? -- _border ? -- _infos ?
    _still  = (_still == true)  and true or false
    _border = (_border == true) and true or false
    _infos  = (_infos == true)  and true or false
    self:_save{"screenx", "screeny", "scale", "dirx", "diry", "status", "frame",}
    self.screenx = self.portraitx -- force character attributes
    self.screeny = self.portraity
    self.scale = CSprite.SCALE02
    if _border then
        rectb(self.screenx - self.scale, self.screeny - self.scale, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITBG)
        rectb(self.screenx - self.scale - 1, self.screeny - self.scale - 1, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITFG)
    end
    if _still then
        self.dirx = Tic.DIRXLF
        self.diry = Tic.DIRYMD
        self.status = Tic.STATUSSTAND
        self.frame = CSprite.FRAME00
    end
    self:draw()
    if _infos then
        Tic:print(self.portraitx + (12 * self.scale), self.portraity, self.name)
        Tic:print(self.portraitx + (12 * self.scale), self.portraity + (6 * self.scale), self.kind)
        Tic:print(self.portraitx + (36 * self.scale), self.portraity, "WOX:", self.worldx)
        Tic:print(self.portraitx + (36 * self.scale), self.portraity + (6 * self.scale), "WOY:", self.worldy)
    end
    self:_load()
end

function CCharacter:drawPortraitC(_still, _border, _infos) -- draw the portrait CENTERED
    self:_save{"portraitx", "portraity",}
    self.portraitx = self.portraitx - (4 * CSprite.SCALE02) -- center the sprite
    self.portraity = self.portraity - (4 * CSprite.SCALE02)
    self:drawPortrait(_still, _border, _infos)
    self:_load()
end

function CCharacter:drawStats(_border) -- draw the stats -- _border ?
    self:_save{"scale",} -- TODO change to use constant
    self.scale = CSprite.SCALE02
    if _border then
        rectb(self.statsx - self.scale, self.statsy - self.scale, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITBG)
        rectb(self.statsx - self.scale - 1, self.statsy - self.scale - 1, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITFG)
    end
    rectb(self.statsx + 01, self.statsy + 2, 4, 12, Tic.COLORWHITE) -- phy bar
    rect (self.statsx + 02, self.statsy + 2 + 10 - self.statphyact + 1, 2, self.statphyact, Tic.COLORRED)
    rectb(self.statsx + 01, self.statsy + 2 + 10 - self.statphymax, 4, 1, Tic.COLORWHITE)
    rectb(self.statsx + 06, self.statsy + 2, 4, 12, Tic.COLORWHITE) -- men bar
    rect (self.statsx + 07, self.statsy + 2 + 10 - self.statmenact + 1, 2, self.statmenact, Tic.COLORBLUEM)
    rectb(self.statsx + 06, self.statsy + 2 + 10 - self.statmenmax, 4, 1, Tic.COLORWHITE)
    rectb(self.statsx + 11, self.statsy + 2, 4, 12, Tic.COLORWHITE) -- psy bar
    rect (self.statsx + 12, self.statsy + 2 + 10 - self.statpsyact + 1, 2, self.statpsymax, Tic.COLORGREENM)
    rectb(self.statsx + 11, self.statsy + 2 + 10 - self.statpsymax, 4, 1, Tic.COLORWHITE)
    self:_load()
end

function CCharacter:drawStatsC(_border) -- draw the stats CENTERED
    self:_save{"statsx", "statsy",}
    self.statsx = self.statsx - (4 * CSprite.SCALE02) -- center the sprite
    self.statsy = self.statsy - (4 * CSprite.SCALE02)
    self:drawStats(_border)
    self:_load()
end

function CCharacter:draw()
    self.posture = Tic.STATUSSETTINGS[self.status].posture -- force the posture
    self:_drawStatus()
    -- self:_drawWeapon()
    -- self:_drawShield()
    self:_drawBody()
    self:_drawHead()
end

function CCharacter:_drawStatus()
    if self.status == Tic.STATUSSTAND then return self:_drawStatusStand() end
    if self.status == Tic.STATUSBLOCK then return self:_drawStatusBlock() end
    if self.status == Tic.STATUSSHIFT then return self:_drawStatusShift() end
    if self.status == Tic.STATUSKNEEL then return self:_drawStatusKneel() end
    if self.status == Tic.STATUSSLEEP then return self:_drawStatusSleep() end
    if self.status == Tic.STATUSWOUND then return self:_drawStatusWound() end
    if self.status == Tic.STATUSMAGIC then return self:_drawStatusMagic() end
    if self.status == Tic.STATUSALCHE then return self:_drawStatusAlche() end
    if self.status == Tic.STATUSKNOCK then return self:_drawStatusKnock() end
    if self.status == Tic.STATUSFLAME then return self:_drawStatusFlame() end
    if self.status == Tic.STATUSWATER then return self:_drawStatusWater() end
    if self.status == Tic.STATUSSTONE then return self:_drawStatusStone() end
    if self.status == Tic.STATUSBREEZ then return self:_drawStatusBreez() end
    if self.status == Tic.STATUSDEATH then return self:_drawStatusDeath() end
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
    local _tick00 = Tic.TICK00.actvalue
    local _statussprite = Tic.STATUSSETTINGS[self.status].statussprite -- status sprite
    local _frequence    = Tic.STATUSSETTINGS[self.status].frequence -- status frequence
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
    self:_argt(_argt) -- override if any
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
    local _coloreyesfg   = self.coloreyesfg
    local _coloreyesbgup = self.coloreyesbg
    local _coloreyesbgmd = self.coloreyesbg
    local _coloreyesbgdw = self.coloreyesbg

    if self.posture == CCharacter.POSTURESLEEP then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESFG, Tic.COLOREYESBGUP, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= CCharacter.POSTURESLEEP and self.diry == Tic.DIRYUP then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESBGMD, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= CCharacter.POSTURESLEEP and self.diry == Tic.DIRYMD then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESBGUP, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= CCharacter.POSTURESLEEP and self.diry == Tic.DIRYDW then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESBGUP, Tic.COLOREYESBGMD,}
    end

    _musprite.sprite  = self.eyessprite -- apply the corresponding attributes
    _musprite.palette = {} -- fresh palette
    _musprite:palettize{ -- apply eyes palette
        [Tic.COLOREYESFG]   = _coloreyesfg,
        [Tic.COLOREYESBGUP] = _coloreyesbgup,
        [Tic.COLOREYESBGMD] = _coloreyesbgmd,
        [Tic.COLOREYESBGDW] = _coloreyesbgdw,
    }
    _musprite:draw()
end


local IPlayer = CCharacter:extend() -- players characters interface
function IPlayer:stack()
    Tic:playerStack(self) -- record the new player on tic
end


local CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
CPlayerHumanoid:implement(IPlayer)
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self:stack()
    self:_argt(_argt) -- override if any
end


local CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
CEntity.KINDDWARF = "Dwarf" -- Dwarf kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.kind         = CEntity.KINDDWARF -- kind
    self.size         = CCharacter.SIZES -- size
    self.colorhairsfg = Tic.COLORRED -- colors
    self.colorhairsbg = Tic.COLORORANGE
    self.headsprite   = CSpriteFG.HEADDWARF -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
CEntity.KINDGNOME = "Gnome" -- Gnome kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOME -- kind
    self.size         = CCharacter.SIZES -- size
    self.colorhairsfg = Tic.COLORORANGE -- colors
    self.colorhairsbg = Tic.COLORYELLOW
    self.colorpants   = self.colorskin
    self.headsprite   = CSpriteFG.HEADGNOME -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerDrowe = CPlayerHumanoid:extend() -- Drowe player characters
CEntity.KINDDROWE = "Drowe" -- Drowe kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.kind         = CEntity.KINDDROWE -- kind
    self.size         = CCharacter.SIZEM -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADDROWE -- head
    self.statphymax   = 5
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 4
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
CEntity.KINDANGEL = "Angel" -- Angel kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.kind         = CEntity.KINDANGEL -- kind
    self.size         = CCharacter.SIZEM -- size
    self.colorhairsfg = Tic.COLORGREYM -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = Tic.COLORYELLOW
    self.headsprite   = CSpriteFG.HEADANGEL -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerGogol = CPlayerHumanoid:extend() -- Gogol player characters
CEntity.KINDGOGOL = "Gogol" -- Gogol kind
function CPlayerGogol:new(_argt)
    CPlayerGogol.super.new(self, _argt)
    self.kind         = CEntity.KINDGOGOL -- kind
    self.size         = CCharacter.SIZEL -- size
    self.colorhairsfg = Tic.COLORWHITE -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = self.colorshirt
    self.coloreyesfg  = Tic.COLORBLUEL
    self.coloreyesbg  = Tic.COLORBLUEM
    self.headsprite   = CSpriteFG.HEADGOGOL -- head
    self.statphymax   = 8
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 1
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
CEntity.KINDHORNE = "Horne" -- Horne kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.kind         = CEntity.KINDHORNE -- kind
    self.size         = CCharacter.SIZEL -- size
    self.colorhairsfg = Tic.COLORPURPLE -- colors
    self.colorhairsbg = Tic.COLORRED
    self.colorextra   = Tic.COLORGREYD
    self.size         = CCharacter.SIZEM -- size
    self.headsprite   = CSpriteFG.HEADHORNE -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
CEntity.KINDDEMON = "Demon" -- Demon kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.kind         = CEntity.KINDDEMON -- kind
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
CEntity.KINDTIFEL = "Tifel" -- Tifel kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.kind         = CEntity.KINDTIFEL -- kind
    self.size         = CCharacter.SIZEM -- size
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
CEntity.KINDMEDUZ = "Meduz" -- Meduz kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.kind         = CEntity.KINDMEDUZ -- kind
    self.size         = CCharacter.SIZES -- size
    self.colorhairsfg = Tic.COLORGREEND -- colors
    self.colorhairsbg = Tic.COLORGREENM
    self.headsprite   = CSpriteFG.HEADMEDUZ -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerGnoll = CPlayerHumanoid:extend() -- Gnoll player characters
CEntity.KINDGNOLL = "Gnoll" -- Gnoll kind
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOLL -- kind
    self.size         = CCharacter.SIZEL -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADGNOLL -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerWolfe = CPlayerGnoll:extend() -- Wolfe player characters
CEntity.KINDWOLFE = "Wolfe" -- Wolfe kind
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.kind         = CEntity.KINDWOLFE -- kind
    self:_argt(_argt) -- override if any
end


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters



-- Characters
local Truduk = CPlayerDwarf{name = "Truduk",
}
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
    statphyact = 10,
    statmenact = 00,
}
local SpriteSFB = CSpriteFGBoard{
    screenx = Tic.SCREENW // 2,
    screeny = Tic.SCREENH // 2,
    directives = {
        {x = 2, y = 1, color = Tic.COLORORANGE,},
        {x = 1, y = 2, color = Tic.COLORORANGE,},
        {x = 2, y = 3, color = Tic.COLORORANGE,},
        {x = 2, y = 5, color = Tic.COLORORANGE,},
        {x = 3, y = 1, color = Tic.COLORYELLOW,},
        {x = 1, y = 5, color = Tic.COLORYELLOW,},
        {x = 5, y = 1, color = Tic.COLORRED,},
        {x = 6, y = 1, color = Tic.COLORRED,},
        {x = 4, y = 2, color = Tic.COLORRED,},
        {x = 4, y = 3, color = Tic.COLORRED,},
        {x = 5, y = 3, color = Tic.COLORRED,},
        {x = 3, y = 4, color = Tic.COLORRED,},
        {x = 7, y = 1, color = Tic.COLORPURPLE,},
        {x = 6, y = 3, color = Tic.COLORPURPLE,},
        {x = 4, y = 4, color = Tic.COLORPURPLE,},
        {x = 3, y = 5, color = Tic.COLORPURPLE,},
    },
}
local SpriteFG = CSpriteFG{
    sprite = 442,
    screenx = Tic.SCREENW // 2,
    screeny = Tic.SCREENH // 2,
}



-- Drawing
local _statustick01 = 0
function Tic:draw()
    cls()

    Tic:keysDo(20, 5)
    Tic:drawLog()
    -- Tic:drawFrames()
    Tic:drawDirections()
    Tic:playerActual():drawC()
    Tic:playerActual():drawStatsC(true)
    -- Tic:playerActual():drawPortraitC(true, true, true)
    Tic:playerActual():drawPortraitC(nil, true, true)

    Tic:tick() -- /!\ required in the draw function 
end

function Tic:drawLog()
    local _tick00 = Tic.TICK00.actvalue
    local _tick60 = Tic.TICK60.actvalue
    local _frame = _tick60 // 30

    if Nums:frequence01(_tick00, Tic.FREQUENCE240) ~= _statustick01 then
        _statustick01 = Nums:frequence01(_tick00, Tic.FREQUENCE240)
    end
    local _status  = Tic:playerActual().status
    local _posture = Tic.STATUSSETTINGS[_status].posture

    Tic:logStack("K01:", peek(Tic.KEYBOARDKEYS + 0))
    Tic:logStack("K02:", peek(Tic.KEYBOARDKEYS + 1))
    Tic:logStack("K03:", peek(Tic.KEYBOARDKEYS + 2))
    Tic:logStack("K04:", peek(Tic.KEYBOARDKEYS + 3))
    Tic:logStack("")
    Tic:logStack("PHY:", Tic:playerActual().statphyact, "/", Tic:playerActual().statphymax)
    Tic:logStack("MEN:", Tic:playerActual().statmenact, "/", Tic:playerActual().statmenmax)
    Tic:logStack("PSY:", Tic:playerActual().statpsyact, "/", Tic:playerActual().statpsymax)
    Tic:logStack("TOT:", Tic:playerActual().statphyact + Tic:playerActual().statmenact + Tic:playerActual().statpsyact)
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("")
    Tic:logStack("T60:", _tick60)
    Tic:logStack("FRM:", _frame)
    Tic:logStack("STA:", _status)
    Tic:logStack("POS:", _posture)
    Tic:logStack("T00:", _tick00)

    Tic:logPrint()
end

function Tic:drawFrames()
    local _drawcolor = Tic.COLORGREYD
    rectb(0, 0, Tic.SCREENW, Tic.SCREENH, _drawcolor)
    line(0, 0, Tic.SCREENW, Tic.SCREENH, _drawcolor)
    line(0, Tic.SCREENH, Tic.SCREENW, 0, _drawcolor)
    line(0, Tic.SCREENH // 2, Tic.SCREENW, Tic.SCREENH // 2, _drawcolor)
    line(Tic.SCREENW // 2, 0, Tic.SCREENW // 2, Tic.SCREENH, _drawcolor)
end

function Tic:drawDirections()
    local _drawcolor = Tic.COLORGREYD
    local _screenx = Tic:playerActual().screenx
    local _screeny = Tic:playerActual().screeny
    circb(_screenx, _screeny, 10, _drawcolor)
    for _, _offsets in pairs(Tic.DIRS2OFFSETS) do
        line(_screenx, _screeny, _screenx + _offsets.offsetx, _screeny + _offsets.offsety, _drawcolor)
    end
end



-- END
return Tic
