-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Tables = require("libraries/lks/Tables")

if false then
local _tbl = {a = 10, b = 100, c = 1000, d = 10000, e = {e1 = "hello", e2 = "world",},}
print"KEYS"
Tables:print(Tables:keys(_tbl))
local _key = Tables:keys(_tbl)[1]
print(_key)
print(_tbl[_key])
print()
print"KEYN"
print(Tables:keyPick(_tbl, 2))
print(Tables:valPick(_tbl, 2))
print()
print"RKEY"
print(Tables:keyPickRandom(_tbl))
print(Tables:keyPickRandom(_tbl))
print(Tables:keyPickRandom(_tbl))
print(Tables:keyPickRandom(_tbl))
print(Tables:keyPickRandom(_tbl))
print(Tables:keyPickRandom({}))
print()
print"RVAL"
print()
print(Tables:valPickRandom(_tbl))
print(Tables:valPickRandom(_tbl))
print(Tables:valPickRandom(_tbl))
print(Tables:valPickRandom(_tbl))
print(Tables:valPickRandom(_tbl))
print(Tables:valPickRandom({14, 15, 16}))
print()
print"KAPP"
Tables:print(_tbl)
Tables:keyAppend(_tbl, "f", 100000)
Tables:print(_tbl)
print()
print"KREM"
Tables:print(_tbl)
Tables:keyDelete(_tbl, "a")
Tables:print(_tbl, {indent = ">"})
end

if false then
print()
t = {"auto", "velo", "moto"}
print(Tables:valFind(t, "plane"))
print(Tables:valFind(t, "velo"))
print()
Tables:print(t)
print()
Tables:valInsert(t, "auto")
Tables:print(t)
print()
Tables:valInsert(t, "velo", false)
Tables:print(t)
print()
Tables:valRemove(t, "auto", false)
Tables:print(t)
print()
Tables:valRemove(t, "velo", true)
Tables:print(t)
print()
Tables:keyRemoveNAt(t, 1)
Tables:print(t)
end

if false then
print()
Tables:print(Tables:generate{
    ["a"] = 10,
    ["b"] = 5,
    ["c"] = 1,
})
end

if false then
print()
Tables:print(Tables:icopy({10, 10, 20}))
Tables:print(Tables:icopy({10, 10, 20}, true))
Tables:print(Tables:imerge({10, 10, 20}, {10, 10, 200}))
Tables:print(Tables:imerge({10, 10, 20}, {10, 10, 200}, true))
end

if true then
    print(Tables:size({10, 20, 30}))
end