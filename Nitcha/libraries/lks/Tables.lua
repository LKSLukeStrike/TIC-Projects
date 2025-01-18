-- Tables object
-- Instance only once
-- Contains constants, globals and general functions
-- 
local Tables = {}


function Tables:size(_table) -- size of a table
    local _result = 0
    for _, _ in pairs(_table or {}) do
        _result = _result + 1
    end
    return _result
end

function Tables:keys(_table) -- keys of a table -- SORTED
    local _result = {}
    for _key, _ in pairs(_table) do
        table.insert(_result, _key)
    end
    table.sort(_result, function(_a, _b)
        if type(_a) == type(_b) then return _a < _b end
        return tostring(_a) < tostring(_b)
    end
    )
    return _result
end

function Tables:vals(_table) -- vals of a table -- SORTED
    local _result = {}
    local _keys = Tables:keys(_table) -- sorted keys
    for _, _key in pairs(_keys) do
        table.insert(_result, _table[_key])
    end
    return _result
end

function Tables:copy(_table) -- copy a table -- SORTED
    local _result = {}
    local _keys = Tables:keys(_table) -- sorted keys
    for _, _key in ipairs(_keys) do
        _result[_key] = _table[_key]
    end
    return _result
end

function Tables:dump(_table, _indent) -- dump a table -- SORTED -- RECURSIVE -- INDENT
    local _result = ""
    if type(_table) ~= "table" then return _result end
    _indent = _indent or ""
    local _keys = Tables:keys(_table) -- sorted keys
    for _, _key in ipairs(_keys) do
        local _val = _table[_key]
        _result = _result .. _indent..tostring(_key) .. "\t" .. tostring(_val) .. "\n"
        _result = _result .. Tables:dump(_val, _indent.._indent)
    end
    return _result
end

function Tables:print(_table, _indent) -- print a table -- SORTED -- RECURSIVE -- INDENT
    print(Tables:dump(_table, _indent))
end



-- END
return Tables
