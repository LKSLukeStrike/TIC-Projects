-- CCycler classic
-- Instance only once
-- Contains constants, globals and general functions
-- 


--
-- Packages
local Classic = require("libraries/ext/Classic")                
local Nums = require("libraries/lks/Nums")
            

--
-- CCycler
--
CCycler = Classic:extend() -- general cyclers
CCycler.MININDEX = 0
CCycler.MAXINDEX = 0
CCycler.ACTINDEX = CCycler.MININDEX
CCycler.ACTVALUE = CCycler.ACTINDEX
CCycler.STEPNEXT =  1
CCycler.STEPPREV = -1
CCycler.MODELOOP = 1 -- go from max to min and from min to max
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
    self.mode     = CCycler.MODELOOP
    self:argt(_argt) -- override if any
end

function CCycler:next() -- next cycler value
    local _newindex = self.actindex + self.stepnext
    if self.mode == CCycler.MODELOOP then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.minindex
        self.actvalue = self.actindex -- value = index by default
        return self.actindex
    end
    -- TODO add more modes
end

function CCycler:prev() -- prev cycler value
    local _newindex = self.actindex + self.stepprev
    if self.mode == CCycler.MODELOOP then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.maxindex
        self.actvalue = self.actindex -- value = index by default
        return self.actindex
    end
    -- TODO add more modes
end


CCyclerNum = CCycler:extend() -- numeric cyclers
function CCyclerNum:new(_argt)
    CCyclerNum.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


CCyclerInt = CCyclerNum:extend() -- integer cyclers
function CCyclerInt:new(_argt)
    CCyclerInt.super.new(self, _argt)
    self:argt(_argt) -- override if any
end


CCyclerTable = CCycler:extend() -- table cyclers
function CCyclerTable:new(_argt)
    CCyclerTable.super.new(self, _argt)
    self.acttable = {} -- internal table
    self.actvalue = nil
    self:argt(_argt) -- override if any
end

function CCyclerTable:insert(_item, _at) -- insert an _item into table _at (end by default)
    if _item == nil then return self.actindex end
    if _at == nil then
        table.insert(self.acttable, _item)
        self.actindex = #self.acttable -- adjust actual index
    else
        _at = (Nums:isLT(_at, 1)) and 1 or _at -- beg
        _at = (Nums:isGT(_at, #self.acttable)) and #self.acttable + 1 or _at -- end
        table.insert(self.acttable, _at, _item)
        self.actindex = _at -- adjust actual index
    end
    self.minindex = 1 -- at least one item
    self.maxindex = #self.acttable
    self.actvalue = _item
    return self.actindex
end

function CCyclerTable:remove(_at) -- remove an item from table _at (end by default)
    -- TODO
end

function CCyclerTable:next() -- next cycler value
    CCyclerTable.super.next(self)
    self.actvalue = self.acttable[self.actindex]
    return self.actindex
end

function CCyclerTable:prev() -- ^rev cycler value
    CCyclerTable.super.prev(self)
    self.actvalue = self.acttable[self.actindex]
    return self.actindex
end
