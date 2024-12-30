-- title:   Nitcha
-- author:  LKS
-- desc:    Nitcha the Drow Adventures
--
-- version: 0.1
-- script:  lua
-- sprites & animations


-- Constants
DISPLAYW = 240 -- screen w
DISPLAYH = 136 -- screen h
UP = 0 -- up
DW = 1 -- down
LF = 2 -- left
RG = 3 -- right

-- Nitcha for now TODO
x = DISPLAYW/2
y = DISPLAYH/2

-- stress
stressmin = 0
stressmax = 100
stress = stressmin

-- sprites
spritemin = 272
spritemax = 274
spriteani = {
	272,
	273,
	274,
}
sprite = spritemin

-- idle time
idle = true
idletime = 0
idletimemax = 60


function TIC()

	-- how long we idle
 	countIdle()

	-- is the player moving ?
 	movePlayer()
	
	-- draw the result
	cls()
	displayStress()
	spr(sprite, x, y)

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

-- move player and remove the stress
function movePlayer()
	if btn(UP) then y=y-1; stress = 0 end
	if btn(DW) then y=y+1; stress = 0 end
	if btn(LF) then x=x-1; stress = 0 end
	if btn(RG) then x=x+1; stress = 0 end
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

