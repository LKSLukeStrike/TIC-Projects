--
-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

--
-- Includes
require("includes/tic/CCycler")                


-- local CyclerINT = CCyclerInt({
--     maxindex = 2
-- })

-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:next()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:next()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:next()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:next()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:prev()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:prev()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:prev()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
-- CyclerINT:prev()
-- print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)


local CyclerTAB = CCyclerTab()

print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:insert(10)
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:insert(20)
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:insert(5, 1)
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:insert(30, 100)
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:insert(25, CyclerTAB.maxindex)
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)

print(table.unpack(CyclerTAB.acttable))

CyclerTAB:next()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:next()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:next()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:prev()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:prev()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
CyclerTAB:prev()
print(CyclerTAB.minindex, CyclerTAB.maxindex, CyclerTAB.actindex, CyclerTAB.actvalue)
