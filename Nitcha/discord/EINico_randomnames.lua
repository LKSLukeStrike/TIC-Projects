local vowels = {"a", "e", "i", "o", "u", "y", "ae", "ai", "ei", "ou"}
local consonants = {"p", "t", "k", "s", "m", "n", "l", "j", "w", "r"}
local nasals = {"m", "n", "ng"}

local function choose(list)
    return list[math.random(1, #list)]
end

local function word(len)
    local ans = ""
    if math.random() < 0.5 then
        ans = choose(vowels)
    end
    for i = 1, len do
        ans = ans..choose(consonants)..choose(vowels)
    end
    if math.random() < 0.25 then
        ans = ans..choose(nasals)
    end
    return ans
end

for _ = 1, 20 do
    print(word(3))
end
