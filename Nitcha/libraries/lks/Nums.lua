-- Nums object
-- Instance only once
-- 

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"


--
-- Nums
--
local Nums = {}


-- Constants
Nums.MAXINTEGER = 0 + 2^31 -- due to lua 5.3
Nums.MININTEGER = 0 - 2^31


-- Conversions
function Nums:yes2int(_yes) -- convert a boolean to integer 0|1
    return _yes and 1 or 0
end


-- Signs
function Nums:neg(_num) -- negative num
    return (_num <= 0) and _num or 0 - math.abs(_num)
end

function Nums:pos(_num) -- positive num
    return (_num >= 0) and _num or 0 + math.abs(_num)
end

function Nums:invert(_num) -- invert positive/negative
    return (_num >= 0) and Nums:neg(_num) or Nums:pos(_num)
end

function Nums:sign(_num) -- sign of num -- -1, 0 or +1
    return (_num < 0)
        and -1
        or  (_num > 0)
            and 1
            or  0
end


-- Rounding
function Nums:roundmax(_num) -- max rounded num
    return (_num >= 0) and math.ceil(_num) or math.floor(_num)
end

function Nums:roundmin(_num) -- min rounded num
    return (_num >= 0) and math.floor(_num) or math.ceil(_num)
end

function Nums:roundint(_num) -- remove the floating part
    return math.tointeger(_num // 1) -- avoid to return nil as math.tointeger does if floating is not .0
end


-- Random
function Nums:random(_num1, _num2) -- solid random, ensure correct interval
    _num1 = _num1 or 0
    _num2 = _num2 or 1
    local _min = math.min(_num1, _num2)
    local _max = math.max(_num1, _num2)
    return math.random(_min, _max)
end

function Nums:random01(_percent0) -- returns random 0 or 1 -- use _percent0 to adjust -- default 1/2
    _percent0 = (_percent0 and Nums:isBW(_percent0, 0, 1)) and _percent0 or 0.5
    return (math.random() <= _percent0) and 0 or 1
end


-- Frequences
function Nums:frequence01(_num, _frequence) -- 0 in frequence, 1 out of frequence -- toggle
    return math.tointeger((_num // _frequence) % 2)
end

function Nums:frequenceIsPeak(_num, _frequence) -- is frequence at peak ? (modulo == 0)
    return (_num % _frequence) == 0
end


-- Toggle
function Nums:toggle01(_num) -- toggle btw 0 1
    return (_num == 0) and 1 or 0
end

function Nums:toggleTF(_tf) -- toggle btw true false
    if _tf or _tf == nil then return false end
    return true
end


-- Odd / Even
function Nums:isOdd(_num) -- if num is odd
    return (_num % 2) == 1
end

function Nums:isEven(_num) -- if num is even
    return (_num % 2) == 0
end


-- Limits
function Nums:min(_num, _val) -- min value
    return (_num < _val) and _num or _val
end

function Nums:max(_num, _val) -- max value
    return (_num > _val) and _num or _val
end

function Nums:btw(_num, _min, _max) -- btw value
    return Nums:min(Nums:max(_num, _min), _max)
end


-- Distances
function Nums:distancePointsReal(_pointx0, _pointy0, _pointx1, _pointy1) -- real distance between 2 points -- slower
    return math.sqrt(Nums:distancePointsFake(_pointx0, _pointy0, _pointx1, _pointy1))
end

function Nums:distancePointsFake(_pointx0, _pointy0, _pointx1, _pointy1) -- fake distance between 2 points -- faster
    _pointx0 = _pointx0 or 0
    _pointy0 = _pointy0 or 0
    _pointx1 = _pointx1 or 0
    _pointy1 = _pointy1 or 0
    return ((_pointx0 - _pointx1) ^ 2) + ((_pointy0 - _pointy1) ^ 2)
end


-- Points
function Nums:pointsLine(_pointx0, _pointy0, _pointx1, _pointy1, _nobounds) -- list of points between 2 points -- exclude start and end if any
    _nobounds = _nobounds or false
    local _distance = Nums:distancePointsReal(_pointx0, _pointy0, _pointx1, _pointy1)
    local _offsetx  = (_pointx1 - _pointx0) / _distance
    local _offsety  = (_pointy1 - _pointy0) / _distance
    local _result   = {}
    local _pointx   = nil
    local _pointy   = nil
    local _roundx   = nil
    local _roundy   = nil
    for _ = 0, _distance do
        _roundx = Nums:roundint(Nums:roundmin(_pointx0 + (Nums:sign(_pointx0) * 0.5)))
        _roundy = Nums:roundint(Nums:roundmin(_pointy0 + (Nums:sign(_pointy0) * 0.5)))
        if not (_roundx == _pointx) or not (_roundy == _pointy) then
            table.insert(_result, {x = _roundx, y = _roundy})
            _pointx = _roundx
            _pointy = _roundy
        end
        _pointx0 = _pointx0 + _offsetx
        _pointy0 = _pointy0 + _offsety
    end
    if _nobounds then -- remove beg and end bounds
        table.remove(_result, 1)
        table.remove(_result)
    end
    return _result
end

function Nums:pointsPickCount(_points, _count, _finish) -- pick count points -- distributed
    _finish = _finish or false
    _count = _count or #_points
    _count = (_count < 1 or _count > #_points) and #_points or _count -- all by default
    local _result = {}
    if _count == 0 then return _result end -- empty
    local _step = Nums:roundint(#_points / _count) --+ 1
    local _finished = false
    for _key = 1, #_points, _step do
        table.insert(_result, _points[_key])
        if _key == #_points then _finished = true end
    end
    if _finish and not _finished then
        table.insert(_result, _points[#_points])
    end
    return _result
end

function Nums:pointsPickPercent(_points, _percent, _finish) -- pick percent points -- distributed
    return Nums:pointsPickCount(_points, Nums:roundint(#_points * _percent / 100), _finish)
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
