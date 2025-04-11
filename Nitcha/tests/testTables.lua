-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Tables = require("libraries/lks/Tables")


local _tbl = {a = 10, b = 100, c = 1000, d = 10000, e = {e1 = "hello", e2 = "world",},}
print"KEYS"
Tables:print(Tables:keys(_tbl))
local _key = Tables:keys(_tbl)[1]
print(_key)
print(_tbl[_key])
print()
print"KEYN"
print(Tables:pickkey(_tbl, 2))
print(Tables:pickval(_tbl, 2))
print()
print"RKEY"
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey(_tbl))
print(Tables:randompickkey({}))
print()
print"RVAL"
print()
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval(_tbl))
print(Tables:randompickval({14, 15, 16}))
print()
print"KAPP"
Tables:print(_tbl)
Tables:keyAppend(_tbl, "f", 100000)
Tables:print(_tbl)
print()
print"KREM"
Tables:print(_tbl)
Tables:keyRemove(_tbl, "a")
Tables:print(_tbl, {indent = ">"})

