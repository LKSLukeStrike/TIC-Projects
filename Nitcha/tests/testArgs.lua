Tic = {}

function Tic:trace(...)
    local _args = {...}
    for _, _val in pairs(_args) do
        _val = (type(_val) == "table" or type(_val) == "function") and type(_val) or _val
        print("Tic:trace ".._val)
    end
end

-- Tic:trace(10, 11, 12)
-- Tic:trace(10, {11}, 12)
-- Tic:trace(nil, {11}, 12)
Tic:trace({11}, nil, 12, Tic.trace)
