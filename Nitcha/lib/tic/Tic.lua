-- Tic object
-- Instance only once
--

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
Classic = require("lib/ext/Classic")

CCycler = require("lib/lks/CCycler")
Names   = require("lib/lks/Names")
Nums    = require("lib/lks/Nums")
Tables  = require("lib/lks/Tables")
Utils   = require("lib/lks/Utils")


--
-- Strings -- for debugging
--
A = "A:"
B = "B:"
C = "C:"
D = "D:"
E = "E:"
F = "F:"
G = "G:"
H = "H:"
I = "I:"
J = "J:"
K = "K:"
L = "L:"
M = "M:"
N = "N:"
O = "O:"
P = "P:"
Q = "Q:"
R = "R:"
S = "S:"
T = "T:"
U = "U:"
V = "V:"
W = "W:"
X = "X:"
Y = "Y:"
Z = "Z:"


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
Tic.TEXTFIRST   = "First"
Tic.TEXTLAST    = "Last"
Tic.TEXTEDIT    = "Edit"
Tic.TEXTDROP    = "Drop"
Tic.TEXTSTAND   = "Stand"
Tic.TEXTKNEEL   = "Kneel"
Tic.TEXTWORK    = "Work"
Tic.TEXTSLEEP   = "Sleep"
Tic.TEXTDEFAULT = "Default"
Tic.TEXTSAY     = "Say"
Tic.TEXTDELONE  = "Trash"
Tic.TEXTDELALL  = "All"
Tic.TEXTPARTY   = "Party"
Tic.TEXTJOIN    = "Join"
Tic.TEXTQUIT    = "Quit"
Tic.TEXTLEAD    = "Lead"
Tic.TEXTPHY     = "Phy"
Tic.TEXTMEN     = "Men"
Tic.TEXTPSY     = "Psy"
Tic.TEXTMAX     = "Max"
Tic.TEXTACT     = "Act"
Tic.TEXTINV     = "Inv"

Tic.TEXTWELCOME = "Welcome ..."


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
Tic.PLAYERSTATSWY = Tic.PLAYERPORTRAITWY + 28 -- player stats window y position

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
Tic.INTERACTIONSWY = Tic.SPOTTINGPORTRAITWY + 28 -- interactions window y position
Tic.INTERACTIONSWW = Tic.SCREENW - Tic.INTERACTIONSWX -- interactions window width
Tic.INTERACTIONSWH = Tic.SCREENH - Tic.INTERACTIONSWY -- interactions window height

-- Palette vram
Tic.PALETTEVRAM = 0x3FF0 * 2 -- vram bank 1

-- Sprites vram
Tic.SPRITESVRAM = 0x4000 -- start at tiles sprites

-- Sprites size
Tic.SPRITESIZE  = 8 -- sprites size in pixels
Tic.SPRITESIZE2 = Tic.SPRITESIZE // 2 -- half sprites size in pixels

-- Palette size
Tic.PALETTESIZE  = 16 -- number of colors

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
Tic.COLORGREENL = Tic.COLOR05 -- greenl
Tic.COLORGREENM = Tic.COLOR06 -- greenm
Tic.COLORGREEND = Tic.COLOR07 -- greend
Tic.COLORBLUEL  = Tic.COLOR10 -- bluel
Tic.COLORBLUEM  = Tic.COLOR09 -- bluem
Tic.COLORBLUED  = Tic.COLOR08 -- blued
Tic.COLORCYAN   = Tic.COLOR11 -- cyan
Tic.COLORWHITE  = Tic.COLOR12 -- white
Tic.COLORGREYL  = Tic.COLOR13 -- greyl
Tic.COLORGREYM  = Tic.COLOR14 -- greym
Tic.COLORGREYD  = Tic.COLOR15 -- greyd

-- Palette colors names
Tic.COLORNAMES = {
    [Tic.COLOR00] = "black",
    [Tic.COLOR01] = "purple",
    [Tic.COLOR02] = "red",
    [Tic.COLOR03] = "orange",
    [Tic.COLOR04] = "yellow",
    [Tic.COLOR05] = "greenl",
    [Tic.COLOR06] = "greenm",
    [Tic.COLOR07] = "greend",
    [Tic.COLOR08] = "bluel",
    [Tic.COLOR09] = "bluem",
    [Tic.COLOR10] = "blued",
    [Tic.COLOR11] = "cyan",
    [Tic.COLOR12] = "white",
    [Tic.COLOR13] = "greyl",
    [Tic.COLOR14] = "greym",
    [Tic.COLOR15] = "greyd",
}

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
Tic.COLORHAIRSBG  = Tic.COLORGREYD -- 4 colors for the heads
Tic.COLORHAIRSFG  = Tic.COLORGREYM
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

-- Palette colors for hover texts
Tic.COLORHOVERGROUND = Tic.COLORBLACK
Tic.COLORHOVERMOUSE  = Tic.COLORBLUEL
Tic.COLORHOVERINFOS  = Tic.COLORBLUEM

-- Palette colors for hovered/actived
Tic.COLORENABLED     = Tic.COLORGREYM
Tic.COLORHOVERED     = Tic.COLORGREYD
Tic.COLORACTIVED     = Tic.COLORBLUEL

-- Flips
Tic.FLIPNONE = 0 -- none
Tic.FLIPHORI = 1 -- horizontal
Tic.FLIPVERT = 2 -- vertical
Tic.FLIPBOTH = 3 -- both

-- Rotations
Tic.ROTATE000  = 0 -- sprite rotations
Tic.ROTATE090  = 1
Tic.ROTATE180  = 2
Tic.ROTATE270  = 3


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

-- Functions Values
Tic.FUNCTIONPLAYERPREV          = function() Tic:playerPrev() end
Tic.FUNCTIONPLAYERNEXT          = function() Tic:playerNext() end
Tic.FUNCTIONPLAYERMIN           = function() Tic:playerMin() end
Tic.FUNCTIONPLAYERMAX           = function() Tic:playerMax() end
Tic.FUNCTIONMESSAGEPREV         = function() Tic:messagePrev() end
Tic.FUNCTIONMESSAGENEXT         = function() Tic:messageNext() end
Tic.FUNCTIONMESSAGEMIN          = function() Tic:messageMin() end
Tic.FUNCTIONMESSAGEMAX          = function() Tic:messageMax() end
Tic.FUNCTIONMESSAGEDELONE       = function() Tic:messageDeleteOne() end
Tic.FUNCTIONMESSAGEDELALL       = function() Tic:messageDeleteAll() end
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
Tic.FUNCTIONSTATACTPHY          = function() Tic:statPhyAct() end
Tic.FUNCTIONSTATACTMEN          = function() Tic:statMenAct() end
Tic.FUNCTIONSTATACTPSY          = function() Tic:statPsyAct() end
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
Tic.FUNCTIONSLOTGETHEAD         = function() return Tic:slotGetHeadObject() end
Tic.FUNCTIONSLOTGETBACK         = function() return Tic:slotGetBackObject() end
Tic.FUNCTIONSLOTGETHANDLF       = function() return Tic:slotGetHandLFObject() end
Tic.FUNCTIONSLOTGETHANDRG       = function() return Tic:slotGetHandRGObject() end
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
Tic.MOUSERESET     = {
    -- screenx = 0, -- dont reset for mouse dirx
    screeny = 0,
    clicklf = false,
    clickmd = false,
    clickrg = false,
    scrollx = 0,
    scrolly = 0,
    wheelup = false,
    wheeldw = false,
    wheellf = false,
    wheelrg = false,
}
Tic.MOUSE          = {
    screenx = 0,
    screeny = 0,
    clicklf = false,
    clickmd = false,
    clickrg = false,
    scrollx = 0,
    scrolly = 0,
    wheelup = false,
    wheeldw = false,
    wheellf = false,
    wheelrg = false,
}

function Tic:mouseDelay(_delay) -- set a refresh mouse delay
    _delay = _delay or Tic.MOUSEDELAY
    Tic.MOUSECYCLER:argt{maxindex = _delay} -- delay cycler
    Tic.MOUSE = Tables:merge(Tic.MOUSE, Tic.MOUSERESET) -- clear old mouse infos
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
    _result.wheelup = (_result.scrolly > 0)
    _result.wheeldw = (_result.scrolly < 0)
    _result.wheellf = (_result.scrollx < 0)
    _result.wheelrg = (_result.scrollx > 0)
    
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
Tic.BUTTONS = {}

function Tic:buttonsHandleInput()
    local _treatedbutton = nil -- avoid overlaping buttons, just keep the first one

    for _, _button in ipairs(Tic.BUTTONS) do -- handle input functions
        _button:deactivate()

        if _button:activable() then -- check if a button is active and hovered
            if _button:isHovered() then
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
Tic.FUNCTIONS  = {}

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


-- Hovertexts System -- handle hoveetexts stack
Tic.HOVERTEXTS = {}
Tic.HOVERTEXTMODIFIERKEY     = Tic.KEY_SHIFT
Tic.DRAWHOVERTEXTMOUSESPRITE = true
Tic.DRAWHOVERTEXTMDKSPRITE   = true

function Tic:hovertextsClearHovertexts() -- clear the hovertexts table
    Tic.HOVERTEXTS = {}
end

function Tic:hovertextsAppend(_hovertext, _mousesprite, _mdksprite) -- append an hovertext for later drawing
    if not _hovertext then return end -- mandatory
    local _hovertextclone = CText{} -- make a clone of it --FIXME why ?
    _hovertextclone:implementall(_hovertext)
    Tables:valInsert(Tic.HOVERTEXTS, {hovertext = _hovertextclone, mousesprite = _mousesprite, mdksprite = _mdksprite}, true)
end

function Tic:hovertextsDrawAll() -- draw all hovertexts
    for _, _hovertext in ipairs(Tic.HOVERTEXTS) do
        if _hovertext.mousesprite then
            _hovertext.mousesprite.screenx = _hovertext.hovertext.screenx - _hovertext.mousesprite.screenw + 1
            _hovertext.mousesprite.screeny = _hovertext.hovertext.screeny - 1
            _hovertext.mousesprite:draw()
        end
        if _hovertext.mdksprite then
            _hovertext.mdksprite.screenx = _hovertext.hovertext.screenx + _hovertext.hovertext.screenw - 1
            _hovertext.mdksprite.screeny = _hovertext.hovertext.screeny - 1
            _hovertext.mdksprite.flip    = (Tic:hovertextsIsMDKPressed())
                and Tic.FLIPVERT
                or  Tic.FLIPNONE
            _hovertext.mdksprite:draw()
        end 
        _hovertext.hovertext:draw()
    end
end

function Tic:hovertextsIsMDKPressed() -- is the modifier key pressed ?
    return (Tic.MODIFIERKEYS[Tic.HOVERTEXTMODIFIERKEY])
end

-- Screens System -- handle screens stack
Tic.SCREENS = CCyclerTable()

function Tic:screenDraw() -- draw screen(s)
    local _actindex = Tic.SCREENS.actindex -- save initial actindex
    Tic.SCREENS:min()
    Tic:keyboardClearKeysFunctions()
    Tic:buttonsClearButtons()
    Tic:hovertextsClearHovertexts()

    while Tic.SCREENS.actindex <= _actindex do -- pile each screen
        if Tic:screenActual() then Tic:screenActual():draw() end
        if Tic.SCREENS.actindex == _actindex then break else Tic:screenNext() end
    end

    Tic:hovertextsDrawAll() -- draw all hovertexts at the very end
end

function Tic:screenActual() -- actual screen in the stack
    return Tic.SCREENS.actvalue
end

function Tic:screenGetLast() -- top screen in the stack
    return Tic.SCREENS:getLast()
end

function Tic:screenMin() -- first screen in the stack
    return Tic.SCREENS:min()
end

function Tic:screenMax() -- last screen in the stack
    return Tic.SCREENS:max()
end

function Tic:screenAppend(_screen) -- append a screen to the stack
    if not _screen then return end -- mandatory
    return Tic.SCREENS:insert(_screen, Tables.ONE)
end

function Tic:screenRemove(_screen) -- remove last screen from the stack
    if not _screen then return end -- mandatory
    if not (Tic:screenActual() == _screen) then return end -- not on stack
    return Tic.SCREENS:removeAt()
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
    return Tic.PLAYERS:insert(_player, Tables.ONE)
end

function Tic:playerRemove(_player) -- remove a player from the stack
    return Tic.PLAYERS:remove(_player)
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

function Tic:playerGetFirst() -- first player in the stack
    return Tic.PLAYERS:getFirst()
end

function Tic:playerGetLast() -- last player in the stack
    return Tic.PLAYERS:getLast()
end

function Tic:playerGetPrev() -- prev player in the stack
    return Tic.PLAYERS:getPrev()
end

function Tic:playerGetNext() -- next player in the stack
    return Tic.PLAYERS:getNext()
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
Tic.MESSAGES    = CCyclerTable{}

function Tic:messageCount() -- number of messages
    return Tic.MESSAGES.maxindex
end

function Tic:messageInit() -- initial message in the stack
    if Tic:messageCount() == 0 then
        Tic.MESSAGES:argt{acttable = {Tic.TEXTWELCOME}}
    end
    return Tic.MESSAGES.actvalue
end
Tic:messageInit()

function Tic:messageActual() -- actual message in the stack
    return Tic.MESSAGES.actvalue
end

function Tic:messageMessages() -- all messages in the stack
    return Tic.MESSAGES.acttable
end

function Tic:messageAppend(...) -- stack a new message
    local _line = Tic:args2line(...)
    Tic.MESSAGES:insert(_line)
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

function Tic:messageDeleteOne() -- remove current message from the stack
    Tic.MESSAGES:removeAt(Tic.MESSAGES.actindex)
    return Tic:messageInit()
end

function Tic:messageDeleteAll() -- remove all messages from the stack
    Tic.MESSAGES:argt{acttable = {}}
    return Tic:messageInit()
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
    Tic.STATEFLOORSLEEP, -- S
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
    local _movenone = (Tic.MODIFIERKEYS[Tic.KEY_CTRL])  -- force none move if ctrl
    local _moveslow = (Tic.MODIFIERKEYS[Tic.KEY_CAPSLOCK])  -- force slow move if caps
    local _moveback = (Tic.MODIFIERKEYS[Tic.KEY_SHIFT])  -- force back move if shift
    _character:moveDirection(_direction, _movenone, _moveslow, _moveback)
end


-- Stats System
Tic.STATMIN  = 0 -- stats limits
Tic.STATMAX  = 10

Tic.STATACTIONSET = "set"
Tic.STATACTIONDEC = "dec"
Tic.STATACTIONINC = "inc"
Tic.STATACTIONMAX = "max"
Tic.STATPHYMAX    = "statphymax"
Tic.STATMENMAX    = "statmenmax"
Tic.STATPSYMAX    = "statpsymax"
Tic.STATPHYACT    = "statphyact"
Tic.STATMENACT    = "statmenact"
Tic.STATPSYACT    = "statpsyact"
Tic.STATSMAX      = {Tic.STATPHYMAX, Tic.STATMENMAX, Tic.STATPSYMAX}
Tic.STATSACT      = {Tic.STATPHYACT, Tic.STATMENACT, Tic.STATPSYACT}
Tic.STATS         = {Tic.STATPHYMAX, Tic.STATMENMAX, Tic.STATPSYMAX, Tic.STATPHYACT, Tic.STATMENACT, Tic.STATPSYACT}

function Tic:statPhyAct(_character)
    local _stat = Tic.STATPHYACT
    Tic:statAct(_stat, _character)
end

function Tic:statMenAct(_character)
    local _stat = Tic.STATMENACT
    Tic:statAct(_stat, _character)
end

function Tic:statPsyAct(_character)
    local _stat = Tic.STATPSYACT
    Tic:statAct(_stat, _character)
end

function Tic:statAct(_stat, _character) -- modify an act stat -- set/dec/inc/max
    if not _stat then return end -- mandatory
    _character = _character or Tic:playerActual()
    if not _character then return end
    if Tic.MODIFIERKEYS[Tic.KEY_SHIFT] then
        _character:statAct(Tic.STATACTIONINC, _stat, 1)
    elseif Tic.MODIFIERKEYS[Tic.KEY_CTRL] then
        _character:statAct(Tic.STATACTIONDEC, _stat, 1)
    else
        _character:statAct(Tic.STATACTIONMAX, _stat)
    end
end


-- Worlds System -- handle a worlds stack
Tic.WORLDS = CCyclerTable()

function Tic:worldActual() -- actual world in the stack
    return Tic.WORLDS.actvalue
end

function Tic:worldWorlds() -- all worlds in the stack
    return Tic.WORLDS.acttable
end

function Tic:worldAppend(_world) -- stack a new world
    if Tables:valFind(Tic:worldWorlds(), _world) then return end -- avoid doublons
    return Tic.WORLDS:insert(_world)
end


-- Biomes System -- set the current biome
Tic.BIOMES = CCyclerTable{acttable = { -- biomes cycler
    Tic.COLORBIOMENIGHT, -- TODO add real biomes instead of just colors ?
    Tic.COLORBIOMESNOWY,
    Tic.COLORBIOMESANDY,
    Tic.COLORBIOMEGREEN,
    Tic.COLORBIOMEROCKY,
}}

function Tic:biomePrev() -- prev biome in the stack
    return Tic.BIOMES:prev()
end

function Tic:biomeNext() -- next biome in the stack
    return Tic.BIOMES:next()
end

function Tic:biomeActual() -- actual biome in the stack
    return Tic.BIOMES.actvalue
end


-- Hitbox System -- toggle hitbox display
Tic.DRAWHITBOX = false

function Tic:hitboxToggleDraw()
	Tic.DRAWHITBOX = Nums:toggleTF(Tic.DRAWHITBOX)
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

function Tic:spottingActual(_character) -- entity hovered first else entity spotted
    return (Tic:entityHovering(_character)) and Tic:entityHovering(_character) or Tic:entitySpotting(_character)
end


-- Slot System
function Tic:slotGetHeadObject(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotGetHeadObject()
end

function Tic:slotGetBackObject(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotGetBackObject()
end

function Tic:slotGetHandLFObject(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotGetHandLFObject()
end

function Tic:slotGetHandRGObject(_character)
    _character = _character or Tic:playerActual()
    if not _character then return end
	return _character:slotGetHandRGObject()
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
Tic.DRAWBORDERS = false

function Tic:bordersToggleDraw()
	Tic.DRAWBORDERS = Nums:toggleTF(Tic.DRAWBORDERS)
end


-- Dirs System -- toggle dirs display
Tic.DRAWDIRS = false

function Tic:dirsToggleDraw()
	Tic.DRAWDIRS = Nums:toggleTF(Tic.DRAWDIRS)
end


-- View System -- toggle view display
Tic.DRAWVIEW = false

function Tic:viewToggleDraw()
	Tic.DRAWVIEW = Nums:toggleTF(Tic.DRAWVIEW)
end


-- Mind System -- toggle mind display
Tic.DRAWMIND = false

function Tic:mindToggleDraw()
	Tic.DRAWMIND = Nums:toggleTF(Tic.DRAWMIND)
end


-- Move System -- toggle move display
Tic.DRAWMOVE = false

function Tic:moveToggleDraw()
	Tic.DRAWMOVE = Nums:toggleTF(Tic.DRAWMOVE)
end


-- Inventory System -- toggle inventory display
Tic.INVENTORYSHOW   = false
Tic.INVENTORYSCREEN = nil

function Tic:inventoryToggleShow()
	Tic.INVENTORYSHOW = Nums:toggleTF(Tic.INVENTORYSHOW)
    -- if Tic.INVENTORYSHOW then
    --     Tic:screenAppend(Tic.INVENTORYSCREEN)
    -- else
    --     Tic:screenRemove(Tic.INVENTORYSCREEN)
    -- end
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
    local _line = Tic:args2line(...)
    Tables:valInsert(Tic.LOGBUFFER, _line)
end

function Tic:logRecordActive(_active) -- set log record active on/off
    Tic.LOGRECORDACTIVE = _active
end

function Tic:logRecord(...) -- add line to the log record
    if not Tic.LOGRECORDACTIVE then return end -- log record not active -- do nothing
    local _line = Tic:args2line(...)
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

function Tic:args2line(...) -- args into a single line
    local _args = {...}
    local _result = ""
    for _, _val in ipairs(_args) do
        _result = _result..Tic:val2string(_val).." "
    end
    return _result
end

function Tic:print(_screenx, _screeny, ...) -- print with multiple args
    _screenx = _screenx or 0
    _screeny = _screeny or 0
    local _line = Tic:args2line(...)
    print( _line, _screenx, _screeny, Tic.COLORCYAN, true, 1, true)
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
    local _line = Tic:args2line(...)
    trace(_line)
end

function Tic:traceTable(_table, _argt) -- trace a table  -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    if not Tic.TRACE then return end
    Tic:trace(Tables:dump(_table, _argt))
end


-- Board System -- handle the board sprite
function Tic:boardPixel(_sprite, _x, _y, _color) -- paint a pixel to a board sprite
    if not _sprite then return end -- mandatory
    _x = _x or 0
    _y = _y or 0
    _color = _color or Tic.COLORKEY -- transparent by default
    poke4(((Tic.SPRITESVRAM + (32 * _sprite)) * 2) + ((_y * Tic.SPRITESIZE) + _x), _color)
end

function Tic:boardClear(_sprite) -- clear a board sprite
    if not _sprite then return end -- mandatory
    for _y = 0, 7 do
        for _x = 0, 7 do
            Tic:boardPixel(_sprite, _x, _y, nil) -- all transparent
        end
    end
end

function Tic:boardPaint(_sprite, _directives, _clear) -- paint a board sprite
    if not _sprite or not _directives then return end -- mandatory
    _clear = (_clear == nil or _clear == true) 
    if _clear then Tic:boardClear(_sprite) end -- clear by default
    for _, _directive in pairs(_directives) do
        Tic:boardPixel(_sprite, _directive.boardx, _directive.boardy, _directive.color) -- paint each pixel
    end
end


-- Requires
require("lib/tic/CAnimation")
require("lib/tic/CBoard")
require("lib/tic/CButton")
require("lib/tic/CCamera")
require("lib/tic/CCharacter")
require("lib/tic/CDirective")
require("lib/tic/CElement")
require("lib/tic/CEntitiesLocations")
require("lib/tic/CEntity")
require("lib/tic/CEntityDrawable")
require("lib/tic/CHitbox")
require("lib/tic/CInteraction")
require("lib/tic/CInventory")
require("lib/tic/CLocations")
require("lib/tic/CObject")
require("lib/tic/CParty")
require("lib/tic/CPlace")
require("lib/tic/CPlaceBuild")
require("lib/tic/CPlaceStone")
require("lib/tic/CPlaceTrees")
require("lib/tic/CPlayer")
require("lib/tic/CRegion")
require("lib/tic/CScreen")
require("lib/tic/CSlot")
require("lib/tic/CSprite")
require("lib/tic/CText")
require("lib/tic/CWindow")
require("lib/tic/CWorld")
require("lib/tic/ICharacterHumanoid")


CNeutral= CCharacter:extend() -- neutral characters


CEnnemy = CCharacter:extend() -- ennemy characters


--
-- INTERFACE -- order is important !
--


--
-- SCREENS
--+
require("lib/tic/screens/ScreenIntro")
require("lib/tic/screens/ScreenWorld")

-- Tic:screenAppend(ScreenIntro)
Tic:screenAppend(ScreenWorld)
Tic:screenMin()
-- if true then Tic.INVENTORYSCREEN = ScreenMenus end -- FIXME options screen here


--
-- WORLDS
--
World = CWorld{}
Tic:worldAppend(World)


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

function CPlace:generateRandomWorldWindow(_count, _kinds)
    _count = _count or CPlace.PLACECOUNT
    _kinds = _kinds or CPlace.PLACEKINDS
    for _ = 1, _count do
        local _kind = Tables:keyPickRandom(_kinds)
        _entity = _kind()
        _entity:randomWorldWindow() -- random position
    end
end

function CPlace:generateRandomRegionWorldCount(_count, _kinds, _regionworld)
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
        local _kind = Tables:keyPickRandom(_kinds)
        while _kinds[_kind].percent and Nums:random(0, 100) >_kinds[_kind].percent do
            _kind = Tables:keyPickRandom(_kinds)
        end
        _entity = _kind()
        _entity:randomRegionWorld(_region) -- random position
    end
end

function CPlace:generateRandomRegionWorldPercent(_percent, _kinds, _regionworld)
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
        [CPlaceTowerAnim] = {percent = 10},
        [CPlaceTowerIdle] = {percent = 10},
        [CPlaceWaterAnim] = {percent = 10},
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
    ["slots.handlf"] = CSlotHandLF{object = CObjectFlaskSmall{used = CObject.USEDHALF}},
    ["slots.handrg"] = CSlotHandRG{object = CObjectFlaskSmall{used = CObject.USEDNONE}},
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
    ["slots.handlf"] = CSlotHandLF{object = CObjectFlaskLarge{used = CObject.USEDHALF}},
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
    ["slots.handrg"] = CSlotHandRG{object = CWeaponBowMedium{}},
    ["slots.handlf"] = CSlotHandLF{object = CWeaponShieldMedium{name = "ecu_1"}},
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


local _playerclass = CPlayerDrowe --CPlayerMeduz --CPlayerGolth
if true then
--
-- phy
--
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
    worldy = -20,
    -- spottingspot = true,
    spottingpick = true,
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponSword{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponShieldSmall{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetSmall{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesBackPackSmall{}},
    ["inventories.any"] = CInventoryAny{objects = {
        CObjectBombSmall{used = CObject.USEDFULL},
    }},
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponHammer{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponShieldMedium{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetMedium{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesBackPackMedium{}},
    ["inventories.any"] = CInventoryAny{objects = {
        CObjectBombMedium{used = CObject.USEDHALF},
    }},
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponSword{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponShieldLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesHelmetLarge{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesBackPackLarge{}},
    ["inventories.any"] = CInventoryAny{objects = {
        CObjectBombLarge{used = CObject.USEDNONE},
        -- CWeaponHammer{},
        -- CWeaponLance{},
    }},
}
end
end -- phy

--
-- men
--
if false then
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponBowSmall{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponBookSmall{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatSmall{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesToolBoxSmall{}},
    -- ["inventories.any"] = CInventoryAny{objects = {
    --     CObjectFlaskSmall{used = CObject.USEDFULL},
    -- }},
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponBowMedium{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponBookMedium{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatMedium{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesToolBoxMedium{}},
    -- ["inventories.any"] = CInventoryAny{objects = {
    --     CObjectFlaskMedium{used = CObject.USEDHALF},
    -- }},
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponBowLarge{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponBookLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesHatLarge{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesToolBoxLarge{}},
    -- ["inventories.any"] = CInventoryAny{objects = {
    --     CObjectFlaskLarge{used = CObject.USEDNONE},
    -- }},
}
end
end -- men


--
-- psy
--
if true then
if true then
W1lfie = _playerclass{classed = _playerclass,
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponWandSmall{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponRuneSmall{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHelmetSmall{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHatSmall{}},
    ["slots.head"]   = CSlotHead{object = CClothesCapSmall{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesScrollCaseSmall{}},
    -- ["inventories.any"] = CInventoryAny{objects = {
    --     CObjectSpellSmall{used = CObject.USEDFULL},
    -- }},
}
end
if true then
W2lfie = _playerclass{classed = _playerclass,
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
    -- ["slots.handrg"] = CSlotHandRG{object = CWeaponWandMedium{}},
    ["slots.handlf"] = CSlotHandLF{object = CWeaponRuneMedium{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHelmetMedium{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHatMedium{}},
    ["slots.head"]   = CSlotHead{object = CClothesCapMedium{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesScrollCaseMedium{}},
    ["inventories.any"] = CInventoryAny{objects = {
        CObjectSpellMedium{used = CObject.USEDHALF},
    }},
}
end
if true then
W3lfie = _playerclass{classed = _playerclass,
    name = "W3lfie",
    size = Tic.SIZEL,
    -- statphyact = 10,
    -- statmenact = 10,
    -- statpsyact = 10,
    -- dirx = Tic.DIRXRG,
    -- colorextra = Tic.COLORGREENL,
    worldx = 40,
    worldy = 20,
    -- spottingspot = true,
    spottingpick = true,
    ["slots.handrg"] = CSlotHandRG{object = CWeaponWandLarge{}},
    -- ["slots.handlf"] = CSlotHandRG{object = CWeaponWandMedium{}},
    -- ["slots.handlf"] = CSlotHandLF{object = CWeaponRuneLarge{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHelmetLarge{}},
    -- ["slots.head"]   = CSlotHead{object = CClothesHatLarge{}},
    ["slots.head"]   = CSlotHead{object = CClothesCapLarge{}},
    -- ["slots.back"]   = CSlotBack{object = CClothesScrollCaseLarge{}},
    ["inventories.any"] = CInventoryAny{objects = {
        CObjectSpellLarge{used = CObject.USEDNONE},
    }},
}
end
end -- psy
end


-- PARTY
if false then
-- W3Party = CParty{leader = W3lfie}
-- W3Party = CParty{members = {W3lfie}}
W3Party = W3lfie:leadParty()
-- W2lfie:joinParty(W3Party)
W1lfie:leadParty()
-- W1lfie:joinParty(W3Party)
end

-- Tic:traceTable(World.entitieslocations.locations.locations, {depth = 3, indent = "-"})
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
    ["slots.handrg"] = CSlotHandRG{object = CWeaponLance{}},
    ["slots.handlf"] = CSlotHandLF{object = CWeaponShieldLarge{}},
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
if false then
SpriteSFX = CSpriteBoard{
    name = "SFX",
    screenx = 200,
    screeny = 90,
    directives = {
        CDirective{boardx = 2, boardy = 1, color = Tic.COLORORANGE},
        CDirective{boardx = 1, boardy = 2, color = Tic.COLORORANGE},
        CDirective{boardx = 2, boardy = 3, color = Tic.COLORORANGE},
        CDirective{boardx = 2, boardy = 5, color = Tic.COLORORANGE},
        CDirective{boardx = 3, boardy = 1, color = Tic.COLORYELLOW},
        CDirective{boardx = 1, boardy = 5, color = Tic.COLORYELLOW},
        CDirective{boardx = 5, boardy = 1, color = Tic.COLORRED},
        CDirective{boardx = 6, boardy = 1, color = Tic.COLORRED},
        CDirective{boardx = 4, boardy = 2, color = Tic.COLORRED},
        CDirective{boardx = 4, boardy = 3, color = Tic.COLORRED},
        CDirective{boardx = 5, boardy = 3, color = Tic.COLORRED},
        CDirective{boardx = 3, boardy = 4, color = Tic.COLORRED},
        CDirective{boardx = 7, boardy = 1, color = Tic.COLORPURPLE},
        CDirective{boardx = 6, boardy = 3, color = Tic.COLORPURPLE},
        CDirective{boardx = 4, boardy = 4, color = Tic.COLORPURPLE},
        CDirective{boardx = 3, boardy = 5, color = Tic.COLORPURPLE},
    },
    palette = {
        [Tic.COLORORANGE] = Tic.COLORGREENM,
        [Tic.COLORPURPLE] = Tic.COLORGREEND,
        [Tic.COLORRED]    = Tic.COLORGREENM,
    },
    -- flip = Tic.FLIPNONE,
    -- flip = Tic.FLIPHORI,
    -- flip = Tic.FLIPVERT,
    -- flip = Tic.FLIPBOTH,
    -- rotate = Tic.ROTATE090,
}

SpriteHTG = CSpriteFG{
    name = "HTG",
    sprite  = 511,
    screenx = 200,
    screeny = 100,
    -- rotate = Tic.ROTATE180,
    -- offsetx = -100,
    -- colorkeys = {},
}

SpriteBIS = CSpriteBoard{
    screenx = 200,
    screeny = 110,
    palette = {
        [Tic.COLORBLUEL] = Tic.COLORKEY,
        [Tic.COLORGREENM] = Tic.COLORKEY,
        [Tic.COLORORANGE] = Tic.COLORKEY,
        [Tic.COLORRED] = Tic.COLORKEY,
    },
    -- colorkeys = {Tic.COLORKEY},
    directives = SpriteHTG:directivesSrcSprite(),
}

SpriteTER = CSpriteBoard{
    screenx = 200,
    screeny = 120,
    palette = {
        [Tic.COLORBLUEL]  = Tic.COLORBLUEM,
        [Tic.COLORGREENM] = Tic.COLORGREEND,
        [Tic.COLORRED]    = Tic.COLORPURPLE,
        [Tic.COLORORANGE] = Tic.COLORRED,
        [Tic.COLORWHITE]  = Tic.COLORGREYL,
    },
    colorkeys = {Tic.COLORKEY, Tic.COLORRED},
    directives = SpriteHTG:directivesSrcSprite(),
    rotate = Tic.ROTATE180,
}
-- Tic:traceTable(SpriteTER:directivesFetch())
-- exit()

Lance01 = CWeaponHammer{
    name = "Lance01",
    screenx = 100,
    screeny = 100,
    dirx       = Tic.DIRXLF,
}
Lance02 = CWeaponHammer{
    name = "Lance02",
    screenx = 110,
    screeny = 100,
    -- rotate     = Tic.ROTATE270,
}
end

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


if false then
-- House1 = CPlaceHouseAnim{
--     name = "House1",
--     worldx = -20,
--     worldy = 10,
--     -- hovered = true,
-- }
House2 = CPlaceHouseAnim{
    name = "House2",
    worldx = 30,
    worldy = 40,
}
-- Kirke1 = CPlaceKirkeAnim{
--     name = "Kirke1",
--     worldx = -20,
--     worldy = 40,
-- }
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

-- Tic.DRAWHITBOX  = true
-- Tic.DRAWBORDERS = true
-- Tic.DRAWVIEW    = true
-- Tic.DRAWMOVE    = true


--
-- Drawing
--
local _timemin = Nums.MAXINTEGER
local _timemax = Nums.MININTEGER
function Tic:draw()
    local _timebeg = time()
    if true then
    Tic.inputsDo()

    Tic:screenDraw()

    if false then
    -- WeaponMelee:draw()

    -- Text01:draw()
    -- Text02:draw()
    -- Text03:draw()

    -- SpriteSFX:draw()
    -- SpriteSFX:save()
    -- SpriteSFX.offsetx = 10
    -- -- SpriteSFX.flip  = Tic.FLIPBOTH
    -- SpriteSFX.rotate  = Tic.ROTATE270
    -- SpriteSFX:draw()
    -- SpriteSFX:load()

    -- SpriteHTG:draw()
    -- SpriteBIS:draw()
    -- SpriteTER:draw()

    spr(
        368,
        90,
        100,
        {},
        1,
        1, --flip,
        3, --rotate,
        1,
        1
    )
    Lance01.dirx   = 1
    Lance01.rotate = 3
    Lance01:draw()

    CSprite:boardClear()
    CSprite:modeSpriteBoard()
    Lance02:save()
    Lance02.screenx = 0
    Lance02.screeny = 0
    Lance02:draw()
    Lance02:load()
    CSprite.BOARD:drawScreen(nil, 30)

    CSprite:modeBoardScreen()
    local _spritenoard = CSpriteBoard{
        screenx    = Lance02.screenx,
        screeny    = Lance02.screeny,
        flip       = Lance02.flip,
        rotate     = Lance02.rotate,
    }
    _spritenoard:draw()

    CSprite:modeSpriteScreen()
    end

    Tic:drawLog()

    local _timeend = time()
    local _timedif = math.floor(_timeend - _timebeg)
    if _timedif < _timemin then _timemin = _timedif end
    if _timedif > _timemax then _timemax = _timedif end
    Tic:print(190, 120, Nums:pad0LF(_timemin, 3).."/"..Nums:pad0LF(_timedif, 3).."/"..Nums:pad0LF(_timemax, 3))
    if Tic:playerActual() then
        Tic:print(200, 126, Nums:pad0LF(Tic:playerActual().worldx, 3).." "..Nums:pad0LF(Tic:playerActual().worldy, 3))
    end
    Tic:logPrint()

    Tic:tick() -- [!] required in the draw function
    end
end

function Tic:drawLog()
    -- Tic:logWorld()
    -- Tic:logInventories()
    -- Tic:logScreens()
    -- Tic:logButtons()
end

function Tic:logWorld()
    local _world = Tic:worldActual()
    if not _world then return end

    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()
    Tic:logAppend()

    local _kindnames = {}
    Tic:logAppend(_world.name, Tables:size(_world.entitieslocations.entities))
    for _, _entity in pairs(_world.entitieslocations.entities) do
        Tables:valInsert(_kindnames, _entity:kindGet().."\t".._entity:nameGet())
    end
    table.sort(_kindnames)
    for _, _kindname in ipairs(_kindnames) do
        Tic:logAppend(_kindname)
    end
    Tic:logAppend()
end

function Tic:logInventories() -- [-] remove
    if not Tic.INVENTORYSHOW then return end
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
    end
end

function Tic:logSlot(_slot)
    if not CSlot:isSlot(_slot) then return end
    local _object = _slot.object
    local _objectkind = (_object) and _object.kind or "--"
    local _objectname = (_object) and _object.name or "--"
    Tic:logAppend(_slot.name, _slot.kind.." :", _objectkind, _objectname)
end

function Tic:logScreens()
    Tic:logAppend("Screens", Tic.SCREENS.actindex, Tic.SCREENS.maxindex, Tic.INVENTORYSHOW)
    for _key, _screen in ipairs(Tic.SCREENS.acttable or {}) do
        Tic:logAppend(_key, _screen.kind, _screen.name)
    end
    Tic:logAppend()
end

function Tic:logButtons()
    for _key, _button in ipairs(Tic.BUTTONS or {}) do
        Tic:logAppend(_key, _button.kind, _button.name, _button.hovered, _button.actived)
    end
    Tic:logAppend()
end

function Tic:logRegion(_pfx, _region)
    Tic:logAppend(_pfx, U.._region.up, D.._region.dw, L.._region.lf, R.._region.rg)
end

function Tic:logEntity(_pfx, _entity)
    Tic:logAppend(_pfx, _entity.name, _entity.screenx, _entity.screeny)
end

function Tic:logDirective(_key, _directive, _colorkey)
    if not _colorkey or not (_directive.color == _colorkey) then
        Tic:logAppend(_key..")", Y.._directive.boardy, X.._directive.boardx, C..Tic.COLORNAMES[_directive.color])
    end
end

function Tic:logDirectives(_directives, _colorkey)
    for _key, _directive in ipair(_directives) do
        Tic:logDirective(_key, _directive, _colorkey)
    end
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
