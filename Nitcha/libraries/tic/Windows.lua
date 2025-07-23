--
-- CWindow
--
CWindow = CElement:extend() -- generic window element
Classic.KINDWINDOW = "Window" -- Window kind
Classic.NAMEWINDOW = "Window" -- Window name
function CWindow:new(_argt)
    CWindow.super.new(self, _argt)
    self.kind = Classic.KINDWINDOW
    self.name = Classic.NAMEWINDOW
    self.drawguides = false
    self:argt(_argt) -- override if any
end


--
-- CWindowScreen
--
CWindowScreen = CWindow:extend() -- window screen
Classic.KINDWINDOWSCREEN = "WindowScreen" -- Window kind
Classic.NAMEWINDOWSCREEN = "WindowScreen" -- Window name
function CWindowScreen:new(_argt)
    CWindowScreen.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSCREEN
    self.name = Classic.NAMEWINDOWSCREEN
    self.drawcaches = false
    self.drawframes = false
    self:argt(_argt) -- override if any
end


--
-- CWindowMenu
--
CWindowMenu = CWindowScreen:extend() -- window menu
Classic.KINDWINDOWMENU = "WindowMenu" -- Window kind
Classic.NAMEWINDOWMENU = "WindowMenu" -- Window name
function CWindowMenu:new(_argt)
    CWindowMenu.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWMENU
    self.name = Classic.NAMEWINDOWMENU
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CWindowMenu:adjustWH()
    local _content = self:content()
    self.screenw   = _content.sizew
    self.screenh   = _content.sizeh
end

function CWindowMenu:content()
    local _maxsizew = 0
    local _maxsizeh = 0
    local _totsizeh = 0
    local _elements = {}
    for _, _element in ipairs(self.elements or {}) do
        if _element:behave() and _element.enabled then -- take element in account ?
            local _sizewh = _element:sizeWH()
            _maxsizew = Nums:max(_maxsizew, _sizewh.sizew)
            _maxsizeh = Nums:max(_maxsizeh, _sizewh.sizeh)
            _totsizeh =_totsizeh + _sizewh.sizeh
            Tables:valInsert(_elements, _element)
        end
    end
    local _size = Tables:size(_elements)
    _totsizeh = (self.stretch) and _maxsizeh * _size or _totsizeh
    _totsizeh = (_size > 0) and _totsizeh + (self.separatory * (_size - 1)) or _totsizeh
    return {
        size = _size,
        elements = _elements,
        sizew = self.marginlf + _maxsizew + self.marginrg,
        sizeh = self.marginup + _totsizeh + self.margindw,
        maxsizew = _maxsizew,
        maxsizeh = _maxsizeh,
        totsizeh = _totsizeh
    }
end

function CWindowMenu:drawInside()
    local _content = self:content()
    local _screenx = self.screenx + self.marginlf
    local _screeny = self.screeny + self.marginup
    for _, _element in ipairs(_content.elements or {}) do
        _element.screenx = _screenx
        _element.screeny = _screeny
        if self.stretch then
            _element.screenw = _content.maxsizew
            _element.screenh = _content.maxsizeh
        end
        _screeny = _screeny + _element.screenh + self.separatory
        _element:draw()
    end
    self.parent:appendElements(_content.elements)
end


--
-- CWindowMenuInteractions
--
CWindowMenuInteractions = CWindowMenu:extend() -- window menu interactions
Classic.KINDWINDOWMENUINTERACTIONS = "WindowMenuInteractions" -- Window kind
Classic.NAMEWINDOWMENUINTERACTIONS = "WindowMenuInteractions" -- Window name
CWindowMenuInteractions.BEHAVIOUR = function(self)
    self.display = (Tic:playerActual()) and true or false
    if not self.display then return end
    self.display = Tic:playerActual():canInteract()
end
function CWindowMenuInteractions:new(_argt)
    CWindowMenuInteractions.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWMENUINTERACTIONS
    self.name = Classic.NAMEWINDOWMENUINTERACTIONS
    self.stretch    = true
    self.drawframes = true
    self.drawborder = false
    self.behaviour = CWindowMenuInteractions.BEHAVIOUR
    self:argt(_argt) -- override if any
    self:adjustWH()
end

function CWindowMenuInteractions:draw()
    self:save()
    self:adjustXY()
    CWindowMenuInteractions.super.draw(self)
    self:load()
end 

function CWindowMenuInteractions:adjustXY()
    local _element = CElement{
        screenx = Tic.INTERACTIONSWX,
        screeny = Tic.INTERACTIONSWY,
        screenw = Tic.INTERACTIONSWW,
        screenh = Tic.INTERACTIONSWH,
    }
    _element:alignElementDirection(self, Tic.DIR000)
end


--
-- CWindowInfos
--
CWindowInfos = CWindow:extend() -- window infos
Classic.KINDWINDOWINFOS = "WindowInfos" -- Window kind
Classic.NAMEWINDOWINFOS = "WindowInfos" -- Window name
function CWindowInfos:new(_argt)
    CWindowInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOS
    self.name = Classic.NAMEWINDOWINFOS
    self.drawcaches  = false
    self.drawborder  = false
    self.colorground = Tic.COLORBIOMENIGHT
    self:argt(_argt) -- override if any
end

function CWindowInfos:drawInside()
    local _offsety = 0
    for _, _text in pairs(self.elements) do
        self:alignElementDirection(_text, self.align)
        _text.screeny = _text.screeny + _offsety
        _text:draw()
        _offsety = _offsety + _text.screenh
    end
end


--
-- IWindowEntity
--
IWindowEntity = Classic:extend() -- entities windows implementation
IWindowEntity.BEHAVIOUR = function(self)
    self.drawinside = (self.entity) and true or false
end


--
-- CWindowInfosEntity
--
CWindowInfosEntity = CWindowInfos:extend() -- window infos for entities
function CWindowInfosEntity:new(_argt)
    CWindowInfosEntity.super.new(self, _argt)
    self.align  = Tic.DIR000
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowInfosEntity:drawInside() -- window infos content for entities
    if not self.entity then return end -- nothing to draw
    local _name = CText{text = self.entity.name, case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _kind = CText{text = self.entity.kind, case = Names.CASECAMEL, shadow = true, marginup = 2}
    self.elements = {_name, _kind}
    CWindowInfosEntity.super.drawInside(self)
end


--
-- IWindowPlayer
--
IWindowPlayer = Classic:extend() -- players windows implementation
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowPlayerInfos
--
CWindowPlayerInfos = CWindowInfosEntity:extend() -- window infos for player
function CWindowPlayerInfos:new(_argt)
    CWindowPlayerInfos.super.new(self, _argt)
    self.screenx   = Tic.PLAYERINFOSWX
    self.screeny   = Tic.PLAYERINFOSWY
    self.screenw   = Tic.PLAYERINFOSWW
    self.screenh   = Tic.PLAYERINFOSWH
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowPortrait
--
CWindowPortrait = CWindow:extend() -- window portrait
function CWindowPortrait:new(_argt)
    CWindowPortrait.super.new(self, _argt)
    self.screenw     = Tic.PLAYERPORTRAITWW -- sizes
    self.screenh     = Tic.PLAYERPORTRAITWH
    self.colorground = Tic.COLORBIOMENIGHT
    self.drawborder  = false
    self.cachestick  = Tic.SPRITESIZE * Tic.SCALE02 -- caches thickness
    self:argt(_argt) -- override if any
end

function CWindowPortrait:drawGround() -- window portrait ground
    self.colorground = Tic:biomeActual()
    CWindowPortrait.super.drawGround(self)
end


--
-- CWindowPortraitDrawable
--
CWindowPortraitDrawable = CWindowPortrait:extend() -- window portrait for -- [!] drawable entities
function CWindowPortraitDrawable:new(_argt)
    CWindowPortraitDrawable.super.new(self, _argt)
    self.idle   = false --false -- idle portait or not
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowPortraitDrawable:drawInside() -- window portrait content for -- [!] drawable entities
    if not self.entity then return end -- nothing to draw
    local _tichitboxdraw     = Tic.HITBOXDRAW
    Tic.HITBOXDRAW           = false -- FIXME remove tic master at one point
    self.entity:save()
    self.entity.screenx      = self.screenx -- force entity attributes
    self.entity.screeny      = self.screeny
    self.entity.scale        = Tic.SCALE02
    self.entity.drawdirs     = false
    self.entity.drawview     = false
    self.entity.interactto   = nil -- dont draw interactto in window
    self.entity.interactby   = {}  -- dont draw interactby in window
    self.entity.portraitmode = true -- avoid some drawings in portraitmode
    self.entity.spotted      = false -- dont draw spotted frame in window
    self.entity.hovered      = false -- dont draw hovered frame in window
    if self.idle then
        self.entity.dirx       = Tic.DIRXRG --Tic.DIRXLF
        self.entity.frame      = CSprite.FRAME00
        self.entity.animations = {}
    end
    self.entity:draw()
    self.entity:load()
    Tic.HITBOXDRAW = _tichitboxdraw
end


--
-- CWindowPlayerPortrait
--
CWindowPlayerPortrait = CWindowPortraitDrawable:extend() -- window portrait for player
function CWindowPlayerPortrait:new(_argt)
    CWindowPlayerPortrait.super.new(self, _argt)
    self.screenx   = Tic.PLAYERPORTRAITWX
    self.screeny   = Tic.PLAYERPORTRAITWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowPlayerPortrait:drawInside()
    self.entity = Tic:playerActual()
    CWindowPlayerPortrait.super.drawInside(self)
end


--
-- CWindowStats
--
CWindowStats = CWindow:extend() -- window stats
function CWindowStats:new(_argt)
    CWindowStats.super.new(self, _argt)
    self.screenw     = Tic.PLAYERSTATSWW -- sizes
    self.screenh     = Tic.PLAYERSTATSWH
    self.colorground = Tic.COLORBIOMENIGHT
    self.colorborder = Tic.COLORWHITE
    self.drawcaches  = false
    self.drawborder  = false
    self:argt(_argt) -- override if any
end


--
-- CWindowStatsCharacter
--
CWindowStatsCharacter = CWindowStats:extend() -- window stats for -- [!] characters
function CWindowStatsCharacter:new(_argt)
    CWindowStatsCharacter.super.new(self, _argt)
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowStatsCharacter:drawInside() -- window stats content for -- [!] characters
    rect ( -- phy act bar
        self.screenx + 02,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statphyact + 1,
        06,
        self.entity.statphyact,
        self.entity:colorPhyAct()
    )
    rect ( -- men act bar
        self.screenx + 10,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statmenact + 1,
        06,
        self.entity.statmenact,
        self.entity:colorMenAct()
    )
    rect ( -- psy act bar
        self.screenx + 18,
        self.screeny + 02 + Tic.STATSMAX - self.entity.statpsyact + 1,
        06,
        self.entity.statpsyact,
        self.entity:colorPsyAct()
    )

    rectb( -- phy bar border
        self.screenx + 02,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )
    rectb( -- men bar border
        self.screenx + 10,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )
    rectb( -- psy bar border
        self.screenx + 18,
        self.screeny + 02,
        06,
        12,
        self.colorborder
    )

    rectb( -- phy max line
        self.screenx + 02,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statphymax,
        06,
        01,
        self.colorborder
    )
    rectb( -- men max line
        self.screenx + 10,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statmenmax,
        06,
        01,
        self.colorborder
    )
    rectb( -- psy max line
        self.screenx + 18,
        self.screeny + 03 + Tic.STATSMAX - self.entity.statpsymax,
        06,
        01,
        self.colorborder
    )
end


--
-- CWindowPlayerStats
--
CWindowPlayerStats = CWindowStatsCharacter:extend() -- window stats for player
function CWindowPlayerStats:new(_argt)
    CWindowPlayerStats.super.new(self, _argt)
    self.screenx   = Tic.PLAYERSTATSWX
    self.screeny   = Tic.PLAYERSTATSWY
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowPlayerState
--
CWindowPlayerState = CWindowInfos:extend() -- window state for player
function CWindowPlayerState:new(_argt)
    CWindowPlayerState.super.new(self, _argt)
    self.screenx   = Tic.PLAYERSTATEWX
    self.screeny   = Tic.PLAYERSTATEWY
    self.screenw   = Tic.PLAYERSTATEWW
    self.screenh   = Tic.PLAYERSTATEWH
    self.align     = Tic.DIR000
	self.entity    = Tic:playerActual()
	self.behaviour = IWindowPlayer.BEHAVIOUR
    self:argt(_argt) -- override if any
end

function CWindowPlayerState:drawInside() -- window state content for player
    if not self.entity then return end -- nothing to draw
    local _posture = CText{text = self.entity:postureGet(), case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _status  = CText{text = self.entity:statusGet(), case = Names.CASECAMEL, shadow = true, marginup = 2}
    self.elements = {_posture, _status}
    CWindowPlayerState.super.drawInside(self)
end


--
-- IWindowPlayer
--
IWindowPlayer = Classic:extend() -- players windows implementation
IWindowPlayer.BEHAVIOUR = function(self)
    self.entity = Tic:playerActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- IWindowSpotting
--
IWindowSpotting = Classic:extend() -- spotting windows implementation
IWindowSpotting.BEHAVIOUR = function(self)
    self.entity = Tic:spottingActual()
    IWindowEntity.BEHAVIOUR(self)
end


--
-- CWindowSpottingInfos
--
CWindowSpottingInfos = CWindowInfosEntity:extend() -- window infos for spotting
Classic.KINDWINDOWSPOTTINGINFOS = "WindowSpottingInfos" -- WindowSpottingInfos kind
function CWindowSpottingInfos:new(_argt)
    CWindowSpottingInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSPOTTINGINFOS
    self.screenx   = Tic.SPOTTINGINFOSWX
    self.screeny   = Tic.SPOTTINGINFOSWY
    self.screenw   = Tic.SPOTTINGINFOSWW
    self.screenh   = Tic.SPOTTINGINFOSWH
    self.behaviour = IWindowSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowSpottingPortrait
--
CWindowSpottingPortrait = CWindowPortraitDrawable:extend() -- window portrait for spotting
Classic.KINDWINDOWSPOTTINGPORTRAIT = "WindowSpottingPortrait" -- WindowSpottingPortrait kind
function CWindowSpottingPortrait:new(_argt)
    CWindowSpottingPortrait.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSPOTTINGPORTRAIT
    self.screenx   = Tic.SPOTTINGPORTRAITWX
    self.screeny   = Tic.SPOTTINGPORTRAITWY
    self.screenw   = Tic.SPOTTINGPORTRAITWW
    self.screenh   = Tic.SPOTTINGPORTRAITWH
    self.behaviour = IWindowSpotting.BEHAVIOUR
    self:argt(_argt) -- override if any
end


--
-- CWindowWorld
--
CWindowWorld = CWindow:extend() -- window world
function CWindowWorld:new(_argt)
    CWindowWorld.super.new(self, _argt)
    self.screenx         = Tic.WORLDWX -- positions
    self.screeny         = Tic.WORLDWY
    self.screenw         = Tic.WORLDWW -- sizes
    self.screenh         = Tic.WORLDWH
    self.colorground     = Tic.COLORBIOMENIGHT
    self:argt(_argt) -- override if any
end

function CWindowWorld:drawGround() -- window world ground
    self.colorground = Tic:biomeActual()
    CWindowWorld.super.drawGround(self)
end

function CWindowWorld:drawInside() -- window world content
    self:drawPlayerActual()
end

function CWindowWorld:drawPlayerActual()
    local _playeractual     = Tic:playerActual()
    if not _playeractual then return end
    local _playerlocationsaround = _playeractual:locationsAround()
    local _playerregionviewworld = _playeractual:regionViewWorld()
    local _playerregionmindworld = _playeractual:regionMindWorld()
    local _playernearestentity   = _playeractual:nearestEntityViewWorld() -- nearest entity if any -- except itself

    _playeractual:hoverEntity() -- unhover

    if not _playeractual:entitySpotting() -- spot the nearest entity if nothing else spotted
    or not _playeractual:isSpottingLock()
    then
        _playeractual:spotEntity(_playernearestentity)
    end

    if  _playeractual:entitySpotting() -- interact
    and _playeractual:entitySpotting():hasInteractions()
    and _playeractual:regionWorld():directionRegion(_playeractual:entitySpotting():regionWorld()) == Tic.DIRHIT
    then
        _playeractual:interacttoAppend(_playeractual:entitySpotting())
    else
        _playeractual:interacttoDelete()
    end
    
    for _, _keyy in pairs(Tables:keys(_playerlocationsaround)) do -- draw entities -- sorted by y first
        for _, _keyx in pairs(Tables:keys(_playerlocationsaround[_keyy])) do -- sorted by x next
            for _entity, _ in pairs(_playerlocationsaround[_keyy][_keyx]) do -- entities around actual player
                local _entityregionworld = _entity:regionWorld()

                _entity.hovered = false -- unhover all entities

                _entity.spotted = (_playeractual:isSpottingSpot() -- unspot all entities except spotting one if any
                and _entity == _playeractual:entitySpotting())
                    and true
                    or  false

                if _playerregionviewworld:hasInsideRegion(_entityregionworld) then -- draw mode -- in view
                    _entity.discovered = true
                    _entity.drawfade = false
                else -- not in view
                    _entity.drawfade = true
                end

                if (_playerregionviewworld:hasInsideRegion(_entityregionworld)) -- draw entity ?
                or (_playerregionmindworld:hasInsideRegion(_entityregionworld))
                then
                    if _entity.discovered then -- only discovered entities
                        _entity:adjustScreenXYRelativeToEntity(_playeractual)
                        local _entityregionscreen = _entity:regionScreen()

                        _entity:draw()

                        if  _playeractual.spottingpick -- if in pick mode
                        and not (_entity == _playeractual) -- except itself
                        and _entityregionscreen:hasInsidePoint(Tic:mousePointX(), Tic:mousePointY()) -- hovering something ?
                        and not _playeractual.hovering then -- hover only one
                            _playeractual:hoverEntity(_entity)

                            local _playerfind = Tic:playerFind(_entity)
                            Tic:logAppend("player", _playerfind)
                            if _playerfind then
                                local _picktext = CText{text = Tic.TEXTPICK, colorinside = Tic.COLORHOVER}
                                _picktext.screenx = _entity.screenx - ((_picktext.screenw - Tic.SPRITESIZE) // 2)
                                _picktext.screeny = _entity.screeny - _picktext.screenh
                                _picktext:draw()

                                if Tic.MOUSE.clicklf then
                                    Tic.MOUSE.clicklf = false -- avoid bouncing
                                    Tic:mouseDelay(10)
                                    
                                    Tic:playerPick(_entity)
                                end
                            end

                            local _locking  = (_playeractual.spottinglock and _playeractual.spotting == _entity) -- already locking ?
                            local _locktext = (_locking)
                                and CText{text = Tic.TEXTUNLOCK, colorinside = Tic.COLORHOVER}
                                or  CText{text = Tic.TEXTLOCK, colorinside = Tic.COLORHOVER}
                            _locktext.screenx = _entity.screenx - ((_locktext.screenw - Tic.SPRITESIZE) // 2)
                            _locktext.screeny = _entity.screeny + Tic.SPRITESIZE
                            _locktext:draw()

                            if Tic.MOUSE.clickrg then
                                Tic.MOUSE.clickrg = false -- avoid bouncing
                                Tic:mouseDelay(10)
                                
                                if _locking then -- unspot
                                    _playeractual:spotEntity()
                                    _playeractual.spottinglock = false
                                else -- spot
                                    _playeractual:spotEntity(_entity)
                                    _playeractual.spottinglock = true
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


--
-- CWindowInfosWorld
--
CWindowInfosWorld = CWindowInfos:extend() -- window infos for world
function CWindowInfosWorld:new(_argt)
    CWindowInfosWorld.super.new(self, _argt)
    self.screenx    = Tic.WORLDINFOSWX
    self.screeny    = Tic.WORLDINFOSWY
	self.screenw    = Tic.WORLDINFOSWW
	self.screenh    = Tic.WORLDINFOSWH
    self.drawborder = true
	self.align      = Tic.DIRHIT
    self:argt(_argt) -- override if any
end

function CWindowInfosWorld:drawInside() -- window infos content for world
    local _entity = Tic:worldActual()
    local _text   = CText{text = _entity.kind.." : ".._entity.name, small = false}
    self.elements = {_text}
    CWindowInfosWorld.super.drawInside(self)
end
