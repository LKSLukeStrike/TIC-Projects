-- Tables object
-- Instance only once
--

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Nums    = require("libraries/lks/Nums")


--
-- Tables
--
local Tables = {}


-- Size
function Tables:size(_table) -- size of a table
    local _result = 0
    for _, _ in pairs(_table or {}) do
        _result = _result + 1
    end
    return _result
end


-- Keys and Vals
function Tables:keys(_table) -- keys of a table -- SORTED
    local _result = {}
    for _key, _ in pairs(_table) do
        table.insert(_result, _key)
    end
    table.sort(_result, function(_a, _b)
       if type(_a) == type(_b) then
            if type(_a) == "table" then return false end -- [!] dont sort tables, sort crash if same table
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


-- Generate
function Tables:generate(_that) -- generate a table from [key] = count ... to count x [key] ...
    local _result = {}
    for _key, _count in pairs(_that or {}) do
        for _ = 1, _count do
            table.insert(_result, _key)
        end
    end
    return _result
end


-- Pick
function Tables:keyPick(_table, _keyn) -- return the nth key of a table
    local _keys = Tables:keys(_table)
    return _keys[_keyn] -- nil if not found
end

function Tables:valPick(_table, _keyn) -- return the nth val of a table
    return _table[Tables:keyPick(_table, _keyn)] -- nil if not found
end

function Tables:keyPickRandom(_table) -- return a random key in a table
    return Tables:keyPick(_table, math.random(Tables:size(_table))) -- nil if no items
end

function Tables:valPickRandom(_table) -- return a random val in a table
    return _table[Tables:keyPickRandom(_table)] -- nil if no items
end

 
-- Find
function Tables:keyFind(_table, _find) -- return the key of key _find else nil if not found
    for _key, _val in pairs(_table or {}) do
        if _key == _find then return _key end
    end
    return -- nil
end

function Tables:valFind(_table, _find) -- return the key of val _find else nil if not found
    for _key, _val in pairs(_table or {}) do
        if _val == _find then return _key end
    end
    return -- nil
end


-- Append, Delete, Insert, Remove
function Tables:keyAppend(_table, _key, _val) -- append/replace a key val entry
    if not _table or not _key then return end -- mandatory
    _val = _val or true
    _table[_key] = _val
end

function Tables:keyDelete(_table, _key) -- delete a key val entry (paired tables)
    if not _table or not _key then return end -- mandatory
    _table[_key] = nil
end

function Tables:keyRemove(_table, _key) -- remove a key entry (ipaired tables)
    if not _table then return end -- mandatory
    table.remove(_table, _key)
end

function Tables:keyRemoveNAt(_table, _n, _at) -- remove N elements at key position
    for _ = 1, _n or 0 do
        Tables:keyRemove(_table, _at)
    end
end

function Tables:valInsert(_table, _val, _once, _key) -- insert a val entry (ipaired tables) -- once of any (avoid doublons)
    if not _table or not _val then return end -- mandatory
    if _once and Tables:valFind(_table, _val) then return end -- avoid doublons
    if _key then
        table.insert(_table, _key, _val) -- at _key
    else
        table.insert(_table, _val) -- at end
    end
end

function Tables:valRemove(_table, _val, _once) -- remove a val entry (ipaired tables) -- only once (first) if any, else all
    if not _table or not _val then return end -- mandatory
    local _key = Tables:valFind(_table, _val)
    while _key do
        Tables:keyRemove(_table, _key)
        if _once then
            _key = nil
        else
            _key = Tables:valFind(_table, _val)
        end
    end
end


-- Do and DoIf
function Tables:eachDo(_table, _do)
    if not _do or not (type(_do) == "function") then return end -- mandatory
    for _key, _val in pairs(_table or {}) do
        _do(_key, _val)
    end
end

function Tables:eachDoIf(_table, _do, _if)
    if not _do or not (type(_do) == "function") then return end -- mandatory
    if not _if or not (type(_if) == "function") then return end -- mandatory
    for _key, _val in pairs(_table or {}) do
        if _if(_key, _val) then _do(_key, _val) end
    end
end


-- Clone and Merge
function Tables:clone(_table) -- clone a dic table -- SORTED -- only first level -- FIXME ?
    local _result = {}
    local _keys = Tables:keys(_table) -- sorted keys
    for _, _key in ipairs(_keys) do
        _result[_key] = _table[_key]
    end
    return _result
end

function Tables:iclone(_table, _once) -- clone a seq table -- unique vals if any
    local _result = {}
    for _, _val in ipairs(_table or {}) do
        Tables:valInsert(_result, _val, _once)
    end
    return _result
end

function Tables:merge(_tablea, _tableb) -- merge two dic tables -- do not alter initial tables
    local _result = {}
    for _key, _val in pairs(_tablea or {}) do _result[_key] = _val end
    for _key, _val in pairs(_tableb or {}) do _result[_key] = _val end
    return _result
end

function Tables:imerge(_tablea, _tableb, _once) -- merge two seq tables -- unique vals if any
    local _result = Tables:iclone(_tablea, _once)
    for _, _val in ipairs(_tableb or {}) do
        Tables:valInsert(_result, _val, _once)
    end
    return _result
end


-- Dump and Print
function Tables:dump(_table, _argt) -- dump a table -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    _table = _table or {}
    _argt  = _argt  or {}
    local _indent  = _argt.indent or ""
    local _depth   = _argt.depth  or Nums.MAXINTEGER
    local _verbose = (_argt.verbose == true) or false
    local _hide    = _argt.hide or {} -- hide keys
    local _show    = _argt.show or {} -- override hidden keys if any
    local _skip    = _argt.skip or {} -- skip tables with those keys
    local _keep    = _argt.keep or {} -- override skipped tables with those keys if any

    local _tablesdumped = {} -- already dumped tables to avoid dead loops
    function _dump(_table, _argt)
        local _indent = _argt._indent
        local _depth  = _argt.depth
    
        local _result = ""
        if type(_table) ~= "table" then
            return _result end -- not a table
        if _depth <= 0             then
            return (_verbose) and _indent.."[DEPTH]\n" or _result end -- depth reached
        if _tablesdumped[_table]   then
            return (_verbose) and _indent.."[DUMPED]\n" or _result end -- already dumped
        _tablesdumped[_table] = true -- add to dumped

        local _keys = Tables:keys(_table) -- sorted keys
        for _, _key in ipairs(_keys) do
            local _doshow = true
            local _dokeep = true
            local _val = _table[_key]

            if _hide and _doshow then -- TODO add more patterns ?
                if Tables:valFind(_hide, _key) then
                    _doshow = false -- hide some keys
                elseif Tables:valFind(_hide, "*all*") then
                    _doshow = false -- hide all keys -- special pattern
                elseif Tables:valFind(_hide, "*num*") and type(_key) == "number" then
                    _doshow = false -- hide num keys -- special pattern
                elseif Tables:valFind(_hide, "*str*") and type(_key) == "string" then
                    _doshow = false -- hide str keys -- special pattern
                end
            end

            if _show and not _doshow then -- override hidden keys if any
                if Tables:valFind(_show, _key) then
                    _doshow = true -- show some keys
                elseif Tables:valFind(_show, "*all*") then
                    _doshow = true -- show all keys -- special pattern
                elseif Tables:valFind(_show, "*num*") and type(_key) == "number" then
                    _doshow = true -- show num keys -- special pattern
                elseif Tables:valFind(_show, "*str*") and type(_key) == "string" then
                    _doshow = true -- show str keys -- special pattern
                end
            end

            if _doshow then
                _result = _result..tostring(_indent)..tostring(_key).."\t"..tostring(_val).."\n"
            end

            if _skip and _dokeep and type(_val) == "table" then -- skip tables with those keys
                if Tables:valFind(_skip, _key) then
                    _dokeep = false -- skip some keys
                elseif Tables:valFind(_skip, "*all*") then
                    _dokeep = false -- skip all keys -- special pattern
                elseif Tables:valFind(_skip, "*num*") and type(_key) == "number" then
                    _dokeep = false -- skip num keys -- special pattern
                elseif Tables:valFind(_skip, "*str*") and type(_key) == "string" then
                    _dokeep = false -- skip str keys -- special pattern
                end
            end

            if _keep and not _dokeep and type(_val) == "table" then -- override skipped tables if any
                if Tables:valFind(_keep, _key) then
                    _dokeep = true -- keep some keys
                elseif Tables:valFind(_keep, "*all*") then
                    _dokeep = true -- keep all keys -- special pattern
                elseif Tables:valFind(_keep, "*num*") and type(_key) == "number" then
                    _dokeep = true -- keep num keys -- special pattern
                elseif Tables:valFind(_keep, "*str*") and type(_key) == "string" then
                    _dokeep = true -- keep str keys -- special pattern
                end
            end

            if _dokeep then -- keep digging a table
                _argt._indent = _indent.._argt.indent
                _argt.depth   = _depth - 1
                _result       = _result.._dump(_val, _argt)
            end
        end
        return _result
    end

    _argt._indent = "" -- starting values
    _argt.indent  = _indent
    _argt.depth   = _depth
    return _dump(_table, _argt)
end

function Tables:print(_table, _argt) -- print a table -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    print(Tables:dump(_table, _argt))
end



-- END
return Tables
