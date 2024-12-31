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

    HIDENOT = 0, -- hidden or not
    HIDEYES = 1,

    STRESSMIN = 0, -- stress handling
    STRESSMAX = 100,

    WEAPONBANK = 448, -- weapons types
    WEAPONEMPTY = -1,
    WEAPONMELEE = 0,
    WEAPONRANGE = 1,
    WEAPONMAGIC = 2,
    WEAPONLIGHT = 3,
    WEAPONALCHE = 4,

    STATUSBANK = 480, -- status types
    STATUSEMPTY = -1,
    STATUSSLEEP = 0,
    STATUSWOUND = 1,
    STATUSALCHE = 2,
    STATUSKNOCK = 3,
    STATUSDEATH = 4,


    -- Log System -- store logs to display each frame
    Log = {},


    -- Tick System -- loop on the tick from 0-59
    Tick = 0,

}



-- Utils
function Tic:b2i(_boolean) -- convert a boolean to integer 0-1
    return _boolean and 1 or 0
end


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


-- Tick System
function Tic:tick() -- loop on tick from 0-59 -- to be called in TIC()
    self.Tick = self.Tick == 59 and 0 or self.Tick + 1
end


function Tic:draw()
    local _tick = Tic.Tick
    local _frame = Tic:b2i(_tick < 50)

    Tic:logStack("W: "..Tic.SCREENW)
    Tic:logStack("H: "..Tic.SCREENH)
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
    else
        Tic:logStack("Ok !")
    end
    Tic:logStack("Frame ".._frame)

    cls()
    Tic:logPrint()
    spr(273 + (_frame * 16), 100, 100)
end
