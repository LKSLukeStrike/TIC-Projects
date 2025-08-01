-- title:   Puppet
-- author:  LKS
-- desc:    For testing purposes
-- script:  lua


--
-- Wrappers for calls external to tic80
TIC80 = (exit) 
if not TIC80 then
    function trace(...)
        print("trace:")
        print(table.unpack({...}))
    end
    function spr(...)
        print("spr:", table.unpack({...}))
    end
    function cls(...)
        print("cls:", table.unpack({...}))
    end
    function rect(...)
        print("rect:", table.unpack({...}))
    end
    function rectb(...)
        print("rectb:", table.unpack({...}))
    end
    function circ(...)
        print("circ:", table.unpack({...}))
    end
    function circb(...)
        print("circb:", table.unpack({...}))
    end
    function line(...)
        print("line:", table.unpack({...}))
    end
    function poke4(...)
        print("poke4:", table.unpack({...}))
    end
    function peek(...)
        print("peek:", table.unpack({...}))
        return 0
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
