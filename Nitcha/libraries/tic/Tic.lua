-- Tic object
-- Instance only once
-- Contains constants, globals and general functions
-- 

--
-- Packages
local Nums = require("libraries/lks/Nums")
local Classic = require("libraries/ext/Classic")



--
-- Tic
--
local Tic = {}
-- Screen sizes
Tic.SCREENW = 240 -- screen width
Tic.SCREENH = 136 -- screen height
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
-- Special palette colors that can be replaced
Tic.COLORKEY   = Tic.COLOR00 -- transparent color
Tic.COLORARMOR = Tic.COLOR15 -- 4 colors for the bodies
Tic.COLORSHIRT = Tic.COLOR14
Tic.COLORPANTS = Tic.COLOR13
Tic.COLORHANDS = Tic.COLOR12
-- TODO weapons fg/bg + status
-- Sprite scales
Tic.SPRITESCALE01 = 01
Tic.SPRITESCALE02 = 02
-- Key values
Tic.KEYUP = 26 -- move up (z)
Tic.KEYDW = 19 -- move down (s)
Tic.KEYLF = 17 -- move left (q)
Tic.KEYRG = 04 -- move right (d)
Tic.KEYCR = 03 -- hide on/off (c)

Tic.OFFSETHIDE = 4 -- sprites offsets
Tic.OFFSETMOVE = 16

Tic.DIRHLF = 0 -- h directions
Tic.DIRHRG = 1
Tic.DIRVMD = 0 -- v directions
Tic.DIRVUP = -1
Tic.DIRVDW =  1

Tic.ROTATE000 =  0 -- sprite rotations
Tic.ROTATE090 =  90
Tic.ROTATE180 =  180
Tic.ROTATE270 =  270


Tic.FRAME00 = 0 -- sprites animations
Tic.FRAME01 = 1

Tic.HIDENOT = 0 -- hidden or not
Tic.HIDEYES = 1

Tic.STRESSMIN = 0 -- stress handling
Tic.STRESSMAX = 100

Tic.WEAPONBANK = 448 -- weapons types
Tic.WEAPONEMPTY = -1
Tic.WEAPONMELEE = 0
Tic.WEAPONRANGE = 1
Tic.WEAPONMAGIC = 2
Tic.WEAPONLIGHT = 3
Tic.WEAPONALCHE = 4

Tic.STATUSBANK = 480 -- status types
Tic.STATUSEMPTY = -1
Tic.STATUSSLEEP = 0
Tic.STATUSWOUND = 1
Tic.STATUSALCHE = 2
Tic.STATUSKNOCK = 3
Tic.STATUSDEATH = 4


-- Log System -- store logs to display each frame
Tic.Log = {}
function Tic:logClear() -- clear the log
    self.Log = {}
end

function Tic:logStack(...) -- add item to the log
    local _args = {...}
    if #_args == 0 then return end
    local _item = ""
    for _, _val in ipairs(_args) do
        _item = _item.._val.." "
    end
    table.insert(self.Log, _item)
end

function Tic:logPrint() -- print the log then clear it
    for _line, _item in ipairs(self.Log) do
        _line = _line - 1 -- line start from 0
        print(_item, 0, _line * 8) -- one item per "line"
      end    
    Tic:logClear()
end


-- Tick System -- loop on the tick from 0-59
Tic.Tick = 0
function Tic:tick() -- loop on tick from 0-59 -- to be called in TIC()
    self.Tick = self.Tick == 59 and 0 or self.Tick + 1
end


-- Trace
function Tic:traceTable(_table)
    for _key, _val in pairs(_table) do
        trace(_key.." = ".._val..",\t"..type(_val))
    end
end



--
-- Classic
--
local CSprite = Classic:extend() -- general sprites
CSprite.SPRITEBANK = 0
CSprite.sprite = 0 -- initial sprite number
CSprite.screenx = 0 -- screen positions
CSprite.screeny = 0
CSprite.colorkey = Tic.COLORKEY -- default colorkey
CSprite.scale = Tic.SPRITESCALE01 -- default scale
CSprite.flip = Tic.DIRHLF -- all sprites are dir h left by default
CSprite.rotate = Tic.ROTATE000 -- no rotation by default
CSprite.width = 1 -- sprite 1x1 by default
CSprite.height = 1
function CSprite:draw(_sprite, _offset) -- draw a sprite
    _sprite = _sprite or self.sprite
    _offset = _offset or 0
    Tic:logStack("XY:", self.screenx, self.screeny)
    Tic:logStack("SO:", _sprite, _offset)
    spr(
        _sprite + _offset,
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

local CSpriteBG = CSprite:extend() --bg sprites aka tic tiles

local CSpriteFG = CSprite:extend() --fg sprites aka tic sprites
CSpriteFG.SPRITEBANK = 256

local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity.worldx = 0 -- world positions
CEntity.worldy = 0

local CObject = CEntity:extend() -- objects

local CCharacter = CEntity:extend() -- characters
CCharacter:implement(nil, nil, CSpriteFG)
CCharacter.SIZEL = 0 -- character size aka the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
CCharacter.size = CCharacter.SIZEM
function CCharacter:new(_sprite, _screenx, _screeny, _size)
    trace("CCharacter")
    self.sprite = _sprite or self.SPRITEBANK
    self.screenx = _screenx or 100
    self.screeny = _screeny or 100
    self.size = _size or self.size
end

local CPlayer = CCharacter:extend() -- player characters
function CPlayer:new(_sprite, _screenx, _screeny, _size)
    trace("CPlayer")
    self.super:new(_sprite, _screenx, _screeny, _size)
end

local CNeutral= CCharacter:extend() -- neutral characters

local CEnnemy = CCharacter:extend() -- ennemy characters



-- test
-- local Nitcha = CPlayer:extend() -- nitcha character
local Nitcha = CPlayer(394) -- nitcha character
Tic:traceTable(Nitcha)
-- local Nitcha2x = CPlayer(394, 150, 100) -- scale 2x
-- Nitcha2x.scale = Tic.SPRITESCALE02


-- Drawing
function Tic:draw()
    local _tick = Tic.Tick
    local _frame = Nums:yes2int(_tick < 30)
    local _characters = {
        Nitcha,
        Nitcha2x,
    }

    Tic:logStack("T:", _tick)
    Tic:logStack("F:", _frame)
    -- Tic:logStack("NZ:", Nitcha.size)

    cls()
    drawChar(Nitcha, _frame)
    -- drawChar(Nitcha2x, _frame, 150, 100)
    Tic:logPrint()
end

function drawChar(_char, _frame, _x, _y)
    _char.screenx = _x or _char.screenx
    _char.screeny = _y or _char.screeny
    _char:draw(nil, _frame * 16)
end

-- END
return Tic
