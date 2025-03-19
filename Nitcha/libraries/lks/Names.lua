-- Names object
-- Instance only once
--

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Tables  = require("libraries/lks/Tables")


--
-- Names
--
local Names = {}


Names.LETTER_A = "a"
Names.LETTER_B = "b"
Names.LETTER_C = "c"
Names.LETTER_D = "d"
Names.LETTER_E = "e"
Names.LETTER_F = "f"
Names.LETTER_G = "g"
Names.LETTER_H = "h"
Names.LETTER_I = "i"
Names.LETTER_J = "j"
Names.LETTER_K = "k"
Names.LETTER_L = "l"
Names.LETTER_M = "m"
Names.LETTER_N = "n"
Names.LETTER_O = "o"
Names.LETTER_P = "p"
Names.LETTER_Q = "q"
Names.LETTER_R = "r"
Names.LETTER_S = "s"
Names.LETTER_T = "t"
Names.LETTER_U = "u"
Names.LETTER_V = "v"
Names.LETTER_W = "w"
Names.LETTER_X = "x"
Names.LETTER_Y = "y"
Names.LETTER_Z = "z"

Names.VOWELS = {
	Names.LETTER_A,
	Names.LETTER_E,
	Names.LETTER_I,
	Names.LETTER_O,
	Names.LETTER_U,
	Names.LETTER_Y,
}

Names.CONSOS = {
	Names.LETTER_B,
	Names.LETTER_C,
	Names.LETTER_D,
	Names.LETTER_F,
	Names.LETTER_G,
	Names.LETTER_H,
	Names.LETTER_J,
	Names.LETTER_K,
	Names.LETTER_L,
	Names.LETTER_M,
	Names.LETTER_N,
	Names.LETTER_P,
	Names.LETTER_Q,
	Names.LETTER_R,
	Names.LETTER_S,
	Names.LETTER_T,
	Names.LETTER_V,
	Names.LETTER_W,
	Names.LETTER_X,
	Names.LETTER_Z,
}

function Names:fupper(_string) -- uppercase first letter, lowercase the rest
    _string = _string or ""
    return _string:lower():gsub("^.", string.upper)
end



-- END
return Names
