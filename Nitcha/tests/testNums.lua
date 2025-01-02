-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

Nums = require("libraries/lks/Nums")


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
