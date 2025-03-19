-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Tables = require("libraries/lks/Tables")


local _aaa = "aaa"
local _tbl = {a = 10, b = 100, c = 1000, d = 10000}
print"KEYS"
Tables:print(Tables:keys(_tbl))
local _key = Tables:keys(_tbl)[1]
print(_key)
print(_tbl[_key])
print"KEYN"
print(Tables:pickkey(_tbl, 2))
print(Tables:pickval(_tbl, 2))
print"RKEY"
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey({}))
print"RVAL"
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval({14, 15, 16}))
