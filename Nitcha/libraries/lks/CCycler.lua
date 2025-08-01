-- CCycler classic
-- Instance only once
-- 

--
-- Packages
package.path  = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
local Classic = require("libraries/ext/Classic")                
local Nums    = require("libraries/lks/Nums")
local Tables  = require("libraries/lks/Tables")


--
-- CCycler
--
local CCycler = Classic:extend() -- general cyclers


CCycler.MININDEX = 0
CCycler.MAXINDEX = 0
CCycler.ACTINDEX = CCycler.MININDEX
CCycler.ACTVALUE = CCycler.ACTINDEX
CCycler.STEPNEXT =  1
CCycler.STEPPREV = -1
CCycler.MODECYCLE = "cycle" -- go from max to min and from min to max
CCycler.MODEBLOCK = "block" -- block at min and max
-- TODO more modes
-- TODO adjust min and max indexes if any
function CCycler:new(_argt)
    CCycler.super.new(self, _argt)
    self.minindex = CCycler.MININDEX
    self.maxindex = CCycler.MAXINDEX
    self.actindex = CCycler.ACTINDEX
    self.actvalue = CCycler.ACTVALUE
    self.stepnext = CCycler.STEPNEXT
    self.stepprev = CCycler.STEPPREV
    self.mode     = CCycler.MODECYCLE
    self:argt(_argt) -- override if any
end

function CCycler:print()
    print()
    Tables:print(self, {indent = " "})
end

function CCycler:min() -- min cycler value
    self.actindex = self.minindex
    self.actvalue = self.actindex -- value = index by default
    return self.actvalue
end

function CCycler:max() -- max cycler value
    self.actindex = self.maxindex
    self.actvalue = self.actindex -- value = index by default
    return self.actvalue
end

function CCycler:prev() -- prev cycler value
    local _newindex = self.actindex + self.stepprev
    if self.mode == CCycler.MODECYCLE then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.maxindex
    elseif self.mode == CCycler.MODEBLOCK then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.minindex
    end
    -- TODO add more modes
    self.actvalue = self.actindex -- value = index by default
    return self.actvalue
end

function CCycler:next() -- next cycler value
    local _newindex = self.actindex + self.stepnext
    if self.mode == CCycler.MODECYCLE then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.minindex
    elseif self.mode == CCycler.MODEBLOCK then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.maxindex
    end
    -- TODO add more modes
    self.actvalue = self.actindex -- value = index by default
    return self.actvalue
end

function CCycler:isMIN() -- if its min cycler value
    return self.actvalue == self.minindex 
end

function CCycler:isMAX() -- if its max cycler value
    return self.actvalue == self.maxindex 
end

function CCycler:isGEH() -- if its ge half of cycler range -- FIXME probably doent word with non numerics
    return self.actvalue >= ((self.maxindex - self.minindex) // 2)
end
-- TODO add more tests ?


CCyclerNum = CCycler:extend() -- numeric cyclers
function CCyclerNum:new(_argt)
    CCyclerNum.super.new(self, _argt)
    self:argt(_argt) -- override if any
    return self.actvalue
end


CCyclerInt = CCyclerNum:extend() -- integer cyclers
function CCyclerInt:new(_argt)
    CCyclerInt.super.new(self, _argt)
    self:argt(_argt) -- override if any
    return self.actvalue
end


CCyclerTable = CCycler:extend() -- table cyclers
function CCyclerTable:new(_argt)
    self.acttable = {} -- internal table
    self.actvalue = nil
    CCyclerTable.super.new(self, _argt)
    self:argt(_argt) -- override if any
    return self.actvalue
end

function CCyclerTable:argt(_argt) -- setup cycler
    CCyclerTable.super.argt(self, _argt)
    local _size = Tables:size(self.acttable)
    if _size == 0 then -- empty acttable
        self.minindex = 0
        self.maxindex = self.minindex
        self.actindex = self.minindex
        self.actvalue = nil
        return self.actvalue
    end
    self.minindex = 1
    self.maxindex = _size
    self.actindex = (Nums:isBW(self.actindex, self.minindex, self.maxindex))
        and self.actindex
        or  self.minindex
    self.actvalue = self.acttable[self.actindex]
    return self.actvalue
end

function CCycler:min() -- min cycler item
    self.actindex = self.minindex
    return self:argt()
end

function CCycler:max() -- max cycler item
    self.actindex = self.maxindex
    return self:argt()
end

function CCycler:at(_at) -- at cycler item
    if not Nums:isBW(_at, self.minindex, self.maxindex) then return end -- not in cycler
    self.actindex = _at
    return self:argt()
end

function CCyclerTable:insert(_item, _at) -- insert an _item into table _at (end by default) -- TODO add unique ?
    if not _item then return self.actvalue end
    if not _at then
        table.insert(self.acttable, _item)
        self.actindex = Tables:size(self.acttable) -- adjust actual index
    else
        _at = (Nums:isLT(_at, 1)) and 1 or _at -- beg
        _at = (Nums:isGT(_at, Tables:size(self.acttable))) and Tables:size(self.acttable) + 1 or _at -- end
        table.insert(self.acttable, _at, _item)
        self.actindex = _at -- adjust actual index
    end
    return self:argt()
end

function CCyclerTable:remove(_at) -- remove an item from table _at (end by default)
    _at = _at or self.maxindex
    _at = (Nums:isLT(_at, self.minindex)) and self.minindex or _at -- beg
    _at = (Nums:isGT(_at, self.maxindex)) and self.maxindex or _at -- end
    if _at == 0 then return end -- empty cycler
    table.remove(self.acttable, _at)
    self.actindex = (_at <= self.actindex) and self.actindex - 1 or self.actindex
    return self:argt()
end

function CCyclerTable:prev() -- prev cycler value
    CCyclerTable.super.prev(self)
    self.actvalue = self.acttable[self.actindex]
    return self.actvalue
end

function CCyclerTable:next() -- next cycler value
    CCyclerTable.super.next(self)
    self.actvalue = self.acttable[self.actindex]
    return self.actvalue
end



-- END
return CCycler
