--
-- Utils
--
local Utils = {}

function Utils:defaultOne(_val, _one)
    _val = _val or _one
    return _val
end

function Utils:defaultOneTwo(_val, _one, _two)
    _val = _val or _one
    _val = _val or _two
    return _val
end


-- END
return Utils