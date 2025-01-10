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
        return self.actvalue
    end
    -- TODO add more modes
end

function CCycler:prev() -- prev cycler value
    local _newindex = self.actindex + self.stepprev
    if self.mode == CCycler.MODELOOP then
        self.actindex = Nums:isBW(_newindex, self.minindex, self.maxindex) and _newindex or self.maxindex
        self.actvalue = self.actindex -- value = index by default
        return self.actvalue
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
