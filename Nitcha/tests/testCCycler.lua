--
-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

--
-- Includes
require("includes/tic/CCycler")                


local CyclerINT = CCyclerInt({
    maxindex = 2
})

print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:next()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:next()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:next()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:next()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:prev()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:prev()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:prev()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
CyclerINT:prev()
print(CyclerINT.minindex, CyclerINT.maxindex, CyclerINT.actindex, CyclerINT.actvalue)
