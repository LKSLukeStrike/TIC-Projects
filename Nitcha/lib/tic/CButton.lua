require("lib/tic/CElement")
require("lib/tic/CSprite")
--
-- IButton
--
IButton = Classic:extend() -- generic button implementation
IButton.BEHAVIOUR = function(self)
    IElement.BEHAVIOUR(self)
end
IButton.PALETTEKEY          = {[Tic.COLORGREYD] = Tic.COLORKEY}
IButton.PALETTESPOTTINGMODE = {[Tic.COLORGREYL] = Tic.COLORWHITE}

--
-- CButton
--
CButton = CElement:extend() -- generic button
Classic.KINDBUTTON = "Button"
Classic.NAMEBUTTON = "Button"
function CButton:new(_argt)
    CButton.super.new(self, _argt)
    self.kind = Classic.KINDBUTTON
    self.name = Classic.NAMEBUTTON
    --
    self.screenw             = Tic.SPRITESIZE -- sizes
    self.screenh             = Tic.SPRITESIZE
	self.behaviour           = IButton.BEHAVIOUR  -- function to trigger at first
    self.drawground          = true  -- draw beheviors
    self.drawguides          = false
    self.drawinside          = true
    self.drawborder          = true
    self.drawframes          = false
    self.colorground         = Tic.COLORWHITE -- colors
    self.colorborder         = Tic.COLORGREYM
    self.colorgroundhovered  = Tic.COLORHUDSCREEN
    self.colorborderhovered  = self.colorborder
    self.colorgroundactived  = Tic.COLORHOVERMOUSE
    self.colorborderactived  = self.colorborder
    self.colorgroundchecked  = Tic.COLORHOVERMOUSE
    self.colorborderchecked  = self.colorborder
    self.colorgrounddisabled = Tic.COLORGREYL
    self.colorborderdisabled = Tic.COLORGREYM
    self.clickable           = true -- act as a button
    --
    self:argt(_argt)
end

function CButton:activable() -- is the button activable ?
    return self.display and not self.actived
end

function CButton:draw() -- button drawing --TODO hover with wheel ?
    CButton.super.draw(self)
    if self.hovered then
        if self.hovertextul then self:drawHovertextUL() end
        if self.hovertextup then self:drawHovertextUP() end
        if self.hovertextur then self:drawHovertextUR() end
        if self.hovertextlf then self:drawHovertextLF() end
        if self.hovertextrg then self:drawHovertextRG() end
        if self.hovertextdl then self:drawHovertextDL() end
        if self.hovertextdw then self:drawHovertextDW() end
        if self.hovertextdr then self:drawHovertextDR() end
    end
end

function CButton:drawGround()
    self:save()
    self.colorground = (self.hovered)     and self.colorgroundhovered  or self.colorground
    self.colorground = (self.actived)     and self.colorgroundactived  or self.colorground
    self.colorground = (not self.enabled) and self.colorgrounddisabled or self.colorground
    self.colorborder = (not self.enabled) and self.colorborderdisabled or self.colorborder
    CButton.super.drawGround(self)
    self:load()
end

function CButton:drawBorder()
    self:save()
    self.colorborder = (self.enabled) and self.colorborder or self.colorborderdisabled
    CButton.super.drawBorder(self)
    self:load()
end

function CButton:drawHovertext(_hovertext, _hovertextmdk, _direction)
    local _hovertext    = (Tic:hovertextsIsMDKPressed() and _hovertextmdk)
        and _hovertextmdk
        or  _hovertext
    _hovertext:adjustWH()

    local _mousesprite  = (Tic.DRAWHOVERTEXTMOUSESPRITE)
        and (Tic:hovertextsIsMDKPressed() and _hovertextmdk and _hovertextmdk.mousesprite) or _hovertext.mousesprite
        or  nil
    local _mdksprite    = (Tic.DRAWHOVERTEXTMDKSPRITE and _hovertextmdk)
        and CSprite:spriteModifierKey()
        or  nil

    if     Tables:valFind({Tic.DIR315, Tic.DIR270, Tic.DIR225}, _direction) then -- LF
        _hovertext.screenx  =  (_mdksprite)
            and self.screenx - _hovertext.screenw - _mdksprite.screenw
            or  self.screenx - _hovertext.screenw
    elseif Tables:valFind({Tic.DIR045, Tic.DIR090, Tic.DIR135}, _direction) then -- RG
        _hovertext.screenx  =  (_mousesprite)
            and self.screenx + self.screenw + _mousesprite.screenw
            or  self.screenx + self.screenw
    else -- MD
        _hovertext.screenx  = self.screenx - ((_hovertext.screenw - self.screenw) // 2)
    end

    if     Tables:valFind({Tic.DIR315, Tic.DIR000, Tic.DIR045}, _direction) then -- UP
        _hovertext.screeny  = self.screeny - _hovertext.screenh
    elseif Tables:valFind({Tic.DIR225, Tic.DIR180, Tic.DIR135}, _direction) then -- DW
        _hovertext.screeny  = self.screeny + self.screenh
    else -- MD
        _hovertext.screeny  = self.screeny + ((self.screenh - _hovertext.screenh) // 2)
    end

    Tic:hovertextsAppend(_hovertext, _mousesprite, _mdksprite)
end

function CButton:drawHovertextUL()
    self:drawHovertext(self.hovertextul, self.hovertextulmdk, Tic.DIR315)
end

function CButton:drawHovertextUP()
    self:drawHovertext(self.hovertextup, self.hovertextupmdk, Tic.DIR000)
end

function CButton:drawHovertextUR()
    self:drawHovertext(self.hovertextur, self.hovertexturmdk, Tic.DIR045)
end

function CButton:drawHovertextLF()
    self:drawHovertext(self.hovertextlf, self.hovertextlfmdk, Tic.DIR270)
end

function CButton:drawHovertextRG()
    self:drawHovertext(self.hovertextrg, self.hovertextrgmdk, Tic.DIR090)
end

function CButton:drawHovertextDL()
    self:drawHovertext(self.hovertextdl, self.hovertextdlmdk, Tic.DIR225)
end

function CButton:drawHovertextDW()
    self:drawHovertext(self.hovertextdw, self.hovertextdwmdk, Tic.DIR180)
end

function CButton:drawHovertextDR()
    self:drawHovertext(self.hovertextdr, self.hovertextdrmdk, Tic.DIR135)
end


--
-- CButtonText
--
CButtonText = CButton:extend() -- generic text button
Classic.NAMEBUTTONTEXT = "ButtonText"
function CButtonText:new(_argt)
    CButtonText.super.new(self, _argt)
    self.name = Classic.NAMEBUTTONTEXT
	self.text = CText{} -- override with CText if any
    self.rounded = true
    self.colorinside = self.colorborder
    self:argt(_argt)
    self:adjustWH()
end

function CButtonText:adjustWH() -- adjust screenw, screenh
    self.screenw = (self.marginlf * self.scale) + self.text.screenw + (self.marginrg * self.scale)
    self.screenh = (self.marginup * self.scale) + self.text.screenh + (self.margindw * self.scale)
end

function CButtonText:draw() -- button drawing
    self.drawinside = Classic:thatis(self.text, CText)
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
Classic.NAMEBUTTONTEXTM2 = "ButtonTextM2"
function CButtonTextM2:new(_argt)
    CButtonTextM2.super.new(self, _argt)
    self.name = Classic.NAMEBUTTONTEXTM2
    self:argt(_argt)
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
    self:argt(_argt)
end


--
-- CButtonMenuM2
--
CButtonMenuM2 = CButtonTextM2:extend() -- generic menu button with margins 2
function CButtonMenuM2:new(_argt)
    CButtonMenuM2.super.new(self, _argt)
    self.align   = Tic.DIR270
    self:argt(_argt)
end


--
-- CButtonSprite
--
CButtonSprite = CButton:extend() -- generic sprite button
function CButtonSprite:new(_argt)
    CButtonSprite.super.new(self, _argt)
    --
	self.sprite     = CSpriteBG{}
    self.drawborder = false
    self.drawground = false
    --
    self:argt(_argt)
end

function CButtonSprite:drawInside()
    local _palette = {
                        [self.colorground] = self.colorground,
                        [self.colorborder] = self.colorborder,
                    }

    _palette = (self.checked)
        and {
                [self.colorground] = self.colorgroundchecked,
                [self.colorborder] = self.colorborderchecked,
            }
        or  _palette
    _palette = (self.hovered)
        and {
                [self.colorground] = self.colorgroundhovered,
                [self.colorborder] = self.colorborderhovered,
            }
        or  _palette
    _palette = (self.actived)
        and {
                [self.colorground] = self.colorgroundactived,
                [self.colorborder] = self.colorborderactived,
            }
        or  _palette
    _palette = (not self.enabled)
        and {
                [self.colorground] = self.colorgrounddisabled,
                [self.colorborder] = self.colorborderdisabled,
            }
        or  _palette

    self.sprite.screenx = self.screenx
    self.sprite.screeny = self.screeny
    self.sprite.palette = Tables:merge(self.sprite.palette, _palette)
    self.sprite:draw()
end


--
-- CButtonEntityHover
--
CButtonEntityHover = CButtonSprite:extend() -- generic entity hover button
function CButtonEntityHover:new(_argt)
    CButtonEntityHover.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNBORDSQ
    self.entity        = nil
    self.colorborder   = Tic.COLORGREYM
    self.hovered = true
    self:argt(_argt)
end

function CButtonEntityHover:drawInside()
    if not self.entity then return end -- mandatory
    self.screenx        = self.entity.screenx
    self.screeny        = self.entity.screeny
    self.sprite.screenx = self.entity.screenx
    self.sprite.screeny = self.entity.screeny
    self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORGREYM] = self.colorborder})
    self.sprite:draw()
end


--
-- CButtonEntityHoverLock
--
CButtonEntityHoverLock = CButtonEntityHover:extend() -- generic entity hover lock button
CButtonEntityHoverLock.BEHAVIOUR = function(self)
    local _playeractual = Tic:playerActual()
    if _playeractual.spottinglock and _playeractual.spotting == self.entity then -- already locking ?
        self.hovertextup.text = Tic.TEXTUNLOCK
        self.clicklf          = function()
                                    _playeractual:spotEntity(nil)
                                    _playeractual.spottinglock = false
                                    Tic:mouseDelay()
                                end
    else
        self.hovertextup.text = Tic.TEXTLOCK
        self.clicklf          = function()
                                    _playeractual:spotEntity(self.entity)
                                    _playeractual.spottinglock = true
                                    Tic:mouseDelay()
                                end
    end
    self.hovertextrg.text = self.entity:stringNameKind()
end
function CButtonEntityHoverLock:new(_argt)
    CButtonEntityHoverLock.super.new(self, _argt)
    self.behaviour   = CButtonEntityHoverLock.BEHAVIOUR
    self.hovertextup = CHoverTextClickLF{}
    self.hovertextrg = CHoverTextInfos{}
    self:argt(_argt)
end


--
-- CButtonEntityHoverLockPick
--
CButtonEntityHoverLockPick = CButtonEntityHoverLock:extend() -- generic entity hover lock pick button
function CButtonEntityHoverLockPick:new(_argt)
    CButtonEntityHoverLockPick.super.new(self, _argt)
    self.hovertextdw = CHoverTextClickRG{text = Tic.TEXTPICK}
    self.clickrg     = function()
                        Tic:playerActual().hovered = false
                        Tic:playerPick(self.entity)
                        Tic:playerActual().hovered = false
                        Tic:mouseDelay()
                       end
    self:argt(_argt)
end


--
-- CButtonClick
--
CButtonClick = CButtonSprite:extend() -- generic click button


--
-- CButtonArrow
--
CButtonArrow = CButtonClick:extend() -- generic arrow click button


--
-- CButtonArrowLine
--
CButtonArrowLine = CButtonArrow:extend() -- generic line arrow click button
function CButtonArrowLine:new(_argt)
    CButtonArrowLine.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWL
    self:argt(_argt)
end


--
-- CButtonArrowDiag
--
CButtonArrowDiag = CButtonArrow:extend() -- generic diag arrow click button
function CButtonArrowDiag:new(_argt)
    CButtonArrowDiag.super.new(self, _argt)
	self.sprite.sprite = CSpriteBG.SIGNARROWD
    self:argt(_argt)
end


--
-- CButtonArrow000
--
CButtonArrow000 = CButtonArrowLine:extend() -- generic arrow 000 click button
function CButtonArrow000:new(_argt)
    CButtonArrow000.super.new(self, _argt)
    self.direction     = Tic.DIR000
	self.sprite.rotate = Tic.ROTATE000
    self:argt(_argt)
end


--
-- CButtonArrow045
--
CButtonArrow045 = CButtonArrowDiag:extend() -- generic arrow 045 click button
function CButtonArrow045:new(_argt)
    CButtonArrow045.super.new(self, _argt)
    self.direction     = Tic.DIR045
	self.sprite.rotate = Tic.ROTATE090
    self:argt(_argt)
end


--
-- CButtonArrow090
--
CButtonArrow090 = CButtonArrowLine:extend() -- generic arrow 090 click button
function CButtonArrow090:new(_argt)
    CButtonArrow090.super.new(self, _argt)
    self.direction     = Tic.DIR090
	self.sprite.rotate = Tic.ROTATE090
    self:argt(_argt)
end


--
-- CButtonArrow135
--
CButtonArrow135 = CButtonArrowDiag:extend() -- generic arrow 135 click button
function CButtonArrow135:new(_argt)
    CButtonArrow135.super.new(self, _argt)
    self.direction     = Tic.DIR135
	self.sprite.rotate = Tic.ROTATE180
    self:argt(_argt)
end


--
-- CButtonArrow180
--
CButtonArrow180 = CButtonArrowLine:extend() -- generic arrow 180 click button
function CButtonArrow180:new(_argt)
    CButtonArrow180.super.new(self, _argt)
    self.direction     = Tic.DIR180
	self.sprite.rotate = Tic.ROTATE180
    self:argt(_argt)
end


--
-- CButtonArrow225
--
CButtonArrow225 = CButtonArrowDiag:extend() -- generic arrow 225 click button
function CButtonArrow225:new(_argt)
    CButtonArrow225.super.new(self, _argt)
    self.direction     = Tic.DIR225
	self.sprite.rotate = Tic.ROTATE270
    self:argt(_argt)
end


--
-- CButtonArrow270
--
CButtonArrow270 = CButtonArrowLine:extend() -- generic arrow 270 click button
function CButtonArrow270:new(_argt)
    CButtonArrow270.super.new(self, _argt)
    self.direction     = Tic.DIR270
	self.sprite.rotate = Tic.ROTATE270
    self:argt(_argt)
end


--
-- CButtonArrow315
--
CButtonArrow315 = CButtonArrowDiag:extend() -- generic arrow 315 click button
function CButtonArrow315:new(_argt)
    CButtonArrow315.super.new(self, _argt)
    self.direction     = Tic.DIR315
	self.sprite.rotate = Tic.ROTATE000
    self:argt(_argt)
end


--
-- CButtonCenter
--
CButtonCenter = CButtonArrow:extend() -- generic center click button
function CButtonCenter:new(_argt)
    CButtonCenter.super.new(self, _argt)
    self.direction     = nil
	self.sprite.sprite = CSpriteBG.SIGNCENTER
    self:argt(_argt)
end


--
-- CButtonCheck
--
CButtonCheck = CButtonSprite:extend() -- generic check button
function CButtonCheck:new(_argt)
    CButtonCheck.super.new(self, _argt)
	self.checked = false
    self:argt(_argt)
end


--
-- CButtonPlayerPosture
--
CButtonPlayerPosture = CButtonCheck:extend() -- generic player posture button
function CButtonPlayerPosture:new(_argt)
    CButtonPlayerPosture.super.new(self, _argt)
    self.drawborder     = false
    self.colorground    = Tic.COLORBLUEM
    self:argt(_argt)
end


--
-- CButtonPlayerStand
--
CButtonPlayerStand = CButtonPlayerPosture:extend() -- generic player stand button
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
	self.behaviour      = CButtonPlayerStand.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTSTAND}
    self.clicklf        = function() Tic:toggleKneel() end
    --
    self:argt(_argt)
end


--
-- CButtonPlayerKneel
--
CButtonPlayerKneel = CButtonPlayerPosture:extend() -- generic player kneel button
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
	self.behaviour      = CButtonPlayerKneel.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTKNEEL}
    self.clicklf        = function() Tic:toggleKneel() end
    --
    self:argt(_argt)
end


--
-- CButtonPlayerWork
--
CButtonPlayerWork = CButtonPlayerPosture:extend() -- generic player work button
CButtonPlayerWork.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSWORK
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerWork:new(_argt)
    CButtonPlayerWork.super.new(self, _argt)
    self.sprite.sprite  = CSpriteBG.SIGNDOWORK
	self.behaviour      = CButtonPlayerWork.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTWORK}
    self.clicklf        = function() Tic:toggleWork() end
    --
    self:argt(_argt)
end


--
-- CButtonPlayerSleep
--
CButtonPlayerSleep = CButtonPlayerPosture:extend() -- generic player sleep button
CButtonPlayerSleep.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.checked = Tic:playerActual():statusGet() == Tic.STATUSSLEEP
    self.sprite.flip = Tic:playerActual().dirx
end
function CButtonPlayerSleep:new(_argt)
    CButtonPlayerSleep.super.new(self, _argt)
    self.sprite.sprite  = CSpriteBG.SIGNDOSLEE
	self.behaviour      = CButtonPlayerSleep.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTSLEEP}
    self.clicklf        = function() Tic:toggleSleep() end
    --
    self:argt(_argt)
end


--
-- CButtonPlayerStat
--
CButtonPlayerStat = CButtonSprite:extend() -- generic stat button
function CButtonPlayerStat:new(_argt)
    CButtonPlayerStat.super.new(self, _argt)
    self.sprite.palette = {[Tic.COLORGREYM] = Tic.COLORWHITE, [Tic.COLORGREYD] = Tic.COLORKEY}
    self.behaviour      = IButtonPlayer.BEHAVIOUR
    self.getcolorstat   = nil -- getcolorstat function if any
    self:argt(_argt)
end

function CButtonPlayerStat:drawInside()
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
    self.behaviour     = function(self)
                            IButtonPlayer.BEHAVIOUR(self)
                            if not self.display then return end
                            local _playeractual = Tic:playerActual()
                            self.hovertextur = CHoverTextInfos{
                                text = Tic.TEXTPHY..":"
                                .._playeractual:statphyactGet().."/".._playeractual:statphymaxGet()
                            }
                            self.hovertextrg = CHoverTextInfos{
                                text = Tic.TEXTINV..":"
                                ..Tables:size(_playeractual.inventories.phy.objects).."/".._playeractual:statphymaxGet()
                            }
                            local _bagscount = 0
                            local _bagsused  = 0
                            local _bagstotal = 0
                            for _, _object in ipairs(_playeractual.inventories.phy.objects) do
                                if _object:isBag() then
                                    _bagscount = _bagscount + 1
                                    _bagstotal = _bagstotal + _object.inventory.objectsmax
                                    _bagsused  = _bagsused  + Tables:size(_object.inventory.objects)
                                end
                            end
                            if _bagscount > 0 then
                                self.hovertextdr = CHoverTextInfos{
                                    text = Tic.TEXTBAG..":"
                                    .."(".._bagscount..") ".._bagsused.."/".._bagstotal
                                }
                            else
                                self.hovertextdr = nil
                            end
                         end
    self:argt(_argt)
end

CButtonPlayerStatMen = CButtonPlayerStat:extend()
function CButtonPlayerStatMen:new(_argt)
    CButtonPlayerStatMen.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTMEN
    self.getcolorstat  = function() return Tic:playerActual():colorMenAct() end
    self.behaviour     = function(self)
                            IButtonPlayer.BEHAVIOUR(self)
                            if not self.display then return end
                            local _playeractual = Tic:playerActual()
                            self.hovertextur = CHoverTextInfos{
                                text = Tic.TEXTMEN..":"
                                .._playeractual:statmenactGet().."/".._playeractual:statmenmaxGet()
                            }
                            self.hovertextrg = CHoverTextInfos{
                                text = Tic.TEXTINV..":"
                                ..Tables:size(_playeractual.inventories.men.objects).."/".._playeractual:statmenmaxGet()
                            }
                            local _bagscount = 0
                            local _bagsused  = 0
                            local _bagstotal = 0
                            for _, _object in ipairs(_playeractual.inventories.men.objects) do
                                if _object:isBag() then
                                    _bagscount = _bagscount + 1
                                    _bagstotal = _bagstotal + _object.inventory.objectsmax
                                    _bagsused  = _bagsused  + Tables:size(_object.inventory.objects)
                                end
                            end
                            if _bagscount > 0 then
                                self.hovertextdr = CHoverTextInfos{
                                    text = Tic.TEXTBAG..":"
                                    .."(".._bagscount..") ".._bagsused.."/".._bagstotal
                                }
                            else
                                self.hovertextdr = nil
                            end
                         end
    self:argt(_argt)
end

CButtonPlayerStatPsy = CButtonPlayerStat:extend()
function CButtonPlayerStatPsy:new(_argt)
    CButtonPlayerStatPsy.super.new(self, _argt)
    self.sprite.sprite = CSpriteBG.SIGNACTPSY
    self.getcolorstat  = function() return Tic:playerActual():colorPsyAct() end
    self.behaviour     = function(self)
                            IButtonPlayer.BEHAVIOUR(self)
                            if not self.display then return end
                            local _playeractual = Tic:playerActual()
                            self.hovertextur = CHoverTextInfos{
                                text = Tic.TEXTPSY..":"
                                .._playeractual:statpsyactGet().."/".._playeractual:statpsymaxGet()
                            }
                            self.hovertextrg = CHoverTextInfos{
                                text = Tic.TEXTINV..":"
                                ..Tables:size(_playeractual.inventories.psy.objects).."/".._playeractual:statpsymaxGet()
                            }
                            local _bagscount = 0
                            local _bagsused  = 0
                            local _bagstotal = 0
                            for _, _object in ipairs(_playeractual.inventories.psy.objects) do
                                if _object:isBag() then
                                    _bagscount = _bagscount + 1
                                    _bagstotal = _bagstotal + _object.inventory.objectsmax
                                    _bagsused  = _bagsused  + Tables:size(_object.inventory.objects)
                                end
                            end
                            if _bagscount > 0 then
                                self.hovertextdr = CHoverTextInfos{
                                    text = Tic.TEXTBAG..":"
                                    .."(".._bagscount..") ".._bagsused.."/".._bagstotal
                                }
                            else
                                self.hovertextdr = nil
                            end
                         end
    self:argt(_argt)
end


--
-- IButtonInteractions
--
IButtonInteractions = Classic:extend() -- interact button implementation
IButtonInteractions.BEHAVIOUR = function(self) -- need at least one player
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no player
    self.display = self.entity:canInteract()
    if not self.display then return end -- no interaction
    self.enabled = true -- restore enabled
    local _interactto   = self.entity.interactto
    self.sprite.sprite  = _interactto.interactsprite
    self.sprite.flip    = (_interactto:is(CCharacter)) -- FIXME why ?
        and Nums:toggle01(_interactto.dirx)
        or  _interactto.dirx
end

CButtonInteractions = CButtonSprite:extend()
function CButtonInteractions:new(_argt)
    CButtonInteractions.super.new(self, _argt)
    self.sprite.palette = CEntityDrawable.PALETTEINTERACTBY
    self.behaviour      = IButtonInteractions.BEHAVIOUR
    self.drawground     = false
    self:argt(_argt)
end


--
-- CButtonPortrait
--
CButtonPortrait = CButtonSprite:extend() -- generic portrait button
CButtonPortrait.PALETTEENABLED   = {}
CButtonPortrait.PALETTEDISABLED  = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORGREYD}
CButtonPortrait.BEHAVIOUR = function(self) -- enable if has an object
    IButton.BEHAVIOUR(self)
    self.enabled = (self:objectGet())
end
function CButtonPortrait:new(_argt)
    CButtonPortrait.super.new(self, _argt)
    self.behaviour           = CButtonPortrait.BEHAVIOUR
    self.getslotobject       = nil -- getslotobject function if any
    self.drawborder          = true
    self.drawground          = true
    self.colorground         = Tic.COLORBIOMENIGHT
    self.colorborder         = self.colorframe1
    self.colorborderdisabled = self.colorframe2
    self.rounded             = true
    self:argt(_argt)
end

function CButtonPortrait:drawBorder()
    self:save()
    self.screenx = self.screenx - 1
    self.screeny = self.screeny - 1
    self.screenw = self.screenw + 2
    self.screenh = self.screenh + 2
    CButtonPortrait.super.drawBorder(self)
    self:load()

    local _object = nil
    if self.getslotobject then _object = self:getslotobject() end
    if _object and _object.colortype then
        rect(self.screenx - 1, self.screeny - 1, 2, 2, _object.colortype)
    end
end

function CButtonPortrait:drawGround()
    local _colorground = self.colorground -- FIXME use self colors
    _colorground = (self.hovered and self.enabled) and Tic.COLORGREYL or _colorground
    _colorground = (self.actived and self.enabled) and Tic.COLORGREYM or _colorground
    rect(self.screenx, self.screeny, self.screenw, self.screenh, _colorground)
end

function CButtonPortrait:drawInside()
    local _object     = self:objectGet()
    local _sprite     = self.sprite
    local _entitydirx = self.entity.dirx

    if _object then -- not empty slot
        _object.screenx = self.screenx
        _object.screeny = self.screeny
        _object.dirx    = _entitydirx
        _object:drawPortrait()
    elseif _sprite then -- empty slot with default ground sprite
        _sprite.screenx = self.screenx
        _sprite.screeny = self.screeny
        _sprite.flip    = _entitydirx
        _sprite.palette = (self.enabled)
            and Tables:merge(_sprite.palette, CButtonPortrait.PALETTEENABLED)
            or  Tables:merge(_sprite.palette, CButtonPortrait.PALETTEDISABLED)
        _sprite:draw()
    end
end

function CButtonPortrait:objectGet() -- object in slot if any
    return (self.getslotobject and self:getslotobject())
end


--
-- IButtonPlayer
--
IButtonPlayer = Classic:extend() -- players buttons implementation
IButtonPlayer.BEHAVIOUR = function(self) -- need at least one player
    IButton.BEHAVIOUR(self) -- enabled if at least one function
    self.entity  = Tic:playerActual()
    self.display = (self.entity)
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
CButtonPlayerPrev.BEHAVIOUR = function(self)
    IButtonPlayerChange.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.clicklf        = Tic.FUNCTIONPLAYERPREV
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTPREV}
        self.clicklfmdk     = Tic.FUNCTIONPLAYERMIN
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTFIRST}
        self.hovertextrg    = (Tic:hovertextsIsMDKPressed())
            and CHoverTextInfos{text = Tic:playerGetFirst():stringNameKind()}
            or  CHoverTextInfos{text = Tic:playerGetPrev():stringNameKind()}
    else
        self.clicklf        = nil
        self.hovertextup    = nil
        self.clicklfmdk     = nil
        self.hovertextupmdk = nil
        self.hovertextrg    = nil
    end
end
function CButtonPlayerPrev:new(_argt)
    CButtonPlayerPrev.super.new(self, _argt)
	self.behaviour      = CButtonPlayerPrev.BEHAVIOUR  -- function to trigger at first
    self:argt(_argt)
end


--
-- CButtonPlayerNext
--
CButtonPlayerNext = CButtonArrow090:extend() -- generic player next button
CButtonPlayerNext.BEHAVIOUR = function(self)
    IButtonPlayerChange.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.clicklf        = Tic.FUNCTIONPLAYERNEXT
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTNEXT}
        self.clicklfmdk     = Tic.FUNCTIONPLAYERMAX
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTLAST}
        self.hovertextrg    = (Tic:hovertextsIsMDKPressed())
            and CHoverTextInfos{text = Tic:playerGetLast():stringNameKind()}
            or  CHoverTextInfos{text = Tic:playerGetNext():stringNameKind()}
    else
        self.clicklf        = nil
        self.hovertextup    = nil
        self.clicklfmdk     = nil
        self.hovertextupmdk = nil
        self.hovertextrg    = nil
    end
end
function CButtonPlayerNext:new(_argt)
    CButtonPlayerNext.super.new(self, _argt)
	self.behaviour      = CButtonPlayerNext.BEHAVIOUR  -- function to trigger at first
    self:argt(_argt)
end


--
-- CButtonPlayerPick
--
CButtonPlayerPick = CButtonPortrait:extend() -- generic player pick button
CButtonPlayerPick.BEHAVIOUR = function(self) -- need at least more than one player
    IButtonPlayerChange.BEHAVIOUR(self)
    if not self.display then return end -- no player
    if self.enabled then -- more than one player
        self.hovertextdw = CHoverTextClickRG{text = Tic.TEXTPICK}
        self.clickrg     = function() self:menuPick() end
    else
        self.hovertextdw = nil
        self.clickrg     = nil
    end
    if self:getslotobject():isParty() then -- even if only one player but who is a party
        self.enabled     = true -- restore enabled in case of party
        self.hovertextup = CHoverTextClickLF{text = Tic.TEXTPARTY}
        self.clicklf     = function() self:menuParty() end
    else
        self.hovertextup = nil
        self.clicklf     = nil
    end
    if self.enabled then
        self.hovertextrg = CHoverTextInfos{text = self:getslotobject():stringNameKind()}
    else
        self.hovertextrg = nil
    end
end
function CButtonPlayerPick:new(_argt)
    CButtonPlayerPick.super.new(self, _argt)
    self.classic        = CButtonPlayerPick
	self.behaviour      = CButtonPlayerPick.BEHAVIOUR  -- function to trigger at first
    self.getslotobject  = function() return Tic:playerActual() end
    self:argt(_argt)
end

function CButtonPlayerPick:drawInside()
    self:getslotobject():drawPortrait({
            screenx    = self.screenx,
            screeny    = self.screeny,
            scale      = Tic.SCALE01,
        }
    )
end

function CButtonPlayerPick:menuPick()
    local _menuscreen    = CScreen{}
    local _screenx       = self.screenx + 9
    local _screeny       = self.screeny
    local _playeractual  = Tic:playerActual()
    local _players       = Tic:playerPlayers()


    local _windowmenu = CWindowMenu{
        screenx = _screenx,
        screeny = _screeny,
        separatory = 1,
        stretch = true,
    }
    _menuscreen:appendElements{_windowmenu}

    local function _appendbutton(_slotobject)
        _windowmenu:appendElements{
            CButtonPlayerPickMenu{
                screen = _menuscreen,
                getslotobject = function() return _slotobject end, -- returns slot object
            }
        }
    end

    _appendbutton(_playeractual)

    for _, _player in ipairs(_players) do
        if not (_player == _playeractual) then
            _appendbutton(_player)
        end
    end

    Tic:screenAppend(_menuscreen)
end

function CButtonPlayerPick:menuParty()
    local _menuscreen    = CScreen{}
    local _screenx       = self.screenx - 9
    local _screeny       = self.screeny
    local _playeractual  = Tic:playerActual()
    local _party         = _playeractual.party
    local _leader        = _party.leader
    local _members       = _party.members

    local _windowmenu = CWindowMenu{
        screenx = _screenx,
        screeny = _screeny,
        separatory = 1,
        stretch = true,
    }
    _menuscreen:appendElements{_windowmenu}

    local function _appendbutton(_slotobject)
        _windowmenu:appendElements{
            CButtonPlayerPartyMenu{
                screen = _menuscreen,
                getslotobject = function() return _slotobject end, -- returns slot object
            }
        }
    end

    _appendbutton(_leader)

    for _, _member in ipairs(_members) do
        if not (_member == _leader) then
            _party:applyLeaderToMember(_member)
            _appendbutton(_member)
        end
    end

    Tic:screenAppend(_menuscreen)
end


--
-- CButtonPlayerPickMenu
--
CButtonPlayerPickMenu = CButtonPlayerPick:extend() -- generic player pick button
function CButtonPlayerPickMenu:new(_argt)
    CButtonPlayerPickMenu.super.new(self, _argt)
    self.classic        = CButtonPlayerPickMenu
	self.behaviour      = CButtonPortrait.BEHAVIOUR
    self.menuscreen     = nil -- parent menu screen
    self.hovertextup    = nil
    self.clicklf        = nil
    self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
    self.clickrg        = function()
                            Tic:playerPick(self:getslotobject())
                            Tic:screenRemove(self.menuscreen)
                            Tic:mouseDelay()
                          end
    self.hovertextrg    = CHoverTextInfos{text = self:getslotobject():stringNameKind()}
    self:argt(_argt)
end


--
-- CButtonPlayerPartyMenu
--
CButtonPlayerPartyMenu = CButtonPlayerPick:extend() -- generic player pick button
function CButtonPlayerPartyMenu:new(_argt)
    CButtonPlayerPartyMenu.super.new(self, _argt)
    self.classic        = CButtonPlayerPartyMenu
	self.behaviour      = CButtonPortrait.BEHAVIOUR
    self.menuscreen     = nil -- parent menu screen
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTLEAD}
    self.clicklf        = function()
                            self:getslotobject():leadParty(nil, true)
                            Tic:screenRemove(self.menuscreen)
                            Tic:mouseDelay()
                          end
    self.hovertextrg    = CHoverTextInfos{text = self:getslotobject():stringNameKind()}
    self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTQUIT}
    self.clickrg        = function()
                            self:getslotobject():quitParty(true)
                            Tic:screenRemove(self.menuscreen)
                            Tic:mouseDelay()
                          end
    self:argt(_argt)
end


--
-- CButtonEntitySlot
--
CButtonEntitySlot = CButtonPortrait:extend() -- entity buttons slots
CButtonEntitySlot.SPRITEHEAD = CSpriteBG{
    sprite  = CSpriteBG.SIGNSLHEAD,
}
CButtonEntitySlot.SPRITEBACK = CSpriteBG{
    sprite  = CSpriteBG.SIGNSLBACK,
}
CButtonEntitySlot.SPRITEHAND = CSpriteBG{
    sprite  = CSpriteBG.SIGNSLHAND,
    rotate  = Tic.ROTATE270,
}
CButtonEntitySlot.SPRITEPHY = CSpriteBG{
    sprite  = CSpriteBG.SIGNACTPHY,
    palette = {[Tic.COLORGREYM] = Tic.COLORWHITE, [Tic.COLORGREYD] = Tic.COLORKEY}
}
CButtonEntitySlot.SPRITEMEN = CSpriteBG{
    sprite  = CSpriteBG.SIGNACTMEN,
    palette = {[Tic.COLORGREYM] = Tic.COLORWHITE, [Tic.COLORGREYD] = Tic.COLORKEY}
}
CButtonEntitySlot.SPRITEPSY = CSpriteBG{
    sprite  = CSpriteBG.SIGNACTPSY,
    palette = {[Tic.COLORGREYM] = Tic.COLORWHITE, [Tic.COLORGREYD] = Tic.COLORKEY}
}
CButtonEntitySlot.BEHAVIOUR = function(self) -- need at least one player with slots
    self.display = (self.entity)
    if not self.display then return end -- no entity
    self.display = (self.entity.slots)
end

function CButtonEntitySlot:objectsInInventories(_inventories)
    local _result = {}
    for _, _inventory in pairs(_inventories or {}) do
        if CInventory:isInventory(_inventory) then
            local _objectsofslottype = _inventory:objectsOfSlotType(self.slottype)
            _result = Tables:imerge(_result, _objectsofslottype, true)
        end
    end
    return _result
end

function CButtonEntitySlot:canPick()
    local _slotobject = self:objectGet()
    if _slotobject then return true end -- has an object in slot -- can be replaced by an empty one
    local _objectsininventories = self:objectsInInventories(self.entity.inventories)
    if Tables:size(_objectsininventories) > 0 then return true end --has other objects of same slottype
    return false
end

function CButtonEntitySlot:canDrop()
    local _slotobject = self:objectGet()
    return (_slotobject) -- has an object in slot -- can drop it
end

function CButtonEntitySlot:canUse()
    local _slotobject = self:objectGet()
    return (_slotobject and _slotobject:canUse()) -- has an object in slot that can be used
end

function CButtonEntitySlot:canPack()
    local _slotobject = self:objectGet()
    return (_slotobject and not(_slotobject:isBag())) -- nothing to pack
end


--
-- CButtonPlayerSlot
--
CButtonPlayerSlot = CButtonEntitySlot:extend()
CButtonPlayerSlot.BEHAVIOUR = function(self) -- need at least one player with slots
    self.entity = Tic:playerActual()
    CButtonEntitySlot.BEHAVIOUR(self)
    if not self.display then return end -- no slots
    self.enabled = false
    self:upDrop()
    self:upmdkUse()
    if self:canPick() then
        self.enabled = true
        self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
        self.clickrg        = function() self:menuPick() end
    else
        self.hovertextdw    = nil
        self.clickrg        = nil
    end
    if self:canPack() then
        self.enabled = true
        self.hovertextdwmdk = CHoverTextClickRG{text = Tic.TEXTPACK}
        self.clickrgmdk     = function() self:menuPack() end
    else
        self.hovertextdwmdk = nil
        self.clicklfmdk     = nil
    end
    if self.enabled and self:getslotobject() then
        local _object = self:getslotobject()
        local _hovertextrg = (_object:isBag())
            and _object:stringNameKind().." "..Tables:size(_object.inventory.objects).."/".._object.inventory.objectsmax
            or  _object:stringNameKind()
        self.hovertextrg = CHoverTextInfos{text = _hovertextrg}
    else
        self.hovertextrg = nil
    end
end
function CButtonPlayerSlot:new(_argt)
    CButtonPlayerSlot.super.new(self, _argt)
    self.behaviour   = CButtonPlayerSlot.BEHAVIOUR
    self:argt(_argt)
end

--FUNC
function CButtonPlayerSlot:closeMenu()
    if self.menuscreen then
        Tic:screenRemove(self.menuscreen)
        Tic:mouseDelay()
    end
end

function CButtonPlayerSlot:upNil()
    self.hovertextup    = nil
    self.clicklf        = nil
end

function CButtonPlayerSlot:upmdkNil()
    self.hovertextupmdk = nil
    self.clicklfmdk     = nil
end

function CButtonPlayerSlot:dwNil()
    self.hovertextdw    = nil
    self.clicklf        = nil
end

function CButtonPlayerSlot:dwmdkNil()
    self.hovertextdwmdk = nil
    self.clicklfmdk     = nil
end

function CButtonPlayerSlot:rgNil()
    self.hovertextrg    = nil
end

function CButtonPlayerSlot:upDone()
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
    self.clicklf        = function()
        self:closeMenu()
    end
end

function CButtonPlayerSlot:upDrop()
    if self:canDrop() then
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDROP}
        self.clicklf        = function()
            self.entity:dropObject(self:getslotobject())
            self:closeMenu()
        end
    else
        self:upNil()
    end
end

function CButtonPlayerSlot:upmdkUse()
    if self:canUse() then
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTUSE}
        self.clicklfmdk     = function()
            self:getslotobject():use()
            self:closeMenu()
        end
    else
        self:upmdkNil()
    end
end

function CButtonPlayerSlot:dwPick()
    self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
    self.clickrg        = function()
        self.setslotobject(self:getslotobject())
        self:closeMenu()
    end
end

function CButtonPlayerSlot:menuPick()
    local _menuscreen    = CScreen{} -- new menus screen
    local _screenx       = self.screenx
    local _screeny       = self.screeny
    local _entity        = self.entity
    local _sprite        = self.sprite
    local _slottype      = self.slottype
    local _getslotobject = self.getslotobject
    local _setslotobject = self.setslotobject
    local _oldslotobject = _getslotobject()

    local function _appendwindowmenu() -- append vertical menu to menus screen
        _screenx = _screenx + 9
        local _windowmenu = CWindowMenu{
            screenx = _screenx,
            screeny = _screeny,
            separatory = 1,
            stretch = true,
        }
        _menuscreen:appendElements{_windowmenu}
        return _windowmenu
    end

    local function _appendbutton(_argt) -- append button to vertical menu
        _argt.windowmenu:appendElements{
            CButtonPlayerSlotMenuPick{
                menuscreen    = _menuscreen,
                entity        = _entity,
                sprite        = _sprite,
                oldslotobject = _oldslotobject,
                setslotobject = _setslotobject,
                isheader      = _argt.isheader,
                getslotobject = function() return _argt.slotobject end, -- returns slot object
                stat          = _argt.stat,
            }
        }
    end

    local _windowmenu = _appendwindowmenu() -- empty object
    _appendbutton{windowmenu = _windowmenu, isheader = true, slotobject = nil, stat = nil}

    local _objects = _entity:objectsPhyOfSlotType(_slottype) -- phy objects
    if Tables:notempty(_objects) then
        local _windowmenu = _appendwindowmenu()
        _appendbutton{windowmenu = _windowmenu, isheader = true, slotobject = nil, stat = Tic.TEXTPHY}
        for _, _object in ipairs(_objects) do
            _appendbutton{windowmenu = _windowmenu, isheader = false, slotobject = _object, stat = nil}
        end
    end

    local _objects = _entity:objectsMenOfSlotType(_slottype) -- men objects
    if Tables:notempty(_objects) then
        local _windowmenu = _appendwindowmenu()
        _appendbutton{windowmenu = _windowmenu, isheader = true, slotobject = nil, stat = Tic.TEXTMEN}
        for _, _object in ipairs(_objects) do
            _appendbutton{windowmenu = _windowmenu, isheader = false, slotobject = _object, stat = nil}
        end
    end

    local _objects = _entity:objectsPsyOfSlotType(_slottype) -- psy objects
    if Tables:notempty(_objects) then
        local _windowmenu = _appendwindowmenu()
        _appendbutton{windowmenu = _windowmenu, isheader = true, slotobject = nil, stat = Tic.TEXTPSY}
        for _, _object in ipairs(_objects) do
            _appendbutton{windowmenu = _windowmenu, isheader = false, slotobject = _object, stat = nil}
        end
    end

    local _bags = {} -- bags and bags objects
    for _, _bag in ipairs(_entity:bags()) do
        local _bagobjects = _bag.inventory:objectsOfSlotType(_slottype)
        if Tables:notempty(_bagobjects) then
            Tables:keyAppend(_bags, _bag, _bagobjects)
        end
    end

    for _bag, _bagobjects in pairs(_bags) do
        local _windowmenu = _appendwindowmenu()
        _appendbutton{windowmenu = _windowmenu, isheader = true, slotobject = _bag, stat = nil}
        for _, _bagobject in ipairs(_bagobjects) do
            _appendbutton{windowmenu = _windowmenu, isheader = false, slotobject = _bagobject, stat = nil}
        end
    end

    Tic:screenAppend(_menuscreen)
end

function CButtonPlayerSlot:menuPack()
    local _menuscreen    = CScreen{}
    local _screenx       = self.screenx
    local _screeny       = self.screeny
    local _entity        = self.entity
    local _sprite        = self.sprite
    local _slottype      = self.slottype
    local _getslotobject = self.getslotobject
    local _setslotobject = self.setslotobject
    local _oldslotobject = _getslotobject()
    local _inventorytype = _oldslotobject.inventorytype

    local _entityinventory = nil
    if     _inventorytype == CInventoryPhy then
        _entityinventory = _entity.inventories.phy
    elseif _inventorytype == CInventoryMen then
        _entityinventory = _entity.inventories.men
    elseif _inventorytype == CInventoryPsy then
        _entityinventory = _entity.inventories.psy
    else
        return
    end

    local function _appendwindowmenu() --_screenx, _screeny
        _screenx = _screenx + 9
        local _windowmenu = CWindowMenu{
            screenx = _screenx,
            screeny = _screeny,
            separatory = 1,
            stretch = true,
        }
        _menuscreen:appendElements{_windowmenu}
        return _windowmenu
    end

    local function _appendbutton(_windowmenu, _slotobject, _isheader, _stat)
        _windowmenu:appendElements{
            CButtonPlayerSlotMenuPack{
                menuscreen    = _menuscreen,
                entity        = _entity,
                sprite        = _sprite,
                oldslotobject = _oldslotobject,
                isheader      = _isheader,
                stat          = _stat,
                getslotobject = function() return _slotobject end, -- returns slot object
                setslotobject = _setslotobject,
            }
        }
    end

    local _bags = {}
    local _objects = _entityinventory.objects -- stat objects
    local _windowmenu = _appendwindowmenu()
    _appendbutton(_windowmenu, nil, true, _entityinventory.stat)
    for _, _object in ipairs(_objects) do
        _appendbutton(_windowmenu, _object)
        if _object:isBag() then
            local _bagobjects = _object.inventory.objects
            Tables:keyAppend(_bags, _object, _bagobjects)
        end
    end

    for _bag, _bagobjects in pairs(_bags) do
        -- _screenx = _screenx + 9
        local _windowmenu = _appendwindowmenu()
        _appendbutton(_windowmenu, _bag, true)
        for _, _bagobject in ipairs(_bagobjects) do
            _appendbutton(_windowmenu, _bagobject)
        end
    end

    Tic:screenAppend(_menuscreen)
end


-- MENU
CButtonPlayerSlotMenu = CButtonPlayerSlot:extend() -- generic player slot button
function CButtonPlayerSlotMenu:upDrop()
    CButtonPlayerSlotMenu.super.upDrop(self)
    local _clicklf = self.clicklf
    self.clicklf = function()
        _clicklf()
        self:closeMenu()
    end
end


--
-- CButtonPlayerSlotMenuPick
--
CButtonPlayerSlotMenuPick = CButtonPlayerSlotMenu:extend() -- generic player slot menu pick button
CButtonPlayerSlotMenuPick.BEHAVIOUR_X = function(self)
    local _slotobject    = self:getslotobject()
    local _menuscreen    = self.menuscreen
    local _entity        = self.entity
    local _entityslots   = self.entity.slots
    local _oldslotobject = self.oldslotobject
    local _isheader      = self.isheader
    local _stat          = self.stat

    if _slotobject then
        local _isbag = _slotobject:isBag()
        self.hovertextrg = (_isbag)
            and CHoverTextInfos{
                text = _slotobject:stringNameKind().." "..Tables:size(_slotobject.inventory.objects).."/"
                .._slotobject.inventory.objectsmax
            }
            or  CHoverTextInfos{
                text = _slotobject:stringNameKind()
            }
        if _isheader then
            self:upDone()
        else
            self:upDrop()
            self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
            self.clickrg        = function()
                                    local _whatslot = _slotobject:findWhatSlot(_entityslots) -- is object already in a slot ?
                                    if _whatslot then
                                        _whatslot:appendObject(_oldslotobject)
                                    end
                                    self.setslotobject(_slotobject)
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
        end
    else
        if _stat then
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
            self.clicklf        = function()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextdw    = nil
            self.clickrg        = nil
            if     _stat == Tic.TEXTPHY then
                self.sprite = CButtonEntitySlot.SPRITEPHY
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPhyAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.phy.objects).."/".._entity:statphymaxGet()
                }
            elseif _stat == Tic.TEXTMEN then
                self.sprite = CButtonEntitySlot.SPRITEMEN
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorMenAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.men.objects).."/".._entity:statmenmaxGet()
                }
            elseif _stat == Tic.TEXTPSY then
                self.sprite = CButtonEntitySlot.SPRITEPSY
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPsyAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.psy.objects).."/".._entity:statpsymaxGet()
                }
            end
        else
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
            self.clicklf        = function()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextrg    = nil
            self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
            self.clickrg        = function()
                                    self.setslotobject()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
        end
    end
end
CButtonPlayerSlotMenuPick.BEHAVIOUR = function(self)
    local _slotobject    = self:getslotobject()
    local _menuscreen    = self.menuscreen
    local _entity        = self.entity
    local _entityslots   = self.entity.slots
    local _oldslotobject = self.oldslotobject
    local _isheader      = self.isheader
    local _stat          = self.stat

    if _isheader then
        self:upDone()
        if not _slotobject and not _stat then
            self:dwPick()
        elseif _stat == Tic.TEXTPHY then
            self.sprite = CButtonEntitySlot.SPRITEPHY
            self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPhyAct()})
            self.hovertextrg = CHoverTextInfos{
                text = Tic.TEXTINV..":"
                ..Tables:size(_entity.inventories.phy.objects).."/".._entity:statphymaxGet()
            }
        elseif _stat == Tic.TEXTMEN then
            self.sprite = CButtonEntitySlot.SPRITEMEN
            self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorMenAct()})
            self.hovertextrg = CHoverTextInfos{
                text = Tic.TEXTINV..":"
                ..Tables:size(_entity.inventories.men.objects).."/".._entity:statmenmaxGet()
            }
        elseif _stat == Tic.TEXTPSY then
            self.sprite = CButtonEntitySlot.SPRITEPSY
            self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPsyAct()})
            self.hovertextrg = CHoverTextInfos{
                text = Tic.TEXTINV..":"
                ..Tables:size(_entity.inventories.psy.objects).."/".._entity:statpsymaxGet()
            }
        end
    else
        self:upDrop()
        self:upmdkUse()
        self:dwPick()
    end
end
function CButtonPlayerSlotMenuPick:new(_argt)
    CButtonPlayerSlotMenuPick.super.new(self, _argt)
    self.classic        = CButtonPlayerSlotMenuPick
	self.behaviour      = CButtonPlayerSlotMenuPick.BEHAVIOUR
    self.menuscreen     = nil -- parent menu screen
    self:argt(_argt)
end


--
-- CButtonPlayerSlotMenuPack
--
CButtonPlayerSlotMenuPack = CButtonPlayerSlotMenu:extend() -- generic player slot button
CButtonPlayerSlotMenuPack.BEHAVIOUR = function(self)
    local _slotobject    = self:getslotobject()
    local _menuscreen    = self.menuscreen
    local _entity        = self.entity
    local _entityslots   = self.entity.slots
    local _oldslotobject = self.oldslotobject
    local _isheader      = self.isheader
    local _stat          = self.stat

    if _slotobject then
        local _isbag = _slotobject:isBag()
        self.hovertextrg = (_isbag)
            and CHoverTextInfos{
                text = _slotobject:stringNameKind().." "..Tables:size(_slotobject.inventory.objects).."/"
                .._slotobject.inventory.objectsmax
            }
            or  CHoverTextInfos{
                text = _slotobject:stringNameKind()
            }
        if _isheader then
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
            self.clicklf        = function()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextdw    = nil
            self.clickrg        = nil
        else
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDROP}
            self.clicklf        = function()
                                    _entity:dropObject(_slotobject)
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
            self.clickrg        = function()
                                    local _whatslot = _slotobject:findWhatSlot(_entityslots) -- is object already in a slot ?
                                    if _whatslot then
                                        _whatslot:appendObject(_oldslotobject)
                                    end
                                    self.setslotobject(_slotobject)
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
        end
    else
        if _stat then
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
            self.clicklf        = function()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextdw    = nil
            self.clickrg        = nil
            if     _stat == Tic.TEXTPHY then
                self.sprite = CButtonEntitySlot.SPRITEPHY
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPhyAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.phy.objects).."/".._entity:statphymaxGet()
                }
            elseif _stat == Tic.TEXTMEN then
                self.sprite = CButtonEntitySlot.SPRITEMEN
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorMenAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.men.objects).."/".._entity:statmenmaxGet()
                }
            elseif _stat == Tic.TEXTPSY then
                self.sprite = CButtonEntitySlot.SPRITEPSY
                self.sprite.palette = Tables:merge(self.sprite.palette, {[Tic.COLORWHITE] = _entity:colorPsyAct()})
                self.hovertextrg = CHoverTextInfos{
                    text = Tic.TEXTINV..":"
                    ..Tables:size(_entity.inventories.psy.objects).."/".._entity:statpsymaxGet()
                }
            end
        else
            self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDONE}
            self.clicklf        = function()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
            self.hovertextrg    = nil
            self.hovertextdw    = CHoverTextClickRG{text = Tic.TEXTPICK}
            self.clickrg        = function()
                                    self.setslotobject()
                                    Tic:screenRemove(_menuscreen)
                                    Tic:mouseDelay()
                                  end
        end
    end
end
function CButtonPlayerSlotMenuPack:new(_argt)
    CButtonPlayerSlotMenuPack.super.new(self, _argt)
    self.classic        = CButtonPlayerSlotMenuPack
	self.behaviour      = CButtonPlayerSlotMenuPack.BEHAVIOUR
    self.menuscreen     = nil -- parent menu screen
    self:argt(_argt)
end

CButtonPlayerSlotHead = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHead:new(_argt)
    CButtonPlayerSlotHead.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHead
    self.getslotobject = function() return self.entity:slotGetHeadObject() end
    self.setslotobject = function(_object) return self.entity:slotSetHeadObject(_object) end
    self.sprite        = CButtonEntitySlot.SPRITEHEAD
    self.slottype      = CSlotHead
    self:argt(_argt)
end

CButtonPlayerSlotBack = CButtonPlayerSlot:extend()
function CButtonPlayerSlotBack:new(_argt)
    CButtonPlayerSlotBack.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotBack
    self.getslotobject = function() return self.entity:slotGetBackObject() end
    self.setslotobject = function(_object) return self.entity:slotSetBackObject(_object) end
    self.sprite        = CButtonEntitySlot.SPRITEBACK
    self.slottype      = CSlotBack
    self:argt(_argt)
end

CButtonPlayerSlotHandLF = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHandLF:new(_argt)
    CButtonPlayerSlotHandLF.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHandLF
    self.getslotobject = function() return self.entity:slotGetHandLFObject() end
    self.setslotobject = function(_object) return self.entity:slotSetHandLFObject(_object) end
    self.sprite        = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt)
end

CButtonPlayerSlotHandRG = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHandRG:new(_argt)
    CButtonPlayerSlotHandRG.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHandRG
    self.getslotobject = function() return self.entity:slotGetHandRGObject() end
    self.setslotobject = function(_object) return self.entity:slotSetHandRGObject(_object) end
    self.sprite        = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt)
end


--
-- IButtonSpotting
--
IButtonSpotting = Classic:extend() -- spotting buttons implementation
IButtonSpotting.BEHAVIOUR = function(self) -- need at least one spotting
    IButton.BEHAVIOUR(self) -- enabled if at least one function
    self.entity  = Tic:spottingActual()
    self.display = (self.entity)
end


--
-- CButtonSpottingSlot
--
CButtonSpottingSlot = CButtonPortrait:extend()
CButtonSpottingSlot.BEHAVIOUR = function(self) -- need at least one spotting with slots
    IButtonSpotting.BEHAVIOUR(self)
    if not self.display then return end -- no spotting
    self.display = (self.entity.slots)
    if not self.display then return end -- no spotting
    if self:getslotobject() then
        self.hovertextlf = CHoverTextInfos{text = self:getslotobject():stringKindName()}
    else
        self.hovertextlf = nil
    end
end
function CButtonSpottingSlot:new(_argt)
    CButtonSpottingSlot.super.new(self, _argt)
    self.behaviour = CButtonSpottingSlot.BEHAVIOUR
    self.enabled   = false
    self:argt(_argt)
end

CButtonSpottingSlotHead = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHead:new(_argt)
    CButtonSpottingSlotHead.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.head.object end
    self.sprite  = CButtonEntitySlot.SPRITEHEAD
    self.slottype      = CSlotHead
    self:argt(_argt)
end

CButtonSpottingSlotBack = CButtonSpottingSlot:extend()
function CButtonSpottingSlotBack:new(_argt)
    CButtonSpottingSlotBack.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.back.object end
    self.sprite  = CButtonEntitySlot.SPRITEBACK
    self.slottype      = CSlotBack
    self:argt(_argt)
end

CButtonSpottingSlotHandLF = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHandLF:new(_argt)
    CButtonSpottingSlotHandLF.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.handlf.object end
    self.sprite  = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt)
end

CButtonSpottingSlotHandRG = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHandRG:new(_argt)
    CButtonSpottingSlotHandRG.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.handrg.object end
    self.sprite  = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt)
end


--
-- CButtonSpottingSpot
--
CButtonSpottingSpot = CButtonCheck:extend() -- generic spottingspot check button
CButtonSpottingSpot.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    self.checked = Tic:isSpottingSpot()
end
function CButtonSpottingSpot:new(_argt)
    CButtonSpottingSpot.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNSPOTIT
    self.sprite.palette = IButton.PALETTESPOTTINGMODE
	self.behaviour      = CButtonSpottingSpot.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:spottingToggleSpot() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTSPOT}
    self:argt(_argt)
end


--
-- CButtonSpottingPick
--
CButtonSpottingPick = CButtonCheck:extend() -- generic spottingpick check button
CButtonSpottingPick.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    self.checked = Tic:isSpottingPick()
end
function CButtonSpottingPick:new(_argt)
    CButtonSpottingPick.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNPICKIT
    self.sprite.palette = IButton.PALETTESPOTTINGMODE
	self.behaviour      = CButtonSpottingPick.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:spottingTogglePick() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTPICK}
    self:argt(_argt)
end


--
-- CButtonSpottingLock
--
CButtonSpottingLock = CButtonCheck:extend() -- generic spottinglock check button
CButtonSpottingLock.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    self.checked = Tic:isSpottingLock()
end
function CButtonSpottingLock:new(_argt)
    CButtonSpottingLock.super.new(self, _argt)
    self.drawborder     = false
	self.sprite.sprite  = CSpriteBG.SIGNLOCKIT
    self.sprite.palette = IButton.PALETTESPOTTINGMODE
	self.behaviour      = CButtonSpottingLock.BEHAVIOUR  -- function to trigger at first
    self.clicklf        = function() Tic:spottingToggleLock() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTLOCK}
    self:argt(_argt)
end


--
-- IButtonSpottingMove
--
IButtonSpottingMove = Classic:extend() -- spotting buttons implementation
IButtonSpottingMove.BEHAVIOUR = function(self)
    IButtonSpotting.BEHAVIOUR(self)
    if not self.display then return end -- no spotting
    local _playerregionworld = Tic:playerActual():regionWorld()
    local _entityregionworld = self.entity:regionWorld()
    local _direction         = _playerregionworld:directionRegion(_entityregionworld)
    self.enabled     = false
    self.actived     = false
    if _direction == self.direction then
        self.enabled = true
        if not self.hovered then
            self.actived = true
        end
    end
end

CButtonSpotting000 = CButtonArrow000:extend() -- generic spotting 000 button
function CButtonSpotting000:new(_argt)
    CButtonSpotting000.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting045 = CButtonArrow045:extend() -- generic spotting 045 button
function CButtonSpotting045:new(_argt)
    CButtonSpotting045.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting090 = CButtonArrow090:extend() -- generic spotting 090 button
function CButtonSpotting090:new(_argt)
    CButtonSpotting090.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting135 = CButtonArrow135:extend() -- generic spotting 135 button
function CButtonSpotting135:new(_argt)
    CButtonSpotting135.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting180 = CButtonArrow180:extend() -- generic spotting 180 button
function CButtonSpotting180:new(_argt)
    CButtonSpotting180.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting225 = CButtonArrow225:extend() -- generic spotting 225 button
function CButtonSpotting225:new(_argt)
    CButtonSpotting225.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting270 = CButtonArrow270:extend() -- generic spotting 270 button
function CButtonSpotting270:new(_argt)
    CButtonSpotting270.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end

CButtonSpotting315 = CButtonArrow315:extend() -- generic spotting 315 button
function CButtonSpotting315:new(_argt)
    CButtonSpotting315.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTMOVE}
    self:argt(_argt)
end


--
-- IButtonPlayerMove
--
IButtonPlayerMove = Classic:extend() -- player move buttons implementation
IButtonPlayerMove.BEHAVIOUR = function(self)
    IButtonPlayer.BEHAVIOUR(self)
    if not self.display then return end -- no move
    if not self.hovered then
        self.actived     = Tic:playerActual().direction == self.direction
    end
    self.hovertextup = CHoverTextClickLF{text = Tic.TEXTMOVE}
end

CButtonPlayerMove000 = CButtonArrow000:extend() -- generic player move 000 button
function CButtonPlayerMove000:new(_argt)
    CButtonPlayerMove000.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt)
end

CButtonPlayerMove045 = CButtonArrow045:extend() -- generic player move 045 button
function CButtonPlayerMove045:new(_argt)
    CButtonPlayerMove045.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt)
end

CButtonPlayerMove090 = CButtonArrow090:extend() -- generic player move 090 button
function CButtonPlayerMove090:new(_argt)
    CButtonPlayerMove090.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt)
end

CButtonPlayerMove135 = CButtonArrow135:extend() -- generic player move 135 button
function CButtonPlayerMove135:new(_argt)
    CButtonPlayerMove135.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt)
end

CButtonPlayerMove180 = CButtonArrow180:extend() -- generic player move 180 button
function CButtonPlayerMove180:new(_argt)
    CButtonPlayerMove180.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt)
end

CButtonPlayerMove225 = CButtonArrow225:extend() -- generic player move 225 button
function CButtonPlayerMove225:new(_argt)
    CButtonPlayerMove225.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt)
end

CButtonPlayerMove270 = CButtonArrow270:extend() -- generic player move 270 button
function CButtonPlayerMove270:new(_argt)
    CButtonPlayerMove270.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt)
end

CButtonPlayerMove315 = CButtonArrow315:extend() -- generic player move 315 button
function CButtonPlayerMove315:new(_argt)
    CButtonPlayerMove315.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt)
end


--
-- IButtonMessageChange
--
IButtonMessageChange1 = Classic:extend() -- message change buttons implementation
IButtonMessageChange1.BEHAVIOUR = function(self) -- need at least more than one message
    IButton.BEHAVIOUR(self)
    if not self.display then return end -- no message
    self.enabled = (Tic:messageCount() > 0)
end
IButtonMessageChange2 = Classic:extend() -- message change buttons implementation
IButtonMessageChange2.BEHAVIOUR = function(self) -- need at least more than one message
    IButton.BEHAVIOUR(self)
    if not self.display then return end -- no message
    self.enabled = (Tic:messageCount() > 1)
end


--
-- CButtonMessagePrev
--
CButtonMessagePrev = CButtonArrow000:extend() -- generic message prev button
CButtonMessagePrev.BEHAVIOUR = function(self)
    IButtonMessageChange2.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTPREV}
        self.clicklf        = Tic.FUNCTIONMESSAGEPREV
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTFIRST}
        self.clicklfmdk     = Tic.FUNCTIONMESSAGEMIN
    else
        self.hovertextup    = nil
        self.clicklf        = nil
        self.hovertextupmdk = nil
        self.clicklfmdk     = nil
    end
end
Classic.KINDBUTTONMESSAGEPREV = "ButtonMessagePrev"
Classic.NAMEBUTTONMESSAGEPREV = "ButtonMessagePrev"
function CButtonMessagePrev:new(_argt)
    CButtonMessagePrev.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGEPREV
    self.name = Classic.NAMEBUTTONMESSAGEPREV
	self.behaviour      = CButtonMessagePrev.BEHAVIOUR  -- function to trigger at first
    self:argt(_argt)
end


--
-- CButtonMessageNext
--
CButtonMessageNext = CButtonArrow180:extend() -- generic message next button
CButtonMessageNext.BEHAVIOUR = function(self)
    IButtonMessageChange2.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTNEXT}
        self.clicklf        = Tic.FUNCTIONMESSAGENEXT
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTLAST}
        self.clicklfmdk     = Tic.FUNCTIONMESSAGEMAX
    else
        self.hovertextup    = nil
        self.clicklf        = nil
        self.hovertextupmdk = nil
        self.clicklfmdk     = nil
    end
end
Classic.KINDBUTTONMESSAGENEXT = "ButtonMessageNext"
Classic.NAMEBUTTONMESSAGENEXT = "ButtonMessageNext"
function CButtonMessageNext:new(_argt)
    CButtonMessageNext.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGENEXT
    self.name = Classic.NAMEBUTTONMESSAGENEXT
	self.behaviour      = CButtonMessageNext.BEHAVIOUR  -- function to trigger at first
    self:argt(_argt)
end


--
-- CButtonMessageTrash
--
CButtonMessageTrash = CButtonClick:extend() -- generic message trash button
CButtonMessageTrash.BEHAVIOUR = function(self)
    IButtonMessageChange1.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.hovertextup    = CHoverTextClickLF{text = Tic.TEXTDELONE}
        self.clicklf        = Tic.FUNCTIONMESSAGEDELONE
        self.hovertextupmdk = CHoverTextClickLF{text = Tic.TEXTDELALL}
        self.clicklfmdk     = Tic.FUNCTIONMESSAGEDELALL
    else
        self.hovertextup    = nil
        self.clicklf        = nil
        self.hovertextupmdk = nil
        self.clicklfmdk     = nil
    end
end
Classic.KINDBUTTONMESSAGETRASH = "ButtonMessageTrash"
Classic.NAMEBUTTONMESSAGETRASH = "ButtonMessageTrash"
function CButtonMessageTrash:new(_argt)
    CButtonMessageTrash.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGETRASH
    self.name = Classic.NAMEBUTTONMESSAGETRASH
    self.drawborder     = false
    self.drawground     = false
	self.sprite.sprite  = CSpriteBG.SIGNDELETE
	self.behaviour      = CButtonMessageTrash.BEHAVIOUR  -- function to trigger at first
    self:argt(_argt)
end


--
-- CButtonMessageText
--
CButtonMessageText = CButtonText:extend() -- generic message text button
CButtonMessageText.BEHAVIOUR = function(self)
    IButtonMessageChange2.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.wheelup        = Tic.FUNCTIONMESSAGEPREV
        self.wheelupmdk     = Tic.FUNCTIONMESSAGEMIN
        self.wheeldw        = Tic.FUNCTIONMESSAGENEXT
        self.wheeldwmdk     = Tic.FUNCTIONMESSAGEMAX
    else
        self.wheelup        = nil
        self.wheelupmdk     = nil
        self.wheeldw        = nil
        self.wheeldwmdk     = nil
    end
    local _messageactual = (Tic:messageActual()) and Tic:messageActual() or ""
    self.text:setText(_messageactual)
    self.colorborder = Tic.COLORENABLED
    self.colorborder = (self.hovered) and Tic.COLORHOVERED or self.colorborder
    self.colorborder = (self.actived) and Tic.COLORACTIVED or self.colorborder
end
Classic.KINDBUTTONMESSAGETEXT = "ButtonMessageText"
Classic.NAMEBUTTONMESSAGETEXT = "ButtonMessageText"
function CButtonMessageText:new(_argt)
    CButtonMessageText.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGETEXT
    self.name = Classic.NAMEBUTTONMESSAGETEXT
    --
    self.behaviour      = CButtonMessageText.BEHAVIOUR
	self.text           = CText{text = "", small = true, marginlf = 2}
    self.align          = Tic.DIR270
    self.rounded        = false
    self.drawground     = false
    self.colorinside    = Tic.COLORGREYL
    -- self.wheelup        = Tic.FUNCTIONMESSAGEPREV
    -- self.wheelupmdk     = Tic.FUNCTIONMESSAGEMIN
    -- self.wheeldw        = Tic.FUNCTIONMESSAGENEXT
    -- self.wheeldwmdk     = Tic.FUNCTIONMESSAGEMAX
    --
    self:argt(_argt)
    self:adjustWH()
end


--
-- CButtonMessageHover
--
CButtonMessageHover = CButtonSprite:extend() -- generic message hover button
CButtonMessageHover.BEHAVIOUR = function(self)
    IButtonMessageChange1.BEHAVIOUR(self)
    self.hovered = false
    if not self.display then return end
    self.screenx = Tic.MOUSE.screenx
    self.screeny = Tic.MOUSE.screeny
    self.hovered = true
end
Classic.KINDBUTTONMESSAGEHOVER = "ButtonMessageHover"
Classic.NAMEBUTTONMESSAGEHOVER = "ButtonMessageHover"
function CButtonMessageHover:new(_argt)
    CButtonMessageHover.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGEHOVER
    self.name = Classic.NAMEBUTTONMESSAGEHOVER
    --
    self.drawborder     = false
    self.drawground     = false
	self.sprite.sprite  = CSpriteBG.SIGNWHEELY
	self.behaviour      = CButtonMessageHover.BEHAVIOUR  -- function to trigger at first
    self.hovertextul    = CHoverTextClickLF{text = Tic.TEXTPREV}
    self.hovertextulmdk = CHoverTextClickLF{text = Tic.TEXTFIRST}
    self.hovertextur    = CHoverTextClickLF{text = Tic.TEXTNEXT}
    self.hovertexturmdk = CHoverTextClickLF{text = Tic.TEXTLAST}
    --
    self:argt(_argt)
end
