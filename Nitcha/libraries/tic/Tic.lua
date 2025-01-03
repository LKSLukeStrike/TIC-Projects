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
-- Constants
Tic.SCREENW = 240 -- screen width
Tic.SCREENH = 136 -- screen height

Tic.OFFSETHIDE = 4 -- sprites offsets
Tic.OFFSETMOVE = 16

Tic.COLOR00 = 00 -- black -- palette colors
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

Tic.COLORKEY = Tic.COLOR00 -- transparent color -- special palette colors that can be replaced
Tic.COLORARMOR = Tic.COLOR15 -- 4 colors for the bodies
Tic.COLORSHIRT = Tic.COLOR14
Tic.COLORPANTS = Tic.COLOR13
Tic.COLORHANDS = Tic.COLOR12
-- TODO weapons fg/bg + emotes

Tic.SPRITESCALE01 = 01 -- sprite scales
Tic.SPRITESCALE02 = 02

Tic.KEYUP = 26 -- move up (z) -- key values
Tic.KEYDW = 19 -- move down (s)
Tic.KEYLF = 17 -- move left (q)
Tic.KEYRG = 04 -- move right (d)
Tic.KEYCR = 03 -- hide on/off (c)

Tic.DIRHLF = 0 -- h directions
Tic.DIRHRG = 1
Tic.DIRVMD = 0 -- v directions
Tic.DIRVUP = -1
Tic.DIRVDW =  1

Tic.FRAME00 = 0 -- characters animations
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

function Tic:logStack(_item) -- add item to the log
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



--
-- Classic
--
local CSprite = Classic:extend() -- general sprites
CSprite.SPRITEBANK = 0
CSprite.screenx = 0 -- screen positions
CSprite.screeny = 0
CSprite.sprite = 0 -- sprite number
CSprite.colorkey = Tic.COLORKEY
CSprite.scale = Tic.SPRITESCALE01

local CSpriteBG = CSprite:extend() --bg sprites aka tic tiles

local CSpriteFG = CSprite:extend() --fg sprites aka tic sprites
CSpriteFG.SPRITEBANK = 256

local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity.worldx = 0 -- world positions
CEntity.worldy = 0

local CObject = CEntity:extend() -- objects

local CCharacter = CEntity:extend() -- characters
CCharacter:implement(nil, nil, CSpriteFG)

local CPlayer = CCharacter:extend() -- player characters

local CNeutral= CCharacter:extend() -- neutral characters

local CEnnemy = CCharacter:extend() -- ennemy characters



-- test
-- local Nitcha = CPlayer:extend() -- nitcha character
local Nitcha = CPlayer:extend() -- nitcha character
Nitcha.sprite = 392
local Nitcha2x = Nitcha:extend() -- scale 2x
Nitcha2x.scale = Tic.SPRITESCALE02


-- Drawing
function Tic:draw()
    local _tick = Tic.Tick
    local _frame = Nums:yes2int(_tick < 30)

    Tic:logStack("W: "..Tic.SCREENW)
    Tic:logStack("H: "..Tic.SCREENH)
    Tic:logStack("B: "..CSpriteBG.SPRITEBANK)
    Tic:logStack("B: "..CSpriteFG.SPRITEBANK)
    Tic:logStack("B: "..Nitcha.SPRITEBANK)
    Tic:logStack("T: ".._tick)
    if _tick == 0 then
        Tic:logStack("00: True")
    else
        Tic:logStack("00: False")
    end
    if _tick == 59 then
        Tic:logStack("59: True")
    else
        Tic:logStack("59: False")
    end
    if _tick > 59 then
        Tic:logStack("Error !")
    else
        Tic:logStack("Ok !")
    end
    Tic:logStack("Frame ".._frame)

    cls()
    Tic:logPrint()
    drawChar(Nitcha, _frame, 100, 100)
    drawChar(Nitcha2x, _frame, 150, 100)
end

function drawChar(_char, _frame, _x, _y)
    spr(_char.sprite + (_frame * 16), _x, _y, _char.colorkey, _char.scale)
end

-- END
return Tic
