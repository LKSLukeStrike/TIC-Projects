require("lib/tic/CEntityDrawable")
--
-- CCharacter
--
CCharacter = CEntityDrawable:extend() -- characters
Classic.KINDCHARACTER = "Character"
Classic.NAMECHARACTER = "Character"
Tic.STATESETTINGS = { -- states settings
    [Tic.STATESTANDIDLE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATESTANDWORK] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATESTANDMOVE] = {
        posture = Tic.POSTURESTAND,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELIDLE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSIDLE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELWORK] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSWORK,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEKNEELMOVE] = {
        posture = Tic.POSTUREKNEEL,
        status  = Tic.STATUSMOVE,
        frequence = Tic.FREQUENCE0060,
    },
    [Tic.STATEFLOORSLEEP] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSLEEP,
        frequence = Tic.FREQUENCE0090,
    },
    [Tic.STATEFLOORBLEED] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBLEED,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORMAGIC] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSMAGIC,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORALCHE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSALCHE,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORKNOCK] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSKNOCK,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORFLAME] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSFLAME,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORWATER] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSWATER,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORSTONE] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSSTONE,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORBREEZ] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSBREEZ,
        frequence = Tic.FREQUENCE0030,
    },
    [Tic.STATEFLOORDEATH] = {
        posture = Tic.POSTUREFLOOR,
        status  = Tic.STATUSDEATH,
        frequence = Tic.FREQUENCE0120,
    },
}
Tic.POSTURESETTINGS = { -- postures settings
    [Tic.POSTURESTAND] = {
        bodyspriteoffset = 0,
        bodyoffsetx = 0,
        bodyoffsety = 0,
        headoffsetx = 0,
        headoffsety = 0,
        headusesize = true,
        rotate = Tic.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREKNEEL] = {
        bodyspriteoffset = 4,
        bodyoffsetx = 0,
        bodyoffsety = 0,
        headoffsetx = 0,
        headoffsety = 1,
        headusesize = true,
        rotate = Tic.ROTATE000,
        frame = nil, -- nil use self.frame
    },
    [Tic.POSTUREFLOOR] = {
        bodyspriteoffset = 0,
        bodyoffsetx = nil, -- nil use size
        bodyoffsety = 2,
        headoffsetx = 0,
        headoffsety = 2,
        headusesize = false,
        rotate = Tic.ROTATE090,
        frame = CSprite.FRAME01, -- fix frame
    },
}
Tic.STATUSSETTINGS = { -- statuses settings
    [Tic.STATUSIDLE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSWORK] = {
        bodyspriteoffset = 1,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSMOVE] = {
        bodyspriteoffset = 2,
        effectsprite = CSpriteFG.EFFECTEMPTY,
        palette0 = {},
        palette1 = {},
    },
    [Tic.STATUSSLEEP] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTSLEEP,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSBLEED] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORPURPLE, [Tic.COLORGREYL] = Tic.COLORRED,},
    },
    [Tic.STATUSMAGIC] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORBLUEM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORBLUEM, [Tic.COLORGREYL] = Tic.COLORCYAN,},
    },
    [Tic.STATUSALCHE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREENL, [Tic.COLORGREYL] = Tic.COLORGREENM,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREENM, [Tic.COLORGREYL] = Tic.COLORGREENL,},
    },
    [Tic.STATUSKNOCK] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSFLAME] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORORANGE, [Tic.COLORGREYL] = Tic.COLORRED,    [Tic.COLORGREYM] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORRED,    [Tic.COLORGREYL] = Tic.COLORORANGE, [Tic.COLORGREYM] = Tic.COLORPURPLE,},
    },
    [Tic.STATUSWATER] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORCYAN,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORCYAN,  [Tic.COLORGREYL] = Tic.COLORWHITE,}
    },
    [Tic.STATUSSTONE] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORGREYM, [Tic.COLORGREYL] = Tic.COLORGREYD,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYD, [Tic.COLORGREYL] = Tic.COLORGREYM,},
    },
    [Tic.STATUSBREEZ] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTWOUND,
        palette0 = {[Tic.COLORWHITE] = Tic.COLORWHITE, [Tic.COLORGREYL] = Tic.COLORGREYL,},
        palette1 = {[Tic.COLORWHITE] = Tic.COLORGREYL, [Tic.COLORGREYL] = Tic.COLORWHITE,},
    },
    [Tic.STATUSDEATH] = {
        bodyspriteoffset = 0,
        effectsprite = CSpriteFG.EFFECTDEATH,
        palette0 = {[Tic.COLORRED] = Tic.COLORRED,    [Tic.COLORPURPLE] = Tic.COLORPURPLE,},
        palette1 = {[Tic.COLORRED] = Tic.COLORPURPLE, [Tic.COLORPURPLE] = Tic.COLORRED,},
     },
}
function CCharacter:new(_argt)
    CCharacter.super.new(self, _argt)
    self.classic = CCharacter -- instance of
    self.kind    = Classic.KINDCHARACTER
    self.name    = Classic.NAMECHARACTER
    self.size         = Tic.SIZEM -- size
    self.frame        = CSprite.FRAME00 -- frame
    self.dirx         = Tic.DIRXLF -- directions
    self.diry         = Tic.DIRYMD
    self.direction    = Tic.DIR270
    self.state        = Tic.STATESTANDIDLE -- state
    self.movecycler   = CCyclerInt{maxindex = 59}  -- cycler to get back to idle after move
    self.workcycler   = CCyclerInt{maxindex = 179} -- cycler to animate work
    self.idlecycler   = CCyclerInt{maxindex = 179} -- cycler to activate idle animation
    self.hitbox       = CHitbox{entity = self, lf = 2, rg = 4, up = 5, dw = 7}
    self.hovering     = nil -- hovering entity if any
    self.spotting     = nil -- spotting entity if any
    self.spottingspot = false -- spot its spotting
    self.spottinglock = false -- lock its spotting
    self.spottingpick = false -- pick its spotting
    self.colorhairsfg = Tic.COLORHAIRSFG -- colors
    self.colorhairsbg = Tic.COLORHAIRSBG
    self.colorskin    = Tic.COLORSKIN
    self.colorextra   = self.colorskin --Tic.COLOREXTRA
    self.coloreyesfg  = Tic.COLORGREYL
    self.coloreyesbg  = Tic.COLORGREYM
    self.colorarmor   = Tic.COLORARMOR
    self.colorshirt   = Tic.COLORSHIRT
    self.colorpants   = Tic.COLORPANTS
    self.colorhands   = Tic.COLORHANDS
    self.bodysprite   = CSpriteFG.BODYHUMAN -- body
    self.headsprite   = CSpriteFG.HEADELVWE -- head
    self.eyessprite   = CSpriteFG.EYESHUMAN -- eyes
    self.statphymax   = 5 -- max stats -- 0-Tic.STATSMAX
    self.statmenmax   = 5
    self.statpsymax   = 5
    self.statphyact   = self.statphymax -- act stats -- 0-max
    self.statmenact   = self.statmenmax
    self.statpsyact   = self.statpsymax
    self.slots        = { -- character objects slots
                         exists = true, -- to check if already implemented
                         head = CSlotHead{},
                         back = CSlotBack{},
                         handlf = CSlotHandLF{},
                         handrg = CSlotHandRG{},
    }
    self.inventories  = { -- character standard inventories
                         exists = true, -- to check if already implemented
                         phy = CInventoryPhy{},
                         men = CInventoryMen{},
                         psy = CInventoryPsy{},
                        }
    self.interactions = {
                         CInteractionSayMessage{},
                        }
    self.party        = nil
    self:argt(_argt) -- override if any
    self.camera       = CCamera{name = self.name.." "..Classic.NAMECAMERA} -- one camera per character
    self:focus() -- focus its camera on itself
end

function CCharacter:argt(_argt)
    CCharacter.super.argt(self, _argt)
    if self.classic and self.classed and not (self.classic == self.classed) then return end -- limit to one classic if any
    self:adjustInventoriesSlots() -- adjust standard inventories sizes and contents + slots
end

function CCharacter:adjustInventoriesSlots()
    if not self.inventories then return end -- mandatory (argt)
    if not self.inventories.exists then return end -- ensure we already have inventories

    if not  self.inventories.any then self.inventories.any = CInventoryAny{} end
    local _inventoryany = self.inventories.any -- grab all objects
    local _inventoryphy = self.inventories.phy
    local _inventorymen = self.inventories.men
    local _inventorypsy = self.inventories.psy
    for _, _slot in pairs(self.slots or {}) do
        if CSlot:isSlot(_slot) then
            _inventoryany:appendObject(_slot.object)
            if not _slot:canAppendObject(_slot.object) then -- keep only if allowed
                _slot.object = nil
            end
        end
    end
    _inventoryphy:movetoInventory(_inventoryany)
    _inventorymen:movetoInventory(_inventoryany)
    _inventorypsy:movetoInventory(_inventoryany)

    for _, _object in ipairs(_inventoryany.objects) do -- delete from the world
        _object.discovered = true -- the object is discovered
        self.world:deleteEntity(_object)
    end

    _inventoryphy.objectsmax = self.statphymax -- adjust inventories limits
    _inventorymen.objectsmax = self.statmenmax
    _inventorypsy.objectsmax = self.statpsymax

    _inventoryany:movetoInventory(_inventoryphy) -- redispatch objects if possible
    _inventoryany:movetoInventory(_inventorymen)
    _inventoryany:movetoInventory(_inventorypsy)

    for _, _slot in pairs(self.slots or {}) do -- check if objects in slots are still available
        if CSlot:isSlot(_slot) then
            if Tables:valFind(_inventoryany.objects, _slot.object) then _slot.object = nil end
        end
    end

    self.inventories.any = nil -- get rid of extra objects
end

function CCharacter:slotDropAll()
    self:slotDropHead()
    self:slotDropBack()
    self:slotDropHandRG()
    self:slotDropHandLF()
end

function CCharacter:slotGetHead()
    return self.slots.head
end

function CCharacter:slotGetBack()
    return self.slots.back
end

function CCharacter:slotGetHandRG()
    return self.slots.handrg
end

function CCharacter:slotGetHandLF()
    return self.slots.handlf
end

function CCharacter:slotGetHeadObject()
    return self:slotGetHead().object
end

function CCharacter:slotGetBackObject()
    return self:slotGetBack().object
end

function CCharacter:slotGetHandRGObject()
    return self:slotGetHandRG().object
end

function CCharacter:slotGetHandLFObject()
    return self:slotGetHandLF().object
end

function CCharacter:slotSetHeadObject(_object)
    self:slotGetHead().object = _object
	return _object
end

function CCharacter:slotSetBackObject(_object)
    self:slotGetBack().object = _object
	return _object
end

function CCharacter:slotSetHandRGObject(_object)
    self:slotGetHandRG().object = _object
	return _object
end

function CCharacter:slotSetHandLFObject(_object)
    self:slotGetHandLF().object = _object
	return _object
end

function CCharacter:slotDropHead()
    local _object = self:slotGetHeadObject()
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropBack()
    local _object = self:slotGetBackObject()
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropHandRG()
    local _object = self:slotGetHandRGObject()
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:slotDropHandLF()
    local _object = self:slotGetHandLFObject()
    if not _object then return end
	return self:dropObject(_object)
end

function CCharacter:dropObject(_object, _withmessage)
    if not _object then return end
    _withmessage = _withmessage or true

    local _whatinventory = _object:findWhatInventory(self.inventories)
    if not _whatinventory then return end -- does not have the object
    _whatinventory:removeObject(_object)

    local _whatslot = _object:findWhatSlot(self.slots)
    if _whatslot then _whatslot:removeObject(_object, true) end -- free a slot if any

    local _direction = self.direction -- prepare the trials for dropping
    Tic.DIRSCYCLER:at(Tables:valFind(Tic.DIRSCYCLER.acttable, _direction))
    local _actindex = Tic.DIRSCYCLER.actindex
    local _next = (self.dirx == Tic.DIRXRG)  -- rotating direction -- next or prev
    local _trials = {}
    repeat
        _direction = Tic.DIRSCYCLER.actvalue
        local _dropx = Tic.DIRSOFFSETS[_direction].dropx
        local _dropy = Tic.DIRSOFFSETS[_direction].dropy
        Tables:valInsert(_trials, {worldx = self.worldx + _dropx, worldy = self.worldy + _dropy})
        if _next then Tic.DIRSCYCLER:next() else Tic.DIRSCYCLER:prev() end
    until Tic.DIRSCYCLER.actindex == _actindex

    _object.worldx = self.worldx -- drop the object
    _object.worldy = self.worldy
    _object.dirx = self.dirx
    self.world:appendEntity(_object, Tic.SPRITESIZE, _trials)
 
    if _withmessage then Tic:messageAppend(self.name.." "..Tic.TEXTDROP..": ".._object.kind.." ".._object.name) end

    return _object
end

function CCharacter:objectsofSlotType(_slottype)
    local _result = {}
    for _, _inventory in pairs(self.inventories or {}) do
        if CInventory:isInventory(_inventory) then
            local _objectsofslottype = _inventory:objectsofSlotType(_slottype)
            _result = Tables:imerge(_result, _objectsofslottype, true)
        end
    end
    return _result
end

function CCharacter:pickObject(_object, _withmessage)
    if not _object then return end
    _withmessage = _withmessage or true

    local _inventory = _object:findFreeInventory(self.inventories)
    if not _inventory then return end -- no inventory left
    _inventory:appendObject(_object)

    local _slot = _object:findFreeSlot(self.slots)
    if _slot then _slot:appendObject(_object, true) end

    self.world:deleteEntity(_object)

    if _withmessage then Tic:messageAppend(self.name.." "..Tic.TEXTPICK..": ".._object.kind.." ".._object.name) end

    return _object
end

function CCharacter:colorPhyAct()
    if self.statphyact == 0              then return Tic.COLORSTAT0 end
    if self.statphyact > self.statphymax then return Tic.COLORPHYGT end
    if self.statphyact < self.statphymax then return Tic.COLORPHYLT end
    return Tic.COLORPHYEQ
end

function CCharacter:colorMenAct()
    if self.statmenact == 0              then return Tic.COLORSTAT0 end
    if self.statmenact > self.statmenmax then return Tic.COLORMENGT end
    if self.statmenact < self.statmenmax then return Tic.COLORMENLT end
    return Tic.COLORMENEQ
end

function CCharacter:colorPsyAct()
    if self.statpsyact == 0              then return Tic.COLORSTAT0 end
    if self.statpsyact > self.statpsymax then return Tic.COLORPSYGT end
    if self.statpsyact < self.statpsymax then return Tic.COLORPSYLT end
    return Tic.COLORPSYEQ
end

function CCharacter:hoverEntity(_entity) -- hover an entity, use nil to unhover
    if _entity then
        if self.hovering then self.hovering.hovered = false end -- unhover previous if any
        _entity.hovered = true
        self.hovering = _entity
    else
        if self.hovering then self.hovering.hovered = false end -- unhover previous if any
        self.hovering = nil
    end
end

function CCharacter:spotEntity(_entity) -- spot an entity, use nil to unspot
    if _entity then
        if self.spotting then self.spotting.spotted = false end -- unspot previous if any
        _entity.spotted = true
        self.spotting = _entity
    else
        if self.spotting then self.spotting.spotted = false end -- unspot previous if any
        self.spotting = nil
    end
end

function CCharacter:postureGet() -- state posture
    return Tic.STATESETTINGS[self.state].posture
end

function CCharacter:statusGet() -- state status
    return Tic.STATESETTINGS[self.state].status
end

function CCharacter:stateSet(_posture, _status) -- set state from posture and status
    if not _posture or not _status then return end -- mandatory
    self.state = _posture.._status -- simple concatenation
end

function CCharacter:regionViewOffsets() -- view offsets region depending on dirx, diry, statphyact and posture
    local _stat          = self.statphyact
    local _posture       = self:postureGet()
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _range         = (_posturekneel) and Tic.WORLDWH // 2 or Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_range - _size) // 2) - 1) * (_stat / Tic.STATSMAX))

    return CRegion{
        lf  = (self.dirx == Tic.DIRXLF)
            and Nums:neg(_offsets)
            or  0,
        rg  = (self.dirx == Tic.DIRXLF)
            and _size
            or  _size + _offsets,
        up  = (self.diry == Tic.DIRYUP)
            and Nums:neg(_offsets)
            or  (self.diry == Tic.DIRYMD)
                and Nums:neg(_offsets // 2)
                or  0,
        dw  = (self.diry == Tic.DIRYUP)
            and _size
            or  (self.diry == Tic.DIRYMD)
                and _size + (_offsets // 2)
                or  _size + _offsets,
    }
end

function CCharacter:regionViewScreen() -- view screen region depending on dirx, diry
    local _regionviewoffsets = self:regionViewOffsets()
    return _regionviewoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionViewWorld() -- view world region depending on dirx, diry
    local _regionviewoffsets = self:regionViewOffsets()
    return _regionviewoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:regionMindOffsets() -- mind offsets region depending on dirx, diry, statmenact
    local _stat          = self.statmenact
    local _posture       = self:postureGet()
    local _posturekneel  = _posture == Tic.POSTUREKNEEL
    local _size          = Tic.SPRITESIZE * self.scale
    local _range         = Tic.WORLDWH -- use world window height as range -- TODO change that later ?
    local _offsets       = Nums:roundint((((_range - _size) // 2) - 1) * (_stat / Tic.STATSMAX))

    return CRegion{
        lf  = Nums:neg(_offsets),
        rg  = _size + _offsets,
        up  = Nums:neg(_offsets),
        dw  = _size + _offsets,
    }
end

function CCharacter:regionMindScreen() -- mind screen region depending on dirx, diry
    local _regionmindoffsets = self:regionMindOffsets()
    return _regionmindoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionMindWorld() -- mind world region depending on dirx, diry
    local _regionmindoffsets = self:regionMindOffsets()
    return _regionmindoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback) -- move offsets region
    _direction     = _direction or self.direction
    local _offsets = self:offsetsDirection(_direction, _movenone,  _moveslow, _moveback)
    local _up      = 0
    local _dw      = Tic.SPRITESIZE * self.scale
    local _lf      = 0
    local _rg      = Tic.SPRITESIZE * self.scale

    if _direction == Tic.DIR000 then
        _up = _up + _offsets.offsety
    elseif _direction == Tic.DIR045 then
        _up = _up + _offsets.offsety
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR090 then
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR135 then
        _dw = _dw + _offsets.offsety
        _rg = _rg + _offsets.offsetx
    elseif _direction == Tic.DIR180 then
        _dw = _dw + _offsets.offsety
    elseif _direction == Tic.DIR225 then
        _dw = _dw + _offsets.offsety
        _lf = _lf + _offsets.offsetx
    elseif _direction == Tic.DIR270 then
        _lf = _lf + _offsets.offsetx
    elseif _direction == Tic.DIR315 then
        _up = _up + _offsets.offsety
        _lf = _lf + _offsets.offsetx
    end

    return CRegion{
        up  = _up,
        dw  = _dw,
        lf  = _lf,
        rg  = _rg,
    }
end

function CCharacter:regionMoveScreen(_direction, _movenone,  _moveslow, _moveback) -- move screen region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback)
    return _regionmoveoffsets:offsetXY(self.screenx, self.screeny)
end

function CCharacter:regionMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- move world region depending on movex, movey
    local _regionmoveoffsets = self:regionMoveOffsets(_direction, _movenone,  _moveslow, _moveback)
    return _regionmoveoffsets:offsetXY(self.worldx, self.worldy)
end

function CCharacter:locationsViewWorld() -- locations in itself view world
    return self.world:locationsRegion(self:regionViewWorld())
end

function CCharacter:entitiesViewWorld() -- entities in itself view world
    return CLocations:entities(self:locationsViewWorld())
end

function CCharacter:locationsMindWorld() -- locations in itself mind world
    return self.world:locationsRegion(self:regionMindWorld())
end

function CCharacter:entitiesMindWorld() -- entities in itself mind world
    return CLocations:entities(self:locationsMindWorld())
end

function CCharacter:locationsMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- locations in itself move world
    return self.world:locationsRegion(self:regionMoveWorld(_direction, _movenone,  _moveslow, _moveback))
end

function CCharacter:entitiesMoveWorld(_direction, _movenone,  _moveslow, _moveback) -- entities in itself move world
    return CLocations:entities(self:locationsMoveWorld(_direction, _movenone,  _moveslow, _moveback))
end

function CCharacter:nearestEntityViewWorld() -- nearest entity in itself view world, except itself
    local _result            = nil
    local _entitiesviewworld = self:entitiesViewWorld()

    for _entity, _ in pairs(_entitiesviewworld) do
        if not (_entity == self) then -- avoid to nearest itself
            if _result == nil then
                _result = _entity -- first nearest entity
            elseif self:distanceEntityFake(_entity) < self:distanceEntityFake(_result) then
                _result = _entity -- new nearest entity
            end
        end
    end

    return _result
end

function CCharacter:draw() -- set animations and draw layers
    Tic.LOGSPRITE = false
    self:cycle()
    self:drawDirs()

    self:drawHandBG()
    self:drawBackBG()
    self:drawBody()
    self:drawBackFG()
    self:drawHead()
    self:drawHandFG()
    self:drawEffect()
    self:drawParty()

    self:drawSpotted()
    self:drawHovered()
    self:drawBorders()
    self:drawHitbox()
    self:drawView()
    self:drawMind()
    self:drawMove()

    self:drawInteractTo()
    self:drawInteractBy()
    Tic.LOGSPRITE = false
end

function CCharacter:cycle() -- cycle the cyclers
    if self.portraitmode then return end -- no cycling in portraits etc
    self:cycleMove()
    self:cycleWork()
    self:cycleIdle()
end

function CCharacter:cycleMove() -- reset to idle after move
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status  == Tic.STATUSMOVE) then return end -- mandatory at move

    self.movecycler:next()
	if self.movecycler:isMAX() then -- trigger movecycler
		self:stateSet(_posture, Tic.STATUSIDLE)
	end
end

function CCharacter:cycleWork() -- animate work
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status == Tic.STATUSWORK) then return end -- mandatory at work

    self.workcycler:next()
	if self.workcycler:isGEH() then -- trigger workcycler
		self:toggleFrame()
	end
end

function CCharacter:cycleIdle() -- animate idle after a delay
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR then return end -- mandatory stand or kneel
    if not (_status == Tic.STATUSIDLE) then return end -- mandatory at idle

    self.idlecycler:next()
	if self.idlecycler:isMAX() then -- trigger idlecycler
		if Nums:random(Tic.STATSMAX) > self.statmenact then -- only if over statmenact
            self:moveDirection(Tables:valPickRandom(Tic.DIRSCYCLER.acttable), true)
        end
	end
end

function CCharacter:drawDirs() -- draw the directions and ranges around the character -- FIXME why actual player ???
    if self.portraitmode then return end -- not in portrait mode
    if not Tic.DRAWDIRS  then return end -- nothing to draw
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player

    local _drawcolor = Tic.COLORWHITE
    local _screenx   = Tic.WORLDWX + Tic.WORLDWW2 - (Tic:playerActual().worldx - self.worldx) - 1 --relative to actual player -- feet
    local _screeny   = Tic.WORLDWY + Tic.WORLDWH2 - (Tic:playerActual().worldy - self.worldy) + 2
    local _posture   = self:postureGet()
    local _range     = self.statphyact * self.scale
    _range           = (_posture == Tic.POSTUREKNEEL) and Nums:roundmax(_range / 2) or _range

    circb(_screenx, _screeny, _range, _drawcolor)
    circb(_screenx + 1, _screeny, _range, _drawcolor)
    for _, _direction in pairs(Tables:keys(Tic.DIRSOFFSETS)) do
        local _offsets  = Tic.DIRSOFFSETS[_direction]
        local _oscreenx = _offsets.screenx or 0
        local _oscreeny = _offsets.screeny or 0
        local _ooffsetx = Nums:roundmax(_offsets.offsetx * _range / Tic.OFFSETLINE)
        local _ooffsety = Nums:roundmax(_offsets.offsety * _range / Tic.OFFSETLINE)

        line(
            _screenx + _oscreenx,
            _screeny + _oscreeny,
            _screenx + _oscreenx + _ooffsetx,
            _screeny + _oscreeny + _ooffsety,
            Tic.COLORRED --_drawcolor
        )
        if not _offsets.screenx then -- double line
            line(
                _screenx + 1,
                _screeny + _oscreeny,
                _screenx + 1 + _ooffsetx,
                _screeny + _oscreeny + _ooffsety,
                Tic.COLORRED --_drawcolor
            )
        end
        if not _offsets.screeny then -- double line
            line(
                _screenx + _oscreenx,
                _screeny + 1,
                _screenx + _oscreenx + _ooffsetx,
                _screeny + 1 + _ooffsety,
                Tic.COLORRED --_drawcolor
            )
        end
    end
end

function CCharacter:drawView() -- draw the view of a character
    self:drawViewMindMove(Tic.DRAWVIEW, Tic.COLORGREENL, self:regionViewScreen())
end

function CCharacter:drawMind() -- draw the mind of a character
    self:drawViewMindMove(Tic.DRAWMIND, Tic.COLORGREENM, self:regionMindScreen())
end

function CCharacter:drawMove() -- draw the move of a character
    self:drawViewMindMove(Tic.DRAWMOVE, Tic.COLORGREEND, self:regionMoveScreen())
end

function CCharacter:drawViewMindMove(_ticdrawmode, _drawcolor, _regionscreen) -- draw a specific region around player
    if self.portraitmode then return end -- not in portrait mode
    if not _ticdrawmode  then return end -- nothing to draw
    if Tic.PLAYERONLY and not (self == Tic:playerActual()) then return end -- only actual player

    local _regionscreenlf  = _regionscreen.lf
    local _regionscreenrg  = _regionscreen.rg
    local _regionscreenup  = _regionscreen.up
    local _regionscreendw  = _regionscreen.dw

    rectb(_regionscreenlf, _regionscreenup, _regionscreenrg - _regionscreenlf, _regionscreendw - _regionscreenup, _drawcolor)
end

function CCharacter:drawEffect()
    local _status         = self:statusGet()
    local _statussettings = Tic.STATUSSETTINGS[_status]
    local _frequence      = Tic.STATESETTINGS[self.state].frequence
    local _effectsprite   = _statussettings.effectsprite -- effect sprite
    local _tick00         = Tic.TICK00.actvalue
    local _palette        = (Nums:frequence01(_tick00, _frequence) == 0)
        and _statussettings.palette0
        or  _statussettings.palette1

    local _musprite = CSpriteFG() -- multi usage sprite
    _musprite.sprite  = _effectsprite
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.palette = _palette
    _musprite:draw()
end

function CCharacter:isParty()
    return (self.party)
end

function CCharacter:drawParty()
    if not self:isParty() then return end -- not a party

    local _posture = self:postureGet()
    local _offsety = 3
    if _posture == Tic.POSTUREFLOOR then
        _offsety = _offsety + 3
    else
        _offsety = _offsety + self.size + self.frame
    end

    local _coloreyesfg = Tic.COLORSKIN
    local _coloreyesbu = Tic.COLORSKIN
    local _coloreyesbm = Tic.COLORSKIN
    local _coloreyesbd = Tic.COLORSKIN

    if _posture == Tic.POSTUREFLOOR then
        _coloreyesbm = self.coloreyesbg
    else
        _coloreyesfg = self.coloreyesfg
        if self.diry == Tic.DIRYUP then -- up
            _coloreyesbu = self.coloreyesbg
        elseif self.diry == Tic.DIRYMD then -- md
            _coloreyesbm = self.coloreyesbg
        else -- dw
            _coloreyesbd = self.coloreyesbg
        end
    end
   
    local _musprite = CSpriteFG() -- multi usage sprite
    _musprite.sprite  = CSpriteFG.EFFECTPARTY
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.offsety = _offsety
    _musprite.flip    = self.dirx
    _musprite.scale   = self.scale
    _musprite.palette = {
        -- [Tic.COLORGREYM]  = self.colorhairsbg,
        [Tic.COLORPURPLE] = _coloreyesbu,
        [Tic.COLORRED]    = _coloreyesbm,
        [Tic.COLORORANGE] = _coloreyesbd,
        [Tic.COLORYELLOW] = _coloreyesfg,
    }
    _musprite:draw()
end

function CCharacter:drawHandle(_screenx, _screeny, _color) -- for debug
    if false then
    rect(
        self.screenx + (_screenx * self.scale),
        self.screeny + (_screeny * self.scale),
        self.scale,
        self.scale,
        _color
    )
    end
end

function CCharacter:drawHandBG()
    self:drawHand(Tic.DRAWBG)
end

function CCharacter:drawHandFG()
    self:drawHand(Tic.DRAWFG)
end

function CCharacter:drawHand(_bgfg)
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding hand offsets
    local _handx = nil
    local _handy = nil
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXLF then
        _handx = _handlesoffsets.handrgx
        _handy = _handlesoffsets.handrgy
    end
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXRG then
        _handx = _handlesoffsets.handlfx
        _handy = _handlesoffsets.handlfy
    end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXLF then
        _handx = _handlesoffsets.handlfx
        _handy = _handlesoffsets.handlfy
    end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXRG then
        _handx = _handlesoffsets.handrgx
        _handy = _handlesoffsets.handrgy
    end
    self:drawHandle(_handlesoffsets.handrgx, _handlesoffsets.handrgy, Tic.COLORGREENL)
    self:drawHandle(_handlesoffsets.handlfx, _handlesoffsets.handlfy, Tic.COLORGREENM)

    local _object = nil  -- determine the corresponding object if any
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXLF then _object = self.slots.handrg.object end
    if _bgfg == Tic.DRAWBG and self.dirx == Tic.DIRXRG then _object = self.slots.handlf.object end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXLF then _object = self.slots.handlf.object end
    if _bgfg == Tic.DRAWFG and self.dirx == Tic.DIRXRG then _object = self.slots.handrg.object end
    if not _object then return end -- nothing in hand

    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _handx   = _handx - _objecthandlex -- adjust handles
    local _handy   = _handy - _objecthandley

    _object:save()
    Tic.LOGSPRITE = false
    _object.screenx  = self.screenx
    _object.screeny  = self.screeny
    _object.offsetx  = _handx * self.scale
    _object.offsety  = _handy * self.scale
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object.drawbgfg = _bgfg
    _object:draw()
    Tic.LOGSPRITE = false
    _object:load()
end

function CCharacter:drawBackBG()
    self:drawBack(Tic.DRAWBG)
end

function CCharacter:drawBackFG()
    self:drawBack(Tic.DRAWFG)
end

function CCharacter:drawBack(_bgfg)
    if not self.slots then return end -- mandatory
    local _handlesoffsets = self:handlesOffsets() -- determine the corresponding back offsets
    local _backx  = _handlesoffsets.backx
    local _backy  = _handlesoffsets.backy
    self:drawHandle(_backx, _backy, Tic.COLORYELLOW)

    local _object = self:slotGetBackObject()
    if not _object then return end -- nothing in back

    if self:postureGet() == Tic.POSTUREFLOOR then
        if _bgfg == Tic.DRAWFG then return end -- always draw in bg
    else
        if self.dirx == Tic.DIRXLF and _bgfg == Tic.DRAWFG then return end -- draw bg/fg or not when not floor
        if self.dirx == Tic.DIRXRG and _bgfg == Tic.DRAWBG then return end
    end

    local _handleoffsets = _object:handleOffsets(_handlesoffsets.state) -- determine the object handle offsets
    local _objecthandlex = _handleoffsets.handlex
    local _objecthandley = _handleoffsets.handley
    local _objectrotate  = _handleoffsets.rotate
    local _objectflip    = _handleoffsets.flip

    local _backx   = _backx - _objecthandlex -- adjust handles
    local _backy   = _backy - _objecthandley

    _object:save()
    _object.screenx  = self.screenx
    _object.screeny  = self.screeny
    _object.offsetx  = _backx * self.scale
    _object.offsety  = _backy * self.scale
    _object.scale    = self.scale
    _object.rotate   = _objectrotate
    _object.dirx     = _objectflip
    _object:draw()
    _object:load()
end

function CCharacter:handlesOffsets()
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    local _result  = {}
    if self.handlesoffsets[_status] then
        _result = Tables:merge(_result, self.handlesoffsets[_status][self.dirx][self.frame])
    else
        _result = Tables:merge(_result, self.handlesoffsets[_posture][self.dirx][self.size])
    end

    if not (_posture == Tic.POSTUREFLOOR) then
        _result.heady = _result.heady + self.size
        _result.backy = _result.backy + self.size
    end
    if _posture == Tic.POSTUREKNEEL then
        _result.handrgy = _result.handrgy + 1
        _result.handlfy = _result.handlfy + 1
        _result.heady   = _result.heady   + 1
        _result.backy   = _result.backy   + 1
    end

    return _result
end

function CCharacter:drawInteractTo()
    if not self:hasInteractTo() then return end -- dont draw
    self:drawInteractToBy(true)
end

function CCharacter:drawInteractBy()
    if not self:hasInteractBy() then return end -- dont draw
    self:drawInteractToBy(false)
end

function CCharacter:drawInteractToBy(_toby) -- true = to, false = by -- FIXME use constants ?
    local _posture         = self:postureGet()
    local _posturesettings = Tic.POSTURESETTINGS[_posture]
    local _headoffsetx     = _posturesettings.headoffsetx
    _headoffsetx           = (self.dirx == Tic.DIRXLF)
        and _headoffsetx - 3
        or  _headoffsetx + 3
    _headoffsetx           = (_toby)
        and _headoffsetx
        or  0 - _headoffsetx
    local _headoffsety     = _posturesettings.headoffsety - Tic.SPRITESIZE + 2
    _headoffsety           = (_posturesettings.headusesize)
        and _headoffsety + self.size
        or  _headoffsety

    local _musprite = CSpriteFG() -- multi usage sprite
    _musprite.sprite  = CSpriteFG.EFFECTINTMK -- apply the corresponding attributes
    _musprite.screenx = self.screenx
    _musprite.screeny = self.screeny
    _musprite.offsetx = _headoffsetx * self.scale
    _musprite.offsety = _headoffsety * self.scale
    _musprite.scale   = self.scale
    _musprite.flip    = (_toby)
        and self.dirx
        or  Nums:toggle01(self.dirx)
    _musprite.palette = (_toby)
        and {[Tic.COLORGREYD] = Tic.COLORKEY}
        or  {[Tic.COLORGREYD] = Tic.COLORKEY, [Tic.COLORWHITE] = Tic.COLORGREYL}
    _musprite:draw()
end

function CCharacter:canInteract()
    -- if not (self == Tic:playerActual()) then return false end -- cannot interact
    if self:postureGet() == Tic.POSTUREFLOOR then return false end -- cannot interact
    if not self:hasInteractTo() then return false end -- cannot interact
    local _interactto   = self.interactto
    local _interactions = _interactto.interactions
    -- if Tables:size(_interactions) == 0 then return false end -- cannot interact
    for _, _interaction in ipairs(_interactions) do
        if _interaction.interactiflf and _interaction:interactiflf(self, _interactto) then return true end
        if _interaction.interactifrg and _interaction:interactifrg(self, _interactto) then return true end
    end
    return false
end

function CCharacter:adjustInteract()
    local _entityspotting = self:entitySpotting()
    self:interacttoDelete()
    if  _entityspotting
    -- and not (_entityspotting == Tic.playerActual())
    and _entityspotting:hasInteractions()
    and self:regionWorld():directionRegion(_entityspotting:regionWorld()) == Tic.DIRHIT
    then
        self:interacttoAppend(_entityspotting)
    -- else
    --     self:interacttoDelete()
    end
end

function CCharacter:doSayMessage(_argt)
    local _message = _argt.message or "Hello"
    Tic:messageAppend(self.name.." "..Tic.TEXTSAY..": '".._message.." "..self.interactto.name.."'")
end

function CCharacter:ifPickObject(_argt)
    local _object = self.interactto
    if not _object then return false end
    return (_object:findFreeInventory(self.inventories)) 
end

function CCharacter:doPickObject(_argt)
    local _object = self.interactto
    if not _object then return end
    return self:pickObject(_object, true)
end

function CCharacter:statePrev() -- prev state in the stack
    self.state = Tic.STATES:prev()
end

function CCharacter:stateNext() -- next state in the stack
    self.state = Tic.STATES:next()
end

function CCharacter:toggleWork() -- toggle idle/move vs work
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle work
    if _posture == Tic.POSTUREFLOOR then -- sleep to stand + work
        _posture = Tic.POSTURESTAND
        _status  = Tic.STATUSWORK
    elseif _status == Tic.STATUSIDLE then -- idle to work
        _status  = Tic.STATUSWORK
    else -- work to idle
        _status  = Tic.STATUSIDLE
    end
	self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleKneel() -- toggle stand vs kneel
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle sleep
    if _posture == Tic.POSTURESTAND then -- stand to kneel
        _posture = Tic.POSTUREKNEEL
    elseif _posture == Tic.POSTUREKNEEL then -- kneel to stad
        _posture = Tic.POSTURESTAND
    else -- sleep to kneel
        _posture = Tic.POSTUREKNEEL
        _status = Tic.STATUSIDLE
    end
	self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleSleep() -- toggle stand vs sleep
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then return end -- cannot toggle sleep
    if _posture == Tic.POSTUREFLOOR then -- sleep to stand
        _posture = Tic.POSTURESTAND
        _status  = Tic.STATUSIDLE
    else -- stand/kneel to sleep
        _posture = Tic.POSTUREFLOOR
        _status  = Tic.STATUSSLEEP
    end
    self:stateSet(_posture, _status)
    self:hitboxRefresh() -- refresh the hitboxes
end

function CCharacter:toggleFrame() -- toggle frame 0-1
    self.frame = Nums:toggle01(self.frame) -- animate continuous move in the same dirx
end

function CCharacter:spottingToggleSpot()
	self.spottingspot = Nums:toggleTF(self.spottingspot)
end

function CCharacter:spottingToggleLock()
	self.spottinglock = Nums:toggleTF(self.spottinglock)
end

function CCharacter:spottingTogglePick()
	self.spottingpick = Nums:toggleTF(self.spottingpick)
end

function CCharacter:isSpottingSpot()
	return self.spottingspot
end

function CCharacter:isSpottingLock()
	return self.spottinglock
end

function CCharacter:isSpottingPick()
	return self.spottingpick
end

function CCharacter:entitySpotting()
	return self.spotting
end

function CCharacter:entityHovering()
	return self.hovering
end

function CCharacter:moveWorldXY(_worldx, _worldy) -- move character into world
    if not _worldx or not _worldy then return end -- mandatory
    self.world:moveEntityWorldXY(self, _worldx, _worldy)
end

function CCharacter:offsetsDirection(_direction, _movenone,  _moveslow, _moveback) -- return offsets corresponding to direction, posture etc
    if not _direction then return end -- mandatory
    _movenone = _movenone or false -- force none move if any
    _moveslow = _moveslow or false -- force slow move if any
    _moveback = _moveback or false -- force back move if any
    local _posture = self:postureGet()
    local _offsets = Tic.DIRSOFFSETS[_direction]

    local _result = {
        offsetx = _offsets.offsetx,
        offsety = _offsets.offsety,
        screenx = _offsets.screenx,
        screeny = _offsets.screeny,
        dirx    = _offsets.dirx or self.dirx,
        diry    = _offsets.diry or self.diry,
    }

    if _movenone then -- none move
        _result.offsetx = 0
        _result.offsety = 0
    elseif _moveslow then -- slow move -1, 0, +1
        _result.offsetx = Nums:sign(_result.offsetx)
        _result.offsety = Nums:sign(_result.offsety)
    else -- normal move
        _result.offsetx = _result.offsetx * (self.statphyact / Tic.STATSMAX) -- depends of phy act
        _result.offsety = _result.offsety * (self.statphyact / Tic.STATSMAX)
        _result.offsetx = (_posture == Tic.POSTURESTAND) and _result.offsetx or _result.offsetx / 2 -- half if not stand
        _result.offsety = (_posture == Tic.POSTURESTAND) and _result.offsety or _result.offsety / 2 -- half if not stand
        _result.offsetx = Nums:roundmax(_result.offsetx) -- ensure solid values
        _result.offsety = Nums:roundmax(_result.offsety)
    end

    if _moveback then -- back move
        _result.offsetx = Nums:invert(_result.offsetx)
        _result.offsety = Nums:invert(_result.offsety)
    end

    return _result
end

function CCharacter:moveDirection(_direction, _movenone,  _moveslow, _moveback) -- handle moving a character in a direction
    _direction = _direction or self.direction
    _movenone  = _movenone or false -- force none move if any
    _moveslow  = _moveslow or false -- force slow move if any
    _moveback  = _moveback or false -- force back move if any
    local _posture = self:postureGet()
    local _status  = self:statusGet()
    local _offsets = self:offsetsDirection(_direction, _movenone,  _moveslow, _moveback)
    local _olddirx = self.dirx -- save actual character dirx

    if _posture == Tic.POSTUREFLOOR and not (_status == Tic.STATUSSLEEP) then -- cannot move -- nor change dir
        return
    end

    if _posture == Tic.POSTUREFLOOR and _status == Tic.STATUSSLEEP then -- sleep to stand
        return self:stateSet(Tic.POSTURESTAND, Tic.STATUSIDLE)
    end

    self.dirx      = _offsets.dirx -- adjust dirx, diry and direction
    self.diry      = _offsets.diry
    self.direction = _direction

    if _movenone then -- none move
        return
    end

    if _status == Tic.STATUSWORK then -- interrupt work and goes to idle
        return self:stateSet(_posture, Tic.STATUSIDLE)
    end

    if _status == Tic.STATUSIDLE and not (self.dirx == _olddirx) then -- simply change dirx
        return
    end

    if _status == Tic.STATUSMOVE and not (self.dirx == _olddirx) then -- change dirx and goes to idle
        return self:stateSet(_posture, Tic.STATUSIDLE)
    end

    self:stateSet(_posture, Tic.STATUSMOVE)
    self:toggleFrame() -- animate continuous move in the same dirx

    local _characterhitbox   = self:hitboxRegionWorld() -- collisions system
    local _entitiesmoveworld = self:entitiesMoveWorld(_direction, _movenone,  _moveslow, _moveback)
    local _entitieshitboxes  = {}
    for _entity, _ in pairs(_entitiesmoveworld or {}) do -- record the possible hitboxes
        if not (_entity == self) and _entity.hitbox then -- only with hitbox -- except itself
            Tables:keyAppend(_entitieshitboxes, _entity, _entity:hitboxRegionWorld())
        end
    end

    self:hitboxDetachAll()
    local _movebyx          = Nums:sign(_offsets.offsetx) -- calculate the maximum move step by step
    local _movebyy          = Nums:sign(_offsets.offsety)
    local _movetox          = 0
    local _movetoy          = 0
    local _move             = true
    local _entitiescollided = {}
    while _move do
        if _characterhitbox then -- only consider collisions if charater has an hitbox
            _characterhitbox = _characterhitbox:offsetXY(_movebyx, _movebyy) -- compute the future position
            for _entity, _entityhitbox in pairs(_entitieshitboxes) do
                if _characterhitbox:hasInsideRegion(_entityhitbox) then -- collision
                    Tables:keyAppend(_entitiescollided, _entity, _entity)
                end
            end
        end

        if Tables:size(_entitiescollided) > 0 then
            self:hitboxAttachTo(_entitiescollided)
            _move = false
        else
            if Nums:pos(_movetox) < Nums:pos(_offsets.offsetx) then _movetox = _movetox + _movebyx end
            if Nums:pos(_movetoy) < Nums:pos(_offsets.offsety) then _movetoy = _movetoy + _movebyy end
            if _movetox == _offsets.offsetx and _movetoy == _offsets.offsety then
                _move = false
            end
        end
    end
    self:moveWorldXY(self.worldx + _movetox, self.worldy + _movetoy)

    self.movecycler:min() -- reset the move cycler
end

function CCharacter:hitboxRefresh() -- refresh the attached hitboxes
    -- local _hitboxregion    = self:regionMoveOffsets() -- hitbox collisions -- FIXME use another region (move)
    -- local _hitboxlocations = self:locationsRegion(_hitboxregion)
    -- local _hitboxentities  = CLocations:entities(_hitboxlocations)
    -- self:hitboxDetachAll()
    -- self:hitboxAttachTo(_hitboxentities)
    -- self:hitboxDetachSelf() -- not itself
end

function CCharacter:statAct(_action, _stat, _value) -- modify a stat act -- set/dec/inc/max
    if not _action or not _stat then return end -- mandatory
    if not self[_stat] then return end -- unknown stat
    _value = _value or 0

    if _action == Tic.STATSET then
        self[_stat] = _value
    elseif _action == Tic.STATDEC then
        self[_stat] = self[_stat] - _value
    elseif _action == Tic.STATINC then
        self[_stat] = self[_stat] + _value
    elseif _action == Tic.STATMAX then
        self[_stat] = self[string.gsub(_stat, "act", "max")]
    end

    self[_stat] = math.max(self[_stat], Tic.STATSMIN) -- stay in range
    self[_stat] = math.min(self[_stat], Tic.STATSMAX)
    self[_stat] = Nums:roundint(self[_stat]) -- ensure an integer

    self:hitboxRefresh() -- refresh the hitboxes
end
