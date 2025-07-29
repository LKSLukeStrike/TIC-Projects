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


-- Texts
Tic.TEXTSPOT    = "Spot"
Tic.TEXTPICK    = "Pick"
Tic.TEXTLOCK    = "Lock"
Tic.TEXTUNLOCK  = "Unlock"
Tic.TEXTMOVE    = "Move"
Tic.TEXTPREV    = "Prev"
Tic.TEXTNEXT    = "Next"
Tic.TEXTEDIT    = "Edit"
Tic.TEXTDROP    = "Drop"
Tic.TEXTSTAND   = "Stand"
Tic.TEXTKNEEL   = "Kneel"
Tic.TEXTWORK    = "Work"
Tic.TEXTSLEEP   = "Sleep"
Tic.TEXTDEFAULT = "Default"
Tic.TEXTSAY     = "Say"
Tic.TEXTMIN     = "First"
Tic.TEXTMAX     = "Last"
Tic.TEXTSAYS    = "says"
Tic.TEXTGETS    = "gets"


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


-- World Infos Window positions and sizes (hud)
Tic.WORLDINFOSWW = 120 -- world infos window width
Tic.WORLDINFOSWH = 10 -- world infos window height
Tic.WORLDINFOSWX = (Tic.SCREENW - Tic.WORLDINFOSWW) // 2 -- world infos window x position
Tic.WORLDINFOSWY = 3 -- world infos window y position

-- World Window positions and sizes (hud)
Tic.WORLDWW  = Tic.WORLDINFOSWW -- world window width
Tic.WORLDWH  = 96  -- world window height
Tic.WORLDWX  = Tic.WORLDINFOSWX -- world window x position
Tic.WORLDWY  = Tic.WORLDINFOSWY + Tic.WORLDINFOSWH + 7 -- world window y position
Tic.WORLDWW2 = Tic.WORLDWW // 2 -- half world window width
Tic.WORLDWH2 = Tic.WORLDWH // 2 -- half world window height
Tic.WORLDWX2 = Tic.WORLDWX + Tic.WORLDWW2 -- half world window x position
Tic.WORLDWY2 = Tic.WORLDWY + Tic.WORLDWH2 -- half world window y position

-- World Messages Window positions and sizes (hud)
Tic.WORLDMESSAGESWW = Tic.WORLDINFOSWW -- world messages window width
Tic.WORLDMESSAGESWH = 10 -- world messages window height
Tic.WORLDMESSAGESWX = Tic.WORLDINFOSWX -- world messages window x position
Tic.WORLDMESSAGESWY = Tic.WORLDWY + Tic.WORLDWH + 7 -- world messages window y position


-- Player Infos Window positions and sizes (hud)
Tic.PLAYERINFOSWW = 26 -- player infos window width
Tic.PLAYERINFOSWH = 16 -- player infos window height
Tic.PLAYERINFOSWX = ((Tic.WORLDWX - Tic.PLAYERINFOSWW) // 2) -- player infos window x position
Tic.PLAYERINFOSWY = Tic.WORLDWY -- player infos window y position

-- Player Portrait Window positions and sizes (hud)
Tic.PLAYERPORTRAITWW = 16 -- player portrait window width
Tic.PLAYERPORTRAITWH = 16 -- player portrait window height
-- Tic.PLAYERPORTRAITWX = Tic.SCREENW - Tic.PLAYERPORTRAITWW - ((Tic.WORLDWX - Tic.PLAYERPORTRAITWW) // 2) -- player portrait window x position
Tic.PLAYERPORTRAITWX = ((Tic.WORLDWX - Tic.PLAYERPORTRAITWH) // 2) -- player portrait window x position
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
Tic.SPOTTINGINFOSWX = Tic.SCREENW - Tic.PLAYERINFOSWW - ((Tic.WORLDWX - Tic.PLAYERINFOSWW) // 2) -- spotting infos window x position
Tic.SPOTTINGINFOSWY = Tic.WORLDWY -- spotting infos window y position

-- Spotting Portrait Window positions and sizes (hud)
Tic.SPOTTINGPORTRAITWW = 16 -- spotting portrait window width
Tic.SPOTTINGPORTRAITWH = 16 -- spotting portrait window height
Tic.SPOTTINGPORTRAITWX = Tic.SCREENW - Tic.SPOTTINGPORTRAITWW - ((Tic.WORLDWX - Tic.SPOTTINGPORTRAITWW) // 2) -- spotting portrait window x position
Tic.SPOTTINGPORTRAITWY = Tic.SPOTTINGINFOSWY + 26 -- spotting portrait window y position

-- Interactions Window positions and sizes (hud)
Tic.INTERACTIONSWX = Tic.WORLDWX + Tic.WORLDWW -- interactions window x position
Tic.INTERACTIONSWY = Tic.SPOTTINGPORTRAITWY + 30 -- interactions window y position
Tic.INTERACTIONSWW = Tic.SCREENW - Tic.INTERACTIONSWX -- interactions window width
Tic.INTERACTIONSWH = Tic.SCREENH - Tic.INTERACTIONSWY -- interactions window height

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
        dropx   = 0,
        dropy   = Nums:neg(Tic.SPRITESIZE),
    },
    [Tic.DIR045] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 0,
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYUP,
        dropx   = Nums:pos(Tic.SPRITESIZE),
        dropy   = Nums:neg(Tic.SPRITESIZE),
    },
    [Tic.DIR090] = {
        offsetx = Nums:pos(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 1,
        screeny = nil, -- double line
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYMD,
        dropx   = Nums:pos(Tic.SPRITESIZE),
        dropy   = 0,
    },
    [Tic.DIR135] = {
        offsetx = Nums:pos(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 1,
        screeny = 1,
        dirx    = Tic.DIRXRG,
        diry    = Tic.DIRYDW,
        dropx   = Nums:pos(Tic.SPRITESIZE),
        dropy   = Nums:pos(Tic.SPRITESIZE),
    },
    [Tic.DIR180] = {
        offsetx = Nums:pos(Tic.OFFSETZERO),
        offsety = Nums:pos(Tic.OFFSETLINE),
        screenx = nil, -- double line
        screeny = 0,
        dirx    = nil,
        diry    = Tic.DIRYDW,
        dropx   = 0,
        dropy   = Nums:pos(Tic.SPRITESIZE),
    },
    [Tic.DIR225] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:pos(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 1,
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYDW,
        dropx   = Nums:neg(Tic.SPRITESIZE),
        dropy   = Nums:pos(Tic.SPRITESIZE),
    },
    [Tic.DIR270] = {
        offsetx = Nums:neg(Tic.OFFSETLINE),
        offsety = Nums:pos(Tic.OFFSETZERO),
        screenx = 0,
        screeny = nil, -- double line
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYMD,
        dropx   = Nums:neg(Tic.SPRITESIZE),
        dropy   = 0,
    },
    [Tic.DIR315] = {
        offsetx = Nums:neg(Tic.OFFSETDIAG),
        offsety = Nums:neg(Tic.OFFSETDIAG),
        screenx = 0,
        screeny = 0,
        dirx    = Tic.DIRXLF,
        diry    = Tic.DIRYUP,
        dropx   = Nums:neg(Tic.SPRITESIZE),
        dropy   = Nums:neg(Tic.SPRITESIZE),
    },
}
Tic.DIRSCYCLER = CCyclerTable{acttable = { -- 8 directions around
    Tic.DIR000,
    Tic.DIR045,
    Tic.DIR090,
    Tic.DIR135,
    Tic.DIR180,
    Tic.DIR225,
    Tic.DIR270,
    Tic.DIR315,
}}

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
Tic.FUNCTIONPLAYERMIN           = function() Tic:playerMin() end
Tic.FUNCTIONPLAYERMAX           = function() Tic:playerMax() end
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
Tic.FUNCTIONSLOTGETHEAD         = function() return Tic:slotGetHead() end
Tic.FUNCTIONSLOTGETBACK         = function() return Tic:slotGetBack() end
Tic.FUNCTIONSLOTGETHANDLF       = function() return Tic:slotGetHandLF() end
Tic.FUNCTIONSLOTGETHANDRG       = function() return Tic:slotGetHandRG() end
Tic.FUNCTIONSLOTDROPHEAD        = function() return Tic:slotDropHead() end
Tic.FUNCTIONSLOTDROPBACK        = function() return Tic:slotDropBack() end
Tic.FUNCTIONSLOTDROPHANDLF      = function() return Tic:slotDropHandLF() end
Tic.FUNCTIONSLOTDROPHANDRG      = function() return Tic:slotDropHandRG() end

-- Keys to Functions -- per screen
Tic.KEYSFUNCTIONSINTRO = { -- FIXME conflict with key any
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

    _result.screenx, _result.screeny, _result.clicklf, _result.clickmd, _result.clickrg, _result.scrollx, _result.scrolly
        = mouse()
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

function Tic:buttonsInsertButton(_button) -- insert button (once)
    Tables:valInsert(Tic.BUTTONS, _button, true)
end

function Tic:buttonsInsertButtons(_buttons) -- insert buttons (once)
    for _, _button in ipairs(_buttons or {}) do
        Tic:buttonsInsertButton(_button)
    end
end

function Tic:buttonsRemoveButton(_button) -- remove button (all)
    Tables:valRemove(Tic.BUTTONS, _button, false)
end

function Tic:buttonsRemoveButtons(_buttons) -- remove buttons (all)
    for _, _button in ipairs(_buttons or {}) do
        Tic:buttonsRemoveButton(_button)
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
    Tic:keyboardClearKeysFunctions()
    Tic:buttonsClearButtons()
    while Tic.SCREENS.actindex <= _actindex do -- pile each screen
        if Tic:screenActual() then Tic:screenActual():draw() end
        if Tic.SCREENS.actindex == _actindex then break else Tic:screenNext() end
    end
end

function Tic:screenActual() -- actual screen in the stack
    return Tic.SCREENS.actvalue
end

function Tic:screenMin() -- first screen in the stack
    return Tic.SCREENS:min()
end

function Tic:screenMax() -- last screen in the stack
    return Tic.SCREENS:max()
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

function Tic:playerActual() -- actual player in the stack
    return Tic.PLAYERS.actvalue
end

function Tic:playerPlayers() -- all players in the stack
    return Tic.PLAYERS.acttable
end

function Tic:playerAppend(_player) -- stack a new player
    if Tables:valFind(Tic:playerPlayers(), _player) then return end -- avoid doublons
    return Tic.PLAYERS:insert(_player)
end

function Tic:playerPrev() -- prev player in the stack
    return Tic.PLAYERS:prev()
end

function Tic:playerNext() -- next player in the stack
    return Tic.PLAYERS:next()
end

function Tic:playerMin() -- first player in the stack
    return Tic.PLAYERS:min()
end

function Tic:playerMax() -- last player in the stack
    return Tic.PLAYERS:max()
end

function Tic:playerFind(_player) -- find player in the stack -- return index or nil
    return Tables:valFind(Tic:playerPlayers(), _player)
end

function Tic:playerPick(_player) -- fipicknd player in the stack
    return Tic.PLAYERS:at(Tic:playerFind(_player))
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


-- Messages System -- handle a messages stack
Tic.MESSAGES    = CCyclerTable{acttable = {"Welcome ..."}}

function Tic:messageActual() -- actual message in the stack
    return Tic.MESSAGES.actvalue
end

function Tic:messageMessages() -- all messages in the stack
    return Tic.MESSAGES.acttable
end

function Tic:messageAppend(_message) -- stack a new message
	if not _message then return end -- mandatory
    return Tic.MESSAGES:insert(_message)
end

function Tic:messagePrev() -- prev message in the stack
    return Tic.MESSAGES:prev()
end

function Tic:messageNext() -- next message in the stack
    return Tic.MESSAGES:next()
end

function Tic:messageMin() -- first message in the stack
    return Tic.MESSAGES:min()
end

function Tic:messageMax() -- last message in the stack
    return Tic.MESSAGES:max()
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


-- Character System
function Tic:characterFunction(_character, _function, _argt)
    _character = _character or Tic:playerActual()
    if not _character or not _function or not _character[_function] then return end
    _argt = _argt or {}
	return _character[_function](_character, _argt)
end

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
Tic.BIOMES = CCyclerTable{acttable = { -- biomes cycler
    Tic.COLORBIOMENIGHT, -- TODO add real biomes instead of just colors ?
    Tic.COLORBIOMESNOWY,
    Tic.COLORBIOMESANDY,
    Tic.COLORBIOMEGREEN,
    Tic.COLORBIOMEROCKY,
}}

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
    if not _character then return end
	return _character:entitySpotting()
end

function Tic:entityHovering(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:entityHovering()
end

function Tic:spottingActual(_character)
    return (Tic:entityHovering(_character)) and Tic:entityHovering(_character) or Tic:entitySpotting(_character)
end


-- Slot System
function Tic:slotGetHead(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character.slots.head.object
end

function Tic:slotGetBack(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character.slots.back.object
end

function Tic:slotGetHandLF(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character.slots.handlf.object
end

function Tic:slotGetHandRG(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character.slots.handrg.object
end

function Tic:slotDropAll(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotDropAll()
end

function Tic:slotDropHead(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then Tic:slotDropAll(_character) end
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotDropHead()
end

function Tic:slotDropBack(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then Tic:slotDropAll(_character) end
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotDropBack()
end

function Tic:slotDropHandLF(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then Tic:slotDropAll(_character) end
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotDropHandLF()
end

function Tic:slotDropHandRG(_character)
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then Tic:slotDropAll(_character) end
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotDropHandRG()
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



require("libraries/tic/Sprites")                

require("libraries/tic/Animations")                

require("libraries/tic/Interactions")                

require("libraries/tic/Slots")                

require("libraries/tic/Inventories")                

require("libraries/tic/Regions")                

require("libraries/tic/Hitboxes")                

require("libraries/tic/Locations")

require("libraries/tic/EntitiesLocations")

require("libraries/tic/Entities")




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
-- CWorld instance -- FIXME define later/worlds system
World = CWorld{}
function Tic:worldActual() -- TEMP
    return World
end

function CWorld:appendEntity(_entity, _range, _trials) -- append an entity in the world
    if not _entity then return end -- mandatory
    _entity.world = self -- parent world
    self.entitieslocations:appendEntity(_entity, _range, _trials)
end

function CWorld:deleteEntity(_entity) -- delete an entity from the world
    if not _entity then return end -- mandatory
    self.entitieslocations:deleteEntity(_entity)
end

function CWorld:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials) -- move an entity into the world
    if not _entity or not _worldx or not _worldy then return end -- mandatory
    self.entitieslocations:moveEntityWorldXY(_entity, _worldx, _worldy, _range, _trials)
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


require("libraries/tic/Objects")


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
                        }
    self.interactions = {
                         CInteractionSayMessage{},
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

    if not  self.inventories.any then self.inventories.any = CInventoryAny{} end
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
        _object.discovered = true -- the object is discovered
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

    self.inventories.any = nil -- get rid of extra objects
end

function CCharacter:slotDropAll()
    self:slotDropHead()
    self:slotDropBack()
    self:slotDropHandRG()
    self:slotDropHandLF()
end

function CCharacter:slotDropHead()
    local _object = self.slots.head.object
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropBack()
    local _object = self.slots.back.object
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropHandRG()
    local _object = self.slots.handrg.object
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropHandLF()
    local _object = self.slots.handlf.object
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:dropObject(_object)
    if not _object then return end
    for _, _slot in pairs(self.slots or {}) do -- remove object from slots
        if CSlot:isSlot(_slot) then
            _slot:removeObject(_object, true)
        end
    end
    for _, _inventory in pairs(self.inventories or {}) do -- remove object from inventories
        if CInventory:isInventory(_inventory) then
            _inventory:removeObject(_object)
        end
    end

    local _direction = self.direction -- prepare the trials for dropping
    Tic.DIRSCYCLER:at(Tables:valFind(Tic.DIRSCYCLER.acttable, _direction))
    local _actindex = Tic.DIRSCYCLER.actindex
    local _next = (self.dirx == Tic.DIRXRG) and true or false -- rotating direction -- next or prev
    local _trials = {}
    repeat
        _direction = Tic.DIRSCYCLER.actvalue
        local _dropx = Tic.DIRSOFFSETS[_direction].dropx
        local _dropy = Tic.DIRSOFFSETS[_direction].dropy
        Tables:valInsert(_trials, {worldx = self.worldx + _dropx, worldy = self.worldy + _dropy})
        if _next then Tic.DIRSCYCLER:next() else Tic.DIRSCYCLER:prev() end
    until Tic.DIRSCYCLER.actindex == _actindex

    _object.worldx = self.worldx
    _object.worldy = self.worldy
    _object.dirx = self.dirx
    self.world:appendEntity(_object, Tic.SPRITESIZE, _trials)
    return _object
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
            self:moveDirection(Tables:valPickRandom(Tic.DIRSCYCLER.acttable), true)
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
    if not self:canInteract() then return end -- dont draw
    local _posture         = self:postureGet()
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

function CCharacter:canInteract()
    if not (self == Tic:playerActual()) then return false end -- cannot interact
    if self:postureGet() == Tic.POSTUREFLOOR then return false end -- cannot interact
    if not self:hasInteractTo() then return false end -- cannot interact
    local _interactto   = self.interactto
    local _interactions = _interactto.interactions
    if Tables:size(_interactions) == 0 then return false end -- cannot interact
    for _, _interaction in ipairs(_interactions) do
        if _interaction.interactiflf and _interaction:interactiflf(self, _interactto) then return true end
        if _interaction.interactifrg and _interaction:interactifrg(self, _interactto) then return true end
    end
    return false
end

function CCharacter:doSayMessage(_argt)
    local _message = _argt.message or "Hello"
    Tic:messageAppend(self.name.." "..Tic.TEXTSAYS..": '".._message.." "..self.interactto.name.."'")
end

function CCharacter:ifPickObject(_argt)
    return true
end

function CCharacter:doPickObject(_argt)
    Tic:messageAppend(self.name.." "..Tic.TEXTGETS..": "..self.interactto.kind.." "..self.interactto.name)
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
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle work
    if _posture == Tic.POSTUREFLOOR then -- sleep to stand + work
        _posture = Tic.POSTURESTAND
        _status  = Tic.STATUSWORK
    elseif _status == Tic.STATUSIDLE then -- idle to work
        _status  = Tic.STATUSWORK
    else -- work to idle
        _status  = Tic.STATUSIDLE
    end
	self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleKneel() -- toggle stand vs kneel
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle sleep
    if _posture == Tic.POSTURESTAND then -- stand to kneel
        _posture = Tic.POSTUREKNEEL
    elseif _posture == Tic.POSTUREKNEEL then -- kneel to stad
        _posture = Tic.POSTURESTAND
    else -- sleep to kneel
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
    if _posture == Tic.POSTUREFLOOR then -- sleep to stand
        _posture = Tic.POSTURESTAND
        _status  = Tic.STATUSIDLE
    else -- stand/kneel to sleep
        _posture = Tic.POSTUREFLOOR
        _status  = Tic.STATUSSLEEP
    end
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


--
-- CPlayerHumanoid
--
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


require("libraries/tic/Elements")

require("libraries/tic/Texts")
  
require("libraries/tic/Buttons")

require("libraries/tic/Windows")

require("libraries/tic/Screens")



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

Button1 = CButtonMenuM2{
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
    text = CText{text = "Bla"},
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

Button15.clicklf = Tic.FUNCTIONSCREENNEXT
-- Button7.clicklf = Tic.FUNCTIONSCREENNEXT

ScreenIntro:elementsDistributeH({Button11, Button12, Button15, Button13, Button14}, 30, 10)
ScreenIntro:elementsDistributeV({Button1, Button2, Button3}, 10, 10, 2)

ScreenIntro:appendElements{
    CWindowScreen{name = "Intro", colorground = Tic.COLORRED},
    CWindowInfos{
        name = "PressKey",
        drawground = false,
        drawframes = false,
        elements = {CText{text = "Press"}, CText{text = "a"}, CText{text = "Key"}},
    },
    Button1,
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
end

if true then
ScreenWorld = CScreen{name = "ScreenWorld", keysfunctions = Tic.KEYSFUNCTIONSWORLD}

-- lf panel
ScreenWorldLF = CScreen{name = "ScreenWorldLF"}

WindowPlayerInfos    = CWindowPlayerInfos{}
ButtonPlayerPrev     = CButtonPlayerPrev{}
ButtonPlayerPick     = CButtonPlayerPick{}
ButtonPlayerNext     = CButtonPlayerNext{}
ScreenWorldLF:elementsDistributeH(
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
ScreenWorldLF:elementsDistributeH( -- up h line
    {ButtonPlayerMove315, ButtonPlayerMove045},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldLF:elementsDistributeH( -- md h line
    {ButtonPlayerMove270, ButtonPlayerMove090},
    WindowPlayerPortrait.screenx - 7,
    WindowPlayerPortrait.screeny + 4,
    14
)
ScreenWorldLF:elementsDistributeH( -- dw h line
    {ButtonPlayerMove225, ButtonPlayerMove135},
    WindowPlayerPortrait.screenx - 6,
    WindowPlayerPortrait.screeny + WindowPlayerPortrait.screenh - 2,
    12
)
ScreenWorldLF:elementsDistributeV( -- md v line
    {ButtonPlayerMove000, ButtonPlayerMove180},
    WindowPlayerPortrait.screenx + 4,
    WindowPlayerPortrait.screeny - 7,
    14
)
ScreenWorldLF:elementsDistributeH( -- head and back slots
    {ButtonSlotPlayerHead, ButtonSlotPlayerBack},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny - 2,
    28
)
ScreenWorldLF:elementsDistributeH( -- handrg and handlf slots
    {ButtonSlotPlayerHandRG, ButtonSlotPlayerHandLF},
    WindowPlayerPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowPlayerPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

WindowPlayerStats    = CWindowPlayerStats{}
ButtonPlayerStatPhy  = CButtonPlayerStatPhy{}
ButtonPlayerStatMen  = CButtonPlayerStatMen{}
ButtonPlayerStatPsy  = CButtonPlayerStatPsy{}
ScreenWorldLF:elementsDistributeH(
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
ScreenWorldLF:elementsDistributeV(
    {ButtonPlayerStand, ButtonPlayerKneel},
    WindowPlayerState.screenx - Tic.SPRITESIZE,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerStand, ButtonPlayerKneel})) // 2)
)
ScreenWorldLF:elementsDistributeV(
    {ButtonPlayerWork, ButtonPlayerSleep},
    WindowPlayerState.screenx + WindowPlayerState.screenw,
    WindowPlayerState.screeny + (
        (WindowPlayerInfos.screenh - CScreen:elementsTotalH({ButtonPlayerWork, ButtonPlayerSleep})) // 2)
)

ScreenWorldLF:appendElements{
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

-- md panel
ScreenWorldMD = CScreen{name = "ScreenWorldMD"}

WindowWorld      = CWindowWorld{}
WindowInfosWorld = CWindowInfosWorld{}
WindowMessagesWorld = CWindowMessagesWorld{}
ScreenWorldMD:appendElements{
    WindowWorld,
    WindowInfosWorld,
    WindowMessagesWorld,
}

-- rg panel
ScreenWorldRG = CScreen{name = "ScreenWorldRG"}

WindowSpottingInfos    = CWindowSpottingInfos{}
ButtonSpottingSpot     = CButtonSpottingSpot{}
ButtonSpottingLock     = CButtonSpottingLock{}
ButtonSpottingPick     = CButtonSpottingPick{}
ScreenWorldRG:elementsDistributeH(
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
ScreenWorldRG:elementsDistributeH( -- up h line
    {ButtonSpotting135, ButtonSpotting225},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny - Tic.SPRITESIZE + 2,
    12
)
ScreenWorldRG:elementsDistributeH( -- md h line
    {ButtonSpotting090, ButtonSpotting270},
    WindowSpottingPortrait.screenx - 7,
    WindowSpottingPortrait.screeny + 4,
    14
)
ScreenWorldRG:elementsDistributeH( -- dw h line
    {ButtonSpotting045, ButtonSpotting315},
    WindowSpottingPortrait.screenx - 6,
    WindowSpottingPortrait.screeny + WindowSpottingPortrait.screenh - 2,
    12
)
ScreenWorldRG:elementsDistributeV( -- md v line
    {ButtonSpotting180, ButtonSpotting000},
    WindowSpottingPortrait.screenx + 4,
    WindowSpottingPortrait.screeny - 7,
    14
)
ScreenWorldRG:elementsDistributeH( -- head and back slots
    {ButtonSlotSpottingHead, ButtonSlotSpottingBack},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny - 2,
    28
)
ScreenWorldRG:elementsDistributeH( -- handrg and handlf slots
    {ButtonSlotSpottingHandRG, ButtonSlotSpottingHandLF},
    WindowSpottingPortrait.screenx - Tic.SPRITESIZE - 6,
    WindowSpottingPortrait.screeny + Tic.SPRITESIZE + 2,
    28
)

WindowMenuInteractions = CWindowMenuInteractions{}
ButtonInteractions = CButtonInteractions{}
ScreenWorldRG:elementsDistributeH(
    {ButtonInteractions},
    WindowMenuInteractions.screenx + (
        (WindowMenuInteractions.screenw - CScreen:elementsTotalW({ButtonInteractions})) // 2),
    WindowMenuInteractions.screeny - Tic.SPRITESIZE
)


ScreenWorldRG:appendElements{
    WindowSpottingPortrait,
    WindowSpottingInfos,
    WindowMenuInteractions,
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
    ButtonInteractions,
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
-- if true then Tic:screenAppend(ScreenIntro) end
if true then Tic:screenAppend(ScreenWorld) end
-- if true then Tic:screenAppend(ScreenMenus) end
Tic:screenMin()
if true then Tic.INVENTORYSCREEN = ScreenMenus end


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
if false then
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
-- Sword = CWeaponSword{name = "swo_1"}
-- Flask = CObjectFlaskSmall{name = "fla_1"}

Globth = CPlayerGolth{name = "Globth",
    ["slots.head"] = CSlotHead{object = CClothesHatMedium{}},
    ["slots.back"] = CSlotBack{object = CClothesBackPackSmall{}},
    ["slots.handrg"] = CSlotHand{object = CWeaponBowMedium{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldMedium{name = "ecu_1"}},
    -- ["inventories.any"] = CInventoryAny{objects = {Sword, Flask}},
    statmenact = 10,
}
-- Globth.slots.head.object.palettefg = {
--     [CObject.HANDLE] = Tic.COLORKEY,
--     [CObject.BORDER] = Tic.COLORGREYL,
--     [CObject.INSIDE] = Tic.COLORORANGE,
--     [CObject.EFFECT] = Tic.COLORRED,
-- }


-- Globth:randomWorldWindow()
end
-- exit()


local _playerclass = CPlayerTifel
if true then
--
-- phy
--
if true then
Walfie = _playerclass{classed = _playerclass,
    name = "Walfie",
    size = Tic.SIZES,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORPURPLE,
    worldx = 0,
    worldy = -20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponSword{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldSmall{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectBombSmall{used = CObject.USEDFULL}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetSmall{}},
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
    worldx = 20,
    worldy = -20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponHammer{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldMedium{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectBombMedium{used = CObject.USEDHALF}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetMedium{}},
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
    worldx = 40,
    worldy = -20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponLance{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponShieldLarge{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectBombLarge{used = CObject.USEDNONE}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesBackPackLarge{}},
}
end
--
-- men
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
    worldy = 0,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowSmall{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponBookSmall{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectFlaskSmall{used = CObject.USEDFULL}},
    ["slots.head"]   = CSlotHead{object = CClothesHatSmall{}},
    ["slots.back"]   = CSlotBack{object = CClothesToolBoxSmall{}},
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
    worldx = 20,
    worldy = 0,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowMedium{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponBookMedium{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectFlaskMedium{used = CObject.USEDHALF}},
    ["slots.head"]   = CSlotHead{object = CClothesHatMedium{}},
    ["slots.back"]   = CSlotBack{object = CClothesToolBoxMedium{}},
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
    worldx = 40,
    worldy = 0,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponBowLarge{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponBookLarge{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectFlaskLarge{used = CObject.USEDNONE}},
    ["slots.head"]   = CSlotHead{object = CClothesHatLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesToolBoxLarge{}},
}
end
--
-- psy
--
if true then
Wolfie = _playerclass{classed = _playerclass,
    name = "W1lfie",
    size = Tic.SIZES,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREEND,
    worldx = 0,
    worldy = 20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponWandSmall{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponRuneSmall{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectSpellSmall{used = CObject.USEDFULL}},
    ["slots.head"]   = CSlotHead{object = CClothesCapSmall{}},
    ["slots.back"]   = CSlotBack{object = CClothesScrollCaseSmall{}},
}
end
if true then
Wulfie = _playerclass{classed = _playerclass,
    name = "W2lfie",
    size = Tic.SIZEM,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREENM,
    worldx = 20,
    worldy = 20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponWandMedium{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponRuneMedium{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectSpellMedium{used = CObject.USEDHALF}},
    ["slots.head"]   = CSlotHead{object = CClothesCapMedium{}},
    ["slots.back"]   = CSlotBack{object = CClothesScrollCaseMedium{}},
}
end
if true then
Wylfie = _playerclass{classed = _playerclass,
    name = "W3lfie",
    size = Tic.SIZEL,
    statphyact = 10,
    statmenact = 10,
    statpsyact = 10,
    -- colorextra = Tic.COLORGREENL,
    worldx = 40,
    worldy = 20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHand{object = CWeaponWandLarge{}},
    ["slots.handlf"] = CSlotHand{object = CWeaponRuneLarge{}},
    -- ["slots.handlf"] = CSlotHand{object = CObjectSpellLarge{used = CObject.USEDNONE}},
    ["slots.head"]   = CSlotHead{object = CClothesCapLarge{}},
    ["slots.back"]   = CSlotBack{object = CClothesScrollCaseLarge{}},
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
