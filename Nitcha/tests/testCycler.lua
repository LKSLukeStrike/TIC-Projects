--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local CCycler = require("lib/lks/CCycler")                
local Tables  = require("lib/lks/Tables")                


if false then
CyclerTable = CCyclerTable()

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

CyclerInt = CCyclerInt{maxindex =  10, mode = CCycler.MODEBLOCK}
print(CyclerInt.actvalue)
CyclerInt:prev()
print(CyclerInt.actvalue)
end

CyclerTable = CCyclerTable()
CyclerTable:print()
print("result:", CyclerTable:insert(10))
CyclerTable:print()
print("result:", CyclerTable:argt{acttable = {10, 20,30}})
CyclerTable:print()
print("result:", CyclerTable:next())
CyclerTable:print()
print("result:", CyclerTable:remove())
CyclerTable:print()
print("result:", CyclerTable:remove())
CyclerTable:print()
print("result:", CyclerTable:remove())
CyclerTable:print()

-- print(CyclerTable:remove() or "nil")
