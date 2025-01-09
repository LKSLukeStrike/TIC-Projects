-- title:   Puppet
-- author:  LKS
-- desc:    For testing purposes
-- script:  lua


--
-- Wrappers for calls external to tic80
TIC80 = (exit and true or false)
if not TIC80 then
    function trace(...)
        print("trace:", table.unpack({...}))
    end
    function spr(...)
        print("spr:", table.unpack({...}))
    end
    function cls(...)
        print("cls:", table.unpack({...}))
    end
    function exit(...)
        print("exit:", table.unpack({...}))
        os.exit()
    end
 end


--
-- Packages
local Tic = require("libraries/tic/Tic")


--
-- Main
function TIC()
    Tic:draw()
end


if not TIC80 then -- run it from outside tic80
   TIC()
end
