-- Nums object
-- Instance only once
-- Contains constants, globals and general functions
-- 
local Nums = {}


-- Conversions
function Nums:yes2int(_yes) -- convert a boolean to integer 0|1
    return _yes and 1 or 0
end


-- Frequences
function Nums:frequence01(_num, _frequence) -- 0 in frequence, 1 out of frequence -- toggle
    return math.tointeger((_num // _frequence) % 2)
end


-- Toggle
function Nums:toggle01(_num) -- toggle btw 0 1
    return (_num == 0) and 1 or 0
end


-- Comparisons
function Nums:_isFctAny(_num, _fct, ...) -- if _fct true on any ... -- false by default
    local _args = {...}
    if (not _num) or (not _fct) or (#_args == 0) then return false end
    for _, _val in pairs(_args) do
        if _fct(self, _num, _val) then return true end
    end
    return false
end

function Nums:_isFctAll(_num, _fct, ...) -- if _fct true on all ... -- false by default
    local _args = {...}
    if (not _num) or (not _fct) or (#_args == 0) then return false end
    for _, _val in pairs(_args) do
        if not _fct(self, _num, _val) then return false end
    end
    return true
end


-- Single
function Nums:isGT(_num, _val) -- greater than _val
    if (not _num) or (not _val) then return false end
    return _num > _val
end

function Nums:isGE(_num, _val) -- greater or equals _val
    if (not _num) or (not _val) then return false end
    return _num >= _val
end

function Nums:isEQ(_num, _val) -- equals _val
    if (not _num) or (not _val) then return false end
    return _num == _val
end

function Nums:isNE(_num, _val) -- not equals _val
    if (not _num) or (not _val) then return false end
    return _num ~= _val
end

function Nums:isLE(_num, _val) -- lower or equals _val
    if (not _num) or (not _val) then return false end
    return _num <= _val
end

function Nums:isLT(_num, _val) -- lower than _val
    if (not _num) or (not _val) then return false end
    return _num < _val
end

function Nums:isBW(_num, _valx, _valy, _inmin, _inmax) -- between _valx and _valy, inclusive or exclusive
    if (not _num) or (not _valx) or (not _valy) then return false end
    _inmin = (_inmin == nil or _inmin == true) and true or false
    _inmax = (_inmax == nil or _inmax == true) and true or false
    local _min = math.min(_valx, _valy) -- adjust the min and max
    local _max = math.max(_valx, _valy)
    if (_inmin) and Nums:isLT(_num, _min) then return false end
    if (not _inmin) and Nums:isLE(_num, _min) then return false end
    if (_inmax) and Nums:isGT(_num, _max) then return false end
    if (not _inmax) and Nums:isGE(_num, _max) then return false end
    return true
end


-- Any
function Nums:isGTAny(_num, ...) -- greater than any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isGT, table.unpack(_args))
end

function Nums:isGEAny(_num, ...) -- greater or equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isGE, table.unpack(_args))
end

function Nums:isEQAny(_num, ...) -- equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isEQ, table.unpack(_args))
end

function Nums:isNEAny(_num, ...) -- not equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isNE, table.unpack(_args))
end

function Nums:isLEAny(_num, ...) -- lower or equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isLE, table.unpack(_args))
end

function Nums:isLTAny(_num, ...) -- lower than any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAny(_num, self.isLT, table.unpack(_args))
end


-- All
function Nums:isGTAll(_num, ...) -- greater than all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isGT, table.unpack(_args))
end

function Nums:isGEAll(_num, ...) -- greater or equals all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isGE, table.unpack(_args))
end

function Nums:isEQAll(_num, ...) -- equals all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isEQ, table.unpack(_args))
end

function Nums:isNEAll(_num, ...) -- not equals all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isNE, table.unpack(_args))
end

function Nums:isLEAll(_num, ...) -- lower or equals all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isLE, table.unpack(_args))
end

function Nums:isLTAll(_num, ...) -- lower than all ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return Nums:_isFctAll(_num, self.isLT, table.unpack(_args))
end



-- END
return Nums
