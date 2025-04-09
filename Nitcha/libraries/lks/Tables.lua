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

function Tables:pickkey(_table, _keyn) -- return the nth key of a table
    local _keys = Tables:keys(_table)
    return _keys[_keyn] -- nil if not found
end

function Tables:pickval(_table, _keyn) -- return the nth val of a table
    return _table[Tables:pickkey(_table, _keyn)] -- nil if not found
end

function Tables:randompickkey(_table) -- return a random key in a table
    return Tables:pickkey(_table, math.random(Tables:size(_table))) -- nil if no items
end

function Tables:randompickval(_table) -- return a random val in a table
    return _table[Tables:randompickkey(_table)] -- nil if no items
end

function Tables:findKey(_table, _find) -- return the key of key _find else nil if not found
    for _key, _val in pairs(_table or {}) do
        if _key == _find then return _key end
    end
    return -- nil
end

function Tables:findVal(_table, _find) -- return the key of val _find else nil if not found
    for _key, _val in pairs(_table or {}) do
        if _val == _find then return _key end
    end
    return -- nil
end

function Tables:keyAppend(_table, _key, _val) -- add/replace a key val entry
    if not _table or not _key then return end -- mandatory
    _val = (_val) and _val or true
    _table[_key] = _val
end

function Tables:keyRemove(_table, _key) -- remove a key val entry
    if not _table or not _key then return end -- mandatory
    _table[_key] = nil
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


function Tables:dump(_table, _argt) -- dump a table -- SORTED -- RECURSIVE -- INDENT -- DEPTH
    _argt = (_argt) and _argt or {}
    local _indent  = _argt.indent or ""
    local _depth   = _argt.depth or Nums.MAXINTEGER
    local _verbose = (_argt.verbose == true) or false
    local _hide    = _argt.hide or {} -- hide keys
    local _show    = _argt.show or {} -- override hidden keys if any
    local _skip    = _argt.skip or {} -- skip tables with those keys
    local _keep    = _argt.keep or {} -- override skipped tables with those keys if any

    local _tablesdumped = {} -- already dumped tables to avoid dead loops
    function _dump(_table, _argt)
        local _depth  = _argt.depth
        local _indent = _argt._indent

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
                if Tables:findVal(_hide, _key) then
                    _doshow = false -- hide some keys
                elseif Tables:findVal(_hide, "*all*") then
                    _doshow = false -- hide all keys -- special pattern
                elseif Tables:findVal(_hide, "*num*") and type(_key) == "number" then
                    _doshow = false -- hide num keys -- special pattern
                elseif Tables:findVal(_hide, "*str*") and type(_key) == "string" then
                    _doshow = false -- hide str keys -- special pattern
                end
            end

            if _show and not _doshow then -- override hidden keys if any
                if Tables:findVal(_show, _key) then
                    _doshow = true -- show some keys
                elseif Tables:findVal(_show, "*all*") then
                    _doshow = true -- show all keys -- special pattern
                elseif Tables:findVal(_show, "*num*") and type(_key) == "number" then
                    _doshow = true -- show num keys -- special pattern
                elseif Tables:findVal(_show, "*str*") and type(_key) == "string" then
                    _doshow = true -- show str keys -- special pattern
                end
            end

            if _doshow then
                _result = _result.._indent..tostring(_key).."\t"..tostring(_val).."\n"
            end

            if _skip and _dokeep and type(_val) == "table" then -- skip tables with those keys
                if Tables:findVal(_skip, _key) then
                    _dokeep = false -- skip some keys
                elseif Tables:findVal(_skip, "*all*") then
                    _dokeep = false -- skip all keys -- special pattern
                elseif Tables:findVal(_skip, "*num*") and type(_key) == "number" then
                    _dokeep = false -- skip num keys -- special pattern
                elseif Tables:findVal(_skip, "*str*") and type(_key) == "string" then
                    _dokeep = false -- skip str keys -- special pattern
                end
            end

            if _keep and not _dokeep and type(_val) == "table" then -- override skipped tables if any
                if Tables:findVal(_keep, _key) then
                    _dokeep = true -- keep some keys
                elseif Tables:findVal(_keep, "*all*") then
                    _dokeep = true -- keep all keys -- special pattern
                elseif Tables:findVal(_keep, "*num*") and type(_key) == "number" then
                    _dokeep = true -- keep num keys -- special pattern
                elseif Tables:findVal(_keep, "*str*") and type(_key) == "string" then
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
