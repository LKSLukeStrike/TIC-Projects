-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Names  = require("libraries/lks/Names")


-- for _ = 1, 20 do
--     print(Names:random())
-- end

for _ = 1, 20 do
    print(Names:random(3, 3,
    {
        "o",
    },
    {
        "x",
    },
    1
))
end
