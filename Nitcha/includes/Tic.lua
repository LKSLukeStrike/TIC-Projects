-- Tic object
-- Instance only once
-- Contains constants, globals and general functions


Tic = {
    -- Constants
    SCREENW = 240, -- screen width
    SCREENH = 136, -- screen height

    OFFSETHIDE = 4, -- sprites offsets
    OFFSETMOVE = 16,

    CK = 0, -- color used as transparent
    SC = 1, -- sprite scale

    KEYUP = 26, -- move up (z)
    KEYDW = 19, -- move down (s)
    KEYLF = 17, -- move left (q)
    KEYRG = 04, -- move right (d)
    KEYCR = 03, -- hide on/off (c)

    DIRHLF = 0, -- h directions
    DIRHRG = 1,
    DIRVMD = 0, -- v directions
    DIRVUP = -1,
    DIRVDW =  1,

    FRAME00 = 0, -- characters animations
    FRAME01 = 1,

    HIDEN = 0, -- hidden or not
    HIDEY = 1,

    STRESSMIN = 0, -- stress handling
    STRESSMAX = 100,

    WEAPONBANK = 448, -- weapons types
    WEAPONEMPTY = 0,
    WEAPONMELEE = 1,
    WEAPONRANGE = 2,
    WEAPONMAGIC = 3,
    WEAPONLIGHT = 4,
    WEAPONALCHE = 5,

    STATUSBANK = 480, -- status types
    STATUSSLEEP = 0,
    STATUSWOUND = 1,
    STATUSALCHE = 2,
    STATUSKNOCK = 3,
    STATUSDEATH = 4,


    -- Log System
    Log = {},

}


-- Log System
function Tic:logClear() -- clear the log
    self.Log = {}
end

function Tic:logStack(_item) -- add item to the log
    table.insert(self.Log, _item)
end

function Tic:logPrint() -- print the log and clear it
    for _index, _item in ipairs(self.Log) do
        _index = _index - 1 -- start from 0
        print(_item, 0, _index * 8) -- one item per "line"
      end    
    Tic:logClear()
end


-- Ticks
function Tic:getTick() -- at what tick we are from 0 to 59
    return (time() // 60) % 60
end


function Tic:draw()
    cls()
    Tic:logStack("Hello")
    Tic:logStack("World")
    Tic:logStack("W: "..Tic.SCREENW)
    Tic:logStack("H: "..Tic.SCREENH)
    local _tick = Tic.getTick()
    Tic:logStack("T: ".._tick)
    if _tick == 0 then
        Tic:logStack("00: True")
    else
        Tic:logStack("00: False")
    end
    if _tick == 59 then
        Tic:logStack("59: True")
    else
        Tic:logStack("59: False")
    end
    if _tick > 59 then
        Tic:logStack("Error !")
    end
    Tic:logPrint()
end
