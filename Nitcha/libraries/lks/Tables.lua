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
        if type(_a) == type(_b) then
            if type(_a) == "table" then return _a == _b end -- TODO more types ?
            return _a < _b
        end
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

function Tables:merge(_tablea, _tableb) -- merge two tables -- do not alter initial tables
    local _result = {}
    for _key, _val in pairs(_tablea or {}) do _result[_key] = _val end
    for _key, _val in pairs(_tableb or {}) do _result[_key] = _val end
    return _result
end


function Tables:dump(_table, _indent, _depth) -- dump a table -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    _indent = _indent or ""
    _depth  = _depth  or math.maxinteger
    local _tablesdumped = {} -- already dumped tables to avoid dead loops
    function _dump(_table, _indent, _depth)
        local _result = ""
        if type(_table) ~= "table" then return _result end
        if _depth <= 0 then return _result end
        if _tablesdumped[_table] then return _result end -- already dumped
        _tablesdumped[_table] = true -- add to dumped
        local _keys = Tables:keys(_table) -- sorted keys
        for _, _key in ipairs(_keys) do
            local _val = _table[_key]
            _result = _result.._indent..tostring(_key).."\t"..tostring(_val).."\n"
            _result = _result.._dump(_val, _indent.._indent, _depth - 1)
        end
        return _result
    end
    return _dump(_table, _indent, _depth)
end

function Tables:print(_table, _indent, _depth) -- print a table -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    print(Tables:dump(_table, _indent, _depth))
end



-- END
return Tables
