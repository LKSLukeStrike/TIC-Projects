-- Tic object
-- Instance only once
-- 

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Classic = require("libraries/ext/Classic")                
local Nums    = require("libraries/lks/Nums")
local Tables  = require("libraries/lks/Tables")
local Names   = require("libraries/lks/Names")
local CCycler = require("libraries/lks/CCycler")                


--
-- Tic
--
local Tic = {}


-- Fonts sizes
Tic.FONTWL = 6 -- large font width
Tic.FONTWS = 4 -- small font width
Tic.FONTH  = 6 -- both fonts height

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
Tic.PLAYERPORTRAITWY = Tic.PLAYERINFOSWY + 25 -- player portrait window y position

-- Player Stats Window positions and sizes (hud)
Tic.PLAYERSTATSWW = 16 -- player stats window width
Tic.PLAYERSTATSWH = 16 -- player stats window height
Tic.PLAYERSTATSWX = Tic.PLAYERPORTRAITWX -- player stats window x position
Tic.PLAYERSTATSWY = Tic.PLAYERPORTRAITWY + 25 -- player stats window y position

-- Player State Window positions and sizes (hud)
Tic.PLAYERSTATEWW = 26 -- player state window width
Tic.PLAYERSTATEWH = 16 -- player state window height
Tic.PLAYERSTATEWX = Tic.PLAYERINFOSWX -- player state window x position
Tic.PLAYERSTATEWY = Tic.PLAYERSTATSWY + 25 -- player state window y position

-- Spotted Infos Window positions and sizes (hud)
Tic.SPOTTEDINFOSWW = 26 -- spotted infos window width
Tic.SPOTTEDINFOSWH = 16 -- spotted infos window height
Tic.SPOTTEDINFOSWX = ((Tic.WORLDWX - Tic.SPOTTEDINFOSWW) // 2) -- spotted infos window x position
Tic.SPOTTEDINFOSWY = Tic.WORLDWY -- spotted infos window y position

-- Spotted Portrait Window positions and sizes (hud)
Tic.SPOTTEDPORTRAITWW = 16 -- spotted portrait window width
Tic.SPOTTEDPORTRAITWH = 16 -- spotted portrait window height
Tic.SPOTTEDPORTRAITWX = ((Tic.WORLDWX - Tic.SPOTTEDPORTRAITWW) // 2) -- spotted portrait window x position
Tic.SPOTTEDPORTRAITWY = Tic.SPOTTEDINFOSWY + 25 -- spotted portrait window y position

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

-- Special palette colors that can be replaced
Tic.COLORKEY      = Tic.COLORBLACK -- transparent color
Tic.COLORARMOR    = Tic.COLORGREYD -- 4 colors for the bodies
Tic.COLORSHIRT    = Tic.COLORGREYM
Tic.COLORPANTS    = Tic.COLORGREYL
Tic.COLORHANDS    = Tic.COLORWHITE
Tic.COLORHAIRSFG  = Tic.COLORGREYD -- 4 colors for the heads
Tic.COLORHAIRSBG  = Tic.COLORGREYM
Tic.COLOREXTRA    = Tic.COLORGREYL
Tic.COLORSKIN     = Tic.COLORWHITE
Tic.COLOREYESFG   = Tic.COLORGREYD -- 4 colors for the eyes
Tic.COLOREYESBGUP = Tic.COLORGREYM
Tic.COLOREYESBGMD = Tic.COLORGREYL
Tic.COLOREYESBGDW = Tic.COLORWHITE
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
        offsetx = Nums:pos(Tic.OFFSETZERO),
        offsety = Nums:neg(Tic.OFFSETLINE),
        screenx = nil, -- double line
        screeny = 0,
        dirx = nil,
        diry = Tic.DIRYUP,
    },
    [Tic.DIR045] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 0,
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYUP,
    },
    [Tic.DIR090] = {
        offsetx = Nums:pos(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 1,
        screeny = nil, -- double line
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYMD,
    },
    [Tic.DIR135] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 1,
        dirx = Tic.DIRXRG,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR180] = {
        offsetx = Nums:pos(Tic.OFFSETZERO),
        offsety = Nums:pos(Tic.OFFSETLINE),
        screenx = nil, -- double line
        screeny = 0,
        dirx = nil,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR225] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 1,
        dirx = Tic.DIRXLF,
        diry = Tic.DIRYDW,
    },
    [Tic.DIR270] = {
        offsetx = Nums:neg(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 0,
        screeny = nil, -- double line
        dirx = Tic.DIRXLF,
        diry = Tic.DIRYMD,
    },
    [Tic.DIR315] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 0,
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

Tic.FREQUENCE0000 = 0000 -- frequences -- each 0 second
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
Tic.FUNCTIONPLAYERPREV       = function() Tic:playerPrev() end
Tic.FUNCTIONPLAYERNEXT       = function() Tic:playerNext() end
Tic.FUNCTIONPLAYERDETACH     = function() Tic:playerDetach() end
Tic.FUNCTIONPLAYERONLY       = function() Tic:playerToggleOnly() end
Tic.FUNCTIONSTATEPREV        = function() Tic:statePrev() end
Tic.FUNCTIONSTATENEXT        = function() Tic:stateNext() end
Tic.FUNCTIONTOGGLEWORK       = function() Tic:toggleWork() end
Tic.FUNCTIONTOGGLEKNEEL      = function() Tic:toggleKneel() end
Tic.FUNCTIONTOGGLESLEEP      = function() Tic:toggleSleep() end
Tic.FUNCTIONMOVEDIRECTION000 = function() Tic:moveDirection000() end
Tic.FUNCTIONMOVEDIRECTION045 = function() Tic:moveDirection045() end
Tic.FUNCTIONMOVEDIRECTION090 = function() Tic:moveDirection090() end
Tic.FUNCTIONMOVEDIRECTION135 = function() Tic:moveDirection135() end
Tic.FUNCTIONMOVEDIRECTION180 = function() Tic:moveDirection180() end
Tic.FUNCTIONMOVEDIRECTION225 = function() Tic:moveDirection225() end
Tic.FUNCTIONMOVEDIRECTION270 = function() Tic:moveDirection270() end
Tic.FUNCTIONMOVEDIRECTION315 = function() Tic:moveDirection315() end
Tic.FUNCTIONSTATPHYACT       = function() Tic:statPhyAct() end
Tic.FUNCTIONSTATMENACT       = function() Tic:statMenAct() end
Tic.FUNCTIONSTATPSYACT       = function() Tic:statPsyAct() end
Tic.FUNCTIONBIOMENEXT        = function() Tic:biomeNext() end
Tic.FUNCTIONTOGGLEHITBOX     = function() Tic:toggleHitbox() end
Tic.FUNCTIONTOGGLESPOTTED    = function() Tic:toggleSpotting() end
Tic.FUNCTIONTOGGLEBORDERS    = function() Tic:toggleBorders() end
Tic.FUNCTIONTOGGLEDIRS       = function() Tic:toggleDirs() end
Tic.FUNCTIONTOGGLEVIEW       = function() Tic:toggleView() end
Tic.FUNCTIONTOGGLEMIND       = function() Tic:toggleMind() end
Tic.FUNCTIONTOGGLEMOVE       = function() Tic:toggleMove() end
Tic.FUNCTIONSCALENEXT        = function() Tic:scaleNext() end
Tic.FUNCTIONSCREENNEXT       = function() Tic:screenNext() end

-- Keys to Functions -- per screen
Tic.KEYSFUNCTIONSINTRO = {
    [Tic.KEY_ANY]          = Tic.FUNCTIONSCREENNEXT,
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
    [Tic.KEY_D]            = Tic.FUNCTIONTOGGLEDIRS,
    [Tic.KEY_H]            = Tic.FUNCTIONTOGGLEHITBOX,
    [Tic.KEY_M]            = Tic.FUNCTIONSTATMENACT,
    [Tic.KEY_O]            = Tic.FUNCTIONPLAYERONLY,
    [Tic.KEY_P]            = Tic.FUNCTIONSTATPHYACT,
    [Tic.KEY_Q]            = Tic.FUNCTIONTOGGLEBORDERS,
    [Tic.KEY_R]            = Tic.FUNCTIONTOGGLEMIND,
    [Tic.KEY_S]            = Tic.FUNCTIONTOGGLESPOTTED,
    [Tic.KEY_V]            = Tic.FUNCTIONTOGGLEVIEW,
    [Tic.KEY_X]            = Tic.FUNCTIONTOGGLEMOVE,
    [Tic.KEY_Y]            = Tic.FUNCTIONSTATPSYACT,
    [Tic.KEY_Z]            = Tic.FUNCTIONSCALENEXT,
    [Tic.KEY_SPACE]        = Tic.FUNCTIONSCREENNEXT,
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
Tic.MOUSE          = {
    screenx = 0,
    screeny = 0,
    clicklf = false,
    clickmd = false,
    clickrg = false,
    scrollx = 0,
    scrolly = 0,
}

function Tic:mouseInput() -- set the mouse inputs in a table
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
    return _result -- not useful
end

function Tic:mouseCursor() -- set the mouse cursor sprite
    poke(Tic.MOUSECURSOR, Tic.MOUSESPRITE + Tic.MOUSEDIRX)
end

function Tic:mouseHandleInput() -- set the mouse cursor sprite
    Tic:mouseInput()
    Tic:mouseCursor()
end


-- Buttons System -- handle buttons stack
Tic.BUTTONCLICKLF = "clicklf" -- buttons function keys
Tic.BUTTONCLICKMD = "clickmd"
Tic.BUTTONCLICKRG = "clickrg"
Tic.BUTTONSCROLLX = "scrollx"
Tic.BUTTONSCROLLY = "scrolly"
Tic.BUTTONS = {}

function Tic:buttonsHandleInput()
    for _, _button in ipairs(Tic.BUTTONS) do -- handle input functions
        _button:deactivate()

        if _button:activable() then -- check if a button is active and hovered
            if _button:region():hasInsidePoint(Tic.MOUSE.screenx + Tic.MOUSEOFFSETX, Tic.MOUSE.screeny + Tic.MOUSEOFFSETY) then
                local _functionsactived = _button:functionsActived()
                if Tables:size(_functionsactived) == 0 then -- just hover
                    _button.hovered = true
                else -- or activate
                    _button:activate()
                    Tic:inputsInsertFunctions(_functionsactived)
                end
            end
        else -- disable all functions related to hidden/disabled buttons
            Tic:inputsRemoveFunctions(_button:functionsDefined())
        end
    end

    for _, _function in ipairs(Tic.FUNCTIONS) do -- feedback functions to buttons
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

function Tic:screenActual() -- actual screen in the stack
    return Tic.SCREENS.actvalue
end

function Tic:screenAppend(_screen) -- append a screen to the stack
    if not _screen then return end -- mandatory
    return Tic.SCREENS:insert(_screen)
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


-- Directions System -- move to 8 directions depending on stattious
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
function Tic:statPhyAct(_character)
    local _stat = "statphyact"
    Tic:statAct(_stat, _character)
end

function Tic:statMenAct(_character)
    local _stat = "statmenact"
    Tic:statAct(_stat, _character)
end

function Tic:statPsyAct(_character)
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
Tic.DRAWHITBOX = false

function Tic:toggleHitbox()
	Tic.DRAWHITBOX = Nums:toggleTF(Tic.DRAWHITBOX)
end


-- Spotting System -- toggle spotting draw/lock
function Tic:toggleSpotting(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then
        Tic:toggleLockSpotting(_character)
    else
        Tic:toggleDrawSpotting(_character)
    end
end

function Tic:toggleDrawSpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	_character:toggleDrawSpotting()
end

function Tic:toggleLockSpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	_character:toggleLockSpotting()
end

function Tic:isDrawSpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return false end
	return _character:isDrawSpotting()
end

function Tic:isLockSpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return false end
	return _character:isLockSpotting()
end

function Tic:entitySpotting(_character)
    _character = _character or Tic:playerActual()
    if not _character then return nil end
	return _character:entitySpotting()
end


-- Borders System -- toggle borders display
Tic.DRAWBORDERS = false

function Tic:toggleBorders()
	Tic.DRAWBORDERS = Nums:toggleTF(Tic.DRAWBORDERS)
end


-- Dirs System -- toggle dirs display
Tic.DRAWDIRS = false

function Tic:toggleDirs()
	Tic.DRAWDIRS = Nums:toggleTF(Tic.DRAWDIRS)
end


-- View System -- toggle view display
Tic.DRAWVIEW = false

function Tic:toggleView()
	Tic.DRAWVIEW = Nums:toggleTF(Tic.DRAWVIEW)
end


-- Mind System -- toggle mind display
Tic.DRAWMIND = false

function Tic:toggleMind()
	Tic.DRAWMIND = Nums:toggleTF(Tic.DRAWMIND)
end


-- Move System -- toggle move display
Tic.DRAWMOVE = false

function Tic:toggleMove()
	Tic.DRAWMOVE = Nums:toggleTF(Tic.DRAWMOVE)
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

function Tic:logAppend(...) -- add item to the log buffer
    local _args = {...}
    local _item = ""
    for _, _val in ipairs(_args) do
        _item = _item..Tic:val2string(_val).." "
    end
    Tables:valInsert(Tic.LOGBUFFER, _item, true)
end

function Tic:logRecordActive(_active) -- set log record active on/off
    Tic.LOGRECORDACTIVE = _active
end

function Tic:logRecord(...) -- add item to the log record
    if not Tic.LOGRECORDACTIVE then return end -- log record not active -- do nothing
    local _args = {...}
    local _item = ""
    for _, _val in ipairs(_args) do
        _item = _item..Tic:val2string(_val).." "
    end
    Tables:valInsert(Tic.LOGRECORD, _item, true)
end

function Tic:logPrint() -- print the log buffer increased by the log record then clear it
    for _, _item in ipairs(Tic.LOGRECORD) do
        Tables:valInsert(Tic.LOGBUFFER, _item, true)
    end
    for _line, _item in ipairs(Tic.LOGBUFFER) do
        _line = _line - 1 -- line start from 0
        Tic:print(0, _line * Tic.SPRITESIZE, _item) -- one item per "line"
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

function Tic:boardDirectives(_sprite) -- returns the directive of a sprite
    if not _sprite then return end -- mandatory
    local _result = {}
    for _y = 0, 7 do
        for _x = 0, 7 do
            local _color = peek4(((Tic.SPRITEBANK + (32 * _sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x))
            if not (_color == Tic.COLORKEY) then -- avoid empty pixels
                table.insert(_result, {
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
local CSprite = Classic:extend() -- generic sprites
CSprite.SPRITEBANK = 0
CSprite.SCALE01    = 01 -- sprites scales
CSprite.SCALE02    = 02
CSprite.SCALE03    = 03
CSprite.SCALE04    = 04
CSprite.FRAMEOF    = 16 -- sprites frames offset multiplier
CSprite.FRAME00    = 00 -- sprites frames -- [!] start at 0, used to compute the offset
CSprite.FRAME01    = 01
CSprite.ROTATE000  = 0 -- sprite rotations
CSprite.ROTATE090  = 1
CSprite.ROTATE180  = 2
CSprite.ROTATE270  = 3
function CSprite:new(_argt)
    CSprite.super.new(self, _argt)
    self.spritebank = CSprite.SPRITEBANK
    self.sprite    = self.spritebank -- initial sprite number
    self.screenx   = 0 -- screen positions
    self.screeny   = 0
    self.frame     = CSprite.FRAME00
    self.colorkey  = Tic.COLORKEY -- default colorkey
    self.scale     = CSprite.SCALE01 -- default scale
    self.flip      = Tic.DIRXLF -- all sprites are dir x left by default
    self.rotate    = CSprite.ROTATE000 -- no rotation by default
    self.width     = 1 -- sprite 1x1 by default
    self.height    = 1
    self.palette   = {} -- empty by default, can be filled later
    self:argt(_argt) -- override if any
end

function CSprite:draw() -- draw a sprite -- SCREEN -- DEFAULT
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


--
-- CSpriteBG
--
local CSpriteBG = CSprite:extend() -- bg sprites aka tic tiles
CSpriteBG.SPRITEBANK  = 0
CSpriteBG.SIGNSBANK   = 0  -- signs
CSpriteBG.SIGNQSTMRK  = CSpriteBG.SIGNSBANK + 00 -- question mark
CSpriteBG.SIGNINTMRK  = CSpriteBG.SIGNSBANK + 01 -- interact mark
CSpriteBG.SIGNBORSQU  = CSpriteBG.SIGNSBANK + 02 -- borders square
CSpriteBG.SIGNSPOSQU  = CSpriteBG.SIGNSBANK + 03 -- spotted square
CSpriteBG.SIGNCROSQU  = CSpriteBG.SIGNSBANK + 04 -- crossed square
CSpriteBG.SIGNDOTSQU  = CSpriteBG.SIGNSBANK + 05 -- dot square
CSpriteBG.SIGNARROWD  = CSpriteBG.SIGNSBANK + 06 -- diag arrow
CSpriteBG.SIGNARROWL  = CSpriteBG.SIGNSBANK + 07 -- line arrow
CSpriteBG.SIGNCENTER  = CSpriteBG.SIGNSBANK + 08 -- center dot
CSpriteBG.SIGNPLAYER  = CSpriteBG.SIGNSBANK + 09 -- player sprite
CSpriteBG.SIGNSPOTIT  = CSpriteBG.SIGNSBANK + 10 -- spotit sprite
CSpriteBG.SIGNLOCKIT  = CSpriteBG.SIGNSBANK + 11 -- lockit sprite
CSpriteBG.BUILDBANK   = 16 -- buildings
CSpriteBG.PLACEHOUSE  = CSpriteBG.BUILDBANK + 0
CSpriteBG.PLACETOWER  = CSpriteBG.BUILDBANK + 1
CSpriteBG.PLACEMANOR  = CSpriteBG.BUILDBANK + 2
CSpriteBG.PLACEKIRKE  = CSpriteBG.BUILDBANK + 3
CSpriteBG.STANDBANK   = 32 -- stands
CSpriteBG.PLACEWATER  = CSpriteBG.STANDBANK + 0
CSpriteBG.PLACESTALL  = CSpriteBG.STANDBANK + 1
CSpriteBG.TREESBANK   = 48 -- trees
CSpriteBG.PLACETREE0  = CSpriteBG.TREESBANK + 0
CSpriteBG.PLACETREE1  = CSpriteBG.TREESBANK + 1
CSpriteBG.MENHRBANK   = 64 -- menhirs
CSpriteBG.PLACEMENH0  = CSpriteBG.MENHRBANK + 0
CSpriteBG.PLACEMENH1  = CSpriteBG.MENHRBANK + 1
CSpriteBG.DOLMNBANK   = 80 -- dolmens
CSpriteBG.PLACEDOLM0  = CSpriteBG.DOLMNBANK + 0
CSpriteBG.PLACEDOLM1  = CSpriteBG.DOLMNBANK + 1
CSpriteBG.CIRKLBANK   = 96 -- circles
CSpriteBG.PLACECIRK0  = CSpriteBG.CIRKLBANK + 0
CSpriteBG.PLACECIRK1  = CSpriteBG.CIRKLBANK + 1
CSpriteBG.ROADSBANK   = 112 -- roads
CSpriteBG.PLACEROAD0  = CSpriteBG.ROADSBANK + 0
CSpriteBG.PLACEROAD1  = CSpriteBG.ROADSBANK + 1
function CSpriteBG:new(_argt) -- FIXME can be removed ?
    CSpriteBG.super.new(self, _argt)
    self:argt(_argt) -- override if any
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
CSpriteFG.STATUSBANK  = 336 -- status types
CSpriteFG.STATUSEMPTY = CSpriteFG.SPRITEEMPTY
CSpriteFG.STATUSSLEEP = CSpriteFG.STATUSBANK + 0
CSpriteFG.STATUSWOUND = CSpriteFG.STATUSBANK + 1
CSpriteFG.STATUSDEATH = CSpriteFG.STATUSBANK + 2
function CSpriteFG:new(_argt)
    CSpriteFG.super.new(self, _argt)
    self.spritebank = CSpriteFG.SPRITEBANK
    self.sprite = self.spritebank
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGEmpty
--
local CSpriteFGEmpty = CSpriteFG:extend() -- empty sprites
function CSpriteFGEmpty:new(_argt)
    CSpriteFGEmpty.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEEMPTY
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGPixel
--
local CSpriteFGPixel = CSpriteFG:extend() -- pixel sprites
function CSpriteFGPixel:new(_argt)
    CSpriteFGPixel.super.new(self, _argt)
    self.sprite = CSpriteFG.SPRITEPIXEL
    self:argt(_argt) -- override if any
end


--
-- CSpriteFGBoard
--
local CSpriteFGBoard = CSpriteFG:extend() -- board sprites
function CSpriteFGBoard:new(_argt)
    CSpriteFGBoard.super.new(self, _argt)
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
local CAnimation = Classic:extend() -- generic palette animation for entities
function CAnimation:new(_argt)
    CAnimation.super.new(self, _argt)
    self.frequence = Tic.FREQUENCE0060
    self.percent0  = 0.5
    self.palette0  = {}
    self.palette1  = {}
    self:argt(_argt) -- override if any
end


--
-- CRegion
--
local CRegion = Classic:extend() -- generic region -- -lf +rg -up +dw around a point
Classic.KINDREGION = "Region" -- Region kind
Classic.NAMEREGION = "Region" -- Region name
function CRegion:new(_argt)
    CRegion.super.new(self, _argt)
    self.kind = Classic.KINDREGION
    self.name = Classic.NAMEREGION
    self.lf = Nums.MININTEGER -- negative
    self.rg = Nums.MAXINTEGER -- positive
    self.up = Nums.MININTEGER -- negative
    self.dw = Nums.MAXINTEGER -- positive
    self:argt(_argt) -- override if any
end

function CRegion:string() -- region as a string
    return Nums:roundint(self.lf)..":"..Nums:roundint(self.rg), Nums:roundint(self.up)..":"..Nums:roundint(self.dw)
end

function CRegion:borderW(_scale) -- border width
    _scale = _scale or CSprite.SCALE01
    return self.rg - self.lf + (1 * _scale)
end

function CRegion:borderH(_scale) -- border height
    _scale = _scale or CSprite.SCALE01
    return self.dw - self.up + (1 * _scale)
end

function CRegion:surface() -- region surface
    return self:borderW() * self:borderH()
end

function CRegion:offsetXY(_offsetx, _offsety) -- offset a region by x y -- TODO modify the region inplace ?
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

function CRegion:drawBorderScreenXY(_screenx, _screeny, _drawcolor) -- draw border of a region around screen xy
    _screenx   = _screenx or Tic.SCREENX
    _screeny   = _screeny or Tic.SCREENY
    _drawcolor = _drawcolor or Tic.COLORGREYL
    local _borderx = _screenx + self.lf -- dont forget they are negatives
    local _bordery = _screeny + self.up
    local _borderw = self:borderW()
    local _borderh = self:borderH()
    rectb(_borderx, _bordery,
        _borderw, _borderh,
        _drawcolor
    )
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


--
-- CHitbox
--
local CHitbox = Classic:extend() -- generic hitbox region -- FIXME could be a region ?
CHitbox.REGIONLF = 0 -- hitbox region sizes
CHitbox.REGIONRG = 7
CHitbox.REGIONUP = 0
CHitbox.REGIONDW = 7
function CHitbox:new(_argt)
    CHitbox.super.new(self, _argt)
    self.screenx  = 0 -- positions
    self.screeny  = 0
	self.dirx     = Tic.DIRXLF
    self.scale    = CSprite.SCALE01
    self.hitto    = {} -- entities hit to -- table
    self.hitby    = {} -- entities hit by -- table
    self.region   = CRegion{
        lf = CHitbox.REGIONLF,
        rg = CHitbox.REGIONRG,
        up = CHitbox.REGIONUP,
        dw = CHitbox.REGIONDW,
    }
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

function CHitbox:draw()
	local _drawcolor = Tic.COLORYELLOW
    _drawcolor = (Tables:size(self.hitto) > 0) and Tic.COLORORANGE or _drawcolor
    _drawcolor = (Tables:size(self.hitby) > 0) and Tic.COLORRED    or _drawcolor
	local _regionscreen = self:regionScreen()

    rectb(
		_regionscreen.lf,
		_regionscreen.up,
		_regionscreen:borderW(self.scale),
		_regionscreen:borderH(self.scale),
		_drawcolor
	)
end

function CHitbox:regionOffsets() -- screen coordinates of its region -- depends on dirx and scale
    local _result  = CRegion()
    local _widthlf = (self.region.lf - CHitbox.REGIONLF) -- |lf|md|rg| widths
    local _widthmd = (self.region.rg - self.region.lf )
    local _widthrg = (CHitbox.REGIONRG - self.region.rg)

    _result.lf = (self.dirx == Tic.DIRXLF)
        and _widthlf * self.scale
        or  _widthrg * self.scale
    _result.rg = _result.lf + (_widthmd * self.scale)
    _result.up = self.region.up * self.scale
    _result.dw = self.region.dw * self.scale
    return _result
end

function CHitbox:regionScreen() -- screen coordinates of its region -- depends on dirx and scale
    local _regionoffsets = self:regionOffsets()
    return _regionoffsets:offsetXY(self.screenx, self.screeny)
end


--
-- CLocations
--
local CLocations = Classic:extend() -- generic entities locations -- {worldy {worldx {entity = entity}}} -- FIXME change entity by true ?
function CLocations:new(_argt)
    CLocations.super.new(self, _argt)
    self.locations = {}
    self:argt(_argt) -- override if any
end

function CLocations:entities(_locations) -- entities in locations
    if not _locations then return end -- mandatory
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
local CEntitiesLocations = Classic:extend() -- generic locations for entities
function CEntitiesLocations:new(_argt)
    CEntitiesLocations.super.new(self, _argt)
    self.entities  = {} -- record each entity -- has to have worldx and worldy attributes
    self.locations = CLocations{} -- record each entity locations
    self:argt(_argt) -- override if any
end

function CEntitiesLocations:exists(_entity) -- if exists an entity
    if not _entity then return false end -- mandatory
    return self.entities[_entity]
end

function CEntitiesLocations:appendEntity(_entity) -- add a new entity
    if not _entity then return end -- mandatory
    if self:exists(_entity) then return end -- avoid doublons
    self.entities[_entity] = true
    self.locations:appendEntity(_entity)
end

function CEntitiesLocations:deleteEntity(_entity) -- delete an entity
    if not _entity then return end -- mandatory
    if not self:exists(_entity) then return end -- doesnt exist
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
local CEntity = Classic:extend() -- generic entities like worlds, places, objects, characters, cameras ...
Classic.KINDENTITY = "Entity" -- Entity kind
Classic.NAMEENTITY = "Entity" -- Entity name
Classic.NAMEEMPTY  = "Empty"  -- Empty name
Classic.NAMEDEAD   = "Dead"   -- Dead name
Classic.NAMESILENT = "Silent" -- Silent name
Classic.NAMELIVING = "Living" -- Living name
Classic.NAMEANIMED = "Animed" -- Animed name
Classic.NAMEFITFUL = "Fitful" -- Fitful name
CEntity.WORLDX = 0
CEntity.WORLDY = 0
function CEntity:new(_argt)
    CEntity.super.new(self, _argt)
    self.kind = Classic.KINDENTITY
    self.name = Classic.NAMEENTITY
    self.world  = nil -- parent world if any
    self.worldx = CEntity.WORLDX -- world positions
    self.worldy = CEntity.WORLDY
    self.discovered = false -- discovered by the player ?
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


--
-- CWorld
--
local CWorld = CEntity:extend() -- generic world that contains entities
Classic.KINDWORLD = "World" -- World kind
Classic.NAMEWORLD = "World" -- World name
function CWorld:new(_argt)
    CWorld.super.new(self, _argt)
    self.kind = Classic.KINDWORLD
    self.name = Classic.NAMEWORLD
    self.region = CRegion() -- world boundaries
    self.entitieslocations = CEntitiesLocations{} -- record world entities and their locations
    self:argt(_argt) -- override if any
end
-- CWorld instance
local World = CWorld{}

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
local CCamera = CEntity:extend() -- camera
Classic.KINDCAMERA = "Camera" -- Camera kind
Classic.NAMECAMERA = "Camera" -- Camera name
CCamera.RANGEX = Tic.WORLDWW / 2
CCamera.RANGEY = Tic.WORLDWH / 2
function CCamera:new(_argt)
    CCamera.super.new(self, _argt)
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
local CEntityDrawable = CEntity:extend() -- generic entities with a sprite representation
Classic.KINDDRAWABLE = "Drawable" -- Drawable kind
Classic.NAMEDRAWABLE = "Drawable" -- Drawable name
function CEntityDrawable:new(_argt)
    CEntityDrawable.super.new(self, _argt)
    self.kind = Classic.KINDDRAWABLE
    self.name = Classic.NAMEDRAWABLE
    self.world       = World
    self.sprite      = CSpriteFG.SPRITEEMPTY
    self.screenx     = 0 -- screen positions -- used to draw the sprite
    self.screeny     = 0
    self.dirx        = Nums:random01() -- random flip lf/rg
    self.scale       = CSprite.SCALE01
    self.animations  = nil -- override if any
    self.spotted     = false -- use spotted to draw a border
    self.hitbox      = nil -- hitbox region if any
    self.drawborders = false -- draw behaviour
    self.drawhitbox  = false
    self.drawfade    = false
   self:argt(_argt) -- override if any
    self.world:appendEntity(self) -- append itself to the world
end

function CEntityDrawable:draw() -- default draw for drawable entities -- override if any
    local _tick00      = Tic.TICK00.actvalue
    local _palette     = (self.drawfade)
        and Tables:merge(self.palette, self.palettefade)
        or  Tables:merge(self.palette, {})

    for _, _animation in pairs(self.animations or {}) do -- animate -- FIXME something wrong in frequences
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
    _musprite.palette = _palette
    _musprite:draw()

    self:drawSpotted()
    self:drawBorders()
    self:drawHitbox()
end

function CEntityDrawable:drawSpotted() -- draw spotted if any
    if not self.spotted then return end -- nothing to draw
    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNSPOSQU
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE,}
    _musprite:draw()
end

function CEntityDrawable:drawBorders() -- draw borders if any
    self.drawborders = Tic.DRAWBORDERS -- use Tic as master
    if not self.drawborders then return end -- nothing to draw
    local _musprite = CSpriteBG() -- multi usage unique sprite
    _musprite.sprite  = CSpriteBG.SIGNBORSQU
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.palette = {[Tic.COLORGREYM] = Tic.COLORGREYL,}
    _musprite:draw()
end

function CEntityDrawable:drawHitbox() -- draw hitbox if any
    self.drawhitbox = Tic.DRAWHITBOX -- use Tic as master
    if not self.drawhitbox or not self.hitbox then return end -- nothing to draw
    self.hitbox.screenx  = self.screenx
    self.hitbox.screeny  = self.screeny
    self.hitbox.dirx     = self.dirx
    self.hitbox.scale    = self.scale
    self.hitbox:draw()
end

function CEntityDrawable:drawRelativeToEntity(_entity) -- draw an entity relative to an other one in world positions
    if not _entity then return end -- mandatory
    if not self.discovered then return end -- draw only discovered entities
	local _offsetx = self.worldx - _entity.worldx
	local _offsety = self.worldy - _entity.worldy
	self:save{"screenx", "screeny",}
	self.screenx = Tic.WORLDWX2 + _offsetx - (Tic.SPRITESIZE2 * self.scale)
	self.screeny = Tic.WORLDWY2 + _offsety - (Tic.SPRITESIZE2 * self.scale)
	self:draw()
	self:load()
end

function CEntityDrawable:worldRegion() -- return its own region in world
    return CRegion{
        lf = self.worldx,
        up = self.worldy,
        rg = self.worldx + (Tic.SPRITESIZE * self.scale),
        dw = self.worldy + (Tic.SPRITESIZE * self.scale), 
    }
end

function CEntityDrawable:hitboxAttachTo(_entities) -- attach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox then self.hitbox:hittoAppend(_entity) end
        if _entity.hitbox then _entity.hitbox:hitbyAppend(self) end
    end
end

function CEntityDrawable:hitboxDetachTo(_entities) -- detach hitto entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox then self.hitbox:hittoDelete(_entity) end
        if _entity.hitbox then _entity.hitbox:hitbyDelete(self) end
    end
end

function CEntityDrawable:hitboxDetachBy(_entities) -- detach hitby entities
    for _entity, _ in pairs(_entities or {}) do
        if self.hitbox then self.hitbox:hitbyDelete(_entity) end
        if _entity.hitbox then _entity.hitbox:hittoDelete(self) end
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


--
-- CPlace
--
local CPlace = CEntityDrawable:extend() -- places
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
    self.kind = Classic.KINDPLACE
    self.name = Classic.NAMEPLACE
    self.hitbox = CHitbox()
    self:argt(_argt) -- override if any
end


--
-- CPlaceBuild
--
local CPlaceBuild = CPlace:extend() -- builds
Classic.KINDBUILD = "Build" -- Build kind
Classic.NAMEBUILD = "Build" -- Build name
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
    self.kind = Classic.KINDBUILD
    self.name = Classic.NAMEANIMED
    self.hitbox.region.lf = 2
    self.hitbox.region.rg = 4
    self.hitbox.region.up = 5
    self.hitbox.region.dw = 7
    self.palettefade = CPlaceBuild.PALETTEFADE
    self:argt(_argt) -- override if any
end


--
-- CPlaceHouse
--
local CPlaceHouse = CPlaceBuild:extend() -- houses
Classic.KINDHOUSE = "House" -- House kind
function CPlaceHouse:new(_argt)
    CPlaceHouse.super.new(self, _argt)
    self.kind = Classic.KINDHOUSE
    self.sprite      = CSpriteBG.PLACEHOUSE
    self:argt(_argt) -- override if any
end

local CPlaceHouseAnim = CPlaceHouse:extend() -- anim houses
function CPlaceHouseAnim:new(_argt)
    CPlaceHouseAnim.super.new(self, _argt)
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

local CPlaceHouseIdle = CPlaceHouse:extend() -- idle houses
function CPlaceHouseIdle:new(_argt)
    CPlaceHouseIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceTower
--
local CPlaceTower = CPlaceBuild:extend() -- towers
Classic.KINDTOWER = "Tower" -- Tower kind
function CPlaceTower:new(_argt)
    CPlaceTower.super.new(self, _argt)
    self.kind = Classic.KINDTOWER
    self.sprite  = CSpriteBG.PLACETOWER
    self:argt(_argt) -- override if any
end

local CPlaceTowerAnim = CPlaceTower:extend() -- anim towers
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

local CPlaceTowerIdle = CPlaceTower:extend() -- idle towers
function CPlaceTowerIdle:new(_argt)
    CPlaceTowerIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceManor
--
local CPlaceManor = CPlaceBuild:extend() -- manors
Classic.KINDMANOR = "Manor" -- Manor kind
function CPlaceManor:new(_argt)
    CPlaceManor.super.new(self, _argt)
    self.kind = Classic.KINDMANOR
    self.sprite  = CSpriteBG.PLACEMANOR
    self.hitbox.region.lf = 1
    self:argt(_argt) -- override if any
end

local CPlaceManorAnim = CPlaceManor:extend() -- anim manors
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

local CPlaceManorIdle = CPlaceManor:extend() -- idle manors
function CPlaceManorIdle:new(_argt)
    CPlaceManorIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceKirke
--
local CPlaceKirke = CPlaceBuild:extend() -- kirkes
Classic.KINDKIRKE = "Kirke" -- Kirke kind
function CPlaceKirke:new(_argt)
    CPlaceKirke.super.new(self, _argt)
    self.kind = Classic.KINDKIRKE
    self.sprite  = CSpriteBG.PLACEKIRKE
    self.hitbox.region.lf = 1
    self:argt(_argt) -- override if any
end

local CPlaceKirkeAnim = CPlaceKirke:extend() -- anim kirkes
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

local CPlaceKirkeIdle = CPlaceKirke:extend() -- idle kirkes
function CPlaceKirkeIdle:new(_argt)
    CPlaceKirkeIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceWater
--
local CPlaceWater = CPlaceBuild:extend() -- waters
Classic.KINDWATER = "Water" -- Water kind
function CPlaceWater:new(_argt)
    CPlaceWater.super.new(self, _argt)
    self.kind = Classic.KINDWATER
    self.sprite  = CSpriteBG.PLACEWATER
    self.hitbox.region.lf = 1
    self.hitbox.region.rg = 4
    self:argt(_argt) -- override if any
end

local CPlaceWaterAnim = CPlaceWater:extend() -- anim waters
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

local CPlaceWaterIdle = CPlaceWater:extend() -- idle waters
function CPlaceWaterIdle:new(_argt)
    CPlaceWaterIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceStall
--
local CPlaceStall = CPlaceBuild:extend() -- stalls
Classic.KINDSTALL = "Stall" -- Stall kind
function CPlaceStall:new(_argt)
    CPlaceStall.super.new(self, _argt)
    self.kind = Classic.KINDSTALL
    self.sprite  = CSpriteBG.PLACESTALL
    self.hitbox.region.lf = 0
    self.hitbox.region.rg = 3
    self:argt(_argt) -- override if any
end

local CPlaceStallAnim = CPlaceStall:extend() -- anim stalls
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

local CPlaceStallIdle = CPlaceStall:extend() -- idle stalls
function CPlaceStallIdle:new(_argt)
    CPlaceStallIdle.super.new(self, _argt)
    self.name = Classic.NAMEEMPTY
    self.palette = CPlaceBuild.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- CPlaceTrees
--
local CPlaceTrees = CPlace:extend() -- trees
Classic.KINDTREES = "Trees" -- Trees kind
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
    self.kind = Classic.KINDTREES
    self.name = Classic.NAMELIVING
    self.hitbox = CHitbox{
        region = {
            lf = 2,
            rg = 4,
            up = 6,
            dw = 7,
        }
    }
    self.palettefade = CPlaceTrees.PALETTEFADE
    self:argt(_argt) -- override if any
end

local CPlaceTreesAnim = CPlaceTrees:extend() -- generic anim trees
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

local CPlaceTreesIdle = CPlaceTrees:extend() -- generic idle trees
function CPlaceTreesIdle:new(_argt)
    CPlaceTreesIdle.super.new(self, _argt)
    self.name = Classic.NAMEDEAD
    self.palette = CPlaceTrees.PALETTEIDLE
    self:argt(_argt) -- override if any
end

local CPlaceTree0Anim = CPlaceTreesAnim:extend() -- anim tree0
function CPlaceTree0Anim:new(_argt)
    CPlaceTree0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt) -- override if any
end

local CPlaceTree0Idle = CPlaceTreesIdle:extend() -- idle tree0
function CPlaceTree0Idle:new(_argt)
    CPlaceTree0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE0
    self:argt(_argt) -- override if any
end

local CPlaceTree1Anim = CPlaceTreesAnim:extend() -- anim tree1
function CPlaceTree1Anim:new(_argt)
    CPlaceTree1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt) -- override if any
end

local CPlaceTree1Idle = CPlaceTreesIdle:extend() -- idle tree1
function CPlaceTree1Idle:new(_argt)
    CPlaceTree1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACETREE1
    self:argt(_argt) -- override if any
end


--
-- CPlaceStone
--
local CPlaceStone = CPlace:extend() -- stone
Classic.KINDSTONE = "Stone" -- Stone kind
Classic.KINDMENHR = "Menhr" -- Menhr kind
Classic.KINDDOLMN = "Dolmn" -- Dolmn kind
Classic.KINDCIRKL = "Cirkl" -- Cirkl kind
Classic.KINDROADS = "Roads" -- Roads kind
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
    self.kind = Classic.KINDSTONE
    self.name = Classic.NAMEFITFUL
    self.hitbox = nil -- override if any
    self.palettefade = CPlaceStone.PALETTEFADE
    self:argt(_argt) -- override if any
end

local CPlaceStoneAnim = CPlaceStone:extend() -- generic anim stone -- TODO add magic
function CPlaceStoneAnim:new(_argt)
    CPlaceStoneAnim.super.new(self, _argt)
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

local CPlaceStoneIdle = CPlaceStone:extend() -- generic idle stone
function CPlaceStoneIdle:new(_argt)
    CPlaceStoneIdle.super.new(self, _argt)
    self.name = Classic.NAMESILENT
    self.palette = CPlaceStone.PALETTEIDLE
    self:argt(_argt) -- override if any
end


--
-- IStoneMenhr
--
local IStoneMenhr = CPlaceStone:extend() -- menhr implementation
IStoneMenhr.kind   = Classic.KINDMENHR
IStoneMenhr.hitbox = CHitbox{
    region = {
        lf = 2,
        rg = 4,
        up = 6,
        dw = 7,
    }
}

local CPlaceMenh0Anim = CPlaceStoneAnim:extend() -- anim menh0
function CPlaceMenh0Anim:new(_argt)
    CPlaceMenh0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt) -- override if any
    self:implementall(IStoneMenhr)
end

local CPlaceMenh0Idle = CPlaceStoneIdle:extend() -- idle menh0
function CPlaceMenh0Idle:new(_argt)
    CPlaceMenh0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH0
    self:argt(_argt) -- override if any
    self:implementall(IStoneMenhr)
end

local CPlaceMenh1Anim = CPlaceStoneAnim:extend() -- anim menh1
function CPlaceMenh1Anim:new(_argt)
    CPlaceMenh1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt) -- override if any
    self:implementall(IStoneMenhr)
end

local CPlaceMenh1Idle = CPlaceStoneIdle:extend() -- idle menh1
function CPlaceMenh1Idle:new(_argt)
    CPlaceMenh1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEMENH1
    self:argt(_argt) -- override if any
    self:implementall(IStoneMenhr)
end


--
-- IStoneDolmn
--
local IStoneDolmn = CPlaceStone:extend() -- dolmn implementation
IStoneDolmn.kind   = Classic.KINDDOLMN
IStoneDolmn.hitbox = CHitbox{
    region = {
        lf = 1,
        rg = 4,
        up = 6,
        dw = 7,
    }
}

local CPlaceDolm0Anim = CPlaceStoneAnim:extend() -- anim dolm0
function CPlaceDolm0Anim:new(_argt)
    CPlaceDolm0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt) -- override if any
    self:implementall(IStoneDolmn)
end

local CPlaceDolm0Idle = CPlaceStoneIdle:extend() -- idle dolm0
function CPlaceDolm0Idle:new(_argt)
    CPlaceDolm0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM0
    self:argt(_argt) -- override if any
    self:implementall(IStoneDolmn)
end

local CPlaceDolm1Anim = CPlaceStoneAnim:extend() -- anim dolm1
function CPlaceDolm1Anim:new(_argt)
    CPlaceDolm1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt) -- override if any
    self:implementall(IStoneDolmn)
end

local CPlaceDolm1Idle = CPlaceStoneIdle:extend() -- idle dolm1
function CPlaceDolm1Idle:new(_argt)
    CPlaceDolm1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEDOLM1
    self:argt(_argt) -- override if any
    self:implementall(IStoneDolmn)
end


--
-- IStoneCirkl
--
local IStoneCirkl = CPlaceStone:extend() -- cirkl implementation
IStoneCirkl.kind   = Classic.KINDCIRKL
IStoneCirkl.hitbox = CHitbox{
    region = {
        lf = 3,
        rg = 4,
        up = 6,
        dw = 7,
    }
}

local CPlaceCirk0Anim = CPlaceStoneAnim:extend() -- anim cirk0
function CPlaceCirk0Anim:new(_argt)
    CPlaceCirk0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt) -- override if any
    self:implementall(IStoneCirkl)
end

local CPlaceCirk0Idle = CPlaceStoneIdle:extend() -- idle cirk0
function CPlaceCirk0Idle:new(_argt)
    CPlaceCirk0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK0
    self:argt(_argt) -- override if any
    self:implementall(IStoneCirkl)
end

local CPlaceCirk1Anim = CPlaceStoneAnim:extend() -- anim cirk1
function CPlaceCirk1Anim:new(_argt)
    CPlaceCirk1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt) -- override if any
    self:implementall(IStoneCirkl)
end

local CPlaceCirk1Idle = CPlaceStoneIdle:extend() -- idle cirk1
function CPlaceCirk1Idle:new(_argt)
    CPlaceCirk1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACECIRK1
    self:argt(_argt) -- override if any
    self:implementall(IStoneCirkl)
end


--
-- IStoneRoads
--
local IStoneRoads = CPlaceStone:extend() -- roads implementation
IStoneRoads.kind   = Classic.KINDROADS
-- IStoneRoads.hitbox = CHitbox{
--     region = {
--         lf = 1,
--         rg = 4,
--         up = 6,
--         dw = 7,
--     }
-- }

local CPlaceRoad0Anim = CPlaceStoneAnim:extend() -- anim road0
function CPlaceRoad0Anim:new(_argt)
    CPlaceRoad0Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt) -- override if any
    self:implementall(IStoneRoads)
end

local CPlaceRoad0Idle = CPlaceStoneIdle:extend() -- idle road0
function CPlaceRoad0Idle:new(_argt)
    CPlaceRoad0Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD0
    self:argt(_argt) -- override if any
    self:implementall(IStoneRoads)
end

local CPlaceRoad1Anim = CPlaceStoneAnim:extend() -- anim road1
function CPlaceRoad1Anim:new(_argt)
    CPlaceRoad1Anim.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt) -- override if any
    self:implementall(IStoneRoads)
end

local CPlaceRoad1Idle = CPlaceStoneIdle:extend() -- idle road1
function CPlaceRoad1Idle:new(_argt)
    CPlaceRoad1Idle.super.new(self, _argt)
    self.sprite  = CSpriteBG.PLACEROAD1
    self:argt(_argt) -- override if any
    self:implementall(IStoneRoads)
end


--
-- CObject
--
local CObject = CEntityDrawable:extend() -- objects


--
-- CCharacter
--
local CCharacter = CEntityDrawable:extend() -- characters
Classic.KINDCHARACTER = "Character" -- Character kind
Classic.NAMECHARACTER = "Character" -- Character name
CCharacter.SIZEL = 0 -- character sizes -- for the head sprite y offset
CCharacter.SIZEM = 1
CCharacter.SIZES = 2
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
        statussprite = CSpriteFG.STATUSSLEEP,
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
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.kind         = Classic.KINDCHARACTER
    self.name         = Classic.NAMECHARACTER
    self.size         = CCharacter.SIZEM -- size
    self.scale        = CSprite.SCALE01 -- scale
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.hitbox       = CHitbox()
    self.state        = Tic.STATESTANDIDLE -- state
    self.idlecycler   = CCyclerInt{maxindex = 59,} -- cycler to get back to idle
    self.workcycler   = CCyclerInt{maxindex = 179,} -- cycler to animate work
    self.spotting     = nil -- spotted entity if any
    self.drawspotting = false -- lock its spotted
    self.lockspotting = false -- lock its spotted
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
    self.hitbox       = CHitbox{
        region = {
            lf = 2,
            rg = 4,
            up = 5,
            dw = 7,
        }
    }
    self:argt(_argt) -- override if any
    self.camera       = CCamera{name = self.name.." "..Classic.NAMECAMERA} -- one camera per character
    self:focus() -- focus its camera on itself
end

function CCharacter:regionViewOffsets() -- view offsets region depending on dirx, diry, statphyact and -- TODO posture
    local _stat          = self.statphyact
    local _statesettings = Tic.STATESETTINGS[self.state]
    local _posture       = _statesettings.posture
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _rangewh       = Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_rangewh - _size) // 2) - 1) * (_stat / Tic.STATSMAX))
    -- _offsets             = Nums:roundint(_offsets)
    -- local _offsets       = (_posturekneel) -- FIXME here the posture
    --     and ((((_rangewh - _size) // 2) - 1) * (_stat / Tic.STATSMAX)) // 2
    --     or  ((((_rangewh - _size) // 2) - 1) * (_stat / Tic.STATSMAX)) // 1
    -- Tic:logAppend("pa:", _stat)
    -- Tic:logAppend("of:", _offsets)

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
    local _statesettings = Tic.STATESETTINGS[self.state]
    local _posture       = _statesettings.posture
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _rangewh       = Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_rangewh - _size) // 2) - 1) * (_stat / Tic.STATSMAX))

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

function CCharacter:regionMoveOffsets() -- move offsets region depending on movex, movey
    local _size          = Tic.SPRITESIZE * self.scale

    return CRegion{
        lf  = self.offsetx,
        rg  = self.offsetx + _size,
        up  = self.offsety,
        dw  = self.offsety + _size,
    }
end

function CCharacter:regionMoveScreen() -- move screen region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets()
    return _regionmoveoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionMoveWorld() -- move world region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets()
    return _regionmoveoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:locationsView() -- locations in itself view
    return self.world:locationsRegion(self:regionViewWorld())
end

function CCharacter:nearestEntityView() -- nearest entity in itself view, except itself
    local _result        = nil
    local _locationsview = self:locationsView()
    local _entitiesview  = CLocations:entities(_locationsview)

    for _entity, _ in pairs(_entitiesview) do
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
    self.posture = Tic.STATESETTINGS[self.state].posture -- force the posture
    self:cycle() -- cycle the cyclers
    self:drawDirs()
    self:drawStatus()
    self:drawWeapon()
    self:drawShield()
    self:drawBody()
    self:drawHead()
    self:drawSpotted()
    self:drawBorders()
    self:drawHitbox()
    self:drawView()
    self:drawMind()
    self:drawMove()
end

function CCharacter:cycle()
    self:cycleIdle()
    self:cycleWork()
end

function CCharacter:cycleIdle() -- reset to idle after a delay
    local _posture = Tic.STATESETTINGS[self.state].posture
    local _status  = Tic.STATESETTINGS[self.state].status
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if _status  == Tic.STATUSWORK then return end -- is at work

    self.idlecycler:next()
	if self.idlecycler:isMAX() then -- trigger idlecycler
		self.state = _posture..Tic.STATUSIDLE
	end
end

function CCharacter:cycleWork() -- animate work after a delay
    local _posture = Tic.STATESETTINGS[self.state].posture
    local _status  = Tic.STATESETTINGS[self.state].status
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if _status  ~= Tic.STATUSWORK then return end -- not at work

    self.workcycler:next()
	if self.workcycler:isGEH() then -- trigger workcycler
		self:toggleFrame()
	end
end

function CCharacter:drawDirs() -- draw the directions and ranges around the character -- FIXME why actual player ???
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player
    self.drawdirs = Tic.DRAWDIRS -- use Tic as master
    if not self.drawdirs then return end -- nothing to draw
    local _drawcolor     = Tic.COLORWHITE
    local _screenx       = Tic.WORLDWX + Tic.WORLDWW2 - (Tic:playerActual().worldx - self.worldx) - 1 --relative to actual player -- feet
    local _screeny       = Tic.WORLDWY + Tic.WORLDWH2 - (Tic:playerActual().worldy - self.worldy) + 2
    local _statesettings = Tic.STATESETTINGS[self.state]
    local _posture       = _statesettings.posture
    local _range         = self.statphyact * self.scale
    _range               = (_posture == Tic.POSTUREKNEEL) and Nums:roundmax(_range / 2) or _range

    circb(_screenx, _screeny, _range, _drawcolor)
    circb(_screenx + 1, _screeny, _range, _drawcolor)
    for _, _dir in pairs(Tables:keys(Tic.DIRS2OFFSETS)) do
        local _offsets  = Tic.DIRS2OFFSETS[_dir]
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
    self.drawview = Tic.DRAWVIEW -- use Tic as master
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
    self.drawmind = Tic.DRAWMIND -- use Tic as master
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
    self.drawmove = Tic.DRAWMOVE -- use Tic as master
    if not self.drawmove then return end -- nothing to draw

    local _drawcolor = Tic.COLORGREEND
    local _regionmovescreen = self:regionMoveScreen()
    local _screenlf  = _regionmovescreen.lf
    local _screenrg  = _regionmovescreen.rg
    local _screenup  = _regionmovescreen.up
    local _screendw  = _regionmovescreen.dw

    rectb(_screenlf, _screenup, _screenrg - _screenlf, _screendw - _screenup, _drawcolor)
end

function CCharacter:drawStatus()
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
    _musprite.palette = _palette
    _musprite:draw()
end

function CCharacter:drawWeapon()
end

function CCharacter:drawShield()
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
    self:hitboxRefresh() -- refresh the hitboxes
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
    self:hitboxRefresh() -- refresh the hitboxes
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
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleFrame() -- toggle frame 0-1
    self.frame = Nums:toggle01(self.frame) -- animate continuous move in the same dirx
end

function CCharacter:toggleDrawSpotting()
	self.drawspotting = Nums:toggleTF(self.drawspotting)
end

function CCharacter:toggleLockSpotting()
	self.lockspotting = Nums:toggleTF(self.lockspotting)
end

function CCharacter:isDrawSpotting()
	return self.drawspotting
end

function CCharacter:isLockSpotting()
	return self.lockspotting
end

function CCharacter:entitySpotting()
	return self.spotting
end

function CCharacter:moveWorldXY(_worldx, _worldy) -- move character into world
    if not _worldx or not _worldy then return end -- mandatory
    self.world:moveEntityWorldXY(self, _worldx, _worldy)
end

function CCharacter:moveDirection(_direction, _movenone,  _moveslow, _moveback) -- handle moving a character in a direction
    if not _direction then return end -- mandatory
    _movenone = _movenone or false -- force none move if any
    _moveslow = _moveslow or false -- force slow move if any
    _moveback = _moveback or false -- force back move if any
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

    self.dirx = _dirx or self.dirx -- adjust dirx and diry
    self.diry = _diry or self.diry
    self:hitboxRefresh() -- refresh the hitboxes

    if _movenone then -- none move
        return
    end

    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then -- cannot move
        return
    end

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

    if _moveslow then -- slow move -1, 0, +1
        _offsetx = Nums:sign(_offsetx)
        _offsety = Nums:sign(_offsety)
    else -- normal move
        _offsetx = _offsetx * (self.statphyact / Tic.STATSMAX) -- depends of phy act
        _offsety = _offsety * (self.statphyact / Tic.STATSMAX)
        _offsetx = (_posture == Tic.POSTURESTAND) and _offsetx or _offsetx / 2 -- half if kneel
        _offsety = (_posture == Tic.POSTURESTAND) and _offsety or _offsety / 2 -- half if kneel
        _offsetx = Nums:roundmax(_offsetx)
        _offsety = Nums:roundmax(_offsety)
    end

    if _moveback then -- back move
        _offsetx = Nums:invert(_offsetx)
        _offsety = Nums:invert(_offsety)
    end

    local _movebyx = Nums:sign(_offsetx) -- calculate the maximum move step by step
    local _movebyy = Nums:sign(_offsety)
    local _movetox = 0
    local _movetoy = 0
    local _move    = true
    while _move do
        if Nums:pos(_movetox) < Nums:pos(_offsetx) then _movetox = _movetox + _movebyx end
        if Nums:pos(_movetoy) < Nums:pos(_offsety) then _movetoy = _movetoy + _movebyy end
        if _movetox == _offsetx and _movetoy == _offsety then _move = false end
    end
    self:moveWorldXY(self.worldx + _movetox, self.worldy + _movetoy)

    self:hitboxRefresh() -- refresh the hitboxes

    self.idlecycler:min() -- reset the idle cycler
end

function CCharacter:hitboxRefresh() -- refresh the attached hitboxes
    local _hitboxregion    = self:regionViewOffsets() -- hitbox collisions -- FIXME use another region (move)
    local _hitboxlocations = self:locationsRegion(_hitboxregion)
    local _hitboxentities  = CLocations:entities(_hitboxlocations)
    self:hitboxDetachAll()
    self:hitboxAttachTo(_hitboxentities)
    self:hitboxDetachSelf() -- not itself
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
local CCharacterHumanoid = CCharacter:extend() -- humanoid characters
Classic.KINDHUMANOID = "Humanoid" -- Humanoid kind
function CCharacterHumanoid:new(_argt)
    CCharacterHumanoid.super.new(self, _argt)
    self.kind         = Classic.KINDHUMANOID
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

function CCharacterHumanoid:drawBody()
    local _state            = self.state
    local _statesettings    = Tic.STATESETTINGS[_state]
    local _posture          = _statesettings.posture
    local _status           = _statesettings.status
    local _posturesettings  = Tic.POSTURESETTINGS[_posture]
    local _statussettings   = Tic.STATUSSETTINGS[_status]

    local _bodyspriteoffset = _posturesettings.bodyspriteoffset + _statussettings.bodyspriteoffset
    local _bodyxoffset      = _posturesettings.bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXLF)
        and Nums:pos(self.size) -- nil use size
        or  _bodyxoffset
    _bodyxoffset = (_bodyxoffset == nil and self.dirx == Tic.DIRXRG)
        and Nums:neg(self.size) -- nil use size
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
    _musprite.palette = { -- apply body palette
        [Tic.COLORARMOR] = self.colorarmor,
        [Tic.COLORSHIRT] = self.colorshirt,
        [Tic.COLORPANTS] = self.colorpants,
        [Tic.COLORHANDS] = self.colorhands,
    }
    _musprite:draw()
end

function CCharacterHumanoid:drawHead()
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
    _musprite.palette = { -- apply head palette
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
    _musprite.palette = { -- apply eyes palette
        [Tic.COLOREYESFG]   = _coloreyesfg,
        [Tic.COLOREYESBGUP] = _coloreyesbgup,
        [Tic.COLOREYESBGMD] = _coloreyesbgmd,
        [Tic.COLOREYESBGDW] = _coloreyesbgdw,
    }
    _musprite:draw()
end


local IPlayer = CCharacter:extend() -- players characters implementation
function IPlayer:playerAppend()
    Tic:playerAppend(self) -- record the new player on tic
end


local CPlayerHumanoid = CCharacterHumanoid:extend() -- humanoid player characters
function CPlayerHumanoid:new(_argt)
    CPlayerHumanoid.super.new(self, _argt)
    self.discovered = true
    self:argt(_argt) -- override if any
    self:implementall(IPlayer)
    self:playerAppend()
end


local CPlayerDwarf = CPlayerHumanoid:extend() -- Dwarf player characters
Classic.KINDDWARF = "Dwarf" -- Dwarf kind
function CPlayerDwarf:new(_argt)
    CPlayerDwarf.super.new(self, _argt)
    self.kind         = Classic.KINDDWARF
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
    self:argt(_argt) -- override if any
end


local CPlayerGnome = CPlayerHumanoid:extend() -- Gnome player characters
Classic.KINDGNOME = "Gnome" -- Gnome kind
function CPlayerGnome:new(_argt)
    CPlayerGnome.super.new(self, _argt)
    self.kind         = Classic.KINDGNOME
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
    self:argt(_argt) -- override if any
end


local CPlayerElvwe = CPlayerHumanoid:extend() -- Elvwe player characters
Classic.KINDELVWE = "Elvwe" -- Elvwe kind
function CPlayerElvwe:new(_argt)
    CPlayerElvwe.super.new(self, _argt)
    self.kind         = Classic.KINDELVWE
    self.size         = CCharacter.SIZEL -- size
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


local CPlayerDrowe = CPlayerElvwe:extend() -- Drowe player characters
Classic.KINDDROWE = "Drowe" -- Drowe kind
function CPlayerDrowe:new(_argt)
    CPlayerDrowe.super.new(self, _argt)
    self.kind         = Classic.KINDDROWE
    self.size         = CCharacter.SIZEM -- size
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


local CPlayerAngel = CPlayerHumanoid:extend() -- Angel player characters
Classic.KINDANGEL = "Angel" -- Angel kind
function CPlayerAngel:new(_argt)
    CPlayerAngel.super.new(self, _argt)
    self.kind         = Classic.KINDANGEL
    self.size         = CCharacter.SIZEM -- size
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


local CPlayerGolth = CPlayerHumanoid:extend() -- Golth player characters
Classic.KINDGOLTH = "Golth" -- Golth kind
function CPlayerGolth:new(_argt)
    CPlayerGolth.super.new(self, _argt)
    self.kind         = Classic.KINDGOLTH
    self.size         = CCharacter.SIZEL -- size
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


local CPlayerHorne = CPlayerHumanoid:extend() -- Horne player characters
Classic.KINDHORNE = "Horne" -- Horne kind
function CPlayerHorne:new(_argt)
    CPlayerHorne.super.new(self, _argt)
    self.kind         = Classic.KINDHORNE
    self.size         = CCharacter.SIZEL -- size
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


local CPlayerDemon = CPlayerHorne:extend() -- Demon player characters
Classic.KINDDEMON = "Demon" -- Demon kind
function CPlayerDemon:new(_argt)
    CPlayerDemon.super.new(self, _argt)
    self.kind         = Classic.KINDDEMON
    self.statphymax   = 3
    self.statphyact   = self.statphymax
    self.statmenmax   = 5
    self.statmenact   = self.statmenmax
    self.statpsymax   = 7
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


local CPlayerTifel = CPlayerHorne:extend() -- Tifel player characters
Classic.KINDTIFEL = "Tifel" -- Tifel kind
function CPlayerTifel:new(_argt)
    CPlayerTifel.super.new(self, _argt)
    self.kind         = Classic.KINDTIFEL
    self.size         = CCharacter.SIZEM -- size
    self.statphymax   = 4
    self.statphyact   = self.statphymax
    self.statmenmax   = 6
    self.statmenact   = self.statmenmax
    self.statpsymax   = 5
    self.statpsyact   = self.statpsymax
    self:argt(_argt) -- override if any
end


local CPlayerMeduz = CPlayerHumanoid:extend() -- Meduz player characters
Classic.KINDMEDUZ = "Meduz" -- Meduz kind
function CPlayerMeduz:new(_argt)
    CPlayerMeduz.super.new(self, _argt)
    self.kind         = Classic.KINDMEDUZ
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
    self:argt(_argt) -- override if any
end


local CPlayerGnoll = CPlayerHumanoid:extend() -- Gnoll player characters
Classic.KINDGNOLL = "Gnoll" -- Gnoll kind
function CPlayerGnoll:new(_argt)
    CPlayerGnoll.super.new(self, _argt)
    self.kind         = Classic.KINDGNOLL
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
    self:argt(_argt) -- override if any
end


local CPlayerWolfe = CPlayerGnoll:extend() -- Wolfe player characters
Classic.KINDWOLFE = "Wolfe" -- Wolfe kind
function CPlayerWolfe:new(_argt)
    CPlayerWolfe.super.new(self, _argt)
    self.kind         = Classic.KINDWOLFE
    self:argt(_argt) -- override if any
end


local CPlayerGhost = CPlayerHumanoid:extend() -- Ghost player characters
Classic.KINDGHOST = "Ghost" -- Ghost kind
function CPlayerGhost:new(_argt)
    CPlayerGhost.super.new(self, _argt)
    self.kind         = Classic.KINDGHOST
    self.size         = CCharacter.SIZEL -- size
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


local CNeutral= CCharacter:extend() -- neutral characters


local CEnnemy = CCharacter:extend() -- ennemy characters


--
-- CElement
--
local CElement = Classic:extend() -- generic screen element -- TODO build this class
Classic.KINDELEMENT = "Element" -- Element kind
Classic.NAMEELEMENT = "Element" -- Element name


--
-- CWindow
--
local CWindow = CElement:extend() -- generic window element
Classic.KINDWINDOW = "Window" -- Window kind
Classic.NAMEWINDOW = "Window" -- Window name
function CWindow:new(_argt)
    CWindow.super.new(self, _argt)
    self.kind = Classic.KINDWINDOW
    self.name = Classic.NAMEWINDOW
    self.screen      = nil -- parent screen if any
    self.screenx     = Tic.SCREENX -- positions
    self.screeny     = Tic.SCREENY
    self.screenw     = Tic.SCREENW -- sizes
    self.screenh     = Tic.SCREENH
    self.cachest     = Tic.SPRITESIZE -- caches thickness
    self.colorground = Tic.COLORHUDSCREEN
    self.colorguides = Tic.COLORGREYM
    self.colorcaches = Tic.COLORHUDSCREEN
    self.colorborder = Tic.COLORGREYM -- border color
    self.colorframe1 = Tic.COLORWHITE -- frames colors
    self.colorframe2 = Tic.COLORGREYL
    self.behaviour   = nil  -- behaviour function if any
    self.display     = true -- display or not ?
    self.drawground  = true -- draw behevior
    self.drawguides  = false
    self.drawinside  = true
    self.drawcaches  = true
    self.drawborder  = true
    self.drawframes  = true
    self:argt(_argt) -- override if any
end

function CWindow:draw() -- window drawing
    if type(self.behaviour) == "function" then self:behaviour() end -- execute behaviour function first if any
    if not self.display then return end -- nothing to draw
    if self.drawground then self:drawGround() end
    if self.drawguides then self:drawGuides() end
    if self.drawinside then self:drawInside() end
    if self.drawcaches then self:drawCaches() end
    if self.drawborder then self:drawBorder() end
    if self.drawframes then self:drawFrames() end
end

function CWindow:drawGround() -- window ground
    rect(self.screenx, self.screeny, self.screenw, self.screenh, self.colorground)
end

function CWindow:drawGuides() -- window guides -- FIXME still not working -- use ratio w h ?
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

function CWindow:drawCaches() -- window caches
    rect( -- lf cache
		self.screenx - self.cachest,
		self.screeny,
        self.cachest,
		self.screenh,
        self.colorcaches
    )
    rect( -- rg cache
		self.screenx + self.screenw,
		self.screeny,
        self.cachest,
		self.screenh,
        self.colorcaches
    )
    rect( -- up cache
		self.screenx - self.cachest,
		self.screeny - self.cachest,
        self.screenw + (self.cachest * 2),
		self.cachest,
        self.colorcaches
    )
    rect( -- dw cache
		self.screenx - self.cachest,
		self.screeny + self.screenh,
        self.screenw + (self.cachest * 2),
		self.cachest,
        self.colorcaches
    )
end

function CWindow:drawBorder() -- window single border
    rectb(
        self.screenx,
        self.screeny,
        self.screenw,
        self.screenh,
        self.colorborder
    )
end

function CWindow:drawFrames() -- window double frames
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

function CWindow:drawInside() -- window content
end

function CWindow:region() -- window region
    return CRegion{
        lf = self.screenx,
        rg = self.screenw + self.screenx - 1,
        up = self.screeny,
        dw = self.screeny + self.screenh - 1,
    }
end


--
-- CWindowScreen
--
local CWindowScreen = CWindow:extend() -- window screen
function CWindowScreen:new(_argt)
    CWindowScreen.super.new(self, _argt)
    self.drawcaches = false
    self.drawframes = false
    self:argt(_argt) -- override if any
end


--
-- CWindowInfos
--
local CWindowInfos = CWindow:extend() -- window infos
CWindowInfos.ALIGNLF = "alignlf"
CWindowInfos.ALIGNMD = "alignmd"
CWindowInfos.ALIGNRG = "alignrg"
function CWindowInfos:new(_argt)
    CWindowInfos.super.new(self, _argt)
	self.lines       = 2 -- number of lines
	self.chars       = 6 -- number of chars per lines
	self.fixed       = true -- TODO accept also not fixed fonts ?
	self.scale       = CSprite.SCALE01 -- TODO accept also other scales ?
	self.small       = true -- small fonts or large fonts
	self.infos       = {} -- lines content -- {info1, infoN,...}
	self.align       = CWindowInfos.ALIGNLF -- h alignment
	self.marginsh    = 1 -- h margins in px
	self.marginsv    = 0 -- v margins in px
	self.linessep    = 0 -- separator in px
    self.shadow      = true -- add a shadow
    self.fupper      = false -- uppercase the first char
    self.colorinfofg = Tic.COLORGREYL
    self.colorinfobg = Tic.COLORGREYD -- for shadow
    self.colorground = Tic.COLORBIOMENIGHT
    self.drawcaches  = false
    self.drawborder  = false
    self:argt(_argt) -- override if any
	local _fontw = (self.small) and Tic.FONTWS or Tic.FONTWL
	local _fonth = Tic.FONTH + 2
	local _seppx = math.min(0, self.lines - 1) * self.linessep
	self.screenw = (self.chars * _fontw) + (self.marginsh * 2)
	self.screenh = (self.lines * _fonth) + (self.marginsv * 2) + _seppx
	return self.screenw, self.screenh
end

function CWindowInfos:drawInside() -- window info content
	local _fontw   = (self.small) and Tic.FONTWS or Tic.FONTWL
    local _offsetx = self.marginsh
    local _offsety = self.marginsv
	for _line = 1, self.lines do -- draw each line
        local _info = self.infos[_line] or ""
        local _size = string.len(_info) * _fontw
        _offsetx = (self.align == CWindowInfos.ALIGNMD)
            and (self.screenw - _size) // 2
            or  _offsetx
        _offsetx = (self.align == CWindowInfos.ALIGNRG)
            and self.screenw - self.marginsh - _size + 1
            or  _offsetx
        _info = (self.fupper) -- uppercase first char if any
            and Names:fupper(_info)
            or  _info
		if self.shadow then
			print(
				_info,
				self.screenx + _offsetx + 1,
				self.screeny + _offsety + 2, -- y offset font in each line
				self.colorinfobg,
				self.fixed,
				self.scale,
				self.small
			)
		end
		print(
			_info,
			self.screenx + _offsetx,
			self.screeny + _offsety + 1, -- y offset font in each line
			self.colorinfofg,
			self.fixed,
			self.scale,
			self.small
		)
		_offsety = _offsety + Tic.FONTH + 2 + self.linessep
	end
end


--
-- IWindowEntity -- entities windows implementation
--
local IWindowEntity = CWindow:extend() -- generic entity window
IWindowEntity.BEHAVIOUR = function(self)
    self.drawinside = (self.entity) and true or false
end


--
-- CWindowInfosEntity
--
local CWindowInfosEntity = CWindowInfos:extend() -- window infos for entities
function CWindowInfosEntity:new(_argt)
    CWindowInfosEntity.super.new(self, _argt)
    self.lines  = 2
    self.chars  = 6
    self.small  = true
    self.align  = CWindowInfos.ALIGNMD
    self.shadow = true
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowInfosEntity:drawInside() -- window infos content for entities
    if not self.entity then return end -- mandatory
    if not self.entity:is(CEntity) then return end -- mandatory
    local _info1 = self.entity.name
    local _info2 = self.entity.kind
	self.infos = {_info1, _info2}
    CWindowInfosEntity.super.drawInside(self)
end


--
-- IWindowPlayer -- players windows implementation
--
local IWindowPlayer = CWindow:extend() -- generic player window
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowPlayerInfos
--
local CWindowPlayerInfos = CWindowInfosEntity:extend() -- window infos for player
function CWindowPlayerInfos:new(_argt)
    CWindowPlayerInfos.super.new(self, _argt)
    self.screenx   = Tic.PLAYERINFOSWX
    self.screeny   = Tic.PLAYERINFOSWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowPortrait
--
local CWindowPortrait = CWindow:extend() -- window portrait
function CWindowPortrait:new(_argt)
    CWindowPortrait.super.new(self, _argt)
    self.screenw     = Tic.PLAYERPORTRAITWW -- sizes
    self.screenh     = Tic.PLAYERPORTRAITWH
    self.cachest     = 4 -- caches thickness
    self.colorground = Tic.COLORBIOMENIGHT
    self.drawborder  = false
    self:argt(_argt) -- override if any
end

function CWindowPortrait:drawGround() -- window portrait ground
    self.colorground = Tic:biomeActual()
    CWindowPortrait.super.drawGround(self)
end


--
-- CWindowPortraitDrawable
--
local CWindowPortraitDrawable = CWindowPortrait:extend() -- window portrait for -- [!] drawable entities
function CWindowPortraitDrawable:new(_argt)
    CWindowPortraitDrawable.super.new(self, _argt)
    self.idle   = false -- idle portait or not
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowPortraitDrawable:drawInside() -- window portrait content for -- [!] drawable entities
    self.entity:save{"screenx", "screeny", "scale", "drawdirs", "drawview","dirx", "frame", "animations",}
    self.entity.screenx  = self.screenx -- force character attributes
    self.entity.screeny  = self.screeny
    self.entity.scale    = CSprite.SCALE02
    self.entity.drawdirs = false
    self.entity.drawview = false
    if self.idle then
        self.entity.dirx       = Tic.DIRXLF
        self.entity.frame      = CSprite.FRAME00
        self.entity.animations = {}
    end
    self.entity:draw()
    self.entity:load()
end


--
-- CWindowPlayerPortrait
--
local CWindowPlayerPortrait = CWindowPortraitDrawable:extend() -- window portrait for player
function CWindowPlayerPortrait:new(_argt)
    CWindowPlayerPortrait.super.new(self, _argt)
    self.screenx   = Tic.PLAYERPORTRAITWX
    self.screeny   = Tic.PLAYERPORTRAITWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowStats
--
local CWindowStats = CWindow:extend() -- window stats
function CWindowStats:new(_argt)
    CWindowStats.super.new(self, _argt)
    self.screenw     = Tic.PLAYERSTATSWW -- sizes
    self.screenh     = Tic.PLAYERSTATSWH
    self.colorground = Tic.COLORBIOMENIGHT
    self.colorborder = Tic.COLORWHITE
    self.colorphyact = Tic.COLORRED -- stats colors
    self.colormenact = Tic.COLORGREENM
    self.colorpsyact = Tic.COLORBLUEM
    self.colorlesser = Tic.COLORGREYL -- if the act stat is lesser than the max stat
    self.drawcaches  = false
    self.drawborder  = false
    self:argt(_argt) -- override if any
end


--
-- CWindowStatsCharacter
--
local CWindowStatsCharacter = CWindowStats:extend() -- window portrait for -- [!] characters
function CWindowStatsCharacter:new(_argt)
    CWindowStatsCharacter.super.new(self, _argt)
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowStatsCharacter:drawInside() -- window portrait content for -- [!] characters
    rectb( -- phy bar border
        self.screenx + 01,
        self.screeny + 02,
        04,
        12,
        self.colorborder
    )
    rectb( -- men bar border
        self.screenx + 06,
        self.screeny + 02,
        04,
        12,
        self.colorborder
    )
    rectb( -- psy bar border
        self.screenx + 11,
        self.screeny + 02,
        04,
        12,
        self.colorborder
    )
    rect ( -- phy act bar
        self.screenx + 02,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statphyact + 1,
        02,
        self.entity.statphyact,
        self.colorphyact
    )
    rect ( -- men act bar
        self.screenx + 07,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statmenact + 1,
        02,
        self.entity.statmenact,
        self.colormenact
    )
    rect ( -- psy act bar
        self.screenx + 12,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statpsyact + 1,
        02,
        self.entity.statpsyact,
        self.colorpsyact
    )
    rectb( -- phy max line
        self.screenx + 02,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statphymax,
        02,
        01,
        (self.entity.statphyact >= self.entity.statphymax) and self.colorborder or self.colorlesser
    )
    rectb( -- men max line
        self.screenx + 07,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statmenmax,
        02,
        01,
        (self.entity.statmenact >= self.entity.statmenmax) and self.colorborder or self.colorlesser
    )
    rectb( -- psy max line
        self.screenx + 12,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statpsymax,
        02,
        01,
        (self.entity.statpsyact >= self.entity.statpsymax) and self.colorborder or self.colorlesser
    )
end


--
-- CWindowPlayerStats
--
local CWindowPlayerStats = CWindowStatsCharacter:extend() -- window stats for player
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
local CWindowPlayerState = CWindowInfos:extend() -- window state for player
function CWindowPlayerState:new(_argt)
    CWindowPlayerState.super.new(self, _argt)
    self.screenx   = Tic.PLAYERSTATEWX
    self.screeny   = Tic.PLAYERSTATEWY
    self.align     = CWindowInfos.ALIGNMD
    self.fupper    = true
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowPlayerState:drawInside() -- window state content for player
    local _state         = self.entity.state
    local _statesettings = Tic.STATESETTINGS[_state]
    local _posture       = _statesettings.posture
    local _status        = _statesettings.status
    self.infos = {_posture, _status}
    CWindowPlayerState.super.drawInside(self)
end


--
-- IWindowPlayer -- players windows implementation
--
local IWindowPlayer = CWindow:extend() -- generic player window
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- IWindowSpotted -- spotted windows implementation
--
local IWindowSpotted = CWindow:extend() -- generic spotted window
IWindowSpotted.BEHAVIOUR = function(self)
    self.entity = Tic:entitySpotting()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowSpottingInfos
--
local CWindowSpottingInfos = CWindowInfosEntity:extend() -- window infos for spotted
Classic.KINDWINDOWINFOSSPOTTED = "WindowSpottingInfos" -- WindowSpottingInfos kind
function CWindowSpottingInfos:new(_argt)
    CWindowSpottingInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOSSPOTTED
    self.screenx   = Tic.SPOTTEDINFOSWX
    self.screeny   = Tic.SPOTTEDINFOSWY
    self.behaviour = IWindowSpotted.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowSpottingPortrait
--
local CWindowSpottingPortrait = CWindowPortraitDrawable:extend() -- window portrait for spotted
Classic.KINDWINDOWPORTRAITSPOTTED = "WindowSpottingPortrait" -- WindowSpottingPortrait kind
function CWindowSpottingPortrait:new(_argt)
    CWindowSpottingPortrait.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWPORTRAITSPOTTED
    self.screenx   = Tic.SPOTTEDPORTRAITWX
    self.screeny   = Tic.SPOTTEDPORTRAITWY
    self.behaviour = IWindowSpotted.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowSpottingPortrait:draw()
    if self.entity then
        self.entity:save{"spotted"}
        self.entity.spotted = false -- dont draw spotted frame in window
    end
    CWindowSpottingPortrait.super.draw(self)
    if self.entity then
        self.entity:load()
    end
end


function Tic:worldActual() -- TEMP
    return World
end

--
-- CWindowWorld
--
local CWindowWorld = CWindow:extend() -- window world
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
    local _locationsaround  = _playeractual:locationsAround()
    local _regionviewworld  = _playeractual:regionViewWorld()
    local _regionmindworld  = _playeractual:regionMindWorld()
    local _nearestentity    = _playeractual:nearestEntityView() -- nearest entity if any -- except itself

    if not _playeractual:isLockSpotting() then
        _playeractual.spotting  = _nearestentity
    end
    
    for _, _keyy in pairs(Tables:keys(_locationsaround)) do -- draw entities -- sorted by y first
        for _, _keyx in pairs(Tables:keys(_locationsaround[_keyy])) do -- sorted by x next
            for _entity, _ in pairs(_locationsaround[_keyy][_keyx]) do -- entities around actual player
                local _entityworldregion = _entity:worldRegion()

                _entity.spotted = (_entity == _playeractual:entitySpotting() and _playeractual:isDrawSpotting()) -- unspot all entities except spotted one if any
                    and true
                    or  false

                if _regionviewworld:hasInsideRegion(_entityworldregion) then -- if in view
                    _entity.drawfade = false
                    _entity.discovered = true
                else -- not in view
                    _entity.drawfade = true
                end

                if (_entity.drawfade == false) or (_regionmindworld:hasInsideRegion(_entityworldregion)) then -- draw entity ?
                    _entity:drawRelativeToEntity(_playeractual)
                end

            end
        end
    end
end


--
-- CWindowInfosWorld
--
local CWindowInfosWorld = CWindowInfos:extend() -- window infos for world
function CWindowInfosWorld:new(_argt)
    CWindowInfosWorld.super.new(self, _argt)
    self.screenx    = Tic.WORLDINFOSWX
    self.screeny    = Tic.WORLDINFOSWY
	self.small      = false
    self.drawframes = true
    self.drawborder = true
	self.marginsv   = 1
	self.align      = CWindowInfos.ALIGNMD
    self:argt(_argt) -- override if any
	self.screenw = Tic.WORLDINFOSWW
	self.screenh = Tic.WORLDINFOSWH
	return self.screenw, self.screenh
end

function CWindowInfosWorld:drawInside() -- window infos content for world
    local _entity = Tic:worldActual()
    local _info   = _entity.kind.." : ".._entity.name
    self.infos    = {_info}
    CWindowInfosWorld.super.drawInside(self)
end


--
-- CButton
--
local CButton = CWindow:extend() -- generic button
Classic.KINDBUTTON = "Button" -- Button kind
Classic.NAMEBUTTON = "Button" -- Button name
CButton.BEHAVIOUR = function(self)
    if Tables:size(self:functionsDefined()) == 0 then
        self.enabled = false
    end
end
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
	self.behaviour     = CButton.BEHAVIOUR  -- function to trigger at first
    self.hovertext     = nil -- hover text if any
	self.rounded       = true  -- rounded border and frames ?
    self.drawframes    = false
    self.drawcaches    = false
    self.colorground   = Tic.COLORWHITE
    self.colorborder   = Tic.COLORGREYM
    self.colorhover    = Tic.COLORHUDSCREEN
    self.colorgrounddisabled = Tic.COLORGREYL
    self.colorborderdisabled = Tic.COLORGREYM
    self.colorgroundactived  = Tic.COLORBLUEL
    self:argt(_argt) -- override if any
end

function CButton:draw() -- button drawing
    CButton.super.draw(self)
    if self.hovered and self.hovertext then self:drawFHoverText() end
end

function CButton:drawGround()
    self:save{"colorground", "colorborder"}
    self.colorground = (self.hovered) and self.colorhover          or self.colorground
    self.colorground = (self.actived) and self.colorgroundactived  or self.colorground
    self.colorground = (self.enabled) and self.colorground or self.colorgrounddisabled
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    if not self.rounded then -- standard drawing
        CButton.super.drawGround(self)
    else
        rect(self.screenx + 1, self.screeny + 1, self.screenw - 2, self.screenh - 2, self.colorborder)
        rect(self.screenx + 2, self.screeny + 1, self.screenw - 4, self.screenh - 2, self.colorground)
        rect(self.screenx + 1, self.screeny + 2, self.screenw - 2, self.screenh - 4, self.colorground)
    end
    self:load()
end

function CButton:drawBorder()
    self:save{"colorborder"}
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    if not self.rounded then -- standard drawing
        CButton.super.drawBorder(self)
    else
        rect(self.screenx + 1, self.screeny, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
        rect(self.screenx + 1, self.screeny + self.screenh - 1, self.screenw - 2, 1, self.colorborder)
        rect(self.screenx + self.screenw - 1, self.screeny + 1, 1, self.screenh - 2, self.colorborder)
    end
    self:load()
end

function CButton:drawFHoverText()
    local _textw = #self.hovertext * Tic.FONTWS
    local _screenx = self.screenx - ((_textw - self.screenw) // 2) + 1
    local _screeny = self.screeny - (Tic.FONTH)
    rect(_screenx -1, _screeny, _textw + 1, Tic.FONTH, self.colorhover)
    rect(_screenx, _screeny - 1, _textw - 1, Tic.FONTH + 2, self.colorhover)
    print(self.hovertext, _screenx, _screeny, self.colorground, true, 1, true)
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
    if Tic.MOUSE.scrollx ~= 0 and type(self[Tic.BUTTONSCROLLX]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONSCROLLX], true) end
    if Tic.MOUSE.scrolly ~= 0 and type(self[Tic.BUTTONSCROLLY]) == "function" then Tables:valInsert(_result, self[Tic.BUTTONSCROLLY], true) end

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
-- CButtonSprite
--
local CButtonSprite = CButton:extend() -- generic sprite button
function CButtonSprite:new(_argt)
    CButtonSprite.super.new(self, _argt)
	self.sprite = CSpriteBG{}
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
local CButtonClick = CButtonSprite:extend() -- generic click button


--
-- CButtonArrow
--
local CButtonArrow = CButtonClick:extend() -- generic arrow click button
function CButtonArrow:new(_argt)
    CButtonArrow.super.new(self, _argt)
    self.drawborder    = false
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowLine
--
local CButtonArrowLine = CButtonArrow:extend() -- generic line arrow click button
function CButtonArrowLine:new(_argt)
    CButtonArrowLine.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWL
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDiag
--
local CButtonArrowDiag = CButtonArrow:extend() -- generic diag arrow click button
function CButtonArrowDiag:new(_argt)
    CButtonArrowDiag.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWD
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowLF
--
local CButtonArrowLF = CButtonArrowLine:extend() -- generic arrow LF click button
function CButtonArrowLF:new(_argt)
    CButtonArrowLF.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowUP
--
local CButtonArrowUP = CButtonArrowLine:extend() -- generic arrow UP click button
function CButtonArrowUP:new(_argt)
    CButtonArrowUP.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDW
--
local CButtonArrowDW = CButtonArrowLine:extend() -- generic arrow DW click button
function CButtonArrowDW:new(_argt)
    CButtonArrowDW.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowRG
--
local CButtonArrowRG = CButtonArrowLine:extend() -- generic arrow RG click button
function CButtonArrowRG:new(_argt)
    CButtonArrowRG.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowUL
--
local CButtonArrowUL = CButtonArrowDiag:extend() -- generic arrow UL click button
function CButtonArrowUL:new(_argt)
    CButtonArrowUL.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowUR
--
local CButtonArrowUR = CButtonArrowDiag:extend() -- generic arrow UR click button
function CButtonArrowUR:new(_argt)
    CButtonArrowUR.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDL
--
local CButtonArrowDL = CButtonArrowDiag:extend() -- generic arrow DL click button
function CButtonArrowDL:new(_argt)
    CButtonArrowDL.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDR
--
local CButtonArrowDR = CButtonArrowDiag:extend() -- generic arrow DR click button
function CButtonArrowDR:new(_argt)
    CButtonArrowDR.super.new(self, _argt)
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonCenter
--
local CButtonCenter = CButtonArrow:extend() -- generic center click button
function CButtonCenter:new(_argt)
    CButtonCenter.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNCENTER
    self:argt(_argt) -- override if any
end


--
-- CButtonCheck
--
local CButtonCheck = CButtonSprite:extend() -- generic check button
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
-- IButtonPlayer -- players buttons implementation
--
local IButtonPlayer = CButton:extend() -- generic player button
IButtonPlayer.BEHAVIOUR = function(self)
    self.enabled = Tables:size(Tic:playerPlayers()) > 1
    CButton.BEHAVIOUR(self)
end


--
-- CButtonPlayerPrev
--
local CButtonPlayerPrev = CButtonArrowLF:extend() -- generic player prev button
function CButtonPlayerPrev:new(_argt)
    CButtonPlayerPrev.super.new(self, _argt)
	self.behaviour     = IButtonPlayer.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = Tic.FUNCTIONPLAYERPREV
    self.hovertext     = "Prev"
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerNext
--
local CButtonPlayerNext = CButtonArrowRG:extend() -- generic player next button
function CButtonPlayerNext:new(_argt)
    CButtonPlayerNext.super.new(self, _argt)
	self.behaviour     = IButtonPlayer.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = Tic.FUNCTIONPLAYERNEXT
    self.hovertext     = "Next"
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerPick
--
local CButtonPlayerPick = CButtonClick:extend() -- generic player pick button
function CButtonPlayerPick:new(_argt)
    CButtonPlayerPick.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNPLAYER
	self.behaviour     = IButtonPlayer.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function(self) Tic:logAppend("Player") end
    self.hovertext     = "Pick"
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingDraw
--
local CButtonSpottingDraw = CButtonCheck:extend() -- generic drawspotting check button
CButtonSpottingDraw.BEHAVIOUR = function(self)
    self.checked = Tic:isDrawSpotting()
    CButton.BEHAVIOUR(self)
end
function CButtonSpottingDraw:new(_argt)
    CButtonSpottingDraw.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNSPOTIT
	self.behaviour     = CButtonSpottingDraw.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:toggleDrawSpotting() end
    self.hovertext     = "Spot"
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingLock
--
local CButtonSpottingLock = CButtonCheck:extend() -- generic lockspotting check button
CButtonSpottingLock.BEHAVIOUR = function(self)
    self.checked = Tic:isLockSpotting()
    CButton.BEHAVIOUR(self)
end
function CButtonSpottingLock:new(_argt)
    CButtonSpottingLock.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNLOCKIT
	self.behaviour     = CButtonSpottingLock.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:toggleLockSpotting() end
    self.hovertext     = "Lock"
    self:argt(_argt) -- override if any
end


--
-- IButtonSpotting -- spotting buttons implementation
--
local IButtonSpotting = CButton:extend() -- generic player button
IButtonSpotting.PALETTE = {[Tic.COLORGREYD] = Tic.COLORKEY}
-- IButtonSpotting.BEHAVIOUR = function(self)
--     self.enabled = Tables:size(Tic:playerPlayers()) > 1
--     CButton.BEHAVIOUR(self)
-- end


--
-- CButtonSpottingLF
--
local CButtonSpottingLF = CButtonArrowLF:extend() -- generic spotting LF button
function CButtonSpottingLF:new(_argt)
    CButtonSpottingLF.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingUP
--
local CButtonSpottingUP = CButtonArrowUP:extend() -- generic spotting UP button
function CButtonSpottingUP:new(_argt)
    CButtonSpottingUP.super.new(self, _argt)
    self.sprite.palette = IButtonSpotting.PALETTE
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingDW
--
local CButtonSpottingDW = CButtonArrowDW:extend() -- generic spotting DW button
function CButtonSpottingDW:new(_argt)
    CButtonSpottingDW.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingRG
--
local CButtonSpottingRG = CButtonArrowRG:extend() -- generic spotting RG button
function CButtonSpottingRG:new(_argt)
    CButtonSpottingRG.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingUL
--
local CButtonSpottingUL = CButtonArrowUL:extend() -- generic spotting UL button
function CButtonSpottingUL:new(_argt)
    CButtonSpottingUL.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingUR
--
local CButtonSpottingUR = CButtonArrowUR:extend() -- generic spotting UR button
function CButtonSpottingUR:new(_argt)
    CButtonSpottingUR.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingDL
--
local CButtonSpottingDL = CButtonArrowDL:extend() -- generic spotting DL button
function CButtonSpottingDL:new(_argt)
    CButtonSpottingDL.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingDR
--
local CButtonSpottingDR = CButtonArrowDR:extend() -- generic spotting DR button
function CButtonSpottingDR:new(_argt)
    CButtonSpottingDR.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


--
-- CScreen
--
local CScreen = CElement:extend() -- generic screen -- HAS TO BE AFTER WINDOWS AND BUTTONS
Classic.KINDSCREEN = "Screen" -- Screen kind
Classic.NAMESCREEN = "Screen" -- Screen name
function CScreen:new(_argt)
    CScreen.super.new(self, _argt)
    self.kind = Classic.KINDSCREEN
    self.name = Classic.NAMESCREEN
    self.screen        = nil -- parent screen if any
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
    for _, _button in ipairs(self.buttons or {}) do
        _button:draw()
    end
end

function CScreen:appendWindow(_window) -- append window -- unique
    if not _window then return end -- mandarory
    if not _window:is(CWindow) then return end -- only windows
    if Tables:valFind(self.windows, _window) then return end -- already exists
    _window.screen = self -- record parent
    Tables:valInsert(self.windows, _window, true)
end

function CScreen:appendButton(_button) -- append button -- unique
    if not _button then return end -- mandarory
    if not _button:is(CButton) then return end -- only buttons
    if Tables:valFind(self.buttons, _button) then return end -- already exists
    _button.screen = self -- record parent
    Tables:valInsert(self.buttons, _button, true)
end

function CScreen:appendScreen(_screen) -- append screen -- unique
    if not _screen then return end -- mandarory
    if not _screen:is(CScreen) then return end -- only screens
    if Tables:valFind(self.screens, _screen) then return end -- already exists
    _screen.screen = self -- record parent
    Tables:valInsert(self.screens, _screen, true)
end

function CScreen:appendElement(_element) -- append element -- unique
    if not _element then return end -- mandarory
    self:appendWindow(_element) -- try all kinds
    self:appendButton(_element)
    self:appendScreen(_element)
end

function CScreen:appendElements(_elements) -- append elements -- unique
    for _, _element in ipairs(_elements or {}) do
        self:appendElement(_element)
    end
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
local ScreenWorld = CScreen{name = "World", keysfunctions = Tic.KEYSFUNCTIONSWORLD}
Tic:screenAppend(ScreenWorld)

-- lf panel
local ScreenWorldLF = CScreen{}
local WindowSpottingInfos    = CWindowSpottingInfos{}
local WindowSpottingPortrait = CWindowSpottingPortrait{}
local ButtonSpottingDraw     = CButtonSpottingDraw{}
local ButtonSpottingLock     = CButtonSpottingLock{}
local ButtonSpottingLF       = CButtonSpottingLF{}
local ButtonSpottingUP       = CButtonSpottingUP{}
local ButtonSpottingDW       = CButtonSpottingDW{}
local ButtonSpottingRG       = CButtonSpottingRG{}
local ButtonSpottingUL       = CButtonSpottingUL{}
local ButtonSpottingUR       = CButtonSpottingUR{}
local ButtonSpottingDL       = CButtonSpottingDL{}
local ButtonSpottingDR       = CButtonSpottingDR{}
ScreenWorldLF:elementsDistributeH(
    {ButtonSpottingDraw, ButtonSpottingLock},
    WindowSpottingInfos.screenx + (
        (WindowSpottingInfos.screenw - CScreen:elementsTotalH({ButtonSpottingDraw, ButtonSpottingLock})) // 2),
    WindowSpottingInfos.screeny - Tic.SPRITESIZE
)
ScreenWorldLF:elementsDistributeH(
    {ButtonSpottingUL, ButtonSpottingUP, ButtonSpottingUR},
    WindowSpottingPortrait.screenx + (
        (WindowSpottingPortrait.screenw - CScreen:elementsTotalH({ButtonSpottingUL, ButtonSpottingUP, ButtonSpottingUR})) // 2),
    WindowSpottingPortrait.screeny - Tic.SPRITESIZE
)
ScreenWorldLF:elementsDistributeH(
    {ButtonSpottingDL, ButtonSpottingDW, ButtonSpottingDR},
    WindowSpottingPortrait.screenx + (
        (WindowSpottingPortrait.screenw - CScreen:elementsTotalH({ButtonSpottingDL, ButtonSpottingDW, ButtonSpottingDR})) // 2),
    WindowSpottingPortrait.screeny + WindowSpottingPortrait.screenh
)
ScreenWorldLF:appendElements{
    WindowSpottingInfos,
    WindowSpottingPortrait,
    ButtonSpottingDraw,
    ButtonSpottingLock,
    ButtonSpottingLF,
    ButtonSpottingUP,
    ButtonSpottingDW,
    ButtonSpottingRG,
    ButtonSpottingUL,
    ButtonSpottingUR,
    ButtonSpottingDL,
    ButtonSpottingDR,
}

-- md panel
local ScreenWorldMD = CScreen{}
local WindowWorld      = CWindowWorld{spottedwindows = {WindowSpottingInfos, WindowSpottingPortrait}}
local WindowInfosWorld = CWindowInfosWorld{}
ScreenWorldMD:appendElements{
    WindowWorld,
    WindowInfosWorld,
}

-- rg panel
local ScreenWorldRG = CScreen{}
local WindowPlayerInfos    = CWindowPlayerInfos{}
local WindowPlayerPortrait = CWindowPlayerPortrait{}
local WindowPlayerStats    = CWindowPlayerStats{}
local WindowPlayerState    = CWindowPlayerState{}
local ButtonPlayerPrev     = CButtonPlayerPrev{}
local ButtonPlayerPick     = CButtonPlayerPick{}
local ButtonPlayerNext     = CButtonPlayerNext{}
ScreenWorldRG:elementsDistributeH(
    {ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext},
    WindowPlayerInfos.screenx + (
        (WindowPlayerInfos.screenw - CScreen:elementsTotalH({ButtonPlayerPrev, ButtonPlayerPick, ButtonPlayerNext})) // 2),
    WindowPlayerInfos.screeny - Tic.SPRITESIZE
)
ScreenWorldRG:appendElements{
    WindowPlayerInfos,
    WindowPlayerPortrait,
    WindowPlayerStats,
    WindowPlayerState,
    ButtonPlayerPrev,
    ButtonPlayerPick,
    ButtonPlayerNext,
}

ScreenWorld:appendElements{
    CWindowScreen{},
    ScreenWorldLF,
    ScreenWorldMD,
    ScreenWorldRG,
}
end

if false then
-- local ScreenIntro = CScreen{name = "Intro", keysfunctions = Tic.KEYSFUNCTIONSINTRO}
local ScreenIntro = CScreen{name = "Intro", keysfunctions = Tic.KEYSFUNCTIONSINTRO}
Tic:screenAppend(ScreenIntro)

local Button1 = CButton{
    -- screenx = 10,
    -- screeny = 10,
    screenw = 16,
    name = "plop 1",
    hovertext = "ksca",
}
local Button2 = CButton{
    -- screenx = 10,
    -- screeny = 20,
    name = "plop 2",
    hovertext = "LSCA",
}
local Button3 = CButton{
    -- screenx = 10,
    -- screeny = 30,
    screenw = 16,
    -- enabled = false,
    name = "dummy",
}
local Button4 = CButton{
    screenx = 10,
    screeny = 40,
    screenw = 16,
    display = false,
}
local Button5 = CButton{
    screenx = 10,
    screeny = 50,
    screenw = 16,
    rounded = false,
}
local Button6 = CButton{
    screenx = 10,
    screeny = 60,
    rounded = false,
}
local Button7 = CButton{
    screenx = 10,
    screeny = 70,
    screenw = 16,
    rounded = false,
    enabled = false,
}
local Button11 = CButtonArrowUL{}
local Button12 = CButtonArrowDL{}
local Button13 = CButtonArrowDR{}
local Button14 = CButtonArrowUR{}
local Button15 = CButtonCenter{}

local Button16 = CButtonCenter{
    screenx = 30,
    screeny = 60,
}
local Button17 = CButtonCenter{
    screenx = 30,
    screeny = 70,
    enabled = false,
}

ScreenIntro:appendElements{
    CWindowScreen(),
    CWindowInfos{
        screenx = 107,
        screeny = 60,
        drawground = false,
        drawframes = false,
        align = CWindowInfos.ALIGNMD,
        infos = {"Press", "Key",},
    },
    Button1,
    Button2,
    Button3,
    Button4,
    Button5,
    Button6,
    Button7,

    Button11,
    Button12,
    Button13,
    Button14,
    Button15,

    Button16,
    Button17,
    ButtonPlayerPrev,
    ButtonPlayerNext,
}

Button15.clicklf = Tic.FUNCTIONSCREENNEXT
local _function = function() Tic:logAppend("Plop") end
Button1.clicklf = _function
Button1.clickrg = _function
Button2.clicklf = _function
Button7.clicklf = Tic.FUNCTIONSCREENNEXT

ScreenIntro:elementsDistributeH({Button11, Button12, Button15, Button13, Button14}, 30, 10)
ScreenIntro:elementsDistributeV({Button1, Button2, Button3}, 10, 10, 2)
end
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

function CPlace:generateRandomRegionWorldCount(_count, _kinds, _worldregion) -- random number of places of kinds in region world
    _count        = _count       or CPlace.PLACECOUNT
    _kinds        = _kinds       or CPlace.PLACEKINDS
    _worldregion  = _worldregion or CRegionWorld{}
    local _region = CRegion{
        lf = _worldregion.worldx + _worldregion.region.lf,
        rg = _worldregion.worldx + _worldregion.region.rg,
        up = _worldregion.worldy + _worldregion.region.up,
        dw = _worldregion.worldy + _worldregion.region.dw,
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

function CPlace:generateRandomRegionWorldPercent(_percent, _kinds, _worldregion) -- random percent of places of kinds in region world
    _percent      = _percent     or 100
    _kinds        = _kinds       or CPlace.PLACEKINDS
    _worldregion  = _worldregion or CRegionWorld{}
    local _count  = math.sqrt(_worldregion.region:surface()) * _percent // 100
    CPlace:generateRandomRegionWorldCount(_count, _kinds, _worldregion)
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
-- local Truduk = CPlayerDwarf{name = "Truduk",
-- }
-- Truduk:randomWorldWindow()
-- local Prinnn = CPlayerGnome{name = "Prinnn",
--     coloreyesbg  = Tic.COLORRED,
--     coloreyesfg  = Tic.COLORORANGE,
-- }
-- local Kaptan = CPlayerMeduz{name = "Kaptan",
-- }
-- local Kaptin = CPlayerMeduz{name = "Kaptin",
--     colorhairsbg = Tic.COLORBLUEL,
--     colorhairsfg = Tic.COLORBLUEM,
--     coloreyesbg  = Tic.COLORBLUEM,
--     coloreyesfg  = Tic.COLORBLUEL,
-- }
-- local Aegeon = CPlayerElvwe{name = "Aegeon",
--     colorshirt   = Tic.COLORGREENL,
--     colorarmor   = Tic.COLORGREEND,
--     colorpants   = Tic.COLORGREENM,
-- }
-- local Nitcha = CPlayerDrowe{name = "Nitcha",
-- }
-- local Azarel = CPlayerAngel{name = "Azarel",
-- }
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
-- local Daemok = CPlayerDemon{name = "Daemok",
-- }
-- local Globth = CPlayerGolth{name = "Globth"
-- }
-- Globth:randomWorldWindow()

local Wulfie = CPlayerWolfe{name = "Wulfie",
    colorextra = Tic.COLORRED,
    worldx = 10,
}
-- Wulfie:randomWorldWindow()

local Oxboow = CPlayerGhost{name = "Oxboow",
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    drawspotted = true,
}
-- Oxboow:randomWorldWindow()


goto runit
::debug::
::runit::

--
-- Sprites -- TESTING
--
local SpriteSFX = CSpriteFGBoard{
    screenx = 30,
    screeny = 110,
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
local SpriteHTG = CSpriteFG{
    sprite = 458,
    screenx = 30,
    screeny = 100,
}
local SpriteBIS = CSpriteFGBoard{
    screenx = 30,
    screeny = 120,
    directives = Tic:boardDirectives(458),
}


--
-- Regions -- TESTING
--
local Region = CRegion{
    lf = -10,
    rg = 10,
    up = -10,
    dw = 10,
}

--
-- Places -- TESTING
--
if false then
Tic.DRAWHITBOX = false
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
local House1 = CPlaceHouseAnim{
    name = "House1",
    worldx = -20,
    worldy = 10,
}
local House2 = CPlaceHouseAnim{
    name = "House2",
    worldx = 30,
    worldy = 40,
}
local Kirke1 = CPlaceKirkeAnim{
    name = "Kirke1",
    worldx = -20,
    worldy = 40,
}
CPlace:generateRoad(House1.worldx, House1.worldy, House2.worldx, House2.worldy, 15)
CPlace:generateRoad(House1.worldx, House1.worldy, Kirke1.worldx, Kirke1.worldy, 20)
CPlace:generateRoad(House2.worldx, House2.worldy, Kirke1.worldx, Kirke1.worldy, 10)
CPlace:generateRoad(House1.worldx, House1.worldy, House2.worldx, House2.worldy, 10, 5, 5, Tables:generate{
    [CPlaceTree0Anim] = 4,
    -- [CPlaceTree0Idle] = 1,
})
end

-- Tic.DRAWHITBOX  = true
-- Tic.DRAWBORDERS = true
-- Tic.DRAWVIEW    = true



--
-- Drawing
--
function Tic:draw()
    if true then
    Tic.inputsDo()

    Tic:screenActual():draw()

    Tic:drawLog()
    Tic:logPrint()

    SpriteSFX:draw()
    SpriteHTG:draw()
    SpriteBIS:draw()

    Tic:tick() -- [!] required in the draw function
    end
end


function Tic:drawLog() -- [-] remove
    local _tick00 = Tic.TICK00.actvalue
    local _tick60 = Tic.TICK60.actvalue
    local _playeractual = Tic:playerActual()
    if not _playeractual then return end
    local _state   = _playeractual.state
    local _posture = Tic.STATESETTINGS[_state].posture
    local _status  = Tic.STATESETTINGS[_state].status
    local _dirx    = _playeractual.dirx
    local _diry    = _playeractual.diry
    
    -- for _key, _val in pairs(Tic.MODIFIERKEYS) do -- modifier keys state
    --     Tic:logAppend(_key, _val)
    -- end

    -- Tic:logAppend("wx", _playeractual.worldx)
    -- Tic:logAppend("wy", _playeractual.worldy)

    -- Tic:logAppend(Nums:frequence01(_tick00, Tic.FREQUENCE0240))
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
