--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local CCycler = require("libraries/lks/CCycler")                


local CyclerTable = CCyclerTable()

print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:insert(10)
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:insert(20)
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:insert(5, 1)
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:insert(30, 100)
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:insert(25, CyclerTable.maxindex)
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)

print(table.unpack(CyclerTable.acttable))

CyclerTable:next()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:next()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:next()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:prev()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:prev()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)
CyclerTable:prev()
print(CyclerTable.minindex, CyclerTable.maxindex, CyclerTable.actindex, CyclerTable.actvalue)

local _cyclerint = CCyclerInt{maxindex =  10, mode = CCycler.MODEBLOCK}
print(_cyclerint.actvalue)
_cyclerint:prev()
print(_cyclerint.actvalue)
