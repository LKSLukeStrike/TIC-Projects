-- Packages
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Names  = require("libraries/lks/Names")


-- for _ = 1, 20 do
--     print(Names:random())
-- end

if false then
for _ = 1, 20 do
    print(Names:random(3, 10,
    {
        "o",
        "a",
        "u",
        "oh",
        "ah",
        "uh",
        "uh",
        "og",
        "ag",
        "ug",
   },
    {
        "v",
        "w",
        "k",
        "vv",
        "ww",
        "kk",
    },
    1
))
end
end

print(Names:case("life's Beautiful  yes", Names.CASEUPPER))
print(Names:case("life's Beautiful  yes", Names.CASELOWER))
print(Names:case("life's Beautiful  yes", Names.CASECAMEL))
print(Names:case("life's Beautiful  yes", Names.CASEFIRST))
