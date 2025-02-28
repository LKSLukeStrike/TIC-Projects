-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

local Tables = require("libraries/lks/Tables")


--
-- print("--- 1")
-- local _table = {13, 10}
-- Tables:print(_table)
-- print(Tables:size(_table))
-- print(table.unpack(Tables:keys(_table)))
-- print(table.unpack(Tables:vals(_table)))

-- print("--- 10")
-- local _table0 = Tables:copy(_table)
-- Tables:print(_table0)
-- print(Tables:size(_table0))
-- print(table.unpack(Tables:keys(_table0)))
-- print(table.unpack(Tables:vals(_table0)))

-- print("--- 2")
-- local _table = {"bb", "aa", "cc"}
-- Tables:print(_table)
-- print(Tables:size(_table))
-- print(table.unpack(Tables:keys(_table)))
-- print(table.unpack(Tables:vals(_table)))

-- print("--- 20")
-- local _table0 = Tables:copy(_table)
-- Tables:print(_table0)
-- print(Tables:size(_table0))
-- print(table.unpack(Tables:keys(_table0)))
-- print(table.unpack(Tables:vals(_table0)))

-- print("--- 3")
-- local _table = {["bb"] = 20, ["aa"] = 10, ["cc"] = 30, ["dd"] = 40}
-- Tables:print(_table)
-- print(Tables:size(_table))
-- print(table.unpack(Tables:keys(_table)))
-- print(table.unpack(Tables:vals(_table)))

-- print("--- 30")
-- local _table0 = Tables:copy(_table)
-- Tables:print(_table0)
-- print(Tables:size(_table0))
-- print(table.unpack(Tables:keys(_table0)))
-- print(table.unpack(Tables:vals(_table0)))

-- print("--- 4")
-- local _table = {["bb"] = 20, ["aa"] = 10, {100, 50, 150}, ["cc"] = 30, ["dd"] = 40}
-- local _table = {["bb"] = 20, {100, 50, 150}, ["aa"] = {10, 5, 15}, }
-- local _table = {["bb"] = 20, ["aa"] = 10, ["cc"] = 30, ["dd"] = 40}
-- Tables:print(_table, " ")
-- print(Tables:dump(_table, " "))
-- print(Tables:size(_table))
-- print(table.unpack(Tables:keys(_table)))
-- print(table.unpack(Tables:vals(_table)))

print("--- merge")
local _ta = {["a"] = 10,}
local _tb = {["b"] = 20, ["ta1"] = _ta, ["ta2"] = _ta, ["ta3"] = {_ta},}

-- Tables:print(_ta, " ")
Tables:print(_tb, " ", nil, true, {"b", "ta1", "ta2",})
Tables:print(_tb, " ", nil, true, nil, {"ta3",})

-- Tables:print(Tables:merge(_ta, _tb), " ")

