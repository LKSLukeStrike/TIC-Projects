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
    self.colorgroundactived  = Tic.COLORHOVERTEXTUP
    self.colorborderactived  = self.colorborder
    self.colorgroundchecked  = Tic.COLORHOVERTEXTUP
    self.colorborderchecked  = self.colorborder
    self.colorgrounddisabled = Tic.COLORGREYL
    self.colorborderdisabled = Tic.COLORGREYM
    self.clickable           = true -- act as a button
    --
    self:argt(_argt) -- override if any
end

function CButton:activable() -- is the button activable ?
    return self.display and not self.actived
end

function CButton:draw() -- button drawing --TODO hover with wheel ?
    CButton.super.draw(self)
    if self.hovered then
        if self.hovertextlf then self:drawHovertextLF() end
        if self.hovertextrg then self:drawHovertextRG() end
        if self.hovertextup then self:drawHovertextUP() end
        if self.hovertextdw then self:drawHovertextDW() end
        if self.hovertextul then self:drawHovertextUL() end
        if self.hovertextur then self:drawHovertextUR() end
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

function CButton:drawHovertextUP()
    local _hovertext    = (self.hovertextupmdk and Tic:hovertextsIsMDKPressed())
        and self.hovertextupmdk
        or  self.hovertextup
    _hovertext:adjustWH()
    local _mousesprite  = CSprite:spriteMouseClickLF()
    local _modkeysprite = (self.hovertextupmdk)
        and CSprite:spriteModifierKey()
        or  nil
    _hovertext.screenx  = self.screenx - ((_hovertext.screenw - self.screenw) // 2) + 1
    _hovertext.screeny  = self.screeny - _hovertext.screenh
    Tic:hovertextsAppend(_hovertext, _mousesprite, _modkeysprite)
end

function CButton:drawHovertextDW()
    local _hovertext    = (self.hovertextdwmdk and Tic:hovertextsIsMDKPressed())
        and self.hovertextdwmdk
        or  self.hovertextdw
    _hovertext:adjustWH()
    local _mousesprite  = CSprite:spriteMouseClickRG()
    local _modkeysprite = (self.hovertextdwmdk)
        and CSprite:spriteModifierKey()
        or  nil
    _hovertext.screenx  = self.screenx - ((_hovertext.screenw - self.screenw) // 2) + 1
    _hovertext.screeny  = self.screeny + self.screenh
    Tic:hovertextsAppend(_hovertext, _mousesprite, _modkeysprite)
end

function CButton:drawHovertextLF()
    local _hovertext   = self.hovertextlf
    _hovertext:adjustWH()
    _hovertext.screenx = self.screenx - _hovertext.screenw
    _hovertext.screeny = self.screeny + ((self.screenh - _hovertext.screenh) // 2)
    Tic:hovertextsAppend(_hovertext)
end

function CButton:drawHovertextRG()
    local _hovertext   = self.hovertextrg
    _hovertext:adjustWH()
    _hovertext.screenx = self.screenx + self.screenw
    _hovertext.screeny = self.screeny + ((self.screenh - _hovertext.screenh) // 2)
    Tic:hovertextsAppend(_hovertext)
end

function CButton:drawHovertextUL()
    local _hovertext    = (self.hovertextulmdk and Tic:hovertextsIsMDKPressed())
        and self.hovertextulmdk
        or  self.hovertextul
    _hovertext:adjustWH()
    local _mousesprite  = CSprite:spriteMouseWheelUP()
    local _modkeysprite = (self.hovertextulmdk)
        and CSprite:spriteModifierKey()
        or  nil
    _hovertext.screenx  =  (self.hovertextulmdk and Tic.DRAWHOVERTEXTMODIFIERKEY)
        and self.screenx - _hovertext.screenw - Tic.SPRITESIZE
        or  self.screenx - _hovertext.screenw
    _hovertext.screeny = self.screeny - _hovertext.screenh
    Tic:hovertextsAppend(_hovertext, _mousesprite, _modkeysprite)
end

function CButton:drawHovertextUR()
    local _hovertext    = (self.hovertexturmdk and Tic:hovertextsIsMDKPressed())
        and self.hovertexturmdk
        or  self.hovertextur
    _hovertext:adjustWH()
    local _mousesprite  = CSprite:spriteMouseWheelDW()
    local _modkeysprite = (self.hovertexturmdk)
        and CSprite:spriteModifierKey()
        or  nil
    _hovertext.screenx  =  (Tic.DRAWHOVERTEXTMOUSE)
        and self.screenx + self.screenw + Tic.SPRITESIZE
        or  self.screenx + self.screenw
    _hovertext.screeny = self.screeny - _hovertext.screenh
    Tic:hovertextsAppend(_hovertext, _mousesprite, _modkeysprite)
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
    self:argt(_argt) -- override if any
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
    --
	self.sprite     = CSpriteBG{}
    self.drawborder = false
    self.drawground = false
    --
    self:argt(_argt) -- override if any
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
    self:argt(_argt) -- override if any
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
function CButtonEntityHoverLock:new(_argt)
    CButtonEntityHoverLock.super.new(self, _argt)
    self.lock        = function()
                        local _playeractual = Tic:playerActual()
                        _playeractual:spotEntity(self.entity)
                        _playeractual.spottinglock = true
                        Tic:mouseDelay()
                       end
    self.unlock      = function()
                        local _playeractual = Tic:playerActual()
                        _playeractual:spotEntity(nil)
                        _playeractual.spottinglock = false
                        Tic:mouseDelay()
                       end
    self.hovertextdw = CHoverTextDW{text = Tic.TEXTLOCK}
    self.clickrg     = self.lock
    self.hovertextrg = CHoverTextRG{}
    self.behaviour   = function(self)
                        local _playeractual = Tic:playerActual()
                        if _playeractual.spottinglock and _playeractual.spotting == self.entity then -- already locking ?
                            self.hovertextdw.text = Tic.TEXTUNLOCK
                            self.clickrg = self.unlock
                        else
                            self.hovertextdw.text = Tic.TEXTLOCK
                            self.clickrg = self.lock
                        end
                        self.hovertextrg.text = self.entity:nameGet().." "..self.entity:kindGet()
                       end
    self:argt(_argt) -- override if any
end


--
-- CButtonEntityHoverLockPick
--
CButtonEntityHoverLockPick = CButtonEntityHoverLock:extend() -- generic entity hover lock pick button
function CButtonEntityHoverLockPick:new(_argt)
    CButtonEntityHoverLockPick.super.new(self, _argt)
    self.pick        = function()
                        Tic:playerActual().hovered = false
                        Tic:playerPick(self.entity)
                        Tic:playerActual().hovered = false
                        Tic:mouseDelay()
                       end
    self.hovertextup = CHoverTextUP{text = Tic.TEXTPICK}
    self.clicklf     = self.pick
    self:argt(_argt) -- override if any
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
	self.sprite.rotate = Tic.ROTATE000
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow045
--
CButtonArrow045 = CButtonArrowDiag:extend() -- generic arrow 045 click button
function CButtonArrow045:new(_argt)
    CButtonArrow045.super.new(self, _argt)
    self.direction     = Tic.DIR045
	self.sprite.rotate = Tic.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow090
--
CButtonArrow090 = CButtonArrowLine:extend() -- generic arrow 090 click button
function CButtonArrow090:new(_argt)
    CButtonArrow090.super.new(self, _argt)
    self.direction     = Tic.DIR090
	self.sprite.rotate = Tic.ROTATE090
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow135
--
CButtonArrow135 = CButtonArrowDiag:extend() -- generic arrow 135 click button
function CButtonArrow135:new(_argt)
    CButtonArrow135.super.new(self, _argt)
    self.direction     = Tic.DIR135
	self.sprite.rotate = Tic.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow180
--
CButtonArrow180 = CButtonArrowLine:extend() -- generic arrow 180 click button
function CButtonArrow180:new(_argt)
    CButtonArrow180.super.new(self, _argt)
    self.direction     = Tic.DIR180
	self.sprite.rotate = Tic.ROTATE180
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow225
--
CButtonArrow225 = CButtonArrowDiag:extend() -- generic arrow 225 click button
function CButtonArrow225:new(_argt)
    CButtonArrow225.super.new(self, _argt)
    self.direction     = Tic.DIR225
	self.sprite.rotate = Tic.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow270
--
CButtonArrow270 = CButtonArrowLine:extend() -- generic arrow 270 click button
function CButtonArrow270:new(_argt)
    CButtonArrow270.super.new(self, _argt)
    self.direction     = Tic.DIR270
	self.sprite.rotate = Tic.ROTATE270
    self:argt(_argt) -- override if any
end


--
-- CButtonArrow315
--
CButtonArrow315 = CButtonArrowDiag:extend() -- generic arrow 315 click button
function CButtonArrow315:new(_argt)
    CButtonArrow315.super.new(self, _argt)
    self.direction     = Tic.DIR315
	self.sprite.rotate = Tic.ROTATE000
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


--
-- CButtonPlayerPosture
--
CButtonPlayerPosture = CButtonCheck:extend() -- generic player posture button
function CButtonPlayerPosture:new(_argt)
    CButtonPlayerPosture.super.new(self, _argt)
    self.drawborder     = false
    self.colorground    = Tic.COLORBLUEM
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTSTAND}
    self.clicklf        = function() Tic:toggleKneel() end
    --
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTKNEEL}
    self.clicklf        = function() Tic:toggleKneel() end
    --
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTWORK}
    self.clicklf        = function() Tic:toggleWork() end
    --
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTSLEEP}
    self.clicklf        = function() Tic:toggleSleep() end
    --
    self:argt(_argt) -- override if any
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
    self.clicklf        = function() end
    self.hovertextrg    = CHoverTextRG{text = ""}
    self:argt(_argt) -- override if any
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
                            self.hovertextrg.text = Tic.TEXTPHY..":"
                            .._playeractual:statphyactGet().."/".._playeractual:statphymaxGet()
                         end
    self:argt(_argt) -- override if any
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
                            self.hovertextrg.text = Tic.TEXTMEN..":"
                            .._playeractual:statmenactGet().."/".._playeractual:statmenmaxGet()
                         end
    self:argt(_argt) -- override if any
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
                            self.hovertextrg.text = Tic.TEXTPSY..":"
                            .._playeractual:statpsyactGet().."/".._playeractual:statpsymaxGet()
                         end
    self:argt(_argt) -- override if any
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
    self:argt(_argt) -- override if any
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
    self:argt(_argt) -- override if any
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
            and CButtonPortrait.PALETTEENABLED
            or  CButtonPortrait.PALETTEDISABLED
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
        self.hovertextup    = CHoverTextUP{text = Tic.TEXTPREV}
        self.clicklfmdk     = Tic.FUNCTIONPLAYERMIN
        self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTFIRST}
        self.hovertextrg    = (Tic:hovertextsIsMDKPressed())
            and CHoverTextRG{text = Tic:playerGetFirst():stringNameKind()}
            or  CHoverTextRG{text = Tic:playerGetPrev():stringNameKind()}
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
    self:argt(_argt) -- override if any
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
        self.hovertextup    = CHoverTextUP{text = Tic.TEXTNEXT}
        self.clicklfmdk     = Tic.FUNCTIONPLAYERMAX
        self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTLAST}
        self.hovertextrg    = (Tic:hovertextsIsMDKPressed())
            and CHoverTextRG{text = Tic:playerGetLast():stringNameKind()}
            or  CHoverTextRG{text = Tic:playerGetNext():stringNameKind()}
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
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerPick
--
CButtonPlayerPick = CButtonPortrait:extend() -- generic player pick button
CButtonPlayerPick.BEHAVIOUR = function(self) -- need at least more than one player
    IButtonPlayerChange.BEHAVIOUR(self)
    if not self.display then return end -- no player
    if self.enabled then -- more than one player
        self.hovertextup = CHoverTextUP{text = Tic.TEXTPICK}
        self.clicklf     = function() self:menuPick() end
    else
        self.hovertextup = nil
        self.clicklf     = nil
    end
    if self:getslotobject():isParty() then -- even if only one player but who is a party
        self.enabled     = true -- restore enabled in case of party
        self.hovertextdw = CHoverTextDW{text = Tic.TEXTPARTY}
        self.clickrg     = function() self:menuParty() end
    else
        self.hovertextdw = nil
        self.clickrg     = nil
    end
    if self.enabled then
        self.hovertextrg = CHoverTextRG{text = self:getslotobject():stringNameKind()}
    else
        self.hovertextrg = nil
    end
end
function CButtonPlayerPick:new(_argt)
    CButtonPlayerPick.super.new(self, _argt)
    self.classic        = CButtonPlayerPick
	self.behaviour      = CButtonPlayerPick.BEHAVIOUR  -- function to trigger at first
    self.getslotobject  = function() return Tic:playerActual() end
    self:argt(_argt) -- override if any
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
    local _screen        = CScreen{}
    local _screenx       = self.screenx - 9
    local _screeny       = self.screeny
    local _playeractual  = Tic:playerActual()
    local _players       = Tic:playerPlayers()


    local _windowmenu = CWindowMenu{
        screenx = _screenx,
        screeny = _screeny,
        separatory = 1,
        stretch = true,
    }
    _screen:appendElements{_windowmenu}

    local function _appendbutton(_slotobject)
        _windowmenu:appendElements{
            CButtonPlayerPickMenu{
                screen = _screen,
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

    Tic:screenAppend(_screen)
end

function CButtonPlayerPick:menuParty()
    local _screen        = CScreen{}
    local _screenx       = self.screenx + 9
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
    _screen:appendElements{_windowmenu}

    local function _appendbutton(_slotobject)
        _windowmenu:appendElements{
            CButtonPlayerPartyMenu{
                screen = _screen,
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

    Tic:screenAppend(_screen)
end


--
-- CButtonPlayerPickMenu
--
CButtonPlayerPickMenu = CButtonPlayerPick:extend() -- generic player pick button
function CButtonPlayerPickMenu:new(_argt)
    CButtonPlayerPickMenu.super.new(self, _argt)
    self.classic        = CButtonPlayerPickMenu
	self.behaviour      = CButtonPortrait.BEHAVIOUR
    self.screen         = nil -- parent menu screen
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTPICK}
    self.clicklf        = function()
                            Tic:playerPick(self:getslotobject())
                            Tic:screenRemove(self.screen)
                            Tic:mouseDelay()
                          end
    self.hovertextrg    = CHoverTextRG{text = self:getslotobject():stringNameKind()}
    self.hovertextdw    = nil
    self.clickrg        = nil
    self:argt(_argt) -- override if any
end


--
-- CButtonPlayerPartyMenu
--
CButtonPlayerPartyMenu = CButtonPlayerPick:extend() -- generic player pick button
function CButtonPlayerPartyMenu:new(_argt)
    CButtonPlayerPartyMenu.super.new(self, _argt)
    self.classic        = CButtonPlayerPartyMenu
	self.behaviour      = CButtonPortrait.BEHAVIOUR
    self.screen         = nil -- parent menu screen
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTLEAD}
    self.clicklf        = function()
                            self:getslotobject():leadParty(nil, true)
                            Tic:screenRemove(self.screen)
                            Tic:mouseDelay()
                          end
    self.hovertextrg    = CHoverTextRG{text = self:getslotobject():stringNameKind()}
    self.hovertextdw    = CHoverTextDW{text = Tic.TEXTQUIT}
    self.clickrg        = function()
                            self:getslotobject():quitParty(true)
                            Tic:screenRemove(self.screen)
                            Tic:mouseDelay()
                          end
    self:argt(_argt) -- override if any
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
CButtonEntitySlot.BEHAVIOUR = function(self) -- need at least one player with slots
    self.display = (self.entity)
    if not self.display then return end -- no entity
    self.display = (self.entity.slots)
end

function CButtonEntitySlot:objectsinInventories(_inventories)
    local _result = {}
    for _, _inventory in pairs(_inventories or {}) do
        if CInventory:isInventory(_inventory) then
            local _objectsofslottype = _inventory:objectsofSlotType(self.slottype)
            _result = Tables:imerge(_result, _objectsofslottype, true)
        end
    end
    return _result
end

function CButtonEntitySlot:canPick()
    if self:objectGet() then return true end -- has object in slot -- can be replaced by an empty one
    local _objectsininventories = self:objectsinInventories(self.entity.inventories)
    if Tables:size(_objectsininventories) > 0 then return true end --has other objects of same slottype
    return false
end

function CButtonEntitySlot:canDrop()
    return self:objectGet() -- has object in slot -- can drop it
end


--
-- CButtonPlayerSlot
--
CButtonPlayerSlot = CButtonEntitySlot:extend()
CButtonPlayerSlot.BEHAVIOUR = function(self) -- need at least one player with slots
    self.entity = Tic.playerActual()
    CButtonEntitySlot.BEHAVIOUR(self)
    if not self.display then return end -- no slots
    self.enabled = false
    if self:canDrop() then
        self.enabled = true
        self.hovertextup = CHoverTextUP{text = Tic.TEXTDROP}
        self.clicklf     = function() self.entity:dropObject(self:getslotobject()) end
    else
        self.hovertextup = nil
        self.clicklf     = nil
    end
    if self:canPick() then
        self.enabled = true
        self.hovertextdw = CHoverTextDW{text = Tic.TEXTPICK}
        self.clickrg     = function() self:menuPick() end
    else
        self.hovertextdw = nil
        self.clickrg     = nil
    end
    if self.enabled and self:getslotobject() then
        self.hovertextrg = CHoverTextRG{text = self:getslotobject():stringNameKind()}
    else
        self.hovertextrg = nil
    end
end
function CButtonPlayerSlot:new(_argt)
    CButtonPlayerSlot.super.new(self, _argt)
    self.behaviour   = CButtonPlayerSlot.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CButtonPlayerSlot:menuPick()
    local _screen        = CScreen{}
    local _screenx       = self.screenx + 9
    local _screeny       = self.screeny
    local _classic       = self.classic
    local _entity        = self.entity
    local _slottype      = self.slottype
    local _getslotobject = self.getslotobject
    local _setslotobject = self.setslotobject

    local _windowmenu = CWindowMenu{
        screenx = _screenx,
        screeny = _screeny,
        separatory = 1,
        stretch = true,
    }
    _screen:appendElements{_windowmenu}

    local _buttonslotempty = _classic{
        behaviour     = Classic.NIL,
        entity        = _entity,
        getslotobject = function() return nil end, -- returns nil
        hovertextdw   = CHoverTextDW{text = Tic.TEXTPICK},
        clickrg = function()
            _setslotobject()
            Tic:screenRemove(_screen)
            Tic:mouseDelay()
        end,
    }
    _windowmenu:appendElements{_buttonslotempty}

    for _, _object in ipairs(_entity:objectsofSlotType(_slottype)) do
        _windowmenu:appendElements{
            _classic{
                behaviour = Classic.NIL,
                entity    = _entity,
                getslotobject = function() return _object end, -- returns object
                hovertextup = CHoverTextUP{text = Tic.TEXTDROP},
                clicklf = function()
                    _entity:dropObject(_object)
                    Tic:screenRemove(_screen)
                    Tic:mouseDelay()
                end,
                hovertextdw = CHoverTextDW{text = Tic.TEXTPICK},
                clickrg = function()
                    local _whatslot = _object:findWhatSlot(_entity.slots) -- is object in a slot ?
                    if _whatslot then
                        _whatslot:appendObject(_getslotobject())
                    end
                    _setslotobject(_object)
                    Tic:screenRemove(_screen)
                    Tic:mouseDelay()
                end,
                hovertextrg = (self:getslotobject())
                    and CHoverTextRG{text = self:getslotobject():stringNameKind()}
                    or  nil,
            }
        }
    end

    Tic:screenAppend(_screen)
end

CButtonPlayerSlotHead = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHead:new(_argt)
    CButtonPlayerSlotHead.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHead
    -- self.clickrg       = Tic.FUNCTIONSLOTDROPHEAD
    self.setslotobject = function(_object) return self.entity:slotSetHeadObject(_object) end
    self.getslotobject = function() return self.entity:slotGetHeadObject() end
    self.sprite        = CButtonEntitySlot.SPRITEHEAD
    self.slottype      = CSlotHead
    self:argt(_argt) -- override if any
end

CButtonPlayerSlotBack = CButtonPlayerSlot:extend()
function CButtonPlayerSlotBack:new(_argt)
    CButtonPlayerSlotBack.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotBack
    -- self.clickrg       = Tic.FUNCTIONSLOTDROPBACK
    self.setslotobject = function(_object) return self.entity:slotSetBackObject(_object) end
    self.getslotobject = function() return self.entity:slotGetBackObject() end
    self.sprite        = CButtonEntitySlot.SPRITEBACK
    self.slottype      = CSlotBack
    self:argt(_argt) -- override if any
end

CButtonPlayerSlotHandLF = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHandLF:new(_argt)
    CButtonPlayerSlotHandLF.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHandLF
    -- self.clickrg       = Tic.FUNCTIONSLOTDROPHANDLF
    self.setslotobject = function(_object) return self.entity:slotSetHandLFObject(_object) end
    self.getslotobject = function() return self.entity:slotGetHandLFObject() end
    self.sprite        = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt) -- override if any
end

CButtonPlayerSlotHandRG = CButtonPlayerSlot:extend()
function CButtonPlayerSlotHandRG:new(_argt)
    CButtonPlayerSlotHandRG.super.new(self, _argt)
    self.classic       = CButtonPlayerSlotHandRG
    -- self.clickrg       = Tic.FUNCTIONSLOTDROPHANDRG
    self.setslotobject = function(_object) return self.entity:slotSetHandRGObject(_object) end
    self.getslotobject = function() return self.entity:slotGetHandRGObject() end
    self.sprite        = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt) -- override if any
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
        self.hovertextlf = CHoverTextLF{text = self:getslotobject():stringKindName()}
    else
        self.hovertextlf = nil
    end
end
function CButtonSpottingSlot:new(_argt)
    CButtonSpottingSlot.super.new(self, _argt)
    self.behaviour = CButtonSpottingSlot.BEHAVIOUR
    self.enabled   = false
    self:argt(_argt) -- override if any
end

CButtonSpottingSlotHead = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHead:new(_argt)
    CButtonSpottingSlotHead.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.head.object end
    self.sprite  = CButtonEntitySlot.SPRITEHEAD
    self.slottype      = CSlotHead
    self:argt(_argt) -- override if any
end

CButtonSpottingSlotBack = CButtonSpottingSlot:extend()
function CButtonSpottingSlotBack:new(_argt)
    CButtonSpottingSlotBack.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.back.object end
    self.sprite  = CButtonEntitySlot.SPRITEBACK
    self.slottype      = CSlotBack
    self:argt(_argt) -- override if any
end

CButtonSpottingSlotHandLF = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHandLF:new(_argt)
    CButtonSpottingSlotHandLF.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.handlf.object end
    self.sprite  = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt) -- override if any
end

CButtonSpottingSlotHandRG = CButtonSpottingSlot:extend()
function CButtonSpottingSlotHandRG:new(_argt)
    CButtonSpottingSlotHandRG.super.new(self, _argt)
    self.getslotobject = function() return self.entity.slots.handrg.object end
    self.sprite  = CButtonEntitySlot.SPRITEHAND
    self.slottype      = CSlotHand
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTSPOT}
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTPICK}
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTLOCK}
    self:argt(_argt) -- override if any
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
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting045 = CButtonArrow045:extend() -- generic spotting 045 button
function CButtonSpotting045:new(_argt)
    CButtonSpotting045.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting090 = CButtonArrow090:extend() -- generic spotting 090 button
function CButtonSpotting090:new(_argt)
    CButtonSpotting090.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting135 = CButtonArrow135:extend() -- generic spotting 135 button
function CButtonSpotting135:new(_argt)
    CButtonSpotting135.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting180 = CButtonArrow180:extend() -- generic spotting 180 button
function CButtonSpotting180:new(_argt)
    CButtonSpotting180.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting225 = CButtonArrow225:extend() -- generic spotting 225 button
function CButtonSpotting225:new(_argt)
    CButtonSpotting225.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting270 = CButtonArrow270:extend() -- generic spotting 270 button
function CButtonSpotting270:new(_argt)
    CButtonSpotting270.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
end

CButtonSpotting315 = CButtonArrow315:extend() -- generic spotting 315 button
function CButtonSpotting315:new(_argt)
    CButtonSpotting315.super.new(self, _argt)
    self.behaviour      = IButtonSpottingMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTMOVE}
    self:argt(_argt) -- override if any
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
    self.hovertextup = CHoverTextUP{text = Tic.TEXTMOVE}
end

CButtonPlayerMove000 = CButtonArrow000:extend() -- generic player move 000 button
function CButtonPlayerMove000:new(_argt)
    CButtonPlayerMove000.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection000() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove045 = CButtonArrow045:extend() -- generic player move 045 button
function CButtonPlayerMove045:new(_argt)
    CButtonPlayerMove045.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection045() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove090 = CButtonArrow090:extend() -- generic player move 090 button
function CButtonPlayerMove090:new(_argt)
    CButtonPlayerMove090.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection090() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove135 = CButtonArrow135:extend() -- generic player move 135 button
function CButtonPlayerMove135:new(_argt)
    CButtonPlayerMove135.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection135() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove180 = CButtonArrow180:extend() -- generic player move 180 button
function CButtonPlayerMove180:new(_argt)
    CButtonPlayerMove180.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection180() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove225 = CButtonArrow225:extend() -- generic player move 225 button
function CButtonPlayerMove225:new(_argt)
    CButtonPlayerMove225.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection225() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove270 = CButtonArrow270:extend() -- generic player move 270 button
function CButtonPlayerMove270:new(_argt)
    CButtonPlayerMove270.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection270() end
    self:argt(_argt) -- override if any
end

CButtonPlayerMove315 = CButtonArrow315:extend() -- generic player move 315 button
function CButtonPlayerMove315:new(_argt)
    CButtonPlayerMove315.super.new(self, _argt)
    self.behaviour      = IButtonPlayerMove.BEHAVIOUR
    self.clicklf        = function() Tic:moveDirection315() end
    self:argt(_argt) -- override if any
end


--
-- IButtonMessage
--
IButtonMessage = Classic:extend() -- messages buttons implementation
IButtonMessage.BEHAVIOUR = function(self) -- need at least one message
    IButton.BEHAVIOUR(self)
    if not self.display then return end -- no message
    self.enabled = (Tic:messageCount() > 0)
end


--
-- IButtonMessageChange
--
IButtonMessageChange = Classic:extend() -- message change buttons implementation
IButtonMessageChange.BEHAVIOUR = function(self) -- need at least more than one message
    IButtonMessage.BEHAVIOUR(self)
    if not self.display then return end -- no message
    self.enabled = (Tic:messageCount() > 1)
end


--
-- CButtonMessagePrev
--
CButtonMessagePrev = CButtonArrow000:extend() -- generic message prev button
CButtonMessagePrev.BEHAVIOUR = function(self)
    IButtonMessageChange.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.hovertextup    = CHoverTextUP{text = Tic.TEXTPREV}
        self.clicklf        = Tic.FUNCTIONMESSAGEPREV
        self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTFIRST}
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
    self:argt(_argt) -- override if any
end


--
-- CButtonMessageNext
--
CButtonMessageNext = CButtonArrow180:extend() -- generic message next button
CButtonMessageNext.BEHAVIOUR = function(self)
    IButtonMessageChange.BEHAVIOUR(self)
    if not self.display then return end
    if self.enabled then
        self.hovertextup    = CHoverTextUP{text = Tic.TEXTNEXT}
        self.clicklf        = Tic.FUNCTIONMESSAGENEXT
        self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTLAST}
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
    self:argt(_argt) -- override if any
end


--
-- CButtonMessageTrash
--
CButtonMessageTrash = CButtonClick:extend() -- generic message trash button
Classic.KINDBUTTONMESSAGETRASH = "ButtonMessageTrash"
Classic.NAMEBUTTONMESSAGETRASH = "ButtonMessageTrash"
function CButtonMessageTrash:new(_argt)
    CButtonMessageTrash.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGETRASH
    self.name = Classic.NAMEBUTTONMESSAGETRASH
    self.drawborder     = false
    self.drawground     = false
	self.sprite.sprite  = CSpriteBG.SIGNDELETE
	self.behaviour      = IButtonMessage.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTDELONE}
    self.clicklf        = Tic.FUNCTIONMESSAGEDELONE
    self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTDELALL}
    self.clicklfmdk     = Tic.FUNCTIONMESSAGEDELALL
    self:argt(_argt) -- override if any
end


--
-- CButtonMessageHover
--
CButtonMessageHover = CButtonClick:extend() -- generic message hover button
Classic.KINDBUTTONMESSAGEHOVER = "ButtonMessageHover"
Classic.NAMEBUTTONMESSAGEHOVER = "ButtonMessageHover"
function CButtonMessageTrash:new(_argt)
    CButtonMessageHover.super.new(self, _argt)
    self.kind = Classic.KINDBUTTONMESSAGEHOVER
    self.name = Classic.NAMEBUTTONMESSAGEHOVER
    self.drawborder     = false
    self.drawground     = false
	self.sprite.sprite  = CSpriteBG.SIGNDELETE
	self.behaviour      = IButtonMessage.BEHAVIOUR  -- function to trigger at first
    self.hovertextup    = CHoverTextUP{text = Tic.TEXTDELONE}
    self.clicklf        = Tic.FUNCTIONMESSAGEDELONE
    self.hovertextupmdk = CHoverTextUP{text = Tic.TEXTDELALL}
    self.clicklfmdk     = Tic.FUNCTIONMESSAGEDELALL
    self:argt(_argt) -- override if any
end
