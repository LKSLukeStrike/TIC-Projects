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
function Tic:trace(...) -- trace with multiple args
    local _args = {...}
    local _item = ""
    for _, _val in ipairs(_args) do
        _val = _val or "NIL"
        if type(_val) == "table" then
            Tic:traceTable(_val)
        else
            _item = _item.._val.." "
        end
    end
    trace(_item)
end

function Tic:traceTable(_table) -- trace a table keys, vals and vals types
    for _key, _val in pairs(_table) do
        Tic:trace(_key, _val, type(_val))
    end
end



--
-- Classic
--
local CSprite = Classic:extend() -- general sprites
CSprite.SPRITEBANK = 0
function CSprite:new()
    CSprite.super.new(self)
    self.spritebank = CSprite.SPRITEBANK
    self.sprite = self.spritebank -- initial sprite number
    self.screenx = 0 -- screen positions
    self.screeny = 0
    self.colorkey = Tic.COLORKEY -- default colorkey
    self.scale = Tic.SPRITESCALE01 -- default scale
    self.flip = Tic.DIRHLF -- all sprites are dir h left by default
    self.rotate = Tic.ROTATE000 -- no rotation by default
    self.width = 1 -- sprite 1x1 by default
    self.height = 1
    -- self.palettemap -- optional palette map for swapping
end

function CSprite:draw(_offset) -- draw a sprite -- use offset for frames
    _offset = _offset or 0
    Tic:logStack("XY:", self.screenx, self.screeny)
    Tic:logStack("SO:", self.sprite, _offset)
    for _key, _val in pairs(self.palettemap or {}) do -- swap palette colors if any
        poke4(Tic.PALETTEMAP + _key, _val)
    end
    spr(
        self.sprite + _offset,
        self.screenx,
        self.screeny,
        self.colorkey,
        self.scale,
        self.flip,
        self.rotate,
        self.width,
        self.height
    )
    for _key, _val in pairs(self.palettemap or {}) do -- restore palette colors if any
        poke4(Tic.PALETTEMAP + _key, _key)
    end
end


local CSpriteBG = CSprite:extend() --bg sprites aka tic tiles
function CSpriteBG:new()
    CSpriteBG.super.new(self)
    Tic:trace("CSpriteBG", self.sprite, type(self))
end


local CSpriteFG = CSprite:extend() --fg sprites aka tic sprites
CSpriteFG.SPRITEBANK = 256
function CSpriteFG:new()
    CSpriteFG.super.new(self)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    Tic:trace("CSpriteFG", self.sprite, type(self))
end


local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new()
    CEntity.super.new(self)
    self.worldx = CEntity.WORLDX -- world positions
    self.worldy = CEntity.WORLDY
    Tic:trace("CSpriteFG", self.sprite, type(self))
end


local CObject = CEntity:extend() -- objects


local CCharacter = CEntity:extend() -- characters
CCharacter.SIZEL = 0 -- character size aka the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
CCharacter.BODYHUMANOID = 394 -- sprite for humanoid bodies
CCharacter.HEADSPRITE = 377 -- initial head sprite (middle)
CCharacter.BODYPALETTEMAP = { -- example of a body palette map
    [Tic.COLORARMOR] = Tic.COLORARMOR,
    [Tic.COLORSHIRT] = Tic.COLORSHIRT,
    [Tic.COLORPANTS] = Tic.COLORPANTS,
    [Tic.COLORHANDS] = Tic.COLORHANDS,
}
function CCharacter:new()
    CCharacter.super.new(self)
    self.size = CCharacter.SIZEM
    self.screenx = 100
    self.screeny = 100
    self.scale = Tic.SPRITESCALE01
    self.headsprite = CSpriteFG()
    self.headsprite.sprite = CCharacter.HEADSPRITE
    self.headsprite.palettemap = {} --empty palette map by default by can be filled later
    self.bodysprite = CSpriteFG()
    self.bodysprite.sprite = CCharacter.BODYHUMANOID
    self.bodysprite.palettemap = {} --empty palette map by default by can be filled later
end

function CCharacter:draw(_offset)
    _offset = _offset or 0
    Tic:logStack("DRAW:", self.bodysprite.sprite, self.screenx, self.screeny)
    -- CCharacter:drawWeapon()
    -- CCharacter:drawShield()
    -- CCharacter._drawBody(self, _offset)
    self:_drawBody(_offset)
    self:_drawHead(_offset)
    -- CCharacter._drawBody(self, _offset)
    -- CCharacter:drawStatus()
end

function CCharacter:drawWeapon()
    -- Tic:logStack("WEAPON:")
end

function CCharacter:drawShield()
    -- Tic:logStack("SHIELD:")
end

function CCharacter:_drawBody(_offset)
    Tic:logStack("BODY:", self.bodysprite.sprite)
    self.bodysprite.screenx = self.screenx -- apply screen positions and scale to the bodysprite
    self.bodysprite.screeny = self.screeny
    self.bodysprite.scale = self.scale
    self.bodysprite:draw(_offset)
end

function CCharacter:_drawHead()
    Tic:logStack("HEAD:", self.headsprite.sprite)
    self.headsprite.screenx = self.screenx -- apply screen positions and scale to the headsprite
    self.headsprite.screeny = self.screeny + self.size * self.scale -- adjust the head y position
    self.headsprite.scale = self.scale
    self.headsprite:draw(_offset)
end

function CCharacter:drawStatus()
    -- Tic:logStack("STATUS:")
end


local CPlayer = CCharacter:extend() -- player characters
function CPlayer:new()
    CPlayer.super.new(self)
    Tic:trace("CPlayer", self.bodysprite, type(self))
end


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters



-- test
-- local Nitcha = CPlayer:extend() -- nitcha character
local Nitcha = CPlayer() -- nitcha character
Nitcha.screeny = 50
Tic:traceTable(Nitcha)
local Nitcha2x = CPlayer() -- scale 2x
Nitcha2x.scale = Tic.SPRITESCALE02
Nitcha2x.screenx = 150
local Goliath = CPlayer() -- scale 2x
Goliath.scale = Tic.SPRITESCALE02
Goliath.screenx = 180
Goliath.size = CCharacter.SIZEL
Goliath.bodysprite.palettemap[Tic.COLORSHIRT] = Tic.COLOR08
Goliath.bodysprite.palettemap[Tic.COLORPANTS] = Tic.COLOR09
Goliath.headsprite.sprite = 381
local Prinn = CPlayer() -- scale 2x
Prinn.scale = Tic.SPRITESCALE02
Prinn.screenx = 120
Prinn.size = CCharacter.SIZES
Prinn.bodysprite.palettemap[Tic.COLORARMOR] = Tic.COLOR07
Prinn.bodysprite.palettemap[Tic.COLORSHIRT] = Tic.COLOR13
Prinn.bodysprite.palettemap[Tic.COLORPANTS] = Tic.COLOR12
Prinn.headsprite.sprite = 373
local Prunn = CPlayer() -- scale 2x
Prunn.scale = Tic.SPRITESCALE02
Prunn.screenx = 90
Prunn.size = CCharacter.SIZES
Prunn.headsprite.palettemap[Tic.COLOR03] = Tic.COLOR01
Prunn.headsprite.palettemap[Tic.COLOR04] = Tic.COLOR02
Prunn.headsprite.palettemap[Tic.COLOR06] = Tic.COLOR01
Prunn.headsprite.palettemap[Tic.COLOR05] = Tic.COLOR02
Prunn.bodysprite.palettemap[Tic.COLORARMOR] = Tic.COLOR01
Prunn.bodysprite.palettemap[Tic.COLORSHIRT] = Tic.COLOR13
Prunn.bodysprite.palettemap[Tic.COLORPANTS] = Tic.COLOR12
Prunn.headsprite.sprite = 373
local Truduk = CPlayer() -- scale 2x
Truduk.scale = Tic.SPRITESCALE02
Truduk.screenx = 60
Truduk.size = CCharacter.SIZES
Truduk.headsprite.sprite = 369
-- Truduk.headsprite.palettemap[Tic.COLOR03] = Tic.COLOR11
-- Truduk.headsprite.palettemap[Tic.COLOR02] = Tic.COLOR10




-- Drawing
function Tic:draw()
    local _tick = Tic.Tick
    local _frame = _tick // 30
    local _offset = _frame * 16
    local _characters = {
        Nitcha,
        Nitcha2x,
        Goliath,
        Prinn,
        Prunn,
        Truduk,
    }

    Tic:logStack("T:", _tick)
    Tic:logStack("F:", _frame)
    -- Tic:logStack("NZ:", Nitcha.size)

    cls()

    for _, _character in ipairs(_characters) do
        _character:draw(_offset)
    end

    Tic:logPrint()
end



-- END
return Tic
