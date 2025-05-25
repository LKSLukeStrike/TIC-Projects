-- Names object
-- Instance only once
--

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Nums    = require("libraries/lks/Nums")
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

Names.CASEUPPER = "upper"
Names.CASELOWER = "lower"
Names.CASECAMEL = "camel"
Names.CASEFIRST = "first"
function Names:case(_string, _case) -- return a casified string
	if not _string then return end -- mandatory
	if _case == Names.CASEUPPER then _string = _string:upper() end
	if _case == Names.CASELOWER then _string = _string:lower() end
	if _case == Names.CASECAMEL then _string = _string:lower():gsub("(%a)([%w_']*)", function(_f, _r) return _f:upper().._r:lower() end) end
	if _case == Names.CASEFIRST then _string = _string:lower():gsub("^.", string.upper) end
	return _string
end

function Names:fupper(_string) -- uppercase first letter, lowercase the rest
    return Names:case(_string, Names.CASEFIRST)
end


function Names:random(_minlen, _maxlen, _vowels, _consos, _prbvow) -- random name of a random length from 2 letters sets
	_minlen = _minlen or 2
	_maxlen = _maxlen or 6
	_vowels = _vowels or Names.VOWELS
	_consos = _consos or Names.CONSOS
	_prbvow = _prbvow or  0.5 -- probability to start with a vowel -- 0-1
	local _reslen = Nums:random(_minlen, _maxlen)
    local _result = ""

    if math.random() < _prbvow then
        _result = Tables:valPickRandom(_vowels)
    end
    while #_result < _reslen do
        _result = _result..Tables:valPickRandom(_consos)..Tables:valPickRandom(_vowels)
    end
    return string.sub(_result, 1, _reslen)
end



-- END
return Names
