--
-- IButton
--
IButton = Classic:extend() -- generic button implementation
IButton.BEHAVIOUR = function(self) -- need at least one function
    if Tables:size(self:functionsDefined()) == 0 then
        self.enabled = false
    end
end


--
-- CButton
--
CButton = CElement:extend() -- generic button
Classic.KINDBUTTON = "Button" -- Button kind
Classic.NAMEBUTTON = "Button" -- Button name
function CButton:new(_argt)
    CButton.super.new(self, _argt)
    self.kind = Classic.KINDBUTTON
    self.name = Classic.NAMEBUTTON
    self.clickable     = true -- act as a button ?
    self.screenw       = Tic.SPRITESIZE -- sizes
    self.screenh       = Tic.SPRITESIZE
    self.enabled       = true  -- can be clicked ?
    self.hovered       = false -- hovered by the mouse ?
    self.actived       = false -- function triggered ?
    self.activedcycler = CCyclerInt{maxindex =  10, mode = CCycler.MODEBLOCK} -- cycler to maintain the actived effect a little bit 
	self.clicklf       = nil   -- function to trigger on click lf
	self.clickmd       = nil   -- function to trigger on click md
	self.clickrg       = nil   -- function to trigger on click rg
	self.scrollx       = nil   -- function to trigger on scroll x
	self.scrolly       = nil   -- function to trigger on scroll y
	self.behaviour     = IButton.BEHAVIOUR  -- function to trigger at first
    self.hovertextlf   = nil   -- hover CText for clicklf if any
    self.hovertextrg   = nil   -- hover CText for clickrg if any
    self.drawground    = true  -- draw beheviors
    self.drawguides    = false
    self.drawinside    = true
    self.drawcaches    = false
    self.drawborder    = true
    self.drawframes    = false
    self.colorground         = Tic.COLORWHITE -- colors
    self.colorborder         = Tic.COLORGREYM
    self.colorhover          = Tic.COLORHUDSCREEN
    self.colorgrounddisabled = Tic.COLORGREYL
    self.colorborderdisabled = Tic.COLORGREYM
    self.colorgroundactived  = Tic.COLORHOVER
    self.colorhoverground    = nil
    self:argt(_argt) -- override if any
end

function CButton:draw() -- button drawing
    CButton.super.draw(self)
    if self.hovered then
        if self.clicklf and (self.hovertextlf and self.hovertextlf:is(CText)) then self:drawHovertextLF() end
        if self.clickrg and (self.hovertextrg and self.hovertextrg:is(CText)) then self:drawHovertextRG() end
    end
end

function CButton:drawGround()
    self:save()
    self.colorground = (self.hovered) and self.colorhover          or self.colorground
    self.colorground = (self.actived) and self.colorgroundactived  or self.colorground
    self.colorground = (self.enabled) and self.colorground or self.colorgrounddisabled
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    CButton.super.drawGround(self)
    self:load()
end

function CButton:drawBorder()
    self:save()
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    CButton.super.drawBorder(self)
    self:load()
end

function CButton:drawHovertextLF()
    if self.colorhoverground then
        rect(
            self.hovertextlf.screenx -1,
            self.hovertextlf.screeny,
            self.hovertextlf.screenw + 1,
            self.hovertextlf.screenh,
            self.colorhoverground
        )
        rect(
            self.hovertextlf.screenx,
            self.hovertextlf.screeny - 1,
            self.hovertextlf.screenw - 1,
            self.hovertextlf.screenh + 2,
            self.colorhoverground
        )
    end
    self.hovertextlf.colorinside = self.colorgroundactived
    self.hovertextlf.screenx = self.screenx - ((self.hovertextlf.screenw - self.screenw) // 2) + 1
    self.hovertextlf.screeny = self.screeny - self.hovertextlf.screenh
    self.hovertextlf:draw()
end

function CButton:drawHovertextRG()
    if self.colorhoverground then
        rect(
            self.hovertextrg.screenx -1,
            self.hovertextrg.screeny,
            self.hovertextrg.screenw + 1,
            self.hovertextrg.screenh,
            self.colorhoverground
        )
        rect(
            self.hovertextrg.screenx,
            self.hovertextrg.screeny - 1,
            self.hovertextrg.screenw - 1,
            self.hovertextrg.screenh + 2,
            self.colorhoverground
        )
    end
    self.hovertextrg.colorinside = self.colorgroundactived
    self.hovertextrg.screenx = self.screenx - ((self.hovertextrg.screenw - self.screenw) // 2) + 1
    self.hovertextrg.screeny = self.screeny + self.screenh
    self.hovertextrg:draw()
end

function CButton:functionsDefined() -- defined functions of a button
    local _result = {}

    for _, _key in ipairs({Tic.BUTTONCLICKLF, Tic.BUTTONCLICKMD, Tic.BUTTONCLICKRG, Tic.BUTTONSCROLLX, Tic.BUTTONSCROLLY}) do
        if type(self[_key]) == "function" then Tables:valInsert(_result, self[_key], true) end
    end

    return _result
end

function CButton:functionsActived() -- actived functions (in a key table) of a button
    local _result = {}

    if Tic.MOUSE.clicklf and type(self[Tic.BUTTONCLICKLF]) == "function" then
        Tables:valInsert(_result, self[Tic.BUTTONCLICKLF], true)
    end
    if Tic.MOUSE.clickmd and type(self[Tic.BUTTONCLICKMD]) == "function" then
        Tables:valInsert(_result, self[Tic.BUTTONCLICKMD], true)
    end
    if Tic.MOUSE.clickrg and type(self[Tic.BUTTONCLICKRG]) == "function" then
        Tables:valInsert(_result, self[Tic.BUTTONCLICKRG], true)
    end
    if not (Tic.MOUSE.scrollx == 0) and type(self[Tic.BUTTONSCROLLX]) == "function" then
        Tables:valInsert(_result, self[Tic.BUTTONSCROLLX], true)
    end
    if not (Tic.MOUSE.scrolly == 0) and type(self[Tic.BUTTONSCROLLY]) == "function" then
        Tables:valInsert(_result, self[Tic.BUTTONSCROLLY], true)
    end

    return _result
end

function CButton:functionsContains(_function) -- does the button contains a function ?
    return (Tables:valFind(self:functionsDefined(), _function)) and true or false
end

function CButton:activable() -- is the button activable ?
    return self.display and self.enabled and Tables:size(self:functionsDefined()) > 0 and not self.actived
end

function CButton:activate() -- activate the button and start the effect cycler
    self.hovered = false
    self.actived = true
    self.activedcycler:max()
end

function CButton:deactivate() -- dehover the button and stop the activate effect if any
    self.hovered = false
    if self.activedcycler:prev() == 0 then
        self.actived = false
    end
end


--
-- CButtonText
--
CButtonText = CButton:extend() -- generic text button
function CButtonText:new(_argt)
    CButtonText.super.new(self, _argt)
	self.text = CText{} -- override with CText if any
    self.rounded = true
    self.colorinside = self.colorborder
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CButtonText:adjustWH() -- adjust screenw, screenh
    self.screenw = (self.marginlf * self.scale) + self.text.screenw + (self.marginrg * self.scale)
    self.screenh = (self.marginup * self.scale) + self.text.screenh + (self.margindw * self.scale)
end

function CButtonText:draw() -- button drawing
    self.drawinside = (self.text and self.text:is(CText)) and true or false
    CButtonText.super.draw(self)
end

function CButtonText:drawInside()
    self:alignElementDirection(self.text, self.align)
    self.text.colorinside = (self.colorinside) and self.colorinside or self.text.colorinside
    self.text:draw()
end


--
-- CButtonTextM2
--
CButtonTextM2 = CButtonText:extend() -- generic text button with margins 2
function CButtonTextM2:new(_argt)
    CButtonTextM2.super.new(self, _argt)
    self:argt(_argt) -- override if any
    self.text.marginup = 2
    self.text.margindw = 2
    self.text.marginlf = 2
    self.text.marginrg = 2
    self.text:adjustWH()
    self:adjustWH()
end


--
-- CButtonMenu
--
CButtonMenu = CButtonText:extend() -- generic menu button
function CButtonMenu:new(_argt)
    CButtonMenu.super.new(self, _argt)
    self.align   = Tic.DIR270
    self:argt(_argt) -- override if any
end


--
-- CButtonMenuM2
--
CButtonMenuM2 = CButtonTextM2:extend() -- generic menu button with margins 2
function CButtonMenuM2:new(_argt)
    CButtonMenuM2.super.new(self, _argt)
    self.align   = Tic.DIR270
    self:argt(_argt) -- override if any
end


--
-- CButtonSprite
--
CButtonSprite = CButton:extend() -- generic sprite button
function CButtonSprite:new(_argt)
    CButtonSprite.super.new(self, _argt)
	self.sprite = CSpriteBG{}
    self.drawborder = false
    self:argt(_argt) -- override if any
end

function CButtonSprite:drawGround()
    local _palette = {[self.colorground] = self.colorground, [self.colorborder] = self.colorborder}
    _palette = (self.hovered)
        and {[self.colorground] = self.colorhover, [self.colorborder] = self.colorborder}
        or  _palette
    _palette = (self.actived)
        and {[self.colorground] = self.colorgroundactived, [self.colorborder] = self.colorborder}
        or  _palette
    _palette = (self.enabled)
        and _palette
        or  {[self.colorground] = self.colorgrounddisabled, [self.colorborder] = self.colorborderdisabled}
    _palette = Tables:merge(self.sprite.palette, _palette)

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite.palette = _palette
    self.sprite:draw()
end


--
-- CButtonClick
--
CButtonClick = CButtonSprite:extend() -- generic click button


--
-- CButtonArrow
--
CButtonArrow = CButtonClick:extend() -- generic arrow click button
function CButtonArrow:new(_argt)
    CButtonArrow.super.new(self, _argt)
    self.drawborder    = false
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowLine
--
CButtonArrowLine = CButtonArrow:extend() -- generic line arrow click button
function CButtonArrowLine:new(_argt)
    CButtonArrowLine.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWL
    self:argt(_argt) -- override if any
end


--
-- CButtonArrowDiag
--
CButtonArrowDiag = CButtonArrow:extend() -- generic diag arrow click button
function CButtonArrowDiag:new(_argt)
    CButtonArrowDiag.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWD
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow000
--
CButtonArrow000 = CButtonArrowLine:extend() -- generic arrow 000 click button
function CButtonArrow000:new(_argt)
    CButtonArrow000.super.new(self, _argt)
    self.direction     = Tic.DIR000
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow045
--
CButtonArrow045 = CButtonArrowDiag:extend() -- generic arrow 045 click button
function CButtonArrow045:new(_argt)
    CButtonArrow045.super.new(self, _argt)
    self.direction     = Tic.DIR045
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow090
--
CButtonArrow090 = CButtonArrowLine:extend() -- generic arrow 090 click button
function CButtonArrow090:new(_argt)
    CButtonArrow090.super.new(self, _argt)
    self.direction     = Tic.DIR090
	self.sprite.rotate = CSprite.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow135
--
CButtonArrow135 = CButtonArrowDiag:extend() -- generic arrow 135 click button
function CButtonArrow135:new(_argt)
    CButtonArrow135.super.new(self, _argt)
    self.direction     = Tic.DIR135
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow180
--
CButtonArrow180 = CButtonArrowLine:extend() -- generic arrow 180 click button
function CButtonArrow180:new(_argt)
    CButtonArrow180.super.new(self, _argt)
    self.direction     = Tic.DIR180
	self.sprite.rotate = CSprite.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow225
--
CButtonArrow225 = CButtonArrowDiag:extend() -- generic arrow 225 click button
function CButtonArrow225:new(_argt)
    CButtonArrow225.super.new(self, _argt)
    self.direction     = Tic.DIR225
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow270
--
CButtonArrow270 = CButtonArrowLine:extend() -- generic arrow 270 click button
function CButtonArrow270:new(_argt)
    CButtonArrow270.super.new(self, _argt)
    self.direction     = Tic.DIR270
	self.sprite.rotate = CSprite.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow315
--
CButtonArrow315 = CButtonArrowDiag:extend() -- generic arrow 315 click button
function CButtonArrow315:new(_argt)
    CButtonArrow315.super.new(self, _argt)
    self.direction     = Tic.DIR315
	self.sprite.rotate = CSprite.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonCenter
--
CButtonCenter = CButtonArrow:extend() -- generic center click button
function CButtonCenter:new(_argt)
    CButtonCenter.super.new(self, _argt)
    self.direction     = nil
	self.sprite.sprite = CSpriteBG.SIGNCENTER
    self:argt(_argt) -- override if any
end


--
-- CButtonCheck
--
CButtonCheck = CButtonSprite:extend() -- generic check button
function CButtonCheck:new(_argt)
    CButtonCheck.super.new(self, _argt)
	self.checked = false
    self:argt(_argt) -- override if any
end

function CButtonCheck:drawGround()
    local _palette = {[self.colorground] = self.colorground, [self.colorborder] = self.colorborder}
    _palette = (self.checked)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorgroundactived}
        or  _palette
    _palette = (self.actived)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorgroundactived}
        or  _palette
    _palette = (self.hovered)
        and {[self.colorground] = self.colorground, [self.colorborder] = self.colorhover}
        or  _palette
    _palette = (self.enabled)
        and _palette
        or  {[self.colorground] = self.colorgrounddisabled, [self.colorborder] = self.colorborderdisabled}

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite.palette = _palette
    self.sprite:draw()
end


--
-- IButtonPlayer
--
IButtonPlayer = Classic:extend() -- players buttons implementation
IButtonPlayer.BEHAVIOUR = function(self) -- need at least one player
    self.display = (Tic:playerActual()) and true or false
    if not self.display then return end -- no player
    IButton.BEHAVIOUR(self)
end


--
-- IButtonPlayerChange -- player change buttons implementation
--
IButtonPlayerChange = Classic:extend() -- generic change player button
IButtonPlayerChange.BEHAVIOUR = function(self) -- need at least more than one player
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.enabled = Tables:size(Tic:playerPlayers()) > 1
end


--
-- CButtonPlayerPrev
--
CButtonPlayerPrev = CButtonArrow270:extend() -- generic player prev button
function CButtonPlayerPrev:new(_argt)
    CButtonPlayerPrev.super.new(self, _argt)
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = Tic.FUNCTIONPLAYERPREV
    self.hovertextlf    = CText{text = Tic.TEXTPREV}
    self.clickrg        = Tic.FUNCTIONPLAYERMIN
    self.hovertextrg    = CText{text = Tic.TEXTMIN}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerNext
--
CButtonPlayerNext = CButtonArrow090:extend() -- generic player next button
function CButtonPlayerNext:new(_argt)
    CButtonPlayerNext.super.new(self, _argt)
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = Tic.FUNCTIONPLAYERNEXT
    self.hovertextlf    = CText{text = Tic.TEXTNEXT}
    self.clickrg        = Tic.FUNCTIONPLAYERMAX
    self.hovertextrg    = CText{text = Tic.TEXTMAX}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerPick
--
CButtonPlayerPick = CButtonClick:extend() -- generic player pick button
function CButtonPlayerPick:new(_argt)
    CButtonPlayerPick.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNPLAYER
	self.behaviour      = IButtonPlayerChange.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:logAppend(Tic.TEXTPICK) end
    self.hovertextlf    = CText{text = Tic.TEXTPICK}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerStand
--
CButtonPlayerStand = CButtonCheck:extend() -- generic player stand button
CButtonPlayerStand.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():postureGet() == Tic.POSTURESTAND
    self.sprite.sprite = (Tic:playerActual():statusGet() == Tic.STATUSIDLE)
        and CSpriteBG.SIGNSTAIDL
        or  CSpriteBG.SIGNSTAMOV
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerStand:new(_argt)
    CButtonPlayerStand.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNSTAIDL
	self.behaviour      = CButtonPlayerStand.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleKneel() end
    self.hovertextlf    = CText{text = Tic.TEXTSTAND}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerKneel
--
CButtonPlayerKneel = CButtonCheck:extend() -- generic player kneel button
CButtonPlayerKneel.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():postureGet() == Tic.POSTUREKNEEL
    self.sprite.sprite = (Tic:playerActual():statusGet() == Tic.STATUSIDLE)
        and CSpriteBG.SIGNKNEIDL
        or  CSpriteBG.SIGNKNEMOV
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerKneel:new(_argt)
    CButtonPlayerKneel.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNKNEIDL
	self.behaviour      = CButtonPlayerKneel.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleKneel() end
    self.hovertextlf    = CText{text = Tic.TEXTKNEEL}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerWork
--
CButtonPlayerWork = CButtonCheck:extend() -- generic player work button
CButtonPlayerWork.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSWORK
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerWork:new(_argt)
    CButtonPlayerWork.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNDOWORK
	self.behaviour      = CButtonPlayerWork.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleWork() end
    self.hovertextlf    = CText{text = Tic.TEXTWORK}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerSleep
--
CButtonPlayerSleep = CButtonCheck:extend() -- generic player sleep button
CButtonPlayerSleep.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSSLEEP
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerSleep:new(_argt)
    CButtonPlayerSleep.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNDOSLEE
	self.behaviour      = CButtonPlayerSleep.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:toggleSleep() end
    self.hovertextlf    = CText{text = Tic.TEXTSLEEP}
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerStat
--
CButtonPlayerStat = CButtonSprite:extend() -- generic stat button
function CButtonPlayerStat:new(_argt)
    CButtonPlayerStat.super.new(self, _argt)
    self.sprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE}
    self.behaviour      = IButtonPlayer.BEHAVIOUR
    self.getcolorstat   = nil -- getcolorstat function if any
    self:argt(_argt) -- override if any
end

function CButtonPlayerStat:drawGround()
    if self.getcolorstat then
       self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = self:getcolorstat()})
    end

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite:draw()
end

CButtonPlayerStatPhy = CButtonPlayerStat:extend()
function CButtonPlayerStatPhy:new(_argt)
    CButtonPlayerStatPhy.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTPHY
    self.getcolorstat  = function() return Tic:playerActual():colorPhyAct() end
    self:argt(_argt) -- override if any
end

CButtonPlayerStatMen = CButtonPlayerStat:extend()
function CButtonPlayerStatMen:new(_argt)
    CButtonPlayerStatMen.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTMEN
    self.getcolorstat  = function() return Tic:playerActual():colorMenAct() end
    self:argt(_argt) -- override if any
end

CButtonPlayerStatPsy = CButtonPlayerStat:extend()
function CButtonPlayerStatPsy:new(_argt)
    CButtonPlayerStatPsy.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTPSY
    self.getcolorstat  = function() return Tic:playerActual():colorPsyAct() end
    self:argt(_argt) -- override if any
end


--
-- IButtonInteractions
--
IButtonInteractions = Classic:extend() -- interact button implementation
IButtonInteractions.BEHAVIOUR = function(self) -- need at least one player
    self.display = (Tic:playerActual()) and true or false
    if not self.display then return end -- no player
    self.display = Tic:playerActual():canInteract()
    if not self.display then return end -- no interaction
    self.sprite.flip = Tic:playerActual().dirx
end

CButtonInteractions = CButtonSprite:extend()
function CButtonInteractions:new(_argt)
    CButtonInteractions.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNINTMRK
    self.behaviour     = IButtonInteractions.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CButtonSlot
--
CButtonSlot = CButtonSprite:extend() -- generic slot button
function CButtonSlot:new(_argt)
    CButtonSlot.super.new(self, _argt)
    self.getslotobject       = nil -- getslotobject function if any
    self.drawborder          = true
    self.colorground         = Tic.COLORBIOMENIGHT
    self.colorborder         = self.colorframe1
    self.colorborderdisabled = self.colorframe2
    self.rounded = true
    self:argt(_argt) -- override if any
end

function CButtonSlot:drawBorder()
    if self.getslotobject then
       self.enabled = (self:getslotobject()) and true or false
    end

    self:save()
    self.screenx = self.screenx - 1
    self.screeny = self.screeny - 1
    self.screenw = self.screenw + 2
    self.screenh = self.screenh + 2
    CButtonSlot.super.drawBorder(self)
    self:load()
end

function CButtonSlot:drawGround()
    local _colorground = (self.hovered) and self.colorhover or self.colorground
    rect(self.screenx, self.screeny, self.screenw, self.screenh, _colorground)

    local _object = nil
    if self.getslotobject then
       _object = self:getslotobject()
    end
	if not _object then return end -- empty slot

    _object:save()
    _object.screenx  = self.screenx
    _object.screeny  = self.screeny
    _object.dirx     = Tic:playerActual().dirx
    _object:draw()
    _object:load()
end


--
-- IButtonSlotPlayer
--
IButtonSlotPlayer = Classic:extend() -- players buttons implementation
IButtonSlotPlayer.BEHAVIOUR = function(self) -- need at least one player with slots
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.display = (Tic:playerActual().slots) and true or false
end

CButtonSlotPlayer = CButtonSlot:extend()
function CButtonSlotPlayer:new(_argt)
    CButtonSlotPlayer.super.new(self, _argt)
    self.behaviour   = IButtonSlotPlayer.BEHAVIOUR
    self.clicklf     = function() Tic:logAppend(Tic.TEXTEDIT) end
    self.clickrg     = nil -- override per slot
    self.hovertextlf = CText{text = Tic.TEXTEDIT}
    self.hovertextrg = CText{text = Tic.TEXTDROP}
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHead = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHead:new(_argt)
    CButtonSlotPlayerHead.super.new(self, _argt)
    self.getslotobject = Tic.FUNCTIONSLOTGETHEAD
    self.clickrg       = Tic.FUNCTIONSLOTDROPHEAD
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerBack = CButtonSlotPlayer:extend()
function CButtonSlotPlayerBack:new(_argt)
    CButtonSlotPlayerBack.super.new(self, _argt)
    self.getslotobject = Tic.FUNCTIONSLOTGETBACK
    self.clickrg       = Tic.FUNCTIONSLOTDROPBACK
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHandLF = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHandLF:new(_argt)
    CButtonSlotPlayerHandLF.super.new(self, _argt)
    self.getslotobject = Tic.FUNCTIONSLOTGETHANDLF
    self.clickrg       = Tic.FUNCTIONSLOTDROPHANDLF
    self:argt(_argt) -- override if any
end

CButtonSlotPlayerHandRG = CButtonSlotPlayer:extend()
function CButtonSlotPlayerHandRG:new(_argt)
    CButtonSlotPlayerHandRG.super.new(self, _argt)
    self.getslotobject = Tic.FUNCTIONSLOTGETHANDRG
    self.clickrg       = Tic.FUNCTIONSLOTDROPHANDRG
    self:argt(_argt) -- override if any
end


--
-- IButtonSpotting
--
IButtonSpotting = Classic:extend() -- spotting buttons implementation
IButtonSpotting.BEHAVIOUR = function(self) -- need at least one spotting
    self.display = (Tic:spottingActual()) and true or false
    if not self.display then return end -- no spotting
    IButton.BEHAVIOUR(self)
end


--
-- IButtonSlotSpotting
--
IButtonSlotSpotting = Classic:extend() -- spotting buttons implementation
IButtonSlotSpotting.BEHAVIOUR = function(self) -- need at least one spotting with slots
    IButtonSpotting.BEHAVIOUR(self)
    if not self.display then return end -- no spotting
    self.display = (Tic:spottingActual().slots) and true or false
end

CButtonSlotSpotting = CButtonSlot:extend()
function CButtonSlotSpotting:new(_argt)
    CButtonSlotSpotting.super.new(self, _argt)
    self.behaviour           = IButtonSlotSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHead = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHead:new(_argt)
    CButtonSlotSpottingHead.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.head.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingBack = CButtonSlotSpotting:extend()
function CButtonSlotSpottingBack:new(_argt)
    CButtonSlotSpottingBack.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.back.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHandLF = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHandLF:new(_argt)
    CButtonSlotSpottingHandLF.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.handlf.object end
    self:argt(_argt) -- override if any
end

CButtonSlotSpottingHandRG = CButtonSlotSpotting:extend()
function CButtonSlotSpottingHandRG:new(_argt)
    CButtonSlotSpottingHandRG.super.new(self, _argt)
    self.getslotobject = function() return Tic:spottingActual().slots.handrg.object end
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingSpot
--
CButtonSpottingSpot = CButtonCheck:extend() -- generic spottingspot check button
CButtonSpottingSpot.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingSpot()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingSpot:new(_argt)
    CButtonSpottingSpot.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNSPOTIT
	self.behaviour     = CButtonSpottingSpot.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingToggleSpot() end
    self.hovertextlf   = CText{text = Tic.TEXTSPOT}
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingLock
--
CButtonSpottingLock = CButtonCheck:extend() -- generic spottinglock check button
CButtonSpottingLock.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingLock()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingLock:new(_argt)
    CButtonSpottingLock.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNLOCKIT
	self.behaviour     = CButtonSpottingLock.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingToggleLock() end
    self.hovertextlf   = CText{text = Tic.TEXTLOCK}
    self:argt(_argt) -- override if any
end


--
-- CButtonSpottingPick
--
CButtonSpottingPick = CButtonCheck:extend() -- generic spottingpick check button
CButtonSpottingPick.BEHAVIOUR = function(self)
    self.checked = Tic:isSpottingPick()
    IButtonPlayer.BEHAVIOUR(self)
end
function CButtonSpottingPick:new(_argt)
    CButtonSpottingPick.super.new(self, _argt)
    self.drawborder    = false
	self.sprite.sprite = CSpriteBG.SIGNPICKIT
	self.behaviour     = CButtonSpottingPick.BEHAVIOUR  -- function to trigger at first
    self.clicklf       = function() Tic:spottingTogglePick() end
    self.hovertextlf   = CText{text = Tic.TEXTPICK}
    self:argt(_argt) -- override if any
end


--
-- IButtonSpottingMove
--
IButtonSpottingMove = Classic:extend() -- spotting buttons implementation
IButtonSpottingMove.PALETTE = {[Tic.COLORGREYD] = Tic.COLORKEY}
IButtonSpottingMove.BEHAVIOUR = function(self)
    IButton.BEHAVIOUR(self)
    self.display = (Tic:entitySpotting()) and true or false
    if not self.display then return end -- no spotting
    local _playerregionworld = Tic:playerActual():regionWorld()
    local _entityregionworld = Tic:spottingActual():regionWorld()
    local _direction         = _playerregionworld:directionRegion(_entityregionworld)
    self.hovertextlf = CText{text = Tic.TEXTMOVE}
    self.enabled     = false
    self.actived     = false
    if _direction == self.direction then
        self.enabled = true
        self.actived = true
    end
end

CButtonSpotting000 = CButtonArrow000:extend() -- generic spotting 000 button
function CButtonSpotting000:new(_argt)
    CButtonSpotting000.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt) -- override if any
end

CButtonSpotting045 = CButtonArrow045:extend() -- generic spotting 045 button
function CButtonSpotting045:new(_argt)
    CButtonSpotting045.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt) -- override if any
end

CButtonSpotting090 = CButtonArrow090:extend() -- generic spotting 090 button
function CButtonSpotting090:new(_argt)
    CButtonSpotting090.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt) -- override if any
end

CButtonSpotting135 = CButtonArrow135:extend() -- generic spotting 135 button
function CButtonSpotting135:new(_argt)
    CButtonSpotting135.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt) -- override if any
end

CButtonSpotting180 = CButtonArrow180:extend() -- generic spotting 180 button
function CButtonSpotting180:new(_argt)
    CButtonSpotting180.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt) -- override if any
end

CButtonSpotting225 = CButtonArrow225:extend() -- generic spotting 225 button
function CButtonSpotting225:new(_argt)
    CButtonSpotting225.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt) -- override if any
end

CButtonSpotting270 = CButtonArrow270:extend() -- generic spotting 270 button
function CButtonSpotting270:new(_argt)
    CButtonSpotting270.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt) -- override if any
end

CButtonSpotting315 = CButtonArrow315:extend() -- generic spotting 315 button
function CButtonSpotting315:new(_argt)
    CButtonSpotting315.super.new(self, _argt)
    self.sprite.palette = IButtonSpottingMove.PALETTE
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt) -- override if any
end


--
-- IButtonPlayerMove
--
IButtonPlayerMove = Classic:extend() -- player move buttons implementation
IButtonPlayerMove.PALETTE = {[Tic.COLORGREYD] = Tic.COLORKEY}
IButtonPlayerMove.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no move
    self.actived     = Tic:playerActual().direction == self.direction
    self.hovertextlf = CText{text = Tic.TEXTMOVE}
end

CButtonPlayerMove000 = CButtonArrow000:extend() -- generic player move 000 button
function CButtonPlayerMove000:new(_argt)
    CButtonPlayerMove000.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove045 = CButtonArrow045:extend() -- generic player move 045 button
function CButtonPlayerMove045:new(_argt)
    CButtonPlayerMove045.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove090 = CButtonArrow090:extend() -- generic player move 090 button
function CButtonPlayerMove090:new(_argt)
    CButtonPlayerMove090.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove135 = CButtonArrow135:extend() -- generic player move 135 button
function CButtonPlayerMove135:new(_argt)
    CButtonPlayerMove135.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove180 = CButtonArrow180:extend() -- generic player move 180 button
function CButtonPlayerMove180:new(_argt)
    CButtonPlayerMove180.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove225 = CButtonArrow225:extend() -- generic player move 225 button
function CButtonPlayerMove225:new(_argt)
    CButtonPlayerMove225.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove270 = CButtonArrow270:extend() -- generic player move 270 button
function CButtonPlayerMove270:new(_argt)
    CButtonPlayerMove270.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove315 = CButtonArrow315:extend() -- generic player move 315 button
function CButtonPlayerMove315:new(_argt)
    CButtonPlayerMove315.super.new(self, _argt)
    self.sprite.palette = IButtonPlayerMove.PALETTE
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt) -- override if any
end
