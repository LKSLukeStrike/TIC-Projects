-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

Nums = require("libraries/lks/Nums")


--
print("---")
local _num = 10
-- print(Nums:isLTAny())
-- print(Nums:isLTAny(_num))
print(Nums:isLTAny(_num, 09))
print(Nums:isLTAny(_num, _num))
print(Nums:isLTAny(_num, 11))
print(Nums:isLTAny(_num, 11, 12, 13))
print(Nums:isLTAny(_num, 11, 12, _num))
print(Nums:isLTAny(_num, _num, _num, _num))
print(Nums:isLTAny(_num, 09, 08, 07))
