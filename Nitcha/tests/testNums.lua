-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Nums   = require("libraries/lks/Nums")


--
print("---")
local _num = 10
-- print(Nums:isLTAll())
-- print(Nums:isLTAll(_num))
print(Nums:isLTAll(_num, 09))
print(Nums:isLTAll(_num, _num))
print(Nums:isLTAll(_num, 11))
print(Nums:isLTAll(_num, 11, 12, 13))
print(Nums:isLTAll(_num, 11, 12, _num))
print(Nums:isLTAll(_num, _num, _num, _num))
print(Nums:isLTAll(_num, 09, 08, 07))
print(Nums:isLTAll(_num, 09, nil, 07))

print("---")
print(Nums:isBW(_num, 0, 10))
print(Nums:isBW(_num, 0, 09))
print(Nums:isBW(_num, 10, 0))
print(Nums:isBW(_num, 09, 0))
print(Nums:isBW(_num, 0, 10, false, false))
print(Nums:isBW(_num, 0, 09, false, false))
print(Nums:isBW(_num, 10, 0, false, false))
print(Nums:isBW(_num, 09, 0, false, false))
print(Nums:isBW(_num, 11, 0, false, false))

print(Nums:neg(-10))
print(Nums:neg(0))
print(Nums:neg(10))
print(Nums:pos(-10))
print(Nums:pos(0))
print(Nums:pos(10))
