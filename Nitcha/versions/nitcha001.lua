-- title:   Nitcha
-- author:  LKS
-- desc:    Nitcha the Drow Adventures
--
-- version: 0.1
-- script:  lua
-- sprites & animations


-- lib
package.path = package.path..";G:/TIC80 1.1/TICProjects/Nitcha/?.lua"
Classic = require("libs/Classic")


-- Constants
SCREENW = 240 -- screen w
SCREENH = 136 -- screen h

OFFSETCROUCH = 4 -- sprites offsets
OFFSETMOVING = 16

CK = 0 -- color used as transparent
SC = 1 -- sprite scale

KEYUP = 26 -- move up (z)
KEYDW = 19 -- move down (s)
KEYLF = 17 -- move left (q)
KEYRG = 04 -- move right (d)
KEYCR = 03 -- crouch on/off (c)

DIRHLF = 0 -- h directions
DIRHRG = 1
DIRVUP = -1 -- v directions
DIRVMD = 0
DIRVDW =  1

FRAME00 = 0 -- characters animations
FRAME01 = 1

CROUCHN = 0 -- crouched or not
CROUCHY = 1

STRESSMIN = 0 -- stress handling
STRESSMAX = 100

WEAPONBANK = 448 -- weapons types
WEAPONEMPTY = WEAPONBANK + 0
WEAPONMELEE = WEAPONBANK + 1
WEAPONRANGE = WEAPONBANK + 2
WEAPONMAGIC = WEAPONBANK + 3
WEAPONLIGHT = WEAPONBANK + 4
WEAPONALCHE = WEAPONBANK + 5


-- Nitcha TODO an object
Nitcha = {
	spritebank = 336, -- first sprite in bank
	sprite = 337, -- initial sprite
	worldx = 0, -- position in the world
	worldy = 0,
	screenx = SCREENW/2, -- position on screen
	screeny = SCREENH/2,
	stress = STRESSMIN, -- initial stress
 frame = FRAME00, -- initial frame
	crouch = CROUCHN, -- initial crouch state
	dirh = DIRHRG, -- h direction 0=lf 1=rg
 dirv = DIRVMD, -- v direction -1=up 0=md +1=dw
 weapons = { -- carried weapons
  },
 weapon = WEAPONRANGE, -- actual weapon
}

-- Goliath TODO an object
Goliath = {
	spritebank = 280, -- first sprite in bank
	sprite = 281, -- initial sprite
	worldx = 0, -- position in the world
	worldy = 0,
	screenx = SCREENW/2, -- position on screen
	screeny = SCREENH/2,
	stress = STRESSMIN, -- initial stress
 frame = FRAME00, -- initial frame
	crouch = CROUCHN, -- initial crouch state
	dirh = DIRHRG, -- h direction 0=lf 1=rg
 dirv = DIRVMD, -- v direction -1=up 0=md +1=dw
 weapons = { -- carried weapons
  },
 weapon = WEAPONMELEE, -- actual weapon
}


-- Globals
InitGame_ = true
Character_ = Goliath

-- idle time
idle = true
idletime = 0
idletimemax = 60


function TIC()

	-- Init once
	if InitGame_ then
		-- TODO
		InitGame_ = false
	end

	cls()
	
	-- how long we idle
 --	countIdle()
  	
	-- Check keys/mouse
	handleUI(Character_)
	
	-- Draw the screen
	-- draw map
	-- draw ennemies ?
	-- draw neutrals ?
	-- draw ...

	drawWeapon(Character_)
	drawCharacter(Character_)	
	-- drawHUD

end

-- ---
-- stay idle and get stress
function countIdle()
	if idle then
		if idletime < idletimemax then
		 idletime = idletime + 1
	 end
		if stress < stressmax then
		 stress = stress + 1
	 end
	else 
		idletime = 0 
	end
end

-- check if I am stressed
function checkStress()
 _stressran = math.random(0, stressmax)
 return _stressran <= stress
end

-- display the stress level
function displayStress()
	print("Stress "..stress)
	if checkStress() then
		getStressed()
	else
		notStressed()
	end
end

-- is in stress
function getStressed()
 print("Stressed", 0, 8)
 if math.random(100) == 1 then
		sprite = spriteani[math.random(#spriteani)]
	end
end

-- is not in stress
function notStressed()
	print("Not Stressed", 0, 8)
	sprite = spritemin
end


function drawWeapon(_character)
 local _sprite = _character.weapon +
  _character.frame * OFFSETMOVING
	local _x = _character.screenx
	local _y = _character.screeny +
	 _character.frame +
		_character.crouch
	local _flip = _character.dirh
	drawSprite(_sprite, _x, _y, _flip)
end

function drawCharacter(_character)
	local _sprite = _character.sprite +
	 _character.dirv +
		_character.frame * OFFSETMOVING +
		_character.crouch * OFFSETCROUCH
	local _x = _character.screenx
	local _y = _character.screeny
	local _flip = _character.dirh
	drawSprite(_sprite, _x, _y, _flip)  
end

function drawSprite(_sprite, _x, _y, _flip)
 spr(_sprite, _x, _y, CK, SC, _flip)
end

function handleUI(_character)
 local _moving = false
	if keyp(KEYCR) then -- toggle crouch
		_character.crouch = toggle01(_character.crouch)
	end
	if key(KEYLF) then -- go left
		_character.dirv = DIRVMD -- reset to middle
		if _character.dirh == DIRHLF then -- move left
		 _moving = true
		else -- turn left
		 _character.dirh = DIRHLF
		end
	end
	if key(KEYRG) then -- go right
		_character.dirv = DIRVMD -- reset to middle
		if _character.dirh == DIRHRG then -- move right
		 _moving = true
		else -- turn right
		 _character.dirh = DIRHRG
		end
	end
	if key(KEYUP) then -- go up
		if _character.dirv == DIRVUP then -- move up
		 _moving = true
		else -- turn up
		 _character.dirv = DIRVUP
		end
	end
	if key(KEYDW) then -- go down
		if _character.dirv == DIRVDW then -- move down
		 _moving = true
		else -- turn down
		 _character.dirv = DIRVDW
		end
	end
	
	if _moving then -- toggle animation frame if any
	 _character.frame = toggle01(_character.frame)
	end
end

function toggle01(_01) -- toggle between 0-1
 if _01 == 1 then return 0 end
 return 1
end
