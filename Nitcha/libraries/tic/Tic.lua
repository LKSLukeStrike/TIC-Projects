-- Tic object
-- Instance only once
-- Contains constants, globals and general functions
-- 
local Tic = {}


--
-- Packages
local Classic = require("libraries/ext/Classic")                
local Nums    = require("libraries/lks/Nums")
local Tables  = require("libraries/lks/Tables")
--
-- Includes
require("includes/tic/CCycler")                
            

--
-- Tic
--
-- Screen sizes and positions
Tic.SCREENW = 240 -- screen width
Tic.SCREENH = 136 -- screen height
Tic.SCREENX = 0   -- screen x position
Tic.SCREENY = 0   -- screen y position

-- World Window sizes and positions (hud)
Tic.WORLDWW = 100 --Tic.SCREENH -- world window width
Tic.WORLDWH = 100 --Tic.SCREENH -- world window height
Tic.WORLDWX = 130 --Tic.SCREENW // 2 -- world window x position -- TODO compute that ?
Tic.WORLDWY = 18  --Tic.SCREENH // 2 -- world window y position

-- Palette map
Tic.PALETTEMAP = 0x3FF0 * 2 -- vram bank 1

-- Sprites bank
Tic.SPRITEBANK = 0x4000 -- start at tiles sprites

-- Palette colors
Tic.COLOR00 = 00
Tic.COLOR01 = 01
Tic.COLOR02 = 02
Tic.COLOR03 = 03
Tic.COLOR04 = 04
Tic.COLOR05 = 05
Tic.COLOR06 = 06
Tic.COLOR07 = 07
Tic.COLOR08 = 08
Tic.COLOR09 = 09
Tic.COLOR10 = 10
Tic.COLOR11 = 11
Tic.COLOR12 = 12
Tic.COLOR13 = 13
Tic.COLOR14 = 14
Tic.COLOR15 = 15

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

-- Palette colors for hud
Tic.COLORHUDSCREEN = Tic.COLORBLUED

-- Palette colors for biomes
Tic.COLORBIONIGHT = Tic.COLORBLACK -- TODO rename all ?
Tic.COLORBIOSNOWY = Tic.COLORWHITE
Tic.COLORBIOSANDY = Tic.COLORYELLOW
Tic.COLORBIOGREEN = Tic.COLORGREENM
Tic.COLORBIOROCKY = Tic.COLORGREYL

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
Tic.DIRXLF = 0 -- x directions -- also the sprite flip
Tic.DIRXRG = 1
Tic.DIRYMD = 0 -- y directions -- also the sprite offset
Tic.DIRYUP = Tic.DIRYMD - 1
Tic.DIRYDW = Tic.DIRYMD + 1
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
Tic.DIRS2OFFSETS = { -- directions to x y offsets and dirs
    [Tic.DIR000] = {
        offsetx = 0 + Tic.OFFSETZERO,
        offsety = 0 - Tic.OFFSETLINE,
        dirx = nil,
        diry = Tic.DIRYUP,
    },
    [Tic.DIR045] = {
        offsetx = 0 + Tic.OFFSETDIAG,
        offsety = 0 - Tic.OFFSETDIAG,
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYUP,
    },
    [Tic.DIR090] = {
        offsetx = 0 + Tic.OFFSETLINE,
        offsety = 0 + Tic.OFFSETZERO,
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYMD,
    },
    [Tic.DIR135] = {
        offsetx = 0 + Tic.OFFSETDIAG,
        offsety = 0 + Tic.OFFSETDIAG,
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR180] = {
        offsetx = 0 + Tic.OFFSETZERO,
        offsety = 0 + Tic.OFFSETLINE,
        dirx = nil,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR225] = {
        offsetx = 0 - Tic.OFFSETDIAG,
        offsety = 0 + Tic.OFFSETDIAG,
        dirx = Tic.DIRXLF,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR270] = {
        offsetx = 0 - Tic.OFFSETLINE,
        offsety = 0 + Tic.OFFSETZERO,
        dirx = Tic.DIRXLF,
        diry = Tic.DIRYMD,
    },
    [Tic.DIR315] = {
        offsetx = 0 - Tic.OFFSETDIAG,
        offsety = 0 - Tic.OFFSETDIAG,
        dirx = Tic.DIRXLF,
        diry = Tic.DIRYUP,
    },
}

Tic.STATSMIN  = 0 -- stats handling
Tic.STATSMAX  = 10

Tic.STRESSMIN = 0 -- stress handling
Tic.STRESSMAX = 100

Tic.WEAPONBANK = 448 -- weapons types
Tic.WEAPONEMPTY = -1
Tic.WEAPONMELEE = 0
Tic.WEAPONRANGE = 1
Tic.WEAPONMAGIC = 2
Tic.WEAPONLIGHT = 3
Tic.WEAPONALCHE = 4

Tic.FREQUENCE000 = 000 -- frequences -- each 0 second
Tic.FREQUENCE030 = 030 -- each 0.5 second
Tic.FREQUENCE060 = 060 -- each 1 second
Tic.FREQUENCE090 = 090 -- each 1.5 second
Tic.FREQUENCE120 = 120 -- each 2 second
Tic.FREQUENCE180 = 180 -- each 3 second
Tic.FREQUENCE240 = 240 -- each 4 second
Tic.FREQUENCE300 = 300 -- each 5 second
Tic.FREQUENCE600 = 600 -- each 10 second

Tic.KEYBOARDKEYS = 0xFF88 -- keyboard state -- up to 4 pressed keys
-- Keys values
Tic.KEY_UP             = 58
Tic.KEY_DOWN           = 59
Tic.KEY_LEFT           = 60
Tic.KEY_RIGHT          = 61
Tic.KEY_NUMPAD0        = 79
Tic.KEY_NUMPAD1        = 80
Tic.KEY_NUMPAD2        = 81
Tic.KEY_NUMPAD3        = 82
Tic.KEY_NUMPAD4        = 83
Tic.KEY_NUMPAD5        = 84
Tic.KEY_NUMPAD6        = 85
Tic.KEY_NUMPAD7        = 86
Tic.KEY_NUMPAD8        = 87
Tic.KEY_NUMPAD9        = 88
Tic.KEY_NUMPADPLUS     = 89
Tic.KEY_NUMPADMINUS    = 90
Tic.KEY_NUMPADMULTIPLY = 91
Tic.KEY_NUMPADDIVIDE   = 92
Tic.KEY_B              = 02

-- Actions values
Tic.ACTIONPLAYERPREV  = "playerPrev"
Tic.ACTIONPLAYERNEXT  = "playerNext"
Tic.ACTIONSTATEPREV   = "statePrev"
Tic.ACTIONSTATENEXT   = "stateNext"
Tic.ACTIONTOGGLEWORK  = "toggleWork"
Tic.ACTIONTOGGLEKNEEL = "toggleKneel"
Tic.ACTIONTOGGLESLEEP = "toggleSleep"
Tic.ACTIONMOVE000     = "move000"
Tic.ACTIONMOVE045     = "move045"
Tic.ACTIONMOVE090     = "move090"
Tic.ACTIONMOVE135     = "move135"
Tic.ACTIONMOVE180     = "move180"
Tic.ACTIONMOVE225     = "move225"
Tic.ACTIONMOVE270     = "move270"
Tic.ACTIONMOVE315     = "move315"
Tic.ACTIONDECPHYACT   = "decPhyAct"
Tic.ACTIONINCPHYACT   = "incPhyAct"
Tic.ACTIONBIOMENEXT   = "biomeNext"

-- Keys to Actions
Tic.KEYS2ACTIONS = {
    [Tic.KEY_LEFT]         = Tic.ACTIONPLAYERPREV, -- cycle actual player
    [Tic.KEY_RIGHT]        = Tic.ACTIONPLAYERNEXT,
    [Tic.KEY_UP]           = Tic.ACTIONSTATEPREV, -- cycle state
    [Tic.KEY_DOWN]         = Tic.ACTIONSTATENEXT,
    [Tic.KEY_NUMPADDIVIDE] = Tic.ACTIONTOGGLEWORK, -- toggle posture/status
    [Tic.KEY_NUMPAD5]      = Tic.ACTIONTOGGLEKNEEL,
    [Tic.KEY_NUMPAD0]      = Tic.ACTIONTOGGLESLEEP,
    [Tic.KEY_NUMPAD8]      = Tic.ACTIONMOVE000, -- move
    [Tic.KEY_NUMPAD9]      = Tic.ACTIONMOVE045,
    [Tic.KEY_NUMPAD6]      = Tic.ACTIONMOVE090,
    [Tic.KEY_NUMPAD3]      = Tic.ACTIONMOVE135,
    [Tic.KEY_NUMPAD2]      = Tic.ACTIONMOVE180,
    [Tic.KEY_NUMPAD1]      = Tic.ACTIONMOVE225,
    [Tic.KEY_NUMPAD4]      = Tic.ACTIONMOVE270,
    [Tic.KEY_NUMPAD7]      = Tic.ACTIONMOVE315,
    [Tic.KEY_NUMPADMINUS]  = Tic.ACTIONDECPHYACT,
    [Tic.KEY_NUMPADPLUS]   = Tic.ACTIONINCPHYACT,
    [Tic.KEY_B]            = Tic.ACTIONBIOMENEXT,
}

-- Actions to Functions
Tic.ACTIONS2FUNCTIONS = {
    [Tic.ACTIONPLAYERPREV]  = function() Tic:playerPrev() end,
    [Tic.ACTIONPLAYERNEXT]  = function() Tic:playerNext() end,
    [Tic.ACTIONSTATEPREV]   = function() Tic:statePrev() end,
    [Tic.ACTIONSTATENEXT]   = function() Tic:stateNext() end,
    [Tic.ACTIONTOGGLEWORK]  = function() Tic:toggleWork() end,
    [Tic.ACTIONTOGGLEKNEEL] = function() Tic:toggleKneel() end,
    [Tic.ACTIONTOGGLESLEEP] = function() Tic:toggleSleep() end,
    [Tic.ACTIONMOVE000]     = function() Tic:moveDirection(Tic.DIR000) end,
    [Tic.ACTIONMOVE045]     = function() Tic:moveDirection(Tic.DIR045) end,
    [Tic.ACTIONMOVE090]     = function() Tic:moveDirection(Tic.DIR090) end,
    [Tic.ACTIONMOVE135]     = function() Tic:moveDirection(Tic.DIR135) end,
    [Tic.ACTIONMOVE180]     = function() Tic:moveDirection(Tic.DIR180) end,
    [Tic.ACTIONMOVE225]     = function() Tic:moveDirection(Tic.DIR225) end,
    [Tic.ACTIONMOVE270]     = function() Tic:moveDirection(Tic.DIR270) end,
    [Tic.ACTIONMOVE315]     = function() Tic:moveDirection(Tic.DIR315) end,
    [Tic.ACTIONDECPHYACT]   = function() Tic:stat('dec', "statphyact", 1) end,
    [Tic.ACTIONINCPHYACT]   = function() Tic:stat('inc', "statphyact", 1) end,
    [Tic.ACTIONBIOMENEXT]   = function() Tic:biomeNext() end,
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
function Tic:playerAppend(_player) -- stack a new player
    if Tables:find(Tic.PLAYERS, _player) then return end -- avoid doublons
    return Tic.PLAYERS:insert(_player)
end

function Tic:playerPrev() -- prev player in the stack
    return Tic.PLAYERS:prev()
end

function Tic:playerNext() -- next player in the stack
    return Tic.PLAYERS:next()
end

function Tic:playerActual() -- actual player in the stack
    return Tic.PLAYERS.actvalue
end

function Tic:playerPlayers() -- all players in the stack
    return Tic.PLAYERS.acttable
end


-- State System -- affect the sprites, head offset etc
Tic.POSTURESTAND = "stand" -- postures
Tic.POSTUREKNEEL = "kneel"
Tic.POSTUREFLOOR = "floor"

Tic.STATUSIDLE   = "idle" -- statuses
Tic.STATUSWORK   = "work"
Tic.STATUSMOVE   = "move"
Tic.STATUSSLEEP  = "sleep"
Tic.STATUSBLEED  = "bleed"
Tic.STATUSMAGIC  = "magic"
Tic.STATUSALCHE  = "alche"
Tic.STATUSKNOCK  = "knock"
Tic.STATUSFLAME  = "flame"
Tic.STATUSWATER  = "water"
Tic.STATUSSTONE  = "stone"
Tic.STATUSBREEZ  = "breez"
Tic.STATUSDEATH  = "death"

Tic.STATESTANDIDLE  = Tic.POSTURESTAND..Tic.STATUSIDLE -- states -- concat of posture and status
Tic.STATESTANDWORK  = Tic.POSTURESTAND..Tic.STATUSWORK
Tic.STATESTANDMOVE  = Tic.POSTURESTAND..Tic.STATUSMOVE
Tic.STATEKNEELIDLE  = Tic.POSTUREKNEEL..Tic.STATUSIDLE
Tic.STATEKNEELWORK  = Tic.POSTUREKNEEL..Tic.STATUSWORK
Tic.STATEKNEELMOVE  = Tic.POSTUREKNEEL..Tic.STATUSMOVE
Tic.STATEFLOORSLEEP = Tic.POSTUREFLOOR..Tic.STATUSSLEEP
Tic.STATEFLOORBLEED = Tic.POSTUREFLOOR..Tic.STATUSBLEED
Tic.STATEFLOORMAGIC = Tic.POSTUREFLOOR..Tic.STATUSMAGIC
Tic.STATEFLOORALCHE = Tic.POSTUREFLOOR..Tic.STATUSALCHE
Tic.STATEFLOORKNOCK = Tic.POSTUREFLOOR..Tic.STATUSKNOCK
Tic.STATEFLOORFLAME = Tic.POSTUREFLOOR..Tic.STATUSFLAME
Tic.STATEFLOORWATER = Tic.POSTUREFLOOR..Tic.STATUSWATER
Tic.STATEFLOORSTONE = Tic.POSTUREFLOOR..Tic.STATUSSTONE
Tic.STATEFLOORBREEZ = Tic.POSTUREFLOOR..Tic.STATUSBREEZ
Tic.STATEFLOORDEATH = Tic.POSTUREFLOOR..Tic.STATUSDEATH
Tic.STATES = CCyclerTable{acttable = { -- all available states
    Tic.STATESTANDIDLE,
    Tic.STATESTANDWORK,
    Tic.STATESTANDMOVE,
    Tic.STATEKNEELIDLE,
    Tic.STATEKNEELWORK,
    Tic.STATEKNEELMOVE,
    Tic.STATEFLOORSLEEP, -- S -- TODO find better names ?
    Tic.STATEFLOORBLEED, -- B
    Tic.STATEFLOORMAGIC, -- M
    Tic.STATEFLOORALCHE, -- A
    Tic.STATEFLOORKNOCK, -- K
    Tic.STATEFLOORFLAME, -- F
    Tic.STATEFLOORWATER, -- W
    Tic.STATEFLOORSTONE, -- O
    Tic.STATEFLOORBREEZ, -- Z
    Tic.STATEFLOORDEATH, -- D
}}

function Tic:statePrev(_character) -- prev state in the stack
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:statePrev()
end

function Tic:stateNext(_character) -- next state in the stack
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:stateNext()
end

function Tic:toggleWork(_character) -- toggle idle/move vs work
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:toggleWork()
end

function Tic:toggleKneel(_character) -- toggle stand vs kneel
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:toggleKneel()
end

function Tic:toggleSleep(_character) -- toggle stand vs sleep
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:toggleSleep()
end


-- Directions System -- move to 8 directions depending on status
function Tic:moveDirection(_direction, _character)
    if not _direction then return end -- mandatory
    _character = _character or Tic:playerActual()
    if not _character then return end
    _character:moveDirection(_direction)
end


-- Stats System -- change a stat value
function Tic:stat(_action, _stat, _value, _character) -- modify a stat -- set/dec/inc
    if not _action or not _stat or not _value then return end -- mandatory
    _character = _character or Tic:playerActual()
    if not _character[_stat] then return end -- unknown stat
    if _action == "set" then
        _character[_stat] = _value
    elseif _action == "dec" then
        _character[_stat] = _character[_stat] - _value
    elseif _action == "inc" then
        _character[_stat] = _character[_stat] + _value
    end
    _character[_stat] = math.max(_character[_stat], Tic.STATSMIN) -- stay in range
    _character[_stat] = math.min(_character[_stat], Tic.STATSMAX)
    _character[_stat] = math.floor(_character[_stat]) -- ensure an integer
end


-- Biomes System -- set the current biome
Tic.BIOMES = CCyclerTable{ -- biomes cycler
    acttable = {
        Tic.COLORBIONIGHT, -- TODO add real biomes instead of just colors ?
        Tic.COLORBIOSNOWY,
        Tic.COLORBIOSANDY,
        Tic.COLORBIOGREEN,
        Tic.COLORBIOROCKY,
    },
}

function Tic:biomeNext() -- next biome in the stack
    return Tic.BIOMES:next()
end

function Tic:biomeActual() -- actual biome in the stack
    return Tic.BIOMES.actvalue
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

function Tic:logAppend(...) -- add item to the log
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
    _val = (
        type(_val) == "table" or
        type(_val) == "function" or
        type(_val) == "boolean" or
        type(_val) == "nil"
    ) -- TODO add more types ?
        and tostring(_val)
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
    print( _output, _screenx, _screeny, Tic.COLORGREYM, true)
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

function Tic:traceTable(_title, _table, _argt) -- trace a table  -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    if _title then Tic:trace(_title) end
    Tic:trace(Tables:dump(_table, _argt))
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
    if not _sprite then return end -- mandatory
    _x = _x or 0
    _y = _y or 0
    _color = _color or Tic.COLORKEY -- transparent by default
    poke4(((Tic.SPRITEBANK + (32 * _sprite)) * 2) + ((_y * 8) + _x), _color)
end

function Tic:boardClean(_sprite) -- clean a board sprite
    if not _sprite then return end -- mandatory
    for _y = 0, 7 do
        for _x = 0, 7 do
            Tic:boardPixel(_sprite, _x, _y, nil) -- all transparent
        end
    end
end

function Tic:boardPaint(_sprite, _directives, _clean) -- paint a board sprite
    if not _sprite or not _directives then return end -- mandatory
    _clean = (_clean == nil or _clean == true) and true or false
    if _clean then Tic:boardClean(_sprite) end -- clean by default
    for _, _directive in pairs(_directives) do
        Tic:boardPixel(_sprite, _directive.x, _directive.y, _directive.color) -- paint each pixel
    end
end



--
-- CSprite
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

function CSprite:draw() -- draw a sprite -- DEFAULT
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
    local _scale = self.scale or CSprite.SCALE01
    self.screenx = self.screenx - (4 * _scale) -- center the sprite
    self.screeny = self.screeny - (4 * _scale)
    self:draw()
    self:_load()
end

function CSprite:drawW() -- draw a sprite -- CENTERED -- WORLD WINDOW
    self:_save{"screenx", "screeny",}
    self.screenx = Tic.WORLDWX + self.screenx -- move the sprite into the world window
    self.screeny = Tic.WORLDWY + self.screeny
    self:drawC() -- center the sprite
    self:_load()
end

function CSprite:palettize(_palette) -- change palette colors if any
    for _key, _val in pairs(_palette or {}) do
        self.palette[_key] = _val
    end
end


--
-- CSpriteBG
--
local CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SPRITEEMPTY = CSpriteBG.SPRITEBANK + 0 -- empty sprite
CSpriteBG.BUILDSBANK  = 16 -- buildings
CSpriteBG.PLACEHOUSE  = CSpriteBG.BUILDSBANK + 0
CSpriteBG.PLACETOWER  = CSpriteBG.BUILDSBANK + 1
CSpriteBG.PLACEMANOR  = CSpriteBG.BUILDSBANK + 2
CSpriteBG.PLACEALTAR  = CSpriteBG.BUILDSBANK + 3
CSpriteBG.STANDSBANK  = 32 -- stands
CSpriteBG.PLACEWATER  = CSpriteBG.STANDSBANK + 0
CSpriteBG.PLACESTALL  = CSpriteBG.STANDSBANK + 1
CSpriteBG.FORESTBANK  = 48 -- forests
CSpriteBG.PLACETREE0  = CSpriteBG.FORESTBANK + 0
function CSpriteBG:new(_argt)
    CSpriteBG.super.new(self, _argt)
    self:_argt(_argt) -- override if any
end


--
-- CSpriteFG
--
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
CSpriteFG.BODYHUMANSTANDIDLE = CSpriteFG.BODYHUMAN + 0
CSpriteFG.BODYHUMANSTANDWORK = CSpriteFG.BODYHUMAN + 1
CSpriteFG.BODYHUMANSTANDMOVE = CSpriteFG.BODYHUMAN + 2
CSpriteFG.BODYHUMANKNEELIDLE = CSpriteFG.BODYHUMAN + 4
CSpriteFG.BODYHUMANKNEELWORK = CSpriteFG.BODYHUMAN + 5
CSpriteFG.BODYHUMANKNEELMOVE = CSpriteFG.BODYHUMAN + 6
CSpriteFG.EYESBANK    = 320 -- characters eyes
CSpriteFG.EYESHUMAN   = CSpriteFG.EYESBANK + 0 -- humanoid eyes
CSpriteFG.STATUSBANK  = 336 -- status types
CSpriteFG.STATUSEMPTY = CSpriteFG.SPRITEEMPTY
CSpriteFG.STATUSSLEEP = CSpriteFG.STATUSBANK + 0
CSpriteFG.STATUSWOUND = CSpriteFG.STATUSBANK + 1
CSpriteFG.STATUSDEATH = CSpriteFG.STATUSBANK + 2
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:_argt(_argt) -- override if any
end


--
-- CSpriteFGEmpty
--
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
-- CAnimation
--
local CAnimation = Classic:extend() -- general palette animation for entities
function CAnimation:new(_argt)
    CAnimation.super.new(self, _argt)
    self.frequence = Tic.FREQUENCE060
    self.percent0  = 0.5
    self.palette0  = {}
    self.palette1  = {}
    self:_argt(_argt) -- override if any
end


--
-- CLocations
--
local CLocations = Classic:extend() -- general entities locations -- {worldy {worldx {entity = entity}}}
function CLocations:new(_argt)
    CLocations.super.new(self, _argt)
    self.locations = {}
    self:_argt(_argt) -- override if any
end

function CLocations:append(_entity) -- add a new entity -- /!\ allows doublons
    if not _entity then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy
    if not self.locations[_worldy] then -- new worldy entry
        self.locations[_worldy] = {}
    end
    if not self.locations[_worldy][_worldx] then -- new worldx entry in existing worldy
        self.locations[_worldy][_worldx] = {}
    end
    self.locations[_worldy][_worldx][_entity] = _entity
end

function CLocations:remove(_entity) -- remove an existing entity
    if not _entity then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy
    if not self.locations[_worldy][_worldx][_entity] then return end -- doesnt exist
    self.locations[_worldy][_worldx][_entity] = nil
    if Tables:size(self.locations[_worldy][_worldx]) == 0 then self.locations[_worldy][_worldx] = nil end -- cleanup
    if Tables:size(self.locations[_worldy]) == 0 then self.locations[_worldy] = nil end
end

function CLocations:moveXY(_entity, _worldx, _worldy) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.locations[_entity.worldy][_entity.worldx][_entity] then return end -- doesnt exist
    self:remove(_entity)
    _entity.worldx = _worldx
    _entity.worldy = _worldy
    self:append(_entity)
end

function CLocations:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw) -- entities in region
    if not _worldx or not _worldy or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    local _rangelf = _worldx - _lf -- region around world xy -- /!\ all borders are supposed to be positive
    local _rangerg = _worldx + _rg
    local _rangeup = _worldy - _up
    local _rangedw = _worldy + _dw
    local _result  = {}

    for _keyy, _valy in pairs(self.locations) do -- search for y in range
        if Nums:isBW(_keyy, _rangeup, _rangedw) then
            for _keyx, _valx in pairs(_valy) do -- search for x in range
                if Nums:isBW(_keyx, _rangelf, _rangerg) then
                    for _key, _val in pairs(_valx) do
                        if not _result[_keyy] then -- new worldy entry
                            _result[_keyy] = {}
                        end
                        if not _result[_keyy][_keyx] then -- new worldx entry in existing worldy
                            _result[_keyy][_keyx] = {}
                        end
                        _result[_keyy][_keyx][_val] = _val
                    end
                end
            end
        end
    end
    return _result
end

function CLocations:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey) -- entities in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self:entitiesWorldXYRegion(_worldx, _worldy, _rangex, _rangex, _rangey, _rangey)
end

function CLocations:entitiesEntityRegion(_entity, _lf, _rg, _up, _dw) -- entities in region
    if not _entity or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw)
end

function CLocations:entitiesEntityAround(_entity, _rangex, _rangey) -- entities in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey)
end

--
-- CEntitiesLocations
--
local CEntitiesLocations = Classic:extend() -- general locations for entities
function CEntitiesLocations:new(_argt)
    CEntitiesLocations.super.new(self, _argt)
    self.entities  = {} -- record each entity -- has to have worldx and worldy attributes
    self.locations = CLocations{} -- record each entity locations
    self:_argt(_argt) -- override if any
end

function CEntitiesLocations:append(_entity) -- add a new entity
    if not _entity then return end -- mandatory
    if self.entities[_entity] then return end -- avoid doublons
    self.entities[_entity] = _entity
    self.locations:append(_entity)
end

function CEntitiesLocations:remove(_entity) -- remove an entity
    if not _entity then return end -- mandatory
    if not self.entities[_entity] then return end -- doesnt exist
    self.entities[_entity] = nil
    self.locations:remove(_entity)
end

function CEntitiesLocations:moveXY(_entity, _worldx, _worldy) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.entities[_entity] then return end -- doesnt exist
    self.locations:moveXY(_entity, _worldx, _worldy)
end

function CEntitiesLocations:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw) -- entities in region
    if not _worldx or not _worldy or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    return self.locations:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw)
end

function CEntitiesLocations:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey) -- entities in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.locations:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey)
end

function CEntitiesLocations:entitiesEntityRegion(_entity, _lf, _rg, _up, _dw) -- entities in region
    if not _entity or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    return self.locations:entitiesEntityRegion(_entity, _lf, _rg, _up, _dw)
end

function CEntitiesLocations:entitiesEntityAround(_entity, _rangex, _rangey) -- entities in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.locations:entitiesEntityAround(_entity, _rangex, _rangey)
end


--
-- CWorld
--
local CWorld = Classic:extend() -- general world that contains entities
CWorld.KINDWORLD = "World" -- World kind
CWorld.NAMEWORLD = "World" -- World name
function CWorld:new(_argt)
    CWorld.super.new(self, _argt)
    self.kind = CWorld.KINDWORLD
    self.name = CWorld.NAMEWORLD
    self.entitieslocations = CEntitiesLocations{} -- record world entities and their locations
    self:_argt(_argt) -- override if any
end
-- World instance
local World = CWorld{}

function CWorld:entityAppend(_entity) -- add a new entity in the world
    if not _entity then return end -- mandatory
    self.entitieslocations:append(_entity)
end

function CWorld:entityRemove(_entity) -- remove an entity from the world
    if not _entity then return end -- mandatory
    self.entitieslocations:remove(_entity)
end

function CWorld:entityMoveXY(_entity, _worldx, _worldy) -- move an entity into the world
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    self.entitieslocations:moveXY(_entity, _worldx, _worldy)
    _entity:focus() -- focus its camera on itself
end

function CWorld:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw) -- entities in region
    if not _worldx or not _worldy or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    return self.entitieslocations:entitiesWorldXYRegion(_worldx, _worldy, _lf, _rg, _up, _dw)
end

function CWorld:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey) -- entities in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:entitiesWorldXYAround(_worldx, _worldy, _rangex, _rangey)
end

function CWorld:entitiesEntityRegion(_entity, _lf, _rg, _up, _dw) -- entities in region
    if not _entity or not _lf or not _rg or not _up or not _dw then return end -- mandatory
    return self.entitieslocations:entitiesEntityRegion(_entity, _lf, _rg, _up, _dw)
end

function CWorld:entitiesEntityAround(_entity, _rangex, _rangey) -- entities in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:entitiesEntityAround(_entity, _rangex, _rangey)
end


--
-- CEntity
--
local CEntity = Classic:extend() -- general entities like places, objects, characters, cameras ...
CEntity.KINDENTITY = "Entity" -- Entity kind
CEntity.NAMEENTITY = "Entity" -- Entity name
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.kind = CEntity.KINDENTITY
    self.name = CEntity.NAMEENTITY
    self.world = World -- world that contains the entity -- to override if any
    self.worldx = CEntity.WORLDX -- world positions
    self.worldy = CEntity.WORLDY
    self.camera = nil -- optional camera that follows the entity -- to override if any
    self:_argt(_argt) -- override if any
end

function CEntity:focus() -- focus camera on itself
    if not self.camera then return end -- requires a camera
    self.camera:focusEntity(self)
end

function CEntity:entitiesRegion( _lf, _rg, _up, _dw) -- entities in region from a itself
    if not _lf or not _rg or not _up or not _dw then return end -- mandatory
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:entitiesRegion( _lf, _rg, _up, _dw)
end

function CEntity:entitiesAround() -- entities around itself
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:entitiesAround()
end


--
-- CCamera
--
local CCamera = CEntity:extend() -- camera
CEntity.KINDCAMERA = "Camera" -- Camera kind
CEntity.NAMECAMERA = "Camera" -- Camera name
CCamera.RANGEX = Tic.WORLDWW / 2
CCamera.RANGEY = Tic.WORLDWH / 2
function CCamera:new(_argt)
    CCamera.super.new(self, _argt)
    self.kind = CEntity.KINDCAMERA
    self.name = CEntity.NAMECAMERA
    self.rangex = CCamera.RANGEX
    self.rangey = CCamera.RANGEY
    self:_argt(_argt) -- override if any
end

function CCamera:focusXY(_worldx, _worldy) -- focus camera on world positions -- default to center
    self.worldx = _worldx or self.worldx
    self.worldy = _worldy or self.worldy
end

function CCamera:focusEntity(_entity) -- focus camera on an entity world positions
    if not _entity then return end -- mandatory
    self:focusXY(_entity.worldx, _entity.worldy)
end

function CCamera:entitiesRegion( _lf, _rg, _up, _dw) -- entities in region from a camera
    if not _lf or not _rg or not _up or not _dw then return end -- mandatory
    return self.world:entitiesEntityRegion(self, _lf, _rg, _up, _dw)
end

function CCamera:entitiesAround() -- entities in a camera ranges
    return self.world:entitiesEntityAround(self, self.rangex, self.rangey)
end


--
-- CEntityDrawable
--
local CEntityDrawable = CEntity:extend() -- general entities with a sprite representation
CEntityDrawable:implement(CSprite)
CEntity.KINDDRAWABLE = "Drawable" -- Drawable kind
CEntity.NAMEDRAWABLE = "Drawable" -- Drawable name
function CEntityDrawable:new(_argt)
    CEntityDrawable.super.new(self, _argt)
    self.kind = CEntity.KINDDRAWABLE
    self.name = CEntity.NAMEDRAWABLE
    self.sprite  = CSpriteBG.SPRITEEMPTY
    self.screenx = 0 -- screen positions
    self.screeny = 0
    self.dirx    = Nums:random01() -- random flip lf/rg
    self.solid   = true -- can be traversed or not
    self:_argt(_argt) -- override if any
    self.world:entityAppend(self) -- append itself to the world
end

function CEntityDrawable:draw()
    local _tick00      = Tic.TICK00.actvalue
    local _palette     = self.palette

    for _, _animation in pairs(self.animations or {}) do -- animate
        local _frequence   = _animation.frequence
        local _percent0    = _animation.percent0
        local _palette0    = _animation.palette0
        local _palette1    = _animation.palette1
        local _frequence01 = Nums:frequence01(_tick00, _frequence)
        local _random01    = Nums:random01(_percent0)
        local _palette01   = _frequence01 * _random01
        _palette = (_palette01 == 0)
            and Tables:merge(_palette, _palette0)
            or  Tables:merge(_palette, _palette1)
    end

    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = self.sprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.palette = _palette
    _musprite.flip    = self.dirx
    _musprite:draw()
end



--
-- CPlace
--
local CPlace = CEntityDrawable:extend() -- places
CEntity.KINDPLACE = "Place" -- Place kind
CEntity.NAMEPLACE = "Place" -- Place name
function CPlace:new(_argt)
    CPlace.super.new(self, _argt)
    self.kind = CEntity.KINDPLACE
    self.name = CEntity.NAMEPLACE
    self:_argt(_argt) -- override if any
end


--
-- CPlaceHouse
--
local CPlaceHouse = CPlace:extend() -- houses
CPlaceHouse.PALETTE = {[Tic.COLORWHITE] = Tic.COLORKEY, [Tic.COLORYELLOW] = Tic.COLORGREYM,}
CEntity.KINDHOUSE = "House" -- House kind
CEntity.NAMEHOUSE = "House" -- House name
function CPlaceHouse:new(_argt)
    CPlaceHouse.super.new(self, _argt)
    self.kind = CEntity.KINDHOUSE
    self.name = CEntity.NAMEHOUSE
    self.sprite   = CSpriteBG.PLACEHOUSE
    self.palette  = CPlaceHouse.PALETTE
    self:_argt(_argt) -- override if any
end

local CPlaceHouseAnim = CPlaceHouse:extend() -- anim houses
function CPlaceHouseAnim:new(_argt)
    CPlaceHouseAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- chimney
            frequence = Tic.FREQUENCE180,
            percent0  = 0.9,
            palette0  = {[Tic.COLORWHITE] = Tic.COLORWHITE,},
            palette1  = {[Tic.COLORWHITE] = Tic.COLORORANGE,},
        },
        CAnimation{ -- window
            frequence = Tic.FREQUENCE600,
            percent0  = 0.1,
            palette0  = {[Tic.COLORYELLOW] = Tic.COLORGREYM,},
            palette1  = {[Tic.COLORYELLOW] = Tic.COLORORANGE,},
        },
    }
    self:_argt(_argt) -- override if any
end

local CPlaceHouseIdle = CPlaceHouse:extend() -- idle houses


--
-- CPlaceTower
--
local CPlaceTower = CPlace:extend() -- towers
CPlaceTower.PALETTE = {[Tic.COLORWHITE] = Tic.COLORGREYD, [Tic.COLORYELLOW] = Tic.COLORGREYD,}
CEntity.KINDTOWER = "Tower" -- Tower kind
CEntity.NAMETOWER = "Tower" -- Tower name
function CPlaceTower:new(_argt)
    CPlaceTower.super.new(self, _argt)
    self.kind = CEntity.KINDTOWER
    self.name = CEntity.NAMETOWER
    self.sprite   = CSpriteBG.PLACETOWER
    self.palette  = CPlaceTower.PALETTE
    self:_argt(_argt) -- override if any
end

local CPlaceTowerAnim = CPlaceTower:extend() -- anim towers
function CPlaceTowerAnim:new(_argt)
    CPlaceTowerAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE240,
            percent0  = 0.6,
            palette0  = {[Tic.COLORWHITE] = Tic.COLORGREYD,},
            palette1  = {[Tic.COLORWHITE] = Tic.COLORORANGE,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE120,
            percent0  = 0.1,
            palette0  = {[Tic.COLORYELLOW] = Tic.COLORGREYD,},
            palette1  = {[Tic.COLORYELLOW] = Tic.COLORORANGE,},
        },
    }
    self:_argt(_argt) -- override if any
end

local CPlaceTowerIdle = CPlaceTower:extend() -- idle towers


--
-- CPlaceTrees
--
local CPlaceTrees = CPlace:extend() -- trees
CPlaceTrees.PALETTE = {[Tic.COLORWHITE] = Tic.COLORGREYM, [Tic.COLORYELLOW] = Tic.COLORGREYM,}
CEntity.KINDTREES = "Trees" -- Trees kind
CEntity.NAMETREES = "Trees" -- Trees name
function CPlaceTrees:new(_argt)
    CPlaceTrees.super.new(self, _argt)
    self.kind = CEntity.KINDTREES
    self.name = CEntity.NAMETREES
    self.sprite   = CSpriteBG.PLACETREE0
    self.palette  = CPlaceTrees.PALETTE
    self:_argt(_argt) -- override if any
end

local CPlaceTreesAnim = CPlaceTrees:extend() -- anim trees
function CPlaceTreesAnim:new(_argt)
    CPlaceTreesAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- leaf 1
            frequence = Tic.FREQUENCE240,
            percent0  = 0.6,
            palette0  = {[Tic.COLORWHITE] = Tic.COLORGREYD,},
            palette1  = {[Tic.COLORWHITE] = Tic.COLORORANGE,},
        },
        CAnimation{ -- leaf 2
            frequence = Tic.FREQUENCE120,
            percent0  = 0.1,
            palette0  = {[Tic.COLORYELLOW] = Tic.COLORGREYD,},
            palette1  = {[Tic.COLORYELLOW] = Tic.COLORORANGE,},
        },
    }
    self:_argt(_argt) -- override if any
end

local CPlaceTreesIdle = CPlaceTrees:extend() -- idle trees


--
-- CObject
--
local CObject = CEntityDrawable:extend() -- objects


--
-- CCharacter
--
local CCharacter = CEntityDrawable:extend() -- characters
CCharacter.SIZEL = 0 -- character sizes -- for the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
Tic.STATESETTINGS = { -- states settings
    [Tic.STATESTANDIDLE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATESTANDWORK] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATESTANDMOVE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATEKNEELIDLE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATEKNEELWORK] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATEKNEELMOVE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE060,
    },
    [Tic.STATEFLOORSLEEP] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSLEEP,
        statussprite = CSpriteFG.STATUSSLEEP,
        frequence = Tic.FREQUENCE090,
    },
    [Tic.STATEFLOORBLEED] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBLEED,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORMAGIC] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSMAGIC,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORALCHE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSALCHE,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORKNOCK] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSKNOCK,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORFLAME] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSFLAME,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORWATER] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSWATER,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORSTONE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSTONE,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORBREEZ] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBREEZ,
        frequence = Tic.FREQUENCE030,
    },
    [Tic.STATEFLOORDEATH] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSDEATH,
        frequence = Tic.FREQUENCE120,
    },
}
Tic.POSTURESETTINGS = { -- postures settings
    [Tic.POSTURESTAND] = {
        bodyspriteoffset = 0,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 0,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREKNEEL] = {
        bodyspriteoffset = 4,
        bodyxoffset = 0,
        bodyyoffset = 0,
        headxoffset = 0,
        headyoffset = 1,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREFLOOR] = {
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
Tic.STATUSSETTINGS = { -- statuses settings
    [Tic.STATUSIDLE] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSWORK] = {
        bodyspriteoffset = 1,
        statussprite = CSpriteFG.STATUSEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSMOVE] = {
        bodyspriteoffset = 2,
        statussprite = CSpriteFG.STATUSEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSSLEEP] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSSLEEP,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSBLEED] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORPURPLE, [Tic.COLORGREYL] = Tic.COLORRED,},
    },
    [Tic.STATUSMAGIC] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORBLUEM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORBLUEM, [Tic.COLORGREYL] = Tic.COLORCYAN,},
    },
    [Tic.STATUSALCHE] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREENL, [Tic.COLORGREYL] = Tic.COLORGREENM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREENM, [Tic.COLORGREYL] = Tic.COLORGREENL,},
    },
    [Tic.STATUSKNOCK] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSFLAME] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORORANGE, [Tic.COLORGREYL] = Tic.COLORRED,    [Tic.COLORGREYM] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORORANGE, [Tic.COLORGREYM] = Tic.COLORPURPLE,},
    },
    [Tic.STATUSWATER] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORCYAN,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORWHITE,}
    },
    [Tic.STATUSSTONE] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREYM, [Tic.COLORGREYL] = Tic.COLORGREYD,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYD, [Tic.COLORGREYL] = Tic.COLORGREYM,},
    },
    [Tic.STATUSBREEZ] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSDEATH] = {
        bodyspriteoffset = 0,
        statussprite = CSpriteFG.STATUSDEATH,
        palette0 = {[Tic.COLORRED] = Tic.COLORRED,    [Tic.COLORPURPLE] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORRED] = Tic.COLORPURPLE, [Tic.COLORPURPLE] = Tic.COLORRED,},
     },
}
CEntity.KINDCHARACTER = "Character" -- Character kind
CEntity.NAMECHARACTER = "Character" -- Character name
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.kind         = CEntity.KINDCHARACTER
    self.name         = CEntity.NAMECHARACTER
    self.size         = CCharacter.SIZEM -- size
    self.portraitx    = Tic.SCREENW // 2 -- portrait positions
    self.portraity    = Tic.SCREENH - (8 * CSprite.SCALE02) + 4
    self.statsx       = self.portraitx - 21 -- stats positions
    self.statsy       = self.portraity
    self.scale        = CSprite.SCALE01 -- scale
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.solid        = false -- can be traversed
    self.state        = Tic.STATESTANDIDLE -- state
    self.idlecycler   = CCyclerInt{maxindex = 59, mode = CCycler.MODEBLOCK,} -- cycler to get back to idle
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
    self.statphymax   = 5 -- max stats -- 0-Tic.STATSMAX
    self.statmenmax   = 5
    self.statpsymax   = 5
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
    self.camera       = CCamera{name = self.name.." "..CEntity.NAMECAMERA} -- each character has its own camera
    self:focus() -- focus its camera on itself
end

function CCharacter:drawPortrait(_idle, _border, _infos) -- draw the portrait -- _idle ? -- _border ? -- _infos ?
    _idle   = (_idle == true)  and true or false
    _border = (_border == true) and true or false
    _infos  = (_infos == true)  and true or false
    self:_save{"screenx", "screeny", "scale", "dirx", "diry", "state", "frame",}
    self.screenx = self.portraitx -- force character attributes
    self.screeny = self.portraity
    self.scale = CSprite.SCALE02
    if _border then
        rectb(self.screenx - self.scale, self.screeny - self.scale, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITBG)
        rectb(self.screenx - self.scale - 1, self.screeny - self.scale - 1, (11 * self.scale), (11 * self.scale), Tic.COLORPORTRAITFG)
    end
    if _idle then
        self.dirx = Tic.DIRXLF
        self.diry = Tic.DIRYMD
        self.state = Tic.STATESTANDIDLE
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

function CCharacter:drawPortraitC(_idle, _border, _infos) -- draw the portrait CENTERED
    self:_save{"portraitx", "portraity",}
    self.portraitx = self.portraitx - (4 * CSprite.SCALE02) -- center the sprite
    self.portraity = self.portraity - (4 * CSprite.SCALE02)
    self:drawPortrait(_idle, _border, _infos)
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
    rect (self.statsx + 02, self.statsy + 2 + Tic.STATSMAX - self.statphyact + 1, 2, self.statphyact, Tic.COLORRED)
    rectb(self.statsx + 01, self.statsy + 2 + Tic.STATSMAX - self.statphymax, 4, 1, Tic.COLORWHITE)
    rectb(self.statsx + 06, self.statsy + 2, 4, 12, Tic.COLORWHITE) -- men bar
    rect (self.statsx + 07, self.statsy + 2 + Tic.STATSMAX - self.statmenact + 1, 2, self.statmenact, Tic.COLORBLUEM)
    rectb(self.statsx + 06, self.statsy + 2 + Tic.STATSMAX - self.statmenmax, 4, 1, Tic.COLORWHITE)
    rectb(self.statsx + 11, self.statsy + 2, 4, 12, Tic.COLORWHITE) -- psy bar
    rect (self.statsx + 12, self.statsy + 2 + Tic.STATSMAX - self.statpsyact + 1, 2, self.statpsymax, Tic.COLORGREENM)
    rectb(self.statsx + 11, self.statsy + 2 + Tic.STATSMAX - self.statpsymax, 4, 1, Tic.COLORWHITE)
    self:_load()
end

function CCharacter:drawStatsC(_border) -- draw the stats CENTERED
    self:_save{"statsx", "statsy",}
    self.statsx = self.statsx - (4 * CSprite.SCALE02) -- center the sprite
    self.statsy = self.statsy - (4 * CSprite.SCALE02)
    self:drawStats(_border)
    self:_load()
end

function CCharacter:drawDirs() -- draw the directions and ranges
    local _drawcolor = Tic.COLORWHITE
    local _screenx   = self.screenx
    local _screeny   = self.screeny
    circb(_screenx, _screeny, 10, _drawcolor)
    for _, _offsets in pairs(Tic.DIRS2OFFSETS) do
        line(_screenx, _screeny, _screenx + _offsets.offsetx, _screeny + _offsets.offsety, _drawcolor)
    end
end

function CCharacter:draw()
    self.posture = Tic.STATESETTINGS[self.state].posture -- force the posture
    self:_drawStatus()
    -- self:_drawWeapon()
    -- self:_drawShield()
    self:_drawBody()
    self:_drawHead()
end

function CCharacter:_drawStatus()
    local _state            = self.state
    local _statesettings    = Tic.STATESETTINGS[_state]
    local _posture          = _statesettings.posture
    local _status           = _statesettings.status
    local _frequence        = _statesettings.frequence
    local _statussettings   = Tic.STATUSSETTINGS[_status]

    local _statussprite = _statussettings.statussprite -- status sprite
    local _tick00       = Tic.TICK00.actvalue
    local _palette      = (Nums:frequence01(_tick00, _frequence) == 0)
        and _statussettings.palette0
        or  _statussettings.palette1

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = _statussprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite:palettize(_palette)
    _musprite:draw()
end

function CCharacter:_drawWeapon()
end

function CCharacter:_drawShield()
end

function CCharacter:statePrev() -- prev state in the stack
    self.state = Tic.STATES:prev()
end

function CCharacter:stateNext() -- next state in the stack
    self.state = Tic.STATES:next()
end

function CCharacter:toggleWork() -- toggle idle/move vs work
    local _state = self.state
    local _statesettings = Tic.STATESETTINGS[_state]
    local _posture = _statesettings.posture
    local _status  = _statesettings.status
    if _posture == Tic.POSTUREFLOOR then return end -- cannot toggle work
    _status = (_status == Tic.STATUSWORK)
        and Tic.STATUSIDLE
        or  Tic.STATUSWORK
    self.state = _posture.._status
end

function CCharacter:toggleKneel() -- toggle stand vs kneel
    local _state = self.state
    local _statesettings = Tic.STATESETTINGS[_state]
    local _posture = _statesettings.posture
    local _status  = _statesettings.status
    if _posture == Tic.POSTUREFLOOR and _status ~= Tic.STATUSSLEEP then return end -- cannot toggle sleep
    if _posture == Tic.POSTURESTAND then
        _posture = Tic.POSTUREKNEEL
    elseif _posture == Tic.POSTUREKNEEL then
        _posture = Tic.POSTURESTAND
    elseif _posture == Tic.POSTUREFLOOR then -- sleeping
        _posture = Tic.POSTUREKNEEL
        _status = Tic.STATUSIDLE
    end
    self.state = _posture.._status
end

function CCharacter:toggleSleep() -- toggle stand vs sleep
    local _state = self.state
    local _statesettings = Tic.STATESETTINGS[_state]
    local _posture = _statesettings.posture
    local _status  = _statesettings.status
    if _posture == Tic.POSTUREFLOOR and _status ~= Tic.STATUSSLEEP then return end -- cannot toggle sleep
    _state = (_state == Tic.STATEFLOORSLEEP)
        and Tic.STATESTANDIDLE
        or  Tic.STATEFLOORSLEEP
    self.state = _state
end

function CCharacter:toggleFrame() -- toggle frame 0-1
    self.frame = Nums:toggle01(self.frame) -- animate continuous move in the same dirx
end

function CCharacter:moveXY(_worldx, _worldy)
    if not _worldx or not _worldy then return end -- mandatory
    self.world:entityMoveXY(self, _worldx, _worldy)
end

function CCharacter:moveDirection(_direction)
    if not _direction then return end -- mandatory
    local _state = self.state
    local _statesettings = Tic.STATESETTINGS[_state]
    local _posture = _statesettings.posture
    local _status  = _statesettings.status
    local _offsets = Tic.DIRS2OFFSETS[_direction]
    local _offsetx = _offsets.offsetx
    local _offsety = _offsets.offsety
    local _dirx    = _offsets.dirx
    local _diry    = _offsets.diry
    local _oldx    = self.dirx -- save actual character dirx
    self.dirx = (_dirx) and _dirx or self.dirx -- adjust dirx and diry
    self.diry = (_diry) and _diry or self.diry
    if _posture == Tic.POSTUREFLOOR and _status ~= Tic.STATUSSLEEP then return end -- cannot move
    if _state == Tic.STATEFLOORSLEEP then -- sleep to stand
        self.state = Tic.STATESTANDIDLE
        return
    end
    if _status == Tic.STATUSWORK then -- interrupt work and goes to idle
        self.state = _posture..Tic.STATUSIDLE
        return
    end
    if _status == Tic.STATUSIDLE and self.dirx ~= _oldx then -- simply change dirx
        return
    end
    if _status == Tic.STATUSMOVE and self.dirx ~= _oldx then -- change dirx and goes to idle
        self.state = _posture..Tic.STATUSIDLE
        return
    end
    self.state = _posture..Tic.STATUSMOVE
    self:toggleFrame() -- animate continuous move in the same dirx
    _offsetx = _offsetx * (self.statphyact / Tic.STATSMAX) -- depends of phy act
    _offsety = _offsety * (self.statphyact / Tic.STATSMAX)
    _offsetx = (_posture == Tic.POSTURESTAND) and _offsetx or _offsetx / 2 -- half if kneel
    _offsety = (_posture == Tic.POSTURESTAND) and _offsety or _offsety / 2 -- half if kneel
    _offsetx = (_offsetx < 0) and math.ceil(_offsetx) or math.floor(_offsetx)
    _offsety = (_offsety < 0) and math.ceil(_offsety) or math.floor(_offsety)
    self:moveXY(self.worldx + _offsetx, self.worldy + _offsety)
    self.idlecycler:min() -- reset the idle cycler
end


--
-- CCharacterHumanoid
--
local CCharacterHumanoid = CCharacter:extend() -- humanoid characters
CEntity.KINDHUMANOID = "Humanoid" -- Humanoid kind
function CCharacterHumanoid:new(_argt)
    CCharacterHumanoid.super.new(self, _argt)
    self.kind         = CEntity.KINDHUMANOID
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
    local _state            = self.state
    local _statesettings    = Tic.STATESETTINGS[_state]
    local _posture          = _statesettings.posture
    local _status           = _statesettings.status
    local _posturesettings  = Tic.POSTURESETTINGS[_posture]
    local _statussettings   = Tic.STATUSSETTINGS[_status]

    local _bodyspriteoffset = _posturesettings.bodyspriteoffset + _statussettings.bodyspriteoffset
    local _bodyxoffset      = _posturesettings.bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXLF)
        and 0 + self.size -- nil use size
        or  _bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXRG)
        and 0 - self.size -- nil use size
        or  _bodyxoffset
    local _bodyyoffset      = _posturesettings.bodyyoffset
    local _bodyrotate       = _posturesettings.rotate
    local _bodyframe        = _posturesettings.frame
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
    _musprite.flip    = self.dirx
    _musprite:palettize{ -- apply body palette
        [Tic.COLORARMOR] = self.colorarmor,
        [Tic.COLORSHIRT] = self.colorshirt,
        [Tic.COLORPANTS] = self.colorpants,
        [Tic.COLORHANDS] = self.colorhands,
    }
    _musprite:draw()
end

function CCharacterHumanoid:_drawHead()
    local _state            = self.state
    local _statesettings    = Tic.STATESETTINGS[_state]
    local _posture          = _statesettings.posture
    local _posturesettings  = Tic.POSTURESETTINGS[_posture]

    local _headxoffset = _posturesettings.headxoffset
    local _headyoffset = _posturesettings.headyoffset
    _headyoffset = (_posturesettings.headusesize)
        and _headyoffset + self.size
        or  _headyoffset
    local _headrotate  = _posturesettings.rotate
    local _headframe   = CSprite.FRAME00 -- heads have only one frame

    local _musprite = CSpriteFG() -- multi usage unique sprite
    -- draw head
    _musprite.sprite  = self.headsprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_headxoffset * self.scale)
    _musprite.screeny = self.screeny + (_headyoffset * self.scale)
    _musprite.rotate  = _headrotate
    _musprite.frame   = _headframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
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

    if self.posture == Tic.POSTUREFLOOR then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESFG, Tic.COLOREYESBGUP, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= Tic.POSTUREFLOOR and self.diry == Tic.DIRYUP then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESBGMD, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= Tic.POSTUREFLOOR and self.diry == Tic.DIRYMD then
        _musprite.colorkey = {Tic.COLORKEY, Tic.COLOREYESBGUP, Tic.COLOREYESBGDW,}
    end
    if self.posture ~= Tic.POSTUREFLOOR and self.diry == Tic.DIRYDW then
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
function IPlayer:playerAppend()
    Tic:playerAppend(self) -- record the new player on tic
end


local CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
CPlayerHumanoid:implement(IPlayer)
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self:playerAppend()
    self:_argt(_argt) -- override if any
end


local CPlayerDwarf = CPlayerHumanoid:extend() -- dwarf player characters
CEntity.KINDDWARF = "Dwarf" -- Dwarf kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.kind         = CEntity.KINDDWARF
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


local CPlayerGnome = CPlayerHumanoid:extend() -- gnome player characters
CEntity.KINDGNOME = "Gnome" -- Gnome kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOME
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


local CPlayerDrowe = CPlayerHumanoid:extend() -- drowe player characters
CEntity.KINDDROWE = "Drowe" -- Drowe kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.kind         = CEntity.KINDDROWE
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


local CPlayerAngel = CPlayerHumanoid:extend() -- angel player characters
CEntity.KINDANGEL = "Angel" -- Angel kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.kind         = CEntity.KINDANGEL
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


local CPlayerGogol = CPlayerHumanoid:extend() -- gogol player characters
CEntity.KINDGOGOL = "Gogol" -- Gogol kind
function CPlayerGogol:new(_argt)
    CPlayerGogol.super.new(self, _argt)
    self.kind         = CEntity.KINDGOGOL
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


local CPlayerHorne = CPlayerHumanoid:extend() -- horne player characters
CEntity.KINDHORNE = "Horne" -- Horne kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.kind         = CEntity.KINDHORNE
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


local CPlayerDemon = CPlayerHorne:extend() -- demon player characters
CEntity.KINDDEMON = "Demon" -- Demon kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.kind         = CEntity.KINDDEMON
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerTifel = CPlayerHorne:extend() -- tifel player characters
CEntity.KINDTIFEL = "Tifel" -- Tifel kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.kind         = CEntity.KINDTIFEL
    self.size         = CCharacter.SIZEM -- size
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:_argt(_argt) -- override if any
end


local CPlayerMeduz = CPlayerHumanoid:extend() -- meduz player characters
CEntity.KINDMEDUZ = "Meduz" -- Meduz kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.kind         = CEntity.KINDMEDUZ
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


local CPlayerGnoll = CPlayerHumanoid:extend() -- gnoll player characters
CEntity.KINDGNOLL = "Gnoll" -- Gnoll kind
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.kind         = CEntity.KINDGNOLL
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


local CPlayerWolfe = CPlayerGnoll:extend() -- wolfe player characters
CEntity.KINDWOLFE = "Wolfe" -- Wolfe kind
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.kind         = CEntity.KINDWOLFE
    self:_argt(_argt) -- override if any
end


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters



--
-- Places
--
if false then
local House01 = CPlaceHouseAnim{
    worldx = -15,
    worldy = 5,
}

local House02 = CPlaceHouseIdle{
    worldx = 20,
    worldy = 20,
    palette = Tables:merge(CPlaceHouse.PALETTE, {[Tic.COLORRED] = Tic.COLORGREENM,}),
}

local Tower01 = CPlaceTowerAnim{
    worldx = -10,
    worldy = 25,
}

local Tower02 = CPlaceTowerIdle{
    worldx = 15,
    worldy = -10,
}

local Trees01 = CPlaceTreesIdle{
    worldx = 25,
    worldy = 15,
}

local Trees02 = CPlaceTreesIdle{
    worldx = -20,
    worldy = -7,
}
end


--
-- Players
--
local Truduk = CPlayerDwarf{name = "Truduk",
    worldx = 0, --math.random(0 - Tic.WORLDWLF, Tic.WORLDWRG),
    worldy = 0, --math.random(0 - Tic.WORLDWUP, Tic.WORLDWDW),
}
-- local Prinnn = CPlayerGnome{name = "Prinnn",
--     coloreyesbg  = Tic.COLORRED,
--     coloreyesfg  = Tic.COLORORANGE,
--     worldx = -20,
--     worldy = -10,
-- }
-- local Kaptan = CPlayerMeduz{name = "Kaptan",}
-- local Kaptin = CPlayerMeduz{name = "Kaptin",
--     colorhairsbg = Tic.COLORBLUEL,
--     colorhairsfg = Tic.COLORBLUEM,
--     coloreyesbg  = Tic.COLORBLUEM,
--     coloreyesfg  = Tic.COLORBLUEL,
-- }
-- local Nitcha = CPlayerDrowe{name = "Nitcha",
--     worldx = math.random(0 - Tic.WORLDWLF, Tic.WORLDWRG),
--     worldy = math.random(0 - Tic.WORLDWUP, Tic.WORLDWDW),
-- }
-- local Zariel = CPlayerAngel{name = "Zariel",}
-- local Zikkow = CPlayerTifel{name = "Zikkow",
--     colorhairsbg = Tic.COLORGREENM,
--     colorhairsfg = Tic.COLORGREEND,
--     colorextra   = Tic.COLORGREYM,
--     coloreyesbg  = Tic.COLORGREENM,
--     coloreyesfg  = Tic.COLORGREENL,
-- }
-- local Kaainn = CPlayerDemon{name = "Kaainn",
--     colorhairsbg = Tic.COLORGREYL,
--     colorhairsfg = Tic.COLORWHITE,
--     coloreyesbg  = Tic.COLORBLUEM,
--     coloreyesfg  = Tic.COLORBLUEL,
--     size         = CCharacter.SIZEM,
--     colorshirt   = Tic.COLORPURPLE,
--     colorpants   = Tic.COLORRED,
-- }
-- local Daemok = CPlayerDemon{name = "Daemok",}
-- local Golith = CPlayerGogol{name = "Golith",
--     worldx = math.random(0 - Tic.WORLDWLF, Tic.WORLDWRG),
--     worldy = math.random(0 - Tic.WORLDWUP, Tic.WORLDWDW),
-- }
-- local Wulfie = CPlayerWolfe{name = "Wulfie",
--     colorextra = Tic.COLORRED,
-- }

goto runit
::debug::
::runit::

--
-- Sprites -- TESTING
--
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


--
-- Drawing
--
local _statustick01 = 0
function Tic:draw()
    cls(Tic.COLORHUDSCREEN)

    Tic:drawWorldWGround()

    Tic:drawPlayerActual()

    -- Tic:drawWorldWFrames()
    Tic:drawScreenGuides()
    Tic:drawWorldWGuides()

    -- Tic:drawLog()
    Tic:logPrint()

    Tic:tick() -- /!\ required in the draw function 
end

function Tic:drawScreenGuides()
    local _drawcolor = Tic.COLORYELLOW
    rectb(Tic.SCREENX, Tic.SCREENY, -- border
        Tic.SCREENW, Tic.SCREENH,
        _drawcolor
    )
    line(Tic.SCREENX, Tic.SCREENY, -- diag up lf - dw rg
        Tic.SCREENX + Tic.SCREENW - 1, Tic.SCREENY + Tic.SCREENH - 1,
        _drawcolor
    )
    line(Tic.SCREENX, Tic.SCREENY + Tic.SCREENH - 1, -- diag dw lf - up rg
        Tic.SCREENX + Tic.SCREENW - 1, Tic.SCREENY,
        _drawcolor
    )
    line(Tic.SCREENX, Tic.SCREENY + (Tic.SCREENH // 2) - 1, -- hline md
        Tic.SCREENX + Tic.SCREENW - 1, Tic.SCREENY + (Tic.SCREENH // 2) - 1,
        _drawcolor
    )
    line(Tic.SCREENX + (Tic.SCREENW // 2), Tic.SCREENY, -- vline md
        Tic.SCREENX + (Tic.SCREENW // 2), Tic.SCREENY + Tic.SCREENH - 1,
        _drawcolor
    )
end

function Tic:drawWorldWGround()
    local _drawcolor = Tic:biomeActual()
    rect(Tic.WORLDWX, Tic.WORLDWY,
        Tic.WORLDWW, Tic.WORLDWH,
        _drawcolor
    )
end

function Tic:drawWorldWFrames()
    local _maskcolor = Tic.COLORRED --Tic.COLORHUDSCREEN -- to hide the surrounding rectangle
    local _drawcolor = Tic.COLORGREYL
    rect(Tic.WORLDWX - 8, Tic.WORLDWY, -- lf mask
        8, Tic.WORLDWH,
        _maskcolor
    )
    rect(Tic.WORLDWX + Tic.WORLDWW, Tic.WORLDWY, -- rg mask
        8, Tic.WORLDWH,
        _maskcolor
    )
    rect(Tic.WORLDWX - 8, Tic.WORLDWY - 8, -- up mask
        Tic.WORLDWW + 16, 8,
        _maskcolor
    )
    rect(Tic.WORLDWX - 8, Tic.WORLDWY + Tic.WORLDWH, -- dw mask
        Tic.WORLDWW + 16, 8,
        _maskcolor
    )
    rectb(Tic.WORLDWX, Tic.WORLDWY, -- border
        Tic.WORLDWW, Tic.WORLDWH,
        _drawcolor
    )
end

function Tic:drawWorldWGuides()
    local _drawcolor = Tic.COLORGREENL
    rectb(Tic.WORLDWX, Tic.WORLDWY, -- border
        Tic.WORLDWW, Tic.WORLDWH,
        _drawcolor
    )
    line(Tic.WORLDWX, Tic.WORLDWY, -- diag up lf - dw rg
        Tic.WORLDWX + Tic.WORLDWW - 1, Tic.WORLDWY + Tic.WORLDWH - 1,
        _drawcolor
    )
    line(Tic.WORLDWX, Tic.WORLDWY + Tic.WORLDWH - 1, -- diag dw lf - up rg
        Tic.WORLDWX + Tic.WORLDWW - 1, Tic.WORLDWY,
        _drawcolor
    )
    line(Tic.WORLDWX, Tic.WORLDWY + (Tic.WORLDWH // 2) - 1, -- hline md
        Tic.WORLDWX + Tic.WORLDWW - 1, Tic.WORLDWY + (Tic.WORLDWH // 2),
        _drawcolor
    )
    line(Tic.WORLDWX + (Tic.WORLDWW // 2), Tic.WORLDWY, -- vline md
        Tic.WORLDWX + (Tic.WORLDWW // 2), Tic.WORLDWY + Tic.WORLDWH - 1,
        _drawcolor
    )
end

function Tic:drawPlayerActual()
    local _playeractual = Tic:playerActual()
    local _idlecycler  = _playeractual.idlecycler
    _idlecycler:next()

    Tic:keysDo(20, 10)
    local _state   = _playeractual.state
    local _posture = Tic.STATESETTINGS[_state].posture
    local _status  = Tic.STATESETTINGS[_state].status
    if _posture ~= Tic.POSTUREFLOOR then -- stand or kneel
        if _status == Tic.STATUSWORK and _idlecycler.actvalue == _idlecycler.maxindex then -- animate work
            _playeractual:toggleFrame()
            _idlecycler:min()
        else -- reset to idle if any
            _playeractual.state = (_idlecycler.actvalue == _idlecycler.maxindex)
                and _posture..Tic.STATUSIDLE
                or  _playeractual.state
        end
    end

    local _worldx         = _playeractual.worldx
    local _worldy         = _playeractual.worldy
    local _entitiesaround = _playeractual:entitiesAround()
    local _keyys          = Tables:keys(_entitiesaround)
    for _, _keyy in pairs(_keyys) do -- draw entities visible by the actual player sorted by y first
        local _keyxs      = Tables:keys(_entitiesaround[_keyy])
        for _, _keyx in pairs(_keyxs) do -- sorted by x next
            for _entity, _ in pairs(_entitiesaround[_keyy][_keyx]) do -- draw entities at the same x y
                local _offsetx  = _entity.worldx - _worldx
                local _offsety  = _entity.worldy - _worldy
                _entity.screenx = (Tic.SCREENW // 2) + _offsetx
                _entity.screeny = (Tic.SCREENH // 2) + _offsety
                _entity:drawW()
            end
        end
    end

    Tic:logAppend("WLF:", Tic.WORLDWLF)
    Tic:logAppend("WRG:", Tic.WORLDWRG)
    Tic:logAppend("WUP:", Tic.WORLDWUP)
    Tic:logAppend("WDW:", Tic.WORLDWDW)

    Tic:logAppend(_playeractual.name)

    Tic:logAppend("WOX:", _playeractual.worldx)
    Tic:logAppend("WOY:", _playeractual.worldy)
    Tic:logAppend("SCX:", _playeractual.screenx)
    Tic:logAppend("SCY:", _playeractual.screeny)

    -- _playeractual:drawStatsC(true)
    -- _playeractual:drawPortraitC(nil, true, true)
    -- _playeractual:drawDirs()
end

function Tic:drawLog()
    local _tick00 = Tic.TICK00.actvalue
    local _tick60 = Tic.TICK60.actvalue
    local _frame = _tick60 // 30

    if Nums:frequence01(_tick00, Tic.FREQUENCE240) ~= _statustick01 then
        _statustick01 = Nums:frequence01(_tick00, Tic.FREQUENCE240)
    end
    local _playeractual = Tic:playerActual()
    local _state   = _playeractual.state
    local _posture = Tic.STATESETTINGS[_state].posture
    local _status  = Tic.STATESETTINGS[_state].status
    local _dirx    = _playeractual.dirx
    local _diry    = _playeractual.diry

    -- Tic:logAppend("K01:", peek(Tic.KEYBOARDKEYS + 0))
    -- Tic:logAppend("K02:", peek(Tic.KEYBOARDKEYS + 1))
    -- Tic:logAppend("K03:", peek(Tic.KEYBOARDKEYS + 2))
    -- Tic:logAppend("K04:", peek(Tic.KEYBOARDKEYS + 3))
    -- Tic:logAppend()
    Tic:logAppend("PHY:", _playeractual.statphyact, "/", _playeractual.statphymax)
    Tic:logAppend("MEN:", _playeractual.statmenact, "/", _playeractual.statmenmax)
    Tic:logAppend("PSY:", _playeractual.statpsyact, "/", _playeractual.statpsymax)
    Tic:logAppend("TOT:", _playeractual.statphyact + _playeractual.statmenact + _playeractual.statpsyact)
    Tic:logAppend()
    Tic:logAppend("STA:", _state)
    Tic:logAppend("POS:", _posture)
    Tic:logAppend("STS:", _status)
    Tic:logAppend("DIX:", _dirx)
    Tic:logAppend("DIY:", _diry)
    Tic:logAppend()
    -- Tic:logAppend("T60:", _tick60)
    -- Tic:logAppend("FRM:", _frame)
    -- Tic:logAppend("T00:", _tick00)
    -- Tic:logAppend("IDL:", _playeractual.idlecycler.actvalue)
    Tic:logAppend("SCX:", _playeractual.screenx)
    Tic:logAppend("SCY:", _playeractual.screeny)
    Tic:logAppend()
    Tic:logAppend("CAX:", _playeractual.camera.worldx)
    Tic:logAppend("CAY:", _playeractual.camera.worldy)

    Tic:logPrint()
end



-- END
return Tic
