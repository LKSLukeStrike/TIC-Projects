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
Tic.COLORLGREEN = Tic.COLOR05 -- l green
Tic.COLORMGREEN = Tic.COLOR06 -- m green
Tic.COLORDGREEN = Tic.COLOR07 -- d green
Tic.COLORDBLUE  = Tic.COLOR08 -- d blue
Tic.COLORMBLUE  = Tic.COLOR09 -- m blue
Tic.COLORLBLUE  = Tic.COLOR10 -- l blue
Tic.COLORCYAN   = Tic.COLOR11 -- cyan
Tic.COLORWHITE  = Tic.COLOR12 -- white
Tic.COLORLGREY  = Tic.COLOR13 -- l grey
Tic.COLORMGREY  = Tic.COLOR14 -- m grey
Tic.COLORDGREY  = Tic.COLOR15 -- d grey
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

Tic.DIRHLF = 0 -- h directions -- also the sprite flip
Tic.DIRHRG = 1
Tic.DIRVMD = 0 -- v directions -- also the sprite offset
Tic.DIRVUP = Tic.DIRVMD - 1
Tic.DIRVDW = Tic.DIRVMD + 1

Tic.ROTATE000 =  0 -- sprite rotations
Tic.ROTATE090 =  90
Tic.ROTATE180 =  180
Tic.ROTATE270 =  270

Tic.POSTUREUP = 0 -- standing or hidding -- used for the sprite positions and body
Tic.POSTUREDW = 1

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
Tic.Tick = CCyclerInt({
    maxindex = 59
})
-- Tic.Tick = 0
-- function Tic:tickCycle() -- cycle on tick from 0-59 -- to be called in Tic.draw()
--     Tic.Tick = Tic.Tick == 59 and 0 or Tic.Tick + 1
-- end


-- Players System -- add new players to a players stack
Tic.Players = {}
Tic.CurrentPlayer = 0
function Tic:playerStack(_player) -- set the current player to the last added
    table.insert(Tic.Players, _player)
    Tic.CurrentPlayer = #Tic.Players
end


-- Trace
function Tic:trace(...) -- trace with multiple args
    local _args = {...}
    local _output = ""
    for _, _val in pairs(_args) do
        _val = (type(_val) == "table" or type(_val) == "function") and type(_val) or _val -- for concat
        _output = _output.._val.." "
    end
    trace(_output)
end

function Tic:traceTable(_table, _sort, _recurse) -- trace a table keys, vals and vals types -- sorted if any
    if type(_table) ~= "table" then return end
    Tic:trace(type(_table))
    Tic:trace(#_table)
    local _worktable = {table.unpack(_table)} -- work on a copy
    Tic:trace(#_worktable)
    if _sort then table.sort(_worktable) end -- sort if any
    for _key, _val in pairs(_worktable) do
        if type(_val) == "table" and _recurse then
            Tic:traceTable(_val, _sort, _recurse)
        else
            Tic:trace(_key, _val, type(_val))
        end
    end
end



--
-- Classic
--
local CSprite = Classic:extend() -- general sprites
CSprite.SPRITEBANK = 0
function CSprite:new(_argt)
    CSprite.super.new(self, _argt)
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
    self:argt(_argt) -- override if any
end

function CSprite:draw(_offset) -- draw a sprite -- use offset for frames
    _offset = _offset or 0
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
function CSpriteBG:new(_argt)
    CSpriteBG.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


local CSpriteFG = CSprite:extend() --fg sprites aka tic sprites
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK -- single pixel
CSpriteFG.HEADBANK    = 416 -- characters heads
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADDROWE   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADGOGOL   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 6
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:argt(_argt) -- override if any
end


local CSpriteFGPaletteMap = CSpriteFG:extend() --fg sprites with a palette map
function CSpriteFGPaletteMap:new(_argt)
    CSpriteFGPaletteMap.super.new(self, _argt)
    self.palettemap = {} -- empty by default, can be filled later
    self:argt(_argt) -- override if any
end


local CEntity = Classic:extend() -- general entities like places, objects, characters ...
CEntity.WORLDX = 0
CEntity.WORLDY = 0
CEntity.KINDENTITY = "Entity" -- default kind
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.kind = CEntity.KINDENTITY
    self.worldx = CEntity.WORLDX -- world positions
    self.worldy = CEntity.WORLDY
    self:argt(_argt) -- override if any
end


local CObject = CEntity:extend() -- objects


local CCharacter = CEntity:extend() -- characters
CCharacter.SIZEL = 0 -- character size aka the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
CCharacter.BODYHUMANOID = 394 -- sprite for humanoid bodies
CCharacter.HEADSPRITE = 377 -- initial head sprite (middle)
CEntity.KINDCHARACTER = "Character" -- default kind
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.kind = CEntity.KINDCHARACTER
    self.size = CCharacter.SIZEM
    self.screenx = 100
    self.screeny = 100
    self.scale = Tic.SPRITESCALE01
    self.dirh = Tic.DIRHLF
    self.dirv = Tic.DIRVMD
    self.posture = Tic.POSTUREUP
    self.colorhairsfg = Tic.COLORHAIRSFG -- character colors
    self.colorhairsbg = Tic.COLORHAIRSBG
    self.colorextra   = Tic.COLOREXTRA
    self.colorskin    = Tic.COLORSKIN
    self.coloreyesfg  = Tic.COLORLGREY
    self.coloreyesbg  = Tic.COLORMGREY
    self.colorarmor   = Tic.COLORARMOR
    self.colorshirt   = Tic.COLORSHIRT
    self.colorpants   = Tic.COLORPANTS
    self.colorhands   = Tic.COLORHANDS
    self.headsprite   = CSpriteFGPaletteMap() -- character head
    self.headsprite.sprite = CCharacter.HEADSPRITE
    self.bodysprite   = CSpriteFGPaletteMap() -- character body
    self.bodysprite.sprite = CCharacter.BODYHUMANOID
    self.eyesfgsprite = CSpriteFGPaletteMap() -- character eyes fg
    self.eyesfgsprite.sprite = CSpriteFG.SPRITEPIXEL
    self.eyesbgsprite = CSpriteFGPaletteMap() -- character eyes fg
    self.eyesbgsprite.sprite = CSpriteFG.SPRITEPIXEL
    self:argt(_argt) -- override if any
end

function CCharacter:draw()
    self:_drawWeapon()
    self:_drawShield()
    self:_drawBody()
    self:_drawHead()
    self:_drawEyes()
    self:_drawStatus()
end

function CCharacter:_drawWeapon()
end

function CCharacter:_drawShield()
end

function CCharacter:_drawBody()
    local _offset = (Tic.Tick.actvalue // 30) * 16 -- body offset -- TODO

    self.bodysprite.screenx = self.screenx -- apply screen positions and scale to the bodysprite
    self.bodysprite.screeny = self.screeny
    self.bodysprite.scale = self.scale
    self.bodysprite.flip = self.dirh -- flip h if any
    self.bodysprite.palettemap[Tic.COLORARMOR] = self.colorarmor -- adjust the body palette
    self.bodysprite.palettemap[Tic.COLORSHIRT] = self.colorshirt
    self.bodysprite.palettemap[Tic.COLORPANTS] = self.colorpants
    self.bodysprite.palettemap[Tic.COLORHANDS] = self.colorhands
    self.bodysprite:draw(_offset)
end

function CCharacter:_drawHead()
    self.headsprite.screenx = self.screenx -- apply screen positions and scale to the headsprite
    self.headsprite.screeny = self.screeny + (self.size * self.scale) -- adjust the head y position
    self.headsprite.scale = self.scale
    self.headsprite.flip = self.dirh -- flip h if any
    self.headsprite.palettemap[Tic.COLORHAIRSFG] = self.colorhairsfg -- adjust the head palette
    self.headsprite.palettemap[Tic.COLORHAIRSBG] = self.colorhairsbg
    self.headsprite.palettemap[Tic.COLOREXTRA]   = self.colorextra
    self.headsprite.palettemap[Tic.COLORSKIN]    = self.colorskin
    self.headsprite:draw()
end

function CCharacter:_drawEyes()
    self:_drawEyesFG()
    self:_drawEyesBG()
end

function CCharacter:_drawStatus()
end


local CCharacterHumanoid = CCharacter:extend() -- humanoid characters
CCharacterHumanoid.VEYE     = 2 -- v eyes offsets
CCharacterHumanoid.HEYEBGLF = 2 -- h eyes offsets
CCharacterHumanoid.HEYEFGLF = 3
CCharacterHumanoid.HEYEFGRG = 4
CCharacterHumanoid.HEYEBGRG = 5
CEntity.KINDHUMANOID = "Humanoid" -- default kind
function CCharacterHumanoid:new(_argt)
    CCharacterHumanoid.super.new(self, _argt)
    self.kind = CEntity.KINDHUMANOID
    self:argt(_argt) -- override if any
end

function CCharacterHumanoid:_drawEyesFG() -- draw fg eyes depending on dir h v
    local _offset = 0 -- offset for x and y
    _offset = (self.dirh == Tic.DIRHLF and CCharacterHumanoid.HEYEFGLF or CCharacterHumanoid.HEYEFGRG)
    self.eyesfgsprite.screenx = self.screenx + (_offset * self.scale)
    _offset = CCharacterHumanoid.VEYE + self.size + self.posture
    self.eyesfgsprite.screeny = self.screeny + (_offset * self.scale)
    self.eyesfgsprite.scale = self.scale
    self.eyesfgsprite.palettemap[Tic.COLORWHITE] = self.coloreyesfg -- adjust the eyes palette
    self.eyesfgsprite:draw()
end

function CCharacterHumanoid:_drawEyesBG() -- draw bg eyes depending on dir h v
    local _offset = 0 -- offset for x and y
    _offset = (self.dirh == Tic.DIRHLF and CCharacterHumanoid.HEYEBGLF or CCharacterHumanoid.HEYEBGRG)
    self.eyesbgsprite.screenx = self.screenx + (_offset * self.scale)
    _offset = CCharacterHumanoid.VEYE + self.size + self.posture + self.dirv
    self.eyesbgsprite.screeny = self.screeny + (_offset * self.scale)
    self.eyesbgsprite.scale = self.scale
    self.eyesbgsprite.palettemap[Tic.COLORWHITE] = self.coloreyesbg -- adjust the eyes palette
    self.eyesbgsprite:draw()
end


local IPlayer = CCharacter:extend() -- players characters interface
function IPlayer:playerStack()
    Tic:playerStack(self) -- record the new player on tic
end


local CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
CPlayerHumanoid:implement(IPlayer)
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self:playerStack()
    self:argt(_argt) -- override if any
end


local CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
CEntity.KINDDWARF = "Dwarf" -- default kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.kind = CEntity.KINDDWARF
    self.colorhairsfg = Tic.COLORRED -- Dwarf colors
    self.colorhairsbg = Tic.COLORORANGE
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = self.colorskin
    self.coloreyesfg  = Tic.COLORLGREY
    self.coloreyesbg  = Tic.COLORMGREY
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZES -- Dwarf size
    self.headsprite.sprite = CSpriteFG.HEADDWARF -- Dwarf head
    self:argt(_argt) -- override if any
end


local CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
CEntity.KINDGNOME = "Gnome" -- default kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.kind = CEntity.KINDGNOME
    self.colorhairsfg = Tic.COLORORANGE -- Gnome colors
    self.colorhairsbg = Tic.COLORYELLOW
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = self.colorskin
    self.coloreyesfg  = Tic.COLORLGREEN
    self.coloreyesbg  = Tic.COLORMGREEN
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = self.colorskin
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZES -- Gnome size
    self.headsprite.sprite = CSpriteFG.HEADGNOME -- Gnome head
    self:argt(_argt) -- override if any
end


local CPlayerDrowe = CPlayerHumanoid:extend() -- Drowe player characters
CEntity.KINDDROWE = "Drowe" -- default kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.kind = CEntity.KINDDROWE
    self.colorhairsfg = Tic.COLORDGREY -- Drowe colors
    self.colorhairsbg = Tic.COLORMGREY
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = self.colorskin
    self.coloreyesfg  = Tic.COLORRED
    self.coloreyesbg  = Tic.COLORPURPLE
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZEM -- Drowe size
    self.headsprite.sprite = CSpriteFG.HEADDROWE -- Drowe head
    self:argt(_argt) -- override if any
end


local CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
CEntity.KINDANGEL = "Angel" -- default kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.kind = CEntity.KINDANGEL
    self.colorhairsfg = Tic.COLORMGREY -- Angel colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = Tic.COLORYELLOW
    self.coloreyesfg  = Tic.COLORLGREY
    self.coloreyesbg  = Tic.COLORMGREY
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZEM -- Angel size
    self.headsprite.sprite = CSpriteFG.HEADANGEL -- Angel head
    self:argt(_argt) -- override if any
end


local CPlayerGogol = CPlayerHumanoid:extend() -- Gogol player characters
CEntity.KINDGOGOL = "Gogol" -- default kind
function CPlayerGogol:new(_argt)
    CPlayerGogol.super.new(self, _argt)
    self.kind = CEntity.KINDGOGOL
    self.colorhairsfg = Tic.COLORWHITE -- Gogol colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = Tic.COLORMGREY
    self.coloreyesfg  = Tic.COLORLBLUE
    self.coloreyesbg  = Tic.COLORMBLUE
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = self.colorextra
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZEL -- Gogol size
    self.headsprite.sprite = CSpriteFG.HEADGOGOL -- Gogol head
    self:argt(_argt) -- override if any
end


local CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
CEntity.KINDHORNE = "Horne" -- default kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.kind = CEntity.KINDHORNE
    self.colorhairsfg = Tic.COLORPURPLE -- Horne colors
    self.colorhairsbg = Tic.COLORRED
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = Tic.COLORDGREY
    self.coloreyesfg  = Tic.COLORLGREY
    self.coloreyesbg  = Tic.COLORMGREY
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZEM -- Horne size
    self.headsprite.sprite = CSpriteFG.HEADHORNE -- Horne head
    self:argt(_argt) -- override if any
end


local CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
CEntity.KINDDEMON = "Demon" -- default kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.kind = CEntity.KINDDEMON
    self.size = CCharacter.SIZEL -- Demon size
    self:argt(_argt) -- override if any
end


local CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
CEntity.KINDTIFEL = "Tifel" -- default kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.kind = CEntity.KINDTIFEL
    self:argt(_argt) -- override if any
end


local CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
CEntity.KINDMEDUZ = "Meduz" -- default kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.kind = CEntity.KINDMEDUZ
    self.colorhairsfg = Tic.COLORDGREEN -- Meduz colors
    self.colorhairsbg = Tic.COLORMGREEN
    self.colorskin    = Tic.COLORWHITE
    self.colorextra   = self.colorskin
    self.coloreyesfg  = Tic.COLORMGREY
    self.coloreyesbg  = Tic.COLORDGREY
    self.colorarmor   = Tic.COLORDGREY
    self.colorshirt   = Tic.COLORMGREY
    self.colorpants   = Tic.COLORLGREY
    self.colorhands   = self.colorskin
    self.size = CCharacter.SIZES -- Meduz size
    self.headsprite.sprite = CSpriteFG.HEADMEDUZ -- Meduz head
    self:argt(_argt) -- override if any
end


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters



-- Characters
local Truduk = CPlayerDwarf()
local Prinnn = CPlayerGnome()
local Kaptan = CPlayerMeduz()
local Kaptin = CPlayerMeduz({
    colorhairsbg = Tic.COLORLBLUE,
    colorhairsfg = Tic.COLORMBLUE,
})
local Nitcha = CPlayerDrowe()
local Zariel = CPlayerAngel()
local Zikkow = CPlayerTifel({
    colorhairsbg = Tic.COLORMGREEN,
    colorhairsfg = Tic.COLORDGREEN,
    colorextra   = Tic.COLORMGREY,
    coloreyesbg  = Tic.COLORORANGE,
    coloreyesfg  = Tic.COLORYELLOW,
})
local Daemok = CPlayerDemon()
local Golith = CPlayerGogol()
-- Tic:trace(Golith:_size())
-- Tic:trace(table.unpack(Golith:_keys()))
-- Tic:trace(table.unpack(Golith:_vals()))

-- exit()

-- Drawing
function Tic:draw()
    local _tick = Tic.Tick.actvalue
    local _frame = _tick // 30

    Tic:logStack("T:", _tick)
    Tic:logStack("F:", _frame)

    cls()

    -- local _scale = Tic.SPRITESCALE01
    local _scale = Tic.SPRITESCALE02
    local _screenx = 50
    local _screeny = 0
    for _, _character in ipairs(Tic.Players) do
        _character.scale = _scale
        _character.screenx = _screenx

        _character.screeny = _screeny
        _character.dirh = Tic.DIRHLF
        _character.dirv = Tic.DIRVUP
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 1
        _character.dirh = Tic.DIRHLF
        _character.dirv = Tic.DIRVMD
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 1
        _character.dirh = Tic.DIRHLF
        _character.dirv = Tic.DIRVDW
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 1
        _character.dirh = Tic.DIRHRG
        _character.dirv = Tic.DIRVUP
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 1
        _character.dirh = Tic.DIRHRG
        _character.dirv = Tic.DIRVMD
        _character:draw()

        _character.screeny = _character.screeny + (8 * _scale) + 1
        _character.dirh = Tic.DIRHRG
        _character.dirv = Tic.DIRVDW
        _character:draw()
        
        _screenx = _screenx + (8 * _scale) + 1

        Tic:logStack("K:", _character.kind)
    end

    Tic:logPrint()

    Tic.Tick:next() -- /!\ required in the draw function
end



-- END
return Tic
