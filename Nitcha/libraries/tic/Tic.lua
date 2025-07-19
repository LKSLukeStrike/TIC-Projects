-- Tic object
-- Instance only once
-- 

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
Classic = require("libraries/ext/Classic")                
Nums    = require("libraries/lks/Nums")
Tables  = require("libraries/lks/Tables")
Names   = require("libraries/lks/Names")
CCycler = require("libraries/lks/CCycler")                


--
-- Strings -- for debugging
--
D = "D:"
E = "E:"
F = "F:"
N = "N:"
R = "R:"
S = "S:"
X = "X:"
Y = "Y:"


--
-- Tic
--
Tic = {}


-- Fonts sizes
Tic.FONTWL = 6 -- large font width
Tic.FONTWS = 4 -- small font width
Tic.FONTH  = 6 -- both fonts height

-- Scales
Tic.SCALE01 = 01
Tic.SCALE02 = 02
Tic.SCALE03 = 03
Tic.SCALE04 = 04

-- Entities sizes -- used for offsets and size limitations
Tic.SIZEL = 0 -- large
Tic.SIZEM = 1 -- medium
Tic.SIZES = 2 -- small

-- Screen positions and sizes
Tic.SCREENW  = 240 -- screen width
Tic.SCREENH  = 136 -- screen height
Tic.SCREENW2 = Tic.SCREENW // 2 -- half screen width
Tic.SCREENH2 = Tic.SCREENH // 2 -- half screen height
Tic.SCREENX  = 0 -- screen x position
Tic.SCREENY  = 0 -- screen y position

-- World Window positions and sizes (hud)
Tic.WORLDWW  = 120 -- world window width
Tic.WORLDWH  = 100 -- world window height
Tic.WORLDWW2 = Tic.WORLDWW // 2 -- half world window width
Tic.WORLDWH2 = Tic.WORLDWH // 2 -- half world window height
Tic.WORLDWX  = (Tic.SCREENW - Tic.WORLDWW) // 2 -- world window x position
Tic.WORLDWY  = ((Tic.SCREENH - Tic.WORLDWH) // 2) + 2 -- world window y position
Tic.WORLDWX2 = Tic.WORLDWX + Tic.WORLDWW2 -- half world window x position
Tic.WORLDWY2 = Tic.WORLDWY + Tic.WORLDWH2 -- half world window y position

-- World Infos Window positions and sizes (hud)
Tic.WORLDINFOSWW = Tic.WORLDWW -- world infos window width
Tic.WORLDINFOSWH = 10 -- world infos window height
Tic.WORLDINFOSWX = Tic.WORLDWX -- world infos window x position
Tic.WORLDINFOSWY = 3 -- world infos window y position

-- Player Infos Window positions and sizes (hud)
Tic.PLAYERINFOSWW = 26 -- player infos window width
Tic.PLAYERINFOSWH = 16 -- player infos window height
Tic.PLAYERINFOSWX = Tic.SCREENW - Tic.PLAYERINFOSWW - ((Tic.WORLDWX - Tic.PLAYERINFOSWW) // 2) -- player infos window x position
Tic.PLAYERINFOSWY = Tic.WORLDWY -- player infos window y position

-- Player Portrait Window positions and sizes (hud)
Tic.PLAYERPORTRAITWW = 16 -- player portrait window width
Tic.PLAYERPORTRAITWH = 16 -- player portrait window height
Tic.PLAYERPORTRAITWX = Tic.SCREENW - Tic.PLAYERPORTRAITWW - ((Tic.WORLDWX - Tic.PLAYERPORTRAITWW) // 2) -- player portrait window x position
Tic.PLAYERPORTRAITWY = Tic.PLAYERINFOSWY + 26 -- player portrait window y position

-- Player Stats Window positions and sizes (hud)
Tic.PLAYERSTATSWW = 26 -- player stats window width
Tic.PLAYERSTATSWH = 16 -- player stats window height
Tic.PLAYERSTATSWX = Tic.PLAYERINFOSWX -- player stats window x position
Tic.PLAYERSTATSWY = Tic.PLAYERPORTRAITWY + 30 -- player stats window y position

-- Player State Window positions and sizes (hud)
Tic.PLAYERSTATEWW = 26 -- player state window width
Tic.PLAYERSTATEWH = 16 -- player state window height
Tic.PLAYERSTATEWX = Tic.PLAYERINFOSWX -- player state window x position
Tic.PLAYERSTATEWY = Tic.PLAYERSTATSWY + 26 -- player state window y position

-- Spotting Infos Window positions and sizes (hud)
Tic.SPOTTINGINFOSWW = 26 -- spotting infos window width
Tic.SPOTTINGINFOSWH = 16 -- spotting infos window height
Tic.SPOTTINGINFOSWX = ((Tic.WORLDWX - Tic.SPOTTINGINFOSWW) // 2) -- spotting infos window x position
Tic.SPOTTINGINFOSWY = Tic.WORLDWY -- spotting infos window y position

-- Spotting Portrait Window positions and sizes (hud)
Tic.SPOTTINGPORTRAITWW = 16 -- spotting portrait window width
Tic.SPOTTINGPORTRAITWH = 16 -- spotting portrait window height
Tic.SPOTTINGPORTRAITWX = ((Tic.WORLDWX - Tic.SPOTTINGPORTRAITWW) // 2) -- spotting portrait window x position
Tic.SPOTTINGPORTRAITWY = Tic.SPOTTINGINFOSWY + 26 -- spotting portrait window y position

-- Palette map
Tic.PALETTEMAP = 0x3FF0 * 2 -- vram bank 1

-- Sprites bank
Tic.SPRITEBANK = 0x4000 -- start at tiles sprites

-- Sprites size
Tic.SPRITESIZE  = 8 -- sprites size in pixels
Tic.SPRITESIZE2 = Tic.SPRITESIZE // 2 -- half sprites size in pixels

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
Tic.COLORBIOMENIGHT = Tic.COLORBLACK
Tic.COLORBIOMESNOWY = Tic.COLORWHITE
Tic.COLORBIOMESANDY = Tic.COLORYELLOW
Tic.COLORBIOMEGREEN = Tic.COLORGREENM
Tic.COLORBIOMEROCKY = Tic.COLORGREYL

-- Palette colors for characters
Tic.COLORKEY      = Tic.COLORBLACK -- transparent color
Tic.COLORARMOR    = Tic.COLORGREYD -- 4 colors for the bodies
Tic.COLORSHIRT    = Tic.COLORGREYM
Tic.COLORPANTS    = Tic.COLORGREYL
Tic.COLORHANDS    = Tic.COLORWHITE
Tic.COLORHAIRSFG  = Tic.COLORGREYD -- 4 colors for the heads
Tic.COLORHAIRSBG  = Tic.COLORGREYM
Tic.COLOREXTRA    = Tic.COLORGREYL
Tic.COLORSKIN     = Tic.COLORWHITE
Tic.COLOREYESFG   = Tic.COLORWHITE -- 4 colors for the eyes
Tic.COLOREYESBU   = Tic.COLORGREYD
Tic.COLOREYESBM   = Tic.COLORGREYM
Tic.COLOREYESBD   = Tic.COLORGREYL

-- Palette colors for characters stats
Tic.COLORSTAT0    = Tic.COLORGREYD
Tic.COLORPHYGT    = Tic.COLORPURPLE
Tic.COLORPHYEQ    = Tic.COLORRED
Tic.COLORPHYLT    = Tic.COLORORANGE
Tic.COLORMENGT    = Tic.COLORGREEND
Tic.COLORMENEQ    = Tic.COLORGREENM
Tic.COLORMENLT    = Tic.COLORGREENL
Tic.COLORPSYGT    = Tic.COLORBLUED
Tic.COLORPSYEQ    = Tic.COLORBLUEM
Tic.COLORPSYLT    = Tic.COLORBLUEL

-- Palette colors for buttons
Tic.COLORHOVER    = Tic.COLORBLUEL -- hovertext color

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
Tic.DIRHIT = -1  -- no direction (in case of matching positions)
Tic.OFFSETZERO = 00 -- offsets for moving in line or diagonal
Tic.OFFSETDIAG = 07
Tic.OFFSETLINE = 10
Tic.DIRSOFFSETS = { -- directions to x y offsets and dirs
    [Tic.DIR000] = {
        offsetx = Nums:pos(Tic.OFFSETZERO),
        offsety = Nums:neg(Tic.OFFSETLINE),
        screenx = nil, -- double line
        screeny = 0,
        dirx    = nil,
        diry    = Tic.DIRYUP,
    },
    [Tic.DIR045] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 0,
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYUP,
    },
    [Tic.DIR090] = {
        offsetx = Nums:pos(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 1,
        screeny = nil, -- double line
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYMD,
    },
    [Tic.DIR135] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 1,
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYDW,
    },
    [Tic.DIR180] = {
        offsetx = Nums:pos(Tic.OFFSETZERO),
        offsety = Nums:pos(Tic.OFFSETLINE),
        screenx = nil, -- double line
        screeny = 0,
        dirx    = nil,
        diry    = Tic.DIRYDW,
    },
    [Tic.DIR225] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 1,
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYDW,
    },
    [Tic.DIR270] = {
        offsetx = Nums:neg(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 0,
        screeny = nil, -- double line
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYMD,
    },
    [Tic.DIR315] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 0,
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYUP,
    },
}

-- Draw Layers
Tic.DRAWBG = "drawbg"
Tic.DRAWFG = "drawfg"

-- Stats
Tic.STATSMIN  = 0 -- stats handling
Tic.STATSMAX  = 10

-- Frequences
Tic.FREQUENCE0000 = 0000 -- each 0 second
Tic.FREQUENCE0030 = 0030 -- each 0.5 second
Tic.FREQUENCE0060 = 0060 -- each 1 second
Tic.FREQUENCE0090 = 0090 -- each 1.5 second
Tic.FREQUENCE0120 = 0120 -- each 2 second
Tic.FREQUENCE0180 = 0180 -- each 3 second
Tic.FREQUENCE0240 = 0240 -- each 4 second
Tic.FREQUENCE0300 = 0300 -- each 5 second
Tic.FREQUENCE0600 = 0600 -- each 10 second

-- Keys values
Tic.KEY_ANY            = -1
Tic.KEY_A              = 01
Tic.KEY_B              = 02
Tic.KEY_D              = 04
Tic.KEY_H              = 08
Tic.KEY_I              = 09
Tic.KEY_M              = 13
Tic.KEY_O              = 15
Tic.KEY_P              = 16
Tic.KEY_Q              = 17
Tic.KEY_R              = 18
Tic.KEY_S              = 19
Tic.KEY_V              = 22
Tic.KEY_X              = 24
Tic.KEY_Y              = 25
Tic.KEY_Z              = 26
Tic.KEY_SPACE          = 48
Tic.KEY_UP             = 58
Tic.KEY_DOWN           = 59
Tic.KEY_LEFT           = 60
Tic.KEY_RIGHT          = 61
Tic.KEY_CAPSLOCK       = 62
Tic.KEY_CTRL           = 63
Tic.KEY_SHIFT          = 64
Tic.KEY_ALT            = 65
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

-- Functions values
Tic.FUNCTIONPLAYERPREV          = function() Tic:playerPrev() end
Tic.FUNCTIONPLAYERNEXT          = function() Tic:playerNext() end
Tic.FUNCTIONPLAYERDETACH        = function() Tic:playerDetach() end
Tic.FUNCTIONPLAYERONLY          = function() Tic:playerToggleOnly() end
Tic.FUNCTIONSTATEPREV           = function() Tic:statePrev() end
Tic.FUNCTIONSTATENEXT           = function() Tic:stateNext() end
Tic.FUNCTIONTOGGLEWORK          = function() Tic:toggleWork() end
Tic.FUNCTIONTOGGLEKNEEL         = function() Tic:toggleKneel() end
Tic.FUNCTIONTOGGLESLEEP         = function() Tic:toggleSleep() end
Tic.FUNCTIONMOVEDIRECTION000    = function() Tic:moveDirection000() end
Tic.FUNCTIONMOVEDIRECTION045    = function() Tic:moveDirection045() end
Tic.FUNCTIONMOVEDIRECTION090    = function() Tic:moveDirection090() end
Tic.FUNCTIONMOVEDIRECTION135    = function() Tic:moveDirection135() end
Tic.FUNCTIONMOVEDIRECTION180    = function() Tic:moveDirection180() end
Tic.FUNCTIONMOVEDIRECTION225    = function() Tic:moveDirection225() end
Tic.FUNCTIONMOVEDIRECTION270    = function() Tic:moveDirection270() end
Tic.FUNCTIONMOVEDIRECTION315    = function() Tic:moveDirection315() end
Tic.FUNCTIONSTATACTPHY          = function() Tic:statActPhy() end
Tic.FUNCTIONSTATACTMEN          = function() Tic:statActMen() end
Tic.FUNCTIONSTATACTPSY          = function() Tic:statActPsy() end
Tic.FUNCTIONBIOMENEXT           = function() Tic:biomeNext() end
Tic.FUNCTIONHITBOXTOGGLEDRAW    = function() Tic:hitboxToggleDraw() end
Tic.FUNCTIONINVENTORYTOGGLESHOW = function() Tic:inventoryToggleShow() end
Tic.FUNCTIONSPOTTINGTOGGLEMODE  = function() Tic:spottingToggleMode() end
Tic.FUNCTIONBORDERSTOGGLEDRAW   = function() Tic:bordersToggleDraw() end
Tic.FUNCTIONDIRSTOGGLEDRAW      = function() Tic:dirsToggleDraw() end
Tic.FUNCTIONVIEWTOGGLEDRAW      = function() Tic:viewToggleDraw() end
Tic.FUNCTIONMINDTOGGLEDRAW      = function() Tic:mindToggleDraw() end
Tic.FUNCTIONMOVETOGGLEDRAW      = function() Tic:moveToggleDraw() end
Tic.FUNCTIONSCALENEXT           = function() Tic:scaleNext() end
Tic.FUNCTIONSCREENPREV          = function() Tic:screenPrev() end
Tic.FUNCTIONSCREENNEXT          = function() Tic:screenNext() end

-- Keys to Functions -- per screen
Tic.KEYSFUNCTIONSINTRO = {
    [Tic.KEY_NUMPADMINUS]  = Tic.FUNCTIONSCREENPREV,
    [Tic.KEY_NUMPADPLUS]   = Tic.FUNCTIONSCREENNEXT,
    [Tic.KEY_ANY]          = Tic.FUNCTIONSCREENNEXT,
}
Tic.KEYSFUNCTIONSMENUS = {
    [Tic.KEY_I]            = Tic.FUNCTIONINVENTORYTOGGLESHOW,
}
Tic.KEYSFUNCTIONSWORLD = {
    [Tic.KEY_LEFT]         = Tic.FUNCTIONPLAYERPREV, -- cycle actual player
    [Tic.KEY_RIGHT]        = Tic.FUNCTIONPLAYERNEXT,
    [Tic.KEY_UP]           = Tic.FUNCTIONSTATEPREV, -- cycle state
    [Tic.KEY_DOWN]         = Tic.FUNCTIONSTATENEXT,
    [Tic.KEY_NUMPADDIVIDE] = Tic.FUNCTIONTOGGLEWORK, -- toggle posture/status
    [Tic.KEY_NUMPAD5]      = Tic.FUNCTIONTOGGLEKNEEL,
    [Tic.KEY_NUMPAD0]      = Tic.FUNCTIONTOGGLESLEEP,
    [Tic.KEY_NUMPAD8]      = Tic.FUNCTIONMOVEDIRECTION000, -- move
    [Tic.KEY_NUMPAD9]      = Tic.FUNCTIONMOVEDIRECTION045,
    [Tic.KEY_NUMPAD6]      = Tic.FUNCTIONMOVEDIRECTION090,
    [Tic.KEY_NUMPAD3]      = Tic.FUNCTIONMOVEDIRECTION135,
    [Tic.KEY_NUMPAD2]      = Tic.FUNCTIONMOVEDIRECTION180,
    [Tic.KEY_NUMPAD1]      = Tic.FUNCTIONMOVEDIRECTION225,
    [Tic.KEY_NUMPAD4]      = Tic.FUNCTIONMOVEDIRECTION270,
    [Tic.KEY_NUMPAD7]      = Tic.FUNCTIONMOVEDIRECTION315,
    [Tic.KEY_A]            = Tic.FUNCTIONPLAYERDETACH,
    [Tic.KEY_B]            = Tic.FUNCTIONBIOMENEXT,
    [Tic.KEY_D]            = Tic.FUNCTIONDIRSTOGGLEDRAW,
    [Tic.KEY_H]            = Tic.FUNCTIONHITBOXTOGGLEDRAW,
    [Tic.KEY_I]            = Tic.FUNCTIONINVENTORYTOGGLESHOW,
    [Tic.KEY_M]            = Tic.FUNCTIONSTATACTMEN,
    [Tic.KEY_O]            = Tic.FUNCTIONPLAYERONLY,
    [Tic.KEY_P]            = Tic.FUNCTIONSTATACTPHY,
    [Tic.KEY_Q]            = Tic.FUNCTIONBORDERSTOGGLEDRAW,
    [Tic.KEY_R]            = Tic.FUNCTIONMINDTOGGLEDRAW,
    [Tic.KEY_S]            = Tic.FUNCTIONSPOTTINGTOGGLEDRAW,
    [Tic.KEY_V]            = Tic.FUNCTIONVIEWTOGGLEDRAW,
    [Tic.KEY_X]            = Tic.FUNCTIONMOVETOGGLEDRAW,
    [Tic.KEY_Y]            = Tic.FUNCTIONSTATACTPSY,
    [Tic.KEY_Z]            = Tic.FUNCTIONSCALENEXT,
    [Tic.KEY_NUMPADMINUS]  = Tic.FUNCTIONSCREENPREV,
    [Tic.KEY_NUMPADPLUS]   = Tic.FUNCTIONSCREENNEXT,
}


-- Keyboard System -- handle keys pressed to functions
Tic.KEYBOARDKEYS = 0xFF88 -- keyboard state -- up to 4 pressed keys
Tic.MODIFIERKEYS = { -- record modifier keys pressed
    [Tic.KEY_CAPSLOCK] = false,
    [Tic.KEY_CTRL]     = false,
    [Tic.KEY_SHIFT]    = false,
    [Tic.KEY_ALT]      = false,
}
Tic.KEYSFUNCTIONS = {}

function Tic:keyboardInput() -- returns the keys inputs in a table
    local _result = {}

    for _key, _ in pairs(Tic.MODIFIERKEYS) do -- reset modifier keys
        Tic.MODIFIERKEYS[_key] = false
    end

    for _i = 0, 3 do
        local _key = peek(Tic.KEYBOARDKEYS + _i)
        if _key > 0 then -- key pressed
            local _modifier = Tables:keyFind(Tic.MODIFIERKEYS, _key)
            if _modifier then -- modifier key
                Tic.MODIFIERKEYS[_modifier] = true
            elseif keyp(_key, 20, 10) then -- normal key holded
                 Tables:valInsert(_result, _key, true)
            end
        end
    end

    if Tables:size(_result) > 0 then -- at least one key pressed
        Tables:valInsert(_result, Tic.KEY_ANY, true)
    end

    return _result
end

function Tic:keyboardInputFunctions() -- return functions depending on the pressed keys if any
    local _result = {}

    local _keysinput = Tic:keyboardInput()
    for _, _key in ipairs(_keysinput) do
        local _function = Tic.KEYSFUNCTIONS[_key]
        if _function then -- key linked to a function
            Tables:valInsert(_result, _function, true)
        end
    end

    return _result
end

function Tic:keyboardHandleInput() -- handle keyboard keysfunctions
    Tic:inputsInsertFunctions(Tic:keyboardInputFunctions())
end

function Tic:keyboardClearKeysFunctions() -- clear keyboard keysfunctions
    Tic.KEYSFUNCTIONS = {}
end

function Tic:keyboardAppendKeysFunctions(_keysfunctions) -- append keyboard keysfunctions
    for _key, _function in pairs(_keysfunctions or {}) do
        Tables:keyAppend(Tic.KEYSFUNCTIONS, _key, _function)
    end
end


-- Mouse System
Tic.MOUSECURSOR    = 0x3FFB
Tic.MOUSESPRITE    = 14
Tic.MOUSEOFFSETXLF = 2
Tic.MOUSEOFFSETXRG = 5
Tic.MOUSEOFFSETX   = Tic.MOUSEOFFSETXLF
Tic.MOUSEOFFSETY   = 2
Tic.MOUSEDIRX      = Tic.DIRXLF
Tic.MOUSECYCLER    = CCyclerInt{} -- delay cycler
Tic.MOUSEDELAY     = 10 -- default delay ticks
Tic.MOUSE          = {
    screenx = 0,
    screeny = 0,
    clicklf = false,
    clickmd = false,
    clickrg = false,
    scrollx = 0,
    scrolly = 0,
}

function Tic:mouseDelay(_delay) -- set a refresh mouse delay
    _delay = _delay or Tic.MOUSEDELAY
    Tic.MOUSECYCLER = CCyclerInt{maxindex = _delay} -- delay cycler
end

function Tic:mouseReset(_delay) -- reset refresh mouse delay
    Tic:mouseDelay(0)
end

function Tic:mouseInput() -- set the mouse inputs in a table
    Tic.MOUSECYCLER:next() -- mouse delay if any
    if not Tic.MOUSECYCLER:isMAX() then return end -- have to wait
    Tic:mouseReset() -- reset the delay

    local _result = {}

    _result.screenx, _result.screeny, _result.clicklf, _result.clickmd, _result.clickrg, _result.scrollx, _result.scrolly = mouse()
    if _result.screenx < Tic.MOUSE.screenx then -- adjust mouse direction
        Tic.MOUSEOFFSETX = Tic.MOUSEOFFSETXLF
        Tic.MOUSEDIRX    = Tic.DIRXLF
    elseif _result.screenx > Tic.MOUSE.screenx then
        Tic.MOUSEOFFSETX = Tic.MOUSEOFFSETXRG
        Tic.MOUSEDIRX    = Tic.DIRXRG
    end

    Tic.MOUSE = _result
end

function Tic:mouseCursor() -- set the mouse cursor sprite
    poke(Tic.MOUSECURSOR, Tic.MOUSESPRITE + Tic.MOUSEDIRX)
end

function Tic:mouseHandleInput() -- set the mouse cursor sprite
    Tic:mouseInput()
    Tic:mouseCursor()
end

function Tic:mousePointX() -- real mouse x point
    return Tic.MOUSE.screenx + Tic.MOUSEOFFSETX
end

function Tic:mousePointY() -- real mouse y point
    return Tic.MOUSE.screeny + Tic.MOUSEOFFSETY
end


-- Buttons System -- handle buttons stack
Tic.BUTTONCLICKLF = "clicklf" -- buttons function keys
Tic.BUTTONCLICKMD = "clickmd"
Tic.BUTTONCLICKRG = "clickrg"
Tic.BUTTONSCROLLX = "scrollx"
Tic.BUTTONSCROLLY = "scrolly"
Tic.BUTTONS = {}

function Tic:buttonsHandleInput()
    local _treatedbutton = nil -- avoid overlaping buttons, just keep the first one

    for _, _button in ipairs(Tic.BUTTONS) do -- handle input functions
        _button:deactivate()

        if _button:activable() then -- check if a button is active and hovered
            if _button:region():hasInsidePoint(Tic:mousePointX(), Tic:mousePointY()) then
                if not _treatedbutton then
                    local _functionsactived = _button:functionsActived()
                    if Tables:size(_functionsactived) > 0 then -- activate
                        _button:activate()
                        Tic:inputsInsertFunctions(_functionsactived)
                    else -- or just hover
                        _button.hovered = true
                    end
                    _treatedbutton = _button
                end
            end
        else -- disable all functions related to hidden/disabled buttons
            Tic:inputsRemoveFunctions(_button:functionsDefined())
        end
    end

    for _, _function in ipairs(Tic.FUNCTIONS) do -- feedback functions to other buttons with same function if any
        for _, _button in ipairs(Tic.BUTTONS) do
            if _button:activable() then -- only activable buttons
                if _button:functionsContains(_function) then
                    _button:activate()
                end
            end
        end
    end
end

function Tic:buttonsClearButtons() -- clear buttons stack
    Tic.BUTTONS = {}
end

function Tic:buttonsInsertButtons(_buttons) -- insert buttons (once)
    for _, _button in ipairs(_buttons or {}) do
        Tables:valInsert(Tic.BUTTONS, _button, true)
    end
end


-- Inputs System -- handle mouse and keyboard inputs
Tic.FUNCTIONS = {}

function Tic:inputsDo()
    Tic:inputsClearFunctions() -- start recording functions
    Tic:mouseHandleInput() -- handle mouse inputs and cursor
    Tic:keyboardHandleInput() -- handle keyboard keys and functions
    Tic:buttonsHandleInput() -- handle buttons function keys and functions
    Tic:inputsDoFunctions() -- execute functions
end

function Tic:inputsClearFunctions() -- clear the functions table
    Tic.FUNCTIONS = {}
end

function Tic:inputsDoFunctions()
    for _, _function in ipairs(Tic.FUNCTIONS) do
        _function() -- execute each function
    end
end

function Tic:inputsInsertFunctions(_functions)
    for _, _function in ipairs(_functions or {}) do
        Tables:valInsert(Tic.FUNCTIONS, _function, true) -- insert once
    end
end

function Tic:inputsRemoveFunctions(_functions)
    for _, _function in ipairs(_functions or {}) do
        Tables:valRemove(Tic.FUNCTIONS, _function, false) -- remove all
    end
end


-- Screens System -- handle screens stack
Tic.SCREENS = CCyclerTable()

function Tic:screenDraw() -- draw screen(s)
    local _actindex = Tic.SCREENS.actindex -- save initial actindex
    Tic.SCREENS:min()
    while Tic.SCREENS.actindex <= _actindex do -- pile each screen
        if Tic:screenActual() then Tic:screenActual():draw() end
        if Tic.SCREENS.actindex == _actindex then break else Tic:screenNext() end
    end
end

function Tic:screenActual() -- actual screen in the stack
    return Tic.SCREENS.actvalue
end

function Tic:screenAppend(_screen) -- append a screen to the stack
    if not _screen then return end -- mandatory
    if Tic:screenActual() == _screen then return end -- already on stack
    return Tic.SCREENS:insert(_screen)
end

function Tic:screenRemove(_screen) -- remove last screen from the stack
    if not _screen then return end -- mandatory
    if not (Tic:screenActual() == _screen) then return end -- not on stack
    return Tic.SCREENS:remove()
end

function Tic:screenPrev() -- prev screen in the stack
    Tic:keyboardClearKeysFunctions() -- clear keyboard stack
    Tic:buttonsClearButtons() -- clear buttons stack
    return Tic.SCREENS:prev()
end

function Tic:screenNext() -- next screen in the stack
    Tic:keyboardClearKeysFunctions() -- clear keyboard stack
    Tic:buttonsClearButtons() -- clear buttons stack
    return Tic.SCREENS:next()
end

function Tic:screenKeyboard(_screen) -- append screen keysfunctions to the keyboard stack
    _screen = _screen or Tic:screenActual()
    Tic:keyboardAppendKeysFunctions(_screen.keysfunctions)
end

function Tic:screenButtons(_screen) -- adjust the buttons to the actual screen
    _screen = _screen or Tic:screenActual()
    Tic:buttonsInsertButtons(_screen.buttons)
end


-- Players System -- handle a players stack
Tic.PLAYERS    = CCyclerTable()
Tic.PLAYERONLY = true -- to display view, move, etc only for actual player

function Tic:playerAppend(_player) -- stack a new player
    if Tables:valFind(Tic.PLAYERS, _player) then return end -- avoid doublons
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

function Tic:playerDetach() -- detach all from actual player
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then
        Tic:playerActual():hitboxDetachAllTo()
    elseif Tic.MODIFIERKEYS[Tic.KEY_CTRL] then
        Tic:playerActual():hitboxDetachAllBy()
    else
        Tic:playerActual():hitboxDetachAll()
    end
end

function Tic:playerToggleOnly() -- toggle player only
    Tic.PLAYERONLY = Nums:toggleTF(Tic.PLAYERONLY)
end


-- State System -- affect the sprites, head offset etc
Tic.POSTURESTAND = "stand" -- postures
Tic.POSTUREKNEEL = "kneel"
Tic.POSTUREFLOOR = "floor"

Tic.STATUSIDLE   = "idle" -- statuses at stand or kneel
Tic.STATUSWORK   = "work"
Tic.STATUSMOVE   = "move"
Tic.STATUSSLEEP  = "sleep" -- statuses at floor
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
Tic.STATEIDLELF  = Tic.STATUSIDLE..Tic.DIRXLF -- direction states for hands objects
Tic.STATEIDLERG  = Tic.STATUSIDLE..Tic.DIRXRG
Tic.STATEMOVELF  = Tic.STATUSMOVE..Tic.DIRXLF
Tic.STATEMOVERG  = Tic.STATUSMOVE..Tic.DIRXRG
Tic.STATEWORKLF  = Tic.STATUSWORK..Tic.DIRXLF
Tic.STATEWORKRG  = Tic.STATUSWORK..Tic.DIRXRG
Tic.STATEFLOORLF = Tic.POSTUREFLOOR..Tic.DIRXLF
Tic.STATEFLOORRG = Tic.POSTUREFLOOR..Tic.DIRXRG

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


-- Direction System -- move to 8 directions depending on stattious
function Tic:moveDirection000(_character)
    Tic:moveDirection(Tic.DIR000, _character)
end

function Tic:moveDirection045(_character)
    Tic:moveDirection(Tic.DIR045, _character)
end

function Tic:moveDirection090(_character)
    Tic:moveDirection(Tic.DIR090, _character)
end

function Tic:moveDirection135(_character)
    Tic:moveDirection(Tic.DIR135, _character)
end

function Tic:moveDirection180(_character)
    Tic:moveDirection(Tic.DIR180, _character)
end

function Tic:moveDirection225(_character)
    Tic:moveDirection(Tic.DIR225, _character)
end

function Tic:moveDirection270(_character)
    Tic:moveDirection(Tic.DIR270, _character)
end

function Tic:moveDirection315(_character)
    Tic:moveDirection(Tic.DIR315, _character)
end

function Tic:moveDirection(_direction, _character)
    if not _direction then return end -- mandatory
    _character = _character or Tic:playerActual()
    if not _character then return end -- FIXME ensure another way that character exists ? (in world ?)
    local _movenone = (Tic.MODIFIERKEYS[Tic.KEY_CTRL]) and true or false -- force none move if ctrl
    local _moveslow = (Tic.MODIFIERKEYS[Tic.KEY_CAPSLOCK]) and true or false -- force slow move if caps
    local _moveback = (Tic.MODIFIERKEYS[Tic.KEY_SHIFT]) and true or false -- force back move if shift
    _character:moveDirection(_direction, _movenone, _moveslow, _moveback)
end


-- Stats System -- change a stat value
Tic.STATSET = "set"
Tic.STATDEC = "dec"
Tic.STATINC = "inc"
Tic.STATMAX = "max"
function Tic:statActPhy(_character)
    local _stat = "statphyact"
    Tic:statAct(_stat, _character)
end

function Tic:statActMen(_character)
    local _stat = "statmenact"
    Tic:statAct(_stat, _character)
end

function Tic:statActPsy(_character)
    local _stat = "statpsyact"
    Tic:statAct(_stat, _character)
end

function Tic:statAct(_stat, _character) -- modify an act stat -- set/dec/inc/max
    if not _stat then return end -- mandatory
    _character = _character or Tic:playerActual()
    if not _character then return end
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then
        _character:statAct(Tic.STATINC, _stat, 1)
    elseif Tic.MODIFIERKEYS[Tic.KEY_CTRL] then
        _character:statAct(Tic.STATDEC, _stat, 1)
    else
        _character:statAct(Tic.STATMAX, _stat)
    end
end


-- Biomes System -- set the current biome
Tic.BIOMES = CCyclerTable{ -- biomes cycler
    acttable = {
        Tic.COLORBIOMENIGHT, -- TODO add real biomes instead of just colors ?
        Tic.COLORBIOMESNOWY,
        Tic.COLORBIOMESANDY,
        Tic.COLORBIOMEGREEN,
        Tic.COLORBIOMEROCKY,
    },
}

function Tic:biomeNext() -- next biome in the stack
    return Tic.BIOMES:next()
end

function Tic:biomeActual() -- actual biome in the stack
    return Tic.BIOMES.actvalue
end


-- Hitbox System -- toggle hitbox display
Tic.HITBOXDRAW = false

function Tic:hitboxToggleDraw()
	Tic.HITBOXDRAW = Nums:toggleTF(Tic.HITBOXDRAW)
end


-- Spotting System -- toggle spotting draw/lock
function Tic:spottingToggleMode(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then
        Tic:spottingToggleSpot(_character)
    elseif Tic.MODIFIERKEYS[Tic.KEY_CTRL] then
        Tic:spottingTogglePick(_character)
    else
        Tic:spottingToggleLock(_character)
    end
end

function Tic:spottingToggleSpot(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	_character:spottingToggleSpot()
end

function Tic:spottingTogglePick(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	_character:spottingTogglePick()
end

function Tic:spottingToggleLock(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	_character:spottingToggleLock()
end

function Tic:isSpottingSpot(_character)
    _character = _character or Tic:playerActual()
    if not _character then return false end
	return _character:isSpottingSpot()
end

function Tic:isSpottingPick(_character)
    _character = _character or Tic:playerActual()
    if not _character then return false end
	return _character:isSpottingPick()
end

function Tic:isSpottingLock(_character)
    _character = _character or Tic:playerActual()
    if not _character then return false end
	return _character:isSpottingLock()
end

function Tic:entitySpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return nil end
	return _character:entitySpotting()
end

function Tic:entityHovering(_character)
    _character = _character or Tic:playerActual()
    if not _character then return nil end
	return _character:entityHovering()
end

function Tic:spottingActual(_character)
    return (Tic:entityHovering(_character)) and Tic:entityHovering(_character) or Tic:entitySpotting(_character)
end


-- Borders System -- toggle borders display
Tic.BORDERSDRAW = false

function Tic:bordersToggleDraw()
	Tic.BORDERSDRAW = Nums:toggleTF(Tic.BORDERSDRAW)
end


-- Dirs System -- toggle dirs display
Tic.DIRSDRAW = false

function Tic:dirsToggleDraw()
	Tic.DIRSDRAW = Nums:toggleTF(Tic.DIRSDRAW)
end


-- View System -- toggle view display
Tic.VIEWDRAW = false

function Tic:viewToggleDraw()
	Tic.VIEWDRAW = Nums:toggleTF(Tic.VIEWDRAW)
end


-- Mind System -- toggle mind display
Tic.MINDDRAW = false

function Tic:mindToggleDraw()
	Tic.MINDDRAW = Nums:toggleTF(Tic.MINDDRAW)
end


-- Move System -- toggle move display
Tic.MOVEDRAW = false

function Tic:moveToggleDraw()
	Tic.MOVEDRAW = Nums:toggleTF(Tic.MOVEDRAW)
end


-- Inventory System -- toggle inventory display
Tic.INVENTORYSHOW   = false
Tic.INVENTORYSCREEN = nil

function Tic:inventoryToggleShow()
	Tic.INVENTORYSHOW = Nums:toggleTF(Tic.INVENTORYSHOW)
    if Tic.INVENTORYSHOW then
        Tic:screenAppend(Tic.INVENTORYSCREEN)
    else
        Tic:screenRemove(Tic.INVENTORYSCREEN)
    end
end


-- Scales System -- handle scales
Tic.SCALES = CCyclerInt{minindex = 1, maxindex = 4} -- scales cycler from 1-4

function Tic:scaleNext() -- next scale in the stack
    Tic.SCALES:next()
    if not Tic:playerActual() then return end
    Tic:playerActual().scale = Tic:scaleActual()
    return Tic:scaleActual()
end

function Tic:scaleActual() -- actual scale in the stack
    return Tic.SCALES.actvalue
end


-- Tick System -- handle timers
Tic.TICK00 = CCyclerInt{ -- tick cycler from 0-maxinteger
    maxindex = Nums.MAXINTEGER,
}
Tic.TICK60 = CCyclerInt{ -- tick cycler from 0-59
    maxindex = 59,
}

function Tic:tick() -- increment the timers
    Tic.TICK00:next()
    Tic.TICK60:next()
end

function Tic:wait(_ticks) -- wait for a number of ticks -- pause the game
    _ticks = _ticks or 0
    local _wait = Tic.TICK00.actvalue + math.abs(_ticks)
    while Tic.TICK00.actvalue < _wait do
        Tic.TICK00:next()
    end
end


-- Log System -- store logs to display each frame
Tic.LOGBUFFER       = {} -- cleared at print
Tic.LOGRECORD       = {} -- cleared manually
Tic.LOGRECORDACTIVE = false -- to switch on/off

function Tic:logClearBuffer() -- clear the log buffer
    Tic.LOGBUFFER = {}
end

function Tic:logClearRecord() -- clear the log record
    Tic.LOGRECORD = {}
end

function Tic:logAppend(...) -- add line to the log buffer
    local _args = {...}
    local _line = ""
    for _, _val in ipairs(_args) do
        _line = _line..Tic:val2string(_val).." "
    end
    Tables:valInsert(Tic.LOGBUFFER, _line)
end

function Tic:logRecordActive(_active) -- set log record active on/off
    Tic.LOGRECORDACTIVE = _active
end

function Tic:logRecord(...) -- add line to the log record
    if not Tic.LOGRECORDACTIVE then return end -- log record not active -- do nothing
    local _args = {...}
    local _line = ""
    for _, _val in ipairs(_args) do
        _line = _line..Tic:val2string(_val).." "
    end
    Tables:valInsert(Tic.LOGRECORD, _line, true)
end

function Tic:logPrint() -- print the log buffer increased by the log record then clear it
    for _, _line in ipairs(Tic.LOGRECORD) do
        Tables:valInsert(Tic.LOGBUFFER, _line, true)
    end
    for _liney, _line in ipairs(Tic.LOGBUFFER) do
        _liney = _liney - 1 -- liney start from 0
        Tic:print(0, _liney * Tic.SPRITESIZE, _line) -- one line per "line"
    end
    Tic:logClearBuffer()
end

function Tic:logRecordEntities(_entities, _clear) -- record entities
    if _clear then Tic:logClearRecord() end
    for _entity, _ in pairs(_entities or {}) do
        Tic:logRecord(_entity:string())
    end
end


-- Time System -- extend functions based on time
function Tic:time2seconds() -- time in seconds
    return Nums:roundint(time() // 1000)
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
    print( _output, _screenx, _screeny, Tic.COLORCYAN, true, 1, true)
end


-- Trace System -- extend the simple trace function
Tic.TRACE = true

function Tic:traceOn()
    Tic.TRACE = true
end

function Tic:traceOff()
    Tic.TRACE = false
end

function Tic:trace(...) -- trace with multiple args
    if not Tic.TRACE then return end
    local _args = {...}
    local _output = ""
    for _, _val in ipairs(_args) do
        _val = Tic:val2string(_val)
        _output = _output.._val.." "
    end
    trace(_output)
end

function Tic:traceTable(_table, _argt) -- trace a table  -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    if not Tic.TRACE then return end
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
    poke4(((Tic.SPRITEBANK + (32 * _sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x), _color)
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

function Tic:boardDirectives(_sprite, _palette, _colorkey) -- returns the directive of a sprite -- optional palette modification
    if not _sprite then return end -- mandatory
    _palette  = _palette or {}
    _colorkey = _colorkey or Tic.COLORKEY
    local _result = {}

    for _y = 0, 7 do
        for _x = 0, 7 do
            local _color = peek4(((Tic.SPRITEBANK + (32 * _sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x))
            if _palette[_color] then
                _color = _palette[_color]
            end
            if not (_color == _colorkey) then -- skip empty pixels
                Tables:valInsert(_result, {
                    x = _x,
                    y = _y,
                    color = _color,
                })
            end
        end
    end

    return _result
end



--
-- CSprite
--
CSprite = Classic:extend() -- generic sprite
Classic.KINDSPRITE = "Sprite" -- Sprite kind
Classic.NAMESPRITE = "Sprite" -- Sprite name
CSprite.SPRITEBANK = 0
CSprite.FRAMEOF    = 16 -- sprites frames offset multiplier
CSprite.FRAME00    = 00 -- sprites frames -- [!] start at 0, used to compute the offset
CSprite.FRAME01    = 01
CSprite.ROTATE000  = 0 -- sprite rotations
CSprite.ROTATE090  = 1
CSprite.ROTATE180  = 2
CSprite.ROTATE270  = 3
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
    self.flip      = Tic.DIRXLF -- all sprites are dir x left by default
    self.rotate    = CSprite.ROTATE000 -- no rotation by default
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
Classic.KINDSPRITEBG = "SpriteBG" -- SpriteBG kind
Classic.NAMESPRITEBG = "SpriteBG" -- SpriteBG name
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SPRISMALLMPTY = CSpriteBG.SPRITEBANK + 0 -- empty sprite
CSpriteBG.SIGNBANK1   = 1  -- signs
CSpriteBG.SIGNQSTMRK  = CSpriteBG.SIGNBANK1 + 00 -- question mark
CSpriteBG.SIGNINTMRK  = CSpriteBG.SIGNBANK1 + 01 -- interact mark
CSpriteBG.SIGNBORDSQ  = CSpriteBG.SIGNBANK1 + 02 -- borders square
CSpriteBG.SIGNSPOTSQ  = CSpriteBG.SIGNBANK1 + 03 -- spotting square
CSpriteBG.SIGNCROSQU  = CSpriteBG.SIGNBANK1 + 04 -- crossed square
CSpriteBG.SIGNDOTSQU  = CSpriteBG.SIGNBANK1 + 05 -- dot square
CSpriteBG.SIGNBANK2   = 16 -- signs
CSpriteBG.SIGNARROWD  = CSpriteBG.SIGNBANK2 + 00 -- diag arrow
CSpriteBG.SIGNARROWL  = CSpriteBG.SIGNBANK2 + 01 -- line arrow
CSpriteBG.SIGNCENTER  = CSpriteBG.SIGNBANK2 + 02 -- center dot
CSpriteBG.SIGNPLAYER  = CSpriteBG.SIGNBANK2 + 03 -- player sprite
CSpriteBG.SIGNSPOTIT  = CSpriteBG.SIGNBANK2 + 04 -- spotit sprite
CSpriteBG.SIGNLOCKIT  = CSpriteBG.SIGNBANK2 + 05 -- lockit sprite
CSpriteBG.SIGNPICKIT  = CSpriteBG.SIGNBANK2 + 06 -- pickit sprite
CSpriteBG.SIGNSTAIDL  = CSpriteBG.SIGNBANK2 + 07 -- stand idle
CSpriteBG.SIGNKNEIDL  = CSpriteBG.SIGNBANK2 + 08 -- kneel idle
CSpriteBG.SIGNSTAMOV  = CSpriteBG.SIGNBANK2 + 09 -- stand move
CSpriteBG.SIGNKNEMOV  = CSpriteBG.SIGNBANK2 + 10 -- kneel move
CSpriteBG.SIGNDOWORK  = CSpriteBG.SIGNBANK2 + 11 -- work
CSpriteBG.SIGNDOSLEE  = CSpriteBG.SIGNBANK2 + 12 -- sleep
CSpriteBG.SIGNACTPHY  = CSpriteBG.SIGNBANK2 + 13 -- actual phy
CSpriteBG.SIGNACTMEN  = CSpriteBG.SIGNBANK2 + 14 -- actual men
CSpriteBG.SIGNACTPSY  = CSpriteBG.SIGNBANK2 + 15 -- actual psy
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
Classic.KINDSPRITEFG = "SpriteFG" -- SpriteFG kind
Classic.NAMESPRITEFG = "SpriteFG" -- SpriteFG name
CSpriteFG.SPRITEBANK  = 256
CSpriteFG.SPRITEBOARD = CSpriteFG.SPRITEBANK + 0 -- board sprite -- for creating a sprite by code
CSpriteFG.SPRITEPIXEL = CSpriteFG.SPRITEBANK + 1 -- pixel sprite
CSpriteFG.HEADBANK    = 272 -- characters heads
CSpriteFG.HEADDWARF   = CSpriteFG.HEADBANK + 0
CSpriteFG.HEADGNOME   = CSpriteFG.HEADBANK + 1
CSpriteFG.HEADELVWE   = CSpriteFG.HEADBANK + 2
CSpriteFG.HEADGOLTH   = CSpriteFG.HEADBANK + 3
CSpriteFG.HEADANGEL   = CSpriteFG.HEADBANK + 4
CSpriteFG.HEADHORNE   = CSpriteFG.HEADBANK + 5
CSpriteFG.HEADMEDUZ   = CSpriteFG.HEADBANK + 6
CSpriteFG.HEADGNOLL   = CSpriteFG.HEADBANK + 7
CSpriteFG.HEADGHOST   = CSpriteFG.HEADBANK + 8
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
CSpriteFG.EFFECTBANK  = 336 -- effects types
CSpriteFG.EFFECTEMPTY = CSpriteBG.SPRISMALLMPTY
CSpriteFG.EFFECTSLEEP = CSpriteFG.EFFECTBANK + 0
CSpriteFG.EFFECTWOUND = CSpriteFG.EFFECTBANK + 1
CSpriteFG.EFFECTDEATH = CSpriteFG.EFFECTBANK + 2
CSpriteFG.OBJECTBANK  = 352 -- objects types
CSpriteFG.WEAPONMELEE = CSpriteFG.OBJECTBANK + 0 -- melee bank
CSpriteFG.WEAPONMSWRD = CSpriteFG.WEAPONMELEE + 0
CSpriteFG.WEAPONMHAMR = CSpriteFG.WEAPONMELEE + 16
CSpriteFG.WEAPONMLNCE = CSpriteFG.WEAPONMELEE + 32
CSpriteFG.WEAPONRANGE = CSpriteFG.OBJECTBANK + 1 -- range bank
CSpriteFG.WEAPONRBOWS = CSpriteFG.WEAPONRANGE + 0
CSpriteFG.WEAPONRBOWM = CSpriteFG.WEAPONRANGE + 16
CSpriteFG.WEAPONRBOWL = CSpriteFG.WEAPONRANGE + 32
CSpriteFG.WEAPONSHLDB = CSpriteFG.OBJECTBANK + 2 -- shields bank
CSpriteFG.WEAPONSHLDS = CSpriteFG.WEAPONSHLDB + 0
CSpriteFG.WEAPONSHLDM = CSpriteFG.WEAPONSHLDB + 16
CSpriteFG.WEAPONSHLDL = CSpriteFG.WEAPONSHLDB + 32
CSpriteFG.OBJECTFLASB = CSpriteFG.OBJECTBANK + 3 -- flasks bank
CSpriteFG.OBJECTFLASS = CSpriteFG.OBJECTFLASB + 0
CSpriteFG.OBJECTFLASM = CSpriteFG.OBJECTFLASB + 16
CSpriteFG.OBJECTFLASL = CSpriteFG.OBJECTFLASB + 32
CSpriteFG.CLOTHESHATB = CSpriteFG.OBJECTBANK + 4 -- hats bank
CSpriteFG.CLOTHESHATS = CSpriteFG.CLOTHESHATB + 0
CSpriteFG.CLOTHESHATM = CSpriteFG.CLOTHESHATB + 16
CSpriteFG.CLOTHESHATL = CSpriteFG.CLOTHESHATB + 32
CSpriteFG.CLOTHESHLMB = CSpriteFG.OBJECTBANK + 5 -- helmets bank
CSpriteFG.CLOTHESHLMS = CSpriteFG.CLOTHESHLMB + 0
CSpriteFG.CLOTHESHLMM = CSpriteFG.CLOTHESHLMB + 16
CSpriteFG.CLOTHESHLML = CSpriteFG.CLOTHESHLMB + 32
CSpriteFG.CLOTHESBKPB = CSpriteFG.OBJECTBANK + 6 -- backpacks bank
CSpriteFG.CLOTHESBKPS = CSpriteFG.CLOTHESBKPB + 0
CSpriteFG.CLOTHESBKPM = CSpriteFG.CLOTHESBKPB + 16
CSpriteFG.CLOTHESBKPL = CSpriteFG.CLOTHESBKPB + 32
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
Classic.KINDSPRITEFGEMPTY = "SpriteFGEmpty" -- SpriteFGEmpty kind
Classic.NAMESPRITEFGEMPTY = "SpriteFGEmpty" -- SpriteFGEmpty name
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.kind = Classic.KINDSPRITEFGEMPTY
    self.name = Classic.NAMESPRITEFGEMPTY
    self.sprite = CSpriteBG.SPRISMALLMPTY
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGPixel
--
CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
Classic.KINDSPRITEFGPIXEL = "SpriteFGPixel" -- SpriteFGPixel kind
Classic.NAMESPRITEFGPIXEL = "SpriteFGPixel" -- SpriteFGPixel name
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
Classic.KINDSPRITEFGBOARD = "SpriteFGBoard" -- SpriteFGBoard kind
Classic.NAMESPRITEFGBOARD = "SpriteFGBoard" -- SpriteFGBoard name
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


--
-- CAnimation
--
CAnimation = Classic:extend() -- generic palette animation for entities
Classic.KINDANIMATION = "Animation" -- Animation kind
Classic.NAMEANIMATION = "Animation" -- Animation name
function CAnimation:new(_argt)
    CAnimation.super.new(self, _argt)
    self.kind = Classic.KINDANIMATION
    self.name = Classic.NAMEANIMATION
    self.frequence = Tic.FREQUENCE0060
    self.percent0  = 0.5
    self.palette0  = {}
    self.palette1  = {}
    self:argt(_argt) -- override if any
end


--
-- CInteraction
--
CInteraction = Classic:extend() -- generic interaction for entities
Classic.KINDINTERACTION = "Interaction" -- Interaction kind
Classic.NAMEINTERACTION = "Interaction" -- Interaction name
function CInteraction:new(_argt)
    CInteraction.super.new(self, _argt)
    self.kind = Classic.KINDINTERACTION
    self.name = Classic.NAMEINTERACTION
    self:argt(_argt) -- override if any
end


--
-- CSlot
--
CSlot = Classic:extend() -- generic slot
Classic.KINDSLOT = "Slot" -- Slot kind
Classic.NAMESLOT = "Slot" -- Slot name
function CSlot:new(_argt)
    CSlot.super.new(self, _argt)
    self.kind = Classic.KINDSLOT
    self.name = Classic.NAMESLOT
    self.slottype = nil -- allowed slot type -- nil = any
    self.object   = nil -- object contained in the slot
    self:argt(_argt) -- override if any
end

function CSlot:isSlot(_slot)
    return _slot and type(_slot) == "table" and _slot.is and _slot:is(CSlot)
end

function CSlot:canSlotObject(_object)
    if not _object then return false end -- mandatory
    if not _object.slottype then return false end -- mandatory -- only slotable objects
    if self.slottype and not (_object.slottype == self.slottype) then return false end -- not allowed type if any
    return true
end

CSlotHead = CSlot:extend() -- generic head slot
Classic.KINDSLOTHEAD = "SlotHead" -- SlotHead kind
Classic.NAMESLOTHEAD = "SlotHead" -- SlotHead name
function CSlotHead:new(_argt)
    CSlotHead.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHEAD
    self.name = Classic.NAMESLOTHEAD
    self.slottype = CSlotHead
    self:argt(_argt) -- override if any
end

CSlotBack = CSlot:extend() -- generic back slot
Classic.KINDSLOTBACK = "SlotBack" -- SlotBack kind
Classic.NAMESLOTBACK = "SlotBack" -- SlotBack name
function CSlotBack:new(_argt)
    CSlotBack.super.new(self, _argt)
    self.kind = Classic.KINDSLOTBACK
    self.name = Classic.NAMESLOTBACK
    self.slottype = CSlotBack
    self:argt(_argt) -- override if any
end

CSlotHand = CSlot:extend() -- generic hand slot
Classic.KINDSLOTHAND = "SlotHand" -- SlotHand kind
Classic.NAMESLOTHAND = "SlotHand" -- SlotHand name
function CSlotHand:new(_argt)
    CSlotHand.super.new(self, _argt)
    self.kind = Classic.KINDSLOTHAND
    self.name = Classic.NAMESLOTHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end


--
-- CInventory
--
CInventory = Classic:extend() -- generic inventory
Classic.KINDINVENTORY = "Inventory" -- Inventory kind
Classic.NAMEINVENTORY = "Inventory" -- Inventory name
function CInventory:new(_argt)
    CInventory.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORY
    self.name = Classic.NAMEINVENTORY
    self.objectstypes = nil -- list of allowed inventory classes -- nil = any
	self.objectsmax   = Nums.MAXINTEGER
	self.objects      = {}
    self:argt(_argt) -- override if any
end

function CInventory:isInventory(_inventory)
    return _inventory and type(_inventory) == "table" and _inventory.is and _inventory:is(CInventory)
end

function CInventory:canAppendObject(_object)
    if not _object then return false end -- mandatory
    if not _object.inventorytype then return false end -- mandatory -- only storable objects
    if self.objectstypes and not Tables:valFind(self.objectstypes, _object.inventorytype) then return false end -- not allowed type if any
    if not Tables:valFind(self.objects, _object) -- not in inventory
    and Tables:size(self.objects) >= self.objectsmax then return false end -- and cannot append, inventory full
    return true
end

function CInventory:appendObject(_object)
    if not self:canAppendObject(_object) then return end -- nil = false
    Tables:valInsert(self.objects, _object, true) -- add the object
    return _object -- done
end

function CInventory:removeObject(_object)
    if not _object then return end -- mandatory
    if not Tables:valFind(self.objects, _object) then return end -- not in inventory
    Tables:valRemove(self.objects, _object) -- remove all -- should not append
    return _object -- ok
end

function CInventory:copytoInventory(_inventory)
    if not _inventory then return end -- mandatory
    local _garbage = {}
    local _objects = Tables:iclone(self.objects, true)
    for _, _object in ipairs(_objects) do
        if not _inventory:appendObject(_object) then
            Tables:valInsert(_garbage, _object, true)
        end
    end
    return _garbage
end

function CInventory:movetoInventory(_inventory)
    if not _inventory then return end -- mandatory
    local _garbage = {}
    local _objects = Tables:iclone(self.objects, true)
    for _, _object in ipairs(_objects) do
        if not _inventory:appendObject(_object) then
            Tables:valInsert(_garbage, _object, true)
        else
            self:removeObject(_object)
        end
    end
    return _garbage
end

CInventoryAny = CInventory:extend() -- generic any inventory
Classic.KINDINVENTORYANY = "InventoryAny" -- InventoryAny kind
Classic.NAMEINVENTORYANY = "InventoryAny" -- InventoryAny name
function CInventoryAny:new(_argt)
    CInventoryAny.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY
    self.name = Classic.NAMEINVENTORYANY
    self:argt(_argt) -- override if any
end

CInventoryPhy = CInventory:extend() -- generic phy inventory
Classic.KINDINVENTORYPHY = "InventoryPhy" -- InventoryPhy kind
Classic.NAMEINVENTORYPHY = "InventoryPhy" -- InventoryPhy name
function CInventoryPhy:new(_argt)
    CInventoryPhy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPHY
    self.name = Classic.NAMEINVENTORYPHY
    self.objectstypes = {CInventoryPhy}
    self:argt(_argt) -- override if any
end

CInventoryMen = CInventory:extend() -- generic men inventory
Classic.KINDINVENTORYMEN = "InventoryMen" -- InventoryMen kind
Classic.NAMEINVENTORYMEN = "InventoryMen" -- InventoryMen name
function CInventoryMen:new(_argt)
    CInventoryMen.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYMEN
    self.name = Classic.NAMEINVENTORYMEN
    self.objectstypes = {CInventoryMen}
    self:argt(_argt) -- override if any
end

CInventoryPsy = CInventory:extend() -- generic psy inventory
Classic.KINDINVENTORYPSY = "InventoryPsy" -- InventoryPsy kind
Classic.NAMEINVENTORYPSY = "InventoryPsy" -- InventoryPsy name
function CInventoryPsy:new(_argt)
    CInventoryPsy.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYPSY
    self.name = Classic.NAMEINVENTORYPSY
    self.objectstypes = {CInventoryPsy}
    self:argt(_argt) -- override if any
end

CInventoryAny2 = CInventoryAny:extend() -- generic any inventory 2
Classic.KINDINVENTORYANY2 = "InventoryAny2" -- InventoryAny2 kind
Classic.NAMEINVENTORYANY2 = "InventoryAny2" -- InventoryAny2 name
function CInventoryAny2:new(_argt)
    CInventoryAny2.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY2
    self.name = Classic.NAMEINVENTORYANY2
	self.objectsmax   = 2
    self:argt(_argt) -- override if any
end

CInventoryAny4 = CInventoryAny:extend() -- generic any inventory 4
Classic.KINDINVENTORYANY4 = "InventoryAny4" -- InventoryAny4 kind
Classic.NAMEINVENTORYANY4 = "InventoryAny4" -- InventoryAny4 name
function CInventoryAny4:new(_argt)
    CInventoryAny4.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY4
    self.name = Classic.NAMEINVENTORYANY4
	self.objectsmax   = 4
    self:argt(_argt) -- override if any
end

CInventoryAny6 = CInventoryAny:extend() -- generic any inventory 6
Classic.KINDINVENTORYANY6 = "InventoryAny6" -- InventoryAny6 kind
Classic.NAMEINVENTORYANY6 = "InventoryAny6" -- InventoryAny6 name
function CInventoryAny6:new(_argt)
    CInventoryAny6.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY6
    self.name = Classic.NAMEINVENTORYANY6
	self.objectsmax   = 6
    self:argt(_argt) -- override if any
end

CInventoryAny8 = CInventoryAny:extend() -- generic any inventory 8
Classic.KINDINVENTORYANY8 = "InventoryAny8" -- InventoryAny8 kind
Classic.NAMEINVENTORYANY8 = "InventoryAny8" -- InventoryAny8 name
function CInventoryAny8:new(_argt)
    CInventoryAny8.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY8
    self.name = Classic.NAMEINVENTORYANY8
	self.objectsmax   = 8
    self:argt(_argt) -- override if any
end

CInventoryAny10 = CInventoryAny:extend() -- generic any inventory 10
Classic.KINDINVENTORYANY10 = "InventoryAny10" -- InventoryAny10 kind
Classic.NAMEINVENTORYANY10 = "InventoryAny10" -- InventoryAny10 name
function CInventoryAny10:new(_argt)
    CInventoryAny10.super.new(self, _argt)
    self.kind = Classic.KINDINVENTORYANY10
    self.name = Classic.NAMEINVENTORYANY10
	self.objectsmax   = 10
    self:argt(_argt) -- override if any
end


--
-- CRegion
--
CRegion = Classic:extend() -- generic region -- lf rg up dw around a point
Classic.KINDREGION = "Region" -- Region kind
Classic.NAMEREGION = "Region" -- Region name
function CRegion:new(_argt)
    CRegion.super.new(self, _argt)
    self.kind = Classic.KINDREGION
    self.name = Classic.NAMEREGION
    self.lf = Nums.MININTEGER
    self.rg = Nums.MAXINTEGER
    self.up = Nums.MININTEGER
    self.dw = Nums.MAXINTEGER
    self:argt(_argt) -- override if any
end

function CRegion:string() -- region as a string
    return Nums:roundint(self.lf)..":"..Nums:roundint(self.rg), Nums:roundint(self.up)..":"..Nums:roundint(self.dw)
end

function CRegion:borderW(_scale) -- border width
    _scale = _scale or Tic.SCALE01
    return self.rg - self.lf + (1 * _scale)
end

function CRegion:borderH(_scale) -- border height
    _scale = _scale or Tic.SCALE01
    return self.dw - self.up + (1 * _scale)
end

function CRegion:surface() -- region surface
    return self:borderW() * self:borderH()
end

function CRegion:offsetXY(_offsetx, _offsety) -- offset a region by x y
    _offsetx = _offsetx or 0
    _offsety = _offsety or 0
    return CRegion{
        lf = self.lf + _offsetx,
        rg = self.rg + _offsetx,
        up = self.up + _offsety,
        dw = self.dw + _offsety,
    }
end

function CRegion:randomWH(_width, _height) -- returns a region of random width and height
    _width  = _width  or Nums.MAXINTEGER -- be careful with that ;)
    _height = _height or Nums.MAXINTEGER
    _width  = (_width == 0)  and 1  or _width -- avoid weird results with math.random(0)
    _height = (_height == 0) and 1  or _height
    return CRegion{
        lf = Nums:neg(math.random(_width)),
        rg = Nums:pos(math.random(_width)),
        up = Nums:neg(math.random(_height)),
        dw = Nums:pos(math.random(_height)),
    }
end

function CRegion:hasInsidePoint(_pointx, _pointy) -- is a point inside a region ?
    _pointx = _pointx or 0
    _pointy = _pointy or 0
	if not Nums:isBW(_pointx, self.lf, self.rg) then return false end
	if not Nums:isBW(_pointy, self.up, self.dw) then return false end
	return true
end

function CRegion:hasInsideRegion(_region) -- is a region inside a region ?
	if not _region then return false end -- mandatory
	if self:hasInsidePoint(_region.lf, _region.up) then return true end
	if self:hasInsidePoint(_region.rg, _region.up) then return true end
	if self:hasInsidePoint(_region.lf, _region.dw) then return true end
	if self:hasInsidePoint(_region.rg, _region.dw) then return true end
	return false
end

function CRegion:directionRegion(_region) -- returns the direction from a region to a region
    if not _region then return end -- mandatory
    if self.up > _region.dw then -- lower than entity
        if self.lf > _region.rg then return Tic.DIR315 end
        if self.rg < _region.lf then return Tic.DIR045 end
        return Tic.DIR000
    elseif self.dw < _region.up then -- upper than entity
        if self.lf > _region.rg then return Tic.DIR225 end
        if self.rg < _region.lf then return Tic.DIR135 end
        return Tic.DIR180
    else -- same level than entity
        if self.rg < _region.lf then return Tic.DIR090 end
        if self.lf > _region.rg then return Tic.DIR270 end
        return Tic.DIRHIT
    end
end


--
-- CHitbox
--
CHitbox = CRegion:extend() -- generic hitbox region
Classic.KINDHITBOX = "Hitbox" -- Hitbox kind
Classic.NAMEHITBOX = "Hitbox" -- Hitbox name
CHitbox.LF = 0 -- hitbox region sizes
CHitbox.RG = Tic.SPRITESIZE - 1
CHitbox.UP = 0
CHitbox.DW = Tic.SPRITESIZE - 1
function CHitbox:new(_argt)
    CHitbox.super.new(self, _argt)
    self.kind = Classic.KINDHITBOX
    self.name = Classic.NAMEHITBOX
    self.lf     = CHitbox.LF
    self.rg     = CHitbox.RG
    self.up     = CHitbox.UP
    self.dw     = CHitbox.DW
    self.entity = nil -- parent entity -- override if any
    self.hitto  = {}  -- entities hitto -- table
    self.hitby  = {}  -- entities hitby -- table
    self:argt(_argt) -- override if any
end

function CHitbox:hittoAppend(_entity) -- append an entity hitto
    if not _entity then return end -- mandatory
    Tables:keyAppend(self.hitto, _entity)
end

function CHitbox:hittoDelete(_entity) -- delete an entity hitto
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.hitto, _entity)
end

function CHitbox:hitbyAppend(_entity) -- append an entity hitby
    if not _entity then return end -- mandatory
    Tables:keyAppend(self.hitby, _entity)
end

function CHitbox:hitbyDelete(_entity) -- delete an entity hitby
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.hitby, _entity)
end

function CHitbox:hasHitTo() -- has hitto ?
    return Tables:size(self.hitto) > 0
end

function CHitbox:hasHitBy() -- has hitby ?
    return Tables:size(self.hitby) > 0
end

function CHitbox:draw()
    if not self.entity then return end -- no entity no draw
	local _drawcolor = Tic.COLORYELLOW
    _drawcolor = (self:hasHitTo()) and Tic.COLORORANGE or _drawcolor
    _drawcolor = (self:hasHitBy()) and Tic.COLORRED    or _drawcolor

    local _regionadjusted = self:regionAdjusted():offsetXY(self.entity.screenx, self.entity.screeny)

    rectb(
		_regionadjusted.lf,
		_regionadjusted.up,
		_regionadjusted:borderW(self.entity.scale),
		_regionadjusted:borderH(self.entity.scale),
		_drawcolor
	)
end

function CHitbox:regionAdjusted() -- hitbox offsets adjusted to its entity -- depends on dirx and scale
    local _result  = CRegion{lf = self.lf, rg = self.rg, up = self.up, dw = self.dw}
    if not self.entity then return _result end -- has no entity to adjust with

    local _widthlf = (self.lf - CHitbox.LF) -- |lf|md|rg| areas widths
    local _widthmd = (self.rg - self.lf )
    local _widthrg = (CHitbox.RG - self.rg)

    _result.lf = (self.entity.dirx == Tic.DIRXLF)
        and _widthlf * self.entity.scale
        or  _widthrg * self.entity.scale
    _result.rg = _result.lf + (_widthmd * self.entity.scale)
    _result.up = self.up * self.entity.scale
    _result.dw = self.dw * self.entity.scale

    return _result
end


--
-- CLocations
--
CLocations = Classic:extend() -- generic entities locations -- {worldy {worldx {entity = entity}}} -- FIXME change entity by true ?
Classic.KINDLOCATIONS = "Locations" -- Locations kind
Classic.NAMELOCATIONS = "Locations" -- Locations name
function CLocations:new(_argt)
    CLocations.super.new(self, _argt)
    self.kind = Classic.KINDLOCATIONS
    self.name = Classic.NAMELOCATIONS
    self.locations = {}
    self:argt(_argt) -- override if any
end

function CLocations:entities(_locations) -- entities in locations
    local _result = {}

    for _keyy, _valy in pairs(_locations or {}) do -- loop on y
		for _keyx, _valx in pairs(_valy) do -- loop on x
			for _entity, _ in pairs(_valx) do -- loop on entities
				_result[_entity] = _entity
			end
		end
    end

    return _result -- entities
end

function CLocations:appendEntity(_entity) -- append a new entity -- [!] allows doublons
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

function CLocations:deleteEntity(_entity) -- delete an existing entity
    if not _entity then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy
    if not self.locations[_worldy][_worldx][_entity] then return end -- doesnt exist
    self.locations[_worldy][_worldx][_entity] = nil
    if Tables:size(self.locations[_worldy][_worldx]) == 0 then self.locations[_worldy][_worldx] = nil end -- cleanup
    if Tables:size(self.locations[_worldy]) == 0 then self.locations[_worldy] = nil end
end

function CLocations:moveEntityWorldXY(_entity, _worldx, _worldy) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.locations[_entity.worldy][_entity.worldx][_entity] then return end -- doesnt exist
    self:deleteEntity(_entity)
    _entity.worldx = _worldx
    _entity.worldy = _worldy
    self:appendEntity(_entity)
end

function CLocations:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    local _result  = {}

    for _keyy, _valy in pairs(self.locations) do -- search for y in range
        if Nums:isBW(_keyy, _region.up, _region.dw)
        or Nums:isBW(_keyy + Tic.SPRITESIZE - 1, _region.up, _region.dw) then
            for _keyx, _valx in pairs(_valy) do -- search for x in range
                if Nums:isBW(_keyx, _region.lf, _region.rg)
                or Nums:isBW(_keyx + Tic.SPRITESIZE - 1, _region.lf, _region.rg) then
                    for _entity, _ in pairs(_valx) do -- loop on entities
                        if not _result[_keyy] then -- new worldy entry
                            _result[_keyy] = {}
                        end
                        if not _result[_keyy][_keyx] then -- new worldx entry in existing worldy
                            _result[_keyy][_keyx] = {}
                        end
                        _result[_keyy][_keyx][_entity] = _entity -- build up locations
                    end
                end
            end
        end
    end
	
    return _result -- locations
end

function CLocations:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in region around world xy
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self:locationsRegion(_region:offsetXY(_worldx, _worldy))
end

function CLocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self:locationsWorldXYRegion(_worldx, _worldy, CRegion{
        lf = Nums:neg(_rangex),
        rg = Nums:pos(_rangex),
        up = Nums:neg(_rangey),
        dw = Nums:pos(_rangey),
    })
end

function CLocations:locationsEntityRegion(_entity, _region) -- locations in region
    if not _entity or not _region then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CLocations:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    local _worldx = _entity.worldx
    local _worldy = _entity.worldy

    return self:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end

--
-- CEntitiesLocations
--
CEntitiesLocations = Classic:extend() -- generic locations for entities
Classic.KINDENTITIESLOCATIONS = "EntitiesLocations" -- EntitiesLocations kind
Classic.NAMEENTITIESLOCATIONS = "EntitiesLocations" -- EntitiesLocations name
function CEntitiesLocations:new(_argt)
    CEntitiesLocations.super.new(self, _argt)
    self.kind = Classic.KINDENTITIESLOCATIONS
    self.name = Classic.NAMEENTITIESLOCATIONS
    self.entities  = {} -- record each entity -- has to have worldx and worldy attributes
    self.locations = CLocations{} -- record each entity locations
    self:argt(_argt) -- override if any
end

function CEntitiesLocations:existsEntity(_entity) -- if exists an entity
    if not _entity then return false end -- mandatory
    return self.entities[_entity]
end

function CEntitiesLocations:appendEntity(_entity) -- add a new entity
    if not _entity then return end -- mandatory
    if self:existsEntity(_entity) then return end -- avoid doublons
    self.entities[_entity] = _entity
    self.locations:appendEntity(_entity)
end

function CEntitiesLocations:deleteEntity(_entity) -- delete an entity
    if not _entity then return end -- mandatory
    if not self:existsEntity(_entity) then return end -- doesnt exist
    self.entities[_entity] = nil
    self.locations:deleteEntity(_entity)
end

function CEntitiesLocations:moveEntityWorldXY(_entity, _worldx, _worldy) -- move an existing entity
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    if not self.entities[_entity] then return end -- doesnt exist
    self.locations:moveEntityWorldXY(_entity, _worldx, _worldy)
end

function CEntitiesLocations:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    return self.locations:locationsRegion(_region)
end

function CEntitiesLocations:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in world xy region
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self.locations:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CEntitiesLocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in world xy ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.locations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end

function CEntitiesLocations:locationsEntityRegion(_entity, _region) -- locations in entity region
    if not _entity or not _region then return end -- mandatory
    return self.locations:locationsEntityRegion(_entity, _region)
end

function CEntitiesLocations:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in entity ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.locations:locationsEntityRangeXY(_entity, _rangex, _rangey)
end


--
-- CEntity
--
CEntity = Classic:extend() -- generic entities like worlds, places, objects, characters, cameras ...
Classic.KINDENTITY = "Entity" -- Entity kind
Classic.NAMEENTITY = "Entity" -- Entity name
Classic.NAMEEMPTY  = "Empty"  -- Empty name
Classic.NAMEDYING  = "Dying"   -- Dying name
Classic.NAMESILENT = "Silent" -- Silent name
Classic.NAMELIVING = "Living" -- Living name
Classic.NAMEANIMED = "Animed" -- Animed name
Classic.NAMEFITFUL = "Fitful" -- Fitful name
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.classic = CEntity -- instance of
    self.classed = nil -- override to limit argt
    self.kind = Classic.KINDENTITY
    self.name = Classic.NAMEENTITY
    self.world        = nil -- parent world if any
    self.worldx       = CEntity.WORLDX -- world positions
    self.worldy       = CEntity.WORLDY
    self.discovered   = false -- discovered by the player ?
    self.interactions = nil -- possible interactions if any
    self.interactto   = {}  -- entities interactto -- table
    self.interactby   = {}  -- entities interactby -- table
    self.camera = nil -- optional camera that follows the entity -- to override if any
    self:argt(_argt) -- override if any
end

function CEntity:string() -- entity as a string
    return self.worldx, self.worldy, self.kind, self.name
end

function CEntity:focus() -- focus camera on itself
    if not self.camera then return end -- requires a camera
    self.camera:focusEntity(self)
end

function CEntity:locationsRegion(_region) -- locations in a region from itself
    if not _region then return end -- mandatory
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:locationsRegion(_region)
end

function CEntity:locationsAround() -- locations around itself
    if not self.camera then return end -- requires a camera
    self:focus()
    return self.camera:locationsAround()
end

function CEntity:nearestEntityAround() -- nearest entity around itself, except itself
    local _result          = nil
    local _locationsaround = self:locationsAround()
    local _entitiesaround  = CLocations:entities(_locationsaround)

    for _entity, _ in pairs(_entitiesaround) do
        if not (_entity == self) then -- avoid to nearest itself
            if _result == nil then
                _result = _entity -- first nearest entity
            elseif self:distanceEntityFake(_entity) < self:distanceEntityFake(_result) then
                _result = _entity -- new nearest entity
            end
        end
    end

    return _result
end

function CEntity:randomRegionWorld(_region) -- random worldx worldy in a region -- default min/max
    _region = _region or CRegion{}
    self.world:deleteEntity(self) -- delete itself from its old position -- FIXME why remove/append here ?
    self.worldx = Nums:random(_region.lf, _region.rg)
    self.worldy = Nums:random(_region.up, _region.dw)
    self.world:appendEntity(self) -- append itself from its new position
end

function CEntity:randomWorldWindow() -- random worldx worldy into the world window region
    self:randomRegionWorld(CRegion{
        lf = Nums:neg(Tic.WORLDWW2),
        rg = Nums:pos(Tic.WORLDWW2),
        up = Nums:neg(Tic.WORLDWH2),
        dw = Nums:pos(Tic.WORLDWH2),
    })
end

function CEntity:distanceEntityReal(_entity) -- real distance from itself to another entity -- slower
    if not _entity then return 0 end -- mandatory
    return Nums:distancePointsReal(self.worldx, self.worldy, _entity.worldx, _entity.worldy)
end

function CEntity:distanceEntityFake(_entity) -- fake distance from itself to another entity -- faster
    if not _entity then return 0 end -- mandatory
    return Nums:distancePointsFake(self.worldx, self.worldy, _entity.worldx, _entity.worldy)
end

function CEntity:interacttoAppend(_entity) -- append an entity interactto
    if not _entity then return end -- mandatory
    if not _entity:hasInteractions() then return end -- no interaction possible
    Tables:keyAppend(self.interactto, _entity)
end

function CEntity:interacttoDelete(_entity) -- delete an entity interactto
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.interactto, _entity)
end

function CEntity:interacttoDeleteAll() -- delete all entities interactto
    self.interactto = {}
end

function CEntity:interactbyAppend(_entity) -- append an entity interactby
    if not _entity then return end -- mandatory
    if not self:hasInteractions() then return end -- no interaction possible
    Tables:keyAppend(self.interactby, _entity)
end

function CEntity:interactbyDelete(_entity) -- delete an entity interactby
    if not _entity then return end -- mandatory
    Tables:keyDelete(self.interactby, _entity)
end

function CEntity:interactbyDeleteAll() -- delete all entities interactby
    self.interactby = {}
end

function CEntity:hasInteractTo() -- has interactto ?
    return Tables:size(self.interactto) > 0
end

function CEntity:hasInteractBy() -- has interactby ?
    return Tables:size(self.interactby) > 0
end

function CEntity:hasInteractions() -- has interactions ?
    return Tables:size(self.interactions) > 0
end


--
-- CWorld
--
CWorld = CEntity:extend() -- generic world that contains entities
Classic.KINDWORLD = "World" -- World kind
Classic.NAMEWORLD = "World" -- World name
function CWorld:new(_argt)
    CWorld.super.new(self, _argt)
    self.classic = CWorld -- instance of
    self.kind = Classic.KINDWORLD
    self.name = Classic.NAMEWORLD
    self.region            = CRegion{} -- world boundaries
    self.entitieslocations = CEntitiesLocations{} -- record world entities and their locations
    self:argt(_argt) -- override if any
end
-- CWorld instance
World = CWorld{}

function CWorld:appendEntity(_entity) -- append an entity in the world
    if not _entity then return end -- mandatory
    _entity.world = self -- parent world
    self.entitieslocations:appendEntity(_entity)
end

function CWorld:deleteEntity(_entity) -- delete an entity from the world
    if not _entity then return end -- mandatory
    self.entitieslocations:deleteEntity(_entity)
end

function CWorld:moveEntityWorldXY(_entity, _worldx, _worldy) -- move an entity into the world
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    self.entitieslocations:moveEntityWorldXY(_entity, _worldx, _worldy)
    _entity:focus() -- focus its camera on itself
end

function CWorld:locationsRegion(_region) -- locations in region
    if not _region then return end -- mandatory
    return self.entitieslocations:locationsRegion(_region)
end

function CWorld:locationsWorldXYRegion(_worldx, _worldy, _region) -- locations in region
    if not _worldx or not _worldy or not _region then return end -- mandatory
    return self.entitieslocations:locationsWorldXYRegion(_worldx, _worldy, _region)
end

function CWorld:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey) -- locations in ranges
    if not _worldx or not _worldy or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:locationsWorldXYRangeXY(_worldx, _worldy, _rangex, _rangey)
end

function CWorld:locationsEntityRegion(_entity, _region) -- locations in region
    if not _entity or not _region then return end -- mandatory
    return self.entitieslocations:locationsEntityRegion(_entity, _region)
end

function CWorld:locationsEntityRangeXY(_entity, _rangex, _rangey) -- locations in ranges
    if not _entity or not _rangex or not _rangey then return end -- mandatory
    return self.entitieslocations:locationsEntityRangeXY(_entity, _rangex, _rangey)
end


--
-- CCamera
--
CCamera = CEntity:extend() -- camera
Classic.KINDCAMERA = "Camera" -- Camera kind
Classic.NAMECAMERA = "Camera" -- Camera name
CCamera.RANGEX = Tic.WORLDWW / 2
CCamera.RANGEY = Tic.WORLDWH / 2
function CCamera:new(_argt)
    CCamera.super.new(self, _argt)
    self.classic = CCamera -- instance of
    self.kind = Classic.KINDCAMERA
    self.name = Classic.NAMECAMERA
    self.world  = World
    self.rangex = CCamera.RANGEX
    self.rangey = CCamera.RANGEY
    self:argt(_argt) -- override if any
end

function CCamera:focusXY(_worldx, _worldy) -- focus camera on world positions -- default to center
    self.worldx = _worldx or self.worldx
    self.worldy = _worldy or self.worldy
end

function CCamera:focusEntity(_entity) -- focus camera on an entity world positions
    if not _entity then return end -- mandatory
    self:focusXY(_entity.worldx, _entity.worldy)
end

function CCamera:locationsRegion(_region) -- locations in region from a camera
    if not _region then return end -- mandatory
    return self.world:locationsEntityRegion(self, _region)
end

function CCamera:locationsAround() -- locations in a camera ranges
    return self.world:locationsEntityRangeXY(self, self.rangex, self.rangey)
end


--
-- CEntityDrawable
--
CEntityDrawable = CEntity:extend() -- generic entities with a sprite representation
Classic.KINDENTITYDRAWABLE = "EntityDrawable" -- EntityDrawable kind
Classic.NAMEENTITYDRAWABLE = "EntityDrawable" -- EntityDrawable name
function CEntityDrawable:new(_argt)
    CEntityDrawable.super.new(self, _argt)
    self.classic = CEntityDrawable
    self.kind = Classic.KINDENTITYDRAWABLE
    self.name = Classic.NAMEENTITYDRAWABLE
    self.world        = World
    self.sprite       = CSpriteBG.SPRISMALLMPTY
    self.screenx      = 0 -- screen positions -- used to draw the sprite
    self.screeny      = 0
    self.dirx         = Nums:random01() -- random flip lf/rg
    self.scale        = Tic.SCALE01
    self.rotate       = CSprite.ROTATE000
    self.portraitmode = false -- is for drawing portrait ?
    self.animations   = nil -- override if any
    self.hovered      = false -- use hovered to draw a border
    self.spotted      = false -- use spotted to draw a border
    self.hitbox       = CHitbox{entity = self, lf = 0, rg = 7, up = 0, dw = 7}
    self.drawborders  = false -- draw behaviour
    self.drawhitbox   = false
    self.drawfade     = false
    self.drawbgfg     = Tic.DRAWFG -- use bg/fg palette if any
    self:argt(_argt) -- override if any
    self.world:appendEntity(self)-- append itself to the world
end

function CEntityDrawable:draw() -- default draw for drawable entities -- override if any
    local _tick00      = Tic.TICK00.actvalue

    local _palette     = Tables:merge(self.palette, self.palettefg) -- apply diverse palettes if any
    _palette = (self.drawbgfg == Tic.DRAWBG)
        and Tables:merge(_palette, self.palettebg)
        or  _palette
    _palette = (self.drawfade)
        and Tables:merge(_palette, self.palettefade)
        or  _palette

    for _, _animation in pairs(self.animations or {}) do -- animate
        local _frequence   = _animation.frequence
        local _percent0    = _animation.percent0
        local _palette0    = _animation.palette0
        local _palette1    = _animation.palette1
        local _frequence01 = Nums:frequence01(_tick00, _frequence)
        local _random01    = Nums:random01(_percent0)
        local _palette01   = _frequence01 * _random01 -- palette0 if frequence0 or random0
        _palette = (_palette01 == 0)
            and Tables:merge(_palette, _palette0)
            or  Tables:merge(_palette, _palette1)
    end

    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = self.sprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.rotate  = self.rotate
    _musprite.palette = _palette
    _musprite:draw()

    self:drawSpotted()
    self:drawHovered()
    self:drawBorders()
    self:drawHitbox()
end

function CEntityDrawable:drawSpotted() -- draw spotted if any
    if not self.spotted then return end -- nothing to draw
    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNSPOTSQ
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.scale   = self.scale
    _musprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE,}
    _musprite:draw()
end

function CEntityDrawable:drawHovered() -- draw hovered if any
    if not self.hovered then return end -- nothing to draw
    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNBORDSQ
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.scale   = self.scale
    _musprite.palette = {[Tic.COLORGREYM] = Tic.COLORGREYL,}
    _musprite:draw()
end

function CEntityDrawable:drawBorders() -- draw borders if any
    self.drawborders = Tic.BORDERSDRAW -- use Tic as master
    if not self.drawborders then return end -- nothing to draw
    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNBORDSQ
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.scale   = self.scale
    _musprite.palette = {[Tic.COLORGREYM] = Tic.COLORGREYL,}
    _musprite:draw()
end

function CEntityDrawable:drawHitbox() -- draw hitbox if any
    self.drawhitbox = Tic.HITBOXDRAW -- use Tic as master
    if not self.drawhitbox or not self.hitbox then return end -- nothing to draw
    self.hitbox:draw()
end

function CEntityDrawable:adjustScreenXYRelativeToEntity(_entity) -- adjust an entity screen xy relative to an other one in world positions
    if not _entity then return end -- mandatory
	local _offsetx = self.worldx - _entity.worldx
	local _offsety = self.worldy - _entity.worldy
	self.screenx = Tic.WORLDWX2 + _offsetx - (Tic.SPRITESIZE2 * self.scale)
	self.screeny = Tic.WORLDWY2 + _offsety - (Tic.SPRITESIZE2 * self.scale)
end

function CEntityDrawable:regionWorld() -- return its own region in world
    return CRegion{
        lf = self.worldx,
        rg = self.worldx + (Tic.SPRITESIZE * self.scale) - 1,
        up = self.worldy,
        dw = self.worldy + (Tic.SPRITESIZE * self.scale) - 1, 
    }
end

function CEntityDrawable:regionScreen() -- return its own region in screen
    return CRegion{
        lf = self.screenx,
        rg = self.screenx + (Tic.SPRITESIZE * self.scale) - 1,
        up = self.screeny,
        dw = self.screeny + (Tic.SPRITESIZE * self.scale) - 1, 
    }
end

function CEntityDrawable:hitboxAttachTo(_entities) -- attach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hittoAppend(_entity)
            _entity.hitbox:hitbyAppend(self)
        end
    end
end

function CEntityDrawable:hitboxDetachTo(_entities) -- detach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hittoDelete(_entity)
            _entity.hitbox:hitbyDelete(self)
        end
    end
end

function CEntityDrawable:hitboxDetachBy(_entities) -- detach hitby entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox and _entity.hitbox then
            self.hitbox:hitbyDelete(_entity)
            _entity.hitbox:hittoDelete(self)
        end
    end
end

function CEntityDrawable:hitboxDetachSelf() -- detach itself from hitto entities
    self:hitboxDetachTo({[self] = self})
end

function CEntityDrawable:hitboxDetachAllTo() -- detach all hitto entities
	if not self.hitbox then return end -- nothing to detach
	self:hitboxDetachTo(self.hitbox.hitto)
end

function CEntityDrawable:hitboxDetachAllBy() -- detach all hitby entities
	if not self.hitbox then return end -- nothing to detach
	self:hitboxDetachBy(self.hitbox.hitby)
end

function CEntityDrawable:hitboxDetachAll() -- detach all hitto/hitby entities
	self:hitboxDetachAllTo()
	self:hitboxDetachAllBy()
end

function CEntityDrawable:hitboxRegionWorld() -- hitbox in world -- depends on dirx
	if not self.hitbox then return end -- mandatory
	return self.hitbox:regionAdjusted():offsetXY(self.worldx, self.worldy)
end


--
-- CPlace
--
CPlace = CEntityDrawable:extend() -- places
Classic.KINDPLACE = "Place" -- Place kind
Classic.NAMEPLACE = "Place" -- Place name
CPlace.EMPTY    = Tic.COLORKEY -- anims
CPlace.ANIM01   = Tic.COLORWHITE
CPlace.ANIM02   = Tic.COLORYELLOW
CPlace.ANIM03   = Tic.COLORORANGE
CPlace.ANIM04   = Tic.COLORCYAN
CPlace.ANIM05   = Tic.COLORBLUEL
CPlace.ANIM06   = Tic.COLORBLUEM
CPlace.ANIM07   = Tic.COLORBLUED
CPlace.SMOKE    = CPlace.ANIM01 -- builds
CPlace.WINDOW01 = CPlace.ANIM02
CPlace.WINDOW02 = CPlace.ANIM03
CPlace.ROOF     = Tic.COLORRED
CPlace.DOOR     = Tic.COLORGREYL
CPlace.FACADE   = Tic.COLORGREYM
CPlace.WALLS    = Tic.COLORGREYD
CPlace.FOAM     = Tic.COLORGREEND
CPlace.OWNER    = CPlace.ANIM01 -- stalls
CPlace.WATER01  = CPlace.ANIM02
CPlace.WATER02  = CPlace.ANIM03
CPlace.GOODS01  = CPlace.ANIM02
CPlace.GOODS02  = CPlace.ANIM03
CPlace.NEST     = CPlace.ANIM01 -- trees
CPlace.FLOOR01  = CPlace.ANIM02
CPlace.FLOOR02  = CPlace.ANIM03
CPlace.LEAFSFG  = Tic.COLORGREENM
CPlace.LEAFSBG  = Tic.COLORGREEND
CPlace.TRUNK    = Tic.COLORGREYM
CPlace.BARK     = Tic.COLORGREYD
CPlace.MOON     = CPlace.ANIM01 -- stones
CPlace.STONEFG  = Tic.COLORGREYM
CPlace.STONEBG  = Tic.COLORGREYD
CPlace.MAGIC01  = CPlace.ANIM04 -- magic
CPlace.MAGIC02  = CPlace.ANIM05
CPlace.MAGIC03  = CPlace.ANIM06
CPlace.MAGIC04  = CPlace.ANIM07
CPlace.COLORLIGHT   = Tic.COLORORANGE -- colors
CPlace.COLORGLASS01 = Tic.COLORCYAN
CPlace.COLORGLASS02 = Tic.COLORBLUEL
CPlace.COLORWATER01 = Tic.COLORBLUEL
CPlace.COLORWATER02 = Tic.COLORBLUEM
CPlace.COLORGOODS01 = Tic.COLORGREENM
CPlace.COLORGOODS02 = Tic.COLORGREEND
CPlace.COLORNEST    = Tic.COLORGREYL
CPlace.COLORFLOOR01 = CPlace.LEAFSFG
CPlace.COLORFLOOR02 = CPlace.LEAFSBG
CPlace.COLORMOON    = Tic.COLORGREYL
function CPlace:new(_argt)
    CPlace.super.new(self, _argt)
    self.classic = CPlace
    self.kind = Classic.KINDPLACE
    self.name = Classic.NAMEPLACE
    self:argt(_argt) -- override if any
end


--
-- CPlaceBuild
--
CPlaceBuild = CPlace:extend() -- builds
Classic.KINDPLACEBUILD = "Build" -- Build kind
CPlaceBuild.PALETTEIDLE  = {
    [CPlace.SMOKE]    = CPlace.EMPTY,
    [CPlace.WINDOW01] = CPlace.WALLS,
    [CPlace.WINDOW02] = CPlace.WALLS,
    [CPlace.DOOR]     = CPlace.FACADE,    
    [CPlace.ROOF]     = CPlace.FOAM,    
    [CPlace.FOAM]     = CPlace.FOAM,    
}
CPlaceBuild.PALETTEFADE  = {
    [CPlace.SMOKE]    = CPlace.EMPTY,
    [CPlace.WINDOW01] = CPlace.WALLS,
    [CPlace.WINDOW02] = CPlace.WALLS,
    [CPlace.DOOR]     = CPlace.FACADE,    
    [CPlace.ROOF]     = CPlace.WALLS,
    [CPlace.FOAM]     = CPlace.WALLS,    
}
function CPlaceBuild:new(_argt)
    CPlaceBuild.super.new(self, _argt)
    self.classic = CPlaceBuild
    self.kind = Classic.KINDPLACEBUILD
    self.name = Classic.NAMEANIMED
    self.hitbox      = CHitbox{entity = self, lf = 2, rg = 4, up = 5, dw = 7}
    self.palettefade = CPlaceBuild.PALETTEFADE
    self:argt(_argt) -- override if any
end


--
-- CPlaceHouse
--
CPlaceHouse = CPlaceBuild:extend() -- houses
Classic.KINDPLACEHOUSE = "House" -- House kind
function CPlaceHouse:new(_argt)
    CPlaceHouse.super.new(self, _argt)
    self.classic = CPlaceHouse
    self.kind = Classic.KINDPLACEHOUSE
    self.sprite      = CSpriteBG.PLACEHOUSE
    self:argt(_argt) -- override if any
end

CPlaceHouseAnim = CPlaceHouse:extend() -- anim houses
function CPlaceHouseAnim:new(_argt)
    CPlaceHouseAnim.super.new(self, _argt)
    self.classic = CPlaceHouseAnim
    self.animations = {
        CAnimation{ -- smoke
            frequence = Tic.FREQUENCE0300,
            percent0  = 0.9,
            palette0  = {[CPlace.SMOKE] = CPlace.SMOKE,},
            palette1  = {[CPlace.SMOKE] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceHouseIdle = CPlaceHouse:extend() -- idle houses
function CPlaceHouseIdle:new(_argt)
    CPlaceHouseIdle.super.new(self, _argt)
    self.classic = CPlaceHouseIdle
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceTower
--
CPlaceTower = CPlaceBuild:extend() -- towers
Classic.KINDPLACETOWER = "Tower" -- Tower kind
function CPlaceTower:new(_argt)
    CPlaceTower.super.new(self, _argt)
    self.kind = Classic.KINDPLACETOWER
    self.sprite  = CSpriteBG.PLACETOWER
    self:argt(_argt) -- override if any
end

CPlaceTowerAnim = CPlaceTower:extend() -- anim towers
function CPlaceTowerAnim:new(_argt)
    CPlaceTowerAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceTowerIdle = CPlaceTower:extend() -- idle towers
function CPlaceTowerIdle:new(_argt)
    CPlaceTowerIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceManor
--
CPlaceManor = CPlaceBuild:extend() -- manors
Classic.KINDPLACEMANOR = "Manor" -- Manor kind
function CPlaceManor:new(_argt)
    CPlaceManor.super.new(self, _argt)
    self.kind = Classic.KINDPLACEMANOR
    self.sprite  = CSpriteBG.PLACEMANOR
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceManorAnim = CPlaceManor:extend() -- anim manors
function CPlaceManorAnim:new(_argt)
    CPlaceManorAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- smoke
            frequence = Tic.FREQUENCE0300,
            percent0  = 0.9,
            palette0  = {[CPlace.SMOKE] = CPlace.SMOKE,},
            palette1  = {[CPlace.SMOKE] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.9,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORLIGHT,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.5,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORLIGHT,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceManorIdle = CPlaceManor:extend() -- idle manors
function CPlaceManorIdle:new(_argt)
    CPlaceManorIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceKirke
--
CPlaceKirke = CPlaceBuild:extend() -- kirkes
Classic.KINDPLACEKIRKE = "Kirke" -- Kirke kind
function CPlaceKirke:new(_argt)
    CPlaceKirke.super.new(self, _argt)
    self.kind = Classic.KINDPLACEKIRKE
    self.sprite  = CSpriteBG.PLACEKIRKE
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceKirkeAnim = CPlaceKirke:extend() -- anim kirkes
function CPlaceKirkeAnim:new(_argt)
    CPlaceKirkeAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- window 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.WINDOW01] = CPlace.WALLS,},
            palette1  = {[CPlace.WINDOW01] = CPlace.COLORGLASS01,},
        },
        CAnimation{ -- window 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.WINDOW02] = CPlace.WALLS,},
            palette1  = {[CPlace.WINDOW02] = CPlace.COLORGLASS02,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceKirkeIdle = CPlaceKirke:extend() -- idle kirkes
function CPlaceKirkeIdle:new(_argt)
    CPlaceKirkeIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceWater
--
CPlaceWater = CPlaceBuild:extend() -- waters
Classic.KINDPLACEWATER = "Water" -- Water kind
function CPlaceWater:new(_argt)
    CPlaceWater.super.new(self, _argt)
    self.kind = Classic.KINDPLACEWATER
    self.sprite  = CSpriteBG.PLACEWATER
    self.hitbox  = CHitbox{entity = self, lf = 1, rg = 4, up = 5, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceWaterAnim = CPlaceWater:extend() -- anim waters
function CPlaceWaterAnim:new(_argt)
    CPlaceWaterAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- water 1
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.WATER01] = CPlace.COLORWATER01,},
            palette1  = {[CPlace.WATER01] = CPlace.COLORWATER02,},
        },
        CAnimation{ -- water 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.WATER02] = CPlace.COLORWATER01,},
            palette1  = {[CPlace.WATER02] = CPlace.COLORWATER02,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceWaterIdle = CPlaceWater:extend() -- idle waters
function CPlaceWaterIdle:new(_argt)
    CPlaceWaterIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceStall
--
CPlaceStall = CPlaceBuild:extend() -- stalls
Classic.KINDPLACESTALL = "Stall" -- Stall kind
function CPlaceStall:new(_argt)
    CPlaceStall.super.new(self, _argt)
    self.kind = Classic.KINDPLACESTALL
    self.sprite  = CSpriteBG.PLACESTALL
    self.hitbox  = CHitbox{entity = self, lf = 0, rg = 3, up = 5, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceStallAnim = CPlaceStall:extend() -- anim stalls
function CPlaceStallAnim:new(_argt)
    CPlaceStallAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- owner
            frequence = Tic.FREQUENCE0240,
            percent0  = 0.6,
            palette0  = {[CPlace.OWNER] = Tic.COLORWHITE,},
            palette1  = {[CPlace.OWNER] = Tic.COLORKEY,},
        },
        CAnimation{ -- goods 1
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.GOODS01] = CPlace.COLORGOODS01,},
            palette1  = {[CPlace.GOODS01] = CPlace.COLORGOODS02,},
        },
        CAnimation{ -- goods 2
            frequence = Tic.FREQUENCE0120,
            percent0  = 0.1,
            palette0  = {[CPlace.GOODS02] = CPlace.COLORGOODS01,},
            palette1  = {[CPlace.GOODS02] = CPlace.COLORGOODS02,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceStallIdle = CPlaceStall:extend() -- idle stalls
function CPlaceStallIdle:new(_argt)
    CPlaceStallIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceTrees
--
CPlaceTrees = CPlace:extend() -- trees
Classic.KINDPLACETREES = "Trees" -- Trees kind
CPlaceTrees.PALETTEIDLE   = {
    [CPlace.NEST]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.BARK,
    [CPlace.FLOOR02] = CPlace.BARK,
    [CPlace.LEAFSFG] = CPlace.LEAFSBG,
    [CPlace.LEAFSBG] = CPlace.BARK,
}
CPlaceTrees.PALETTEFADE   = {
    [CPlace.NEST]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.BARK,
    [CPlace.FLOOR02] = CPlace.BARK,
    [CPlace.LEAFSFG] = CPlace.TRUNK,
    [CPlace.LEAFSBG] = CPlace.BARK,    
}
function CPlaceTrees:new(_argt)
    CPlaceTrees.super.new(self, _argt)
    self.kind = Classic.KINDPLACETREES
    self.name = Classic.NAMELIVING
    self.hitbox       = CHitbox{entity = self, lf = 2, rg = 4, up = 6, dw = 7}
    self.palettefade = CPlaceTrees.PALETTEFADE
    self:argt(_argt) -- override if any
end

CPlaceTreesAnim = CPlaceTrees:extend() -- generic anim trees
function CPlaceTreesAnim:new(_argt)
    CPlaceTreesAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- nest
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.NEST] = CPlace.TRUNK,},
            palette1  = {[CPlace.NEST] = CPlace.COLORNEST,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.5,
            palette0  = {[CPlace.FLOOR01] = CPlace.TRUNK,},
            palette1  = {[CPlace.FLOOR01] = CPlace.COLORFLOOR01,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.BARK,},
            palette1  = {[CPlace.FLOOR02] = CPlace.COLORFLOOR02,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceTreesIdle = CPlaceTrees:extend() -- generic idle trees
function CPlaceTreesIdle:new(_argt)
    CPlaceTreesIdle.super.new(self, _argt)
    self.name = Classic.NAMEDYING
    self.palette = CPlaceTrees.PALETTEIDLE
    self:argt(_argt) -- override if any
end

CPlaceTree0Anim = CPlaceTreesAnim:extend() -- anim tree0
function CPlaceTree0Anim:new(_argt)
    CPlaceTree0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt) -- override if any
end

CPlaceTree0Idle = CPlaceTreesIdle:extend() -- idle tree0
function CPlaceTree0Idle:new(_argt)
    CPlaceTree0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt) -- override if any
end

CPlaceTree1Anim = CPlaceTreesAnim:extend() -- anim tree1
function CPlaceTree1Anim:new(_argt)
    CPlaceTree1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt) -- override if any
end

CPlaceTree1Idle = CPlaceTreesIdle:extend() -- idle tree1
function CPlaceTree1Idle:new(_argt)
    CPlaceTree1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt) -- override if any
end


--
-- CPlaceStone
--
CPlaceStone = CPlace:extend() -- stones
Classic.KINDPLACESTONE = "Stone" -- Stone kind
CPlaceStone.PALETTEIDLE   = {
    [CPlace.MOON]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.STONEBG,
    [CPlace.FLOOR02] = CPlace.FOAM,
    [CPlace.DOOR]    = CPlace.STONEFG,    
    [CPlace.FOAM]    = CPlace.FOAM,    
}
CPlaceStone.PALETTEFADE   = {
    [CPlace.MOON]    = CPlace.EMPTY,
    [CPlace.FLOOR01] = CPlace.STONEBG,
    [CPlace.FLOOR02] = CPlace.STONEBG,
    [CPlace.DOOR]    = CPlace.STONEFG,    
    [CPlace.FOAM]    = CPlace.STONEBG,    
}
function CPlaceStone:new(_argt)
    CPlaceStone.super.new(self, _argt)
    self.kind = Classic.KINDPLACESTONE
    self.name = Classic.NAMEFITFUL
    self.hitbox      = CHitbox{entity = self, lf = 2, rg = 4, up = 6, dw = 7}
    self.palettefade = CPlaceStone.PALETTEFADE
    self:argt(_argt) -- override if any
end


--
-- CPlaceMenhr
--
CPlaceMenhr = CPlaceStone:extend() -- menhrs
Classic.KINDPLACEMENHR = "Menhr" -- Menhr kind
function CPlaceMenhr:new(_argt)
    CPlaceMenhr.super.new(self, _argt)
    self.kind = Classic.KINDPLACEMENHR
    self.sprite      = CSpriteBG.PLACEMENHR
    self:argt(_argt) -- override if any
end

CPlaceMenhrAnim = CPlaceMenhr:extend() -- anim menhrs
function CPlaceMenhrAnim:new(_argt)
    CPlaceMenhrAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceMenhrIdle = CPlaceMenhr:extend() -- idle menhrs
function CPlaceMenhrIdle:new(_argt)
    CPlaceMenhrIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt) -- override if any
end

CPlaceMenh0Anim = CPlaceMenhrAnim:extend() -- anim menh0
function CPlaceMenh0Anim:new(_argt)
    CPlaceMenh0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt) -- override if any
end

CPlaceMenh0Idle = CPlaceMenhrIdle:extend() -- idle menh0
function CPlaceMenh0Idle:new(_argt)
    CPlaceMenh0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt) -- override if any
end

CPlaceMenh1Anim = CPlaceMenhrAnim:extend() -- anim menh1
function CPlaceMenh1Anim:new(_argt)
    CPlaceMenh1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt) -- override if any
end

CPlaceMenh1Idle = CPlaceMenhrIdle:extend() -- idle menh1
function CPlaceMenh1Idle:new(_argt)
    CPlaceMenh1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt) -- override if any
end


--
-- CPlaceDolmn
--
CPlaceDolmn = CPlaceStone:extend() -- dolmns
Classic.KINDPLACEDOLMN = "Dolmn" -- Dolmn kind
function CPlaceDolmn:new(_argt)
    CPlaceDolmn.super.new(self, _argt)
    self.kind = Classic.KINDPLACEDOLMN
    self.sprite = CSpriteBG.PLACEDOLMN
    self.hitbox = CHitbox{entity = self, lf = 1, rg = 4, up = 6, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceDolmnAnim = CPlaceDolmn:extend() -- anim dolmns
function CPlaceDolmnAnim:new(_argt)
    CPlaceDolmnAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceDolmnIdle = CPlaceDolmn:extend() -- idle dolmns
function CPlaceDolmnIdle:new(_argt)
    CPlaceDolmnIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt) -- override if any
end

CPlaceDolm0Anim = CPlaceDolmnAnim:extend() -- anim dolm0
function CPlaceDolm0Anim:new(_argt)
    CPlaceDolm0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt) -- override if any
end

CPlaceDolm0Idle = CPlaceDolmnIdle:extend() -- idle dolm0
function CPlaceDolm0Idle:new(_argt)
    CPlaceDolm0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt) -- override if any
end

CPlaceDolm1Anim = CPlaceDolmnAnim:extend() -- anim dolm1
function CPlaceDolm1Anim:new(_argt)
    CPlaceDolm1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt) -- override if any
end

CPlaceDolm1Idle = CPlaceDolmnIdle:extend() -- idle dolm1
function CPlaceDolm1Idle:new(_argt)
    CPlaceDolm1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt) -- override if any
end


--
-- CPlaceCirkl
--
CPlaceCirkl = CPlaceStone:extend() -- cirkls
Classic.KINDPLACECIRKL = "Cirkl" -- Cirkl kind
function CPlaceCirkl:new(_argt)
    CPlaceCirkl.super.new(self, _argt)
    self.kind = Classic.KINDPLACECIRKL
    self.sprite = CSpriteBG.PLACECIRKL
    self.hitbox = CHitbox{entity = self, lf = 3, rg = 4, up = 6, dw = 7}
    self:argt(_argt) -- override if any
end

CPlaceCirklAnim = CPlaceCirkl:extend() -- anim cirkls
function CPlaceCirklAnim:new(_argt)
    CPlaceCirklAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceCirklIdle = CPlaceCirkl:extend() -- idle cirkls
function CPlaceCirklIdle:new(_argt)
    CPlaceCirklIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt) -- override if any
end

CPlaceCirk0Anim = CPlaceCirklAnim:extend() -- anim cirk0
function CPlaceCirk0Anim:new(_argt)
    CPlaceCirk0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt) -- override if any
end

CPlaceCirk0Idle = CPlaceCirklIdle:extend() -- idle cirk0
function CPlaceCirk0Idle:new(_argt)
    CPlaceCirk0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt) -- override if any
end

CPlaceCirk1Anim = CPlaceCirklAnim:extend() -- anim cirk1
function CPlaceCirk1Anim:new(_argt)
    CPlaceCirk1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt) -- override if any
end

CPlaceCirk1Idle = CPlaceCirklIdle:extend() -- idle cirk1
function CPlaceCirk1Idle:new(_argt)
    CPlaceCirk1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt) -- override if any
end


--
-- CPlaceRoads
--
CPlaceRoads = CPlaceStone:extend() -- roads
Classic.KINDPLACEROADS = "Roads" -- Roads kind
function CPlaceRoads:new(_argt)
    CPlaceRoads.super.new(self, _argt)
    self.kind = Classic.KINDPLACEROADS
    self.sprite      = CSpriteBG.PLACEROADS
    self.hitbox = nil
    self:argt(_argt) -- override if any
end

CPlaceRoadsAnim = CPlaceRoads:extend() -- anim roads
function CPlaceRoadsAnim:new(_argt)
    CPlaceRoadsAnim.super.new(self, _argt)
    self.animations = {
        CAnimation{ -- moon
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.9,
            palette0  = {[CPlace.MOON] = CPlace.EMPTY,},
            palette1  = {[CPlace.MOON] = CPlace.COLORMOON,},
        },
        CAnimation{ -- floor 1
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.1,
            palette0  = {[CPlace.FLOOR01] = CPlace.STONEFG,},
            palette1  = {[CPlace.FLOOR01] = CPlace.LEAFSFG,},
        },
        CAnimation{ -- floor 2
            frequence = Tic.FREQUENCE0600,
            percent0  = 0.3,
            palette0  = {[CPlace.FLOOR02] = CPlace.FOAM,},
            palette1  = {[CPlace.FLOOR02] = CPlace.LEAFSFG,},
        },
    }
    self:argt(_argt) -- override if any
end

CPlaceRoadsIdle = CPlaceRoads:extend() -- idle roads
function CPlaceRoadsIdle:new(_argt)
    CPlaceRoadsIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt) -- override if any
end

CPlaceRoad0Anim = CPlaceRoadsAnim:extend() -- anim road0
function CPlaceRoad0Anim:new(_argt)
    CPlaceRoad0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt) -- override if any
end

CPlaceRoad0Idle = CPlaceRoadsIdle:extend() -- idle road0
function CPlaceRoad0Idle:new(_argt)
    CPlaceRoad0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt) -- override if any
end

CPlaceRoad1Anim = CPlaceRoadsAnim:extend() -- anim road1
function CPlaceRoad1Anim:new(_argt)
    CPlaceRoad1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt) -- override if any
end

CPlaceRoad1Idle = CPlaceRoadsIdle:extend() -- idle road1
function CPlaceRoad1Idle:new(_argt)
    CPlaceRoad1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt) -- override if any
end


--
-- CObject
--
CObject = CEntityDrawable:extend() -- generic objects
Classic.KINDOBJECT = "Object" -- Object kind
Classic.NAMEOBJECT = "Object" -- Object name
CObject.HANDLE         = Tic.COLORWHITE
CObject.BORDER         = Tic.COLORGREYD
CObject.INSIDE         = Tic.COLORGREYM
CObject.EFFECT         = Tic.COLORGREYL
CObject.EXTRA1         = Tic.COLORPURPLE
CObject.COLORWOODBG    = Tic.COLORRED -- wood
CObject.COLORWOODFG    = Tic.COLORORANGE
CObject.COLORLEATHERBG = Tic.COLORRED -- leather
CObject.COLORLEATHERFG = Tic.COLORORANGE
CObject.COLORIRONBG    = Tic.COLORGREYM -- iron
CObject.COLORIRONFG    = Tic.COLORGREYL
CObject.COLORONYXBG    = Tic.COLORGREYD -- onyx
CObject.COLORONYXFG    = Tic.COLORGREYM
CObject.COLORAZURBG    = Tic.COLORBLUED -- azur
CObject.COLORAZURFG    = Tic.COLORBLUEM
CObject.COLORFLASKG    = Tic.COLORGREEND -- flask glass
CObject.USEDNONE = "None" -- used levels
CObject.USEDHALF = "Half"
CObject.USEDFULL = "Full"
function CObject:new(_argt)
    CObject.super.new(self, _argt)
    self.kind = Classic.KINDOBJECT
    self.name = Classic.NAMEOBJECT
    self.used      = CObject.USEDNONE -- used level if any
    self.inventory = nil -- can have an inventory if any
    self:argt(_argt) -- override if any
end

function CObject:handleOffsets(_state)
    local _result   = Tables:merge(self.handleoffsets[self.stateshandles[_state].rotate])
    _result.rotate  = self.stateshandles[_state].rotate
    _result.flip    = self.stateshandles[_state].flip
    _result.handlex = (_result.flip == Tic.DIRXLF) -- flip the handlex if any
        and _result.handlex
        or  Tic.SPRITESIZE - 1 - _result.handlex
    return _result
end


--
-- CObjectHand
--
CObjectHand = CObject:extend() -- generic hand (inventory) objects
Classic.KINDOBJECHAND = "ObjectHand" -- ObjectHand kind
Classic.NAMEOBJECHAND = "ObjectHand" -- ObjectHand name
function CObjectHand:new(_argt)
    CObjectHand.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHAND
    self.name = Classic.KINDOBJECHAND
    self.slottype = CSlotHand
    self:argt(_argt) -- override if any
end

CObjectHandAny = CObjectHand:extend() -- generic hand (inventory any) objects
Classic.KINDOBJECHANDANY = "ObjectHandAny" -- ObjectHandAny kind
Classic.NAMEOBJECHANDANY = "ObjectHandAny" -- ObjectHandAny name
function CObjectHandAny:new(_argt)
    CObjectHandAny.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHANDANY
    self.name = Classic.NAMEOBJECHANDANY
    self.inventorytype = CInventoryAny
    self:argt(_argt) -- override if any
end

CObjectHandPhy = CObjectHand:extend() -- generic hand (inventory phy) objects
Classic.KINDOBJECHANDPHY = "ObjectHandPhy" -- ObjectHandPhy kind
Classic.NAMEOBJECHANDPHY = "ObjectHandPhy" -- ObjectHandPhy name
function CObjectHandPhy:new(_argt)
    CObjectHandPhy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHANDPHY
    self.name = Classic.NAMEOBJECHANDPHY
    self.inventorytype = CInventoryPhy
    self:argt(_argt) -- override if any
end

CObjectHandMen = CObjectHand:extend() -- generic hand (inventory men) objects
Classic.KINDOBJECHANDMEN = "ObjectHandMen" -- ObjectHandMen kind
Classic.NAMEOBJECHANDMEN = "ObjectHandMen" -- ObjectHandMen name
function CObjectHandMen:new(_argt)
    CObjectHandMen.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHANDMEN
    self.name = Classic.NAMEOBJECHANDMEN
    self.inventorytype = CInventoryMen
    self:argt(_argt) -- override if any
end

CObjectHandPsy = CObjectHand:extend() -- generic hand (inventory psy) objects
Classic.KINDOBJECHANDPSY = "ObjectHandPsy" -- ObjectHandPsy kind
Classic.NAMEOBJECHANDPSY = "ObjectHandPsy" -- ObjectHandPsy name
function CObjectHandPsy:new(_argt)
    CObjectHandPsy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHANDPSY
    self.name = Classic.NAMEOBJECHANDPSY
    self.inventorytype = CInventoryPsy
    self:argt(_argt) -- override if any
end


--
-- CWeapon
--
CWeapon = CObjectHandPhy:extend() -- weapons
Classic.KINDWEAPON = "Weapon" -- Weapon kind
Classic.NAMEWEAPON = "Weapon" -- Weapon name
function CWeapon:new(_argt)
    CWeapon.super.new(self, _argt)
    self.kind = Classic.KINDWEAPON
    self.name = Classic.NAMEWEAPON
    self:argt(_argt) -- override if any
end


--
-- CWeaponMelee
--
CWeaponMelee = CWeapon:extend() -- Melee weapons
Classic.KINDDWEAPONMELEE = "Melee" -- Melee kind
Classic.NAMEDWEAPONMELEE = "Melee" -- Melee name
function CWeaponMelee:new(_argt)
    CWeaponMelee.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONMELEE
    self.name = Classic.NAMEDWEAPONMELEE
    self.sprite  = CSpriteFG.WEAPONMELEE
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 5},
        [CSprite.ROTATE090] = {handlex = 2, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 2},
        [CSprite.ROTATE270] = {handlex = 5, handley = 4},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    }
    self:argt(_argt) -- override if any
end

CWeaponSword = CWeaponMelee:extend() -- Sword weapons
Classic.KINDDWEAPONSWORD = "Sword" -- Sword kind
Classic.NAMEDWEAPONSWORD = "Sword" -- Sword name
function CWeaponSword:new(_argt)
    CWeaponSword.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSWORD
    self.name = Classic.NAMEDWEAPONSWORD
    self.sprite  = CSpriteFG.WEAPONMSWRD
    self:argt(_argt) -- override if any
end

CWeaponHammer = CWeaponMelee:extend() -- Hammer weapons
Classic.KINDDWEAPONHAMMR= "Hammer" -- Hammer kind
Classic.NAMEDWEAPONHAMMR= "Hammer" -- Hammer name
function CWeaponHammer:new(_argt)
    CWeaponHammer.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONHAMMR
    self.name = Classic.NAMEDWEAPONHAMMR
    self.sprite  = CSpriteFG.WEAPONMHAMR
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 5},
        [CSprite.ROTATE090] = {handlex = 2, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 2},
        [CSprite.ROTATE270] = {handlex = 5, handley = 3},
    }
    self:argt(_argt) -- override if any
end

CWeaponLance = CWeaponMelee:extend() -- Lance weapons
Classic.KINDDWEAPONLANCE = "Lance" -- Lance kind
Classic.NAMEDWEAPONLANCE = "Lance" -- Lance name
function CWeaponLance:new(_argt)
    CWeaponLance.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONLANCE
    self.name = Classic.NAMEDWEAPONLANCE
    self.sprite  = CSpriteFG.WEAPONMLNCE
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODFG,
        [CObject.INSIDE] = CObject.COLORIRONBG,
        [CObject.EFFECT] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
    }
    self:argt(_argt) -- override if any
end


--
-- CWeaponRange
--
CWeaponRange = CWeapon:extend() -- Range weapons
Classic.KINDDWEAPONRANGE = "Range" -- Range kind
Classic.NAMEDWEAPONRANGE = "Range" -- Range name
function CWeaponRange:new(_argt)
    CWeaponRange.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONRANGE
    self.name = Classic.NAMEDWEAPONRANGE
    self.sprite  = CSpriteFG.WEAPONRANGE
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 3},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODFG,
        [CObject.INSIDE] = CObject.COLORIRONBG,
        [CObject.EFFECT] = CObject.COLORIRONFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORWOODBG,
        [CObject.INSIDE] = CObject.COLORONYXBG,
        [CObject.EFFECT] = CObject.COLORONYXFG,
    }
    self:argt(_argt) -- override if any
end

CWeaponBowSmall = CWeaponRange:extend() -- BowSmall weapons
Classic.KINDDWEAPONBOWSMALL = "Bow.S" -- BowSmall kind
Classic.NAMEDWEAPONBOWSMALL = "Bow.S" -- BowSmall name
function CWeaponBowSmall:new(_argt)
    CWeaponBowSmall.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWSMALL
    self.name = Classic.NAMEDWEAPONBOWSMALL
    self.sprite  = CSpriteFG.WEAPONRBOWS
    self:argt(_argt) -- override if any
end

CWeaponBowMedium = CWeaponRange:extend() -- BowMedium weapons
Classic.KINDDWEAPONBOWMEDIUM = "Bow.M" -- BowMedium kind
Classic.NAMEDWEAPONBOWMEDIUM = "Bow.M" -- BowMedium name
function CWeaponBowMedium:new(_argt)
    CWeaponBowMedium.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWMEDIUM
    self.name = Classic.NAMEDWEAPONBOWMEDIUM
    self.sprite  = CSpriteFG.WEAPONRBOWM
    self:argt(_argt) -- override if any
end

CWeaponBowLarge = CWeaponRange:extend() -- BowLarge weapons
Classic.KINDDWEAPONBOWLARGE = "Bow.L" -- BowLarge kind
Classic.NAMEDWEAPONBOWLARGE = "Bow.L" -- BowLarge name
function CWeaponBowLarge:new(_argt)
    CWeaponBowLarge.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONBOWLARGE
    self.name = Classic.NAMEDWEAPONBOWLARGE
    self.sprite  = CSpriteFG.WEAPONRBOWL
    self:argt(_argt) -- override if any
end


--
-- CWeaponShield
--
CWeaponShield = CWeapon:extend() -- Shield weapons
Classic.KINDDWEAPONSHIELD = "Shield" -- Shield kind
Classic.NAMEDWEAPONSHIELD = "Shield" -- Shield name
function CWeaponShield:new(_argt)
    CWeaponShield.super.new(self, _argt)
    self.kind = Classic.KINDDWEAPONSHIELD
    self.name = Classic.NAMEDWEAPONSHIELD
    self.sprite  = CSpriteFG.WEAPONSHLDB
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 4},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONFG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    }
    self:argt(_argt) -- override if any
end

CWeaponShieldSmall = CWeaponShield:extend() -- ShieldSmall weapons
Classic.KINDWEAPONSHIELDSMALL = "Ecu.S" -- ShieldSmall kind
Classic.NAMEWEAPONSHIELDSMALL = "Ecu.S" -- ShieldSmall name
function CWeaponShieldSmall:new(_argt)
    CWeaponShieldSmall.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDSMALL
    self.name = Classic.KINDWEAPONSHIELDSMALL
    self.sprite = CSpriteFG.WEAPONSHLDS
    self:argt(_argt) -- override if any
end

CWeaponShieldMedium = CWeaponShield:extend() -- ShieldMedium weapons
Classic.KINDWEAPONSHIELDMEDIUM= "Ecu.M" -- ShieldMedium kind
Classic.NAMEWEAPONSHIELDMEDIUM= "Ecu.M" -- ShieldMedium name
function CWeaponShieldMedium:new(_argt)
    CWeaponShieldMedium.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDMEDIUM
    self.name = Classic.NAMEWEAPONSHIELDMEDIUM
    self.sprite = CSpriteFG.WEAPONSHLDM
    self:argt(_argt) -- override if any
end

CWeaponShieldLarge = CWeaponShield:extend() -- ShieldLarge weapons
Classic.KINDWEAPONSHIELDLARGE= "Ecu.L" -- ShieldLarge kind
Classic.NAMEWEAPONSHIELDLARGE= "Ecu.L" -- ShieldLarge name
function CWeaponShieldLarge:new(_argt)
    CWeaponShieldLarge.super.new(self, _argt)
    self.kind = Classic.KINDWEAPONSHIELDLARGE
    self.name = Classic.NAMEWEAPONSHIELDLARGE
    self.sprite = CSpriteFG.WEAPONSHLDL
    self:argt(_argt) -- override if any
end


--
-- CObjectFlask
--
CObjectFlask = CObjectHandMen:extend() -- Flask objects
Classic.KINDDOBJECTFLASK = "Flask" -- Flask kind
Classic.NAMEDOBJECTFLASK = "Flask" -- Flask name
function CObjectFlask:new(_argt)
    CObjectFlask.super.new(self, _argt)
    self.kind = Classic.KINDDOBJECTFLASK
    self.name = Classic.NAMEDOBJECTFLASK
    self.sprite  = CSpriteFG.OBJECTFLASB
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE270, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 3, handley = 1},
        [CSprite.ROTATE090] = {handlex = 6, handley = 3},
        [CSprite.ROTATE180] = {handlex = 4, handley = 6},
        [CSprite.ROTATE270] = {handlex = 1, handley = 4},
    }
    self.palettefg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORFLASKG,
        [CObject.INSIDE] = CObject.COLORWOODFG,
        [CObject.EFFECT] = CObject.COLORWOODFG,
    }
    self.palettebg = {
        [CObject.HANDLE] = CObject.HANDLE,
        [CObject.BORDER] = CObject.COLORFLASKG,
        [CObject.INSIDE] = CObject.COLORWOODBG,
        [CObject.EFFECT] = CObject.COLORWOODBG,
    }
    self:argt(_argt) -- override if any
end

function CObjectFlask:draw()
    self:save()
    if self.used == CObject.USEDHALF then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
    elseif self.used == CObject.USEDFULL then
        self.palettefg[CObject.EFFECT] = Tic.COLORKEY
        self.palettebg[CObject.EFFECT] = Tic.COLORKEY
        self.palettefg[CObject.INSIDE] = Tic.COLORKEY
        self.palettebg[CObject.INSIDE] = Tic.COLORKEY
    end
    CObjectFlask.super.draw(self)
    self:load()
end

CObjectFlaskSmall = CObjectFlask:extend() -- FlaskSmall objects
Classic.KINDOBJECTFLASKSMALL = "Oil.S" -- FlaskSmall kind
Classic.NAMEOBJECTFLASKSMALL = "Oil.S" -- FlaskSmall name
function CObjectFlaskSmall:new(_argt)
    CObjectFlaskSmall.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKSMALL
    self.name = Classic.NAMEOBJECTFLASKSMALL
    self.sprite  = CSpriteFG.OBJECTFLASS
    self:argt(_argt) -- override if any
end

CObjectFlaskMedium = CObjectFlask:extend() -- FlaskMedium objects
Classic.KINDOBJECTFLASKMEDIUM = "Oil.M" -- FlaskMedium kind
Classic.NAMEOBJECTFLASKMEDIUM = "Oil.M" -- FlaskMedium name
function CObjectFlaskMedium:new(_argt)
    CObjectFlaskMedium.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKMEDIUM
    self.name = Classic.NAMEOBJECTFLASKMEDIUM
    self.sprite  = CSpriteFG.OBJECTFLASM
    self:argt(_argt) -- override if any
end

CObjectFlaskLarge = CObjectFlask:extend() -- FlaskLarge objects
Classic.KINDOBJECTFLASKLARGE = "Oil.L" -- FlaskLarge kind
Classic.NAMEOBJECTFLASKLARGE = "Oil.L" -- FlaskLarge name
function CObjectFlaskLarge:new(_argt)
    CObjectFlaskLarge.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTFLASKLARGE
    self.name = Classic.NAMEOBJECTFLASKLARGE
    self.sprite  = CSpriteFG.OBJECTFLASL
    self:argt(_argt) -- override if any
end


--
-- CObjectHead
--
CObjectHead = CObject:extend() -- generic head (inventory) objects
Classic.KINDOBJECTHEAD = "ObjectHead" -- ObjectHead kind
Classic.NAMEOBJECTHEAD = "ObjectHead" -- ObjectHead name
function CObjectHead:new(_argt)
    CObjectHead.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTHEAD
    self.name = Classic.NAMEOBJECTHEAD
    self.slottype = CSlotHead
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE090, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE090, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 4, handley = 4},
        [CSprite.ROTATE090] = {handlex = 3, handley = 4},
        [CSprite.ROTATE180] = {handlex = 3, handley = 3},
        [CSprite.ROTATE270] = {handlex = 4, handley = 3},
    }
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORLEATHERBG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
    }
    self:argt(_argt) -- override if any
end

CObjectHeadAny = CObjectHead:extend() -- generic head (inventory any) objects
Classic.KINDOBJECHEADANY = "ObjectHeadAny" -- ObjectHeadAny kind
Classic.NAMEOBJECHEADANY = "ObjectHeadAny" -- ObjectHeadAny name
function CObjectHeadAny:new(_argt)
    CObjectHeadAny.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHEADANY
    self.name = Classic.NAMEOBJECHEADANY
    self.inventorytype = CInventoryAny
    self:argt(_argt) -- override if any
end

CObjectHeadPhy = CObjectHead:extend() -- generic head (inventory phy) objects
Classic.KINDOBJECHEADPHY = "ObjectHeadPhy" -- ObjectHeadPhy kind
Classic.NAMEOBJECHEADPHY = "ObjectHeadPhy" -- ObjectHeadPhy name
function CObjectHeadPhy:new(_argt)
    CObjectHeadPhy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHEADPHY
    self.name = Classic.NAMEOBJECHEADPHY
    self.inventorytype = CInventoryPhy
    self:argt(_argt) -- override if any
end

CObjectHeadMen = CObjectHead:extend() -- generic head (inventory men) objects
Classic.KINDOBJECHEADMEN = "ObjectHeadMen" -- ObjectHeadMen kind
Classic.NAMEOBJECHEADMEN = "ObjectHeadMen" -- ObjectHeadMen name
function CObjectHeadMen:new(_argt)
    CObjectHeadMen.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHEADMEN
    self.name = Classic.NAMEOBJECHEADMEN
    self.inventorytype = CInventoryMen
    self:argt(_argt) -- override if any
end

CObjectHeadPsy = CObjectHead:extend() -- generic head (inventory psy) objects
Classic.KINDOBJECHEADPSY = "ObjectHeadPsy" -- ObjectHeadPsy kind
Classic.NAMEOBJECHEADPSY = "ObjectHeadPsy" -- ObjectHeadPsy name
function CObjectHeadPsy:new(_argt)
    CObjectHeadPsy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECHEADPSY
    self.name = Classic.NAMEOBJECHEADPSY
    self.inventorytype = CInventoryPsy
    self:argt(_argt) -- override if any
end

CClothesHat = CObjectHeadPhy:extend() -- Hat objects
Classic.KINDCLOTHESHAT = "Hat" -- ClothesHat kind
Classic.NAMECLOTHESHAT = "Hat" -- ClothesHat name
function CClothesHat:new(_argt)
    CClothesHat.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHAT
    self.name = Classic.NAMECLOTHESHAT
    self.sprite = CSpriteFG.CLOTHESHATB
    self:argt(_argt) -- override if any
end

CClothesHatSmall = CClothesHat:extend() -- HatSmall objects
Classic.KINDCLOTHESHATSMALL = "Hat.S" -- ClothesHatSmall kind
Classic.NAMECLOTHESHATSMALL = "Hat.S" -- ClothesHatSmall name
function CClothesHatSmall:new(_argt)
    CClothesHatSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATSMALL
    self.name = Classic.NAMECLOTHESHATSMALL
    self.sprite = CSpriteFG.CLOTHESHATS
    self:argt(_argt) -- override if any
end

CClothesHatMedium = CClothesHat:extend() -- HatMedium objects
Classic.KINDCLOTHESHATMEDIUM = "Hat.M" -- ClothesHatMedium kind
Classic.NAMECLOTHESHATMEDIUM = "Hat.M" -- ClothesHatMedium name
function CClothesHatMedium:new(_argt)
    CClothesHatMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATMEDIUM
    self.name = Classic.NAMECLOTHESHATMEDIUM
    self.sprite = CSpriteFG.CLOTHESHATM
    self:argt(_argt) -- override if any
end

CClothesHatLarge = CClothesHat:extend() -- HatLarge objects
Classic.KINDCLOTHESHATLARGE = "Hat.L" -- ClothesHatLarge kind
Classic.NAMECLOTHESHATLARGE = "Hat.L" -- ClothesHatLarge name
function CClothesHatLarge:new(_argt)
    CClothesHatLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHATLARGE
    self.name = Classic.NAMECLOTHESHATLARGE
    self.sprite = CSpriteFG.CLOTHESHATL
    self:argt(_argt) -- override if any
end

CClothesHelmet = CObjectHeadPhy:extend() -- Helmet objects
Classic.KINDCLOTHESHELMET = "Helmet" -- ClothesHelmet kind
Classic.NAMECLOTHESHELMET = "Helmet" -- ClothesHelmet name
function CClothesHelmet:new(_argt)
    CClothesHelmet.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMET
    self.name = Classic.NAMECLOTHESHELMET
    self.sprite = CSpriteFG.CLOTHESHLMB
    self.palettefg = {
        [CObject.HANDLE] = CObject.COLORLEATHERFG,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERFG,
    }
    self:argt(_argt) -- override if any
end

CClothesHelmetSmall = CClothesHelmet:extend() -- HelmetSmall objects
Classic.KINDCLOTHESHELMETSMALL = "Helm.S" -- ClothesHelmetSmall kind
Classic.NAMECLOTHESHELMETSMALL = "Helm.S" -- ClothesHelmetSmall name
function CClothesHelmetSmall:new(_argt)
    CClothesHelmetSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETSMALL
    self.name = Classic.NAMECLOTHESHELMETSMALL
    self.sprite = CSpriteFG.CLOTHESHLMS
    self:argt(_argt) -- override if any
end

CClothesHelmetMedium = CClothesHelmet:extend() -- HelmetMedium objects
Classic.KINDCLOTHESHELMETMEDIUM = "Helm.M" -- ClothesHelmetMedium kind
Classic.NAMECLOTHESHELMETMEDIUM = "Helm.M" -- ClothesHelmetMedium name
function CClothesHelmetMedium:new(_argt)
    CClothesHelmetMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETMEDIUM
    self.name = Classic.NAMECLOTHESHELMETMEDIUM
    self.sprite = CSpriteFG.CLOTHESHLMM
    self:argt(_argt) -- override if any
end

CClothesHelmetLarge = CClothesHelmet:extend() -- HelmetLarge objects
Classic.KINDCLOTHESHELMETLARGE = "Helm.L" -- ClothesHelmetLarge kind
Classic.NAMECLOTHESHELMETLARGE = "Helm.L" -- ClothesHelmetLarge name
function CClothesHelmetLarge:new(_argt)
    CClothesHelmetLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESHELMETLARGE
    self.name = Classic.NAMECLOTHESHELMETLARGE
    self.sprite = CSpriteFG.CLOTHESHLML
    self:argt(_argt) -- override if any
end


--
-- CObjectBack
--
CObjectBack = CObject:extend() -- generic back (inventory) objects
Classic.KINDOBJECTBACK = "ObjectBack" -- ObjectBack kind
Classic.NAMEOBJECTBACK = "ObjectBack" -- ObjectBack name
function CObjectBack:new(_argt)
    CObjectBack.super.new(self, _argt)
    self.kind = Classic.KINDOBJECTBACK
    self.name = Classic.NAMEOBJECTBACK
    self.slottype = CSlotBack
    self.stateshandles = {
        [Tic.STATEIDLELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEIDLERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEMOVELF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEMOVERG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEWORKLF]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEWORKRG]  = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
        [Tic.STATEFLOORLF] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXLF},
        [Tic.STATEFLOORRG] = {rotate = CSprite.ROTATE000, flip = Tic.DIRXRG},
    }
    self.handleoffsets = {
        [CSprite.ROTATE000] = {handlex = 1, handley = 3},
        [CSprite.ROTATE090] = {handlex = 4, handley = 1},
        [CSprite.ROTATE180] = {handlex = 6, handley = 4},
        [CSprite.ROTATE270] = {handlex = 3, handley = 6},
    }
    self.palettefg = {
        [CObject.HANDLE] = Tic.COLORKEY,
        [CObject.BORDER] = CObject.COLORIRONBG,
        [CObject.INSIDE] = CObject.COLORLEATHERFG,
        [CObject.EFFECT] = CObject.COLORLEATHERBG,
        [CObject.EXTRA1] = CObject.COLORLEATHERBG,
    }
    self:argt(_argt) -- override if any
end

CObjectBackAny = CObjectBack:extend() -- generic back (inventory any) objects
Classic.KINDOBJECBACKANY = "ObjectBackAny" -- ObjectBackAny kind
Classic.NAMEOBJECBACKANY = "ObjectBackAny" -- ObjectBackAny name
function CObjectBackAny:new(_argt)
    CObjectBackAny.super.new(self, _argt)
    self.kind = Classic.KINDOBJECBACKANY
    self.name = Classic.NAMEOBJECBACKANY
    self.inventorytype = CInventoryAny
    self:argt(_argt) -- override if any
end

CObjectBackPhy = CObjectBack:extend() -- generic back (inventory phy) objects
Classic.KINDOBJECBACKPHY = "ObjectBackPhy" -- ObjectBackPhy kind
Classic.NAMEOBJECBACKPHY = "ObjectBackPhy" -- ObjectBackPhy name
function CObjectBackPhy:new(_argt)
    CObjectBackPhy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECBACKPHY
    self.name = Classic.NAMEOBJECBACKPHY
    self.inventorytype = CInventoryPhy
    self:argt(_argt) -- override if any
end

CObjectBackMen = CObjectBack:extend() -- generic back (inventory men) objects
Classic.KINDOBJECBACKMEN = "ObjectBackMen" -- ObjectBackMen kind
Classic.NAMEOBJECBACKMEN = "ObjectBackMen" -- ObjectBackMen name
function CObjectBackMen:new(_argt)
    CObjectBackMen.super.new(self, _argt)
    self.kind = Classic.KINDOBJECBACKMEN
    self.name = Classic.NAMEOBJECBACKMEN
    self.inventorytype = CInventoryMen
    self:argt(_argt) -- override if any
end

CObjectBackPsy = CObjectBack:extend() -- generic back (inventory psy) objects
Classic.KINDOBJECBACKPSY = "ObjectBackPsy" -- ObjectBackPsy kind
Classic.NAMEOBJECBACKPSY = "ObjectBackPsy" -- ObjectBackPsy name
function CObjectBackPsy:new(_argt)
    CObjectBackPsy.super.new(self, _argt)
    self.kind = Classic.KINDOBJECBACKPSY
    self.name = Classic.NAMEOBJECBACKPSY
    self.inventorytype = CInventoryPsy
    self:argt(_argt) -- override if any
end

CClothesBackPack = CObjectBackPhy:extend() -- BackPack objects
Classic.KINDCLOTHESBACKPACK = "Bag" -- ClothesBackPack kind
Classic.NAMECLOTHESBACKPACK = "Bag" -- ClothesBackPack name
function CClothesBackPack:new(_argt)
    CClothesBackPack.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACK
    self.name = Classic.NAMECLOTHESBACKPACK
    self.sprite    = CSpriteFG.CLOTHESBKPB
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesBackPackSmall = CClothesBackPack:extend() -- BackPackSmall objects
Classic.KINDCLOTHESBACKPACKSMALL = "Bag.S" -- ClothesBackPackSmall kind
Classic.NAMECLOTHESBACKPACKSMALL = "Bag.S" -- ClothesBackPackSmall name
function CClothesBackPackSmall:new(_argt)
    CClothesBackPackSmall.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKSMALL
    self.name = Classic.NAMECLOTHESBACKPACKSMALL
    self.sprite    = CSpriteFG.CLOTHESBKPS
    self.inventory = CInventoryAny2{}
    self:argt(_argt) -- override if any
end

CClothesBackPackMedium = CClothesBackPack:extend() -- BackPackMedium objects
Classic.KINDCLOTHESBACKPACKMEDIUM = "Bag.M" -- ClothesBackPackMedium kind
Classic.NAMECLOTHESBACKPACKMEDIUM = "Bag.M" -- ClothesBackPackMedium name
function CClothesBackPackMedium:new(_argt)
    CClothesBackPackMedium.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKMEDIUM
    self.name = Classic.NAMECLOTHESBACKPACKMEDIUM
    self.sprite    = CSpriteFG.CLOTHESBKPM
    self.inventory = CInventoryAny4{}
    self:argt(_argt) -- override if any
end

CClothesBackPackLarge = CClothesBackPack:extend() -- BackPackLarge objects
Classic.KINDCLOTHESBACKPACKLARGE = "Bag.L" -- ClothesBackPackLarge kind
Classic.NAMECLOTHESBACKPACKLARGE = "Bag.L" -- ClothesBackPackLarge name
function CClothesBackPackLarge:new(_argt)
    CClothesBackPackLarge.super.new(self, _argt)
    self.kind = Classic.KINDCLOTHESBACKPACKLARGE
    self.name = Classic.NAMECLOTHESBACKPACKLARGE
    self.sprite    = CSpriteFG.CLOTHESBKPL
    self.inventory = CInventoryAny6{}
    self:argt(_argt) -- override if any
end


--
-- CCharacter
--
CCharacter = CEntityDrawable:extend() -- characters
Classic.KINDCHARACTER = "Character" -- Character kind
Classic.NAMECHARACTER = "Character" -- Character name
Tic.STATESETTINGS = { -- states settings
    [Tic.STATESTANDIDLE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATESTANDWORK] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATESTANDMOVE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELIDLE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELWORK] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELMOVE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEFLOORSLEEP] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSLEEP,
        frequence = Tic.FREQUENCE0090,
    },
    [Tic.STATEFLOORBLEED] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBLEED,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORMAGIC] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSMAGIC,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORALCHE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSALCHE,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORKNOCK] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSKNOCK,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORFLAME] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSFLAME,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORWATER] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSWATER,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORSTONE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSTONE,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORBREEZ] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBREEZ,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORDEATH] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSDEATH,
        frequence = Tic.FREQUENCE0120,
    },
}
Tic.POSTURESETTINGS = { -- postures settings
    [Tic.POSTURESTAND] = {
        bodyspriteoffset = 0,
        bodyoffsetx = 0,
        bodyoffsety = 0,
        headoffsetx = 0,
        headoffsety = 0,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREKNEEL] = {
        bodyspriteoffset = 4,
        bodyoffsetx = 0,
        bodyoffsety = 0,
        headoffsetx = 0,
        headoffsety = 1,
        headusesize = true,
        rotate = CSprite.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREFLOOR] = {
        bodyspriteoffset = 0,
        bodyoffsetx = nil, -- nil use size
        bodyoffsety = 2,
        headoffsetx = 0,
        headoffsety = 2,
        headusesize = false,
        rotate = CSprite.ROTATE090,
        frame = CSprite.FRAME01, -- fix frame
    },
}
Tic.STATUSSETTINGS = { -- statuses settings
    [Tic.STATUSIDLE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSWORK] = {
        bodyspriteoffset = 1,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSMOVE] = {
        bodyspriteoffset = 2,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSSLEEP] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTSLEEP,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSBLEED] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORPURPLE, [Tic.COLORGREYL] = Tic.COLORRED,},
    },
    [Tic.STATUSMAGIC] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORBLUEM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORBLUEM, [Tic.COLORGREYL] = Tic.COLORCYAN,},
    },
    [Tic.STATUSALCHE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREENL, [Tic.COLORGREYL] = Tic.COLORGREENM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREENM, [Tic.COLORGREYL] = Tic.COLORGREENL,},
    },
    [Tic.STATUSKNOCK] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSFLAME] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORORANGE, [Tic.COLORGREYL] = Tic.COLORRED,    [Tic.COLORGREYM] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORORANGE, [Tic.COLORGREYM] = Tic.COLORPURPLE,},
    },
    [Tic.STATUSWATER] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORCYAN,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORWHITE,}
    },
    [Tic.STATUSSTONE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREYM, [Tic.COLORGREYL] = Tic.COLORGREYD,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYD, [Tic.COLORGREYL] = Tic.COLORGREYM,},
    },
    [Tic.STATUSBREEZ] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSDEATH] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTDEATH,
        palette0 = {[Tic.COLORRED] = Tic.COLORRED,    [Tic.COLORPURPLE] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORRED] = Tic.COLORPURPLE, [Tic.COLORPURPLE] = Tic.COLORRED,},
     },
}
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.classic = CCharacter -- instance of
    self.kind    = Classic.KINDCHARACTER
    self.name    = Classic.NAMECHARACTER
    self.size         = Tic.SIZEM -- size
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.direction    = Tic.DIR270
    self.state        = Tic.STATESTANDIDLE -- state
    self.movecycler   = CCyclerInt{maxindex = 59}  -- cycler to get back to idle after move
    self.workcycler   = CCyclerInt{maxindex = 179} -- cycler to animate work
    self.idlecycler   = CCyclerInt{maxindex = 179} -- cycler to activate idle animation
    self.hitbox       = CHitbox{entity = self, lf = 2, rg = 4, up = 5, dw = 7}
    self.hovering     = nil -- hovering entity if any
    self.spotting     = nil -- spotting entity if any
    self.spottingspot = false -- spot its spotting
    self.spottinglock = false -- lock its spotting
    self.spottingpick = false -- pick its spotting
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
    self.headsprite   = CSpriteFG.HEADELVWE -- head
    self.eyessprite   = CSpriteFG.EYESHUMAN -- eyes
    self.statphymax   = 5 -- max stats -- 0-Tic.STATSMAX
    self.statmenmax   = 5
    self.statpsymax   = 5
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self.drawdirs     = false -- draw behaviour
    self.drawview     = false
    self.drawmind     = false
    self.drawmove     = false
    self.slots        = { -- character objects slots
                         exists = true, -- to check if already implemented
                         head = CSlotHead{},
                         back = CSlotBack{},
                         handlf = CSlotHand{},
                         handrg = CSlotHand{},
    }
    self.inventories  = { -- character standard inventories
                         exists = true, -- to check if already implemented
                         phy = CInventoryPhy{},
                         men = CInventoryMen{},
                         psy = CInventoryPsy{},
                         any = CInventoryAny{},
                        }
    self:argt(_argt) -- override if any
    self.camera       = CCamera{name = self.name.." "..Classic.NAMECAMERA} -- one camera per character
    self:focus() -- focus its camera on itself
end

function CCharacter:argt(_argt)
    CCharacter.super.argt(self, _argt)
    if self.classic and self.classed and not (self.classic == self.classed) then return end -- limit to one classic ?
   self:adjustInventoriesSlots() -- adjust standard inventories sizes and contents + slots
end

function CCharacter:adjustInventoriesSlots()
    if not self.inventories then return end -- mandatory (argt)
    if not self.inventories.exists then return end -- ensure we already have inventories

    local _inventoryany = self.inventories.any -- grab all objects
    local _inventoryphy = self.inventories.phy
    local _inventorymen = self.inventories.men
    local _inventorypsy = self.inventories.psy
    for _, _slot in pairs(self.slots or {}) do
        if CSlot:isSlot(_slot) then
            _inventoryany:appendObject(_slot.object)
            if not _slot:canSlotObject(_slot.object) then -- keep only if allowed
                _slot.object = nil
            end
        end
    end
    _inventoryphy:movetoInventory(_inventoryany)
    _inventorymen:movetoInventory(_inventoryany)
    _inventorypsy:movetoInventory(_inventoryany)

    for _, _object in ipairs(_inventoryany.objects) do -- delete from the world
        self.world:deleteEntity(_object)
    end

    _inventoryphy.objectsmax = self.statphymax -- adjust inventories limits
    _inventorymen.objectsmax = self.statmenmax
    _inventorypsy.objectsmax = self.statpsymax

    _inventoryany:movetoInventory(_inventoryphy) -- redispatch objects if possible
    _inventoryany:movetoInventory(_inventorymen)
    _inventoryany:movetoInventory(_inventorypsy)

    for _, _slot in pairs(self.slots or {}) do -- check if objects in slots are still available
        if CSlot:isSlot(_slot) then
            if Tables:valFind(_inventoryany.objects, _slot.object) then _slot.object = nil end
        end
    end

    _inventoryany.objects = {} -- get rid of extra objects
end

function CCharacter:colorPhyAct()
    if self.statphyact == 0              then return Tic.COLORSTAT0 end
    if self.statphyact > self.statphymax then return Tic.COLORPHYGT end
    if self.statphyact < self.statphymax then return Tic.COLORPHYLT end
    return Tic.COLORPHYEQ
end

function CCharacter:colorMenAct()
    if self.statmenact == 0              then return Tic.COLORSTAT0 end
    if self.statmenact > self.statmenmax then return Tic.COLORMENGT end
    if self.statmenact < self.statmenmax then return Tic.COLORMENLT end
    return Tic.COLORMENEQ
end

function CCharacter:colorPsyAct()
    if self.statpsyact == 0              then return Tic.COLORSTAT0 end
    if self.statpsyact > self.statpsymax then return Tic.COLORPSYGT end
    if self.statpsyact < self.statpsymax then return Tic.COLORPSYLT end
    return Tic.COLORPSYEQ
end

function CCharacter:hoverEntity(_entity) -- hover an entity, use nil to unhover
    if _entity then
        if self.hovering then self.hovering.hovered = false end -- unhover previous if any
        _entity.hovered = true
        self.hovering = _entity
    else
        if self.hovering then self.hovering.hovered = false end -- unhover previous if any
        self.hovering = nil
    end
end

function CCharacter:spotEntity(_entity) -- spot an entity, use nil to unspot
    if _entity then
        if self.spotting then self.spotting.spotted = false end -- unspot previous if any
        _entity.spotted = true
        self.spotting = _entity
    else
        if self.spotting then self.spotting.spotted = false end -- unspot previous if any
        self.spotting = nil
    end
end

function CCharacter:postureGet() -- state posture
    return Tic.STATESETTINGS[self.state].posture
end

function CCharacter:statusGet() -- state status
    return Tic.STATESETTINGS[self.state].status
end

function CCharacter:stateSet(_posture, _status) -- set state from posture and status
    if not _posture or not _status then return end -- mandatory
    self.state = _posture.._status -- simple concatenation
end

function CCharacter:regionViewOffsets() -- view offsets region depending on dirx, diry, statphyact and posture
    local _stat          = self.statphyact
    local _posture       = self:postureGet()
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _range         = (_posturekneel) and Tic.WORLDWH // 2 or Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_range - _size) // 2) - 1) * (_stat / Tic.STATSMAX))

    return CRegion{
        lf  = (self.dirx == Tic.DIRXLF)
            and Nums:neg(_offsets)
            or  0,
        rg  = (self.dirx == Tic.DIRXLF)
            and _size
            or  _size + _offsets,
        up  = (self.diry == Tic.DIRYUP)
            and Nums:neg(_offsets)
            or  (self.diry == Tic.DIRYMD)
                and Nums:neg(_offsets // 2)
                or  0,
        dw  = (self.diry == Tic.DIRYUP)
            and _size
            or  (self.diry == Tic.DIRYMD)
                and _size + (_offsets // 2)
                or  _size + _offsets,
    }
end

function CCharacter:regionViewScreen() -- view screen region depending on dirx, diry
    local _regionviewoffsets = self:regionViewOffsets()
    return _regionviewoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionViewWorld() -- view world region depending on dirx, diry
    local _regionviewoffsets = self:regionViewOffsets()
    return _regionviewoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:regionMindOffsets() -- mind offsets region depending on dirx, diry, statmenact
    local _stat          = self.statmenact
    local _posture       = self:postureGet()
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _range         = Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_range - _size) // 2) - 1) * (_stat / Tic.STATSMAX))

    return CRegion{
        lf  = Nums:neg(_offsets),
        rg  = _size + _offsets,
        up  = Nums:neg(_offsets),
        dw  = _size + _offsets,
    }
end

function CCharacter:regionMindScreen() -- mind screen region depending on dirx, diry
    local _regionmindoffsets = self:regionMindOffsets()
    return _regionmindoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionMindWorld() -- mind world region depending on dirx, diry
    local _regionmindoffsets = self:regionMindOffsets()
    return _regionmindoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback) -- move offsets region
    _direction     = _direction or self.direction
    local _offsets = self:offsetsDirection(_direction, _movenone,  _moveslow, _moveback)
    local _up      = 0
    local _dw      = Tic.SPRITESIZE * self.scale
    local _lf      = 0
    local _rg      = Tic.SPRITESIZE * self.scale

    if _direction == Tic.DIR000 then
        _up = _up + _offsets.offsety
    elseif _direction == Tic.DIR045 then
        _up = _up + _offsets.offsety
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR090 then
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR135 then
        _dw = _dw + _offsets.offsety
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR180 then
        _dw = _dw + _offsets.offsety
    elseif _direction == Tic.DIR225 then
        _dw = _dw + _offsets.offsety
        _lf = _lf + _offsets.offsetx
    elseif _direction == Tic.DIR270 then
        _lf = _lf + _offsets.offsetx
    elseif _direction == Tic.DIR315 then
        _up = _up + _offsets.offsety
        _lf = _lf + _offsets.offsetx
    end

    return CRegion{
        up  = _up,
        dw  = _dw,
        lf  = _lf,
        rg  = _rg,
    }
end

function CCharacter:regionMoveScreen(_direction, _movenone,  _moveslow, _moveback) -- move screen region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback)
    return _regionmoveoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- move world region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback)
    return _regionmoveoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:locationsViewWorld() -- locations in itself view world
    return self.world:locationsRegion(self:regionViewWorld())
end

function CCharacter:entitiesViewWorld() -- entities in itself view world
    return CLocations:entities(self:locationsViewWorld())
end

function CCharacter:locationsMindWorld() -- locations in itself mind world
    return self.world:locationsRegion(self:regionMindWorld())
end

function CCharacter:entitiesMindWorld() -- entities in itself mind world
    return CLocations:entities(self:locationsMindWorld())
end

function CCharacter:locationsMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- locations in itself move world
    return self.world:locationsRegion(self:regionMoveWorld(_direction, _movenone,  _moveslow, _moveback))
end

function CCharacter:entitiesMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- entities in itself move world
    return CLocations:entities(self:locationsMoveWorld(_direction, _movenone,  _moveslow, _moveback))
end

function CCharacter:nearestEntityViewWorld() -- nearest entity in itself view world, except itself
    local _result            = nil
    local _entitiesviewworld = self:entitiesViewWorld()

    for _entity, _ in pairs(_entitiesviewworld) do
        if not (_entity == self) then -- avoid to nearest itself
            if _result == nil then
                _result = _entity -- first nearest entity
            elseif self:distanceEntityFake(_entity) < self:distanceEntityFake(_result) then
                _result = _entity -- new nearest entity
            end
        end
    end

    return _result
end

function CCharacter:draw() -- set animations and draw layers
    self:cycle()
    self:drawDirs()

    self:drawHandBG()
    self:drawBackBG()
    self:drawBody()
    self:drawBackFG()
    self:drawHead()
    self:drawHandFG()
    self:drawEffect()

    self:drawSpotted()
    self:drawHovered()
    self:drawBorders()
    self:drawHitbox()
    self:drawView()
    self:drawMind()
    self:drawMove()
    self:drawInteract()
end

function CCharacter:cycle() -- cycle the cyclers
    if self.portraitmode then return end -- no cycling in portraits
    self:cycleMove()
    self:cycleWork()
    self:cycleIdle()
end

function CCharacter:cycleMove() -- reset to idle after move
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status  == Tic.STATUSMOVE) then return end -- mandatory at move

    self.movecycler:next()
	if self.movecycler:isMAX() then -- trigger movecycler
		self:stateSet(_posture, Tic.STATUSIDLE)
	end
end

function CCharacter:cycleWork() -- animate work
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status == Tic.STATUSWORK) then return end -- mandatory at work

    self.workcycler:next()
	if self.workcycler:isGEH() then -- trigger workcycler
		self:toggleFrame()
	end
end

function CCharacter:cycleIdle() -- animate idle after a delay
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status == Tic.STATUSIDLE) then return end -- mandatory at idle

    self.idlecycler:next()
	if self.idlecycler:isMAX() then -- trigger idlecycler
		if Nums:random(Tic.STATSMAX) > self.statmenact then -- only if over statmenact
            self:moveDirection(Tables:valPickRandom{
                Tic.DIR000,Tic.DIR045, Tic.DIR090, Tic.DIR135, Tic.DIR180, Tic.DIR225, Tic.DIR270, Tic.DIR315
            }, true)
        end
	end
end

function CCharacter:drawDirs() -- draw the directions and ranges around the character -- FIXME why actual player ???
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player
    self.drawdirs = Tic.DIRSDRAW -- use Tic as master
    if not self.drawdirs then return end -- nothing to draw
    local _drawcolor = Tic.COLORWHITE
    local _screenx   = Tic.WORLDWX + Tic.WORLDWW2 - (Tic:playerActual().worldx - self.worldx) - 1 --relative to actual player -- feet
    local _screeny   = Tic.WORLDWY + Tic.WORLDWH2 - (Tic:playerActual().worldy - self.worldy) + 2
    local _posture   = self:postureGet()
    local _range     = self.statphyact * self.scale
    _range           = (_posture == Tic.POSTUREKNEEL) and Nums:roundmax(_range / 2) or _range

    circb(_screenx, _screeny, _range, _drawcolor)
    circb(_screenx + 1, _screeny, _range, _drawcolor)
    for _, _direction in pairs(Tables:keys(Tic.DIRSOFFSETS)) do
        local _offsets  = Tic.DIRSOFFSETS[_direction]
        local _oscreenx = _offsets.screenx or 0
        local _oscreeny = _offsets.screeny or 0
        local _ooffsetx = Nums:roundmax(_offsets.offsetx * _range / Tic.OFFSETLINE)
        local _ooffsety = Nums:roundmax(_offsets.offsety * _range / Tic.OFFSETLINE)

        line(
            _screenx + _oscreenx,
            _screeny + _oscreeny,
            _screenx + _oscreenx + _ooffsetx,
            _screeny + _oscreeny + _ooffsety,
            Tic.COLORRED --_drawcolor
        )
        if not _offsets.screenx then -- double line
            line(
                _screenx + 1,
                _screeny + _oscreeny,
                _screenx + 1 + _ooffsetx,
                _screeny + _oscreeny + _ooffsety,
                Tic.COLORRED --_drawcolor
            )
        end
        if not _offsets.screeny then -- double line
            line(
                _screenx + _oscreenx,
                _screeny + 1,
                _screenx + _oscreenx + _ooffsetx,
                _screeny + 1 + _ooffsety,
                Tic.COLORRED --_drawcolor
            )
        end
    end
end

function CCharacter:drawView() -- draw the view of a character
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player
    self.drawview = Tic.VIEWDRAW -- use Tic as master
    if not self.drawview then return end -- nothing to draw

    local _drawcolor = Tic.COLORGREENL
    local _regionviewscreen = self:regionViewScreen()
    local _screenlf  = _regionviewscreen.lf
    local _screenrg  = _regionviewscreen.rg
    local _screenup  = _regionviewscreen.up
    local _screendw  = _regionviewscreen.dw

    rectb(_screenlf, _screenup, _screenrg - _screenlf, _screendw - _screenup, _drawcolor)
end

function CCharacter:drawMind() -- draw the mind of a character
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player
    self.drawmind = Tic.MINDDRAW -- use Tic as master
    if not self.drawmind then return end -- nothing to draw

    local _drawcolor = Tic.COLORGREENM
    local _regionmindscreen = self:regionMindScreen()
    local _screenlf  = _regionmindscreen.lf
    local _screenrg  = _regionmindscreen.rg
    local _screenup  = _regionmindscreen.up
    local _screendw  = _regionmindscreen.dw

    rectb(_screenlf, _screenup, _screenrg - _screenlf, _screendw - _screenup, _drawcolor)
end

function CCharacter:drawMove() -- draw the move of a character
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player
    self.drawmove = Tic.MOVEDRAW -- use Tic as master
    if not self.drawmove then return end -- nothing to draw

    local _drawcolor = Tic.COLORGREEND
    local _regionmovescreen = self:regionMoveScreen()
    local _screenlf  = _regionmovescreen.lf
    local _screenrg  = _regionmovescreen.rg
    local _screenup  = _regionmovescreen.up
    local _screendw  = _regionmovescreen.dw

    rectb(_screenlf, _screenup, _screenrg - _screenlf, _screendw - _screenup, _drawcolor)
end

function CCharacter:drawEffect()
    local _status         = self:statusGet()
    local _statussettings = Tic.STATUSSETTINGS[_status]
    local _frequence      = Tic.STATESETTINGS[self.state].frequence
    local _effectsprite   = _statussettings.effectsprite -- effect sprite
    local _tick00         = Tic.TICK00.actvalue
    local _palette        = (Nums:frequence01(_tick00, _frequence) == 0)
        and _statussettings.palette0
        or  _statussettings.palette1

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = _effectsprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.palette = _palette
    _musprite:draw()
end

function CCharacter:drawHandle(_screenx, _screeny, _color) -- for debug
    if false then
    rect(
        self.screenx + (_screenx * self.scale),
        self.screeny + (_screeny * self.scale),
        self.scale,
        self.scale,
        _color
    )
    end
end

function CCharacter:drawHandBG()
    self:drawHand(Tic.DRAWBG)
end

function CCharacter:drawHandFG()
    self:drawHand(Tic.DRAWFG)
end

function CCharacter:drawHand(_bgfg)
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding hand offsets
    local _handx = nil
    local _handy = nil
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXLF then
        _handx = _handlesoffsets.handrgx
        _handy = _handlesoffsets.handrgy
    end
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXRG then
        _handx = _handlesoffsets.handlfx
        _handy = _handlesoffsets.handlfy
    end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXLF then
        _handx = _handlesoffsets.handlfx
        _handy = _handlesoffsets.handlfy
    end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXRG then
        _handx = _handlesoffsets.handrgx
        _handy = _handlesoffsets.handrgy
    end
    self:drawHandle(_handlesoffsets.handrgx, _handlesoffsets.handrgy, Tic.COLORGREENL)
    self:drawHandle(_handlesoffsets.handlfx, _handlesoffsets.handlfy, Tic.COLORGREENM)
    
    local _object = nil  -- determine the corresponding object if any
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXLF then _object = self.slots.handrg.object end
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXRG then _object = self.slots.handlf.object end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXLF then _object = self.slots.handlf.object end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXRG then _object = self.slots.handrg.object end
    if not _object then return end -- nothing in hand

    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _handx   = _handx - _objecthandlex -- adjust handles
    local _handy   = _handy - _objecthandley

    _object:save()
    _object.screenx  = self.screenx + (_handx * self.scale)
    _object.screeny  = self.screeny + (_handy * self.scale)
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object.drawbgfg = _bgfg
    _object:draw()
    _object:load()
end

function CCharacter:drawBackBG()
    self:drawBack(Tic.DRAWBG)
end

function CCharacter:drawBackFG()
    self:drawBack(Tic.DRAWFG)
end

function CCharacter:drawBack(_bgfg)
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding back offsets
    local _backx  = _handlesoffsets.backx
    local _backy  = _handlesoffsets.backy
    self:drawHandle(_backx, _backy, Tic.COLORYELLOW)

    local _object = self.slots.back.object
    if not _object then return end -- nothing in back

    if self:postureGet() == Tic.POSTUREFLOOR then
        if _bgfg == Tic.DRAWFG then return end -- alwayq draw in bg
    else
        if self.dirx == Tic.DIRXLF and _bgfg == Tic.DRAWFG then return end -- draw bg/fg or not when not floor
        if self.dirx == Tic.DIRXRG and _bgfg == Tic.DRAWBG then return end
    end
 
    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _backx   = _backx - _objecthandlex -- adjust handles
    local _backy   = _backy - _objecthandley

    _object:save()
    _object.screenx  = self.screenx + (_backx * self.scale)
    _object.screeny  = self.screeny + (_backy * self.scale)
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object:draw()
    _object:load()
end

function CCharacter:handlesOffsets()
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    local _result  = {}
    if self.handlesoffsets[_status] then
        _result = Tables:merge(_result, self.handlesoffsets[_status][self.dirx][self.frame])
    else
        _result = Tables:merge(_result, self.handlesoffsets[_posture][self.dirx][self.size])
    end

    if not (_posture == Tic.POSTUREFLOOR) then
        _result.heady = _result.heady + self.size
        _result.backy = _result.backy + self.size
    end
    if _posture == Tic.POSTUREKNEEL then
        _result.handrgy = _result.handrgy + 1
        _result.handlfy = _result.handlfy + 1
        _result.heady   = _result.heady   + 1
        _result.backy   = _result.backy   + 1
    end

    return _result
end

function CCharacter:drawInteract()
    if not (self == Tic:playerActual()) then return end -- dont draw
    local _posture         = self:postureGet()
    if _posture == Tic.POSTUREFLOOR then return end -- dont draw
    if not self:hasInteractTo() then return end -- dont draw
    local _posturesettings = Tic.POSTURESETTINGS[_posture]
    local _headoffsetx     = _posturesettings.headoffsetx
    _headoffsetx           = (self.dirx == Tic.DIRXLF)
        and _headoffsetx - 3
        or  _headoffsetx + 3
    local _headoffsety     = _posturesettings.headoffsety - Tic.SPRITESIZE + 1
    _headoffsety               = (_posturesettings.headusesize)
        and _headoffsety + self.size
        or  _headoffsety


    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNINTMRK -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_headoffsetx * self.scale)
    _musprite.screeny = self.screeny + (_headoffsety * self.scale)
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
    _musprite.palette = {[Tic.COLORGREYD] = Tic.COLORKEY}
    _musprite:draw()
end

function CCharacter:statePrev() -- prev state in the stack
    self.state = Tic.STATES:prev()
end

function CCharacter:stateNext() -- next state in the stack
    self.state = Tic.STATES:next()
end

function CCharacter:toggleWork() -- toggle idle/move vs work
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- cannot toggle work
    _status = (_status == Tic.STATUSWORK)
        and Tic.STATUSIDLE
        or  Tic.STATUSWORK
	self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleKneel() -- toggle stand vs kneel
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle sleep
    if _posture == Tic.POSTURESTAND then
        _posture = Tic.POSTUREKNEEL
    elseif _posture == Tic.POSTUREKNEEL then
        _posture = Tic.POSTURESTAND
    elseif _posture == Tic.POSTUREFLOOR then -- sleeping
        _posture = Tic.POSTUREKNEEL
        _status = Tic.STATUSIDLE
    end
	self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleSleep() -- toggle stand vs sleep
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle sleep
    _posture = (_posture == Tic.POSTUREFLOOR)
        and Tic.POSTURESTAND
        or  Tic.POSTUREFLOOR
    _status = (_status == Tic.STATUSSLEEP)
        and Tic.STATUSIDLE
        or  Tic.STATUSSLEEP
    self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleFrame() -- toggle frame 0-1
    self.frame = Nums:toggle01(self.frame) -- animate continuous move in the same dirx
end

function CCharacter:spottingToggleSpot()
	self.spottingspot = Nums:toggleTF(self.spottingspot)
end

function CCharacter:spottingToggleLock()
	self.spottinglock = Nums:toggleTF(self.spottinglock)
end

function CCharacter:spottingTogglePick()
	self.spottingpick = Nums:toggleTF(self.spottingpick)
end

function CCharacter:isSpottingSpot()
	return self.spottingspot
end

function CCharacter:isSpottingLock()
	return self.spottinglock
end

function CCharacter:isSpottingPick()
	return self.spottingpick
end

function CCharacter:entitySpotting()
	return self.spotting
end

function CCharacter:entityHovering()
	return self.hovering
end

function CCharacter:moveWorldXY(_worldx, _worldy) -- move character into world
    if not _worldx or not _worldy then return end -- mandatory
    self.world:moveEntityWorldXY(self, _worldx, _worldy)
end

function CCharacter:offsetsDirection(_direction, _movenone,  _moveslow, _moveback) -- return offsets corresponding to direction, posture etc
    if not _direction then return end -- mandatory
    _movenone = _movenone or false -- force none move if any
    _moveslow = _moveslow or false -- force slow move if any
    _moveback = _moveback or false -- force back move if any
    local _posture = self:postureGet()
    local _offsets = Tic.DIRSOFFSETS[_direction]

    local _result = {
        offsetx = _offsets.offsetx,
        offsety = _offsets.offsety,
        screenx = _offsets.screenx,
        screeny = _offsets.screeny,
        dirx    = _offsets.dirx or self.dirx,
        diry    = _offsets.diry or self.diry,
    }

    if _movenone then -- none move
        _result.offsetx = 0
        _result.offsety = 0
    elseif _moveslow then -- slow move -1, 0, +1
        _result.offsetx = Nums:sign(_result.offsetx)
        _result.offsety = Nums:sign(_result.offsety)
    else -- normal move
        _result.offsetx = _result.offsetx * (self.statphyact / Tic.STATSMAX) -- depends of phy act
        _result.offsety = _result.offsety * (self.statphyact / Tic.STATSMAX)
        _result.offsetx = (_posture == Tic.POSTURESTAND) and _result.offsetx or _result.offsetx / 2 -- half if not stand
        _result.offsety = (_posture == Tic.POSTURESTAND) and _result.offsety or _result.offsety / 2 -- half if not stand
        _result.offsetx = Nums:roundmax(_result.offsetx) -- ensure solid values
        _result.offsety = Nums:roundmax(_result.offsety)
    end

    if _moveback then -- back move
        _result.offsetx = Nums:invert(_result.offsetx)
        _result.offsety = Nums:invert(_result.offsety)
    end

    return _result
end

function CCharacter:moveDirection(_direction, _movenone,  _moveslow, _moveback) -- handle moving a character in a direction
    _direction = _direction or self.direction
    _movenone  = _movenone or false -- force none move if any
    _moveslow  = _moveslow or false -- force slow move if any
    _moveback  = _moveback or false -- force back move if any
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    local _offsets = self:offsetsDirection(_direction, _movenone,  _moveslow, _moveback)
    local _olddirx = self.dirx -- save actual character dirx

    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then -- cannot move -- nor change dir
        return
    end

    if _posture == Tic.POSTUREFLOOR and _status == Tic.STATUSSLEEP then -- sleep to stand
        return self:stateSet(Tic.POSTURESTAND, Tic.STATUSIDLE)
    end

    self.dirx      = _offsets.dirx -- adjust dirx, diry and direction
    self.diry      = _offsets.diry
    self.direction = _direction

    if _movenone then -- none move
        return
    end

    if _status == Tic.STATUSWORK then -- interrupt work and goes to idle
        return self:stateSet(_posture, Tic.STATUSIDLE)
    end

    if _status == Tic.STATUSIDLE and not (self.dirx == _olddirx) then -- simply change dirx
        return
    end

    if _status == Tic.STATUSMOVE and not (self.dirx == _olddirx) then -- change dirx and goes to idle
        return self:stateSet(_posture, Tic.STATUSIDLE)
    end

    self:stateSet(_posture, Tic.STATUSMOVE)
    self:toggleFrame() -- animate continuous move in the same dirx

    local _characterhitbox   = self:hitboxRegionWorld() -- collisions system
    local _entitiesmoveworld = self:entitiesMoveWorld(_direction, _movenone,  _moveslow, _moveback)
    local _entitieshitboxes  = {}
    for _entity, _ in pairs(_entitiesmoveworld or {}) do -- record the possible hitboxes
        if not (_entity == self) and _entity.hitbox then -- only with hitbox -- except itself
            Tables:keyAppend(_entitieshitboxes, _entity, _entity:hitboxRegionWorld())
        end
    end

    self:hitboxDetachAll()
    local _movebyx          = Nums:sign(_offsets.offsetx) -- calculate the maximum move step by step
    local _movebyy          = Nums:sign(_offsets.offsety)
    local _movetox          = 0
    local _movetoy          = 0
    local _move             = true
    local _entitiescollided = {}
    while _move do
        if _characterhitbox then -- only consider collisions if charater has an hitbox
            _characterhitbox = _characterhitbox:offsetXY(_movebyx, _movebyy) -- compute the future position
            for _entity, _entityhitbox in pairs(_entitieshitboxes) do
                if _characterhitbox:hasInsideRegion(_entityhitbox) then -- collision
                    Tables:keyAppend(_entitiescollided, _entity, _entity)
                end
            end
        end

        if Tables:size(_entitiescollided) > 0 then
            self:hitboxAttachTo(_entitiescollided)
            _move = false
        else
            if Nums:pos(_movetox) < Nums:pos(_offsets.offsetx) then _movetox = _movetox + _movebyx end
            if Nums:pos(_movetoy) < Nums:pos(_offsets.offsety) then _movetoy = _movetoy + _movebyy end
            if _movetox == _offsets.offsetx and _movetoy == _offsets.offsety then
                _move = false
            end
        end
    end
    self:moveWorldXY(self.worldx + _movetox, self.worldy + _movetoy)

    self.movecycler:min() -- reset the move cycler
end

function CCharacter:hitboxRefresh() -- refresh the attached hitboxes
    -- local _hitboxregion    = self:regionMoveOffsets() -- hitbox collisions -- FIXME use another region (move)
    -- local _hitboxlocations = self:locationsRegion(_hitboxregion)
    -- local _hitboxentities  = CLocations:entities(_hitboxlocations)
    -- self:hitboxDetachAll()
    -- self:hitboxAttachTo(_hitboxentities)
    -- self:hitboxDetachSelf() -- not itself
end

function CCharacter:statAct(_action, _stat, _value) -- modify a stat act -- set/dec/inc/max
    if not _action or not _stat then return end -- mandatory
    if not self[_stat] then return end -- unknown stat
    _value = _value or 0

    if _action == Tic.STATSET then
        self[_stat] = _value
    elseif _action == Tic.STATDEC then
        self[_stat] = self[_stat] - _value
    elseif _action == Tic.STATINC then
        self[_stat] = self[_stat] + _value
    elseif _action == Tic.STATMAX then
        self[_stat] = self[string.gsub(_stat, "act", "max")]
    end

    self[_stat] = math.max(self[_stat], Tic.STATSMIN) -- stay in range
    self[_stat] = math.min(self[_stat], Tic.STATSMAX)
    self[_stat] = Nums:roundint(self[_stat]) -- ensure an integer

    self:hitboxRefresh() -- refresh the hitboxes
end


--
-- CCharacterHumanoid
--
CCharacterHumanoid = CCharacter:extend() -- humanoid characters
Classic.KINDCHARACTERHUMANOID = "Humanoid" -- Humanoid kind
CCharacterHumanoid.HANDLESOFFSETS = { -- hands, head and back offsets
    [Tic.STATUSIDLE] = {
        [Tic.DIRXLF] = {
            [CSprite.FRAME00] = {
                handrgx = 2, handrgy = 6,
                handlfx = 5, handlfy = 6,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEIDLELF
            },
            [CSprite.FRAME01] = {
                handrgx = 2, handrgy = 6,
                handlfx = 5, handlfy = 6,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEIDLELF
            },
        },
        [Tic.DIRXRG] = {
            [CSprite.FRAME00] = {
                handrgx = 5, handrgy = 6,
                handlfx = 2, handlfy = 6,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEIDLERG
            },
            [CSprite.FRAME01] = {
                handrgx = 5, handrgy = 6,
                handlfx = 2, handlfy = 6,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEIDLERG
            },
        },
    },
    [Tic.STATUSWORK] = {
        [Tic.DIRXLF] = {
            [CSprite.FRAME00] = {
                handrgx = 1, handrgy = 7,
                handlfx = 6, handlfy = 6,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEWORKLF
            },
            [CSprite.FRAME01] = {
                handrgx = 1, handrgy = 7,
                handlfx = 6, handlfy = 6,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEWORKLF
            },
        },
        [Tic.DIRXRG] = {
            [CSprite.FRAME00] = {
                handrgx = 6, handrgy = 7,
                handlfx = 1, handlfy = 6,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEWORKRG
            },
            [CSprite.FRAME01] = {
                handrgx = 6, handrgy = 7,
                handlfx = 1, handlfy = 6,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEWORKRG
            },
        },
    },
    [Tic.STATUSMOVE] = {
        [Tic.DIRXLF] = {
            [CSprite.FRAME00] = {
                handrgx = 1, handrgy = 5,
                handlfx = 6, handlfy = 6,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEMOVELF
            },
            [CSprite.FRAME01] = {
                handrgx = 1, handrgy = 6,
                handlfx = 6, handlfy = 5,
                headx = 4, heady = 2,
                backx = 5, backy = 3,
                state = Tic.STATEMOVELF
            },
        },
        [Tic.DIRXRG] = {
            [CSprite.FRAME00] = {
                handrgx = 6, handrgy = 5,
                handlfx = 1, handlfy = 6,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEMOVERG
            },
            [CSprite.FRAME01] = {
                handrgx = 6, handrgy = 6,
                handlfx = 1, handlfy = 5,
                headx = 3, heady = 2,
                backx = 2, backy = 3,
                state = Tic.STATEMOVERG
            },
        },
    },
    [Tic.POSTUREFLOOR] = {
        [Tic.DIRXLF] = {
            [Tic.SIZES] = {
                handrgx =  1, handrgy = 3,
                handlfx =  1, handlfy = 8,
                headx = 5, heady = 6,
                backx = 9, backy = 5,
                state = Tic.STATEFLOORLF
            },
            [Tic.SIZEM] = {
                handrgx =  0, handrgy = 3,
                handlfx =  0, handlfy = 8,
                headx = 5, heady = 6,
                backx = 9, backy = 5,
                state = Tic.STATEFLOORLF
            },
            [Tic.SIZEL] = {
                handrgx = -1, handrgy = 3,
                handlfx = -1, handlfy = 8,
                headx = 5, heady = 6,
                backx = 9, backy = 5,
                state = Tic.STATEFLOORLF
            },
        },
        [Tic.DIRXRG] = {
            [Tic.SIZES] = {
                handrgx = 6, handrgy = 8,
                handlfx = 6, handlfy = 3,
                headx = 2, heady = 6,
                backx = -2, backy = 5,
                state = Tic.STATEFLOORRG
            },
            [Tic.SIZEM] = {
                handrgx = 7, handrgy = 8,
                handlfx = 7, handlfy = 3,
                headx = 2, heady = 6,
                backx = -2, backy = 5,
                state = Tic.STATEFLOORRG
            },
            [Tic.SIZEL] = {
                handrgx = 8, handrgy = 8,
                handlfx = 8, handlfy = 3,
                headx = 2, heady = 6,
                backx = -2, backy = 5,
                state = Tic.STATEFLOORRG
            },
        },
    },
}
function CCharacterHumanoid:new(_argt)
    CCharacterHumanoid.super.new(self, _argt)
    self.classic = CCharacterHumanoid
    self.kind    = Classic.KINDCHARACTERHUMANOID
    self.handlesoffsets = CCharacterHumanoid.HANDLESOFFSETS
    self.colorhairsfg   = Tic.COLORGREYD -- head colors
    self.colorhairsbg   = Tic.COLORGREYM
    self.colorskin      = Tic.COLORWHITE
    self.colorextra     = self.colorskin
    self.coloreyesfg    = Tic.COLORGREYL -- eyes colors
    self.coloreyesbg    = Tic.COLORGREYM
    self.colorarmor     = Tic.COLORGREYD -- body colors
    self.colorshirt     = Tic.COLORGREYM
    self.colorpants     = Tic.COLORGREYL
    self.colorhands     = self.colorskin
    self:argt(_argt) -- override if any
end

function CCharacterHumanoid:drawBody()
    local _posture         = self:postureGet()
    local _status          = self:statusGet()
    local _posturesettings = Tic.POSTURESETTINGS[_posture]
    local _statussettings  = Tic.STATUSSETTINGS[_status]

    local _bodyspriteoffset = _posturesettings.bodyspriteoffset + _statussettings.bodyspriteoffset
    local _bodyoffsetx      = _posturesettings.bodyoffsetx
    _bodyoffsetx = (_bodyoffsetx == nil and self.dirx == Tic.DIRXLF)
        and Nums:pos(self.size) -- nil use size
        or  _bodyoffsetx
    _bodyoffsetx = (_bodyoffsetx == nil and self.dirx == Tic.DIRXRG)
        and Nums:neg(self.size) -- nil use size
        or  _bodyoffsetx
    local _bodyoffsety      = _posturesettings.bodyoffsety
    local _bodyrotate       = _posturesettings.rotate
    local _bodyframe        = _posturesettings.frame
    _bodyframe = (_bodyframe)
        and _bodyframe -- fix frame
        or  self.frame

    local _musprite = CSpriteFG() -- multi usage unique sprite
    _musprite.sprite  = self.bodysprite + _bodyspriteoffset -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_bodyoffsetx * self.scale)
    _musprite.screeny = self.screeny + (_bodyoffsety * self.scale)
    _musprite.rotate  = _bodyrotate
    _musprite.frame   = _bodyframe
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
    _musprite.palette = { -- apply body palette
        [Tic.COLORARMOR] = self.colorarmor,
        [Tic.COLORSHIRT] = self.colorshirt,
        [Tic.COLORPANTS] = self.colorpants,
        [Tic.COLORHANDS] = self.colorhands,
    }
    _musprite:draw()
end

function CCharacterHumanoid:drawHead()
    local _posture         = self:postureGet()
    local _posturesettings = Tic.POSTURESETTINGS[_posture]

    local _headoffsetx     = _posturesettings.headoffsetx
    local _headoffsety     = _posturesettings.headoffsety
    _headoffsety           = (_posturesettings.headusesize)
        and _headoffsety + self.size
        or  _headoffsety
    local _headrotate      = _posturesettings.rotate


    local _musprite = CSpriteFG() -- multi usage unique sprite

    -- draw head
    _musprite.sprite  = self.headsprite -- apply the corresponding attributes
    _musprite.screenx = self.screenx + (_headoffsetx * self.scale)
    _musprite.screeny = self.screeny + (_headoffsety * self.scale)
    _musprite.rotate  = _headrotate
    _musprite.scale   = self.scale
    _musprite.flip    = self.dirx
    _musprite.palette = { -- apply head palette
        [Tic.COLORHAIRSFG] = self.colorhairsfg,
        [Tic.COLORHAIRSBG] = self.colorhairsbg,
        [Tic.COLOREXTRA]   = self.colorextra,
        [Tic.COLORSKIN]    = self.colorskin,
    }
    _musprite:draw()

    -- draw head eyes
    local _coloreyesfg = Tic.COLORKEY
    local _coloreyesbu = Tic.COLORKEY
    local _coloreyesbm = Tic.COLORKEY
    local _coloreyesbd = Tic.COLORKEY
    
    if _posture == Tic.POSTUREFLOOR then
        _coloreyesbm = self.coloreyesbg
    end
    if not (_posture == Tic.POSTUREFLOOR) and self.diry == Tic.DIRYUP then
        _coloreyesfg = self.coloreyesfg
        _coloreyesbu = self.coloreyesbg
    end
    if not (_posture == Tic.POSTUREFLOOR) and self.diry == Tic.DIRYMD then
        _coloreyesfg = self.coloreyesfg
        _coloreyesbm = self.coloreyesbg
    end
    if not (_posture == Tic.POSTUREFLOOR) and self.diry == Tic.DIRYDW then
        _coloreyesfg = self.coloreyesfg
        _coloreyesbd = self.coloreyesbg
    end

    _musprite.sprite  = self.eyessprite -- apply the corresponding attributes
    _musprite.palette = { -- apply eyes palette
        [Tic.COLOREYESFG] = _coloreyesfg,
        [Tic.COLOREYESBU] = _coloreyesbu,
        [Tic.COLOREYESBM] = _coloreyesbm,
        [Tic.COLOREYESBD] = _coloreyesbd,
    }
    _musprite:draw()

    -- draw head slot if any
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding head offsets
    local _headx  = _handlesoffsets.headx
    local _heady  = _handlesoffsets.heady
    self:drawHandle(_headx, _heady, Tic.COLORORANGE)

    local _object = self.slots.head.object
    if not _object then return end

    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _headx   = _headx - _objecthandlex -- adjust handles
    local _heady   = _heady - _objecthandley

    _object:save()
    _object.screenx  = self.screenx + (_headx * self.scale)
    _object.screeny  = self.screeny + (_heady * self.scale)
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object:draw()
    _object:load()
end


--
-- IPlayer
--
IPlayer = Classic:extend() -- players characters implementation
function IPlayer:playerAppend()
    Tic:playerAppend(self) -- record the new player on tic
end


CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self.classic = CPlayerHumanoid
    self.discovered = true
    self:argt(_argt) -- override if any
    self:implementall(IPlayer)
    self:playerAppend()
end


CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
Classic.KINDDWARF = "Dwarf" -- Dwarf kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.classic = CPlayerDwarf
    self.kind    = Classic.KINDDWARF
    self.size         = Tic.SIZES -- size
    self.colorhairsfg = Tic.COLORRED -- colors
    self.colorhairsbg = Tic.COLORORANGE
    self.headsprite   = CSpriteFG.HEADDWARF -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
Classic.KINDGNOME = "Gnome" -- Gnome kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.classic = CPlayerGnome
    self.kind    = Classic.KINDGNOME
    self.size         = Tic.SIZES -- size
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
    self:argt(_argt) -- override if any
end


CPlayerElvwe = CPlayerHumanoid:extend() -- Elvwe player characters
Classic.KINDELVWE = "Elvwe" -- Elvwe kind
function CPlayerElvwe:new(_argt)
    CPlayerElvwe.super.new(self, _argt)
    self.classic = CPlayerElvwe
    self.kind    = Classic.KINDELVWE
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORGREENM -- colors
    self.coloreyesbg  = Tic.COLORGREEND
    self.colorhairsfg = Tic.COLORORANGE
    self.colorhairsbg = Tic.COLORYELLOW
    self.headsprite   = CSpriteFG.HEADELVWE -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerDrowe = CPlayerElvwe:extend() -- Drowe player characters
Classic.KINDDROWE = "Drowe" -- Drowe kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.classic = CPlayerDrowe
    self.kind    = Classic.KINDDROWE
    self.size         = Tic.SIZEM -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.colorhairsfg = Tic.COLORGREYD
    self.colorhairsbg = Tic.COLORGREYM
    self.statphymax   = 5
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 4
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
Classic.KINDANGEL = "Angel" -- Angel kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.classic = CPlayerAngel
    self.kind    = Classic.KINDANGEL
    self.size         = Tic.SIZEM -- size
    self.colorhairsfg = Tic.COLORGREYM -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = Tic.COLORYELLOW
    self.headsprite   = CSpriteFG.HEADANGEL -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerGolth = CPlayerHumanoid:extend() -- Golth player characters
Classic.KINDGOLTH = "Golth" -- Golth kind
function CPlayerGolth:new(_argt)
    CPlayerGolth.super.new(self, _argt)
    self.classic = CPlayerGolth
    self.kind    = Classic.KINDGOLTH
    self.size         = Tic.SIZEL -- size
    self.colorhairsfg = Tic.COLORWHITE -- colors
    self.colorhairsbg = Tic.COLORWHITE
    self.colorextra   = self.colorshirt
    self.coloreyesfg  = Tic.COLORBLUEL
    self.coloreyesbg  = Tic.COLORBLUEM
    self.headsprite   = CSpriteFG.HEADGOLTH -- head
    self.statphymax   = 8
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 1
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
Classic.KINDHORNE = "Horne" -- Horne kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.classic = CPlayerHorne
    self.kind    = Classic.KINDHORNE
    self.size         = Tic.SIZEL -- size
    self.colorhairsfg = Tic.COLORPURPLE -- colors
    self.colorhairsbg = Tic.COLORRED
    self.colorextra   = Tic.COLORGREYD
    self.headsprite   = CSpriteFG.HEADHORNE -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
Classic.KINDDEMON = "Demon" -- Demon kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.classic = CPlayerDemon
    self.kind    = Classic.KINDDEMON
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
Classic.KINDTIFEL = "Tifel" -- Tifel kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.classic = CPlayerTifel
    self.kind    = Classic.KINDTIFEL
    self.size         = Tic.SIZEM -- size
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
Classic.KINDMEDUZ = "Meduz" -- Meduz kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.classic = CPlayerMeduz
    self.kind    = Classic.KINDMEDUZ
    self.size         = Tic.SIZES -- size
    self.colorhairsfg = Tic.COLORGREEND -- colors
    self.colorhairsbg = Tic.COLORGREENM
    self.headsprite   = CSpriteFG.HEADMEDUZ -- head
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerGnoll = CPlayerHumanoid:extend() -- Gnoll player characters
Classic.KINDGNOLL = "Gnoll" -- Gnoll kind
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.classic = CPlayerGnoll
    self.kind    = Classic.KINDGNOLL
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADGNOLL -- head
    self.statphymax   = 7
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 2
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CPlayerWolfe = CPlayerGnoll:extend() -- Wolfe player characters
Classic.KINDWOLFE = "Wolfe" -- Wolfe kind
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.classic = CPlayerWolfe
    self.kind    = Classic.KINDWOLFE
    self:argt(_argt) -- override if any
end


CPlayerGhost = CPlayerHumanoid:extend() -- Ghost player characters
Classic.KINDGHOST = "Ghost" -- Ghost kind
function CPlayerGhost:new(_argt)
    CPlayerGhost.super.new(self, _argt)
    self.classic = CPlayerGhost
    self.kind    = Classic.KINDGHOST
    self.size         = Tic.SIZEL -- size
    self.coloreyesfg  = Tic.COLORRED -- colors
    self.coloreyesbg  = Tic.COLORPURPLE
    self.colorhands   = Tic.COLORPURPLE
    self.headsprite   = CSpriteFG.HEADGHOST -- head
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 6
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


CNeutral= CCharacter:extend() -- neutral characters


CEnnemy = CCharacter:extend() -- ennemy characters


--
-- IElement
--
IElement = Classic:extend() -- generic screen element implementation
IElement.BEHAVIOUR = nil


--
-- CElement
--
CElement = Classic:extend() -- generic screen element -- TODO build this class
Classic.KINDELEMENT = "Element" -- Element kind
Classic.NAMEELEMENT = "Element" -- Element name
function CElement:new(_argt)
    CElement.super.new(self, _argt)
    self.kind = Classic.KINDELEMENT
    self.name = Classic.NAMEELEMENT
    self.screenx     = Tic.SCREENX -- positions
    self.screeny     = Tic.SCREENY
    self.screenw     = Tic.SCREENW -- sizes
    self.screenh     = Tic.SCREENH
    self.scale       = Tic.SCALE01
    self.align       = Tic.DIRHIT -- sub elements alignment
    self.marginlf    = 0
    self.marginrg    = 0
    self.marginup    = 0
    self.margindw    = 0
    self.separatorx  = 0     -- separator between elements in px if any
    self.separatory  = 0     -- separator between elements in px if any
    self.stretch     = false -- stretch elements ?
	self.rounded     = false -- rounded border and frames ?
    self.parent      = nil   -- parent element
    self.elements    = {}    -- sub elements if any
    self.behaviour   = IElement.BEHAVIOUR   -- behaviour function if any
    self.display     = true  -- display or not ?
    self.drawground  = true  -- draw beheviors
    self.drawguides  = true
    self.drawinside  = true
    self.drawcaches  = true
    self.drawborder  = true
    self.drawframes  = true
    self.cachestick  = Tic.SPRITESIZE     -- caches thickness
    self.colorground = Tic.COLORHUDSCREEN -- colors
    self.colorguides = Tic.COLORGREYM
    self.colorinside = Tic.COLORGREYM
    self.colorcaches = Tic.COLORHUDSCREEN
    self.colorborder = Tic.COLORGREYM
    self.colorframe1 = Tic.COLORWHITE
    self.colorframe2 = Tic.COLORGREYL
    self:argt(_argt) -- override if any
end

function CElement:draw() -- element drawing
    if not self:behave() then return end -- nothing to draw
    if self.drawground then self:drawGround() end
    if self.drawguides then self:drawGuides() end
    if self.drawinside then self:drawInside() end
    if self.drawcaches then self:drawCaches() end
    if self.drawborder then self:drawBorder() end
    if self.drawframes then self:drawFrames() end
end

function CElement:sizeWH() -- total WH sizes including margins
    return {sizew = self.marginlf + self.screenw + self.marginrg, sizeh = self.marginup + self.screenh + self.margindw}
end

function CElement:behave() -- execute the behaviour if any
    if type(self.behaviour) == "function" then self:behaviour() end
    return self.display -- display ?
end

function CElement:drawGround() -- element ground
    if self.rounded then
        rect(self.screenx + 2, self.screeny + 1, self.screenw - 4, self.screenh - 2, self.colorground)
        rect(self.screenx + 1, self.screeny + 2, self.screenw - 2, self.screenh - 4, self.colorground)
    else
        rect(self.screenx, self.screeny, self.screenw, self.screenh, self.colorground)
    end
end

function CElement:drawGuides() -- element guides -- FIXME still not working -- use ratio w h ?
    rect( -- hline md
		self.screenx,
		self.screeny + ((Nums:isEven(self.screenh)) and (self.screenh // 2) - 1 or (self.screenh // 2)),
        self.screenw,
		(Nums:isEven(self.screenh)) and 2 or 1,
        self.colorguides
    )
    rect( -- vline md
		self.screenx + ((Nums:isEven(self.screenw)) and (self.screenw // 2) - 1 or (self.screenw // 2)),
		self.screeny,
        (Nums:isEven(self.screenw)) and 2 or 1,
		self.screenh,
        self.colorguides
    )
    line( -- diag up lf - dw rg
		self.screenx,
		self.screeny,
        self.screenx + self.screenw - 1,
		self.screeny + self.screenh - 1,
        self.colorguides
    )
    line( -- diag dw lf - up rg
		self.screenx,
		self.screeny + self.screenh - 1,
        self.screenx + self.screenw - 1,
		self.screeny,
        self.colorguides
    )
end

function CElement:drawInside() -- element inside
    -- override
end

function CElement:drawCaches() -- element caches
    rect( -- lf cache
		self.screenx - self.cachestick,
		self.screeny,
        self.cachestick,
		self.screenh,
        self.colorcaches
    )
    rect( -- rg cache
		self.screenx + self.screenw,
		self.screeny,
        self.cachestick,
		self.screenh,
        self.colorcaches
    )
    rect( -- up cache
		self.screenx - self.cachestick,
		self.screeny - self.cachestick,
        self.screenw + (self.cachestick * 2),
		self.cachestick,
        self.colorcaches
    )
    rect( -- dw cache
		self.screenx - self.cachestick,
		self.screeny + self.screenh,
        self.screenw + (self.cachestick * 2),
		self.cachestick,
        self.colorcaches
    )
end

function CElement:drawBorder() -- element single border
    if self.rounded then
        rect(self.screenx + 1, self.screeny, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx + 1, self.screeny + 1, 1, 1, self.colorborder)
        rect(self.screenx +  self.screenw - 2, self.screeny + 1, 1, 1, self.colorborder)
        rect(self.screenx, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
        rect(self.screenx + 1, self.screeny + self.screenh - 1, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx + 1, self.screeny + self.screenh - 2, 1, 1, self.colorborder)
        rect(self.screenx +  self.screenw - 2, self.screeny + self.screenh - 2, 1, 1, self.colorborder)
        rect(self.screenx + self.screenw - 1, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
    else
        rectb(
            self.screenx,
            self.screeny,
            self.screenw,
            self.screenh,
            self.colorborder
        )
    end
end

function CElement:drawFrames() -- element double frames
    rectb( -- bg frame
        self.screenx - 2,
        self.screeny - 2,
        self.screenw + 5,
        self.screenh + 5,
        self.colorframe2
    )
    rectb( -- fg frame
        self.screenx - 3,
        self.screeny - 3,
        self.screenw + 5,
        self.screenh + 5,
        self.colorframe1
    )
end

function CElement:region() -- element region
    return CRegion{
        lf = self.screenx,
        rg = self.screenx + self.screenw - 1,
        up = self.screeny,
        dw = self.screeny + self.screenh - 1,
    }
end

function CElement:alignElementDirection(_element, _direction) -- align a sub element from itself -- use direction
    if not _element then return end -- mandatory
    _direction = _direction or Tic.DIRHIT -- center by default
    if Tables:valFind({Tic.DIR315, Tic.DIR270, Tic.DIR225}, _direction) then -- LF
        _element.screenx = self.screenx
    elseif Tables:valFind({Tic.DIR000, Tic.DIRHIT, Tic.DIR180}, _direction) then -- MD
        _element.screenx = self.screenx + ((self.screenw - _element.screenw) // 2)
    else -- RG
        _element.screenx = self.screenx + (self.screenw - _element.screenw)
    end
    if Tables:valFind({Tic.DIR315, Tic.DIR000, Tic.DIR045}, _direction) then -- UP
        _element.screeny = self.screeny
    elseif Tables:valFind({Tic.DIR270, Tic.DIRHIT, Tic.DIR090}, _direction) then -- MD
        _element.screeny = self.screeny + ((self.screenh - _element.screenh) // 2)
    else -- DW
        _element.screeny = self.screeny + (self.screenh - _element.screenh)
    end
end

function CElement:appendElement(_element) -- append element -- unique
    if not _element then return end -- mandarory
    if not _element:is(CElement) then return end -- only elements
    if Tables:valFind(self.elements, _element) then return end -- already exists
    _element.parent = self -- record parent
    Tables:valInsert(self.elements, _element, true)
end

function CElement:appendElements(_elements) -- append elements -- unique
    for _, _element in ipairs(_elements or {}) do
        self:appendElement(_element)
    end
end


--
-- CText
--
CText = CElement:extend() -- generic text element
Classic.KINDTEXT = "Text" -- Text kind
Classic.NAMETEXT = "Text" -- Text name
function CText:new(_argt)
    CText.super.new(self, _argt)
    self.kind = Classic.KINDTEXT
    self.name = Classic.NAMETEXT
    self.screenh     = Tic.FONTH
    self.drawground  = false -- draw beheviors
    self.drawguides  = false
    self.drawinside  = true
    self.drawcaches  = false
    self.drawborder  = false
    self.drawframes  = false
    self.text        = ""
    self.fixed       = true
    self.small       = true
    self.shadow      = false -- add a shadow ?
    self.case        = nil
    self.colorinside = Tic.COLORGREYL
    self.colorshadow = Tic.COLORGREYD
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CText:adjustWH() -- adjust screenw, screenh
    self.screenw = print(self.text, Nums.MININTEGER, Nums.MININTEGER, self.colorinside, self.fixed, self.scale, self.small)
    self.screenw = self.screenw + (self.marginlf * self.scale) + (self.marginrg * self.scale)
    self.screenh = Tic.FONTH * self.scale
    self.screenh = self.screenh + (self.marginup * self.scale) + (self.margindw * self.scale)
end

function CText:drawInside()
    self.text = Names:case(self.text, self.case)
    if self.shadow then
        print(
            self.text,
            self.screenx + (self.marginlf * self.scale) + self.scale,
            self.screeny + (self.marginup * self.scale) + self.scale,
            self.colorshadow,
            self.fixed,
            self.scale,
            self.small
        )
    end
    print(
        self.text,
        self.screenx + (self.marginlf * self.scale),
        self.screeny + (self.marginup * self.scale),
        self.colorinside,
        self.fixed,
        self.scale,
        self.small
    )
end
  

--
-- CWindow
--
CWindow = CElement:extend() -- generic window element
Classic.KINDWINDOW = "Window" -- Window kind
Classic.NAMEWINDOW = "Window" -- Window name
function CWindow:new(_argt)
    CWindow.super.new(self, _argt)
    self.kind = Classic.KINDWINDOW
    self.name = Classic.NAMEWINDOW
    self.drawguides = false
    self:argt(_argt) -- override if any
end


--
-- CWindowScreen
--
CWindowScreen = CWindow:extend() -- window screen
Classic.KINDWINDOWSCREEN = "WindowScreen" -- Window kind
Classic.NAMEWINDOWSCREEN = "WindowScreen" -- Window name
function CWindowScreen:new(_argt)
    CWindowScreen.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSCREEN
    self.name = Classic.NAMEWINDOWSCREEN
    self.drawcaches = false
    self.drawframes = false
    self:argt(_argt) -- override if any
end


--
-- CWindowMenu
--
CWindowMenu = CWindowScreen:extend() -- window menu
Classic.KINDWINDOWMENU = "WindowMenu" -- Window kind
Classic.NAMEWINDOWMENU = "WindowMenu" -- Window name
function CWindowMenu:new(_argt)
    CWindowMenu.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWMENU
    self.name = Classic.NAMEWINDOWMENU
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CWindowMenu:adjustWH()
    local _content = self:content()
    self.screenw   = _content.sizew
    self.screenh   = _content.sizeh
end

function CWindowMenu:content()
    local _maxsizew = 0
    local _maxsizeh = 0
    local _totsizeh = 0
    local _elements = {}
    for _, _element in ipairs(self.elements or {}) do
        if _element:behave() and _element.enabled then -- take element in account ?
            local _sizewh = _element:sizeWH()
            _maxsizew = Nums:max(_maxsizew, _sizewh.sizew)
            _maxsizeh = Nums:max(_maxsizeh, _sizewh.sizeh)
            _totsizeh =_totsizeh + _sizewh.sizeh
            Tables:valInsert(_elements, _element)
        end
    end
    local _size = Tables:size(_elements)
    _totsizeh = (self.stretch) and _maxsizeh * _size or _totsizeh
    _totsizeh = (_size > 0) and _totsizeh + (self.separatory * (_size - 1)) or _totsizeh
    return {size = _size, elements = _elements,
        sizew = self.marginlf + _maxsizew + self.marginrg, sizeh = self.marginup + _totsizeh + self.margindw,
        maxsizew = _maxsizew, maxsizeh = _maxsizeh, totsizeh = _totsizeh}
end

function CWindowMenu:drawInside()
    local _content = self:content()
    local _screenx = self.screenx + self.marginlf
    local _screeny = self.screeny + self.marginup
    for _, _element in ipairs(_content.elements or {}) do
        _element.screenx = _screenx
        _element.screeny = _screeny
        if self.stretch then
            _element.screenw = _content.maxsizew
            _element.screenh = _content.maxsizeh
        end
        _screeny = _screeny + _element.screenh + self.separatory
        _element:draw()
    end
    self.parent:appendElements(_content.elements)
end


--
-- CWindowInfos
--
CWindowInfos = CWindow:extend() -- window infos
Classic.KINDWINDOWINFOS = "WindowInfos" -- Window kind
Classic.NAMEWINDOWINFOS = "WindowInfos" -- Window name
function CWindowInfos:new(_argt)
    CWindowInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOS
    self.name = Classic.NAMEWINDOWINFOS
    self.drawcaches  = false
    self.drawborder  = false
    self.colorground = Tic.COLORBIOMENIGHT
    self:argt(_argt) -- override if any
end

function CWindowInfos:drawInside()
    local _offsety = 0
    for _, _text in pairs(self.elements) do
        self:alignElementDirection(_text, self.align)
        _text.screeny = _text.screeny + _offsety
        _text:draw()
        _offsety = _offsety + _text.screenh
    end
end


--
-- IWindowEntity
--
IWindowEntity = Classic:extend() -- entities windows implementation
IWindowEntity.BEHAVIOUR = function(self)
    self.drawinside = (self.entity) and true or false
end


--
-- CWindowInfosEntity
--
CWindowInfosEntity = CWindowInfos:extend() -- window infos for entities
function CWindowInfosEntity:new(_argt)
    CWindowInfosEntity.super.new(self, _argt)
    self.align  = Tic.DIR000
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowInfosEntity:drawInside() -- window infos content for entities
    if not self.entity then return end -- nothing to draw
    local _name = CText{text = self.entity.name, case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _kind = CText{text = self.entity.kind, case = Names.CASECAMEL, shadow = true, marginup = 2}
    self.elements = {_name, _kind}
    CWindowInfosEntity.super.drawInside(self)
end


--
-- IWindowPlayer
--
IWindowPlayer = Classic:extend() -- players windows implementation
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowPlayerInfos
--
CWindowPlayerInfos = CWindowInfosEntity:extend() -- window infos for player
function CWindowPlayerInfos:new(_argt)
    CWindowPlayerInfos.super.new(self, _argt)
    self.screenx   = Tic.PLAYERINFOSWX
    self.screeny   = Tic.PLAYERINFOSWY
    self.screenw   = Tic.PLAYERINFOSWW
    self.screenh   = Tic.PLAYERINFOSWH
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowPortrait
--
CWindowPortrait = CWindow:extend() -- window portrait
function CWindowPortrait:new(_argt)
    CWindowPortrait.super.new(self, _argt)
    self.screenw     = Tic.PLAYERPORTRAITWW -- sizes
    self.screenh     = Tic.PLAYERPORTRAITWH
    self.colorground = Tic.COLORBIOMENIGHT
    self.drawborder  = false
    self.cachestick  = Tic.SPRITESIZE * Tic.SCALE02 -- caches thickness
    self:argt(_argt) -- override if any
end

function CWindowPortrait:drawGround() -- window portrait ground
    self.colorground = Tic:biomeActual()
    CWindowPortrait.super.drawGround(self)
end


--
-- CWindowPortraitDrawable
--
CWindowPortraitDrawable = CWindowPortrait:extend() -- window portrait for -- [!] drawable entities
function CWindowPortraitDrawable:new(_argt)
    CWindowPortraitDrawable.super.new(self, _argt)
    self.idle   = false --false -- idle portait or not
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowPortraitDrawable:drawInside() -- window portrait content for -- [!] drawable entities
    if not self.entity then return end -- nothing to draw
    local _tichitboxdraw     = Tic.HITBOXDRAW
    Tic.HITBOXDRAW           = false -- FIXME remove tic master at one point
    self.entity:save()
    self.entity.screenx      = self.screenx -- force entity attributes
    self.entity.screeny      = self.screeny
    self.entity.scale        = Tic.SCALE02
    self.entity.drawdirs     = false
    self.entity.drawview     = false
    self.entity.interactto   = {} -- dont draw interactto in window
    self.entity.interactby   = {} -- dont draw interactby in window
    self.entity.portraitmode = true -- avoid some drawings in portraitmode
    self.entity.spotted      = false -- dont draw spotted frame in window
    self.entity.hovered      = false -- dont draw hovered frame in window
    if self.idle then
        self.entity.dirx       = Tic.DIRXRG --Tic.DIRXLF
        self.entity.frame      = CSprite.FRAME00
        self.entity.animations = {}
    end
    self.entity:draw()
    self.entity:load()
    Tic.HITBOXDRAW = _tichitboxdraw
end


--
-- CWindowPlayerPortrait
--
CWindowPlayerPortrait = CWindowPortraitDrawable:extend() -- window portrait for player
function CWindowPlayerPortrait:new(_argt)
    CWindowPlayerPortrait.super.new(self, _argt)
    self.screenx   = Tic.PLAYERPORTRAITWX
    self.screeny   = Tic.PLAYERPORTRAITWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowPlayerPortrait:drawInside()
    self.entity = Tic:playerActual()
    CWindowPlayerPortrait.super.drawInside(self)
end


--
-- CWindowStats
--
CWindowStats = CWindow:extend() -- window stats
function CWindowStats:new(_argt)
    CWindowStats.super.new(self, _argt)
    self.screenw     = Tic.PLAYERSTATSWW -- sizes
    self.screenh     = Tic.PLAYERSTATSWH
    self.colorground = Tic.COLORBIOMENIGHT
    self.colorborder = Tic.COLORWHITE
    self.drawcaches  = false
    self.drawborder  = false
    self:argt(_argt) -- override if any
end


--
-- CWindowStatsCharacter
--
CWindowStatsCharacter = CWindowStats:extend() -- window stats for -- [!] characters
function CWindowStatsCharacter:new(_argt)
    CWindowStatsCharacter.super.new(self, _argt)
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowStatsCharacter:drawInside() -- window stats content for -- [!] characters
    rect ( -- phy act bar
        self.screenx + 02,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statphyact + 1,
        06,
        self.entity.statphyact,
        self.entity:colorPhyAct()
    )
    rect ( -- men act bar
        self.screenx + 10,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statmenact + 1,
        06,
        self.entity.statmenact,
        self.entity:colorMenAct()
    )
    rect ( -- psy act bar
        self.screenx + 18,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statpsyact + 1,
        06,
        self.entity.statpsyact,
        self.entity:colorPsyAct()
    )

    rectb( -- phy bar border
        self.screenx + 02,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )
    rectb( -- men bar border
        self.screenx + 10,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )
    rectb( -- psy bar border
        self.screenx + 18,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )

    rectb( -- phy max line
        self.screenx + 02,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statphymax,
        06,
        01,
        self.colorborder
    )
    rectb( -- men max line
        self.screenx + 10,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statmenmax,
        06,
        01,
        self.colorborder
    )
    rectb( -- psy max line
        self.screenx + 18,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statpsymax,
        06,
        01,
        self.colorborder
    )
end


--
-- CWindowPlayerStats
--
CWindowPlayerStats = CWindowStatsCharacter:extend() -- window stats for player
function CWindowPlayerStats:new(_argt)
    CWindowPlayerStats.super.new(self, _argt)
    self.screenx   = Tic.PLAYERSTATSWX
    self.screeny   = Tic.PLAYERSTATSWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowPlayerState
--
CWindowPlayerState = CWindowInfos:extend() -- window state for player
function CWindowPlayerState:new(_argt)
    CWindowPlayerState.super.new(self, _argt)
    self.screenx   = Tic.PLAYERSTATEWX
    self.screeny   = Tic.PLAYERSTATEWY
    self.screenw   = Tic.PLAYERSTATEWW
    self.screenh   = Tic.PLAYERSTATEWH
    self.align     = Tic.DIR000
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowPlayerState:drawInside() -- window state content for player
    if not self.entity then return end -- nothing to draw
    local _posture = CText{text = self.entity:postureGet(), case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _status  = CText{text = self.entity:statusGet(), case = Names.CASECAMEL, shadow = true, marginup = 2}
    self.elements = {_posture, _status}
    CWindowPlayerState.super.drawInside(self)
end


--
-- IWindowPlayer
--
IWindowPlayer = Classic:extend() -- players windows implementation
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- IWindowSpotting
--
IWindowSpotting = Classic:extend() -- spotting windows implementation
IWindowSpotting.BEHAVIOUR = function(self)
    self.entity = Tic:spottingActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowSpottingInfos
--
CWindowSpottingInfos = CWindowInfosEntity:extend() -- window infos for spotting
Classic.KINDWINDOWSPOTTINGINFOS = "WindowSpottingInfos" -- WindowSpottingInfos kind
function CWindowSpottingInfos:new(_argt)
    CWindowSpottingInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSPOTTINGINFOS
    self.screenx   = Tic.SPOTTINGINFOSWX
    self.screeny   = Tic.SPOTTINGINFOSWY
    self.screenw   = Tic.SPOTTINGINFOSWW
    self.screenh   = Tic.SPOTTINGINFOSWH
    self.behaviour = IWindowSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowSpottingPortrait
--
CWindowSpottingPortrait = CWindowPortraitDrawable:extend() -- window portrait for spotting
Classic.KINDWINDOWSPOTTINGPORTRAIT = "WindowSpottingPortrait" -- WindowSpottingPortrait kind
function CWindowSpottingPortrait:new(_argt)
    CWindowSpottingPortrait.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSPOTTINGPORTRAIT
    self.screenx   = Tic.SPOTTINGPORTRAITWX
    self.screeny   = Tic.SPOTTINGPORTRAITWY
    self.screenw   = Tic.SPOTTINGPORTRAITWW
    self.screenh   = Tic.SPOTTINGPORTRAITWH
    self.behaviour = IWindowSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end


function Tic:worldActual() -- TEMP
    return World
end

--
-- CWindowWorld
--
CWindowWorld = CWindow:extend() -- window world
function CWindowWorld:new(_argt)
    CWindowWorld.super.new(self, _argt)
    self.screenx         = Tic.WORLDWX -- positions
    self.screeny         = Tic.WORLDWY
    self.screenw         = Tic.WORLDWW -- sizes
    self.screenh         = Tic.WORLDWH
    self.colorground     = Tic.COLORBIOMENIGHT
    self:argt(_argt) -- override if any
end

function CWindowWorld:drawGround() -- window world ground
    self.colorground = Tic:biomeActual()
    CWindowWorld.super.drawGround(self)
end

function CWindowWorld:drawInside() -- window world content
    self:drawPlayerActual()
end

function CWindowWorld:drawPlayerActual()
    local _playeractual     = Tic:playerActual()
    if not _playeractual then return end
    local _playerlocationsaround = _playeractual:locationsAround()
    local _playerregionviewworld = _playeractual:regionViewWorld()
    local _playerregionmindworld = _playeractual:regionMindWorld()
    local _playernearestentity   = _playeractual:nearestEntityViewWorld() -- nearest entity if any -- except itself

    _playeractual:hoverEntity() -- unhover

    if not _playeractual:entitySpotting() -- spot the nearest entity if nothing else spotted
    or not _playeractual:isSpottingLock()
    then
        _playeractual:spotEntity(_playernearestentity)
    end

    if  _playeractual:entitySpotting() -- interact
    and _playeractual:entitySpotting():hasInteractions()
    and _playeractual:regionWorld():directionRegion(_playeractual:entitySpotting():regionWorld()) == Tic.DIRHIT
    then
        _playeractual:interacttoAppend(_playeractual:entitySpotting())
    else
        _playeractual:interacttoDeleteAll()
    end
    
    for _, _keyy in pairs(Tables:keys(_playerlocationsaround)) do -- draw entities -- sorted by y first
        for _, _keyx in pairs(Tables:keys(_playerlocationsaround[_keyy])) do -- sorted by x next
            for _entity, _ in pairs(_playerlocationsaround[_keyy][_keyx]) do -- entities around actual player
                local _entityregionworld = _entity:regionWorld()

                _entity.hovered = false -- unhover all entities

                _entity.spotted = (_playeractual:isSpottingSpot() -- unspot all entities except spotting one if any
                and _entity == _playeractual:entitySpotting())
                    and true
                    or  false

                if _playerregionviewworld:hasInsideRegion(_entityregionworld) then -- draw mode -- in view
                    _entity.discovered = true
                    _entity.drawfade = false
                else -- not in view
                    _entity.drawfade = true
                end

                if (_playerregionviewworld:hasInsideRegion(_entityregionworld)) -- draw entity ?
                or (_playerregionmindworld:hasInsideRegion(_entityregionworld))
                then
                    if _entity.discovered then -- only discovered entities
                        _entity:adjustScreenXYRelativeToEntity(_playeractual)
                        local _entityregionscreen = _entity:regionScreen()

                        if  _playeractual.spottingpick -- if in pick mode
                        and not (_entity == _playeractual) -- except itself
                        and _entityregionscreen:hasInsidePoint(Tic:mousePointX(), Tic:mousePointY()) -- hovering something ?
                        and not _playeractual.hovering then --hover only one
                            _playeractual:hoverEntity(_entity)

                            local _locking  = (_playeractual.spottinglock and _playeractual.spotting == _entity) -- already locking ?
                            local _locktext = (_locking)
                                and CText{text = "Unlock", colorinside = Tic.COLORHOVER}
                                or  CText{text = "Lock", colorinside = Tic.COLORHOVER}
                            _locktext.screenx = _entity.screenx - ((_locktext.screenw - Tic.SPRITESIZE) // 2)
                            _locktext.screeny = _entity.screeny - _locktext.screenh
                            _locktext:draw()

                            if Tic.MOUSE.clicklf then
                                Tic.MOUSE.clicklf = false -- avoid bouncing
                                Tic:mouseDelay(10)
                                
                                if _locking then -- unspot
                                    _playeractual:spotEntity()
                                    _playeractual.spottinglock = false
                                else -- spot
                                    _playeractual:spotEntity(_entity)
                                    _playeractual.spottinglock = true
                                end
                            end
                        end

                        _entity:draw()
                    end
                end
            end
        end
    end
end


--
-- CWindowInfosWorld
--
CWindowInfosWorld = CWindowInfos:extend() -- window infos for world
function CWindowInfosWorld:new(_argt)
    CWindowInfosWorld.super.new(self, _argt)
    self.screenx    = Tic.WORLDINFOSWX
    self.screeny    = Tic.WORLDINFOSWY
	self.screenw    = Tic.WORLDINFOSWW
	self.screenh    = Tic.WORLDINFOSWH
    self.drawborder = true
	self.align      = Tic.DIRHIT
    self:argt(_argt) -- override if any
end

function CWindowInfosWorld:drawInside() -- window infos content for world
    local _entity = Tic:worldActual()
    local _text   = CText{text = _entity.kind.." : ".._entity.name, small = false}
    self.elements = {_text}
    CWindowInfosWorld.super.drawInside(self)
end


--
-- IButton
--
IButton = Classic:extend() -- generic button implementation
IButton.BEHAVIOUR = function(self) -- need at least one function
    if Tables:size(self:functionsDefined()) == 0 then
        self.enabled = false
    end
end


--
-- CButton
--
CButton = CElement:extend() -- generic button
Classic.KINDBUTTON = "Button" -- Button kind
Classic.NAMEBUTTON = "Button" -- Button name
function CButton:new(_argt)
    CButton.super.new(self, _argt)
    self.kind = Classic.KINDBUTTON
    self.name = Classic.NAMEBUTTON
    self.screenw       = Tic.SPRITESIZE -- sizes
    self.screenh       = Tic.SPRITESIZE
    self.enabled       = true  -- can be clicked ?
    self.hovered       = false -- hovered by the mouse ?
    self.actived       = false -- function triggered ?
    self.activedcycler = CCyclerInt{maxindex =  10, mode = CCycler.MODEBLOCK} -- cycler to maintain the actived effect a little bit 
	self.clicklf       = nil   -- function to trigger on click lf
	self.clickmd       = nil   -- function to trigger on click md
	self.clickrg       = nil   -- function to trigger on click rg
	self.scrollx       = nil   -- function to trigger on scroll x
	self.scrolly       = nil   -- function to trigger on scroll y
	self.behaviour     = IButton.BEHAVIOUR  -- function to trigger at first
    self.hovertextlf   = nil   -- hover CText for clicklf if any
    self.hovertextrg   = nil   -- hover CText for clickrg if any
    self.drawground    = true  -- draw beheviors
    self.drawguides    = false
    self.drawinside    = true
    self.drawcaches    = false
    self.drawborder    = true
    self.drawframes    = false
    self.colorground         = Tic.COLORWHITE -- colors
    self.colorborder         = Tic.COLORGREYM
    self.colorhover          = Tic.COLORHUDSCREEN
    self.colorgrounddisabled = Tic.COLORGREYL
    self.colorborderdisabled = Tic.COLORGREYM
    self.colorgroundactived  = Tic.COLORHOVER
    self.colorhoverground    = nil
    self:argt(_argt) -- override if any
end

function CButton:draw() -- button drawing
    CButton.super.draw(self)
    if self.hovered and (self.hovertextlf and self.hovertextlf:is(CText)) then self:drawHovertextLF() end
    if self.hovered and (self.hovertextrg and self.hovertextrg:is(CText)) then self:drawHovertextRG() end
end

function CButton:drawGround()
    self:save()
    self.colorground = (self.hovered) and self.colorhover          or self.colorground
    self.colorground = (self.actived) and self.colorgroundactived  or self.colorground
    self.colorground = (self.enabled) and self.colorground or self.colorgrounddisabled
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    CButton.super.drawGround(self)
    self:load()
end

function CButton:drawBorder()
    self:save()
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    CButton.super.drawBorder(self)
    self:load()
end

function CButton:drawHovertextLF()
    if self.colorhoverground then
        rect(
            self.hovertextlf.screenx -1,
            self.hovertextlf.screeny,
            self.hovertextlf.screenw + 1,
            self.hovertextlf.screenh,
            self.colorhoverground
        )
        rect(
            self.hovertextlf.screenx,
            self.hovertextlf.screeny - 1,
            self.hovertextlf.screenw - 1,
            self.hovertextlf.screenh + 2,
            self.colorhoverground
        )
    end
    self.hovertextlf.colorinside = self.colorgroundactived
    self.hovertextlf.screenx = self.screenx - ((self.hovertextlf.screenw - self.screenw) // 2) + 1
    self.hovertextlf.screeny = self.screeny - self.hovertextlf.screenh
    self.hovertextlf:draw()
end

function CButton:drawHovertextRG()
    if self.colorhoverground then
        rect(
            self.hovertextrg.screenx -1,
            self.hovertextrg.screeny,
            self.hovertextrg.screenw + 1,
            self.hovertextrg.screenh,
            self.colorhoverground
        )
        rect(
            self.hovertextrg.screenx,
            self.hovertextrg.screeny - 1,
            self.hovertextrg.screenw - 1,
            self.hovertextrg.screenh + 2,
            self.colorhoverground
        )
    end
    self.hovertextrg.colorinside = self.colorgroundactived
    self.hovertextrg.screenx = self.screenx - ((self.hovertextrg.screenw - self.screenw) // 2) + 1
    self.hovertextrg.screeny = self.screeny + self.screenh
    self.hovertextrg:draw()
end

function CButton:functionsDefined() -- defined functions of a button
    local _result = {}

    for _, _key in ipairs({Tic.BUTTONCLICKLF, Tic.BUTTONCLICKMD, Tic.BUTTONCLICKRG, Tic.BUTTONSCROLLX, Tic.BUTTONSCROLLY}) do
        if type(self[_key]) == "function" then Tables:valInsert(_result, self[_key], true) end
    end

    return _result
end

function CButton:functionsActived() -- actived functions (in a key table) of a button
    local _result = {}

    if Tic.MOUSE.clicklf and type(self[Tic.BUTTONCLICKLF]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONCLICKLF], true) end
    if Tic.MOUSE.clickmd and type(self[Tic.BUTTONCLICKMD]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONCLICKMD], true) end
    if Tic.MOUSE.clickrg and type(self[Tic.BUTTONCLICKRG]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONCLICKRG], true) end
    if not (Tic.MOUSE.scrollx == 0) and type(self[Tic.BUTTONSCROLLX]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONSCROLLX], true) end
    if not (Tic.MOUSE.scrolly == 0) and type(self[Tic.BUTTONSCROLLY]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONSCROLLY], true) end

    return _result
end

function CButton:functionsContains(_function) -- does the button contains a function ?
    return (Tables:valFind(self:functionsDefined(), _function)) and true or false
end

function CButton:activable() -- is the button activable ?
    return self.display and self.enabled and Tables:size(self:functionsDefined()) > 0 and not self.actived
end

function CButton:activate() -- activate the button and start the effect cycler
    self.hovered = false
    self.actived = true
    self.activedcycler:max()
end

function CButton:deactivate() -- dehover the button and stop the activate effect if any
    self.hovered = false
    if self.activedcycler:prev() == 0 then
        self.actived = false
    end
end


--
-- CButtonText
--
CButtonText = CButton:extend() -- generic text button
function CButtonText:new(_argt)
    CButtonText.super.new(self, _argt)
	self.text = CText{} -- override with CText if any
    self.rounded = true
    self.colorinside = self.colorborder
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CButtonText:adjustWH() -- adjust screenw, screenh
    self.screenw = (self.marginlf * self.scale) + self.text.screenw + (self.marginrg * self.scale)
    self.screenh = (self.marginup * self.scale) + self.text.screenh + (self.margindw * self.scale)
end

function CButtonText:draw() -- button drawing
    self.drawinside = (self.text and self.text:is(CText)) and true or false
    CButtonText.super.draw(self)
end

function CButtonText:drawInside()
    self:alignElementDirection(self.text, self.align)
    self.text.colorinside = (self.colorinside) and self.colorinside or self.text.colorinside
    self.text:draw()
end


--
-- CButtonTextM2
--
CButtonTextM2 = CButtonText:extend() -- generic text button with margins 2
function CButtonTextM2:new(_argt)
    CButtonTextM2.super.new(self, _argt)
    self:argt(_argt) -- override if any
    self.text.marginup = 2
    self.text.margindw = 2
    self.text.marginlf = 2
    self.text.marginrg = 2
    self.text:adjustWH()
    self:adjustWH()
end


--
-- CButtonMenu
--
CButtonMenu = CButtonText:extend() -- generic menu button
function CButtonMenu:new(_argt)
    CButtonMenu.super.new(self, _argt)
    self.rounded = false
    self.align   = Tic.DIR270
    self:argt(_argt) -- override if any
end


--
-- CButtonMenuM2
--
CButtonMenuM2 = CButtonTextM2:extend() -- generic menu button with margins 2
function CButtonMenuM2:new(_argt)
    CButtonMenuM2.super.new(self, _argt)
    self.rounded = false
    self.align   = Tic.DIR270
    self:argt(_argt) -- override if any
end


--
-- CButtonSprite
--
CButtonSprite = CButton:extend() -- generic sprite button
function CButtonSprite:new(_argt)
    CButtonSprite.super.new(self, _argt)
	self.sprite = CSpriteBG{}
    self.drawborder = false
    self:argt(_argt) -- override if any
end

function CButtonSprite:drawGround()
    local _palette = {[self.colorground] = self.colorground, [self.colorborder] = self.colorborder}
    _palette = (self.hovered)
        and {[self.colorground] = self.colorhover, [self.colorborder] = self.colorborder}
        or  _palette
    _palette = (self.actived)
        and {[self.colorground] = self.colorgroundactived, [self.colorborder] = self.colorborder}
        or  _palette
    _palette = (self.enabled)
        and _palette
        or  {[self.colorground] = self.colorgrounddisabled, [self.colorborder] = self.colorborderdisabled}
    _palette = Tables:merge(self.sprite.palette, _palette)

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite.palette = _palette
    self.sprite:draw()
end


--
-- CButtonClick
--
CButtonClick = CButtonSprite:extend() -- generic click button


--
-- CButtonArrow
--
CButtonArrow = CButtonClick:extend() -- generic arrow click button
function CButtonArrow:new(_argt)
    CButtonArrow.super.new(self, _argt)
    self.drawborder    = false
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowLine
--
CButtonArrowLine = CButtonArrow:extend() -- generic line arrow click button
function CButtonArrowLine:new(_argt)
    CButtonArrowLine.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWL
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDiag
--
CButtonArrowDiag = CButtonArrow:extend() -- generic diag arrow click button
function CButtonArrowDiag:new(_argt)
    CButtonArrowDiag.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWD
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow000
--
CButtonArrow000 = CButtonArrowLine:extend() -- generic arrow 000 click button
function CButtonArrow000:new(_argt)
    CButtonArrow000.super.new(self, _argt)
    self.direction     = Tic.DIR000
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow045
--
CButtonArrow045 = CButtonArrowDiag:extend() -- generic arrow 045 click button
function CButtonArrow045:new(_argt)
    CButtonArrow045.super.new(self, _argt)
    self.direction     = Tic.DIR045
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow090
--
CButtonArrow090 = CButtonArrowLine:extend() -- generic arrow 090 click button
function CButtonArrow090:new(_argt)
    CButtonArrow090.super.new(self, _argt)
    self.direction     = Tic.DIR090
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow135
--
CButtonArrow135 = CButtonArrowDiag:extend() -- generic arrow 135 click button
function CButtonArrow135:new(_argt)
    CButtonArrow135.super.new(self, _argt)
    self.direction     = Tic.DIR135
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow180
--
CButtonArrow180 = CButtonArrowLine:extend() -- generic arrow 180 click button
function CButtonArrow180:new(_argt)
    CButtonArrow180.super.new(self, _argt)
    self.direction     = Tic.DIR180
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow225
--
CButtonArrow225 = CButtonArrowDiag:extend() -- generic arrow 225 click button
function CButtonArrow225:new(_argt)
    CButtonArrow225.super.new(self, _argt)
    self.direction     = Tic.DIR225
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow270
--
CButtonArrow270 = CButtonArrowLine:extend() -- generic arrow 270 click button
function CButtonArrow270:new(_argt)
    CButtonArrow270.super.new(self, _argt)
    self.direction     = Tic.DIR270
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow315
--
CButtonArrow315 = CButtonArrowDiag:extend() -- generic arrow 315 click button
function CButtonArrow315:new(_argt)
    CButtonArrow315.super.new(self, _argt)
    self.direction     = Tic.DIR315
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonCenter
--
CButtonCenter = CButtonArrow:extend() -- generic center click button
function CButtonCenter:new(_argt)
    CButtonCenter.super.new(self, _argt)
    self.direction     = nil
	self.sprite.sprite = CSpriteBG.SIGNCENTER
    self:argt(_argt) -- override if any
end


--
-- CButtonCheck
--
CButtonCheck = CButtonSprite:extend() -- generic check button
function CButtonCheck:new(_argt)
    CButtonCheck.super.new(self, _argt)
	self.checked = false
    self:argt(_argt) -- override if any
end

function CButtonCheck:drawGround()
    local _palette = {[self.colorground] = self.colorground, [self.colorborder] = self.colorborder}
    _palette = (self.checked)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorgroundactived}
        or  _palette
    _palette = (self.actived)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorgroundactived}
        or  _palette
    _palette = (self.hovered)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorhover}
        or  _palette
    _palette = (self.enabled)
        and _palette
        or  {[self.colorground] = self.colorgrounddisabled, [self.colorborder] = self.colorborderdisabled}

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite.palette = _palette
    self.sprite:draw()
end


--
-- IButtonPlayer
--
IButtonPlayer = Classic:extend() -- players buttons implementation
IButtonPlayer.BEHAVIOUR = function(self) -- need at least one player
    self.display = (Tic:playerActual()) and true or false
    if not self.display then return end -- no player
    IButton.BEHAVIOUR(self)
end


--
-- IButtonPlayerChange -- player change buttons implementation
--
IButtonPlayerChange = Classic:extend() -- generic change player button
IButtonPlayerChange.BEHAVIOUR = function(self) -- need at least more than one player
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.enabled = Tables:size(Tic:playerPlayers()) > 1
end


--
-- CButtonPlayerPrev
--
CButtonPlayerPrev = CButtonArrow270:extend() -- generic player prev button
function CButtonPlayerPrev:new(_argt)
    CButtonPlayerPrev.super.new(self, _argt)
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = Tic.FUNCTIONPLAYERPREV
    self.hovertextlf    = CText{text = "Prev"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerNext
--
CButtonPlayerNext = CButtonArrow090:extend() -- generic player next button
function CButtonPlayerNext:new(_argt)
    CButtonPlayerNext.super.new(self, _argt)
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = Tic.FUNCTIONPLAYERNEXT
    self.hovertextlf    = CText{text = "Next"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerPick
--
CButtonPlayerPick = CButtonClick:extend() -- generic player pick button
function CButtonPlayerPick:new(_argt)
    CButtonPlayerPick.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNPLAYER
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:logAppend("Pick") end
    self.hovertextlf    = CText{text = "Pick"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerStand
--
CButtonPlayerStand = CButtonCheck:extend() -- generic player stand button
CButtonPlayerStand.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():postureGet() == Tic.POSTURESTAND
    self.sprite.sprite = (Tic:playerActual():statusGet() == Tic.STATUSIDLE)
        and CSpriteBG.SIGNSTAIDL
        or  CSpriteBG.SIGNSTAMOV
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerStand:new(_argt)
    CButtonPlayerStand.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNSTAIDL
	self.behaviour      = CButtonPlayerStand.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleKneel() end
    self.hovertextlf    = CText{text = "Stand"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerKneel
--
CButtonPlayerKneel = CButtonCheck:extend() -- generic player kneel button
CButtonPlayerKneel.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():postureGet() == Tic.POSTUREKNEEL
    self.sprite.sprite = (Tic:playerActual():statusGet() == Tic.STATUSIDLE)
        and CSpriteBG.SIGNKNEIDL
        or  CSpriteBG.SIGNKNEMOV
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerKneel:new(_argt)
    CButtonPlayerKneel.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNKNEIDL
	self.behaviour      = CButtonPlayerKneel.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleKneel() end
    self.hovertextlf    = CText{text = "Kneel"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerWork
--
CButtonPlayerWork = CButtonCheck:extend() -- generic player work button
CButtonPlayerWork.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSWORK
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerWork:new(_argt)
    CButtonPlayerWork.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNDOWORK
	self.behaviour      = CButtonPlayerWork.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleWork() end
    self.hovertextlf    = CText{text = "Work"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerSleep
--
CButtonPlayerSleep = CButtonCheck:extend() -- generic player sleep button
CButtonPlayerSleep.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSSLEEP
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerSleep:new(_argt)
    CButtonPlayerSleep.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNDOSLEE
	self.behaviour      = CButtonPlayerSleep.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleSleep() end
    self.hovertextlf    = CText{text = "Sleep"}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerStat
--
CButtonPlayerStat = CButtonSprite:extend() -- generic stat button
function CButtonPlayerStat:new(_argt)
    CButtonPlayerStat.super.new(self, _argt)
    self.sprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE}
    self.behaviour      = IButtonPlayer.BEHAVIOUR
    self.getcolorstat   = nil -- getcolorstat function if any
    self:argt(_argt) -- override if any
end

function CButtonPlayerStat:drawGround()
    if self.getcolorstat then
       self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = self:getcolorstat()})
    end

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite:draw()
end

CButtonPlayerStatPhy = CButtonPlayerStat:extend()
function CButtonPlayerStatPhy:new(_argt)
    CButtonPlayerStatPhy.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTPHY
    self.getcolorstat  = function() return Tic:playerActual():colorPhyAct() end
    self:argt(_argt) -- override if any
end

CButtonPlayerStatMen = CButtonPlayerStat:extend()
function CButtonPlayerStatMen:new(_argt)
    CButtonPlayerStatMen.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTMEN
    self.getcolorstat  = function() return Tic:playerActual():colorMenAct() end
    self:argt(_argt) -- override if any
end

CButtonPlayerStatPsy = CButtonPlayerStat:extend()
function CButtonPlayerStatPsy:new(_argt)
    CButtonPlayerStatPsy.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTPSY
    self.getcolorstat  = function() return Tic:playerActual():colorPsyAct() end
    self:argt(_argt) -- override if any
end


--
-- CButtonSlot
--
CButtonSlot = CButtonSprite:extend() -- generic slot button
function CButtonSlot:new(_argt)
    CButtonSlot.super.new(self, _argt)
    self.getslotobject       = nil -- getslotobject function if any
    self.drawborder          = true
    self.colorground         = Tic.COLORBIOMENIGHT
    self.colorborder         = self.colorframe1
    self.colorborderdisabled = self.colorframe2
    self.rounded = true
    self:argt(_argt) -- override if any
end

function CButtonSlot:drawBorder()
    if self.getslotobject then
       self.enabled = (self:getslotobject()) and true or false
    end

    self:save()
    self.screenx = self.screenx - 1
    self.screeny = self.screeny - 1
    self.screenw = self.screenw + 2
    self.screenh = self.screenh + 2
    CButtonSlot.super.drawBorder(self)
    self:load()
end

function CButtonSlot:drawGround()
    rect(self.screenx, self.screeny, self.screenw, self.screenh, self.colorground)

    local _object = nil
    if self.getslotobject then
       _object = self:getslotobject()
    end
	if not _object then return end -- empty slot

    _object:save()
    _object.screenx  = self.screenx
    _object.screeny  = self.screeny
    _object.dirx     = Tic:playerActual().dirx
    _object:draw()
    _object:load()
end


--
-- IButtonSlotPlayer
--
IButtonSlotPlayer = Classic:extend() -- players buttons implementation
IButtonSlotPlayer.BEHAVIOUR = function(self) -- need at least one player with slots
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.display = (Tic:playerActual().slots) and true or false
end

CButtonSlotPlayer = CButtonSlot:extend()
function CButtonSlotPlayer:new(_argt)
    CButtonSlotPlayer.super.new(self, _argt)
    self.behaviour           = IButtonSlotPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHead = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHead:new(_argt)
    CButtonSlotPlayerHead.super.new(self, _argt)
    self.getslotobject = function() return Tic:playerActual().slots.head.object end
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerBack = CButtonSlotPlayer:extend()
function CButtonSlotPlayerBack:new(_argt)
    CButtonSlotPlayerBack.super.new(self, _argt)
    self.getslotobject = function() return Tic:playerActual().slots.back.object end
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHandLF = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHandLF:new(_argt)
    CButtonSlotPlayerHandLF.super.new(self, _argt)
    self.getslotobject = function() return Tic:playerActual().slots.handlf.object end
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHandRG = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHandRG:new(_argt)
    CButtonSlotPlayerHandRG.super.new(self, _argt)
    self.getslotobject = function() return Tic:playerActual().slots.handrg.object end
    self:argt(_argt) -- override if any
end


--
-- IButtonSpotting
--
IButtonSpotting = Classic:extend() -- spotting buttons implementation
IButtonSpotting.BEHAVIOUR = function(self) -- need at least one spotting
    self.display = (Tic:spottingActual()) and true or false
    if not self.display then return end -- no spotting
    IButton.BEHAVIOUR(self)
end


--
-- IButtonSlotSpotting
--
IButtonSlotSpotting = Classic:extend() -- spotting buttons implementation
IButtonSlotSpotting.BEHAVIOUR = function(self) -- need at least one spotting with slots
    IButtonSpotting.BEHAVIOUR(self)
    if not self.display then return end -- no spotting
    self.display = (Tic:spottingActual().slots) and true or false
end

CButtonSlotSpotting = CButtonSlot:extend()
function CButtonSlotSpotting:new(_argt)
    CButtonSlotSpotting.super.new(self, _argt)
    self.behaviour           = IButtonSlotSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHead = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHead:new(_argt)
    CButtonSlotSpottingHead.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.head.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingBack = CButtonSlotSpotting:extend()
function CButtonSlotSpottingBack:new(_argt)
    CButtonSlotSpottingBack.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.back.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHandLF = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHandLF:new(_argt)
    CButtonSlotSpottingHandLF.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.handlf.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHandRG = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHandRG:new(_argt)
    CButtonSlotSpottingHandRG.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.handrg.object end
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingSpot
--
CButtonSpottingSpot = CButtonCheck:extend() -- generic spottingspot check button
CButtonSpottingSpot.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingSpot()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingSpot:new(_argt)
    CButtonSpottingSpot.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNSPOTIT
	self.behaviour     = CButtonSpottingSpot.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingToggleSpot() end
    self.hovertextlf   = CText{text = "Spot"}
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingLock
--
CButtonSpottingLock = CButtonCheck:extend() -- generic spottinglock check button
CButtonSpottingLock.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingLock()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingLock:new(_argt)
    CButtonSpottingLock.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNLOCKIT
	self.behaviour     = CButtonSpottingLock.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingToggleLock() end
    self.hovertextlf   = CText{text = "Lock"}
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingPick
--
CButtonSpottingPick = CButtonCheck:extend() -- generic spottingpick check button
CButtonSpottingPick.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingPick()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingPick:new(_argt)
    CButtonSpottingPick.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNPICKIT
	self.behaviour     = CButtonSpottingPick.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingTogglePick() end
    self.hovertextlf   = CText{text = "Pick"}
    self:argt(_argt) -- override if any
end


--
-- IButtonSpottingMove
--
IButtonSpottingMove = Classic:extend() -- spotting buttons implementation
IButtonSpottingMove.PALETTE = {[Tic.COLORGREYD] = Tic.COLORKEY}
IButtonSpottingMove.BEHAVIOUR = function(self)
    IButton.BEHAVIOUR(self)
    self.display = (Tic:entitySpotting()) and true or false
    if not self.display then return end -- no spotting
    local _playerregionworld = Tic:playerActual():regionWorld()
    local _entityregionworld = Tic:spottingActual():regionWorld()
    local _direction         = _playerregionworld:directionRegion(_entityregionworld)
    self.hovertextlf = CText{text = "Move"}
    self.enabled     = false
    self.actived     = false
    if _direction == self.direction then
        self.enabled = true
        self.actived = true
    end
end

CButtonSpotting000 = CButtonArrow000:extend() -- generic spotting 000 button
function CButtonSpotting000:new(_argt)
    CButtonSpotting000.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt) -- override if any
end

CButtonSpotting045 = CButtonArrow045:extend() -- generic spotting 045 button
function CButtonSpotting045:new(_argt)
    CButtonSpotting045.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt) -- override if any
end

CButtonSpotting090 = CButtonArrow090:extend() -- generic spotting 090 button
function CButtonSpotting090:new(_argt)
    CButtonSpotting090.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt) -- override if any
end

CButtonSpotting135 = CButtonArrow135:extend() -- generic spotting 135 button
function CButtonSpotting135:new(_argt)
    CButtonSpotting135.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt) -- override if any
end

CButtonSpotting180 = CButtonArrow180:extend() -- generic spotting 180 button
function CButtonSpotting180:new(_argt)
    CButtonSpotting180.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt) -- override if any
end

CButtonSpotting225 = CButtonArrow225:extend() -- generic spotting 225 button
function CButtonSpotting225:new(_argt)
    CButtonSpotting225.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt) -- override if any
end

CButtonSpotting270 = CButtonArrow270:extend() -- generic spotting 270 button
function CButtonSpotting270:new(_argt)
    CButtonSpotting270.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt) -- override if any
end

CButtonSpotting315 = CButtonArrow315:extend() -- generic spotting 315 button
function CButtonSpotting315:new(_argt)
    CButtonSpotting315.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt) -- override if any
end


--
-- IButtonPlayerMove
--
IButtonPlayerMove = Classic:extend() -- player move buttons implementation
IButtonPlayerMove.PALETTE = {[Tic.COLORGREYD] = Tic.COLORKEY}
IButtonPlayerMove.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no move
    self.actived     = Tic:playerActual().direction == self.direction
    self.hovertextlf = CText{text = "Move"}
end

CButtonPlayerMove000 = CButtonArrow000:extend() -- generic player move 000 button
function CButtonPlayerMove000:new(_argt)
    CButtonPlayerMove000.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove045 = CButtonArrow045:extend() -- generic player move 045 button
function CButtonPlayerMove045:new(_argt)
    CButtonPlayerMove045.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove090 = CButtonArrow090:extend() -- generic player move 090 button
function CButtonPlayerMove090:new(_argt)
    CButtonPlayerMove090.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove135 = CButtonArrow135:extend() -- generic player move 135 button
function CButtonPlayerMove135:new(_argt)
    CButtonPlayerMove135.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove180 = CButtonArrow180:extend() -- generic player move 180 button
function CButtonPlayerMove180:new(_argt)
    CButtonPlayerMove180.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove225 = CButtonArrow225:extend() -- generic player move 225 button
function CButtonPlayerMove225:new(_argt)
    CButtonPlayerMove225.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove270 = CButtonArrow270:extend() -- generic player move 270 button
function CButtonPlayerMove270:new(_argt)
    CButtonPlayerMove270.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove315 = CButtonArrow315:extend() -- generic player move 315 button
function CButtonPlayerMove315:new(_argt)
    CButtonPlayerMove315.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt) -- override if any
end


--
-- CScreen
--
CScreen = CElement:extend() -- generic screen -- HAS TO BE AFTER WINDOWS AND BUTTONS
Classic.KINDSCREEN = "Screen" -- Screen kind
Classic.NAMESCREEN = "Screen" -- Screen name
function CScreen:new(_argt)
    CScreen.super.new(self, _argt)
    self.kind = Classic.KINDSCREEN
    self.name = Classic.NAMESCREEN
    self.windows       = {} -- screen windows if any -- ordered
    self.buttons       = {} -- screen buttons if any -- ordered
    self.screens       = {} -- sub screens (layers) if any -- ordered
    self.display       = true -- display this screen ?
    self.keysfunctions = nil -- keys to functions mapping if any
    self:argt(_argt) -- override if any
end

function CScreen:draw()
    if not self.display then return end -- nothing to display
    Tic:screenKeyboard(self) -- adjust keyboard mapping
    Tic:screenButtons(self)  -- adjust buttons mapping
    self:drawWindows()
    self:drawButtons()
    for _, _screen in ipairs(self.screens or {}) do -- layer ordered
        _screen:draw()
    end
end

function CScreen:drawWindows() -- draw ordered
    for _, _window in ipairs(self.windows or {}) do
        _window:draw()
    end
end

function CScreen:drawButtons() -- draw ordered
    local _buttonhovered = nil
    for _, _button in ipairs(self.buttons or {}) do
        _button:draw()
        if _button.hovered then _buttonhovered = _button end -- record hovered button
    end
    if _buttonhovered then _buttonhovered:draw() end -- redraw hovered button in front (for hovertext) if any
end

function CScreen:appendWindow(_window) -- append window -- unique
    if not _window then return end -- mandarory
    if not _window:is(CWindow) then return end -- only windows
    Tables:valInsert(self.windows, _window, true)
end

function CScreen:appendButton(_button) -- append button -- unique
    if not _button then return end -- mandarory
    if not _button:is(CButton) then return end -- only buttons
    Tables:valInsert(self.buttons, _button, true)
end

function CScreen:appendScreen(_screen) -- append screen -- unique
    if not _screen then return end -- mandarory
    if not _screen:is(CScreen) then return end -- only screens
    Tables:valInsert(self.screens, _screen, true)
end

function CScreen:appendElement(_element) -- append element -- unique
    if not _element then return end -- mandarory
    CScreen.super.appendElement(self, _element)
    self:appendWindow(_element) -- try all kinds
    self:appendButton(_element)
    self:appendScreen(_element)
end

function CScreen:elementsTotalW(_elements, _separator) -- total w of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenw + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CScreen:elementsTotalH(_elements, _separator) -- total h of elements with optional separator
    _separator = _separator or 0
    local _result = 0
    for _, _element in ipairs(_elements or {}) do
        _result = _result + _element.screenh + _separator
    end
    _result = (_result == 0) and _result or _result - _separator -- skip last separator
    return _result
end

function CScreen:elementsDistributeH(_elements, _screenx, _screeny, _separator) -- distribute h elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x -- not useful here
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screenx = _screenx + _element.screenw + _separator
    end
end

function CScreen:elementsDistributeV(_elements, _screenx, _screeny, _separator) -- distribute v elements with optional separator and xy
    _separator = _separator or 0
    for _, _element in ipairs(_elements or {}) do
        if _screenx then
            if _screenx >= 0 then -- gt 0 force x
                _element.screenx = _screenx
            else -- lt 0 keep its own x
            end
        else -- nil ajust x to the first element
            _screenx = _element.screenx
        end
        if _screeny then
            if _screeny >= 0 then -- gt 0 force y
                _element.screeny = _screeny
            else -- lt 0 keep its own y -- not useful here
            end
        else -- nil ajust y to the first element
            _screeny = _element.screeny
        end
        _screeny = _screeny + _element.screenh + _separator
    end
end


--
-- INTERFACE -- order is important !
--

if true then
_function = function(_argt) -- FIXME axecute functions with self
    _argt = _argt or {}
    local _text = _argt.text or "Plop"
    Tic:logAppend(_text)
end

ScreenIntro = CScreen{name = "Intro", keysfunctions = Tic.KEYSFUNCTIONSINTRO}

Button1 = CButtonTextM2{
    name = "B1",
    screenw = 16,
    screenh = 8,
    name = "plop 1",
    hovertextlf = CText{text = "Plop"},
    hovertextrg = CText{text = "Plip"},
    text = CText{text = "Op"},
    clicklf = _function,
    clickrg = function() _function{text = "Plip"} end,
}
Button2 = CButtonTextM2{
    name = "B2",
    screenw = 8,
    screenh = 8,
    name = "plop 2",
    hovertextlf = CText{text = "Plop"},
    colorinside = Classic.NIL,
    text = CText{text = "C", colorinside = Tic.COLORBLUEL},
    clicklf = _function,
    -- drawborder = false,
    -- drawground = false,
    -- align = Tic.DIR270,
}
Button3 = CButtonTextM2{
    name = "B3",
    screenw = 24,
    text = CText{text = "Menu"},
}
Button4 = CButtonMenuM2{
    name = "Open",
    rounded = true,
    text = CText{text = "Open"},
    clicklf = _function,
}
Button5 = CButtonMenuM2{
    name = "Close",
    rounded = true,
    text = CText{text = "Close"},
    clicklf = _function,
}
Button6 = CButtonMenuM2{
    name = "Quit",
   rounded = true,
    text = CText{text = "Quit"},
    clicklf = _function,
}
Button7 = CButton{
    -- name = "B7",
    screenx = 10,
    screeny = 70,
    screenw = 16,
    rounded = false,
    enabled = false,
}
Button11 = CButtonArrow315{}
Button12 = CButtonArrow225{}
Button13 = CButtonArrow135{}
Button14 = CButtonArrow045{}
Button15 = CButtonCenter{}

Button16 = CButtonCenter{
    screenx = 30,
    screeny = 60,
}
Button17 = CButtonCenter{
    screenx = 30,
    screeny = 70,
    enabled = false,
}

ScreenIntro:appendElements{
    CWindowScreen{name = "Intro"},
    CWindowInfos{
        name = "PressKey",
        drawground = false,
        drawframes = false,
        elements = {CText{text = "Press"}, CText{text = "a"}, CText{text = "Key"}},
    },
    -- Button1,
    -- Button2,
    -- Button3,
    -- Button4,
    -- Button5,
    -- Button6,
    -- Button7,

    -- Button11,
    -- Button12,
    -- Button13,
    -- Button14,
    -- Button15,

    -- Button16,
    -- Button17,
    -- ButtonPlayerPrev,
    -- ButtonPlayerNext,
}

Button15.clicklf = Tic.FUNCTIONSCREENNEXT
-- Button7.clicklf = Tic.FUNCTIONSCREENNEXT

ScreenIntro:elementsDistributeH({Button11, Button12, Button15, Button13, Button14}, 30, 10)
ScreenIntro:elementsDistributeV({Button1, Button2, Button3}, 10, 10, 2)
end

if true then
ScreenWorld = CScreen{name = "World", keysfunctions = Tic.KEYSFUNCTIONSWORLD}

-- lf panel
ScreenWorldLF = CScreen{}

WindowSpottingInfos    = CWindowSpottingInfos{}
ButtonSpottingSpot     = CButtonSpottingSpot{}
ButtonSpottingLock     = CButtonSpottingLock{}
ButtonSpottingPick     = CButtonSpottingPick{}
ScreenWorldLF:elementsDistributeH(
    {ButtonSpottingSpot, ButtonSpottingPick, ButtonSpottingLock},
    WindowSpottingInfos.screenx + (
        (WindowSpottingInfos.screenw - CScreen:elementsTotalW({ButtonSpottingSpot, ButtonSpottingPick, ButtonSpottingLock})) // 2),
    WindowSpottingInfos.screeny - Tic.SPRITESIZE
)

WindowSpottingPortrait   = CWindowSpottingPortrait{}
ButtonSpotting000        = CButtonSpotting000{}
ButtonSpotting045        = CButtonSpotting045{}
ButtonSpotting090        = CButtonSpotting090{}
ButtonSpotting135        = CButtonSpotting135{}
ButtonSpotting180        = CButtonSpotting180{}
ButtonSpotting225        = CButtonSpotting225{}
ButtonSpotting270        = CButtonSpotting270{}
ButtonSpotting315        = CButtonSpotting315{}
ButtonSlotSpottingHead   = CButtonSlotSpottingHead{}
ButtonSlotSpottingBack   = CButtonSlotSpottingBack{}
ButtonSlotSpottingHandLF = CButtonSlotSpottingHandLF{}
ButtonSlotSpottingHandRG = CButtonSlotSpottingHandRG{}
ScreenWorldLF:elementsDistributeH( -- up h line
    {ButtonSpotting135, ButtonSpotting225},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldLF:elementsDistributeH( -- md h line
    {ButtonSpotting090, ButtonSpotting270},
    WindowSpottingPortrait.screenx - 7,
    WindowSpottingPortrait.screeny + 4,
    14
)
ScreenWorldLF:elementsDistributeH( -- dw h line
    {ButtonSpotting045, ButtonSpotting315},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny + WindowSpottingPortrait.screenh - 2,
    12
)
ScreenWorldLF:elementsDistributeV( -- md v line
    {ButtonSpotting180, ButtonSpotting000},
    WindowSpottingPortrait.screenx + 4,
    WindowSpottingPortrait.screeny - 7,
    14
)
ScreenWorldLF:elementsDistributeH( -- head and back slots
    {ButtonSlotSpottingHead, ButtonSlotSpottingBack},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny - 2,
    28
)
ScreenWorldLF:elementsDistributeH( -- handrg and handlf slots
    {ButtonSlotSpottingHandRG, ButtonSlotSpottingHandLF},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

ScreenWorldLF:appendElements{
    WindowSpottingPortrait,
    WindowSpottingInfos,
    ButtonSpottingSpot,
    ButtonSpottingLock,
    ButtonSpottingPick,
    ButtonSpotting000,
    ButtonSpotting045,
    ButtonSpotting090,
    ButtonSpotting135,
    ButtonSpotting180,
    ButtonSpotting225,
    ButtonSpotting270,
    ButtonSpotting315,
    ButtonSlotSpottingHead,
    ButtonSlotSpottingBack,
    ButtonSlotSpottingHandLF,
    ButtonSlotSpottingHandRG,
}

-- md panel
ScreenWorldMD = CScreen{}

WindowWorld      = CWindowWorld{spottingwindows = {WindowSpottingInfos, WindowSpottingPortrait}}
WindowInfosWorld = CWindowInfosWorld{}
ScreenWorldMD:appendElements{
    WindowWorld,
    WindowInfosWorld,
}

-- rg panel
ScreenWorldRG = CScreen{}

WindowPlayerInfos    = CWindowPlayerInfos{}
ButtonPlayerPrev     = CButtonPlayerPrev{}
ButtonPlayerPick     = CButtonPlayerPick{}
ButtonPlayerNext     = CButtonPlayerNext{}
ScreenWorldRG:elementsDistributeH(
    {ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext},
    WindowPlayerInfos.screenx + (
        (WindowPlayerInfos.screenw - CScreen:elementsTotalW({ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext})) // 2),
    WindowPlayerInfos.screeny - Tic.SPRITESIZE
)

WindowPlayerPortrait = CWindowPlayerPortrait{}
ButtonPlayerMove000    = CButtonPlayerMove000{}
ButtonPlayerMove045    = CButtonPlayerMove045{}
ButtonPlayerMove090    = CButtonPlayerMove090{}
ButtonPlayerMove135    = CButtonPlayerMove135{}
ButtonPlayerMove180    = CButtonPlayerMove180{}
ButtonPlayerMove225    = CButtonPlayerMove225{}
ButtonPlayerMove270    = CButtonPlayerMove270{}
ButtonPlayerMove315    = CButtonPlayerMove315{}
ButtonSlotPlayerHead   = CButtonSlotPlayerHead{}
ButtonSlotPlayerBack   = CButtonSlotPlayerBack{}
ButtonSlotPlayerHandLF = CButtonSlotPlayerHandLF{}
ButtonSlotPlayerHandRG = CButtonSlotPlayerHandRG{}
ScreenWorldRG:elementsDistributeH( -- up h line
    {ButtonPlayerMove315, ButtonPlayerMove045},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldRG:elementsDistributeH( -- md h line
    {ButtonPlayerMove270, ButtonPlayerMove090},
    WindowPlayerPortrait.screenx - 7,
    WindowPlayerPortrait.screeny + 4,
    14
)
ScreenWorldRG:elementsDistributeH( -- dw h line
    {ButtonPlayerMove225, ButtonPlayerMove135},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny + WindowPlayerPortrait.screenh - 2,
    12
)
ScreenWorldRG:elementsDistributeV( -- md v line
    {ButtonPlayerMove000, ButtonPlayerMove180},
    WindowPlayerPortrait.screenx + 4,
    WindowPlayerPortrait.screeny - 7,
    14
)
ScreenWorldRG:elementsDistributeH( -- head and back slots
    {ButtonSlotPlayerHead, ButtonSlotPlayerBack},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny - 2,
    28
)
ScreenWorldRG:elementsDistributeH( -- handrg and handlf slots
    {ButtonSlotPlayerHandRG, ButtonSlotPlayerHandLF},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

WindowPlayerStats    = CWindowPlayerStats{}
ButtonPlayerStatPhy  = CButtonPlayerStatPhy{}
ButtonPlayerStatMen  = CButtonPlayerStatMen{}
ButtonPlayerStatPsy  = CButtonPlayerStatPsy{}
ScreenWorldRG:elementsDistributeH(
    {ButtonPlayerStatPhy, ButtonPlayerStatMen, ButtonPlayerStatPsy},
    WindowPlayerStats.screenx + (
        (WindowPlayerStats.screenw - CScreen:elementsTotalW({ButtonPlayerStatPhy, ButtonPlayerStatMen, ButtonPlayerStatPsy})) // 2),
    WindowPlayerStats.screeny - Tic.SPRITESIZE
)

WindowPlayerState    = CWindowPlayerState{}
ButtonPlayerStand    = CButtonPlayerStand{}
ButtonPlayerKneel    = CButtonPlayerKneel{}
ButtonPlayerWork     = CButtonPlayerWork{}
ButtonPlayerSleep    = CButtonPlayerSleep{}
ScreenWorldRG:elementsDistributeV(
    {ButtonPlayerStand, ButtonPlayerKneel},
    WindowPlayerState.screenx - Tic.SPRITESIZE,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerStand, ButtonPlayerKneel})) // 2)
)
ScreenWorldRG:elementsDistributeV(
    {ButtonPlayerWork, ButtonPlayerSleep},
    WindowPlayerState.screenx + WindowPlayerState.screenw,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerWork, ButtonPlayerSleep})) // 2)
)

ScreenWorldRG:appendElements{
    WindowPlayerPortrait,
    WindowPlayerInfos,
    WindowPlayerStats,
    WindowPlayerState,
    ButtonPlayerPrev,
    ButtonPlayerPick,
    ButtonPlayerNext,
    ButtonPlayerStatPhy,
    ButtonPlayerStatMen,
    ButtonPlayerStatPsy,
    ButtonPlayerMove000,
    ButtonPlayerMove045,
    ButtonPlayerMove090,
    ButtonPlayerMove135,
    ButtonPlayerMove180,
    ButtonPlayerMove225,
    ButtonPlayerMove270,
    ButtonPlayerMove315,
    ButtonSlotPlayerHead,
    ButtonSlotPlayerBack,
    ButtonSlotPlayerHandLF,
    ButtonSlotPlayerHandRG,
    ButtonPlayerStand,
    ButtonPlayerKneel,
    ButtonPlayerWork,
    ButtonPlayerSleep,
}

ScreenWorld:appendElements{
    CWindowScreen{},
    ScreenWorldMD,
    ScreenWorldLF,
    ScreenWorldRG,
}
end

if true then
ScreenMenus = CScreen{name = "Menus", keysfunctions = Tic.KEYSFUNCTIONSMENUS}
ScreenMenus:appendElements{
    CWindowMenu{
        colorground = Tic.COLORGREEND, screenx = 50, screeny = 50, screenw = 24, screenh = 40, rounded = true, drawframes = true,
        -- marginup = 2, margindw = 2, marginlf = 2, marginrg = 2,
        separatory = -1,
        stretch = true,
        elements = {Button4, Button5, Button6},
    },
}
end


-- SCREENS
if true then Tic:screenAppend(ScreenIntro) end
if true then Tic:screenAppend(ScreenWorld) end
-- if true then Tic:screenAppend(ScreenMenus) end
if true then Tic.INVENTORYSCREEN = ScreenMenus end


-- trace(print("hello"))
Text01 = CText{screenx = 65, screeny = 30, text = "cozy world", fixed = false, small = false, shadow = true, case = Names.CASECAMEL, marginlf = 2}
-- trace(CText{text = "hello", fixed = false, small = false}.screenh)
Text02 = CText{screenx = 65, screeny = 38, text = "Cozy", fixed = false, small = true, colorinside = 5}
Text03 = CText{screenx = 65, screeny = 50, text = "Cozy", fixed = true, small = true, shadow = true}
-- trace(CText{text = "hello", fixed = false, small = false, shadow = true}.screenh)
-- exit()


--
-- Places
--
if false then -- generate places -- TODO move under CPlaces

CPlace.PLACECOUNT = 10 -- default number of generated places
CPlace.PLACEKINDS = {  -- TODO val can contain parameters such as percent etc
    [CPlaceHouseAnim] = {},
    [CPlaceHouseIdle] = {},
    [CPlaceTowerAnim] = {},
    [CPlaceTowerIdle] = {},
    [CPlaceManorAnim] = {},
    [CPlaceManorIdle] = {},
    [CPlaceKirkeAnim] = {},
    [CPlaceKirkeIdle] = {},
    [CPlaceWaterAnim] = {},
    [CPlaceWaterIdle] = {},
    [CPlaceStallAnim] = {},
    [CPlaceStallIdle] = {},
    [CPlaceTree0Anim] = {},
    [CPlaceTree0Idle] = {},
    [CPlaceTree1Anim] = {},
    [CPlaceTree1Idle] = {},
}

function CPlace:generateRandomWorldWindow(_count, _kinds) -- random count of places of kinds in world window
    _count = _count or CPlace.PLACECOUNT
    _kinds = _kinds or CPlace.PLACEKINDS
    for _ = 1, _count do
        local _kind = Tables:keyPickRandom(_kinds) -- random kind
        _entity = _kind()
        _entity:randomWorldWindow() -- random position
    end
end

function CPlace:generateRandomRegionWorldCount(_count, _kinds, _regionworld) -- random number of places of kinds in region world
    _count        = _count       or CPlace.PLACECOUNT
    _kinds        = _kinds       or CPlace.PLACEKINDS
    _regionworld  = _regionworld or CRegionWorld{}
    local _region = CRegion{
        lf = _regionworld.worldx + _regionworld.region.lf,
        rg = _regionworld.worldx + _regionworld.region.rg,
        up = _regionworld.worldy + _regionworld.region.up,
        dw = _regionworld.worldy + _regionworld.region.dw,
    }

    for _ = 1, _count do
        local _kind = Tables:keyPickRandom(_kinds) -- random kind
        while _kinds[_kind].percent and Nums:random(0, 100) >_kinds[_kind].percent do
            _kind = Tables:keyPickRandom(_kinds) -- choose another kind
        end
        _entity = _kind()
        _entity:randomRegionWorld(_region) -- random position
    end
end

function CPlace:generateRandomRegionWorldPercent(_percent, _kinds, _regionworld) -- random percent of places of kinds in region world
    _percent      = _percent     or 100
    _kinds        = _kinds       or CPlace.PLACEKINDS
    _regionworld  = _regionworld or CRegionWorld{}
    local _count  = math.sqrt(_regionworld.region:surface()) * _percent // 100
    CPlace:generateRandomRegionWorldCount(_count, _kinds, _regionworld)
end

RegionWorldTree0 = CRegionWorld{
    worldx = -20,
    worldy = -20,
    region = CRegion{
        lf = -20,
        rg = 20,
        up = -5,
        dw = 5,
    },    
}
CPlace:generateRandomRegionWorldPercent(
    100,
    {
        [CPlaceTree0Anim] = {},
        [CPlaceTree0Idle] = {},
        [CPlaceTree1Anim] = {},
        [CPlaceTree1Idle] = {},
    },
    RegionWorldTree0
)

RegionWorldTown0 = CRegionWorld{
    worldx = 25,
    worldy = 25,
    region = CRegion{
        lf = -15,
        rg = 15,
        up = -15,
        dw = 15,
    },
}
CPlace:generateRandomRegionWorldPercent(
    25,
    {
        [CPlaceHouseAnim] = {},
        [CPlaceHouseIdle] = {},
        [CPlaceTowerAnim] = {percent = 10,},
        [CPlaceTowerIdle] = {percent = 10,},
        [CPlaceWaterAnim] = {percent = 10,},
    },
    RegionWorldTown0
)
-- exit()

-- CPlace:generateRandomWorldWindow()
-- CPlace:generateRandomWorldWindow(nil, {
--     [CPlaceTree0Anim] = {},
--     [CPlaceTree0Idle] = {},
--     [CPlaceTree1Anim] = {},
--     [CPlaceTree1Idle] = {},
-- })
-- CPlace:generateRandomWorldWindow(nil, {
--     [CPlaceHouseAnim] = {},
--     [CPlaceHouseIdle] = {},
--     [CPlaceTowerAnim] = {},
--     [CPlaceTowerIdle] = {},
--     [CPlaceManorAnim] = {},
--     [CPlaceManorIdle] = {},
--     [CPlaceKirkeAnim] = {},
--     [CPlaceKirkeIdle] = {},
--     [CPlaceWaterAnim] = {},
--     [CPlaceWaterIdle] = {},
--     [CPlaceStallAnim] = {},
--     [CPlaceStallIdle] = {},
-- })

end -- generate places


--
-- Players
--
if true then
Truduk = CPlayerDwarf{
    name = "Truduk",
    classed = CPlayerDwarf,
    worldx = 0,
    worldy = 0,
    ["slots.head"] = CSlotHead{object = CClothesHatSmall{}},
}
Prinnn = CPlayerGnome{
    name = "Prinnn",
    classed = CPlayerGnome,
    worldx = 10,
    worldy = 0,
    coloreyesbg  = Tic.COLORRED,
    coloreyesfg  = Tic.COLORORANGE,
}
Kaptan = CPlayerMeduz{
    name = "Kaptan",
    classed = CPlayerMeduz,
    worldx = 20,
    worldy = 0,
    ["slots.head"] = CSlotHead{object = CClothesHatMedium{}},
    ["slots.handlf"] = CSlotHand{object = CObjectFlaskSmall{used = CObject.USEDHALF}},
    ["slots.handrg"] = CSlotHand{object = CObjectFlaskSmall{used = CObject.USEDNONE}},
    statmenact = 10,
}
Kaptan.slots.head.object.palettefg = {
    [CObject.HANDLE] = Tic.COLORKEY,
    [CObject.BORDER] = Tic.COLORPURPLE,
    [CObject.INSIDE] = Tic.COLORRED,
    [CObject.EFFECT] = Tic.COLORRED,
}
Kaptin = CPlayerMeduz{
    name = "Kaptin",
    classed = CPlayerMeduz,
    worldx = 30,
    worldy = 0,
    ["slots.head"] = CSlotHead{object = CClothesHatLarge{}},
    colorhairsbg = Tic.COLORBLUEL,
    colorhairsfg = Tic.COLORBLUEM,
    coloreyesbg  = Tic.COLORBLUEM,
    coloreyesfg  = Tic.COLORBLUEL,
    statmenact = 10,
}
Aegeon = CPlayerElvwe{
    name = "Aegeon",
    classed = CPlayerElvwe,
    worldx = 0,
    worldy = 20,
    colorshirt   = Tic.COLORGREENL,
    colorarmor   = Tic.COLORGREEND,
    colorpants   = Tic.COLORGREENM,
}
Nitcha = CPlayerDrowe{
    name = "Nitcha",
    classed = CPlayerDrowe,
    worldx = 10,
    worldy = 20,
    ["slots.head"] = CSlotHead{object = CClothesHatMedium{}},
    ["slots.handlf"] = CSlotHand{object = CObjectFlaskLarge{used = CObject.USEDHALF}},
    statmenact = 10,
}
Azarel = CPlayerAngel{
    name = "Azarel",
    classed = CPlayerAngel,
    worldx = 20,
    worldy = 20,
}
Zikkow = CPlayerTifel{
    name = "Zikkow",
    classed = CPlayerTifel,
    worldx = 30,
    worldy = 20,
    colorhairsbg = Tic.COLORGREENM,
    colorhairsfg = Tic.COLORGREEND,
    colorextra   = Tic.COLORGREYM,
    coloreyesbg  = Tic.COLORGREENM,
    coloreyesfg  = Tic.COLORGREENL,
}
Kaainn = CPlayerDemon{
    name = "Kaainn",
    classed = CPlayerDemon,
    worldx = 0,
    worldy = 30,
    colorhairsbg = Tic.COLORGREYL,
    colorhairsfg = Tic.COLORWHITE,
    coloreyesbg  = Tic.COLORBLUEM,
    coloreyesfg  = Tic.COLORBLUEL,
    size         = Tic.SIZEM,
    colorshirt   = Tic.COLORPURPLE,
    colorpants   = Tic.COLORRED,
}
Daemok = CPlayerDemon{
    name = "Daemok",
    classed = CPlayerDemon,
    worldx = 10,
    worldy = 30,
}
end

if false then
Sword = CWeaponSword{name = "swo_1"}
Flask = CObjectFlaskSmall{name = "fla_1"}

Globth = CPlayerGolth{name = "Globth",
    worldx = 30,
    ["slots.head"] = CSlotHead{object = CClothesHelmetMedium{}},
    ["slots.handrg"] = CSlotHand{object = CWeaponLance{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldMedium{name = "ecu_1"}},
    ["inventories.any"] = CInventoryAny{objects = {Sword, Flask}},
    statmenact = 10,
}
Globth.slots.head.object.palettefg = {
    [CObject.HANDLE] = Tic.COLORKEY,
    [CObject.BORDER] = Tic.COLORGREYL,
    [CObject.INSIDE] = Tic.COLORORANGE,
    [CObject.EFFECT] = Tic.COLORRED,
}


-- Globth:randomWorldWindow()
end
-- exit()


local _playerclass = CPlayerTifel
if false then
if true then
Walfie = _playerclass{classed = _playerclass,
    name = "Walfie",
    size = Tic.SIZES,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORPURPLE,
    worldx = 0,
    worldy = 0,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowSmall{}},
    ["slots.handlf"] = CSlotHand{object = CObjectFlaskSmall{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatSmall{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackSmall{}},
}
end
if true then
Welfie = _playerclass{classed = _playerclass,
    name = "Welfie",
    size = Tic.SIZEM,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORRED,
    worldx = 15,
    worldy = 0,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowMedium{}},
    ["slots.handlf"] = CSlotHand{object = CObjectFlaskMedium{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatMedium{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackMedium{}},
}
end
if true then
Wilfie = _playerclass{classed = _playerclass,
    name = "Wilfie",
    size = Tic.SIZEL,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORORANGE,
    worldx = 30,
    worldy = 0,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowLarge{}},
    ["slots.handlf"] = CSlotHand{object = CObjectFlaskLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackLarge{}},
}
end
--
if true then
Wolfie = _playerclass{classed = _playerclass,
    name = "Wolfie",
    size = Tic.SIZES,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREEND,
    worldx = 0,
    worldy = 20,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponSword{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldSmall{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetSmall{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackSmall{}},
}
end
if true then
Wulfie = _playerclass{classed = _playerclass,
    name = "Wulfie",
    size = Tic.SIZEM,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREENM,
    worldx = 15,
    worldy = 20,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponHammer{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldMedium{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetMedium{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackMedium{}},
}
end
if true then
Wylfie = _playerclass{classed = _playerclass,
    name = "Wylfie",
    size = Tic.SIZEL,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREENL,
    worldx = 30,
    worldy = 20,
    interactions = {10},
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponLance{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackLarge{}},
}
end
end
-- exit()

if false then
Oxboow = CPlayerGhost{classed = CPlayerGhost,
    name = "Oxboow",
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    spottingspot = true,
    spottinglock = true,
    hitbox = Classic.NIL,
    -- slots = Classic.NIL,
    ["slots.handrg"] = CSlotHand{object = CWeaponLance{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackLarge{}},
}
end


--
-- Weapons -- TESTING
--
-- WeaponMelee = CWeaponMelee{}


--
-- Sprites -- TESTING
--
SpriteSFX = CSpriteFGBoard{
    screenx = 30,
    screeny = 120,
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
SpriteHTG = CSpriteFG{
    sprite = 458,
    screenx = 30,
    screeny = 100,
}
SpriteBIS = CSpriteFGBoard{
    screenx = 30,
    screeny = 110,
    directives = Tic:boardDirectives(458, {
        [Tic.COLORBLUEL] = Tic.COLORKEY,
        [Tic.COLORGREENM] = Tic.COLORKEY,
        [Tic.COLORORANGE] = Tic.COLORKEY,
        [Tic.COLORRED] = Tic.COLORKEY,
    }),
}
SpriteWeapon = CSpriteFG{
    sprite = 388,
    screenx = 30,
    screeny = 100,
    -- rotate = 0, --CSprite.ROTATE270,
    -- flip = 0, --Tic.DIRXRG,
}
SpriteWeapon.rotate = 3
SpriteWeapon.flip = 0


--
-- Regions -- TESTING
--
Region = CRegion{
    lf = -10,
    rg = 10,
    up = -10,
    dw = 10,
}

--
-- Places -- TESTING
--
if false then
Tic.HITBOXDRAW = false
for _, _cplace in pairs({
    -- CPlaceTree0Anim,
    CPlaceTree0Idle,
    CPlaceTree1Anim,
    -- CPlaceTree1Idle,
    -- CPlaceHouseAnim,
    -- CPlaceHouseIdle,
    -- CPlaceTowerAnim,
    -- CPlaceTowerIdle,
    -- CPlaceManorAnim,
    -- CPlaceManorIdle,
    -- CPlaceKirkeAnim,
    -- CPlaceKirkeIdle,
    -- CPlaceWaterAnim,
    -- CPlaceWaterIdle,
    -- CPlaceStallAnim,
    -- CPlaceStallIdle,
    CPlaceMenh0Anim,
    CPlaceMenh0Idle,
    CPlaceMenh1Anim,
    CPlaceMenh1Idle,
    CPlaceDolm0Anim,
    CPlaceDolm0Idle,
    CPlaceDolm1Anim,
    CPlaceDolm1Idle,
    CPlaceCirk0Anim,
    CPlaceCirk0Idle,
    CPlaceCirk1Anim,
    CPlaceCirk1Idle,
    CPlaceRoad0Anim,
    CPlaceRoad0Idle,
    CPlaceRoad1Anim,
    CPlaceRoad1Idle,
}) do
    _cplace{
        worldx = Nums:random(-50, 50),
        worldy = Nums:random(-50, 50),
    }
end
end

function CPlace:generateRoad(_worldx0, _worldy0, _worldx1, _worldy1, _percent, _devx, _devy, _cplaces)
    _percent = _percent or 10
    _devx    = _devx or 0 -- apply random xy deviations if any
    _devy    = _devy or 0
    _cplaces = _cplaces or Tables:generate{ -- places classes to random pick
        [CPlaceRoad0Anim] = 1,
        [CPlaceRoad1Anim] = 1,
        [CPlaceRoad0Idle] = 4,
        [CPlaceRoad1Idle] = 4,
    }
    local _points = Nums:pointsPickPercent(Nums:pointsLine(_worldx0, _worldy0, _worldx1, _worldy1, true), _percent)
    Tables:keyRemoveNAt(_points, 1, 1) -- skip starting and ending positions
    Tables:keyRemoveNAt(_points, 1)
    for _, _point in ipairs(_points) do
        local _cplace = Tables:valPickRandom(_cplaces)
        _cplace{
            worldx = _point.x + Nums:random(Nums:neg(_devx), Nums:pos(_devx)),
            worldy = _point.y + Nums:random(Nums:neg(_devy), Nums:pos(_devy)),
        }
    end
end


if true then
House1 = CPlaceHouseAnim{
    name = "House1",
    worldx = -20,
    worldy = 10,
    -- hovered = true,
}
House2 = CPlaceHouseAnim{
    name = "House2",
    worldx = 30,
    worldy = 40,
}
Kirke1 = CPlaceKirkeAnim{
    name = "Kirke1",
    worldx = -20,
    worldy = 40,
}
-- CPlace:generateRoad(House1.worldx, House1.worldy, House2.worldx, House2.worldy, 15)
-- CPlace:generateRoad(House1.worldx, House1.worldy, Kirke1.worldx, Kirke1.worldy, 20)
-- CPlace:generateRoad(House2.worldx, House2.worldy, Kirke1.worldx, Kirke1.worldy, 10)
-- CPlace:generateRoad(House1.worldx, House1.worldy, House2.worldx, House2.worldy, 10, 5, 5, Tables:generate{
--     [CPlaceTree0Anim] = 4,
--     [CPlaceTree0Idle] = 1,
-- })
end

if false then
CPlaceMenh0Anim{worldx = -4, worldy = -10}
CPlaceMenh1Anim{worldx = 0 , worldy = -10}
CPlaceMenh0Idle{worldx = 10, worldy = -10}
CPlaceMenh1Idle{worldx = 14, worldy = -10}

CPlaceDolm0Anim{worldx = -4, worldy = -20}
CPlaceDolm1Anim{worldx = 0 , worldy = -20}
CPlaceDolm0Idle{worldx = 10, worldy = -20}
CPlaceDolm1Idle{worldx = 14, worldy = -20}

CPlaceCirk0Anim{worldx = -4, worldy = -30}
CPlaceCirk1Anim{worldx = 0 , worldy = -30}
CPlaceCirk0Idle{worldx = 10, worldy = -30}
CPlaceCirk1Idle{worldx = 14, worldy = -30}

CPlaceRoad0Anim{worldx = -4, worldy = -40}
CPlaceRoad1Anim{worldx = 0 , worldy = -40}
CPlaceRoad0Idle{worldx = 10, worldy = -40}
CPlaceRoad1Idle{worldx = 14, worldy = -40}
end

-- Tic.HITBOXDRAW  = true
-- Tic.BORDERSDRAW = true
-- Tic.VIEWDRAW    = true
-- Tic.MOVEDRAW    = true


--
-- Drawing
--
function Tic:draw()
    if true then
    Tic.inputsDo()

    Tic:screenDraw()

    Tic:drawLog()
    Tic:logPrint()

    -- WeaponMelee:draw()

    -- Text01:draw()
    -- Text02:draw()
    -- Text03:draw()

    -- SpriteSFX:draw()
    -- SpriteHTG:draw()
    -- SpriteBIS:draw()
    -- SpriteWeapon:draw()

    Tic:tick() -- [!] required in the draw function
    end
end

function Tic:drawLog()
    -- Tic:logWorld()
    -- Tic:logInventories()
    -- Tic:logScreens()
end

function Tic:logWorld()
    local _world = Tic:playerActual().world
    if not _world then return end

    local _kindnames = {}
    Tic:logAppend(_world.name, Tables:size(_world.entitieslocations.entities))
    for _, _entity in pairs(_world.entitieslocations.entities) do
        table.insert(_kindnames, _entity.kind.."\t".._entity.name)
    end
    table.sort(_kindnames)
    for _, _kindname in ipairs(_kindnames) do
        Tic:logAppend(_kindname)
    end
    Tic:logAppend()
end

function Tic:logInventories() -- [-] remove
    local _playeractual = Tic:playerActual()
    if not _playeractual then return end

    Tic:logAppend(_playeractual.name, _playeractual.statphymax, _playeractual.statmenmax, _playeractual.statpsymax)
    for _, _inventory in pairs(_playeractual.inventories) do
        Tic:logInventory(_inventory)
    end
    for _, _slot in pairs(_playeractual.slots) do
        Tic:logSlot(_slot)
    end
    Tic:logAppend()
end

function Tic:logInventory(_inventory, _indent)
    if not CInventory:isInventory(_inventory) then return end
    _indent = _indent or ""

    Tic:logAppend(_indent.._inventory.name, _inventory.kind, Tables:size(_inventory.objects).."/".._inventory.objectsmax)
    for _, _object in ipairs(_inventory.objects) do
        Tic:logAppend(_indent.." ", _object.kind, _object.name)
        if _object.inventory then Tic:logInventory(_object.inventory, _indent.."  ") end
    end
end

function Tic:logSlot(_slot)
    if not CSlot:isSlot(_slot) then return end
    Tic:logAppend(_slot.name, _slot.kind)
    local _object = _slot.object
    if _object then Tic:logAppend(" ", _object.kind, _object.name) end
end

function Tic:logScreens()
    Tic:logAppend("Screens", Tic.SCREENS.actindex, Tic.SCREENS.maxindex, Tic.INVENTORYSHOW)
    for _key, _screen in ipairs(Tic.SCREENS.acttable or {}) do
        Tic:logAppend(_key, _screen.kind, _screen.name)
    end
    Tic:logAppend()
end

function Tic:logRegion(_pfx, _region)
    Tic:logAppend(_pfx, "u:".._region.up, "d:".._region.dw, "l:".._region.lf, "r:".._region.rg)
end

function Tic:logEntity(_pfx, _entity)
    Tic:logAppend(_pfx, _entity.name, _entity.screenx, _entity.screeny)
end


function Tic:drawLine(_pointx0, _pointy0, _pointx1, _pointy1, _nobounds) -- TESTING
    local _points = Nums:pointsLine(_pointx0, _pointy0, _pointx1, _pointy1, _nobounds)
    Tic:drawPoints(_points)
end

function Tic:drawPoints(_points) -- TESTING
    for _, _point in ipairs(_points) do
        rect(_point.x, _point.y, 1, 1, Tic.COLORRED)
    end
end



-- END
return Tic
