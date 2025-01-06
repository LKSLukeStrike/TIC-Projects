-- title:   Puppet
-- author:  LKS
-- desc:    For testing purposes
-- script:  lua


--
-- Wrappers for calls external to tic80
if not trace then
    function trace(...)
        print("trace:", table.unpack({...}))
    end
end
    
if not spr then
    function spr(...)
        print("spr:", table.unpack({...}))
    end
end
    
if not cls then
    function cls(...)
        print("cls:", table.unpack({...}))
    end
end


--
-- Packages
local Tic = require("libraries/tic/Tic")


--
-- Main
function TIC()
    Tic:draw()
    Tic:tick() -- MUST end TIC()
end


if not exit then -- run it from outside tic80
    TIC()
end
