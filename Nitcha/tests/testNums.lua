-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"

Nums = require("libraries/lks/Nums")


--
_num = 10

print(Nums:yes2int(true))
print(Nums:yes2int(false))
print(Nums:yes2int())
print(Nums:yes2int(nil))
print("---")

print(Nums:geAny())
print(Nums:geAny(10))
print(Nums:geAny(10, 09))
print(Nums:geAny(10, 10))
print(Nums:geAny(10, 11))
print(Nums:geAny(10, 11, 12, 13))
print(Nums:geAny(10, 11, 12, 10))
