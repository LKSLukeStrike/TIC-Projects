-- Nums object
-- Instance only once
-- Contains constants, globals and general functions
-- 


Nums = {
}


-- Conversions
function Nums:yes2int(_yes) -- convert a boolean to integer 0|1
    return _yes and 1 or 0
end


-- Numeric comparisons
function Nums:_isFctAny(_num, _fct, ...) -- if _fct true on any ... -- false by default
    local _args = {...}
    if (not _num) or (not _fct) or (#_args == 0) then return false end
    for _, _val in ipairs(_args) do
        if _fct(self, _num, _val) then return true end
    end
    return false
end


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


function Nums:isGTAny(_num, ...) -- greater than any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isGT, table.unpack(_args))
end

function Nums:isGEAny(_num, ...) -- greater or equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isGE, table.unpack(_args))
end

function Nums:isEQAny(_num, ...) -- equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isEQ, table.unpack(_args))
end

function Nums:isNEAny(_num, ...) -- not equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isNE, table.unpack(_args))
end

function Nums:isLEAny(_num, ...) -- lower or equals any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isLE, table.unpack(_args))
end

function Nums:isLTAny(_num, ...) -- lower than any ... -- false by default
    local _args = {...}
    if (not _num) or (#_args == 0) then return false end
    return self:_isFctAny(_num, self.isLT, table.unpack(_args))
end


-- END
return Nums
