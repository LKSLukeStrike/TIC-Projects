require("lib/tic/CElement")
--
-- CWindow
--
CWindow = CElement:extend() -- generic window element
Classic.KINDWINDOW = "Window"
Classic.NAMEWINDOW = "Window"
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
Classic.KINDWINDOWSCREEN = "WindowScreen"
Classic.NAMEWINDOWSCREEN = "WindowScreen"
function CWindowScreen:new(_argt)
    CWindowScreen.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWSCREEN
    self.name = Classic.NAMEWINDOWSCREEN
    self.drawframes = false
    self:argt(_argt) -- override if any
end


--
-- CWindowMenu
--
CWindowMenu = CWindowScreen:extend() -- window menu
Classic.KINDWINDOWMENU = "WindowMenu"
Classic.NAMEWINDOWMENU = "WindowMenu"
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
    return _content
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
    local _content = self:adjustWH()
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
end


--
-- CWindowMenuInteractions
--
CWindowMenuInteractions = CWindowMenu:extend() -- window menu interactions
Classic.KINDWINDOWMENUINTERACTIONS = "WindowMenuInteractions"
Classic.NAMEWINDOWMENUINTERACTIONS = "WindowMenuInteractions"
CWindowMenuInteractions.BEHAVIOUR = function(self)
    local function _removeElements()
        self.parent:removeElements(self.elements) -- FIXME why parent ???
        -- self:removeElements(self.elements) -- FIXME doent seems to clean all
        self.elements   = {}
        self.interactto = nil
    end

    local function _debug()
        local _p = (Tic:playerActual().interactto) and Tic:playerActual().interactto.name or "none"
        local _s = (self.interactto) and self.interactto.name or "none"
        Tic:logAppend("P", _p, "S", _s)
    end

    -- _debug()
    local _playeractual = Tic:playerActual() -- no interaction -- cleanup menu
    self.display = (_playeractual) 
    if not self.display then _removeElements() ; return end
    self.display = _playeractual:canInteract()
    if not self.display then _removeElements() ; return end

    -- _debug()
    local _playerinteractto = _playeractual.interactto
    if (self.interactto) and self.interactto == _playerinteractto then return end -- same interactto -- no new menu
    _removeElements() -- brand new menu
    self.interactto     = _playerinteractto

    local _interactions = _playerinteractto.interactions
    for _, _interaction in ipairs (_interactions) do -- TODO add hover texts and handle lf rg buttons
        if (_interaction.interactiflf and _interaction:interactiflf(_playeractual, _playerinteractto))
        or (_interaction.interactifrg and _interaction:interactifrg(_playeractual, _playerinteractto)) then
            local _buttonmenu = CButtonMenuM2{
                name = _interaction.text,
                text = CText{text = _interaction.text},
            }
            if (_interaction.interactiflf and _interaction:interactiflf(_playeractual, _playerinteractto)) then
                _buttonmenu.clicklf = _interaction.interactdolf
                _buttonmenu.hovertextlf = _interaction.hovertextlf
            end
            if (_interaction.interactifrg and _interaction:interactifrg(_playeractual, _playerinteractto)) then
                _buttonmenu.clickrg = _interaction.interactdorg
                _buttonmenu.hovertextrg = _interaction.hovertextrg
            end
            self:appendElement(_buttonmenu)
        end
    end

    self:adjustWH()
    self:adjustXY()
end
function CWindowMenuInteractions:new(_argt)
    CWindowMenuInteractions.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWMENUINTERACTIONS
    self.name = Classic.NAMEWINDOWMENUINTERACTIONS
    self.stretch    = true
    self.drawframes = true
    self.drawborder = false
    self.behaviour = CWindowMenuInteractions.BEHAVIOUR
    self.interactto = nil -- current interactto if any
    self:argt(_argt) -- override if any
    self:adjustWH()
    self:adjustXY()
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
Classic.KINDWINDOWINFOS = "WindowInfos"
Classic.NAMEWINDOWINFOS = "WindowInfos"
function CWindowInfos:new(_argt)
    CWindowInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOS
    self.name = Classic.NAMEWINDOWINFOS
    self.drawborder  = false
    self.colorground = Tic.COLORBIOMENIGHT
    self:argt(_argt) -- override if any
end

function CWindowInfos:drawInside()
    local _offsety = 0
    for _, _element in ipairs(self.elements) do
        if Classic:thatis(_element, CTextLine) then
            self:alignElementDirection(_element, self.align)
            _element.screeny = _element.screeny + _offsety
            _offsety = _offsety + _element.screenh
        end
    end
    CWindowInfos.super.drawInside(self)
end


--
-- IWindowEntity
--
IWindowEntity = Classic:extend() -- entities windows implementation
IWindowEntity.BEHAVIOUR = function(self)
    self.elements = {}
    self.drawinside = (self.entity) 
end


--
-- CWindowInfosEntity
--
CWindowInfosEntity = CWindowInfos:extend() -- window infos for entities
Classic.KINDWINDOWINFOSENTITY = "WindowInfosEntity"
Classic.NAMEWINDOWINFOSENTITY = "WindowInfosEntity"
function CWindowInfosEntity:new(_argt)
    CWindowInfosEntity.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOSENTITY
    self.name = Classic.NAMEWINDOWINFOSENTITY
    self.align  = Tic.DIR000
	self.entity = nil -- override
    self:argt(_argt) -- override if any
end

function CWindowInfosEntity:drawInside() -- window infos content for entities
    if not self.entity then return end -- nothing to draw
    local _name = CTextLine{text = self.entity:nameGet(), case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _kind = CTextLine{text = self.entity:kindGet(), case = Names.CASECAMEL, shadow = true, marginup = 2}
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
Classic.KINDWINDOWPLAYERINFOS = "WindowPlayerInfos"
Classic.NAMEWINDOWPLAYERINFOS = "WindowPlayerInfos"
function CWindowPlayerInfos:new(_argt)
    CWindowPlayerInfos.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWPLAYERINFOS
    self.name = Classic.NAMEWINDOWPLAYERINFOS
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

    local _ticdrawhitbox     = Tic.DRAWHITBOX
    Tic.DRAWHITBOX           = false -- FIXME remove tic master at one point

    self.entity:drawPortrait({
            screenx    = self.screenx,
            screeny    = self.screeny,
            scale      = Tic.SCALE02,
            idle       = self.idle,
        }
    )

    Tic.DRAWHITBOX = _ticdrawhitbox
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
        self.screeny + 02 + Tic.STATMAX - self.entity:statphyactGet() + 1,
        06,
        self.entity:statphyactGet(),
        self.entity:colorPhyAct()
    )
    rect ( -- men act bar
        self.screenx + 10,
        self.screeny + 02 + Tic.STATMAX - self.entity:statmenactGet() + 1,
        06,
        self.entity:statmenactGet(),
        self.entity:colorMenAct()
    )
    rect ( -- psy act bar
        self.screenx + 18,
        self.screeny + 02 + Tic.STATMAX - self.entity:statpsyactGet() + 1,
        06,
        self.entity:statpsyactGet(),
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
        self.screeny + 03 + Tic.STATMAX - self.entity:statphymaxGet(),
        06,
        01,
        self.colorborder
    )
    rectb( -- men max line
        self.screenx + 10,
        self.screeny + 03 + Tic.STATMAX - self.entity:statmenmaxGet(),
        06,
        01,
        self.colorborder
    )
    rectb( -- psy max line
        self.screenx + 18,
        self.screeny + 03 + Tic.STATMAX - self.entity:statpsymaxGet(),
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
Classic.KINDWINDOWPLAYERSTATE = "WindowPlayerState"
Classic.NAMEWINDOWPLAYERSTATE = "WindowPlayerState"
function CWindowPlayerState:new(_argt)
    CWindowPlayerState.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWPLAYERSTATE
    self.name = Classic.NAMEWINDOWPLAYERSTATE
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
    local _posture = CTextLine{text = self.entity:postureGet(), case = Names.CASECAMEL, shadow = true, marginup = 1}
    local _status  = CTextLine{text = self.entity:statusGet(), case = Names.CASECAMEL, shadow = true, marginup = 2}
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
Classic.KINDWINDOWSPOTTINGINFOS = "WindowSpottingInfos"
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
Classic.KINDWINDOWSPOTTINGPORTRAIT = "WindowSpottingPortrait"
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

function CWindowSpottingPortrait:drawFrames()
    CWindowSpottingPortrait.super.drawFrames(self)
    if self.entity and self.entity.colortype then
        rect(self.screenx - 3, self.screeny - 3, 4, 4, self.entity.colortype)
    end
end

--
-- CWindowWorld
--
CWindowWorld = CWindow:extend() -- window world
Classic.KINDWINDOWWORLD = "WindowWorld"
Classic.NAMEWINDOWWORLD = "WindowWorld"
function CWindowWorld:new(_argt)
    CWindowWorld.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWWORLD
    self.name = Classic.NAMEWINDOWWORLD
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
    clip(self.screenx, self.screeny, self.screenw, self.screenh)
    self:drawPlayerActual()
    clip()
end

function CWindowWorld:drawPlayerActual()
    local _playeractual          = Tic:playerActual()
    if not _playeractual then return end
    local _playerlocationsaround = _playeractual:locationsAround() -- entities in world window
    local _playerregionviewworld = _playeractual:regionViewWorld() -- FIXME limity first ?
    local _playerregionmindworld = _playeractual:regionMindWorld()
    local _playernearestentity   = _playeractual:nearestEntityViewWorld() -- nearest entity if any -- except itself

    if _playeractual:entitySpotting() -- unspot entity if not anymore in world
    and not _playeractual:entitySpotting().world
    then
        _playeractual:spotEntity(nil)
        _playeractual:lockSpotting(false)
    end

    if not _playeractual:isSpottingLock() -- spot the nearest entity if not spotting lock -- FIXME something weird here
    or not _playeractual:entitySpotting() -- or nothing is spotted
    then
        _playeractual:spotEntity(_playernearestentity)
    end

    _playeractual:hoverEntity(nil) -- unhover

    _playeractual:interactbyRemoveAll()
    _playeractual:adjustInteract()
    
    for _, _keyy in pairs(Tables:keys(_playerlocationsaround)) do -- draw entities -- sorted by y first -- FIXME limit first ?
        for _, _keyx in pairs(Tables:keys(_playerlocationsaround[_keyy])) do -- sorted by x next
            for _entity, _ in pairs(_playerlocationsaround[_keyy][_keyx]) do -- entities around actual player
                local _entityregionworld = _entity:regionWorld()
                local _entityinview      = _playerregionviewworld:hasInsideRegion(_entityregionworld)
                local _entityinmind      = _playerregionmindworld:hasInsideRegion(_entityregionworld)

                if _entityinview -- handle entities in view/mind
                or _entityinmind then

                    if _entityinview then -- discovered ? (in view)
                        _entity.discovered = true
                    end

                    if _entity.discovered then -- handle only discovered entities

                        if  _playeractual:isSpottingSpot() -- unspot all entities except spotting one if any
                        and _playeractual:entitySpotting() == _entity then
                            _entity.spotted = true
                        else
                            _entity.spotted = false
                        end

                        if _entityinview then -- fade mode -- in view
                            _entity.drawfade = false
                        else -- in mind
                            _entity.drawfade = true
                        end

                        if  not (_entity == _playeractual) -- hover with mouse if any
                        and _playeractual.spottingpick
                        and _entity:isHovered()
                        and Tic:screenActual() == Tic:screenGetLast() then -- allows interactions only if top screen (no menus)
                            _playeractual:hoverEntity(_entity) -- give the entity a priority in spotting windows
                        end

                        _entity:adjustScreenXYRelativeToEntity(_playeractual)
                        _entity:draw()
                    end

                end
            end -- entities loop
        end -- x loop
    end -- y loop
end


--
-- CWindowInfosWorld
--
CWindowInfosWorld = CWindowInfos:extend() -- window infos for world
Classic.KINDWINDOWINFOSWORLD = "WindowInfosWorld"
Classic.NAMEWINDOWINFOSWORLD = "WindowInfosWorld"
function CWindowInfosWorld:new(_argt)
    CWindowInfosWorld.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWINFOSWORLD
    self.name = Classic.NAMEWINDOWINFOSWORLD
    self.screenx    = Tic.WORLDINFOSWX
    self.screeny    = Tic.WORLDINFOSWY
	self.screenw    = Tic.WORLDINFOSWW
	self.screenh    = Tic.WORLDINFOSWH
    self.drawborder = true
	self.align      = Tic.DIRHIT
    self.textline   = CTextLine{name = "WindowInfosWorldText", text = "", small = false}
    self.elements   = {self.textline}
    self:argt(_argt) -- override if any
end

function CWindowInfosWorld:drawInside() -- window infos content for world
    local _world  = Tic:worldActual()
    local _textline = (_world) and _world.kind.." : ".._world.name or ""
    self.textline:setText(_textline)
    CWindowInfosWorld.super.drawInside(self)
end


--
-- CWindowMessagesWorld
--
CWindowMessagesWorld = CWindowInfos:extend() -- window messages for world
Classic.KINDWINDOWMESSAGESWORLD = "WindowMessagesWorld"
Classic.NAMEWINDOWMESSAGESWORLD = "WindowMessagesWorld"
function CWindowMessagesWorld:new(_argt)
    CWindowMessagesWorld.super.new(self, _argt)
    self.kind = Classic.KINDWINDOWMESSAGESWORLD
    self.name = Classic.NAMEWINDOWMESSAGESWORLD
    self.screenx     = Tic.WORLDMESSAGESWX
    self.screeny     = Tic.WORLDMESSAGESWY
	self.screenw     = Tic.WORLDMESSAGESWW
	self.screenh     = Tic.WORLDMESSAGESWH
    self.drawborder  = true
	self.align       = Tic.DIR270
    -- self.clickable   = true
    self.buttonprev  = CButtonMessagePrev{}
    self.buttontrash = CButtonMessageTrash{}
    self.buttonnext  = CButtonMessageNext{}
    -- self.textline    = CTextLine{text = "", small = true, marginlf = 2}
    self.textline    = CButtonText{text = CText{text = "", small = true, marginlf = 2}}
    -- self.buttonhover = CButtonMessageHover{} -- button related to the wheel move if any
    self.textlf      = CText{
                text = "",
                stretch = false,
                align = Tic.DIR090,
                screenx = self.screenx - 1,
                screeny = self.screeny - 6,
                screenw = 18,
                screenh = 4,
                marginup = 1,
                marginrg = 1,
                drawground  = true,
                colorground = self.colorground,
                behaviour = function(self)
                    self.text = Tic.MESSAGES.maxindex
                end,
            }
    self.textrg      = CText{
                text = "",
                stretch = false,
                align = Tic.DIR090,
                screenx = self.screenx + self.screenw - 18,
                screeny = self.screeny - 6,
                screenw = 18,
                screenh = 4,
                marginup = 1,
                marginrg = 1,
                drawground  = true,
                colorground = self.colorground,
                behaviour = function(self)
                    self.text = Tic.MESSAGES.actindex
                end,
            }
    self.elements    = {
                        self.textlf,
                        self.buttonprev,
                        self.buttontrash,
                        self.buttonnext,
                        self.textrg,
                        self.textline,
                        self.buttonhover,
                       }
    self.behaviour   = function(self)
        local function _showTextLFRG()
            Tables:eachDo({self.textlf, self.textrg}, function(_, _element) _element.display = true end)
        end
        local function _hideTextLFRG()
            Tables:eachDo({self.textlf, self.textrg}, function(_, _element) _element.display = false end)
        end
        local function _anyHovered(_elements)
            return Tables:ifAny(_elements, function(_, _element) return _element.hovered end)
        end
        local function _hoveredElements(_elements)
            Tables:eachDo(_elements, function(_, _element) _element.hovered = true end)
            _showTextLFRG()
            self.colorborder = Tic.COLORGREYD
        end
        local function _anyActived(_elements)
            return Tables:ifAny(_elements, function(_, _element) return _element.actived end)
        end
        local function _activedElements(_elements)
            self.buttonprev.hovered = true
            self.buttonnext.hovered = true
            Tables:eachDo(_elements, function(_, _element) _element.actived = true end)
            _showTextLFRG()
            self.colorborder = Tic.COLORHOVERTEXTUP
        end

        local _messageactual = Tic:messageActual()
        local _textline = (_messageactual) and _messageactual or ""
        self.textline:setText(_textline)
        self.colorborder = Tic.COLORGREYM
        _hideTextLFRG()
        if Tic:messageCount() == 0 then return end

        -- if     _anyHovered{self} then
            Tic:logAppend("hover", self.hovered, Tables:valFind(Tic.BUTTONS, self))
        if  self.hovered then
        -- if     _anyHovered(self.elements) then
            _showTextLFRG()
        end
        -- elseif _anyHovered{self} and Tic:messageCount() >= 2 then
        --     _hoveredElements{self, self.buttonprev, self.buttonnext}
        -- elseif _anyHovered{self, self.buttonprev} then
        --     _hoveredElements{self, self.buttonprev}
        -- elseif _anyHovered{self, self.buttontrash} then
        --     _hoveredElements{self, self.buttontrash}
        -- elseif _anyHovered{self, self.buttonnext} then
        --     _hoveredElements{self, self.buttonnext}
        -- end

        if     _anyActived{self} and Tic:messageCount() == 1 then
            _showTextLFRG()
        elseif _anyActived{self} and Tic:messageCount() >= 2 then
            _activedElements{self, self.buttonhover}
        elseif _anyActived{self, self.buttonprev} then
            _activedElements{self, self.buttonprev}
        elseif _anyActived{self, self.buttontrash} then
            _activedElements{self, self.buttontrash}
        elseif _anyActived{self, self.buttonnext} then
            _activedElements{self, self.buttonnext}
        end
    end
    self:argt(_argt) -- override if any
    self:elementsDistributeH(
        {self.buttonprev, self.buttontrash, self.buttonnext},
        self.screenx + (
            (self.screenw - CScreen:elementsTotalW({self.buttonprev, self.buttontrash, self.buttonnext})) // 2),
        self.screeny - Tic.SPRITESIZE + 1
    )
end
