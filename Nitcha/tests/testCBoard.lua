-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
Classic = require("lib/ext/Classic")

CCycler = require("lib/lks/CCycler")
Names   = require("lib/lks/Names")
Nums    = require("lib/lks/Nums")
Tables  = require("lib/lks/Tables")

require("lib/tic/CBoard")

Board = CBoard{}

Board:appendDirectives(
    {
        CDirective{boardx = -1, boardy = 0, color = 1},
        CDirective{boardx =  0, boardy = 0, color = 0},
        CDirective{boardx =  1, boardy = 0, color = 2},
    },
    CRegion{
        -- lf = 0,
        -- rg = -1,
    },
    { -- palette
        -- [1] = 11,
        -- [2] = 12,
    },
    nil -- colorkey
)

Tables:print(Board, {indent = " "})

_directives = Board:directives(
    CRegion{
        lf = 0,
        rg = -1,
    },
    { -- palette
        [1] = 11,
        [2] = 12,
    },
    nil -- colorkey
)

Tables:print(_directives, {indent = " "})
